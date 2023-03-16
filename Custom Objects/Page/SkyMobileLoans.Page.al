page 52185443 "Sky Mobile Loans"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Sky Mobile Loans";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field(DocumentNo; Rec.DocumentNo)
                {
                }
                field("Expected Guarantors"; Rec."Expected Guarantors")
                {
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Loan Period"; Rec."Loan Period")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Session ID"; Rec."Session ID")
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                }
                field("Time Entered"; Rec."Time Entered")
                {
                }
                field("Telephone No"; Rec."Telephone No")
                {
                }
                field("Message Text"; Rec."Message Text")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field(Deactivated; Rec.Deactivated)
                {
                }
                field("Deactivated By"; Rec."Deactivated By")
                {
                }
                field("Date Deactivated"; Rec."Date Deactivated")
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field(Branch; Rec.Branch)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Activate/Deactivate Application")
            {

                trigger OnAction()
                begin

                    Rec.TestField(Posted, false);
                    if Rec.Deactivated then begin
                        if Confirm('Are you sure you want to deactivate this application') then begin
                            Rec.Deactivated := false;
                            Rec."Deactivated By" := UserId;
                            Rec."Date Deactivated" := Today;
                            Rec.Modify;
                        end;
                    end
                    else begin
                        if Confirm('Are you sure you want to activate this application') then begin
                            Rec.Deactivated := true;
                            Rec."Deactivated By" := UserId;
                            Rec."Date Deactivated" := Today;
                            Rec.Modify;
                        end;
                    end;
                end;
            }
            action("Credit Account Unblocked")
            {

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want unflag this account') then begin
                        Rec.Blocked := false;
                        Rec.Modify;
                    end;
                end;
            }
            action("Loan Guarantors")
            {
                Image = ElectronicDoc;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Mobile Loan Guarantors";
                RunPageLink = "Loan Entry No." = FIELD("Entry No");
            }
            action("Return To Appraisal")
            {
                Image = Return;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SkyPermissions: Record "Sky Permissions";
                begin
                    SkyPermissions.Reset;
                    SkyPermissions.SetRange("User ID", UserId);
                    SkyPermissions.SetRange("Return Loans to Appraisal", true);
                    if not SkyPermissions.FindFirst then
                        Error('You do not have permission to perform this action!');

                    Rec.TestField(Status, Rec.Status::Failed);
                    Rec.TestField(Posted, false);
                    if (Rec."Loan Product Type" = '111') or
                        (Rec."Loan Product Type" = '112') or
                        (Rec."Loan Product Type" = '113') or
                        (Rec."Loan Product Type" = '115') or
                        (Rec."Loan Product Type" = '140') or
                        (Rec."Loan Product Type" = '124') or
                        (Rec."Loan Product Type" = '143')

                    then begin
                        if Confirm('Are you sure you want to return this loan to appraissal?') then begin
                            Rec.Status := Rec.Status::Appraisal;
                            Rec.Modify;
                            Message('Update Complete');
                        end else
                            Message('Operation Aborted!');
                    end else
                        Error('You cannot edit this loan type');
                end;
            }
        }
    }
}

