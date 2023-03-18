page 52186248 "Active Property List"
{
    CardPageID = "Active Properties";
    Editable = false;
    PageType = List;
    SourceTable = "Property Details";
    SourceTableView = WHERE("Agreement Status" = CONST(Active));

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
                field("L.R. No."; Rec."L.R. No.")
                {
                }
                field("Landlord No."; Rec."Landlord No.")
                {
                }
                field("Landlord Name"; Rec."Landlord Name")
                {
                }
                field("Property Manager[Staff]"; Rec."Property Manager[Staff]")
                {
                }
                field("Property Type"; Rec."Property Type")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(City; Rec.City)
                {
                }
                field(Street; Rec.Street)
                {
                }
                field("Commission Rate"; Rec."Commission Rate")
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

