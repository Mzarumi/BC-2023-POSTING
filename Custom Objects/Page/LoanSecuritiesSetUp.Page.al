page 52186414 "Loan Securities Set-Up"
{
    CardPageID = "Loan Securites Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Loan Securities Set-up";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Security Description"; Rec."Security Description")
                {
                }
            }
        }
    }

    actions
    {
    }
}

