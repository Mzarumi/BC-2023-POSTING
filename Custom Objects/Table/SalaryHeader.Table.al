table 52185783 "Salary Header"
{
    //DrillDownPageID = "Salary Lists";
    //LookupPageID = "Salary Lists";

    fields
    {
        field(1; No; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    NoSetup.Get();
                    //NoSeriesMgtTestManual(NoSetup."Salary Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "No. Series"; Code[20])
        {
        }
        field(3; Posted; Boolean)
        {
            Editable = false;
        }
        field(6; "Posted By"; Code[50])
        {
            Editable = false;
        }
        field(7; "Date Entered"; Date)
        {
        }
        field(9; "Entered By"; Text[50])
        {
        }
        field(10; Remarks; Text[150])
        {
        }
        field(19; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(20; "Time Entered"; Time)
        {
        }
        field(21; "Posting date"; Date)
        {
            Editable = false;
        }
        field(22; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer/Employer,Vendor,Bank Account,Fixed Asset';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(23; "Account No"; Code[30])
        {
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account"
            ELSE
            IF ("Account Type" = CONST(Customer)) Customer WHERE("Account Type" = CONST(Employer))
            ELSE
            IF ("Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "Fixed Asset";

            trigger OnValidate()
            begin

                if "Account Type" = "Account Type"::Customer then begin
                    cust.Reset;
                    cust.SetRange(cust."No.", "Account No");
                    if cust.Find('-') then begin
                        "Account Name" := cust.Name;
                    end;
                end;

                if "Account Type" = "Account Type"::"G/L Account" then begin
                    "GL Account".Reset;
                    "GL Account".SetRange("GL Account"."No.", "Account No");
                    if "GL Account".Find('-') then begin
                        "Account Name" := "GL Account".Name;
                    end;
                end;

                if "Account Type" = "Account Type"::"Bank Account" then begin
                    BANKACC.Reset;
                    BANKACC.SetRange(BANKACC."No.", "Account No");
                    if BANKACC.Find('-') then begin
                        "Account Name" := BANKACC.Name;

                    end;
                end;
            end;
        }
        field(24; "Document No"; Code[20])
        {
        }
        field(25; Amount; Decimal)
        {
        }
        field(26; "Scheduled Amount"; Decimal)
        {
            CalcFormula = Sum("Salary Lines".Amount WHERE("Salary Header No." = FIELD(No)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "Total Count"; Integer)
        {
            CalcFormula = Count("Salary Lines" WHERE("Salary Header No." = FIELD(No)));
            FieldClass = FlowField;
        }
        field(28; "Account Name"; Text[50])
        {
            Editable = false;
        }
        field(29; "Employer Code"; Code[30])
        {
            TableRelation = Customer."No.";
        }
        field(30; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(31; "Income Type"; Option)
        {
            OptionCaption = 'Salary,Dividend,Dependant,Pension,Milk,Tea,Coffee';
            OptionMembers = Salary,Dividend,Dependant,Pension,Milk,Tea,Coffee;
        }
        field(32; "Transaction Type"; Code[20])
        {
            TableRelation = "Transaction Types".Code WHERE(Type = CONST("Salary Processing"));

            trigger OnValidate()
            begin
                "Document No" := No;
            end;
        }
        field(33; Validated; Boolean)
        {
        }
        field(34; "Mutiple Salaries Checked"; Boolean)
        {
        }
        field(35; "Last Loan Issue Date"; Date)
        {
        }
        field(36; "Donnot Recover"; Boolean)
        {
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
            NoSetup.TestField(NoSetup."Salary Nos.");
            //NoSeriesMgtInitSeries(NoSetup."Salary Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;

        "Entered By" := UpperCase(UserId);
        "Date Entered" := Today;
        "Time Entered" := Time;
        "Posting date" := Today;
    end;

    var
        NoSetup: Record "Banking No Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        "GL Account": Record "G/L Account";
        BANKACC: Record "Bank Account";
        cust: Record Customer;
}

