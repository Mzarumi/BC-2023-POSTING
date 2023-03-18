table 52185693 "Relationship Types"
{
    //LookupPageID = "Relationship Types";

    fields
    {
        field(1; Description; Text[30])
        {
        }
        field(2; "Min. Age"; Integer)
        {

            trigger OnValidate()
            begin
                if "Max. Age" <> 0 then
                    if "Min. Age" > "Max. Age" then
                        Error('The minimum age must be less than %1', "Max. Age");
            end;
        }
        field(3; "Max. Age"; Integer)
        {

            trigger OnValidate()
            begin
                if "Min. Age" <> 0 then
                    if "Max. Age" < "Min. Age" then
                        Error('The maximum age must be greater than %1', "Min. Age");
            end;
        }
        field(4; "Max. Allowed"; Integer)
        {
        }
        field(5; "Principal Child"; Boolean)
        {
        }
        field(6; "Insured Option"; Option)
        {
            OptionCaption = ' ,Child1,Child2,Child3,Child4,Spouse,Parent1,Parent2';
            OptionMembers = " ",Child1,Child2,Child3,Child4,Spouse,Parent1,Parent2;
        }
    }

    keys
    {
        key(Key1; Description)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

