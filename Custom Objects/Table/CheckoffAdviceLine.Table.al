table 52185818 "Checkoff Advice Line"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Member No."; Code[20])
        {
            Editable = false;
            TableRelation = Members."No.";

            trigger OnValidate()
            begin

                if "Advice Type" = "Advice Type"::"New Loan" then begin
                    Period := Format(CalcDate('1M', Today), 0, Text000)
                end else
                    Period := Format(CalcDate('1M', Today), 0, Text000);
                // Period:=FORMAT(TODAY,0,Text000);

                "Captured  By" := UserId;
            end;
        }
        field(3; "Account No."; Code[20])
        {
            TableRelation = IF (Type = FILTER (Savings)) "Savings Accounts"."No." WHERE ("Member No." = FIELD ("Member No."))
            ELSE
            IF (Type = FILTER (Credit)) "Credit Accounts"."No." WHERE ("Member No." = FIELD ("Member No."));

            trigger OnValidate()
            begin
                if "Account No." <> '' then begin
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange("No.", "Account No.");
                    if SavingsAccounts.Find('-') then begin
                        Members.Reset;
                        Members.SetRange("No.", "Member No.");
                        if Members.Find('-') then begin
                            "Member No." := Members."No.";
                            Names := Members.Name;
                            "Payroll No" := Members."Payroll/Staff No.";
                            "Employer Code" := Members."Employer Code";
                            "Employer Account No." := SavingsAccounts."Employer Account No";
                            "Advice Date" := Today;
                            "Balance On" := SavingsAccounts."Employer Balance" + SavingsAccounts."Monthly Contribution";
                            "Product Type" := SavingsAccounts."Product Type";
                            Validate("Product Type");
                            Time := Time;
                        end;
                    end;

                    CreditAccounts.Reset;
                    CreditAccounts.SetRange("No.", "Account No.");
                    if CreditAccounts.Find('-') then begin
                        Members.Reset;
                        Members.SetRange("No.", "Member No.");
                        if Members.Find('-') then begin
                            "Member No." := Members."No.";
                            Names := Members.Name;
                            "Payroll No" := Members."Payroll/Staff No.";
                            "Employer Code" := Members."Employer Code";
                            "Advice Date" := Today;
                            "Product Type" := CreditAccounts."Product Type";
                            Validate("Product Type");
                            Time := Time;
                        end;
                    end;
                end;
            end;
        }
        field(4; Names; Text[50])
        {
        }
        field(5; "Employer Code"; Code[20])
        {
            TableRelation = Customer WHERE ("Account Type" = CONST (Employer));
        }
        field(6; "Loan No."; Code[20])
        {
            TableRelation = Loans."Loan No." WHERE ("Loan Account" = FIELD ("Account No."));

            trigger OnValidate()
            begin
                if Loans.Get("Loan No.") then begin
                    "Balance On" := Loans."Employer Balance";
                    "Employer Account No." := Loans."Employer Loan No.";
                end;
            end;
        }
        field(7; Period; Code[20])
        {
            Editable = false;
        }
        field(8; "Amount On"; Decimal)
        {
        }
        field(9; "Amount Off"; Decimal)
        {
        }
        field(10; "Balance On"; Decimal)
        {
        }
        field(11; "Balance Off"; Decimal)
        {
        }
        field(12; "Product Type"; Code[20])
        {

            trigger OnValidate()
            begin
                if ProductFactory.Get("Product Type") then begin
                    "Product Search Code" := ProductFactory."Search Code";
                    "Product Name" := ProductFactory."Product Description";

                end;
            end;
        }
        field(13; "Advice Date"; Date)
        {
        }
        field(14; Interest; Decimal)
        {
        }
        field(15; "Advice Method"; Option)
        {
            OptionCaption = 'Changes,Everything';
            OptionMembers = Changes,Everything;
        }
        field(16; "ID No."; Code[11])
        {
        }
        field(17; "Advice Header No."; Code[10])
        {
        }
        field(18; Processed; Boolean)
        {
        }
        field(19; "Payroll No"; Code[20])
        {
        }
        field(20; "Advice Type"; Option)
        {
            OptionCaption = ' ,Stoppage,Adjustment,New Loan,Variations,New,Refeeding,New Guar Loan';
            OptionMembers = " ",Stoppage,Adjustment,"New Loan",Variations,New,Refeeding,"New Guar Loan";

            trigger OnValidate()
            begin
                Validate("Member No.");
            end;
        }
        field(21; "Product Search Code"; Code[20])
        {
        }
        field(22; "Document No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(23; Transfered; Boolean)
        {
        }
        field(24; "Product Name"; Text[60])
        {
        }
        field(25; "Employer Account No."; Code[20])
        {
        }
        field(26; Time; Time)
        {
        }
        field(27; Type; Option)
        {
            OptionCaption = 'Savings,Credit';
            OptionMembers = Savings,Credit;

            trigger OnValidate()
            begin
                //*********Variation********//
                if "Advice Type" = "Advice Type"::Variations then begin
                    if SavingsAccounts.Get("Account No.") then
                        "Balance On" := SavingsAccounts."Employer Balance";
                    if Loans.Get("Loan No.") then
                        "Balance On" := Loans."Employer Balance";

                    if ("Amount On" = "Amount Off") or ("Amount Off" = 0) or ("Amount On" = 0) then
                        Error('Kindly confirm on Amount off/On');
                end else
                    if "Advice Type" = "Advice Type"::Adjustment then begin
                        if SavingsAccounts.Get("Account No.") then begin
                            SavingsAccounts.CalcFields("Balance (LCY)");
                            "Balance On" := SavingsAccounts."Balance (LCY)";
                        end;
                        if Loans.Get("Loan No.") then begin
                            Loans.CalcFields("Outstanding Balance");
                            "Balance On" := Loans."Outstanding Balance";
                        end;
                        if "Amount On" <> "Amount On" then
                            Error('Kindly confirm Amount off/On');
                    end else
                        if "Advice Type" = "Advice Type"::Stoppage then begin
                            if SavingsAccounts.Get("Account No.") then
                                "Balance On" := SavingsAccounts."Employer Balance";
                            if Loans.Get("Loan No.") then
                                "Balance On" := Loans."Employer Balance";

                            if ("Amount Off" = 0) or ("Amount On" <> 0) or ("Balance On" <> 0) then
                                Error('Kindly confirm on Amount off/On');
                        end else
                            if "Advice Type" = "Advice Type"::New then begin
                                if SavingsAccounts.Get("Account No.") then
                                    "Balance On" := SavingsAccounts."Employer Balance";
                                if Loans.Get("Loan No.") then
                                    "Balance On" := Loans."Employer Balance";

                                if ("Amount Off" <> 0) or ("Amount On" <> 0) or ("Balance On" <> 0) then
                                    Error('Kindly confirm on Amount off/On');
                            end;
            end;
        }
        field(28; "Modified By"; Code[50])
        {
        }
        field(29; "Captured  By"; Code[50])
        {
        }
        field(30; "System Created"; Boolean)
        {
        }
        field(31; "DOD Options"; Option)
        {
            OptionCaption = ' ,Army,Officers,Navy,Army-Const,Air Force';
            OptionMembers = " ",Army,Officers,Navy,"Army-Const","Air Force";
        }
        field(32; Manual; Boolean)
        {
        }
        field(33; "SAD No."; Code[50])
        {
            CalcFormula = Lookup (Loans."SAD No." WHERE ("Loan No." = FIELD ("Loan No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Advice Date", Time, "Member No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Processed = true then
            Error(Txt0001);
    end;

    trigger OnModify()
    begin
        "Modified By" := UserId;
    end;

    var
        Text000: Label '<Month Text>';
        Txt0001: Label 'You cannot delete processed advice';
        ProductFactory: Record "Product Factory";
        SavingsAccounts: Record "Savings Accounts";
        Members: Record Members;
        CreditAccounts: Record "Credit Accounts";
        Loans: Record Loans;

    local procedure GetBalance(CheckoffAdviceLine: Record "Checkoff Advice Line") Bal: Decimal
    var
        Loans: Record Loans;
        SavingsAccounts: Record "Savings Accounts";
    begin
    end;
}

