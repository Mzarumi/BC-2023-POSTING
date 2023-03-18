page 52185544 "HR E-Mail Parameters List"
{
    CardPageID = "HR E-Mail Parameters Card";
    PageType = List;
    SourceTable = "HR E-Mail Parameters";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Associate With"; Rec."Associate With")
                {
                }
                field("Sender Name"; Rec."Sender Name")
                {
                }
                field("Sender Address"; Rec."Sender Address")
                {
                }
                field(Recipients; Rec.Recipients)
                {
                }
                field(Subject; Rec.Subject)
                {
                }
                field(Body; Rec.Body)
                {
                }
                field(Active; Rec.Active)
                {
                }
            }
        }
    }

    actions
    {
    }
}

