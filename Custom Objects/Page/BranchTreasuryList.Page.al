page 52185828 "Branch Treasury List"
{
    CardPageID = "Branch Treasury";
    Editable = false;
    PageType = List;
    SourceTable = "Branch Treasury Accounts";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Treasury Name"; Rec."Treasury Name")
                {
                }
                field("Bank Balances"; Rec."Bank Balances")
                {
                }
                field("Vault Balance"; Rec."Vault Balance")
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

