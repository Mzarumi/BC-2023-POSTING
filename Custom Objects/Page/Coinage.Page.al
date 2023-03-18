page 52185801 Coinage
{
    Editable = true;
    PageType = ListPart;
    SourceTable = Coinage;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field(No; Rec.No)
                {
                    Editable = false;
                    Enabled = false;
                }
                field("Code"; Rec.Code)
                {
                    Editable = true;
                    Enabled = true;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    Enabled = true;
                }
                field(Type; Rec.Type)
                {
                    Enabled = false;
                }
                field(Value; Rec.Value)
                {
                    Enabled = false;
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    Enabled = false;
                }
            }
        }
    }

    actions
    {
    }
}

