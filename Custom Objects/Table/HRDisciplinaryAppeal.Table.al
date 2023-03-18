table 52185970 "HRDisciplinary Appeal"
{

    fields
    {
        field(1; "No."; Code[30])
        {
        }
        field(2; "Employee No."; Code[30])
        {
            Editable = false;
            TableRelation = "HR Employees"."No.";

            trigger OnLookup()
            begin
                HREmployees.Reset;
                SetRange("Employee No.", HREmployees."No.");
                if HREmployees.FindFirst then begin
                    "Employee Name" := HREmployees."First Name";
                end;
            end;
        }
        field(3; "Employee Name"; Text[100])
        {
            Editable = false;
        }
        field(4; "Disciplinary Case No"; Code[30])
        {
            TableRelation = "HR Disciplinary Cases NCA"."Case Number" WHERE(Reporter = FIELD("Employee No."),
                                                                             "Disciplinary Stage Status" = FILTER(Closed));
        }
        field(7; "Employee Reason"; Text[250])
        {
        }
        field(8; Region; Code[30])
        {
            Editable = false;
        }
        field(9; Department; Code[30])
        {
            Editable = false;
        }
        field(10; "Responsibility Center"; Code[30])
        {
            Editable = false;
            TableRelation = "Responsibility Center".Code;
        }
        field(11; Status; Option)
        {
            Editable = false;
            OptionMembers = New,"Pending Approval",Approved;
        }
        field(12; "No Series"; Code[30])
        {
        }
        field(13; "User ID"; Code[50])
        {
            Editable = false;
            TableRelation = "User Setup"."User ID";
        }
        field(14; "HR Reasons"; Text[250])
        {
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
        //No. Series
        if "No." = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Disciplinary Appeal Nos");
            //NoSeriesMgtInitSeries(HRSetup."Disciplinary Appeal Nos", xRec."No Series", 0D, "No.", "No Series");
        end;





        HREmployees.Reset;
        HREmployees.SetRange(HREmployees."User ID", UserId);
        if HREmployees.Find('-') then begin
            "Employee Name" := HREmployees."First Name" + ' ' + HREmployees."Middle Name" + ' ' + HREmployees."Last Name";
            "Employee No." := HREmployees."No.";
            "User ID" := HREmployees."User ID";
            //Region := HREmployees."Global Dimension 1 Code";
            //Department := HREmployees."Global Dimension 2 Code";
           // "Responsibility Center" := HREmployees."Responsibility Center";
        end;
    end;

    var
        HREmployees: Record "HR Employees";
        HRSetup: Record "HR Setup";
    //NoSeriesMgt: Codeunit NoSeriesManagement;
}

