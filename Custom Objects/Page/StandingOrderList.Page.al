page 52185745 "Standing Order List"
{
    CardPageID = "Standing Order";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Standing Order Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Source Account No."; Rec."Source Account No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Source Account Name"; Rec."Source Account Name")
                {
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                }
                field("Income Type"; Rec."Income Type")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
            {
            }
            systempart(Control13; MyNotes)
            {
            }
            systempart(Control14; Links)
            {
            }
        }
    }

    actions
    {
    }
}

