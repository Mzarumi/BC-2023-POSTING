table 52185776 "Cashier Transactions"
{
    //DrillDownPageID = "Cashier Transactions List";
    //LookupPageID = "Cashier Transactions List";

    fields
    {
        field(1; No; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin

                if No <> xRec.No then begin
                    NoSetup.Get();
                    //NoSeriesMgtTestManual(NoSetup."Cashier Transaction Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Account No"; Code[20])
        {
            TableRelation = IF ("Account Type" = CONST(Account)) "Savings Accounts"."No."
            ELSE
            IF ("Account Type" = CONST(Teller)) "Bank Account"."No." WHERE("Cashier ID" = FIELD(Cashier));

            trigger OnValidate()
            begin
                ATMLinkingApplications.Reset;
                ATMLinkingApplications.SetRange("Account No", "Account No");
                ATMLinkingApplications.SetRange("Card Issued", false);
                if ATMLinkingApplications.Find('-') then begin
                    if ATMLinkingApplications."ATM Application No." <> '' then
                        Message('The ATM card is ready for collection');
                end;
                Amount := 0;
                "Available Balance" := 0;


                Account.Reset;
                if Account.Get("Account No") then begin
                    if (Account.Status <> Account.Status::New) and (Account.Status <> Account.Status::Active) and (Account.Status <> Account.Status::Dormant) then
                        Error(Text0001);
                    Account.CalcFields(Account.Balance);
                    "Account Name" := Account.Name;
                    Remarks := Account.Name;
                    Payee := Account.Name;
                    "Product Type" := Account."Product Type";
                    "Currency Code" := Account."Currency Code";
                    "ID No" := Account."ID No.";
                    "Member No." := Account."Member No.";
                    "Book Balance" := Account.Balance;
                    "Signing Instructions" := Account."Signing Instructions";
                    "Product Category" := Account."Product Category";
                    "Employer Code" := Account."Employer Code";
                end;
                CalcAvailableBal;
                Validate("Member No.");
            end;
        }
        field(3; "Account Name"; Text[50])
        {
        }
        field(4; "Transaction Type"; Code[20])
        {
            TableRelation = "Transaction Types".Code WHERE("Product Type" = FIELD("Product Type"),
                                                            Category = CONST(Cashier));

            trigger OnValidate()
            begin

                if TransactionTypes.Get("Transaction Type") then begin
                    "Transaction Description" := TransactionTypes.Description;
                    Type := TransactionTypes.Type;

                end;

                //Check if member has picture and Signature

                if Type = Type::"Cash Withdrawal" then begin
                    if Members.Get("Member No.") then begin
                        if Members."Group Account" = false then begin
                            ImageData.Reset;
                            ImageData.SetRange(ImageData."Member No", "Member No.");
                            if ImageData.Find('-') then begin
                                ImageData.CalcFields(ImageData.Picture, ImageData.Signature);
                                if not ImageData.Picture.HasValue then
                                    Error('Kindly capture the member photo before proceeding');
                                if not ImageData.Signature.HasValue then
                                    Error('Kindly Signature sample of the member before proceeding');
                            end else begin
                                Error('Kindly capture the member photo & Signature before proceeding');
                            end;
                        end;
                    end;
                end;



                if Type = Type::"Cheque Deposit" then begin

                    BUserSetup.Reset;
                    BUserSetup.SetRange(BUserSetup.UserID, UserId);
                    if BUserSetup.Find('-') then begin

                        "Bank Account" := BUserSetup."Cheque Clearance Account";
                    end;
                end;

                CalcAvailableBal;
            end;
        }
        field(5; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                if Amount < 0 then
                    Error('Amount cannot be less than zero');

                GeneralSetUp.Get;

                if "Transaction Type" = 'BANKERS CHEQUE' then begin
                    if Amount > GeneralSetUp."Bankers Cheque Limit" then
                        Error(Txt001, GeneralSetUp."Bankers Cheque Limit");
                end;
                CalcAvailableBal;
            end;
        }
        field(6; Cashier; Code[50])
        {
            Editable = false;
        }
        field(7; "Transaction Date"; Date)
        {
            Editable = false;
        }
        field(8; "Transaction Time"; Time)
        {
            Editable = false;
        }
        field(9; Posted; Boolean)
        {
        }
        field(10; "No. Series"; Code[20])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(11; "Product Type"; Code[20])
        {
            TableRelation = "Product Factory"."Product ID" WHERE("Product Class Type" = CONST(Savings));
        }
        field(12; "Cheque Type"; Code[20])
        {
            TableRelation = "Cheque Types";

            trigger OnValidate()
            begin
                TestField(Amount);
                if ChequeTypes.Get("Cheque Type") then begin
                    //Added by ckigen
                    if (ChequeTypes."Cheque Limit" <> 0) and (Amount > ChequeTypes."Cheque Limit") then
                        Error(Text0003, ChequeTypes."Cheque Limit");
                    //Remarks:=ChequeTypes.Description;
                    CDays := ChequeTypes."Clearing  Days";

                    EMaturity := "Transaction Date";
                    if i < CDays then begin
                        repeat
                            EMaturity := CalcDate('1D', EMaturity);
                            if (Date2DWY(EMaturity, 1) <> 6) and (Date2DWY(EMaturity, 1) <> 7) then
                                i := i + 1;

                        until i = CDays;
                    end;

                    "Expected Maturity Date" := EMaturity;

                    if ChequeTypes."Clearing  Days" = 0 then
                        "Cheque Status" := "Cheque Status"::Honoured
                    else
                        "Cheque Status" := "Cheque Status"::Pending;

                end;
            end;
        }
        field(13; "Cheque No"; Code[6])
        {

            trigger OnValidate()
            begin
                CashierTransactions.Reset;
                CashierTransactions.SetRange("Account No", "Account No");
                CashierTransactions.SetRange("Bank Account", "Bank Account");
                CashierTransactions.SetRange("Cheque No", "Cheque No");
                if CashierTransactions.Find('-') then begin
                    Error('The cheque No. %1 has already been posted to %2 on %3', CashierTransactions."Cheque No", CashierTransactions."Account No", CashierTransactions."Transaction Date");
                end;
            end;
        }
        field(14; "Cheque Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Cheque Date" > Today then
                    Error('Post dating not allowed');
                CashOfficeSetup.Get;
                if "Cheque Date" < CalcDate('-' + Format(CashOfficeSetup."Cheque Reject Period"), Today) then
                    Error(Text0002);
            end;
        }
        field(15; Payee; Text[100])
        {
        }
        field(16; Remarks; Text[100])
        {
        }
        field(17; Type; Option)
        {
            OptionCaption = 'Cash Deposit,Cash Withdrawal,Credit Receipt,Credit Cheque,Bankers Cheque,Cheque Deposit,Cheque Withdrawal,Salary Processing,EFT,RTGS,Overdraft,Standing Order,Dividend,Msacco Balance Enquiry,Msacco Deposit,Msacco Ministatement,Msacco Transfer,Msacco Withdrawal,Msacco Registration,Msacco Charge,Transfers,ATM Applications,Member Withdrawal,ATM Replacement,Statement,Bounced Cheque,Lien,Cheque Application,Bank Transfer Mode,Sacco_Bank Cheques,Savings Penalty,Delegates Payment,Delegates Special,BBF Payment,Cancel Bankers Cheque';
            OptionMembers = "Cash Deposit","Cash Withdrawal","Credit Receipt","Credit Cheque","Bankers Cheque","Cheque Deposit","Cheque Withdrawal","Salary Processing",EFT,RTGS,Overdraft,"Standing Order",Dividend,"Msacco Balance Enquiry","Msacco Deposit","Msacco Ministatement","Msacco Transfer","Msacco Withdrawal","Msacco Registration","Msacco Charge",Transfers,"ATM Applications","Member Withdrawal","ATM Replacement",Statement,"Bounced Cheque",Lien,"Cheque Application","Bank Transfer Mode","Sacco_Bank Cheques","Savings Penalty","Delegates Payment","Delegates Special","BBF Payment","Cancel Bankers Cheque";
        }
        field(18; "Transaction Description"; Text[100])
        {
        }
        field(19; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
        }
        field(20; "Date Posted"; Date)
        {
        }
        field(21; "Time Posted"; Time)
        {
        }
        field(22; "Posted By"; Code[50])
        {
        }
        field(23; "Expected Maturity Date"; Date)
        {
        }
        field(24; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
        field(25; "Post Dated"; Boolean)
        {
        }
        field(26; "Book Balance"; Decimal)
        {
            Editable = false;
        }
        field(27; Overdraft; Boolean)
        {
        }
        field(28; "Protected Account"; Boolean)
        {
        }
        field(29; "Member No."; Code[20])
        {
        }
        field(30; "Banked By"; Code[50])
        {
        }
        field(31; "Date Banked"; Date)
        {
        }
        field(32; "Time Banked"; Time)
        {
        }
        field(33; "Cleared By"; Code[50])
        {
        }
        field(34; "Date Cleared"; Date)
        {
        }
        field(35; "Time Cleared"; Time)
        {
        }
        field(36; "ID No"; Code[11])
        {
        }
        field(37; "Bank Account"; Code[20])
        {
            TableRelation = "Bank Account" WHERE("Bank Type" = CONST(Normal),
                                                  Blocked = CONST(false));

            trigger OnValidate()
            begin
                Validate("Cheque No");
                if BankAccount.Get("Bank Account") then
                    "Cheque Issueing Bank" := BankAccount.Name;
            end;
        }
        field(38; Printed; Boolean)
        {
        }
        field(39; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(40; "Available Balance"; Decimal)
        {
        }
        field(41; "Attempted Self Transaction"; Boolean)
        {
        }
        field(42; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility CenterBR";
        }
        field(43; "Change Log"; Integer)
        {
        }
        field(44; "Cheque Status"; Option)
        {
            OptionCaption = 'Pending,Stopped,Bounced,Honoured';
            OptionMembers = Pending,Stopped,Bounced,Honoured;
        }
        field(45; "Bankers Cheque No"; Code[6])
        {
            TableRelation = "Bankers Cheques Register"."Cheque No." WHERE(Status = FILTER(Pending),
                                                                           "Global Dimension 2 Code" = FIELD("Global Dimension 2 Code"));
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
        field(48; "Allocated Amount"; Decimal)
        {
            CalcFormula = Sum("Cashier Transaction Lines".Amount WHERE("Transaction No" = FIELD(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "FingerPrint Verified"; Boolean)
        {
            Editable = false;
        }
        field(50002; SystemGeneratedGuid; Guid)
        {
        }
        field(50003; Select; Boolean)
        {
        }
        field(50004; "Discounting Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Cheque Status" <> "Cheque Status"::Pending then
                    Error('You can only discount a pending cheque');

                if "Discounting Amount" < 0 then
                    Error('Amount must be greater than zero');


                ProdF.Reset;
                ProdF.SetRange(ProdF."Type of Discounting", ProdF."Type of Discounting"::"Cheque Discounting");
                ProdF.SetRange(ProdF."Product Class Type", ProdF."Product Class Type"::Loan);
                if ProdF.Find('-') then begin
                    ProdF.TestField(ProdF."Discounting %");
                    ProdF.TestField(ProdF."Interest Rate (Min.)");
                    ProdF.TestField(ProdF."Maximum Loan Amount");

                    if "Discounting Amount" > ProdF."Maximum Loan Amount" then
                        Error('The amount cannot be more than %1', ProdF."Maximum Loan Amount");
                end else
                    Error('Discounting loan product not found.');


                if (Amount * ProdF."Discounting %" / 100) < ("Discounted Amount" + "Discounting Amount") then
                    Error('You can only discount upto %1.', (Amount * ProdF."Discounting %" / 100) - "Discounted Amount");
            end;
        }
        field(50005; "Discounted Amount"; Decimal)
        {
        }
        field(50006; "Expiry Date"; Date)
        {
        }
        field(50007; "Signing Instructions"; Text[30])
        {
        }
        field(50008; "Till Name"; Code[50])
        {
            Editable = false;
        }
        field(50009; "Product Category"; Option)
        {
            OptionCaption = ' ,Share Capital,Deposit Contribution,Fixed Deposit,Junior Savings,Registration Fee';
            OptionMembers = " ","Share Capital","Deposit Contribution","Fixed Deposit","Junior Savings","Registration Fee";
        }
        field(50010; "Till Code"; Code[20])
        {
        }
        field(50011; "New Account Balance"; Decimal)
        {
        }
        field(50012; "Employer Code"; Code[20])
        {
        }
        field(50013; Dublicate; Boolean)
        {
        }
        field(50014; "Cheque Issueing Bank"; Text[100])
        {
            Editable = false;
        }
        field(50015; "Account Type"; Option)
        {
            OptionCaption = 'Account,Teller';
            OptionMembers = Account,Teller;

            trigger OnValidate()
            begin
                //TESTFIELD(Status,Status::Open);
                //CLEARALL();
                "Account No" := '';
                "Member No." := '';
                "Account Name" := '';
                Amount := 0;
                "Transaction Type" := '';
                //Type:=Type::" ";
                "ID No" := '';
                "Book Balance" := 0;
                "Available Balance" := 0;
                "New Account Balance" := 0;
                Remarks := '';
                "Signing Instructions" := '';
                "Cheque Date" := 0D;
                "Cheque No" := '';
                "Product Type" := '';
                "Project Member" := '';
                "Project Vendor" := '';

                if "Account Type" = "Account Type"::Teller then begin
                    BUserSetup.Reset;
                    BUserSetup.SetRange(BUserSetup.UserID, UserId);
                    if BUserSetup.Find('-') then begin
                        "Till Code" := BUserSetup."Default  Bank";
                        bankacc.Reset;
                        bankacc.SetRange("No.", BUserSetup."Default  Bank");
                        if bankacc.Find('-') then begin
                            "Account No" := bankacc."No.";
                            "Till Name" := PadStr(BUserSetup."Default  Bank" + ' ' + bankacc.Name, 50)
                        end;
                    end;
                end;
            end;
        }
        field(50016; "Project Member"; Code[20])
        {
            TableRelation = Members."No.";

            trigger OnValidate()
            begin
                if Members.Get("Project Member") then begin
                    "Account Name" := Members.Name;
                    "ID No" := Members."ID No.";
                    "Member No." := "Project Member";

                end;
            end;
        }
        field(50017; "Project Vendor"; Code[20])
        {
            TableRelation = Vendor."No." WHERE("Vendor Type" = CONST("Asset Finance"));
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

    trigger OnDelete()
    begin
        Error('You cannot delete this transaction');
    end;

    trigger OnInsert()
    begin

        if No = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."Cashier Transaction Nos.");
            //NoSeriesMgtInitSeries(NoSetup."Cashier Transaction Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;

        Cashier := UpperCase(UserId);
        "Transaction Date" := Today;
        "Transaction Time" := Time;


        BUserSetup.Reset;
        BUserSetup.SetRange(BUserSetup.UserID, UserId);
        if BUserSetup.Find('-') then begin
            "Till Code" := BUserSetup."Default  Bank";
            bankacc.Reset;
            bankacc.SetRange("No.", BUserSetup."Default  Bank");
            if bankacc.Find('-') then begin
                "Till Name" := PadStr(BUserSetup."Default  Bank" + ' ' + bankacc.Name, 50)

            end;
        end;

        UserSetup.Reset;
        UserSetup.SetRange(UserSetup."User ID", UserId);
        if UserSetup.Find('-') then begin
            UserSetup.TestField(UserSetup."Global Dimension 1 Code");
            UserSetup.TestField(UserSetup."Global Dimension 2 Code");


            "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
            "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
            "Responsibility Center" := UserSetup."Responsibility Centre";
        end;
    end;

    trigger OnModify()
    begin
        /*IF Posted=FALSE THEN BEGIN
        IF Status<>Status::"Pending Approval" THEN BEGIN
        IF Cashier<>USERID THEN
        ERROR('You cannot modify a transaction being processed by user %1',Cashier);
        END;
        END;
        */

    end;

    var
        NoSetup: Record "Banking No Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        Account: Record "Savings Accounts";
        TransactionTypes: Record "Transaction Types";
        Text0001: Label 'The account is not active and therefore cannot be transacted upon.';
        ChequeTypes: Record "Cheque Types";
        CDays: Integer;
        EMaturity: Date;
        i: Integer;
        UserSetup: Record "User Setup";
        TCharges: Decimal;
        TransactionCharges: Record "Transaction Charges";
        ChargeAmount: Decimal;
        TariffDetails: Record "Tiered Charges Lines";
        Trans: Record "Cashier Transactions";
        TChargeAmount: Decimal;
        GenSetup: Record "General Set-Up";
        AccountTypes: Record "Product Factory";
        TransType: Record "Transaction Types";
        BUserSetup: Record "Banking User Template";
        ProdF: Record "Product Factory";
        bankacc: Record "Bank Account";
        CashOfficeSetup: Record "Cash Office Setup";
        Text0002: Label 'The cheque has expired';
        Text0003: Label 'The cheque limit should not exceed the cheque amount limit of %1';
        BankAccount: Record "Bank Account";
        CashierTransactions: Record "Cashier Transactions";
        ATMLinkingApplications: Record "ATM Linking Applications";
        ImageData: Record "Image Data";
        Members: Record Members;
        GeneralSetUp: Record "General Set-Up";
        Txt001: Label 'Amount should not exceed the cheque amount limit of %1';

    local procedure CalcAvailableBal()
    var
        TCharges: Decimal;
        AvailableBalance: Decimal;
        MinBalance: Decimal;
        Account: Record "Savings Accounts";
        ProdType: Record "Product Factory";
    begin

        CalcCharges;


        "Available Balance" := 0;
        MinBalance := 0;

        if Account.Get("Account No") then begin
            Account.CalcFields("Coop Transactions", Account.Balance, Account."Uncleared Cheques", Account."Authorised Over Draft", Account."Lien Placed", "ATM Transactions");

            ProdType.Reset;
            ProdType.SetRange(ProdType."Product ID", "Product Type");
            if ProdType.Find('-') then begin
                MinBalance := ProdType."Minimum Balance";

                "Available Balance" := (Account.Balance + Account."Authorised Over Draft") - (Account."Coop Transactions" + MinBalance + Account."Uncleared Cheques" + TChargeAmount + Account."Lien Placed" + Account."ATM Transactions");

                if Type = Type::"Cash Withdrawal" then
                    "New Account Balance" := "Available Balance" - Amount
                else
                    if Type = Type::"Cash Deposit" then
                        "New Account Balance" := "Available Balance" + Amount
                    else
                        if Type = Type::"Bankers Cheque" then
                            "New Account Balance" := "Available Balance" - Amount
            end;
        end;
    end;

    local procedure CalcCharges()
    begin

        GenSetup.Get;

        TChargeAmount := 0;



        TransactionCharges.Reset;
        TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
        if TransactionCharges.Find('-') then begin
            repeat

                ChargeAmount := 0;

                if (TransactionCharges."Transaction Charge Category" = TransactionCharges."Transaction Charge Category"::Normal) or
                (TransactionCharges."Transaction Charge Category" = TransactionCharges."Transaction Charge Category"::"Stamp Duty") then begin


                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" = true then
                        ChargeAmount := (Amount * TransactionCharges."Percentage of Amount") * 0.01
                    else
                        ChargeAmount := TransactionCharges."Charge Amount";

                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin

                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                        TariffDetails.Reset;
                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                        if TariffDetails.Find('-') then begin
                            repeat
                                if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                    if TariffDetails."Use Percentage" = true then begin
                                        ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                    end else begin
                                        ChargeAmount := TariffDetails."Charge Amount";
                                    end;
                                end;
                            until TariffDetails.Next = 0;
                        end;
                    end;


                    TChargeAmount := TChargeAmount + ChargeAmount;

                    if TransactionCharges."Transaction Charge Category" <> TransactionCharges."Transaction Charge Category"::"Stamp Duty" then begin

                        //Excise Duty

                        TChargeAmount := TChargeAmount + (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                        ;
                    end;
                end;
            until TransactionCharges.Next = 0;
        end;



        //Charge withdrawal Frequency
        if Type = Type::"Cash Withdrawal" then begin
            if Account.Get("Account No") then begin
                if AccountTypes.Get(Account."Product Type") then begin
                    if Account."Last Withdrawal Date" <> 0D then begin
                        if CalcDate(AccountTypes."Withdrawal Interval", Account."Last Withdrawal Date") > Today then begin
                            //IF CALCDATE(AccountTypes."Withdrawal Interval",Account."Last Withdrawal Date") <= CALCDATE('1D',TODAY) THEN BEGIN



                            TransactionCharges.Reset;
                            TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                            if TransactionCharges.Find('-') then begin
                                repeat

                                    if (TransactionCharges."Transaction Charge Category" = TransactionCharges."Transaction Charge Category"::"Withdrawal Frequency") then begin



                                        ChargeAmount := 0;
                                        if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" = true then
                                            ChargeAmount := (Amount * TransactionCharges."Percentage of Amount") * 0.01
                                        else
                                            ChargeAmount := TransactionCharges."Charge Amount";

                                        if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin

                                            TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                            TariffDetails.Reset;
                                            TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                            if TariffDetails.Find('-') then begin
                                                repeat
                                                    if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                                        if TariffDetails."Use Percentage" = true then begin
                                                            ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                                        end else begin
                                                            ChargeAmount := TariffDetails."Charge Amount";
                                                        end;
                                                    end;
                                                until TariffDetails.Next = 0;
                                            end;
                                        end;


                                        TChargeAmount := TChargeAmount + ChargeAmount;


                                        if TransactionCharges."Transaction Charge Category" <> TransactionCharges."Transaction Charge Category"::"Stamp Duty" then begin

                                            //Excise Duty


                                            TChargeAmount := TChargeAmount + (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                                        end;
                                    end;
                                until TransactionCharges.Next = 0;
                            end;

                        end;


                    end;
                end;
            end;
        end;
        //Charge withdrawal Frequency



        //Penalty of maximum amount on transaction
        if Type = Type::"Cash Withdrawal" then begin
            if TransType.Get("Transaction Type") then begin

                Trans.Reset;
                Trans.SetRange(Trans."Transaction Date", Today);
                Trans.SetRange(Trans."Account No", "Account No");
                Trans.SetRange(Posted, true);
                Trans.SetRange(Trans.Type, Trans.Type::"Cash Withdrawal");
                if Trans.FindSet then begin
                    Trans.CalcSums(Trans.Amount);


                end;
            end;

            if Trans.Amount > TransType."Upper Limit" then begin


                //Charges
                TCharges := 0;

                TransactionCharges.Reset;
                TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Type");
                if TransactionCharges.Find('-') then begin
                    repeat

                        if (TransactionCharges."Transaction Charge Category" = TransactionCharges."Transaction Charge Category"::"Withdrawn Amount") then begin



                            ChargeAmount := 0;
                            if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" = true then
                                ChargeAmount := (Amount * TransactionCharges."Percentage of Amount") * 0.01
                            else
                                ChargeAmount := TransactionCharges."Charge Amount";

                            if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin

                                TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                TariffDetails.Reset;
                                TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                if TariffDetails.Find('-') then begin
                                    repeat
                                        if (Amount >= TariffDetails."Lower Limit") and (Amount <= TariffDetails."Upper Limit") then begin
                                            if TariffDetails."Use Percentage" = true then begin
                                                ChargeAmount := Amount * TariffDetails.Percentage * 0.01;
                                            end else begin
                                                ChargeAmount := TariffDetails."Charge Amount";
                                            end;
                                        end;
                                    until TariffDetails.Next = 0;
                                end;
                            end;

                            TChargeAmount := TChargeAmount + ChargeAmount;

                            if TransactionCharges."Transaction Charge Category" <> TransactionCharges."Transaction Charge Category"::"Stamp Duty" then begin

                                //Excise Duty

                                TChargeAmount := TChargeAmount + (ChargeAmount * GenSetup."Excise Duty (%)") * 0.01;
                            end;
                        end;
                    until TransactionCharges.Next = 0;
                end;
            end;
        end;

        //Penalty of maximum amount on transaction
    end;

    local procedure CLEARALL()
    begin
        "Account No" := '';
        "Member No." := '';
        "Account Name" := '';
        Amount := 0;
        "Transaction Type" := '';
        //Type:=Type::" ";
        "ID No" := '';
        "Book Balance" := 0;
        "Available Balance" := 0;
        "New Account Balance" := 0;
        Remarks := '';
        "Signing Instructions" := '';
        "Cheque Date" := 0D;
        "Cheque No" := '';
        "Product Type" := '';
    end;
}

