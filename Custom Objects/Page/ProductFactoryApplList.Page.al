page 52186406 "Product Factory Appl. List"
{
    CardPageID = "Product Factory Appl. Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Product Factory Application";

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
                field("Product ID"; Rec."Product ID")
                {
                }
                field("Product Description"; Rec."Product Description")
                {
                }
                field("Product Class Type"; Rec."Product Class Type")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Notes)
            {
            }
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

