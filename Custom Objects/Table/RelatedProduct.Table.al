table 52185750 "Related Product"
{

    fields
    {
        field(1; "Product Code"; Code[10])
        {
            TableRelation = "Product Factory"."Product ID";
        }
        field(2; "Related Product Code"; Code[10])
        {
            TableRelation = "Product Factory"."Product ID";

            trigger OnValidate()
            begin
                if Product.Get("Related Product Code") then
                    "Related Product Desc" := Product."Product Description";
            end;
        }
        field(3; "Related Product Desc"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Product Code", "Related Product Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Product: Record "Product Factory";
}

