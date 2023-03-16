page 52186211 "Computer Asset Register List"
{
    CardPageID = "Computer Asset Register";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Computer Asset Register";
    SourceTableView = WHERE(Disposed = CONST(false));

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
                field(Control4; Rec.Disposed)
                {
                }
                field("Date Disposed"; Rec."Date Disposed")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Disposed)
            {
            }
            action("Calculate Years Left")
            {
                Image = Calculate;
                Promoted = true;

                trigger OnAction()
                begin
                    repeat
                        Rec."Year of Service Left" := 5 - (Date2DMY(Today, 3) - Rec."Year of Purchase");
                        if Rec."Year of Service Left" < 0 then Rec."Year of Service Left" := 0;
                        Rec.Modify;
                    until Rec.Next = 0;
                    Message('Calulated successfully');
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec."Year of Service Left" := 5 - (Date2DMY(Today, 3) - Rec."Year of Purchase");
    end;
}

