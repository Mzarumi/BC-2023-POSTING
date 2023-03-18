table 52186134 "Promise Topay"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(2; Name; Text[50])
        {
        }
        field(3; "Loan No."; Code[10])
        {
            TableRelation = Loans WHERE ("Outstanding Balance" = FILTER (> 0));

            trigger OnValidate()
            begin
                if Loans.Get("Loan No.") then begin
                    Loans.CalcFields("Outstanding Balance");
                    "Account No." := Loans."Loan Account";
                    Name := Loans."Member Name";
                    "Outstanding Balance" := Loans."Outstanding Balance";
                end else begin
                    "Account No." := '';
                    Name := '';
                    "Outstanding Balance" := 0;
                end;
            end;
        }
        field(4; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                if Amount > "Outstanding Balance" then
                    Error(Err001);
            end;
        }
        field(5; "Account No."; Code[20])
        {
        }
        field(6; Date; Date)
        {
        }
        field(7; "Outstanding Balance"; Decimal)
        {
        }
        field(8; "User ID"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "No.", "Loan No.", Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "User ID" := UserId;
    end;

    trigger OnModify()
    begin
        "User ID" := UserId;
    end;

    var
        Loans: Record Loans;
        Err001: Label 'Amount cannot be greater than outstanding balance';
}

