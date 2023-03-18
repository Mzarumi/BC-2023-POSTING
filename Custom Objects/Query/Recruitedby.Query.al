Query 52185463 "Recruited by"
{

    elements
    {
        dataitem(Salesperson_Purchaser;"Salesperson/Purchaser")
        {
            column("Code";"Code")
            {
            }
            column(Name;Name)
            {
            }
            dataitem(Members;Members)
            {
                DataItemLink = "Recruited By"=Salesperson_Purchaser.Code;
                column(MNo;"No.")
                {
                }
                column(MName;Name)
                {
                }
                dataitem(Savings_Accounts;52185730)
                {
                    DataItemLink = "Recruited By"=Salesperson_Purchaser.Code;
                    column(SNo;"No.")
                    {
                    }
                    column(SName;Name)
                    {
                    }
                }
            }
        }
    }
}
