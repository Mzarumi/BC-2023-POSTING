table 52185784 "Salary Lines"
{

    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            NotBlank = false;
        }
        field(2; "Account No."; Code[20])
        {
            TableRelation = "Savings Accounts"."No.";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if SalaryHeader.Get("Salary Header No.") then
                    SalaryHeader.TestField("Employer Code");
                Acc.Reset;
                Acc.SetRange(Acc."No.", "Account No.");
                Acc.SetRange("Employer Code", SalaryHeader."Employer Code");
                if Acc.Find('-') then begin
                    if "Staff No." = '' then
                        "Staff No." := Acc."Payroll/Staff No.";
                    "Member No." := Acc."Member No.";
                    Status := Acc.Status;
                    Blocked := Acc.Blocked;
                    Name := Acc.Name;
                end;

                if "Account No." = '' then begin
                    "Member No." := '';
                    Name := '';
                    Amount := 0;
                end;
            end;
        }
        field(3; "Staff No."; Code[20])
        {

            trigger OnValidate()
            begin
                if SalaryHeader.Get("Salary Header No.") then
                    SalaryHeader.TestField("Employer Code");
                Acc.Reset;
                Acc.SetRange(Acc."Payroll/Staff No.", "Staff No.");
                Acc.SetRange("Employer Code", SalaryHeader."Employer Code");
                if Acc.Find('-') then begin
                    if "Account No." = '' then
                        "Account No." := Acc."No.";
                    "Member No." := Acc."Member No.";
                    Status := Acc.Status;
                    Blocked := Acc.Blocked;
                    Name := Acc.Name;
                end;
            end;
        }
        field(4; Name; Text[50])
        {
            Editable = false;
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; "Account Not Found"; Boolean)
        {
            Editable = false;
        }
        field(7; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(8; Processed; Boolean)
        {
        }
        field(9; "Document No."; Code[20])
        {
        }
        field(10; Date; Date)
        {
        }
        field(11; "Multiple Salary"; Boolean)
        {
        }
        field(12; Reversed; Boolean)
        {
        }
        field(13; "Account Name"; Text[50])
        {
        }
        field(14; "ID No."; Code[30])
        {
            Editable = true;
        }
        field(15; Closed; Boolean)
        {
        }
        field(16; "Blocked Accounts"; Boolean)
        {
            Editable = false;
        }
        field(17; "Salary Header No."; Code[50])
        {
        }
        field(18; "Employer Code"; Code[50])
        {
            Editable = false;

            trigger OnValidate()
            begin
                /*
               IF "Employer Code"<> SalProcessingHeader."Employer Code" THEN  BEGIN
               "Employer/ Staff Mismatch":=TRUE;
               MODIFY;
               END;
               */

            end;
        }
        field(19; "Employer/ Staff Mismatch"; Boolean)
        {
        }
        field(20; "Member No."; Code[20])
        {
        }
        field(21; Status; Option)
        {
            Editable = true;
            OptionCaption = ' ,New,Active,Dormant,Frozen,Withdrawal Application,Withdrawn,Deceased,Defaulter,Closed';
            OptionMembers = " ",New,Active,Dormant,Frozen,"Withdrawal Application",Withdrawn,Deceased,Defaulter,Closed;

            trigger OnValidate()
            begin
                //IF (Status<>Status::New) OR (Status<>Status::Closed) THEN
                //Blocked:=Blocked::All;
            end;
        }
        field(22; Blocked; Option)
        {
            OptionCaption = ' ,Credit,Debit,All';
            OptionMembers = " ",Credit,Debit,All;
        }
        field(23; Posted; Boolean)
        {
            Editable = false;
        }
        field(24; "Posted By"; Code[30])
        {
        }
        field(25; "Posting Date"; Date)
        {
            Editable = false;
        }
        field(26; "Posting Time"; Time)
        {
            Editable = false;
        }
        field(27; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,Blocked);
            end;
        }
        field(28; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE ("Global Dimension No." = CONST (2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Last Date Modified");
            end;
        }
    }

    keys
    {
        key(Key1; "Salary Header No.", "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Acc: Record "Savings Accounts";
        SalaryHeader: Record "Salary Header";
}

