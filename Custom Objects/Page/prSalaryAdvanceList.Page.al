page 52185675 "prSalary Advance List"
{
    CardPageID = "prSalary Advance";
    Editable = false;
    PageType = List;
    SourceTable = "prSalary Advance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Loan Description"; Rec."Loan Description")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Advance Amount Requested"; Rec."Advance Amount Requested")
                {
                }
            }
        }
    }

    actions
    {
    }
}

