table 52186079 "Loanee Infomation Base"
{

    fields
    {
        field(1; "Member No."; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if Rec."Captured By" <> '' then
                    if Rec."Captured By" <> UserId then
                        Error('This Record can only be modified by %1', xRec."Captured By")
            end;
        }
        field(2; Info; Text[250])
        {

            trigger OnValidate()
            begin
                if Rec."Captured By" <> '' then
                    if Rec."Captured By" <> UserId then
                        Error('This Record can only be modified by %1', xRec."Captured By");

                Date := Today;
                "Captured By" := UserId;
            end;
        }
        field(3; Date; Date)
        {
            Editable = false;
        }
        field(4; "Captured By"; Code[50])
        {
            Editable = false;
        }
        field(5; "Loanee Status"; Option)
        {
            OptionCaption = ' ,Defaulter,Loan Attached,Deposit Arrears,Legal';
            OptionMembers = " ",Defaulter,"Loan Attached","Deposit Arrears",Legal;

            trigger OnValidate()
            begin
                if Rec."Captured By" <> '' then
                    if Rec."Captured By" <> UserId then
                        Error('This Record can only be modified by %1', xRec."Captured By");
            end;
        }
    }

    keys
    {
        key(Key1; "Member No.", Info)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        // IF Rec."Captured By"<>'' THEN
        // IF Rec."Captured By"<>USERID THEN
        //  ERROR('This Record can only be modified by %1',xRec."Captured By")
    end;
}

