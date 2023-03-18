table 52185796 "Cashier Transaction Lines"
{
    //DrillDownPageID = "Cashier Transaction Lines";
    //LookupPageID = "Cashier Transaction Lines";

    fields
    {
        field(1; "Transaction No"; Code[20])
        {
        }
        field(2; "Member No"; Code[20])
        {
        }
        field(3; "Transaction Type"; Option)
        {
            OptionCaption = ' ,Loan,Repayment,Interest Due,Interest Paid,Bills';
            OptionMembers = " ",Loan,Repayment,"Interest Due","Interest Paid",Bills;

            trigger OnValidate()
            var
                ErrorOnInvalidTransType: Label 'Transaction type -%1- is disabled on this document. Please contact your system administrator.';
            begin
                case "Transaction Type" of
                    "Transaction Type"::Loan:
                        begin
                            Error(ErrorOnInvalidTransType, "Transaction Type");
                        end;
                end;
            end;
        }
        field(4; "Loan No"; Code[20])
        {
            TableRelation = Loans WHERE("Member No." = FIELD("Member No"),
                                         Posted = CONST(true),
                                         "Loan Account" = FIELD("Account No"));

            trigger OnValidate()
            begin
                TestField("Transaction Type");
                if Loans.Get(Rec."Loan No") then begin
                    Loans.CalcFields("Outstanding Balance", "Outstanding Bills");
                    "OutStanding Loan" := Loans."Outstanding Balance";
                    "Outstanding Bill" := Loans."Outstanding Bills";
                end;
            end;
        }
        field(5; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                TestField("Account No");
                //TESTFIELD("Loan No");
                if Type = Type::Credit then begin

                    TestField("Loan No");
                    TestField("Transaction Type");

                end;

                if Amount < 0 then
                    Error('Amount cannot be less than zero');
                Validate("Account No");

                DiffReg := 0;

                if (savingsacc.Get("Account No")) and (Type = Type::Savings) then begin
                    savingsacc.CalcFields(Balance);

                    case savingsacc."Product Category" of
                        savingsacc."Product Category"::"Registration Fee":
                            begin

                                if ProductF.Get("Product Type") then begin
                                    ProductF.TestField("Minimum Balance");
                                    DiffReg := (ProductF."Minimum Balance" - savingsacc.Balance);
                                    //MESSAGE('The difference is %1',DiffReg);
                                    if DiffReg >= 0 then begin

                                        if Amount >= DiffReg then
                                            Amount := DiffReg else
                                            Amount := Amount;

                                    end else begin
                                        Amount := 0;
                                    end;

                                end;
                            end;
                    end;
                end;

                case "Transaction Type" of
                    "Transaction Type"::Repayment:
                        begin

                            TestField("Loan No");
                            if Loans.Get("Loan No") then begin
                                Loans.CalcFields("Outstanding Balance");

                                if Amount >= Loans."Outstanding Balance" then
                                    Amount := Loans."Outstanding Balance" else
                                    Amount := Amount;

                            end;
                        end;
                    "Transaction Type"::"Interest Paid":
                        begin

                            TestField("Loan No");
                            if Loans.Get("Loan No") then begin
                                Loans.CalcFields("Outstanding Interest");

                                if Amount >= Loans."Outstanding Interest" then
                                    Amount := Loans."Outstanding Interest" else
                                    Amount := Amount;

                            end;
                        end;

                    "Transaction Type"::"Interest Due":
                        begin

                            TestField("Loan No");
                            if Loans.Get("Loan No") then begin
                                Loans.CalcFields("Outstanding Interest");

                                if Amount >= Loans."Outstanding Interest" then
                                    Amount := Loans."Outstanding Interest" else
                                    Amount := Amount;

                            end;
                        end;


                    "Transaction Type"::Bills:
                        begin

                            TestField("Loan No");
                            if Loans.Get("Loan No") then begin
                                Loans.CalcFields("Outstanding Balance");

                                if Amount >= Loans."Outstanding Balance" then
                                    Amount := Loans."Outstanding Balance" else
                                    Amount := Amount;

                            end;
                        end;


                end;


                DiffShare := 0;

                ///Control Share capital
                savingsacc.Reset;
                savingsacc.SetRange("No.", "Account No");
                savingsacc.SetRange(savingsacc."Product Category", savingsacc."Product Category"::"Share Capital");
                //MESSAGE('I got here 1');
                if savingsacc.Find('-') then begin
                    savingsacc.CalcFields(savingsacc.Balance);
                    if members.Get(savingsacc."Member No.") then begin
                        //  MESSAGE('The member is %1',members.Name);
                        members.TestField(members."Member Category");
                        if memberCat.Get(members."Member Category") then begin
                            //   MESSAGE('I got here');

                            DiffShare := memberCat."Share Capital" - savingsacc.Balance;
                            if DiffShare > 0 then begin
                                if Amount >= DiffShare then
                                    Amount := DiffShare else
                                    Amount := Amount;
                            end else begin
                                Amount := 0;
                            end;

                        end;
                    end;
                end;
                ///Control Share capital
            end;
        }
        field(6; "Transaction Date"; Date)
        {
        }
        field(7; "Account No"; Code[20])
        {
            NotBlank = true;
            TableRelation = IF (Type = CONST(Credit)) "Credit Accounts" WHERE("Member No." = FIELD("Member No"))
            ELSE
            IF (Type = CONST(Savings)) "Savings Accounts" WHERE("Member No." = FIELD("Member No"));

            trigger OnValidate()
            begin
                if creditacc.Get("Account No") then begin
                    "Member No" := creditacc."Member No.";
                    "Product Type" := creditacc."Product Type";
                end else
                    if savingsacc.Get("Account No") then begin
                        "Member No" := savingsacc."Member No.";
                        "Product Type" := savingsacc."Product Type";
                    end;
            end;
        }
        field(8; Type; Option)
        {
            OptionCaption = 'Savings,Credit';
            OptionMembers = Savings,Credit;
        }
        field(9; "Product Type"; Code[80])
        {
            Editable = false;
            TableRelation = "Product Factory"."Product ID";
        }
        field(10; "OutStanding Loan"; Decimal)
        {
        }
        field(11; "Outstanding Bill"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Transaction No", "Account No", Amount)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if CashTrans.Get("Transaction No") then begin
            "Member No" := CashTrans."Member No.";
        end;
    end;

    var
        creditacc: Record "Credit Accounts";
        savingsacc: Record "Savings Accounts";
        ProductF: Record "Product Factory";
        DiffReg: Decimal;
        Loans: Record Loans;
        members: Record Members;
        memberCat: Record "Member Category";
        DiffShare: Decimal;
        CashTrans: Record "Cashier Transactions";
}

