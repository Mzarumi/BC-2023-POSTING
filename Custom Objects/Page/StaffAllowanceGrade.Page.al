page 52186274 "Staff Allowance Grade"
{
    PageType = List;
    SourceTable = "Staff Allowance Grades";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Grade Description"; Rec."Grade Description")
                {
                }
                field("Grade Code"; Rec."Grade Code")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Allowance Setup")
            {
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Staff Allowance Lines";
                RunPageLink = "Header Code" = FIELD("Grade Code");
            }
            action("Allowance Grade Members")
            {
                Image = Accounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Staff Member List";
                RunPageLink = "Allowance Grade" = FIELD("Grade Code");
            }
        }
    }

    trigger OnOpenPage()
    begin
        UserSetup.GetDefaultSalesAmountApprovalLimit();
    end;

    var
        UserSetup: Record "User Setup";
}

