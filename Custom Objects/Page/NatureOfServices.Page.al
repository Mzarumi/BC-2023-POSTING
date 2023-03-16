page 52186026 "Nature Of Services"
{
    PageType = List;
    SourceTable = "Nature Of Sevices";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Service Code"; Rec."Service Code")
                {
                }
                field("Service Name"; Rec."Service Name")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Contract Lines")
            {
                RunObject = Page "Contract Documents";
                //RunPageLink = Field4 = FIELD("Service Code");
            }
        }
    }
}

