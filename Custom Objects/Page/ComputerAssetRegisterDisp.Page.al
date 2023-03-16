page 52186212 "Computer Asset Register (Disp)"
{
    CardPageID = "Computer Asset Register";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Computer Asset Register";
    SourceTableView = WHERE(Disposed = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field(Location; Rec.Location)
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Asset Description"; Rec."Asset Description")
                {
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                }
                field("Allocated User"; Rec."Allocated User")
                {
                }
                field("System Software"; Rec."System Software")
                {
                }
                field(Applications; Rec.Applications)
                {
                }
                field("Processor Type"; Rec."Processor Type")
                {
                }
                field("Memory Size"; Rec."Memory Size")
                {
                }
                field("Asset Serial No"; Rec."Asset Serial No")
                {
                }
                field("Year of Purchase"; Rec."Year of Purchase")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Year of Service Left"; Rec."Year of Service Left")
                {
                }
            }
        }
    }

    actions
    {
    }
}

