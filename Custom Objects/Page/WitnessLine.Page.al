page 52186081 "Witness Line"
{
    CardPageID = "Witness Card";
    PageType = List;
    SourceTable = Witnesses;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case No"; Rec."Case No")
                {
                    Editable = false;
                }
                field("Witness Type"; Rec."Witness Type")
                {
                }
                field("Witness No"; Rec."Witness No")
                {
                }
                field(Name; Rec.Name)
                {
                }
            }
        }
    }

    actions
    {
    }
}

