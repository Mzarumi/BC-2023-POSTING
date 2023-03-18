page 52186088 "HR Service Management List"
{
    CardPageID = "HR Service Management Card";
    PageType = List;
    SourceTable = "HR Service Management Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                }
                field("Type Of Payment"; Rec."Type Of Payment")
                {
                }
                field("Total Cost"; Rec."Total Cost")
                {
                }
                field("Driver Details"; Rec."Driver Details")
                {
                }
                field("Vendor/Garage"; Rec."Vendor/Garage")
                {
                }
                field("Name Vehicle"; Rec."Name Vehicle")
                {
                }
                field("Make/Model"; Rec."Make/Model")
                {
                }
                field(Performance; Rec.Performance)
                {
                }
                field("Source of Fueling"; Rec."Source of Fueling")
                {
                }
                field("Fuel Cost"; Rec."Fuel Cost")
                {
                }
                field("Type of fuel"; Rec."Type of fuel")
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
            }
        }
    }

    actions
    {
    }
}

