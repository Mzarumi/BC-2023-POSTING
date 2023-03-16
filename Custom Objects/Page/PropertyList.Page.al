page 52186186 "Property List"
{
    CardPageID = "Property Details";
    Editable = false;
    PageType = List;
    SourceTable = "Property Details";
    SourceTableView = WHERE("Agreement Status" = CONST(Pending),
                            "Property Type" = FILTER(<> 'LAND'));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("L.R. No."; Rec."L.R. No.")
                {
                }
                field("Property Type"; Rec."Property Type")
                {
                }
                field(City; Rec.City)
                {
                }
                field(Street; Rec.Street)
                {
                }
                field("Agreement Status"; Rec."Agreement Status")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;
}

