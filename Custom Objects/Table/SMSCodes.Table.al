table 52185834 "SMS Codes"
{
    Caption = 'Dynamic Request Page Field';
    //LookupPageID = "Dynamic Request Page Fields";

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            NotBlank = true;
            TableRelation = "Table Metadata".ID;

            trigger OnValidate()
            begin
                CalcFields("Table Name", "Table Caption");
            end;
        }
        field(2; "Field ID"; Integer)
        {
            Caption = 'Field ID';
            NotBlank = true;
            TableRelation = Field."No." WHERE(TableNo = FIELD("Table ID"));

            trigger OnValidate()
            begin
                CalcFields("Field Name", "Field Caption");
            end;
        }
        field(3; "Table Name"; Text[30])
        {
            CalcFormula = Lookup("Table Metadata".Name WHERE(ID = FIELD("Table ID")));
            Caption = 'Table Name';
            FieldClass = FlowField;
        }
        field(4; "Table Caption"; Text[30])
        {
            CalcFormula = Lookup("Table Metadata".Caption WHERE(ID = FIELD("Table ID")));
            Caption = 'Table Caption';
            FieldClass = FlowField;
        }
        field(5; "Field Name"; Text[30])
        {
            CalcFormula = Lookup(Field.FieldName WHERE(TableNo = FIELD("Table ID"),
                                                        "No." = FIELD("Field ID")));
            Caption = 'Field Name';
            FieldClass = FlowField;
        }
        field(6; "Field Caption"; Text[30])
        {
            CalcFormula = Lookup(Field."Field Caption" WHERE(TableNo = FIELD("Table ID"),
                                                              "No." = FIELD("Field ID")));
            Caption = 'Field Caption';
            FieldClass = FlowField;
        }
        field(7; "Code"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Table ID", "Field ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

