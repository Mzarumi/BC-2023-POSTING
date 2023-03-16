table 52185571 "HR Transport Requisition Head"
{
    //DrillDownPageID = "HR Transport Requisition List";
    //LookupPageID = "HR Transport Requisition List";

    fields
    {
        field(1; "Transport Request No"; Code[20])
        {

            trigger OnValidate()
            begin
                /*
                //TEST IF MANUAL NOs ARE ALLOWED
                IF "Transport Request No" <> xRec."Transport Request No" THEN BEGIN
                  HRSetup.GET;
                  //NoSeriesMgtTestManual(HRSetup."Transport Req Nos");
                 "No series":= '';
                END;
                */

            end;
        }
        field(4; "Days Applied"; Integer)
        {
        }
        field(5; "Departure Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Return Date" <> 0D then
                    "Days Applied" := "Return Date" - "Departure Date" + 1;
            end;
        }
        field(6; "Return Date"; Date)
        {
            Caption = 'Return Date';
            Editable = true;

            trigger OnValidate()
            begin
                if "Departure Date" <> 0D then
                    "Days Applied" := "Return Date" - "Departure Date" + 1;
            end;
        }
        field(7; "Application Date"; Date)
        {
        }
        field(11; "Test field"; Code[10])
        {
        }
        field(12; Status; Option)
        {
            Editable = true;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(15; "Applicant Comments"; Text[250])
        {
        }
        field(17; "No series"; Code[30])
        {
        }
        field(28; Selected; Boolean)
        {
        }
        field(3900; "End Date"; Date)
        {
            Editable = false;
        }
        field(3921; "E-mail Address"; Date)
        {
            Editable = false;
        }
        field(3924; "Entry No"; Integer)
        {
        }
        field(3936; "Cell Phone Number"; Text[50])
        {
        }
        field(3937; "Request Leave Allowance"; Boolean)
        {
        }
        field(3940; "Employee Name"; Text[100])
        {
        }
        field(3942; "Leave Allowance Entittlement"; Boolean)
        {
        }
        field(3943; "Leave Allowance Amount"; Decimal)
        {
        }
        field(3945; "Details of Examination"; Text[200])
        {
        }
        field(3947; "Date of Exam"; Date)
        {
        }
        field(3952; Description; Text[30])
        {
        }
        field(3955; "Supervisor Email"; Text[30])
        {
        }
        field(3958; "Job Title"; Text[50])
        {
        }
        field(3959; "Raised By"; Code[50])
        {
        }
        field(3961; "Employee No"; Code[20])
        {
            TableRelation = "HR Employees"."No.";

            trigger OnValidate()
            begin
                HREmp.Reset;
                HREmp.SetRange(HREmp."No.", "Employee No");
                if HREmp.Find('-') then begin
                    "Employee Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                    "Job Title" := HREmp."Job Title";
                end;
            end;
        }
        field(3962; Supervisor; Code[20])
        {
        }
        field(3963; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center B".Code;
        }
        field(3964; Comment; Boolean)
        {
        }
        field(3965; "Purpose of Trip"; Text[50])
        {
        }
        field(3966; "Transport type"; Code[10])
        {
        }
        field(3967; "Time of Trip"; Time)
        {
        }
        field(3968; "Pickup Point"; Text[30])
        {
        }
        field(3969; From; Text[30])
        {
        }
        field(3970; Destination; Text[30])
        {
        }
        field(3971; "Job Code"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Transport Request No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Transport Request No", From, Destination)
        {
        }
    }

    trigger OnInsert()
    begin

        if "Transport Request No" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Transport Req Nos");
            //NoSeriesMgtInitSeries(HRSetup."Transport Req Nos", xRec."No series", 0D, "Transport Request No", "No series");
        end;

        "Raised By" := UserId;
        "Application Date" := Today;
    end;

    var
        HRSetup: Record "HR Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "HR Employees";
        Text003: Label 'UserID [%1] does not exist in [%2]';
        // Dates: Codeunit "HR Codeunit2";
}

