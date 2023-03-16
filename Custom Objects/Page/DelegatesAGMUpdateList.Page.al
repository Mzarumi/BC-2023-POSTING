page 52186393 "Delegates AGM Update List"
{
    //CardPageID = "Deleage AGM Update Header";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Delegate AGM Update Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("AGM Year"; Rec."AGM Year")
                {
                }
                field("Update Type"; Rec."Update Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

