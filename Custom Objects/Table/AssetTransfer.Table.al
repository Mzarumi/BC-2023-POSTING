table 52185892 "Asset Transfer"
{
    // //DrillDownPageID = "Asset Transfer List";
    // //LookupPageID = "Asset Transfer List";

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "No." <> xRec."No." then begin
                    FASetup.Get;
                    //NoSeriesMgtTestManual(FASetup."Asset Transfer Nos.");
                    "No. Series" := ' ';
                end;
            end;
        }
        field(5; "Raised By"; Code[50])
        {
            Editable = false;
        }
        field(10; "Asset to Transfer"; Code[20])
        {
            TableRelation = "Fixed Asset"."No.";

            trigger OnValidate()
            begin
                FA.Reset;
                FA.SetRange(FA."No.", "Asset to Transfer");
                if FA.Find('-') then begin
                    "Asset Description" := FA.Description;
                    "From Location" := FA."FA Location Code";
                    "From Responsible Employee" := FA."Responsible Employee";
                    Validate("From Responsible Employee");
                end else begin
                    "Asset Description" := ' ';
                    "From Location" := ' ';
                    "From Responsible Employee" := ' ';
                    Validate("From Responsible Employee");
                end;
            end;
        }
        field(15; "Asset Description"; Text[50])
        {
        }
        field(20; "From Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                DimVal.Reset;
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                DimVal.SetRange(DimVal.Code, "From Dimension 1 Code");
                if DimVal.Find('-') then
                    "From Dimension 1 Description" := DimVal.Name
                else
                    "From Dimension 1 Description" := ' ';
            end;
        }
        field(25; "From Dimension 1 Description"; Text[50])
        {
        }
        field(30; "From Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                DimVal.Reset;
                DimVal.SetRange(DimVal."Global Dimension No.", 2);
                DimVal.SetRange(DimVal.Code, "From Dimension 2 Code");
                if DimVal.Find('-') then
                    "From Dimension 2 Description" := DimVal.Name
                else
                    "From Dimension 2 Description" := ' ';
            end;
        }
        field(35; "From Dimension 2 Description"; Text[50])
        {
        }
        field(40; "From Location"; Code[20])
        {
            TableRelation = "FA Location".Code;
        }
        field(45; "From Responsible Employee"; Code[20])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employees.Reset;
                Employees.SetRange(Employees."No.", "From Responsible Employee");
                if Employees.Find('-') then
                    "From Employee Name" := Employees."First Name" + ' ' + Employees."Middle Name" + ' ' + Employees."Last Name"
                else
                    "From Employee Name" := ' ';
            end;
        }
        field(50; "From Employee Name"; Text[100])
        {
        }
        field(55; "To Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                DimVal.Reset;
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                DimVal.SetRange(DimVal.Code, "To Dimension 1 Code");
                if DimVal.Find('-') then
                    "To Dimension 1 Description" := DimVal.Name
                else
                    "To Dimension 1 Description" := ' ';
            end;
        }
        field(60; "To Dimension 1 Description"; Text[50])
        {
        }
        field(65; "To Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                DimVal.Reset;
                DimVal.SetRange(DimVal."Global Dimension No.", 2);
                DimVal.SetRange(DimVal.Code, "To Dimension 2 Code");
                if DimVal.Find('-') then
                    "To Dimension 2 Description" := DimVal.Name
                else
                    "To Dimension 2 Description" := ' ';
            end;
        }
        field(70; "To Dimension 2 Description"; Text[50])
        {
        }
        field(75; "To Location"; Code[20])
        {
            TableRelation = "FA Location".Code;
        }
        field(80; "To Responsible Employee"; Code[20])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employees.Reset;
                Employees.SetRange(Employees."No.", "To Responsible Employee");
                if Employees.Find('-') then
                    "To Employee Name" := Employees."First Name" + ' ' + Employees."Middle Name" + ' ' + Employees."Last Name"
                else
                    "To Employee Name" := ' ';
            end;
        }
        field(85; "To Employee Name"; Text[100])
        {
        }
        field(90; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(95; Transferred; Boolean)
        {
            Editable = false;
        }
        field(100; Comments; Text[100])
        {
        }
        field(105; "No. Series"; Code[10])
        {
        }
        field(106; "Transfer Type"; Option)
        {
            OptionMembers = Internal,External;
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
        if "No." = '' then begin
            FASetup.Get;
            FASetup.TestField("Asset Transfer Nos.");
            //NoSeriesMgtInitSeries(FASetup."Asset Transfer Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Raised By" := UserId;
    end;

    var
        FA: Record "Fixed Asset";
        DimVal: Record "Dimension Value";
        Employees: Record Employee;
        FASetup: Record "FA Setup";
    //NoSeriesMgt: Codeunit NoSeriesManagement;
}

