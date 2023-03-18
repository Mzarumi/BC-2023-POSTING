table 52185819 "Checkoff Header"
{
    //DrillDownPageID = "Checkoff Header List";
    //LookupPageID = "Checkoff Header List";

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    NoSetup.Get();
                    //NoSeriesMgtTestManual(NoSetup."Checkoff No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "No. Series"; Code[10])
        {
        }
        field(3; "Date Entered"; Date)
        {
        }
        field(4; "Time Entered"; Time)
        {
        }
        field(5; "Entered By"; Code[50])
        {
        }
        field(6; "Posting Date"; Date)
        {
        }
        field(7; "Account Type"; Option)
        {
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Savings,Credit';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        }
        field(8; "Account No."; Code[20])
        {
            TableRelation = IF ("Account Type" = FILTER(Customer)) Customer."No."
            ELSE
            IF ("Account Type" = FILTER("Bank Account")) "Bank Account"."No.";

            trigger OnValidate()
            begin
                if Customer.Get("Account No.") then begin
                    "Account Name" := Customer.Name;
                end else
                    "Account Name" := '';

                if "Posting Period" <> 0D then begin
                    Validate("Posting Period");
                    Validate(Type);
                end;

                Validate("Employer Code", "Account No.");
            end;
        }
        field(9; "Account Name"; Text[50])
        {
        }
        field(10; "Document No."; Code[20])
        {
            Editable = false;
        }
        field(11; Amount; Decimal)
        {
        }
        field(12; "Scheduled Amount"; Decimal)
        {
            CalcFormula = Sum("Checkoff Lines".Amount WHERE("Checkoff Header" = FIELD("No.")));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;
        }
        field(13; "Employer Code"; Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate()
            begin
                if Customer.Get("Employer Code") then begin
                    "Employer Name" := Customer.Name;
                end else
                    "Employer Name" := '';
            end;
        }
        field(14; "Employer Name"; Text[50])
        {
            Editable = false;
        }
        field(15; "Total Count"; Integer)
        {
            CalcFormula = Count("Checkoff Lines" WHERE("Checkoff Header" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(16; Description; Text[50])
        {
        }
        field(17; Posted; Boolean)
        {
        }
        field(18; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(19; "Posted Records"; Integer)
        {
            CalcFormula = Count("Checkoff Lines" WHERE("Checkoff Header" = FIELD("No."),
                                                        Posted = FILTER(true)));
            FieldClass = FlowField;
        }
        field(20; "Vendor No"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(21; "Posting Period"; Date)
        {
            TableRelation = "Interest Due Period"."Interest Due Date";

            trigger OnValidate()
            begin
                TestField("Account No.");

                // "Document No." := "Account No." + '_' + Format(DetermineMonth(Date2DMY("Posting Period", 2))) + '/' + Format(Date2DMY("Posting Period", 3));

                Description := "Document No.";
            end;
        }
        field(22; Type; Option)
        {
            OptionCaption = ' ,Checkoff,Pension,STO,Allowance,Salary';
            OptionMembers = " ",Checkoff,Pension,STO,Allowance,Salary;

            trigger OnValidate()
            var
                Abreviation: Text;
            begin
                Abreviation := '';
                TestField("Posting Period");
                Validate("Posting Period");
                if Type <> Type::" " then begin
                    if Type = Type::Checkoff then
                        Abreviation := 'CHK'
                    else
                        if Type = Type::Pension then
                            Abreviation := 'PEN'
                        else
                            if Type = Type::STO then
                                Abreviation := 'STO'
                            else
                                if Type = Type::Allowance then
                                    Abreviation := 'ALL'
                                else
                                    if Type = Type::Salary then
                                        Abreviation := 'SAL';
                    Description := Description + ' ' + Abreviation;
                    "Document No." := "Document No." + ' ' + Abreviation;
                end
            end;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."Checkoff No.");
            //NoSeriesMgtInitSeries(NoSetup."Checkoff No.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Date Entered" := Today;
        "Time Entered" := Time;
        "Entered By" := UserId;
    end;

    var
        NoSetup: Record "Credit Nos. Series";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        Customer: Record Customer;

    //[Scope('Internal')]
    procedure DetermineMonth(Month: Integer) StrMonth: Text[6]
    begin
        if Month = 1 then begin StrMonth := 'Jan' end;
        if Month = 2 then begin StrMonth := 'Feb' end;
        if Month = 3 then begin StrMonth := 'Mar' end;
        if Month = 4 then begin StrMonth := 'Apr' end;
        if Month = 5 then begin StrMonth := 'May' end;
        if Month = 6 then begin StrMonth := 'Jun' end;
        if Month = 7 then begin StrMonth := 'Jul' end;
        if Month = 8 then begin StrMonth := 'Aug' end;
        if Month = 9 then begin StrMonth := 'Sep' end;
        if Month = 10 then begin StrMonth := 'Oct' end;
        if Month = 11 then begin StrMonth := 'Nov' end;
        if Month = 12 then begin StrMonth := 'Dec' end;
    end;
}

