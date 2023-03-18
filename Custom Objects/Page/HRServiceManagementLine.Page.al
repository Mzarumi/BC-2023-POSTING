page 52186090 "HR Service Management Line"
{
    PageType = ListPart;
    SourceTable = "HR Service Management Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vehicle Registration No."; Rec."Vehicle Registration No.")
                {
                }
                field("Vehicle Type"; Rec."Vehicle Type")
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
                field("Service Instruction"; Rec."Service Instruction")
                {
                }
                field("Repaire Instruction"; Rec."Repaire Instruction")
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

