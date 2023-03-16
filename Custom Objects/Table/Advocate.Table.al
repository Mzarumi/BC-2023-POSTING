table 52185959 Advocate
{
    Caption = 'Advocate';
    // //DrillDownPageID = "Advocate List";
    // //LookupPageID = "Advocate List";

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; Name; Code[250])
        {
        }
        field(3; "Type of Firm"; Text[100])
        {
        }
        field(4; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Firm No"; Code[100])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange(Vend."No.", "Firm No");
                if Vend.Find('-') then
                    Name := Vend.Name;
            end;
        }
    }

    keys
    {
        key(Key1; No, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record Vendor;
}

