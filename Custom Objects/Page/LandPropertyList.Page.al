page 52186261 "Land Property List"
{
    CardPageID = "Land Property Details";
    Editable = false;
    PageType = List;
    SourceTable = "Property Details";
    SourceTableView = WHERE("Property Type" = FILTER('LAND'));

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
                field("Agreement Status"; Rec."Agreement Status")
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

