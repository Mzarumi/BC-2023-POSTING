page 52186380 "E-Mail Notification"
{
    PageType = List;
    SourceTable = "E-Mail Notification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Path To Save Report"; Rec."Path To Save Report")
                {
                }
                field("Sender Name"; Rec."Sender Name")
                {
                }
                field("Sender E-Mail"; Rec."Sender E-Mail")
                {
                }
                field("Send To CC"; Rec."Send To CC")
                {
                }
                field("Send To BCC"; Rec."Send To BCC")
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

