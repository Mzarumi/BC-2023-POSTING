table 52185976 "HR Drivers"
{
    //DrillDownPageID = "HR Interns Card";
    //LookupPageID = "HR Interns Card";

    fields
    {
        field(1; "Code"; Code[10])
        {
            TableRelation = "HR Employees"."No.";

            trigger OnValidate()
            begin
                HREmp.Reset;
                HREmp.Get(Code);
                "Driver Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
            end;
        }
        field(2; "Driver Name"; Text[100])
        {
        }
        field(3; "Driver License Number"; Code[20])
        {
        }
        field(4; "Last License Renewal"; Date)
        {
        }
        field(5; "Renewal Interval"; Option)
        {
            OptionMembers = " ",Days,Weeks,Months,Quarterly,"3Years";
        }
        field(6; "Renewal Interval Value"; Integer)
        {

            trigger OnValidate()
            begin
                /*StrValue:='D';
                
                IF "Renewal Interval"="Renewal Interval"::Days THEN
                  BEGIN
                    StrValue:='D';
                  END
                ELSE IF "Renewal Interval"="Renewal Interval"::Weeks THEN
                  BEGIN
                    StrValue:='W';
                  END
                ELSE IF "Renewal Interval"="Renewal Interval"::Months THEN
                  BEGIN
                    StrValue:='M';
                  END
                ELSE IF "Renewal Interval"="Renewal Interval"::Quarterly THEN
                  BEGIN
                    StrValue:='Q';
                  END
                ELSE IF "Renewal Interval"="Renewal Interval"::Years THEN
                  BEGIN
                    StrValue:='Y';
                  END;
                
                "Next License Renewal":= CALCDATE(FORMAT("Renewal Interval Value") + StrValue , "Last License Renewal");
                */

            end;
        }
        field(7; "Next License Renewal"; Date)
        {

            trigger OnValidate()
            begin
                "Next License Renewal" := "Last License Renewal" + 3;
            end;
        }
        field(8; "Year Of Experience"; Decimal)
        {
        }
        field(9; Grade; Code[20])
        {
        }
        field(10; Active; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Active := true;
    end;

    var
        HREmp: Record "HR Employees";
}

