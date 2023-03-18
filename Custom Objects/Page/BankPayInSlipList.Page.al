page 52185922 "Bank Pay In Slip List"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Bank Slip";

    layout
    {
        area(content)
        {
            repeater(Control1102758000)
            {
                ShowCaption = false;
                field(No; Rec.No)
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Source Dimension 1 Name"; Rec."Source Dimension 1 Name")
                {
                    Caption = 'Source Depot';
                }
                field("Source Dimension 2 Name"; Rec."Source Dimension 2 Name")
                {
                    Caption = 'Source Department';
                }
                field("From Account Name"; Rec."From Account Name")
                {
                }
                field("Destination Dimension 1 Name"; Rec."Destination Dimension 1 Name")
                {
                    Caption = 'Destination Depot Name';
                }
                field("Destination Dimension 2 Name"; Rec."Destination Dimension 2 Name")
                {
                    Caption = 'Destination Department Name';
                }
                field("To Account Name"; Rec."To Account Name")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Remarks; Rec.Remarks)
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

