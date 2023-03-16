table 52185543 "HR Leave Planner Lines"
{

    fields
    {
        field(1; "Enrty No."; Integer)
        {
        }
        field(2; "Staff No."; Code[10])
        {
            TableRelation = "HR Employees"."No.";

            trigger OnValidate()
            begin
                HREmp.Reset;
                HREmp.SetRange(HREmp."No.", "Staff No.");
                if HREmp.Find('-') then
                    "Staff Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
            end;
        }
        field(3; "Staff Name"; Text[200])
        {
        }
        field(4; January; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(1)));
            FieldClass = FlowField;
        }
        field(5; Feburuary; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(2)));
            FieldClass = FlowField;
        }
        field(6; March; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(3)));
            FieldClass = FlowField;
        }
        field(7; April; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(4)));
            FieldClass = FlowField;
        }
        field(8; May; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(5)));
            FieldClass = FlowField;
        }
        field(9; June; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(6)));
            FieldClass = FlowField;
        }
        field(10; July; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(7)));
            FieldClass = FlowField;
        }
        field(11; August; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(8)));
            FieldClass = FlowField;
        }
        field(12; September; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(9)));
            FieldClass = FlowField;
        }
        field(13; October; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(10)));
            FieldClass = FlowField;
        }
        field(14; November; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(11)));
            FieldClass = FlowField;
        }
        field(15; December; Decimal)
        {
            CalcFormula = Sum("HR Leave Planner Drill"."Days Applied" WHERE("Employee No" = FIELD("Staff No."),
                                                                             Month = CONST(12)));
            FieldClass = FlowField;
        }
        field(16; Year; Integer)
        {
        }
        field(17; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Department Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                /*
                DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.",1);
                DimVal.SETRANGE(DimVal.Code,"Global Dimension 1 Code");
                 IF DimVal.FIND('-') THEN
                    "Function Name":=DimVal.Name;
                 UpdateLines;
                 */

            end;
        }
        field(18; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin

                /*DimVal.RESET;
                DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code,"Shortcut Dimension 2 Code");
                 IF DimVal.FIND('-') THEN
                    "Budget Center Name":=DimVal.Name ;
                UpdateLines
                */

            end;
        }
        field(19; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                /*
                DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code,"Shortcut Dimension 3 Code");
                 IF DimVal.FIND('-') THEN
                    Dim3:=DimVal.Name
                */

            end;
        }
        field(20; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                /*
                DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code,"Shortcut Dimension 4 Code");
                 IF DimVal.FIND('-') THEN
                    Dim4:=DimVal.Name
                  */

            end;
        }
        field(21; "Document Number"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Staff No.", Year)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HRSetup: Record "HR Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        HREmp: Record "HR Employees";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        // SMTP: Codeunit "SMTP Mail";
        LeaveGjline: Record "HR Leave Journal Line";
        "LineNo.": Integer;
        ApprovalComments: Record "Approval Comment Line";
        URL: Text[500];
        sDate: Record Date;
        Customized: Record "HR Leave Calendar Lines";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRJournalBatch: Record "HR Leave Journal Batch";
        LeaveHeader: Record "HR Leave Planner Header";
        Names: Text[100];
        TEXT001: Label 'Days Approved cannot be more than applied days';
}

