table 52185778 "Treasury Cashier Transactions"
{
    //DrillDownPageID = "Treasury Cashier List";
    //LookupPageID = "Treasury Cashier List";

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    NoSetup.Get();
                    //NoSeriesMgtTestManual(NoSetup."Treasury & Teller Trans Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Transaction Date"; Date)
        {
        }
        field(3; "Transaction Type"; Option)
        {
            OptionCaption = 'Issue To Teller,Return To Treasury,Issue From Bank,Return To Bank,Inter Teller Transfers,Branch Treasury Transactions,End of Day Return to Treasury';
            OptionMembers = "Issue To Teller","Return To Treasury","Issue From Bank","Return To Bank","Inter Teller Transfers","Branch Treasury Transactions","End of Day Return to Treasury";

            trigger OnValidate()
            begin


                if "Transaction Type" = "Transaction Type"::"Issue To Teller" then begin
                    Description := IssuetoTeller;
                    if BankingSetup.Get(UserId) then begin
                        if BankingSetup.Type = BankingSetup.Type::Treasury then begin
                            "From Account" := UpperCase(UserId);
                            //"From Till":=BankingSetup."Default  Bank";
                            bankacc.Reset;
                            bankacc.SetRange("No.", BankingSetup."Default  Bank");
                            if bankacc.Find('-') then begin
                                "From Till" := PadStr(BankingSetup."Default  Bank" + ' ' + bankacc.Name, 50);
                            end;
                        end;
                    end;

                    if BankingSetup.Get(UserId) then begin
                        if BankingSetup.Type = BankingSetup.Type::Treasury then begin
                            BankAccount := BankingSetup."Default  Bank";
                            if bankacc.Get(BankAccount) then begin
                                bankacc.CalcFields(bankacc."Balance (LCY)", bankacc.Balance);
                                Balance := bankacc.Balance;//bankacc."Balance (LCY)";
                            end;
                        end;
                    end;
                end;

                if "Transaction Type" = "Transaction Type"::"Return To Treasury" then begin
                    Description := ReturnToTreasury;
                    if BankingSetup.Get(UserId) then begin
                        if BankingSetup.Type = BankingSetup.Type::Cashier then begin
                            "From Account" := UpperCase(UserId);
                            //"From Till":=BankingSetup."Default  Bank";
                            bankacc.Reset;
                            bankacc.SetRange("No.", BankingSetup."Default  Bank");
                            if bankacc.Find('-') then begin
                                "From Till" := PadStr(BankingSetup."Default  Bank" + ' ' + bankacc.Name, 50);
                            end;
                        end;
                    end;
                end;

                if "Transaction Type" = "Transaction Type"::"Inter Teller Transfers" then begin
                    Description := InterTellerTrans;
                    if BankingSetup.Get(UserId) then begin
                        if BankingSetup.Type = BankingSetup.Type::Cashier then begin
                            "From Account" := UpperCase(UserId);
                            //"From Till":=BankingSetup."Default  Bank";
                            bankacc.Reset;
                            bankacc.SetRange("No.", BankingSetup."Default  Bank");
                            if bankacc.Find('-') then begin
                                "From Till" := PadStr(BankingSetup."Default  Bank" + ' ' + bankacc.Name, 50);
                            end;
                        end;
                    end;
                end;

                if "Transaction Type" = "Transaction Type"::"Issue From Bank" then begin
                    Description := IssueFromBank;
                    "From Account" := '';
                    "From Till" := '';
                    if BankingSetup.Get(UserId) then begin
                        if BankingSetup.Type = BankingSetup.Type::Treasury then begin
                            "To Account" := UpperCase(UserId);
                            //"To Till":=BankingSetup."Default  Bank";
                            bankacc.Reset;
                            bankacc.SetRange("No.", BankingSetup."Default  Bank");
                            if bankacc.Find('-') then begin
                                "To Till" := PadStr(BankingSetup."Default  Bank" + ' ' + bankacc.Name, 50);
                            end;
                        end;
                    end;
                end;

                if "Transaction Type" = "Transaction Type"::"Return To Bank" then begin
                    Description := ReturnToBank;
                    if BankingSetup.Get(UserId) then begin
                        if BankingSetup.Type = BankingSetup.Type::Treasury then begin
                            "From Account" := UpperCase(UserId);
                            //"From Till":=BankingSetup."Default  Bank";
                            bankacc.Reset;
                            bankacc.SetRange("No.", BankingSetup."Default  Bank");
                            if bankacc.Find('-') then begin
                                "From Till" := PadStr(BankingSetup."Default  Bank" + ' ' + bankacc.Name, 50);
                            end;
                        end;
                    end;
                end;

                if "Transaction Type" = "Transaction Type"::"Branch Treasury Transactions" then begin
                    Description := BranchTreas;
                    if BankingSetup.Get(UserId) then begin
                        if BankingSetup.Type = BankingSetup.Type::Treasury then begin
                            "From Account" := UpperCase(UserId);
                            //"From Till":=BankingSetup."Default  Bank";
                            bankacc.Reset;
                            bankacc.SetRange("No.", BankingSetup."Default  Bank");
                            if bankacc.Find('-') then begin
                                "From Till" := PadStr(BankingSetup."Default  Bank" + ' ' + bankacc.Name, 50);
                            end;
                        end;
                    end;
                end;

                if "Transaction Type" = "Transaction Type"::"End of Day Return to Treasury" then begin
                    Description := EndOfDay;

                    if BankingSetup.Get(UserId) then begin
                        if BankingSetup.Type = BankingSetup.Type::Cashier then begin
                            "From Account" := UpperCase(UserId);
                            //"From Till":=BankingSetup."Default  Bank";
                            bankacc.Reset;
                            bankacc.SetRange("No.", BankingSetup."Default  Bank");
                            if bankacc.Find('-') then begin
                                "From Till" := PadStr(BankingSetup."Default  Bank" + ' ' + bankacc.Name, 50);
                            end;

                        end;
                    end;

                    BankAccount := '';
                    if BankingSetup.Get(UserId) then begin
                        BankAccount := BankingSetup."Default  Bank";
                        if bankacc.Get(BankAccount) then begin
                            bankacc.CalcFields(bankacc."Balance (LCY)", bankacc.Balance);
                            "Till/Treasury Balance" := bankacc.Balance;//bankacc."Balance (LCY)";
                        end;
                    end;

                end;

                "To Account" := '';
                "To Till" := '';
            end;
        }
        field(4; "From Account"; Code[50])
        {
            TableRelation = IF ("Transaction Type" = FILTER("Issue To Teller" | "Return To Bank" | "Branch Treasury Transactions")) "Banking User Template".UserID WHERE(Type = CONST(Treasury))
            ELSE
            IF ("Transaction Type" = FILTER("End of Day Return to Treasury" | "Return To Treasury" | "Inter Teller Transfers")) "Banking User Template".UserID WHERE(Type = CONST(Cashier))
            ELSE
            IF ("Transaction Type" = FILTER("Issue From Bank")) "Bank Account"."No.";

            trigger OnValidate()
            begin

                if BankingSetup.Get("From Account") then begin
                    bankacc.Reset;
                    bankacc.SetRange("No.", BankingSetup."Default  Bank");
                    if bankacc.Find('-') then begin
                        "From Till" := PadStr(BankingSetup."Default  Bank" + ' ' + bankacc.Name, 50);
                    end;
                    //"From Till":=BankingSetup."Default  Bank";
                    bankacc.Reset;
                    bankacc.SetRange("No.", BankingSetup."Default  Bank");
                    if bankacc.Find('-') then begin
                        "From Till" := PadStr(BankingSetup."Default  Bank" + ' ' + bankacc.Name, 50);
                    end;
                end;
            end;
        }
        field(5; "To Account"; Code[50])
        {
            TableRelation = IF ("Transaction Type" = FILTER("Return To Treasury" | "Issue From Bank" | "Branch Treasury Transactions" | "End of Day Return to Treasury")) "Banking User Template".UserID WHERE(Type = CONST(Treasury))
            ELSE
            IF ("Transaction Type" = FILTER("Issue To Teller" | "Inter Teller Transfers")) "Banking User Template".UserID WHERE(Type = CONST(Cashier))
            ELSE
            IF ("Transaction Type" = FILTER("Return To Bank")) "Bank Account"."No." WHERE("Bank Type" = CONST(Normal));

            trigger OnValidate()
            begin
                if "To Account" = "From Account" then
                    Error('To account cannot be same as from account');


                if BankingSetup.Get("To Account") then begin
                    "To Till" := BankingSetup."Default  Bank";
                    bankacc.Reset;
                    bankacc.SetRange("No.", BankingSetup."Default  Bank");
                    if bankacc.Find('-') then begin
                        "To Till" := PadStr(BankingSetup."Default  Bank" + ' ' + bankacc.Name, 50);
                    end;
                end;
            end;
        }
        field(6; Description; Text[100])
        {
        }
        field(7; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                if Amount < 0 then
                    Error('Amount must not be negative')
            end;
        }
        field(8; Posted; Boolean)
        {
        }
        field(9; "Date Posted"; Date)
        {
        }
        field(10; "Time Posted"; Time)
        {
        }
        field(11; "Posted By"; Text[50])
        {
        }
        field(12; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(13; "Transaction Time"; Time)
        {
        }
        field(14; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(15; Issued; Option)
        {
            OptionMembers = No,Yes,"N/A";
        }
        field(16; "Date Issued"; Date)
        {
        }
        field(17; "Time Issued"; Time)
        {
        }
        field(18; "Issue Received"; Option)
        {
            Editable = false;
            OptionMembers = No,Yes,"N/A";
        }
        field(19; "Date Received"; Date)
        {
            Editable = false;
        }
        field(20; "Time Received"; Time)
        {
            Editable = false;
        }
        field(21; "Issued By"; Text[50])
        {
            Editable = false;
        }
        field(22; "Received By"; Text[50])
        {
            Editable = false;
        }
        field(23; Received; Option)
        {
            Editable = false;
            OptionCaption = 'No,Yes';
            OptionMembers = No,Yes;
        }
        field(24; "Denomination Total"; Decimal)
        {
            CalcFormula = Sum(Coinage."Total Amount" WHERE(No = FIELD(No)));
            FieldClass = FlowField;
        }
        field(25; "External Document No."; Code[20])
        {
        }
        field(26; "Total Cash on Treasury Coinage"; Decimal)
        {
            CalcFormula = Sum(Coinage."Total Amount" WHERE(No = FIELD(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "Till/Treasury Balance"; Decimal)
        {
        }
        field(28; "Excess/Shortage Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Excess/Shortage Amount" < 0 then
                    Error('Amount must not be negative');

                if Type = Type::" " then
                    Error('Please specify the type');
            end;
        }
        field(29; "From Account Name"; Text[50])
        {
        }
        field(30; "To Account Name"; Text[50])
        {
        }
        field(31; "Actual Cash At Hand"; Decimal)
        {
            Enabled = false;
        }
        field(32; "Responsibility Center"; Code[20])
        {
        }
        field(33; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(34; Type; Option)
        {
            OptionCaption = ' ,Excess,Shortage';
            OptionMembers = " ",Excess,Shortage;

            trigger OnValidate()
            begin
                "Excess/Shortage Amount" := 0;
            end;
        }
        field(35; "From Till"; Code[50])
        {
            Editable = false;
        }
        field(36; "To Till"; Code[50])
        {
            Editable = false;
        }
        field(37; Balance; Decimal)
        {
        }
        field(46; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(47; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if No = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."Treasury & Teller Trans Nos.");
            //NoSeriesMgtInitSeries(NoSetup."Treasury & Teller Trans Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;


        if "Transaction Type" = "Transaction Type"::"Issue To Teller" then begin
            Description := IssuetoTeller;
            if BankingSetup.Get(UserId) then begin
                if BankingSetup.Type = BankingSetup.Type::Treasury then begin
                    "From Account" := UpperCase(UserId);

                    bankacc.Reset;
                    bankacc.SetRange("No.", BankingSetup."Default  Bank");
                    if bankacc.Find('-') then begin
                        "From Till" := PadStr(BankingSetup."Default  Bank" + ' ' + bankacc.Name, 50);
                    end;
                end;
            end;

            if BankingSetup.Get(UserId) then begin
                if BankingSetup.Type = BankingSetup.Type::Treasury then begin
                    BankAccount := BankingSetup."Default  Bank";
                    if bankacc.Get(BankAccount) then begin
                        bankacc.CalcFields(bankacc."Balance (LCY)", bankacc.Balance);
                        Balance := bankacc.Balance;//bankacc."Balance (LCY)";
                    end;
                end;
            end;

        end
        else
            if "Transaction Type" = "Transaction Type"::"Issue From Bank" then
                Description := IssueFromBank
            else
                Description := ReturnToTreasury;



        "Transaction Date" := Today;
        "Transaction Time" := Time;


        Denominations.Reset;
        TransactionCoinage.Reset;
        Denominations.Init;
        TransactionCoinage.Init;

        if Denominations.Find('-') then begin

            repeat
                TransactionCoinage.No := No;
                TransactionCoinage.Code := Denominations.Code;
                TransactionCoinage.Description := Denominations.Description;
                TransactionCoinage.Type := Denominations.Type;
                TransactionCoinage.Value := Denominations.Value;
                TransactionCoinage.Quantity := 0;
                TransactionCoinage.Insert;
            until Denominations.Next = 0;

        end;

        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.Find('-') then begin
            "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
            "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
        end;
    end;

    trigger OnModify()
    begin

        if Issued = Issued::Yes then
            Error('you cannot modify this transaction');

        if Posted then
            Error('you cannot modify this transaction');
    end;

    var
        NoSetup: Record "Banking No Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        Denominations: Record Denominations;
        TransactionCoinage: Record Coinage;
        IssuetoTeller: Label 'ISSUE TO TELLER';
        IssueFromBank: Label 'ISSUE FROM BANK';
        ReturnToTreasury: Label 'RETURN TO TREASURY';
        InterTellerTrans: Label 'INTER TELLER TRANSFERS';
        ReturnToBank: Label 'RETURN TO BANK';
        BranchTreas: Label 'BRANCH TREASURY TRANSACTIONS';
        EndOfDay: Label 'END OF DAY RETURN TO TREASURY';
        BankingSetup: Record "Banking User Template";
        bankacc: Record "Bank Account";
        BankAccount: Code[25];
        UserSetup: Record "User Setup";
}

