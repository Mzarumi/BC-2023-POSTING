table 52185655 "Payroll Variations"
{

    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
        }
        field(2; "Payroll Period"; Date)
        {
        }
        field(3; Type; Option)
        {
            OptionMembers = " ","New Employee","Salary Change","Allowance Change","Overtime Claim","Staff Transfer";
        }
        field(4; "Basic Pay"; Decimal)
        {
        }
        field(5; "Effective Date"; Date)
        {
        }
        field(6; "Transaction Code"; Code[50])
        {
            TableRelation = "PR Transaction Codes";
        }
        field(7; "New Amount"; Decimal)
        {
        }
        field(8; "Hrs Worked"; Decimal)
        {
        }
        field(9; "Overtime Type"; Option)
        {
            OptionMembers = " ","2Hr","1.5Hr";
        }
        field(10; "Created By"; Code[10])
        {
        }
        field(11; "Date Created"; Date)
        {
        }
        field(12; Status; Option)
        {
            OptionMembers = Open,Approved,Rejected;
        }
        field(13; "Approved By"; Code[20])
        {
        }
        field(14; Closed; Boolean)
        {
        }
        field(15; "Date Closed"; Date)
        {
        }
        field(16; "Department Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE ("Dimension Code" = CONST ('DEPARTMENT'));
        }
        field(17; "Transaction Name"; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Employee Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //Get the open/current period
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then
            "Payroll Period" := PayPeriod."Date Opened";
    end;

    var
        PayPeriod: Record "PR Payroll Periods";
}

