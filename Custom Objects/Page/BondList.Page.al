page 52185684 "Bond List"
{
    CardPageID = "Bond Card";
    Editable = false;
    PageType = List;
    SourceTable = Bond;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bond No."; Rec."Bond No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Bond Type"; Rec."Bond Type")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

