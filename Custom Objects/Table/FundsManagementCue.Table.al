table 52185919 "Funds Management Cue"
{
    Caption = 'Finance Cue';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Interbank Pending Approval"; Integer)
        {
            CalcFormula = Count ("InterBank Transfers" WHERE (Status = FILTER ("Pending Approval")));
            FieldClass = FlowField;
        }
        field(3; "Interbank Not Posted"; Integer)
        {
            CalcFormula = Count ("InterBank Transfers" WHERE (Status = FILTER (Approved),
                                                             Posted = FILTER (false)));
            FieldClass = FlowField;
        }
        field(4; "PV Pending Approval"; Integer)
        {
            CalcFormula = Count ("Payments Header" WHERE ("Payment Type" = FILTER (<> "Petty Cash"),
                                                         Status = FILTER ("Pending Approval")));
            FieldClass = FlowField;
        }
        field(5; "PV Not Posted"; Integer)
        {
            CalcFormula = Count ("Payments Header" WHERE ("Payment Type" = FILTER (<> "Petty Cash"),
                                                         Status = FILTER (Approved)));
            FieldClass = FlowField;
        }
        field(6; "PCV Pending Approval"; Integer)
        {
            CalcFormula = Count ("Payments Header" WHERE ("Payment Type" = FILTER ("Petty Cash"),
                                                         Status = FILTER ("Pending Approval")));
            FieldClass = FlowField;
        }
        field(7; "PCV Not Posted"; Integer)
        {
            CalcFormula = Count ("Payments Header" WHERE ("Payment Type" = FILTER ("Petty Cash"),
                                                         Status = FILTER (Approved)));
            FieldClass = FlowField;
        }
        field(8; "Staff Travel Pending Approval"; Integer)
        {
            CalcFormula = Count ("Imprest Header" WHERE (Status = FILTER ("Pending Approval")));
            FieldClass = FlowField;
        }
        field(9; "Staff Travel Not Posted"; Integer)
        {
            CalcFormula = Count ("Imprest Header" WHERE (Status = FILTER (Approved)));
            FieldClass = FlowField;
        }
        field(10; "Staff TA Pending Approval"; Integer)
        {
            CalcFormula = Count ("Imprest Surrender Header" WHERE (Status = FILTER ("Pending Approval")));
            FieldClass = FlowField;
        }
        field(11; "Staff TA Not Posted"; Integer)
        {
            CalcFormula = Count ("Imprest Surrender Header" WHERE (Status = FILTER (Approved)));
            FieldClass = FlowField;
        }
        field(12; "Other Advance Pending Approval"; Integer)
        {
            CalcFormula = Count ("Staff Advance Header" WHERE (Status = FILTER ("Pending Approval")));
            FieldClass = FlowField;
        }
        field(13; "Other Advance Not Posted"; Integer)
        {
            CalcFormula = Count ("Staff Advance Header" WHERE (Status = FILTER (Approved)));
            FieldClass = FlowField;
        }
        field(14; "Staff Claim Pending Approval"; Integer)
        {
            CalcFormula = Count ("Staff Claims Header" WHERE (Status = FILTER ("Pending Approval")));
            FieldClass = FlowField;
        }
        field(15; "Staff Claim Not Posted"; Integer)
        {
            CalcFormula = Count ("Staff Claims Header" WHERE (Status = FILTER (Approved)));
            FieldClass = FlowField;
        }
        field(16; "Requisitions Pending Approval"; Integer)
        {
            CalcFormula = Count ("Purchase Header" WHERE ("Document Type" = FILTER (Quote),
                                                         DocApprovalType = FILTER (Requisition),
                                                         Status = FILTER ("Pending Approval")));
            FieldClass = FlowField;
        }
        field(17; "Requisitions Not Posted"; Integer)
        {
        }
        field(18; "Store Req. Pending Approval"; Integer)
        {
            CalcFormula = Count ("Store Requistion Header" WHERE (Status = FILTER ("Pending Approval")));
            FieldClass = FlowField;
        }
        field(19; "Store Req. Not Posted"; Integer)
        {
            CalcFormula = Count ("Store Requistion Header" WHERE (Status = FILTER (Released)));
            FieldClass = FlowField;
        }
        field(20; "Due Date Filter"; Date)
        {
            Caption = 'Due Date Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(21; "Overdue Date Filter"; Date)
        {
            Caption = 'Overdue Date Filter';
            FieldClass = FlowFilter;
        }
        field(22; "Work Advance Retire Pending"; Integer)
        {
            CalcFormula = Count ("Staff Advance Surrender Header" WHERE (Status = CONST (Pending)));
            FieldClass = FlowField;
        }
        field(23; "Work Advance Retire Not Posted"; Integer)
        {
            CalcFormula = Count ("Staff Advance Surrender Header" WHERE (Status = CONST (Approved)));
            FieldClass = FlowField;
        }
        field(24; "Approval Entries"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

