page 52186027 "Contract Documents"
{
    PageType = List;
    SourceTable = "Contract Documents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("File Location"; Rec."File Location")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Line Type")
            {
                RunObject = Page "Contract Lines Type";
                RunPageLink = "Contract Line Code" = FIELD("Document Type");
            }
        }
    }
}

