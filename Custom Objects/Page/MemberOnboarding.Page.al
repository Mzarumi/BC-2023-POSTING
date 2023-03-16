page 52185466 "Member Onboarding"
{
    PageType = Card;
    SourceTable = "On Board Members";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Phone Number"; Rec."Phone Number")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
                field("Username Login Type"; Rec."Username Login Type")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Created At"; Rec."Created At")
                {
                }
                field(Created; Rec.Created)
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("On Board Member")
            {
                Image = CreateMovement;
                Promoted = true;

                trigger OnAction()
                begin
                    Rec.TestField("Account No");
                    if Rec."Username Login Type" = Rec."Username Login Type"::Phone then
                        Rec.TestField("Phone Number")
                    else
                        Rec.TestField("E-Mail");

                    if SavingsAccounts.Get(Rec."Account No") then begin

                        Members.Get(SavingsAccounts."Member No.");

                        if Members.Status <> Members.Status::Active then Error('The member must be active');
                        SkyUSSDAuth.Reset;
                        SkyUSSDAuth.SetRange("Account No.", Rec."Account No");
                        SkyUSSDAuth.SetRange(Password, '');
                        if SkyUSSDAuth.FindFirst then
                            ActivityType := ActivityType::Fresh
                        else
                            ActivityType := ActivityType::Refresh;
                        //SkyHarambeePortal.AddMemberToPortal(Rec."E-Mail", Rec."Phone Number", SavingsAccounts."Member No.", "Username Login Type", ActivityType);
                        Commit;

                        SkyUSSDAuth.Reset;
                        SkyUSSDAuth.SetRange("Account No.", Rec."Account No");
                        if SkyUSSDAuth.FindFirst then begin
                            if SkyUSSDAuth.Password <> '' then begin
                                //password has been sent
                                Message('Member Onboarded and Password Sent Successfully');
                                Rec.Created := true;
                                Rec.Modify;
                            end else begin
                                Message('Internal Error');
                            end;
                        end;

                    end;
                end;
            }
        }
    }

    trigger OnInit()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        UserSetup.SetRange("Portal Onboarding", true);
        if not UserSetup.FindFirst then Error('You do not have permission to view this page');
    end;

    var
        //SkyHarambeePortal: Codeunit "Sky Harambee Portal";
        SavingsAccounts: Record "Savings Accounts";
        SkyUSSDAuth: Record "Sky USSD Auth";
        Members: Record Members;
        UserSetup: Record "User Setup";
        ActivityType: Option Fresh,Refresh;
}

