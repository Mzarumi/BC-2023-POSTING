page 52185805 "Treasury Cashier List"
{
    CardPageID = "Treasury Cashier Transactions";
    Editable = false;
    PageType = List;
    SourceTable = "Treasury Cashier Transactions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("From Account"; Rec."From Account")
                {
                }
                field("To Account"; Rec."To Account")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    OptionCaption = 'Teller Request,Return To Treasury,Issue From Bank,Return To Bank,Inter Teller Transfers,Branch Treasury Transactions,End of Day Return to Treasury>';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
            }
        }
    }

    actions
    {
    }
}

