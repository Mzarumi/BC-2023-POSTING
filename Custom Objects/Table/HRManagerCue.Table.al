table 52186165 "HR Manager Cue"
{

    fields
    {
        field(1; Active; Integer)
        {
            CalcFormula = Count ("HR Employees" WHERE (Status = FILTER (Active)));
            FieldClass = FlowField;
        }
        field(2; Female; Integer)
        {
            CalcFormula = Count ("HR Employees" WHERE (Gender = FILTER (" "),
                                                      Status = FILTER (Active)));
            FieldClass = FlowField;
        }
        field(3; Male; Integer)
        {
            CalcFormula = Count ("HR Employees" WHERE (Gender = FILTER (Male),
                                                      Status = FILTER (Active)));
            FieldClass = FlowField;
        }
        field(4; "Code"; Code[20])
        {
        }
        field(5; "Approved Job Posistions"; Integer)
        {
            CalcFormula = Count ("HR Jobs" WHERE (Status = CONST (Approved)));
            FieldClass = FlowField;
        }
        field(6; "Requisitions Pending Approval"; Integer)
        {
            CalcFormula = Count ("HR Employee Requisitions" WHERE ("Approval Status" = CONST (Approved)));
            FieldClass = FlowField;
        }
        field(7; "Pending Approvals"; Integer)
        {
            CalcFormula = Count ("Approval Entry" WHERE (Status = CONST (Open)));
            FieldClass = FlowField;
        }
        field(8; "Contracts Due"; Integer)
        {
            CalcFormula = Count ("HR Employees" WHERE ("Contract End Date" = FILTER (20160804D)));
            FieldClass = FlowField;
        }
        field(9; "Probation Due"; Integer)
        {
        }
        field(10; "Upcoming Birthdays"; Integer)
        {
        }
        field(11; "Leave Resume Due"; Integer)
        {
        }
        field(12; "Upcoming Leave"; Integer)
        {
        }
        field(13; "Upcoming Company Activities"; Integer)
        {
        }
        field(14; "Upcoming Staff Separation"; Integer)
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

    var
        OneMonth: Date;
}

