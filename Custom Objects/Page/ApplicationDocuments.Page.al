page 52186065 "Application Documents"
{
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Application Documents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Provided; Rec.Provided)
                {
                }
                field("Last Modified By"; Rec."Last Modified By")
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                }
            }
        }
    }

    actions
    {
    }
}

