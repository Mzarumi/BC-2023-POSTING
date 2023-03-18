table 52186194 "PR Board Transactions"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Editable = false;
            TableRelation = "prBoard Employees"."No.";
        }
        field(2; "Code"; Text[30])
        {
            Editable = true;
            TableRelation = "prBoard Earnings".Code;

            trigger OnValidate()
            begin

                //GetPayPeriod;
                Date := PayStartDate;
                // "Pay Period":=PayPeriodText;
                Earn.Reset;
                Earn.SetRange(Earn.Code, Code);
                if Earn.Find('-') then begin
                    Name := Earn.Description;
                    "G/L Accounts" := Earn."G/L Account";
                end;
            end;
        }
        field(3; Description; Text[100])
        {
            Editable = true;
        }
        field(4; Amount; Decimal)
        {
            Editable = true;
        }
        field(5; Date; Date)
        {
            Editable = true;
            TableRelation = "PR Payroll Periods"."Date Opened";

            trigger OnValidate()
            begin
                /*PayPeriod.RESET;
                PayPeriod.SETRANGE(PayPeriod.Closed,FALSE);
                IF PayPeriod.FIND('-') THEN BEGIN
                Refernce:=PayPeriod."Period Name";
                MODIFY;
                END;*/

            end;
        }
        field(6; "Line No"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(7; Name; Text[50])
        {
            Editable = true;
        }
        field(8; Closed; Boolean)
        {
            Editable = false;
        }
        field(9; "Is Paye"; Boolean)
        {
            Editable = false;
        }
        field(10; "Is Net"; Boolean)
        {
            Editable = false;
        }
        field(11; Refernce; Text[30])
        {
            Editable = false;
        }
        field(12; "G/L Accounts"; Code[50])
        {
            Editable = false;
            TableRelation = "G/L Account"."No.";
        }
        field(13; Blocked; Boolean)
        {

            trigger OnValidate()
            begin
                if not Blocked then begin
                    if Confirm('Unblock this transaction [%1 - %2]', false, "No.", Date) = false then begin
                        Error('Aborted');
                    end else begin
                        Blocked := false;
                    end;
                end else begin
                    if Confirm('Block this transaction [%1 - %2]', false, "No.", Date) = false then begin
                        Error('Aborted');
                    end else begin
                        Blocked := true;
                    end;
                end;
            end;
        }
        field(14; "Is Deduction"; Boolean)
        {
            CalcFormula = Lookup("prBoard Earnings"."Is Deduction" WHERE(Code = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(15; "Is Sal Advance"; Boolean)
        {
            CalcFormula = Lookup("prBoard Earnings"."Is Salary Advance" WHERE(Code = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(16; Suspend; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Line No", "No.", Date, "Code")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Code")
        {
        }
        key(Key3; Date)
        {
        }
        key(Key4; "No.")
        {
            SumIndexFields = Amount;
        }
        key(Key5; Closed)
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        Earn: Record "prBoard Earnings";
        PayPeriod: Record "PR Payroll Periods";
        PayStartDate: Date;
        PayPeriodText: Text[30];

    //[Scope('Internal')]
    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then
            PayStartDate := PayPeriod."Date Opened";
        PayPeriodText := PayPeriod."Period Name";
    end;
}

