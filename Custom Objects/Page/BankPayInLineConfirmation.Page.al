page 52185937 "Bank Pay In Line Confirmation"
{
    PageType = ListPart;
    SourceTable = "Bank Slip Line";
    SourceTableView = WHERE(Vaulted = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Control1102758000)
            {
                ShowCaption = false;
                field(Select; Rec.Select)
                {
                    Caption = 'Confirmed';
                }
                field("Bank Slip No."; Rec."Bank Slip No.")
                {
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    Editable = false;
                }
                field("Drawers Name"; Rec."Drawers Name")
                {
                    Editable = false;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = true;
                }
            }
        }
    }

    actions
    {
    }

    var
        BHeader: Record "Bank Slip";
}

