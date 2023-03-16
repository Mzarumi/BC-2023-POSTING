page 52186242 "Property Expense List"
{
    PageType = List;
    SourceTable = "Property Expense List";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Expense Code"; Rec."Expense Code")
                {
                }
                field("Expense Description"; Rec."Expense Description")
                {
                }
            }
        }
    }

    actions
    {
    }
}

