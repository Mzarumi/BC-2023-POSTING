page 52186089 "HR Service Management Card"
{
    PageType = Card;
    SourceTable = "HR Service Management Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Name Vehicle"; Rec."Name Vehicle")
                {
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                }
                field("Driver Details"; Rec."Driver Details")
                {
                }
                field("Vendor/Garage"; Rec."Vendor/Garage")
                {
                }
                field("Make/Model"; Rec."Make/Model")
                {
                }
                field(Performance; Rec.Performance)
                {
                }
                field(Kilometers; Rec.Kilometers)
                {
                }
                field("Date /Time"; Rec."Date /Time")
                {
                }
                field("Date of service"; Rec."Date of service")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field(Inactive; Rec.Inactive)
                {
                }
            }
            part("Service Management"; "HR Service Management Line")
            {
                Caption = 'Service Management';
                SubPageLink = Code = FIELD("No.");
            }
        }
    }

    actions
    {
    }
}

