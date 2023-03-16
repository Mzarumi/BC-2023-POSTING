page 52186379 "Salary Agreement List"
{
    CardPageID = "Salary Agreement Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Salary Agreement";
    SourceTableView = WHERE(Status = FILTER(<> Approved & <> Rejected));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("ID No"; Rec."ID No")
                {
                }
                field("Payroll No"; Rec."Payroll No")
                {
                }
                field(Department; Rec.Department)
                {
                }
                field(Ministry; Rec.Ministry)
                {
                }
                field(Telephone; Rec.Telephone)
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Region; Rec.Region)
                {
                }
                field("Fosa Account No"; Rec."Fosa Account No")
                {
                }
                field("With Effect From"; Rec."With Effect From")
                {
                }
                field(Category; Rec.Category)
                {
                }
                field("Date Captured"; Rec."Date Captured")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field(User; Rec.User)
                {
                }
                field("Recruited By Name"; Rec."Recruited By Name")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID", Rec.User);
        if UserSetup.FindFirst then
            BranchCode := UserSetup."Global Dimension 2 Code";
    end;

    var
        BranchCode: Code[30];
        UserSetup: Record "User Setup";
}

