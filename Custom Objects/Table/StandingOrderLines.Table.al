table 52185718 "Standing Order Lines"
{

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; "Document No."; Code[10])
        {
        }
        field(17; "Destination Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,External,Fixed Asset,IC Partner,Internal,Credit';
            OptionMembers = "G/L Account",Customer,Vendor,External,"Fixed Asset","IC Partner",Internal,Credit;

            trigger OnValidate()
            begin
                if "Destination Account Type" = "Destination Account Type"::External then begin
                    if STOHeader.Get("Document No.") then begin
                        if STOHeader."Allow Partial Deduction" = true then
                            Error('An external standing order cannot be partially deducted');
                        "Member No" := STOHeader."Member No.";
                    end;
                end;


                // IF STOHeader.GET("Document No.") THEN BEGIN
                //    IF STOHeader."Income Type"=STOHeader."Income Type"::Periodic THEN BEGIN
                //      IF "Destination Account Type" <> Rec."Destination Account Type"::Credit THEN
                //        ERROR('Destination account type must be credit');
                //    END;
                // END;

                if STOHeader.Get("Document No.") then begin
                    if STOHeader."Income Type" = STOHeader."Income Type"::Salary then begin
                        if ("Destination Account Type" = Rec."Destination Account Type"::External) then
                            Error('Destination account type cannot be external');
                    end;
                end;
            end;
        }
        field(18; "Destination Account No."; Code[50])
        {
            TableRelation = IF ("Destination Account Type" = CONST ("G/L Account")) "G/L Account"
            ELSE
            IF ("Destination Account Type" = CONST (Customer)) Customer
            ELSE
            IF ("Destination Account Type" = CONST (Vendor)) Vendor
            ELSE
            IF ("Destination Account Type" = CONST ("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Destination Account Type" = CONST ("IC Partner")) "IC Partner"
            ELSE
            IF ("Destination Account Type" = CONST (Internal)) "Savings Accounts" WHERE ("Product Category" = FILTER (" " | "Share Capital" | "Junior Savings" | "Deposit Contribution" | Benevolent | "Investment Account"))
            ELSE
            IF ("Destination Account Type" = CONST (Credit)) "Credit Accounts" WHERE ("Member No." = FIELD ("Member No"));

            trigger OnValidate()
            begin
                if "Destination Account Type" = "Destination Account Type"::Internal then begin
                    if Account.Get("Destination Account No.") then begin
                        "Destination Account Name" := Account.Name;
                    end;
                end;

                if "Destination Account Type" = "Destination Account Type"::External then begin
                    if BankAcc.Get("Destination Account No.") then begin
                        //"Destination Account Name":=BankAcc.Name;
                        //"Bank Code":=BankAcc."Bank No.";



                        if STOHeader.Get("Document No.") then begin
                            if STOHeader."Allow Partial Deduction" = true then
                                Error('An external standing order cannot be partially deducted');
                        end;
                    end;

                    if "Destination Account Type" = "Destination Account Type"::External then begin
                        if StrLen("Destination Account No.") > 14 then
                            Error('Invalid Bank Account No. Please enter a bank account with less than 15 digits.');
                    end;


                end;

                if "Destination Account Type" = "Destination Account Type"::Credit then begin
                    if Cust.Get("Destination Account No.") then begin
                        "Destination Account Name" := Cust.Name;
                    end;
                end;

                /*
                STOLines.RESET;
                STOLines.SETRANGE(STOLines."Document No.","Document No.");
                IF STOLines.FIND('-')=TRUE THEN //BEGIN
                //IF STOLines.COUNT>1 THEN
                  ERROR('Only one entry is allowed for this type of standing order, Please delete the lines before proceeding');
                //END;
                */

            end;
        }
        field(19; "Destination Account Name"; Text[80])
        {
            Editable = false;
        }
        field(20; "Loan No."; Code[20])
        {
            TableRelation = IF ("Destination Account No." = FILTER (<> '')) Loans WHERE ("Loan Account" = FIELD ("Destination Account No."));
        }
        field(21; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                if Amount < 0 then
                    Error(LessThanZeroAmount);


                if "Destination Account Type" = "Destination Account Type"::Credit then begin
                    if "Loan No." = '' then
                        Error('Kindly specify the loan no. before proceeding');

                end;

                "Remaining Amount" := Amount;
            end;
        }
        field(22; "Bank Code"; Code[10])
        {
            TableRelation = "Bank Code Structure"."Bank Code";

            trigger OnValidate()
            begin
                if "Destination Account Type" = "Destination Account Type"::Internal then
                    Error('Only applicable FOR external STOs');

                BankCodeStructure.Reset;
                BankCodeStructure.SetRange(BankCodeStructure."Bank Code", "Bank Code");
                if BankCodeStructure.Find('-') then
                    "Bank Name" := BankCodeStructure."Bank Name";
            end;
        }
        field(23; "Branch Code"; Code[10])
        {
            TableRelation = "Bank Code Structure"."Branch Code";

            trigger OnValidate()
            begin
                if "Destination Account Type" <> "Destination Account Type"::External then
                    Error('Only applicable for external STOs');


                BankCodeStructure.Reset;
                BankCodeStructure.SetRange(BankCodeStructure."Branch Code", "Branch Code");
                if BankCodeStructure.Find('-') then begin
                    "Bank Code" := BankCodeStructure."Bank Code";
                    "Bank Name" := BankCodeStructure."Bank Name";
                    "Branch Name" := BankCodeStructure.Branch;
                end;

                if "Branch Code" = '' then begin
                    "Bank Code" := '';
                    "Bank Name" := '';
                    "Bank Account No." := '';
                end;
            end;
        }
        field(24; "Bank Name"; Text[100])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "Destination Account Type" <> "Destination Account Type"::External then
                    Error('Only applicable for external STOs');
            end;
        }
        field(25; "Bank Account No."; Code[15])
        {

            trigger OnValidate()
            begin
                if "Destination Account Type" <> "Destination Account Type"::External then
                    Error('Only applicable for external STOs');

                // //*
                // IF "Destination Account Type" = "Destination Account Type"::External THEN BEGIN
                // IF STRLEN("Bank Account No.") <>13 THEN
                // ERROR('Invalid Bank account No. Please enter the correct Bank Account No.');
                // END;
            end;
        }
        field(26; Balance; Decimal)
        {
        }
        field(27; "Branch Name"; Text[150])
        {
        }
        field(28; "Member No"; Code[20])
        {
        }
        field(29; "OutStanding Bills"; Decimal)
        {
            CalcFormula = Sum ("Credit Ledger Entry".Amount WHERE ("Loan No" = FIELD ("Loan No."),
                                                                  "Transaction Type" = FILTER (Bills)));
            FieldClass = FlowField;
        }
        field(30; "Amount Deducted"; Decimal)
        {
        }
        field(31; "Remaining Amount"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Destination Account No.", "Loan No.")
        {
            Clustered = true;
        }
        key(Key2; "Destination Account Type")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Validate("Destination Account Type");
        if STOHeader.Get("Document No.") then begin
            "Member No" := STOHeader."Member No.";
        end;
    end;

    trigger OnModify()
    begin
        if STOHeader.Get("Document No.") then begin
            "Member No" := STOHeader."Member No.";
        end;
    end;

    var
        Account: Record "Savings Accounts";
        BankAcc: Record "Bank Account";
        BankCodeStructure: Record "Bank Code Structure";
        Cust: Record "Credit Accounts";
        StrTel: Text;
        LessThanZeroAmount: Label 'Amount cannot be less than zero (0)';
        STOHeader: Record "Standing Order Header";
        STOLines: Record "Standing Order Lines";
}

