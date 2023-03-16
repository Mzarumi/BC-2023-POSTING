page 52185454 "Member Onboarding List"
{
    CardPageID = "Member Onboarding";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "On Board Members";
    SourceTableView = WHERE(Created = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
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
            action("On Board All Members")
            {
                Image = CreditCard;
                Promoted = true;

                trigger OnAction()
                begin
                    //SkyHarambeePortal.OnBoardMembers;
                    Message('Done');
                end;
            }
        }
    }

    var
    //SkyHarambeePortal: Codeunit "Sky Harambee Portal";
}

