page 52186430 "Appr. w_sheet"
{
    PageType = Worksheet;
    SourceTable = "Business Loan Appraisal";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Financial Classification Code"; Rec."Financial Classification Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {

                    trigger OnValidate()
                    begin
                        if Rec."Financial Classification Code" = Rec."Financial Classification Code"::"Houselold Expenses" then
                            HseHoldExp := HseHoldExp + Rec."Amount (LCY)"
                        else
                            if Rec."Financial Classification Code" = Rec."Financial Classification Code"::"Household Income" then
                                HseHoldIncome := HseHoldIncome + Rec."Amount (LCY)"
                            else
                                if Rec."Financial Classification Code" = Rec."Financial Classification Code"::"Business Expenses" then
                                    BusExp := BusExp + Rec."Amount (LCY)"
                                else
                                    if Rec."Financial Classification Code" = Rec."Financial Classification Code"::"Cash Sales" then
                                        CashSale := CashSale + Rec."Amount (LCY)"
                                    else
                                        if Rec."Financial Classification Code" = Rec."Financial Classification Code"::"Cost of Sales" then
                                            Costofsales := Costofsales + Rec."Amount (LCY)"
                                        else
                                            if Rec."Financial Classification Code" = Rec."Financial Classification Code"::"Credit sales" then
                                                CreditSales := CreditSales + Rec."Amount (LCY)"
                                            else
                                                if Rec."Financial Classification Code" = Rec."Financial Classification Code"::"Current Assets" then
                                                    CurrAssets := CurrAssets + Rec."Amount (LCY)"
                                                else
                                                    if Rec."Financial Classification Code" = Rec."Financial Classification Code"::"Current Assets(Stock)" then
                                                        CurrAssetsStock := CurrAssetsStock + Rec."Amount (LCY)"
                                                    else
                                                        if Rec."Financial Classification Code" = Rec."Financial Classification Code"::"Fixed Assets" then
                                                            FXDAss := FXDAss + Rec."Amount (LCY)";
                    end;
                }
            }
            group(Control10)
            {
                ShowCaption = false;
                group(Control9)
                {
                    ShowCaption = false;
                }
                //     field("House Hold Expenditure"; Rec.HseHoldExp)
                //     {
                //     }
                //     field("House Hold Income"; Rec.HseHoldIncome)
                //     {
                //     }
                //     field("Gross Profit"; Rec.GrossProfit)
                //     {
                //     }
                //     field("Total Expenses"; Rec.TotalExpenses)
                //     {
                //     }
                //     field("Net Business Income"; Rec.NetBusinessIncome)
                //     {
                //     }
                // }
                // group(Control25)
                // {
                //     ShowCaption = false;
                //     field("Total Short Term Assets"; Rec.TotalShortTermAssets)
                //     {
                //     }
                //     field("Total Long Term Assets"; Rec.TotalLongTermAssets)
                //     {
                //     }
                //     field("Total Liabilities"; Rec.TotalLiabilities)
                //     {
                //     }
                //     field("Total Short Term Liabilities"; Rec.TotalShortTermLiab)
                //     {
                //     }
                //     field("Total Long Term Liabilities"; Rec.TotalLongTermLiab)
                //     {
                //     }
            }
        }
    }

    actions
    {
    }

    var
        HseHoldExp: Decimal;
        HseHoldIncome: Decimal;
        GrossProfit: Decimal;
        TotalExpenses: Decimal;
        NetBusinessIncome: Decimal;
        TotalAsssets: Decimal;
        TotalShortTermAssets: Decimal;
        TotalLongTermAssets: Decimal;
        TotalLiabilities: Decimal;
        TotalShortTermLiab: Decimal;
        TotalLongTermLiab: Decimal;
        Equity: Decimal;
        BusExp: Decimal;
        CashSale: Decimal;
        Costofsales: Decimal;
        CreditSales: Decimal;
        CurrAssets: Decimal;
        CurrAssetsStock: Decimal;
        FXDAss: Decimal;
}

