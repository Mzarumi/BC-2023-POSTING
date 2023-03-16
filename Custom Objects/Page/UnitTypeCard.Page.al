page 52186189 "Unit Type Card"
{
    PageType = Card;
    SourceTable = "Unit Type";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Sub Types"; Rec."Sub Types")
                {
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        UST.Reset;
                        UST.SetFilter(UST."Unit Type", Rec.Code);
                        PAGE.Run(52185433, UST);
                    end;
                }
            }
        }
    }

    actions
    {
    }

    var
        UST: Record "Unit Sub Type";
}

