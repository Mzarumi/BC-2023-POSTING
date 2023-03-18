page 52186210 "Computer Asset Register"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Computer Asset Register";

    layout
    {
        area(content)
        {
            group(General)
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
                field("Staff No"; Rec."Staff No")
                {
                    Caption = 'Allocated User No';
                }
                field("Allocated User"; Rec."Allocated User")
                {
                    Caption = 'Allocated User Name';
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
                field(Disposed; Rec.Disposed)
                {
                }
                field("Date Disposed"; Rec."Date Disposed")
                {
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Dispose)
            {
                Image = Card;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to dispose this Asset', true) = false then exit;
                    //Disposed := true;
                    //"Date Disposed" := Today;
                end;
            }
        }
    }
}

