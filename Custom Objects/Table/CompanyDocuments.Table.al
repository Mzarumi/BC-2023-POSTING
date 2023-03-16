table 52186184 "Company Documents"
{
    //DrillDownPageID = "Renewed Contracts Card";
    //LookupPageID = "Renewed Contracts Card";

    fields
    {
        field(1; "Doc No."; Code[20])
        {
        }
        field(2; "Document Description"; Text[200])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                CompanyDocs.Reset;
                CompanyDocs.SetRange("Document Description", "Document Description");
                if CompanyDocs.FindFirst then Error('Document already exists');
            end;
        }
        field(3; "Document Link"; Text[200])
        {
        }
        field(6; "Attachment No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(7; "Language Code (Default)"; Code[10])
        {
            TableRelation = Language;
        }
        field(8; Attachment; Option)
        {
            Editable = false;
            OptionMembers = No,Yes;
        }
        field(9; "No. Series"; Code[20])
        {
        }
        field(10; Type; Option)
        {
            OptionCaption = 'Company,Leave';
            OptionMembers = Company,Leave;
        }
    }

    keys
    {
        key(Key1; "Doc No.", "Document Description")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Doc No." = '' then begin
            HRSetup.Get;
            HRSetup.TestField("Company Documents");
            //NoSeriesMgtInitSeries(HRSetup."Company Documents", xRec."No. Series", 0D, "Doc No.", "No. Series");
        end;
    end;

    var
        CompanyDocs: Record "Company Documents";
        HRSetup: Record "HR Setup";
    //NoSeriesMgt: Codeunit NoSeriesManagement;
}

