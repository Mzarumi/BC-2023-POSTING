page 52185907 "Procurement Type"
{
    PageType = List;
    SourceTable = "Procurement Limit Code";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;
                field("Procurement Code"; Rec."Procurement Code")
                {
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                }
                field("Procurement Amount Type"; Rec."Procurement Amount Type")
                {
                }
                field("Min. Amount"; Rec."Min. Amount")
                {
                }
                field("Max Amount"; Rec."Max Amount")
                {
                }
                field("Fixed Amount"; Rec."Fixed Amount")
                {
                }
            }
        }
    }

    actions
    {
    }
}

