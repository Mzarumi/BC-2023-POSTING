page 52185591 "HR E-Mail Parameters Card"
{
    PageType = Card;
    SourceTable = "HR E-Mail Parameters";

    layout
    {
        area(content)
        {
            group(General)
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
                field("Template Path"; Rec."Template Path")
                {
                }
                field("Payslip Message"; Rec."Payslip Message")
                {
                }
                field("ICT mail"; Rec."ICT mail")
                {
                }
                field("HR Email"; Rec."HR Email")
                {
                }
            }
        }
    }

    actions
    {
    }
}

