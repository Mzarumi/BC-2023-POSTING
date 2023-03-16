page 52186240 "Nairobi Water Bill List"
{
    CardPageID = "Nairobi water Bill";
    Editable = false;
    PageType = List;
    SourceTable = "Nairobi Water Bill";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Property No."; Rec."Property No.")
                {
                }
                field("L/R No."; Rec."L/R No.")
                {
                }
                field("Meter Reading Date"; Rec."Meter Reading Date")
                {
                }
                field("Previous Reading"; Rec."Previous Reading")
                {
                }
                field("Current[Present] reading"; Rec."Current[Present] reading")
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
                field("Billing date"; Rec."Billing date")
                {
                }
                field("No."; Rec."No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

