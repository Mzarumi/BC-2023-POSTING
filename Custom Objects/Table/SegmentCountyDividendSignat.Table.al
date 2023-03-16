table 52185694 "Segment/County/Dividend/Signat"
{
    //LookupPageID = "Segment/County/Dividend/Signat";

    fields
    {
        field(1; Type; Option)
        {
            OptionCaption = ' ,Segment,County,Dividend Payment Type,Signatory Type,Sub-County,Province,Case Type';
            OptionMembers = " ",Segment,County,"Dividend Payment Type","Signatory Type","Sub-County",Province,"Case Type";
        }
        field(2; "Code"; Code[30])
        {
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Market Ninch Details"; Text[80])
        {
        }
        field(5; County; Code[30])
        {
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST(County));
        }
    }

    keys
    {
        key(Key1; Type, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", Description)
        {
        }
    }
}

