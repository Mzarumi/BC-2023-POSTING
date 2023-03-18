page 52186047 "Bid Analysis Worksheet"
{
    DeleteAllowed = false;
    PageType = Worksheet;
    SourceTable = "Bid Analysis";

    layout
    {
        area(content)
        {
            group(Control1102755012)
            {
                ShowCaption = false;
                // field(SalesCodeFilterCtrl; Rec.SalesCodeFilter)
                // {
                //     Caption = 'Vendor Code Filter';

                //     trigger OnLookup(var Text: Text): Boolean
                //     var
                //         VendList: Page "Vendor List";
                //     begin
                //         begin
                //             VendList.LookupMode := true;
                //             if VendList.RunModal = ACTION::LookupOK then
                //                 Text := VendList.GetSelectionFilter
                //             else
                //                 exit(false);
                //         end;

                //         exit(true);
                //     end;

                //     trigger OnValidate()
                //     begin
                //         SalesCodeFilterOnAfterValidate;
                //     end;
                // }
                // field(ItemNoFilter; Rec.ItemNoFilter)
                // {
                //     Caption = 'Item No.';

                //     trigger OnLookup(var Text: Text): Boolean
                //     var
                //         ItemList: Page "Item List";
                //     begin
                //         ItemList.LookupMode := true;
                //         if ItemList.RunModal = ACTION::LookupOK then
                //             Text := ItemList.GetSelectionFilter
                //         else
                //             exit(false);

                //         exit(true);
                //     end;

                //     trigger OnValidate()
                //     begin
                //         ItemNoFilterOnAfterValidate;
                //     end;
                // }
                field(Total; Rec.Total)
                {
                    Editable = false;
                }
            }
            repeater(Group)
            {
                Editable = false;
                field("RFQ No."; Rec."RFQ No.")
                {
                    Visible = false;
                }
                field("RFQ Line No."; Rec."RFQ Line No.")
                {
                    Visible = false;
                }
                field("Quote No."; Rec."Quote No.")
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                // field(VendorName; Rec.VendorName)
                // {
                //     Caption = 'Vendor Name';
                // }
                field("Item No."; Rec."Item No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Line Amount"; Rec."Line Amount")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Get Vendor Quotations")
            {
                Caption = 'Get Vendor Quotations';
                Image = GetSourceDoc;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    GetVendorQuotes;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Vendor.Get(Rec."Vendor No.");
        VendorName := Vendor.Name;
        CalcTotals;
    end;

    var
        PurchHeader: Record "Purchase Header";
        PurchLines: Record "Purchase Line";
        ItemNoFilter: Text[250];
        RFQNoFilter: Text[250];
        InsertCount: Integer;
        SalesCodeFilter: Text[250];
        VendorName: Text;
        Vendor: Record Vendor;
        Total: Decimal;

    //[Scope('Internal')]
    procedure SetRecFilters()
    begin
        if SalesCodeFilter <> '' then
            Rec.SetFilter("Vendor No.", SalesCodeFilter)
        else
            Rec.SetRange("Vendor No.");

        if ItemNoFilter <> '' then begin
            Rec.SetFilter("Item No.", ItemNoFilter);
        end else
            Rec.SetRange("Item No.");

        CalcTotals;

        CurrPage.Update(false);
    end;

    local procedure ItemNoFilterOnAfterValidate()
    begin
        CurrPage.SaveRecord;
        SetRecFilters;
    end;

    //[Scope('Internal')]
    procedure GetVendorQuotes()
    begin
        //insert the quotes from vendors
        if RFQNoFilter = '' then Error('Specify the RFQ No.');

        PurchHeader.SetRange(PurchHeader."No.", RFQNoFilter);
        PurchHeader.FindSet;
        repeat
            PurchLines.Reset;
            PurchLines.SetRange("Document No.", PurchHeader."No.");
            if PurchLines.FindSet then
                repeat
                    Rec.Init;
                    Rec."RFQ No." := PurchHeader."No.";
                    Rec."RFQ Line No." := PurchLines."Line No.";
                    Rec."Quote No." := PurchLines."Document No.";
                    Rec."Vendor No." := PurchLines."Buy-from Vendor No.";
                    Rec."Item No." := PurchLines."No.";
                    Rec.Description := PurchLines.Description;
                    Rec.Quantity := PurchLines.Quantity;
                    Rec."Unit Of Measure" := PurchLines."Unit of Measure";
                    Rec.Amount := PurchLines."Direct Unit Cost";
                    Rec."Line Amount" := Rec.Quantity * Rec.Amount;
                    Rec.Insert(true);
                    InsertCount := +1;
                until PurchLines.Next = 0;
        until PurchHeader.Next = 0;
        Message('%1 records have been inserted to the bid analysis');
    end;

    local procedure SalesCodeFilterOnAfterValidate()
    begin
        CurrPage.SaveRecord;
        SetRecFilters;
    end;

    //[Scope('Internal')]
    procedure CalcTotals()
    var
        BidAnalysisRec: Record "Bid Analysis";
    begin
        BidAnalysisRec.SetRange("RFQ No.", Rec."RFQ No.");
        if SalesCodeFilter <> '' then
            BidAnalysisRec.SetRange("Vendor No.", SalesCodeFilter);
        if ItemNoFilter <> '' then
            BidAnalysisRec.SetRange("Item No.", ItemNoFilter);
        BidAnalysisRec.FindSet;
        BidAnalysisRec.CalcSums("Line Amount");
        Total := BidAnalysisRec."Line Amount";
    end;
}

