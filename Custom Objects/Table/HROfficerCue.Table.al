table 52186161 "HR Officer Cue"
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
        field(4; "code"; Code[10])
        {
        }
        field(5; "Approved Leave"; Integer)
        {
            CalcFormula = Count ("HR Leave Application" WHERE (Status = CONST (Approved)));
            FieldClass = FlowField;
        }
        field(6; "Approved  Trainings"; Integer)
        {
            CalcFormula = Count ("HR Training App Header" WHERE (Status = CONST (Approved)));
            FieldClass = FlowField;
        }
        field(7; "Approved Transport Requisition"; Integer)
        {
            CalcFormula = Count ("HR Transport Requisition Head" WHERE (Status = CONST (Approved)));
            FieldClass = FlowField;
        }
        field(8; "Pending Approvals"; Integer)
        {
            CalcFormula = Count ("Approval Entry" WHERE (Status = CONST (Open)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

