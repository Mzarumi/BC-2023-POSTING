page 52186057 "Vote Transfer List."
{
    CardPageID = "Vote Transfer";
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Vote Transfer";
    SourceTableView = WHERE(Posted = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                ShowCaption = false;
                field(No; Rec.No)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Source Vote"; Rec."Source Vote")
                {
                }
                field("Destination Vote"; Rec."Destination Vote")
                {
                }
                field("Budget Name"; Rec."Budget Name")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Source Dimension 1"; Rec."Source Dimension 1")
                {
                }
                field("Destination Dimension 1"; Rec."Destination Dimension 1")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Raised By"; Rec."Raised By")
                {
                }
                field("Raised Date"; Rec."Raised Date")
                {
                }
                field("Approved By"; Rec."Approved By")
                {
                }
                field("Source Dimension 2"; Rec."Source Dimension 2")
                {
                }
                field("Destination Dimension 2"; Rec."Destination Dimension 2")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }
}

