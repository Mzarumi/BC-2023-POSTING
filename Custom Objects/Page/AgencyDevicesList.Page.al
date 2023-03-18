page 52185463 "Agency Devices List"
{
    PageType = List;
    SourceTable = "Sky Agency Devices";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Device ID"; Rec."Device ID")
                {
                }
                field("Serial Number"; Rec."Serial Number")
                {
                }
                field(IMEI; Rec.IMEI)
                {
                }
                field(Make; Rec.Make)
                {
                }
                field(Model; Rec.Model)
                {
                }
                field("Board ID"; Rec."Board ID")
                {
                }
                field(Version; Rec.Version)
                {
                }
                field(Firmware; Rec.Firmware)
                {
                }
                field("Processor ID"; Rec."Processor ID")
                {
                }
            }
        }
    }

    actions
    {
    }
}

