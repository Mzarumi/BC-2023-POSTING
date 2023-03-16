page 52185946 "Responsibility Center ListBR"
{
    Caption = 'Responsibility Center List';
    CardPageID = "Responsibility Center CardBR";
    Editable = false;
    PageType = List;
    SourceTable = "Responsibility CenterBR";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Resp. Ctr.")
            {
                Caption = '&Resp. Ctr.';
                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Responsibility Center CardBR";
                    RunPageLink = Code = FIELD(Code);
                    ShortCutKey = 'Shift+F7';
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    action("Dimensions-Single")
                    {
                        Caption = 'Dimensions-Single';
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = CONST(5714),
                                      "No." = FIELD(Code);
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        Caption = 'Dimensions-&Multiple';

                        trigger OnAction()
                        var
                            RespCenter: Record "Responsibility Center";
                        begin
                            /*CurrPage.SETSELECTIONFILTER(RespCenter);
                            DefaultDimMultiple.SetMultiRespCenter(RespCenter);
                            DefaultDimMultiple.RUNMODAL;  */

                        end;
                    }
                }
            }
        }
    }
}

