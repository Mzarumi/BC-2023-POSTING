page 52186160 "Tender Plan List"
{
    CardPageID = "Work Plan Card";
    Editable = true;
    PageType = List;
    SourceTable = "Tender Plan Header";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field("Workplan Code"; Rec."Workplan Code")
                {
                }
                field("Workplan Description"; Rec."Workplan Description")
                {
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
            }
        }
    }

    actions
    {
    }
}

