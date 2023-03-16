page 52185903 "Store Requisition Line"
{
    PageType = ListPart;
    SourceTable = "Store Requistion Lines";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Requistion No"; Rec."Requistion No")
                {
                    Visible = false;
                }
                field(Type; Rec.Type)
                {
                    Editable = EditField;
                }
                field("No."; Rec."No.")
                {
                    Editable = EditField;
                }
                field(Description; Rec.Description)
                {
                    Editable = EditField;
                    Enabled = false;
                }
                field("Description 2"; Rec."Description 2")
                {
                    Caption = 'Remark';
                    Editable = EditField;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    Editable = EditField;
                }
                field("Qty in store"; Rec."Qty in store")
                {
                    Editable = EditField;
                    Visible = false;
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                    Editable = EditField;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    Editable = EditField;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    Editable = EditField;
                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Quantity To Issue';
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                    Editable = EditField;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    Editable = EditField;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    Editable = EditField;
                }
                field("Item Status"; Rec."Item Status")
                {
                    Editable = EditField;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    Image = ItemAvailability;
                }
                action("Item Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction()
                    begin
                        Rec.OpenItemTrackingLines;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
        EditField := false;
        StoreRequistionHeader.Reset;
        StoreRequistionHeader.SetRange("No.", Rec."Requistion No");
        if StoreRequistionHeader.FindFirst then
            if StoreRequistionHeader.Status = StoreRequistionHeader.Status::Open then EditField := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec. ShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
        EditField: Boolean;
        StoreRequistionHeader: Record "Store Requistion Header";
}

