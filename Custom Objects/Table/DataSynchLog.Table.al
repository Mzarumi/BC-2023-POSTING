table 52186141 "Data Synch Log"
{

    fields
    {
        field(1; "Primary Key"; Integer)
        {
        }
        field(2; "Last Loan Synch Date"; DateTime)
        {
        }
        field(3; "Last Loan No"; Code[20])
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

    trigger OnInsert()
    begin
        "Last Loan Synch Date" := CurrentDateTime;
    end;

    trigger OnModify()
    begin
        "Last Loan Synch Date" := CurrentDateTime;
    end;
}

