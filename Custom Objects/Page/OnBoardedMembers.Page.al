page 52185455 "On Boarded Members"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "On Board Members";
    SourceTableView = WHERE(Created = CONST(true));

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
    }

    trigger OnInit()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        UserSetup.SetRange("Portal Onboarding", true);
        if not UserSetup.FindFirst then Error('You do not have permission to view this page');
    end;

    var
        UserSetup: Record "User Setup";
}

