page 52185829 "Main Treasury List"
{
    CardPageID = "Main Treasury";
    Editable = false;
    PageType = List;
    SourceTable = "Main Treasury Account";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Treasury Name"; Rec."Treasury Name")
                {
                }
                field("Bank Balances"; Rec."Bank Balances")
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
        }
    }

    actions
    {
    }
}

