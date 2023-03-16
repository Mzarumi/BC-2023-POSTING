page 52185826 "Main Treasury"
{
    PageType = Card;
    SourceTable = "Main Treasury Account";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Bank Balances"; Rec."Bank Balances")
                {
                }
                field("Treasury Name"; Rec."Treasury Name")
                {
                }
                field("Vault Balances"; Rec."Vault Balances")
                {
                }
                field("Till Balances"; Rec."Till Balances")
                {
                }
                field(Total; Rec.Total)
                {
                }
            }
            group("Treasury View")
            {
                Caption = 'Treasury View';
                chartpart(TRS00001; TRS00001)
                {
                }
            }
        }
    }

    actions
    {
    }
}

