page 52186401 "Member Documents"
{
    PageType = List;
    SourceTable = "Member Documents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Single Party/Multiple"; Rec."Single Party/Multiple")
                {
                }
                field("Reference No."; Rec."Reference No.")
                {
                }
                field("Product ID"; Rec."Product ID")
                {
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field(Provided; Rec.Provided)
                {
                }
            }
        }
    }

    actions
    {
    }
}

