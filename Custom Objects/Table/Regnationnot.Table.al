table 52185431 "Regnation not"
{

    fields
    {
        field(1; No; Code[20])
        {

            trigger OnValidate()
            begin
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange("No.", No);
                if SavingsAccounts.Find('-') then begin
                    SavingsAccounts.Status := SavingsAccounts.Status::Frozen;
                    SavingsAccounts."Status Change Reason" := 'Direct Debit Order defaulters';
                    SavingsAccounts.Modify;
                end;
            end;
        }
        field(2; Gender; Option)
        {
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SavingsAccounts: Record "Savings Accounts";
}

