page 52186039 "RFQ List"
{
    CardPageID = "RFQ Header";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Purchase Quote Header";
    SourceTableView = WHERE(Status = FILTER(Open | Released));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("Posting Description"; Rec."Posting Description")
                {
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                }
                field("Expected Closing Date"; Rec."Expected Closing Date")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
            }
        }
    }

    actions
    {
    }

    //[Scope('Internal')]
    procedure GetSelectionFilter(): Text
    var
        RFQ: Record "Purchase Quote Header";
        SelectionFilterManagement: Codeunit SelectionFilterManagement;
    begin
        CurrPage.SetSelectionFilter(RFQ);
        //EXIT(SelectionFilterManagement.GetSelectionFilterForItem(Item));
        exit(RFQ."No.");
    end;

    //[Scope('Internal')]
    procedure SetSelection(var RFQ: Record "Purchase Quote Header")
    begin
        CurrPage.SetSelectionFilter(RFQ);
    end;
}

