page 52186655 "Standing Order Control List"
{
    CardPageID = "Standing Order Control Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Standing Order Control";
    SourceTableView = WHERE(Status = FILTER(Open | Pending));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Standing Order No"; Rec."Standing Order No")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
    }
}

