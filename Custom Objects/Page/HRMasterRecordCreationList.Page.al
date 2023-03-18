page 52186531 "HR Master Record Creation List"
{
    CardPageID = "HR Master Record Creation Card";
    Editable = false;
    PageType = List;
    SourceTable = "Master Record Creation Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Requestor ID"; Rec."Requestor ID")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Dimension 1"; Rec."Dimension 1")
                {
                }
                field("Dimension 2"; Rec."Dimension 2")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; MyNotes)
            {
            }
            systempart(Control12; Links)
            {
            }
        }
    }

    actions
    {
    }
}

