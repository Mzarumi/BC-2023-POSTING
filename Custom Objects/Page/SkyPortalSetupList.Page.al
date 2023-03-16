page 52186680 "Sky Portal Setup List"
{
    CardPageID = "Sky Portal Setup Card";
    Editable = false;
    PageType = List;
    SourceTable = "Sky Portal Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

