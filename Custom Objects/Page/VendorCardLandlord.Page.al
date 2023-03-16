page 52186181 "Vendor Card-Landlord"
{
    Caption = 'Vendor Card';
    DeleteAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Vendor;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    Caption = 'Landlord Name';
                }
                field(Address; Rec.Address)
                {
                }
                field("Address 2"; Rec."Address 2")
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                    Caption = 'Post Code/City';
                }
                field(City; Rec.City)
                {
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                }
                field("Primary Contact No."; Rec."Primary Contact No.")
                {
                }
                field(Contact; Rec.Contact)
                {
                    Editable = ContactEditable;

                    trigger OnValidate()
                    begin
                        ContactOnAfterValidate;
                    end;
                }
                field("Search Name"; Rec."Search Name")
                {
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {

                    trigger OnDrillDown()
                    var
                        VendLedgEntry: Record "Vendor Ledger Entry";
                        DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry";
                    begin
                        DtldVendLedgEntry.SetRange("Vendor No.", Rec."No.");
                        Rec.CopyFilter("Global Dimension 1 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 1");
                        Rec.CopyFilter("Global Dimension 2 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 2");
                        Rec.CopyFilter("Currency Filter", DtldVendLedgEntry."Currency Code");
                        VendLedgEntry.DrillDownOnEntries(DtldVendLedgEntry);
                    end;
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                }
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                    Visible = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Visible = false;
                }
                field("KRA Pin No."; Rec."KRA Pin No.")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
            part(Control1102755002; "Property List")
            {
                Editable = false;
                SubPageLink = "Landlord No." = FIELD("No.");
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Fax No."; Rec."Fax No.")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    NotBlank = false;
                }
                field("Home Page"; Rec."Home Page")
                {
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {

                    trigger OnValidate()
                    begin
                        ICPartnerCodeOnAfterValidate;
                    end;
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    Caption = 'Landlord Posting Group';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Landlord)
            {
                Caption = 'Landlord';
                action("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    RunObject = Page "Vendor Ledger Entries";
                    RunPageLink = "Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Vendor No.");
                    ShortCutKey = 'Ctrl+F7';
                }
                group("Purchase &History")
                {
                    Caption = 'Purchase &History';
                    action("Used as &Buy-from Vendor")
                    {
                        Caption = 'Used as &Buy-from Vendor';

                        trigger OnAction()
                        begin
                            //mki
                            //PurchInfoPaneMgt.LookupVendHistory("No.",FALSE);
                        end;
                    }
                    action("Used as &Pay-to Vendor")
                    {
                        Caption = 'Used as &Pay-to Vendor';

                        trigger OnAction()
                        begin
                            //mki
                            //PurchInfoPaneMgt.LookupVendHistory("No.",TRUE);
                        end;
                    }
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Vendor),
                                  "No." = FIELD("No.");
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(23),
                                  "No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action("Bank Accounts")
                {
                    Caption = 'Bank Accounts';
                    RunObject = Page "Vendor Bank Account Card";
                    RunPageLink = "Vendor No." = FIELD("No.");
                }
                action("Order &Addresses")
                {
                    Caption = 'Order &Addresses';
                    RunObject = Page "Order Address";
                    RunPageLink = "Vendor No." = FIELD("No.");
                }
                action("C&ontact")
                {
                    Caption = 'C&ontact';

                    trigger OnAction()
                    begin
                        Rec.ShowContact;
                    end;
                }
                separator(Action11)
                {
                }
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Vendor Statistics";
                    RunPageLink = "No." = FIELD("No."),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                    ShortCutKey = 'F7';
                }
                action("Entry Statistics")
                {
                    Caption = 'Entry Statistics';
                    RunObject = Page "Vendor Entry Statistics";
                    RunPageLink = "No." = FIELD("No."),
                                  "Date Filter" = FIELD("Date Filter"),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                }
                action(Purchases)
                {
                    Caption = 'Purchases';
                    RunObject = Page "Vendor Purchases";
                    RunPageLink = "No." = FIELD("No."),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                }
                separator(Action83)
                {
                }
                //here
                // action("Cross References")
                // {
                //     Caption = 'Cross References';
                //     RunObject = Page "Cross References";
                //     RunPageLink = "Cross-Reference Type" = CONST(Vendor),
                //                   "Cross-Reference Type No." = FIELD("No.");
                //     RunPageView = SORTING("Cross-Reference Type", "Cross-Reference Type No.");
                // }
                separator(Action108)
                {
                }
            }
            group("&Purchases")
            {
                Caption = '&Purchases';
                action(Items)
                {
                    Caption = 'Items';
                    RunObject = Page "Vendor Item Catalog";
                    RunPageLink = "Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Vendor No.", "Item No.");
                }
                action("Invoice &Discounts")
                {
                    Caption = 'Invoice &Discounts';
                    RunObject = Page "Vend. Invoice Discounts";
                    RunPageLink = Code = FIELD("Invoice Disc. Code");
                }
                action(Prices)
                {
                    Caption = 'Prices';
                    Image = ResourcePrice;
                    RunObject = Page "Purchase Prices";
                    RunPageLink = "Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Vendor No.");
                }
                action("Line Discounts")
                {
                    Caption = 'Line Discounts';
                    RunObject = Page "Purchase Line Discounts";
                    RunPageLink = "Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Vendor No.");
                }
                action("Prepa&yment Percentages")
                {
                    Caption = 'Prepa&yment Percentages';
                    RunObject = Page "Purchase Prepmt. Percentages";
                    RunPageLink = "Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Vendor No.");
                }
                action("S&td. Vend. Purchase Codes")
                {
                    Caption = 'S&td. Vend. Purchase Codes';
                    RunObject = Page "Standard Vendor Purchase Codes";
                    RunPageLink = "Vendor No." = FIELD("No.");
                }
                separator(Action117)
                {
                }
                action(Quotes)
                {
                    Caption = 'Quotes';
                    Image = Quote;
                    RunObject = Page "Purchase Quote";
                    RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", "Buy-from Vendor No.");
                }
                action("Blanket Orders")
                {
                    Caption = 'Blanket Orders';
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Purchase Order";
                    RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", "Buy-from Vendor No.");
                }
                action(Orders)
                {
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Purchase Order";
                    RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", "Buy-from Vendor No.", "No.");
                }
                action("Return Orders")
                {
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Purchase Return Order";
                    RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", "Buy-from Vendor No.", "No.");
                }
                action("Item &Tracking Entries")
                {
                    Caption = 'Item &Tracking Entries';
                    Image = ItemTrackingLedger;

                    trigger OnAction()
                    var
                        ItemTrackingMgt: Codeunit "Item Tracking Management";
                    begin
                        //ItemTrackingMgt.CallItemTrackingEntryForm(2,"No.",'','','','','');
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Apply Template")
                {
                    Caption = 'Apply Template';
                    Ellipsis = true;
                    Image = ApplyTemplate;

                    trigger OnAction()
                    var
                        TemplateMgt: Codeunit "Config. Template Management";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        TemplateMgt.UpdateFromTemplateSelection(RecRef);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                action(ReOpen)
                {
                    Caption = 'ReOpen';
                    Image = ReOpen;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if not Confirm('Are you sure you want to reopen the vendor, note this will block the vendor') then exit;
                        Rec.Blocked := Rec.Blocked::All;
                        Rec.Status := Rec.Status::New;
                        Rec.Modify;
                    end;
                }
                action(SendApprovalRequest)
                {
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        if ApprovalsMgmt.CheckVendorApprovalsWorkflowEnabled(Rec) then
                            ApprovalsMgmt.OnSendVendorForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OnCancelVendorApprovalRequest(Rec);
                    end;
                }
                action(ApprovalEntries)
                {
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ActivateFields;

        OnAfterGetCurrRecord;
    end;

    trigger OnFindRecord(Which: Text): Boolean
    var
        RecordFound: Boolean;
    begin
        RecordFound := Rec.Find(Which);
        CurrPage.Editable := RecordFound or (Rec.GetFilter("No.") = '');
        exit(RecordFound);
    end;

    trigger OnInit()
    begin
        ContactEditable := true;
        MapPointVisible := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //insert vendor type
        Rec."Vendor Type" := Rec."Vendor Type"::Landlord;
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        ActivateFields;
        if not MapMgt.TestSetup then
            MapPointVisible := false;
    end;

    var
        CalendarMgmt: Codeunit "Calendar Management";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        Text001: Label 'Do you want to allow payment tolerance for entries that are currently open?';
        Text002: Label 'Do you want to remove payment tolerance from entries that are currently open?';
        PurchInfoPaneMgt: Codeunit "Purchases Info-Pane Management";
        [InDataSet]
        MapPointVisible: Boolean;
        [InDataSet]
        ContactEditable: Boolean;
        [InDataSet]
        SocialListeningSetupVisible: Boolean;
        [InDataSet]
        SocialListeningVisible: Boolean;
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        [InDataSet]
        DocumentIsEditable: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

    //[Scope('Internal')]
    procedure ActivateFields()
    begin
        ContactEditable := Rec."Primary Contact No." = '';
    end;

    local procedure ContactOnAfterValidate()
    begin
        ActivateFields;
    end;

    local procedure ICPartnerCodeOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        ActivateFields;
    end;
}

