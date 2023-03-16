page 52186091 "Advocate Page"
{
    Caption = 'Advocate Page';
    Editable = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Approve,Request Approval';
    RefreshOnActivate = true;
    SourceTable = Vendor;
    SourceTableView = WHERE("Vendor Type" = CONST(Advocate));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = DocumentIsEditable;
                field("No."; Rec."No.")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Name; Rec.Name)
                {
                    Editable = true;
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("KRA Pin No."; Rec."KRA Pin No.")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Address 2"; Rec."Address 2")
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                    Importance = Promoted;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                }
                field("Primary Contact No."; Rec."Primary Contact No.")
                {

                    trigger OnValidate()
                    begin
                        ActivateFields;
                    end;
                }
                field(Contact; Rec.Contact)
                {
                    Editable = ContactEditable;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        ContactOnAfterValidate;
                    end;
                }
                field(City; Rec.City)
                {
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
                field("Purchaser Code"; Rec."Purchaser Code")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                }
                field("Vendor Type"; Rec."Vendor Type")
                {
                }
                field("Vendor Credit Limit(LCY)"; Rec."Vendor Credit Limit(LCY)")
                {
                }
                field(Trainers; Rec.Trainers)
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = true;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                Editable = DocumentIsEditable;
                field("Phone No.2"; Rec."Phone No.")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("Fax No."; Rec."Fax No.")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Importance = Promoted;
                }
                field("Home Page"; Rec."Home Page")
                {
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Pay-to Vendor No."; Rec."Pay-to Vendor No.")
                {
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {

                    trigger OnDrillDown()
                    var
                        VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
                    begin
                        VATRegistrationLogMgt.AssistEditVendorVATReg(Rec);
                    end;
                }
                field(GLN; Rec.GLN)
                {
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ShowMandatory = true;
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    Importance = Promoted;
                    ShowMandatory = true;
                }
                field("Invoice Disc. Code"; Rec."Invoice Disc. Code")
                {
                    NotBlank = true;
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                }
                field("Prepayment %"; Rec."Prepayment %")
                {
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                Editable = DocumentIsEditable;
                field("Application Method"; Rec."Application Method")
                {
                }
                field("Partner Type"; Rec."Partner Type")
                {
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    Importance = Promoted;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    Importance = Promoted;
                }
                field(Priority; Rec.Priority)
                {
                }
                field("Cash Flow Payment Terms Code"; Rec."Cash Flow Payment Terms Code")
                {
                }
                field("Our Account No."; Rec."Our Account No.")
                {
                }
                field("Block Payment Tolerance"; Rec."Block Payment Tolerance")
                {

                    trigger OnValidate()
                    begin
                        if Rec."Block Payment Tolerance" then begin
                            if Confirm(Text002, false) then
                                PaymentToleranceMgt.DelTolVendLedgEntry(Rec);
                        end else begin
                            if Confirm(Text001, false) then
                                PaymentToleranceMgt.CalcTolVendLedgEntry(Rec);
                        end;
                    end;
                }
                field("Creditor No."; Rec."Creditor No.")
                {
                }
                field("Preferred Bank Account Code"; Rec."Preferred Bank Account Code")
                {
                }
            }
            group(Receiving)
            {
                Caption = 'Receiving';
                Editable = DocumentIsEditable;
                field("Location Code"; Rec."Location Code")
                {
                    Importance = Promoted;
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    Importance = Promoted;
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    Importance = Promoted;
                }
                field("Base Calendar Code"; Rec."Base Calendar Code")
                {
                    DrillDown = false;
                }
                // field("Customized Calendar"; Rec.CalendarMgmt.CustomizedCalendarExistText(CustomizedCalendar."Source Type"::Vendor, "No.", '', "Base Calendar Code"))
                // {
                //     Caption = 'Customized Calendar';
                //     Editable = false;

                //     trigger OnDrillDown()
                //     begin
                //         CurrPage.SaveRecord;
                //         Rec.TestField("Base Calendar Code");
                //         CalendarMgmt.ShowCustomizedCalendar(CustomizedCalEntry."Source Type"::Vendor, "No.", '', "Base Calendar Code");
                //     end;
                // }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                Editable = DocumentIsEditable;
                field("Currency Code"; Rec."Currency Code")
                {
                    Importance = Promoted;
                }
                field("Language Code"; Rec."Language Code")
                {
                }
            }
        }
        area(factboxes)
        {
            // part(Control17; "Social Listening FactBox")
            // {
            //     SubPageLink = "Source Type" = CONST(Vendor),
            //                   "Source No." = FIELD("No.");
            //     Visible = SocialListeningVisible;
            // }
            // part(Control19; "Social Listening Setup FactBox")
            // {
            //     SubPageLink = "Source Type" = CONST(Vendor),
            //                   "Source No." = FIELD("No.");
            //     UpdatePropagation = Both;
            //     Visible = SocialListeningSetupVisible;
            // }
            part(Control1904651607; "Vendor Statistics FactBox")
            {
                SubPageLink = "No." = FIELD("No."),
                              "Currency Filter" = FIELD("Currency Filter"),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                Visible = true;
            }
            part(Control1903435607; "Vendor Hist. Buy-from FactBox")
            {
                SubPageLink = "No." = FIELD("No."),
                              "Currency Filter" = FIELD("Currency Filter"),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                Visible = true;
            }
            part(Control1906949207; "Vendor Hist. Pay-to FactBox")
            {
                SubPageLink = "No." = FIELD("No."),
                              "Currency Filter" = FIELD("Currency Filter"),
                              "Date Filter" = FIELD("Date Filter"),
                              "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                Visible = false;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
            }
            systempart(Control1900383207; Links)
            {
                Visible = true;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ven&dor")
            {
                Caption = 'Ven&dor';
                Image = Vendor;
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
                    Image = BankAccount;
                    RunObject = Page "Vendor Bank Account List";
                    RunPageLink = "Vendor No." = FIELD("No.");
                }
                action("C&ontact")
                {
                    AccessByPermission = TableData Contact = R;
                    Caption = 'C&ontact';
                    Image = ContactPerson;

                    trigger OnAction()
                    begin
                        Rec.ShowContact;
                    end;
                }
                action("Order &Addresses")
                {
                    Caption = 'Order &Addresses';
                    Image = Addresses;
                    RunObject = Page "Order Address List";
                    RunPageLink = "Vendor No." = FIELD("No.");
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Vendor),
                                  "No." = FIELD("No.");
                }
                // action("Cross References")
                // {
                //     Caption = 'Cross References';
                //     Image = Change;
                //     RunObject = Page "Cross References";
                //     RunPageLink = "Cross-Reference Type" = CONST(Vendor),
                //                   "Cross-Reference Type No." = FIELD("No.");
                //     RunPageView = SORTING("Cross-Reference Type", "Cross-Reference Type No.");
                // }
                action("Online Map")
                {
                    Caption = 'Online Map';
                    Image = Map;

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
                action(VendorReportSelections)
                {
                    Caption = 'Document Layouts';
                    Image = Quote;
                    Visible = false;

                    trigger OnAction()
                    var
                        CustomReportSelection: Record "Custom Report Selection";
                    begin
                        CustomReportSelection.SetRange("Source Type", DATABASE::Vendor);
                        CustomReportSelection.SetRange("Source No.", Rec."No.");
                        PAGE.RunModal(PAGE::"Vendor Report Selections", CustomReportSelection);
                    end;
                }
                separator(Action11)
                {
                }
                separator(Action83)
                {
                    Caption = '';
                }
                separator(Action108)
                {
                }
            }
            group("&Purchases")
            {
                Caption = '&Purchases';
                Image = Purchasing;
                action(Items)
                {
                    Caption = 'Items';
                    Image = Item;
                    RunObject = Page "Vendor Item Catalog";
                    RunPageLink = "Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Vendor No.", "Item No.");
                }
                action("Invoice &Discounts")
                {
                    Caption = 'Invoice &Discounts';
                    Image = CalculateInvoiceDiscount;
                    RunObject = Page "Vend. Invoice Discounts";
                    RunPageLink = Code = FIELD("Invoice Disc. Code");
                }
                action(Prices)
                {
                    Caption = 'Prices';
                    Image = Price;
                    RunObject = Page "Purchase Prices";
                    RunPageLink = "Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Vendor No.");
                }
                action("Line Discounts")
                {
                    Caption = 'Line Discounts';
                    Image = LineDiscount;
                    RunObject = Page "Purchase Line Discounts";
                    RunPageLink = "Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Vendor No.");
                }
                action("Prepa&yment Percentages")
                {
                    Caption = 'Prepa&yment Percentages';
                    Image = PrepaymentPercentages;
                    RunObject = Page "Purchase Prepmt. Percentages";
                    RunPageLink = "Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Vendor No.");
                }
                action("S&td. Vend. Purchase Codes")
                {
                    Caption = 'S&td. Vend. Purchase Codes';
                    Image = CodesList;
                    RunObject = Page "Standard Vendor Purchase Codes";
                    RunPageLink = "Vendor No." = FIELD("No.");
                }
                separator(Action117)
                {
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Administration;
                action(Quotes)
                {
                    Caption = 'Quotes';
                    Image = Quote;
                    RunObject = Page "Purchase Quotes";
                    RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", "Buy-from Vendor No.");
                }
                action(Orders)
                {
                    Caption = 'Orders';
                    Image = Document;
                    RunObject = Page "Purchase Order List";
                    RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", "Buy-from Vendor No.");
                }
                action("Return Orders")
                {
                    Caption = 'Return Orders';
                    Image = ReturnOrder;
                    RunObject = Page "Purchase Return Order List";
                    RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", "Buy-from Vendor No.");
                }
                action("Blanket Orders")
                {
                    Caption = 'Blanket Orders';
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Purchase Orders";
                    RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Document Type", "Buy-from Vendor No.");
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    Image = VendorLedger;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page "Vendor Ledger Entries";
                    RunPageLink = "Vendor No." = FIELD("No.");
                    RunPageView = SORTING("Vendor No.");
                    ShortCutKey = 'Ctrl+F7';
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
                action(Purchases)
                {
                    Caption = 'Purchases';
                    Image = Purchase;
                    RunObject = Page "Vendor Purchases";
                    RunPageLink = "No." = FIELD("No."),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                }
                action("Entry Statistics")
                {
                    Caption = 'Entry Statistics';
                    Image = EntryStatistics;
                    RunObject = Page "Vendor Entry Statistics";
                    RunPageLink = "No." = FIELD("No."),
                                  "Date Filter" = FIELD("Date Filter"),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter");
                }
                action("Statistics by C&urrencies")
                {
                    Caption = 'Statistics by C&urrencies';
                    Image = Currencies;
                    RunObject = Page "Vend. Stats. by Curr. Lines";
                    RunPageLink = "Vendor Filter" = FIELD("No."),
                                  "Global Dimension 1 Filter" = FIELD("Global Dimension 1 Filter"),
                                  "Global Dimension 2 Filter" = FIELD("Global Dimension 2 Filter"),
                                  "Date Filter" = FIELD("Date Filter");
                }
                action("Item &Tracking Entries")
                {
                    Caption = 'Item &Tracking Entries';
                    Image = ItemTrackingLedger;

                    trigger OnAction()
                    var
                        ItemTrackingDocMgt: Codeunit "Item Tracking Doc. Management";
                    begin
                        // ItemTrackingDocMgt.ShowItemTrackingForMasterData(2, "No.", '', '', '', '', '');
                    end;
                }
            }
        }
        area(creation)
        {
            action("Blanket Purchase Order")
            {
                Caption = 'Blanket Purchase Order';
                Image = BlanketOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Blanket Purchase Order";
                RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                RunPageMode = Create;
            }
            action("Purchase Quote")
            {
                Caption = 'Purchase Quote';
                Image = Quote;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Purchase Quote";
                RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                RunPageMode = Create;
            }
            action("Purchase Invoice")
            {
                Caption = 'Purchase Invoice';
                Image = Invoice;
                Promoted = true;
                PromotedCategory = New;
                RunObject = Page "Purchase Invoice";
                RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                RunPageMode = Create;
            }
            action("Purchase Order")
            {
                Caption = 'Purchase Order';
                Image = Document;
                Promoted = true;
                PromotedCategory = New;
                RunObject = Page "Purchase Order";
                RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                RunPageMode = Create;
            }
            action("Purchase Credit Memo")
            {
                Caption = 'Purchase Credit Memo';
                Image = CreditMemo;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Purchase Credit Memo";
                RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                RunPageMode = Create;
            }
            action("Purchase Return Order")
            {
                Caption = 'Purchase Return Order';
                Image = ReturnOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Purchase Return Order";
                RunPageLink = "Buy-from Vendor No." = FIELD("No.");
                RunPageMode = Create;
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
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
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Apply Template")
                {
                    Caption = 'Apply Template';
                    Ellipsis = true;
                    Image = ApplyTemplate;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ConfigTemplateMgt: Codeunit "Config. Template Management";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        ConfigTemplateMgt.UpdateFromTemplateSelection(RecRef);
                    end;
                }
            }
            action("Payment Journal")
            {
                Caption = 'Payment Journal';
                Image = PaymentJournal;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Payment Journal";
            }
            action("Purchase Journal")
            {
                Caption = 'Purchase Journal';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Purchase Journal";
            }
        }
        area(reporting)
        {
            action("Vendor - Labels")
            {
                Caption = 'Vendor - Labels';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                // RunObject = Report "Vendor - Labels";
            }
            action("Vendor - Balance to Date")
            {
                Caption = 'Vendor - Balance to Date';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Vendor - Balance to Date";
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        ActivateFields;
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(Rec.RecordId);
        OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    trigger OnAfterGetRecord()
    begin
        ActivateFields;
        SetControlAppearance;
        SetStatusEditable;
    end;

    trigger OnInit()
    begin
        ContactEditable := true;
        MapPointVisible := true;
        SetStatusEditable;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Vendor Type" := Rec."Vendor Type"::Advocate;
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
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        Text001: Label 'Do you want to allow payment tolerance for entries that are currently open?';
        Text002: Label 'Do you want to remove payment tolerance from entries that are currently open?';
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

    local procedure ActivateFields()
    begin
        SetSocialListeningFactboxVisibility;
        ContactEditable := Rec."Primary Contact No." = '';
    end;

    local procedure ContactOnAfterValidate()
    begin
        ActivateFields;
    end;

    local procedure SetSocialListeningFactboxVisibility()
    var
    //SocialListeningMgt: Codeunit "Social Listening Management";
    begin
        //SocialListeningMgt.GetVendFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    local procedure SetStatusEditable()
    begin
        if Rec.Status = Rec.Status::Approved then
            DocumentIsEditable := false
        else
            DocumentIsEditable := true
    end;
}

