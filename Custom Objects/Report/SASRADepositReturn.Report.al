#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185740 "SASRA Deposit Return"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/SASRA Deposit Return.rdlc';

    dataset
    {
        dataitem("Savings Accounts"; "Savings Accounts")
        {
            DataItemTableView = sorting("No.") where("Balance (LCY)" = filter(<> 0));
            RequestFilterFields = "No.";
            column(ReportForNavId_1102755000; 1102755000)
            {
            }
            column(CompanyName; Company.Name)
            {
            }
            column(Count1; Count1)
            {
            }
            column(Count2; Count2)
            {
            }
            column(Count3; Count3)
            {
            }
            column(Count4; Count4)
            {
            }
            column(Count5; Count5)
            {
            }
            column(Account1; Acount1)
            {
            }
            column(Account2; Acount2)
            {
            }
            column(Account3; Acount3)
            {
            }
            column(Account4; Acount4)
            {
            }
            column(Account5; Acount5)
            {
            }
            column(Faccount1; Facount1)
            {
            }
            column(Faccount2; Facount2)
            {
            }
            column(Faccount3; Facount3)
            {
            }
            column(Faccount4; Facount4)
            {
            }
            column(Faccount5; Facount5)
            {
            }
            column(Bal1; Bal1)
            {
            }
            column(Bal2; Bal2)
            {
            }
            column(Bal3; Bal3)
            {
            }
            column(Bal4; Bal4)
            {
            }
            column(Bal5; Bal5)
            {
            }
            column(Abal1; Abal1)
            {
            }
            column(Abal2; Abal2)
            {
            }
            column(Abal3; Abal3)
            {
            }
            column(Abal4; Abal4)
            {
            }
            column(Abal5; Abal5)
            {
            }
            column(Fbal1; Fabal1)
            {
            }
            column(Fbal2; Fabal2)
            {
            }
            column(Fbal3; Fabal3)
            {
            }
            column(Fbal4; Fabal4)
            {
            }
            column(Fbal5; Fabal5)
            {
            }
            column(GrandCount; Grandcount)
            {
            }
            column(GrandTotal; GrandTotal)
            {
            }

            trigger OnAfterGetRecord()
            begin

                if ASAT = 0D then
                    ASAT := Today;

                DFilter := '01/01/14..' + Format(ASAT);

                //SavingsAccounts.SETFILTER(SavingsAccounts."Date Filter",DFilter);


                //Take care of shares
                SavingsAccounts.SetCurrentkey("No.");
                SavingsAccounts.SetRange("No.", "Savings Accounts"."No.");
                SavingsAccounts.SetFilter("Date Filter", DFilter);
                if SavingsAccounts.Find('-') then begin

                    SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                    if (SavingsAccounts."Product Category" = SavingsAccounts."product category"::Benevolent) or
                    (SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Junior Savings") or
                    (SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Registration Fee") or
                    (SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Unallocated Fund") or
                    (SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Share Capital") then
                        CurrReport.Skip;



                    if (SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Deposit Contribution") then begin
                        //CALCFIELDS(SavingsAccounts."Balance (LCY)");
                        //IF SavingsAccounts."Product Type"='02' THEN BEGIN
                        Shares := (SavingsAccounts."Balance (LCY)");
                        //MESSAGE('%1 %2 Shares',"Current Deposit","SACCO Account"."No.",Shares);

                        if Shares <= 50000 then begin
                            Bal1 := Bal1 + Shares;
                            Count1 := Count1 + 1;
                        end else
                            if (Shares > 50000.01) and (Shares <= 100000) then begin
                                Bal2 := Bal2 + Shares;
                                Count2 := Count2 + 1;
                            end else
                                if (Shares > 100000.01) and (Shares <= 300000) then begin
                                    Bal3 := Bal3 + Shares;
                                    Count3 := Count3 + 1;
                                end else
                                    if (Shares > 300000.01) and (Shares <= 1000000) then begin
                                        Bal4 := Bal4 + Shares;
                                        Count4 := Count4 + 1;
                                    end else
                                        if Shares > 1000000 then begin
                                            Bal5 := Bal5 + Shares;
                                            Count5 := Count5 + 1;
                                        end;


                    end else
                        //Take care of other savings except fixed
                        //IF SavingsAccounts."Product Category"<>SavingsAccounts."Product Category"::"Fixed Deposit" THEN BEGIN
                        if SavingsAccounts."Loan Disbursement Account" = true then begin
                            //IF SavingsAccounts."Product Type"='505' THEN BEGIN
                            //CALCFIELDS(SavingsAccounts."Balance (LCY)");
                            //MESSAGE('%1 %2 non fixed',Balance,"SACCO Account"."No.");
                            Balance := (SavingsAccounts."Balance (LCY)");
                            if Balance <= 50000 then begin
                                Abal1 := Abal1 + Balance;
                                Acount1 := Acount1 + 1;
                            end else
                                if (Balance > 50000.01) and (Balance <= 100000) then begin
                                    Abal2 := Abal2 + Balance;
                                    Acount2 := Acount2 + 1;
                                end else
                                    if (Balance > 100000.01) and (Balance <= 300000) then begin
                                        Abal3 := Abal3 + Balance;
                                        Acount3 := Acount3 + 1;
                                    end else
                                        if (Balance > 300000.01) and (Balance <= 1000000) then begin
                                            Abal4 := Abal4 + Balance;
                                            Acount4 := Acount4 + 1;
                                        end else
                                            if Balance > 1000000 then begin
                                                Abal5 := Abal5 + Balance;
                                                Acount5 := Acount5 + 1;
                                            end;

                        end else
                            if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Fixed Deposit" then begin
                                //END ELSE IF SavingsAccounts."Product Type"='506' THEN BEGIN
                                //CALCFIELDS(SavingsAccounts."Balance (LCY)");
                                //MESSAGE('%1 %2 Fixed',Balance,"SACCO Account"."No.");

                                Fbalance := SavingsAccounts."Balance (LCY)";
                                if Fbalance > 0 then begin

                                    if Fbalance <= 50000 then begin

                                        Fabal1 := Fabal1 + Fbalance;
                                        Facount1 := Facount1 + 1;
                                    end else
                                        if (Fbalance > 50000.01) and (Fbalance <= 100000) then begin
                                            Fabal2 := Fabal2 + Fbalance;
                                            Facount2 := Facount2 + 1;
                                        end else
                                            if (Fbalance > 100000.01) and (Fbalance <= 300000) then begin
                                                Fabal3 := Fabal3 + Fbalance;
                                                Facount3 := Facount3 + 1;
                                            end else
                                                if (Fbalance > 300000.01) and (Fbalance <= 1000000) then begin
                                                    Fabal4 := Fabal4 + Fbalance;
                                                    Facount4 := Facount4 + 1;
                                                end else
                                                    if Fbalance > 1000000 then begin
                                                        Fabal5 := Fabal5 + Fbalance;
                                                        Facount5 := Facount5 + 1;
                                                    end;
                                end;

                            end;
                end;

                //Take care of fixed


                GrandTotal := Bal1 + Bal2 + Bal3 + Bal4 + Bal5 + Abal1 + Abal2 + Abal3 + Abal4 + Abal5 + Fabal1 + Fabal2 + Fabal3 + Fabal4 + Fabal5;
                Grandcount := Count1 + Count2 + Count3 + Count4 + Count5 + Acount1 + Acount2 + Acount3 + Acount4 + Acount5
                + Facount1 + Facount2 + Facount3 + Facount4 + Facount5;
                //MESSAGE('Total Count %1 Total Bal%2',GrandTotal,Grandcount);
                //new code
            end;

            trigger OnPostDataItem()
            begin
                Message('%1 %2 %3 %4 %5', Count1, Count2, Count3, Count4, Count5);
            end;

            trigger OnPreDataItem()
            begin
                Company.Get;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(ASAT; ASAT)
                {
                    ApplicationArea = Basic;
                    Caption = 'As At..............';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Less50000: Decimal;
        "50000 to 10000": Decimal;
        "10000 t0 300000": Decimal;
        "300000 to 100000": Decimal;
        "over 1000000": Decimal;
        Account: Record 52185730;
        "Less50000-a/c": Decimal;
        "50000 to 10000-a/c": Decimal;
        "10000 t0 300000-a/c": Decimal;
        "300000 to 100000-a/c": Decimal;
        "over 1000000-a/c": Decimal;
        cust: Record 52185730;
        Shares: Decimal;
        Bal1: Decimal;
        Bal2: Decimal;
        Bal3: Decimal;
        Bal4: Decimal;
        Bal5: Decimal;
        Count1: Integer;
        Count2: Integer;
        Count3: Integer;
        Count4: Integer;
        Count5: Integer;
        Abal1: Decimal;
        Abal2: Decimal;
        Abal3: Decimal;
        Abal4: Decimal;
        Abal5: Decimal;
        Acount1: Integer;
        Acount2: Integer;
        Acount3: Integer;
        Acount4: Integer;
        Acount5: Integer;
        Balance: Decimal;
        Fabal1: Decimal;
        Fabal2: Decimal;
        Fabal3: Decimal;
        Fabal4: Decimal;
        Fabal5: Decimal;
        Facount1: Integer;
        Facount2: Integer;
        Facount3: Integer;
        Facount4: Integer;
        Facount5: Integer;
        Fbalance: Decimal;
        GrandTotal: Decimal;
        Grandcount: Integer;
        DFilter: Text[50];
        ASAT: Date;
        Company: Record "Company Information";
        SavingsAccounts: Record 52185730;
}
