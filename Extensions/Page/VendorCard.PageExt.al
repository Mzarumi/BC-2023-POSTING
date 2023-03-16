#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185441 pageextension52185441 extends "Vendor Card"
{

    //Unsupported feature: Property Modification (PromotedActionCategoriesML) on ""Vendor Card"(Page 26)".

    Editable = true;

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Vendor Card"(Page 26)".

    layout
    {
        modify(General)
        {
            Editable = DocumentIsEditable;
        }
        modify("No.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Importance) on ""No."(Control 2)".

        }
        // modify(Name)
        // {
        //     ApplicationArea = Basic;
        //     Editable = true;
        // }
        modify(Blocked)
        {
            ApplicationArea = Basic;
            Editable = false;
        }
        modify("Last Date Modified")
        {
            ApplicationArea = Basic;
        }
        modify("Balance (LCY)")
        {
            ApplicationArea = Basic;
        }
        // modify("Balance Due (LCY)")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (SourceExpr) on ""Balance Due (LCY)"(Control 45)".


        //     //Unsupported feature: Property Modification (Name) on ""Balance Due (LCY)"(Control 45)".

        // }
        modify("Search Name")
        {
            ApplicationArea = Basic;
        }
        modify("Responsibility Center")
        {
            ApplicationArea = Basic;
        }
        modify("Address & Contact")
        {
            Caption = 'Communication';

            //Unsupported feature: Property Modification (Name) on ""Address & Contact"(Control 1902768601)".

            Editable = DocumentIsEditable;
        }
        // modify(AddressDetails)
        // {

        //     //Unsupported feature: Property Modification (ControlType) on "AddressDetails(Control 43)".


        //     //Unsupported feature: Property Modification (Name) on "AddressDetails(Control 43)".


        //     //Unsupported feature: Property Insertion (SourceExpr) on "AddressDetails(Control 43)".

        //     //ApplicationArea = Basic;
        // }
        modify("Address 2")
        {

            //Unsupported feature: Property Modification (Level) on ""Address 2"(Control 8)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Address 2"(Control 8)".


            //Unsupported feature: Property Modification (Name) on ""Address 2"(Control 8)".

            Caption = 'Physical Address';
        }
        // modify("Country/Region Code")
        // {

        //     //Unsupported feature: Property Modification (Level) on ""Country/Region Code"(Control 81)".

        //     ApplicationArea = Basic;
        // }
        modify(City)
        {

            //Unsupported feature: Property Modification (Level) on "City(Control 10)".

            ApplicationArea = Basic;
        }
        modify("Post Code")
        {

            //Unsupported feature: Property Modification (Level) on ""Post Code"(Control 79)".

            ApplicationArea = Basic;
        }
        // modify(ShowMap)
        // {

        //     //Unsupported feature: Property Modification (Level) on "ShowMap(Control 49)".


        //     //Unsupported feature: Property Modification (Name) on "ShowMap(Control 49)".

        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (SourceExpr) on "ShowMap(Control 49)".

        //     ShowMandatory = true;
        // }
        // modify(Contact)
        // {

        //     //Unsupported feature: Property Modification (ControlType) on "Contact(Control 44)".


        //     //Unsupported feature: Property Modification (Name) on "Contact(Control 44)".


        //     //Unsupported feature: Property Insertion (SourceExpr) on "Contact(Control 44)".


        //     //Unsupported feature: Property Insertion (Importance) on "Contact(Control 44)".

        //     // ShowMandatory = true;
        //     // ApplicationArea = Basic;
        // }
        modify(Control16)
        {

            //Unsupported feature: Property Modification (Level) on "Control16(Control 16)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on "Control16(Control 16)".


            //Unsupported feature: Property Insertion (Visible) on "Control16(Control 16)".

        }
        modify("Phone No.")
        {

            //Unsupported feature: Property Modification (Level) on ""Phone No."(Control 12)".

            ApplicationArea = Basic;
        }
        modify("E-Mail")
        {

            //Unsupported feature: Property Modification (Level) on ""E-Mail"(Control 48)".

            ApplicationArea = Basic;
        }
        modify("Home Page")
        {

            //Unsupported feature: Property Modification (Level) on ""Home Page"(Control 86)".

            ApplicationArea = Basic;
        }
        modify("Language Code")
        {

            //Unsupported feature: Property Modification (Level) on ""Language Code"(Control 56)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Language Code"(Control 56)".

        }
        modify("VAT Registration No.")
        {
            ApplicationArea = Basic;
        }
        modify(GLN)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on "GLN(Control 25)".

        }
        modify("Pay-to Vendor No.")
        {
            ApplicationArea = Basic;
        }
        modify("Invoice Disc. Code")
        {
            ApplicationArea = Basic;
        }
        modify("Prices Including VAT")
        {
            ApplicationArea = Basic;
        }
        // modify("Posting Details")
        // {

        //     //Unsupported feature: Property Modification (ControlType) on ""Posting Details"(Control 46)".


        //     //Unsupported feature: Property Modification (Name) on ""Posting Details"(Control 46)".


        //     //Unsupported feature: Property Insertion (SourceExpr) on ""Posting Details"(Control 46)".


        //     //Unsupported feature: Property Insertion (Visible) on ""Posting Details"(Control 46)".

        //   //  ApplicationArea = Basic;
        // }
        modify("Gen. Bus. Posting Group")
        {

            //Unsupported feature: Property Modification (Level) on ""Gen. Bus. Posting Group"(Control 60)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Importance) on ""Gen. Bus. Posting Group"(Control 60)".

        }
        modify("VAT Bus. Posting Group")
        {

            //Unsupported feature: Property Modification (Level) on ""VAT Bus. Posting Group"(Control 90)".

            ApplicationArea = Basic;
            ShowMandatory = true;
        }
        modify("Vendor Posting Group")
        {

            //Unsupported feature: Property Modification (Level) on ""Vendor Posting Group"(Control 32)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Importance) on ""Vendor Posting Group"(Control 32)".

        }
        modify("Currency Code")
        {

            //Unsupported feature: Property Modification (Level) on ""Currency Code"(Control 52)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Importance) on ""Currency Code"(Control 52)".


            //Unsupported feature: Property Insertion (Visible) on ""Currency Code"(Control 52)".

        }
        modify(Payments)
        {
            Editable = DocumentIsEditable;
        }
        modify("Application Method")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Application Method"(Control 36)".

        }
        modify("Payment Terms Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Payment Terms Code"(Control 38)".

        }
        modify("Payment Method Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Payment Method Code"(Control 40)".

        }
        modify("Preferred Bank Account Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Preferred Bank Account Code"(Control 9)".


            //Unsupported feature: Property Modification (Name) on ""Preferred Bank Account Code"(Control 9)".


            //Unsupported feature: Property Insertion (Visible) on ""Preferred Bank Account Code"(Control 9)".

        }
        modify("Cash Flow Payment Terms Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Cash Flow Payment Terms Code"(Control 3)".


            //Unsupported feature: Property Modification (Name) on ""Cash Flow Payment Terms Code"(Control 3)".

            Caption = 'P.O.Box';
        }
        modify("Creditor No.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Creditor No."(Control 13)".

        }
        modify(Receiving)
        {
            Editable = DocumentIsEditable;
        }
        modify("Location Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Location Code"(Control 100)".

        }
        modify("Shipment Method Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Shipment Method Code"(Control 28)".

        }
        modify("Lead Time Calculation")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Lead Time Calculation"(Control 96)".

        }
        modify("Base Calendar Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Base Calendar Code"(Control 112)".

        }
        modify("Customized Calendar")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Customized Calendar"(Control 121)".

        }

        //Unsupported feature: Property Modification (Name) on "VendorStatisticsFactBox(Control 1904651607)".


        //Unsupported feature: Property Insertion (Visible) on "VendorStatisticsFactBox(Control 1904651607)".


        //Unsupported feature: Property Modification (Name) on "VendorHistBuyFromFactBox(Control 1903435607)".


        //Unsupported feature: Property Insertion (Visible) on "VendorHistBuyFromFactBox(Control 1903435607)".


        //Unsupported feature: Property Modification (Name) on "VendorHistPayToFactBox(Control 1906949207)".


        //Unsupported feature: Property Insertion (Visible) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Insertion (Visible) on "Control1905767507(Control 1905767507)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 2)".


        //Unsupported feature: Property Deletion (Visible) on ""No."(Control 2)".

        modify(Name)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Name(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Blocked(Control 24)".

        modify("Privacy Blocked")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Last Date Modified"(Control 26)".


        //Unsupported feature: Property Deletion (Importance) on ""Last Date Modified"(Control 26)".


        //Unsupported feature: Code Insertion (VariableCollection) on ""Balance (LCY)"(Control 92).OnDrillDown".

        //trigger (Variable: VendLedgEntry)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on ""Balance (LCY)"(Control 92).OnDrillDown".

        //trigger OnDrillDown()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        OpenVendorLedgerEntries(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DtldVendLedgEntry.SETRANGE("Vendor No.","No.");
        COPYFILTER("Global Dimension 1 Filter",DtldVendLedgEntry."Initial Entry Global Dim. 1");
        COPYFILTER("Global Dimension 2 Filter",DtldVendLedgEntry."Initial Entry Global Dim. 2");
        COPYFILTER("Currency Filter",DtldVendLedgEntry."Currency Code");
        VendLedgEntry.DrillDownOnEntries(DtldVendLedgEntry);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Balance (LCY)"(Control 92)".

        modify("Balance Due (LCY)")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Balance Due (LCY)"(Control 45)".

        modify("Document Sending Profile")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Search Name"(Control 18)".


        //Unsupported feature: Property Deletion (Importance) on ""Search Name"(Control 18)".

        modify("IC Partner Code")
        {
            Visible = false;
        }
        modify("Purchaser Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Responsibility Center"(Control 55)".


        //Unsupported feature: Property Deletion (Importance) on ""Responsibility Center"(Control 55)".

        modify("Disable Search by Name")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (GroupType) on ""Address & Contact"(Control 1902768601)".


        //Unsupported feature: Property Deletion (CaptionML) on "AddressDetails(Control 43)".


        //Unsupported feature: Property Deletion (GroupType) on "AddressDetails(Control 43)".

        modify(Address)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Address 2"(Control 8)".

        modify("Country/Region Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Country/Region Code"(Control 81)".


        //Unsupported feature: Property Deletion (ToolTipML) on "City(Control 10)".

        modify(Control199)
        {
            Visible = false;
        }
        modify(County)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Post Code"(Control 79)".

        modify(ShowMap)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "ShowMap(Control 49)".


        //Unsupported feature: Property Deletion (Editable) on "ShowMap(Control 49)".


        //Unsupported feature: Property Deletion (Style) on "ShowMap(Control 49)".


        //Unsupported feature: Property Deletion (StyleExpr) on "ShowMap(Control 49)".


        //Unsupported feature: Property Deletion (ShowCaption) on "ShowMap(Control 49)".


        //Unsupported feature: Property Deletion (CaptionML) on "Contact(Control 44)".


        //Unsupported feature: Property Deletion (GroupType) on "Contact(Control 44)".

        // modify("Primary Contact No.")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on "Control16(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Phone No."(Control 12)".


        //Unsupported feature: Property Deletion (ExtendedDatatype) on ""E-Mail"(Control 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""E-Mail"(Control 48)".

        modify("Fax No.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Home Page"(Control 86)".

        modify("Our Account No.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Language Code"(Control 56)".


        //Unsupported feature: Property Deletion (Importance) on ""Language Code"(Control 56)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Registration No."(Control 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on "GLN(Control 25)".


        //Unsupported feature: Property Deletion (Importance) on "GLN(Control 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Vendor No."(Control 30)".


        //Unsupported feature: Property Deletion (Importance) on ""Pay-to Vendor No."(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Invoice Disc. Code"(Control 34)".


        //Unsupported feature: Property Deletion (Importance) on ""Invoice Disc. Code"(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prices Including VAT"(Control 94)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Posting Details"(Control 46)".


        //Unsupported feature: Property Deletion (GroupType) on ""Posting Details"(Control 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Bus. Posting Group"(Control 60)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Bus. Posting Group"(Control 90)".


        //Unsupported feature: Property Deletion (Importance) on ""VAT Bus. Posting Group"(Control 90)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Posting Group"(Control 32)".

        // modify("Foreign Trade")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 52)".

        modify("Prepayment %")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Application Method"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Terms Code"(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Method Code"(Control 40)".

        modify(Priority)
        {
            Visible = false;
        }
        modify("Block Payment Tolerance")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Preferred Bank Account Code"(Control 9)".

        modify("Partner Type")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Cash Flow Payment Terms Code"(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Creditor No."(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Location Code"(Control 100)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shipment Method Code"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Lead Time Calculation"(Control 96)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Base Calendar Code"(Control 112)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Customized Calendar"(Control 121)".

        modify(Control82)
        {
            Visible = false;
        }
        modify("Attached Documents")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "VendorStatisticsFactBox(Control 1904651607)".

        modify(AgedAccPayableChart)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control17(Control 17)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control19(Control 19)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "VendorHistBuyFromFactBox(Control 1903435607)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "VendorHistPayToFactBox(Control 1906949207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "WorkflowStatus(Control 41)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("Cash Flow Payment Terms Code")
        {
            // field("Primary Contact No.";Rec."Primary Contact No.")
            // {
            //     ApplicationArea = Basic;
            //     Visible = false;

            //     trigger OnValidate()
            //     begin
            //         ActivateFields;
            //     end;
            // }
        }
        addafter("Posting Details")
        {
            //field(Status; Status)
            // {
            //     ApplicationArea = Basic;
            //     Editable = false;
            // }
        }
        addafter(Receiving)
        {
            // group("Foreign Trade")
            // {
            //     Caption = 'Foreign Trade';
            //     Editable = DocumentIsEditable;
            // }
        }
        moveafter(Name; ShowMap)
        // moveafter("KRA Pin No.";"Address 2")
        // moveafter("Physical Address";"Cash Flow Payment Terms Code")
        // moveafter("P.O.Box";"Post Code")
        // moveafter("Post Code";"Country/Region Code")
        // moveafter("Country/Region Code";"Phone No.")
        // moveafter("Phone No.";Control16)
        // moveafter(Contact;City)
        // moveafter(City;"Search Name")
        // moveafter("Search Name";"Balance (LCY)")
        // moveafter("Balance (LCY)";"Responsibility Center")
        // moveafter("Last Date Modified";AddressDetails)
        // moveafter("Vendor Type";"Posting Details")
        // moveafter("Vendor Credit Limit(LCY)";"Address & Contact")
        // moveafter(Communication;Contact)
        moveafter("Home Page"; Invoicing)
        moveafter(Invoicing; "Pay-to Vendor No.")
        moveafter("Pay-to Vendor No."; "VAT Registration No.")
        moveafter(GLN; "Gen. Bus. Posting Group")
        moveafter("Vendor Posting Group"; "Invoice Disc. Code")
        moveafter("Prices Including VAT"; Payments)
        moveafter("Payment Method Code"; "Creditor No.")
        moveafter("Creditor No."; "Preferred Bank Account Code")
        //     moveafter("Preferred Bank Account";Receiving)
        //     moveafter("Customized Calendar";"Currency Code")
        //     moveafter(Control1900000007;Control17)
    }
    actions
    {
        modify(Dimensions)
        {
            ApplicationArea = Basic;
        }
        modify("Bank Accounts")
        {
            ApplicationArea = Basic;
        }
        modify(ContactBtn)
        {

            //Unsupported feature: Property Modification (Name) on "ContactBtn(Action 14)".

            ApplicationArea = Basic;
        }
        modify(OrderAddresses)
        {

            //Unsupported feature: Property Modification (Name) on "OrderAddresses(Action 54)".

            ApplicationArea = Basic;
        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        // modify("Cross References")
        // {
        //     ApplicationArea = Basic;
        // }
        modify(VendorReportSelections)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on "VendorReportSelections(Action 225)".

        }
        modify(Items)
        {
            ApplicationArea = Basic;
        }
        modify("Invoice &Discounts")
        {
            ApplicationArea = Basic;
        }
        modify(Prices)
        {
            ApplicationArea = Basic;
        }
        modify("Line Discounts")
        {
            ApplicationArea = Basic;
        }
        modify("Prepa&yment Percentages")
        {
            ApplicationArea = Basic;
        }
        modify("Recurring Purchase Lines")
        {
            Caption = 'S&td. Vend. Purchase Codes';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Recurring Purchase Lines"(Action 123)".

        }
        modify(Quotes)
        {
            ApplicationArea = Basic;
        }
        modify(Orders)
        {
            ApplicationArea = Basic;
        }
        modify("Return Orders")
        {
            ApplicationArea = Basic;
        }
        modify("Blanket Orders")
        {
            ApplicationArea = Basic;
        }
        modify("Ledger E&ntries")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunPageView) on ""Ledger E&ntries"(Action 70)".


            //Unsupported feature: Property Modification (Promoted) on ""Ledger E&ntries"(Action 70)".


            //Unsupported feature: Property Modification (PromotedCategory) on ""Ledger E&ntries"(Action 70)".

        }
        modify(Statistics)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Statistics(Action 66)".

        }
        modify(Purchases)
        {
            ApplicationArea = Basic;
        }
        modify("Entry Statistics")
        {
            ApplicationArea = Basic;
        }
        modify("Statistics by C&urrencies")
        {
            ApplicationArea = Basic;
        }
        modify("Item &Tracking Entries")
        {
            ApplicationArea = Basic;
        }
        modify(NewBlanketPurchaseOrder)
        {

            //Unsupported feature: Property Modification (Name) on "NewBlanketPurchaseOrder(Action 1903213705)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "NewBlanketPurchaseOrder(Action 1903213705)".

        }
        modify(NewPurchaseQuote)
        {

            //Unsupported feature: Property Modification (Name) on "NewPurchaseQuote(Action 1901469405)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "NewPurchaseQuote(Action 1901469405)".

        }
        modify(NewPurchaseInvoice)
        {

            //Unsupported feature: Property Modification (Name) on "NewPurchaseInvoice(Action 1907709505)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Image) on "NewPurchaseInvoice(Action 1907709505)".


            //Unsupported feature: Property Modification (PromotedCategory) on "NewPurchaseInvoice(Action 1907709505)".

        }
        modify(NewPurchaseOrder)
        {

            //Unsupported feature: Property Modification (Name) on "NewPurchaseOrder(Action 1907375405)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "NewPurchaseOrder(Action 1907375405)".

        }
        modify(NewPurchaseCrMemo)
        {

            //Unsupported feature: Property Modification (Name) on "NewPurchaseCrMemo(Action 1905024805)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Promoted) on "NewPurchaseCrMemo(Action 1905024805)".


            //Unsupported feature: Property Modification (PromotedCategory) on "NewPurchaseCrMemo(Action 1905024805)".

        }
        modify(NewPurchaseReturnOrder)
        {

            //Unsupported feature: Property Modification (Name) on "NewPurchaseReturnOrder(Action 1904749705)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "NewPurchaseReturnOrder(Action 1904749705)".

        }
        modify(Approve)
        {
            ApplicationArea = Basic;
        }
        modify(Reject)
        {
            ApplicationArea = Basic;
        }
        modify(Delegate)
        {
            ApplicationArea = Basic;
        }
        modify(SendApprovalRequest)
        {
            ApplicationArea = Basic;
            //Enabled = not OpenApprovalEntriesExist;
        }
        modify(CancelApprovalRequest)
        {
            ApplicationArea = Basic;
            //Enabled = OpenApprovalEntriesExist;

            //Unsupported feature: Property Modification (Image) on "CancelApprovalRequest(Action 27)".

        }
        modify(Flow)
        {

            //Unsupported feature: Property Modification (ActionType) on "Flow(Action 83)".


            //Unsupported feature: Property Modification (Name) on "Flow(Action 83)".

            Caption = '';
        }
        modify(ApplyTemplate)
        {

            //Unsupported feature: Property Modification (Name) on "ApplyTemplate(Action 131)".

            ApplicationArea = Basic;
        }
        modify("Create Payments")
        {
            Caption = 'Payment Journal';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Name) on ""Create Payments"(Action 1902327104)".

        }
        modify("Purchase Journal")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Promoted) on ""Purchase Journal"(Action 1906371704)".


            //Unsupported feature: Property Insertion (PromotedCategory) on ""Purchase Journal"(Action 1906371704)".

        }
        // modify(ActionContainer102)
        // {

        //     //Unsupported feature: Property Modification (Level) on "ActionContainer102(Action 102)".


        //     //Unsupported feature: Property Modification (ActionType) on "ActionContainer102(Action 102)".


        //     //Unsupported feature: Property Modification (Name) on "ActionContainer102(Action 102)".

        //     Caption = 'Online Map';

        //     //Unsupported feature: Property Insertion (Image) on "ActionContainer102(Action 102)".

        //     ApplicationArea = Basic;
        // }
        // modify("Vendor - Summary Aging")
        // {

        //     //Unsupported feature: Property Modification (Level) on ""Vendor - Summary Aging"(Action 57)".

        //     Caption = 'ReOpen';
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (Image) on ""Vendor - Summary Aging"(Action 57)".


        //     //Unsupported feature: Property Modification (PromotedCategory) on ""Vendor - Summary Aging"(Action 57)".


        //     //Unsupported feature: Property Modification (Name) on ""Vendor - Summary Aging"(Action 57)".

        //}
        // modify("Vendor - Labels")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Insertion (RunObject) on ""Vendor - Labels"(Action 1905916106)".

        // }
        // modify("Vendor - Balance to Date")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Insertion (RunObject) on ""Vendor - Balance to Date"(Action 1904504206)".

        // }

        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 184)".


        //Unsupported feature: Property Deletion (Promoted) on "Dimensions(Action 184)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Dimensions(Action 184)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Dimensions(Action 184)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bank Accounts"(Action 87)".


        //Unsupported feature: Property Deletion (Promoted) on ""Bank Accounts"(Action 87)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Bank Accounts"(Action 87)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ContactBtn(Action 14)".


        //Unsupported feature: Property Deletion (Promoted) on "ContactBtn(Action 14)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "ContactBtn(Action 14)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "ContactBtn(Action 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on "OrderAddresses(Action 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 68)".


        //Unsupported feature: Property Deletion (Promoted) on ""Co&mments"(Action 68)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Co&mments"(Action 68)".

        // modify(ApprovalEntries)
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Cross References"(Action 84)".


        //Unsupported feature: Property Deletion (Promoted) on ""Cross References"(Action 84)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Cross References"(Action 84)".


        //Unsupported feature: Property Deletion (ToolTipML) on "VendorReportSelections(Action 225)".


        //Unsupported feature: Property Deletion (Promoted) on "VendorReportSelections(Action 225)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "VendorReportSelections(Action 225)".

        modify(Attachments)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Items(Action 118)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Invoice &Discounts"(Action 73)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Prices(Action 72)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Line Discounts"(Action 116)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepa&yment Percentages"(Action 129)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Recurring Purchase Lines"(Action 123)".

        modify("Mapping Text to Account")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Quotes(Action 74)".


        //Unsupported feature: Property Deletion (Promoted) on "Quotes(Action 74)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Quotes(Action 74)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Orders(Action 75)".


        //Unsupported feature: Property Deletion (Promoted) on "Orders(Action 75)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Orders(Action 75)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Return Orders"(Action 99)".


        //Unsupported feature: Property Deletion (Promoted) on ""Return Orders"(Action 99)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Return Orders"(Action 99)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Blanket Orders"(Action 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ledger E&ntries"(Action 70)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on ""Ledger E&ntries"(Action 70)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Statistics(Action 66)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Statistics(Action 66)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Purchases(Action 69)".


        //Unsupported feature: Property Deletion (Promoted) on "Purchases(Action 69)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Purchases(Action 69)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Entry Statistics"(Action 67)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Statistics by C&urrencies"(Action 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Item &Tracking Entries"(Action 6500)".


        //Unsupported feature: Property Deletion (ToolTipML) on "NewBlanketPurchaseOrder(Action 1903213705)".


        //Unsupported feature: Property Deletion (ToolTipML) on "NewPurchaseQuote(Action 1901469405)".


        //Unsupported feature: Property Deletion (ToolTipML) on "NewPurchaseInvoice(Action 1907709505)".


        //Unsupported feature: Property Deletion (Visible) on "NewPurchaseInvoice(Action 1907709505)".


        //Unsupported feature: Property Deletion (ToolTipML) on "NewPurchaseOrder(Action 1907375405)".


        //Unsupported feature: Property Deletion (Visible) on "NewPurchaseOrder(Action 1907375405)".


        //Unsupported feature: Property Deletion (ToolTipML) on "NewPurchaseCrMemo(Action 1905024805)".


        //Unsupported feature: Property Deletion (Visible) on "NewPurchaseCrMemo(Action 1905024805)".


        //Unsupported feature: Property Deletion (ToolTipML) on "NewPurchaseReturnOrder(Action 1904749705)".

        modify(NewPurchaseInvoiceAddin)
        {
            Visible = false;
        }
        modify(NewPurchaseOrderAddin)
        {
            Visible = false;
        }
        modify(NewPurchaseCrMemoAddin)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Approve(Action 37)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Approve(Action 37)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Reject(Action 35)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Reject(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Delegate(Action 33)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Delegate(Action 33)".

        modify(Comment)
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 29).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ApprovalsMgmt.CheckVendorApprovalsWorkflowEnabled(Rec) THEN
          ApprovalsMgmt.OnSendVendorForApproval(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("KRA Pin No.");
        IF ApprovalsMgmt.CheckVendorApprovalsWorkflowEnabled(Rec) THEN
          ApprovalsMgmt.OnSendVendorForApproval(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "SendApprovalRequest(Action 29)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "SendApprovalRequest(Action 29)".



        //Unsupported feature: Code Modification on "CancelApprovalRequest(Action 27).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalsMgmt.OnCancelVendorApprovalRequest(Rec);
        WorkflowWebhookManagement.FindAndCancel(RECORDID);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ApprovalsMgmt.OnCancelVendorApprovalRequest(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "CancelApprovalRequest(Action 27)".

        modify(CreateFlow)
        {
            Visible = false;
        }
        modify(SeeFlows)
        {
            Visible = false;
        }
        modify(Templates)
        {
            Visible = false;
        }


        //Unsupported feature: Code Insertion (VariableCollection) on ""Apply Template"(Action 131).OnAction".

        //trigger (Variable: ConfigTemplateMgt)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "ApplyTemplate(Action 131).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        MiniVendorTemplate.UpdateVendorFromTemplate(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        RecRef.GETTABLE(Rec);
        ConfigTemplateMgt.UpdateFromTemplateSelection(RecRef);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "ApplyTemplate(Action 131)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "ApplyTemplate(Action 131)".

        modify(SaveAsTemplate)
        {
            Visible = false;
        }
        modify(MergeDuplicate)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Ellipsis) on ""Create Payments"(Action 1902327104)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Create Payments"(Action 1902327104)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchase Journal"(Action 1906371704)".

        modify(PayVendor)
        {
            Visible = false;
        }
        modify("Incoming Documents")
        {
            Visible = false;
        }
        modify(SendToIncomingDocuments)
        {
            Visible = false;
        }
        modify(SendToOCR)
        {
            Visible = false;
        }
        modify(SendIncomingDocApprovalRequest)
        {
            Visible = false;
        }


        //Unsupported feature: Code Insertion on ""Online Map"(Action 102)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //begin
        /*
        DisplayMap;
        */
        //end;

        //Unsupported feature: Property Deletion (ActionContainerType) on "ActionContainer102(Action 102)".



        //Unsupported feature: Code Modification on ""Vendor - Summary Aging"(Action 57).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        RunReport(REPORT::"Vendor - Summary Aging");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF NOT CONFIRM('Are you sure you want to reopen the vendor, note this will block the vendor') THEN EXIT;
        Blocked := Blocked::All;
        Status := Status::New;
        MODIFY;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor - Summary Aging"(Action 57)".


        //Unsupported feature: Property Deletion (Promoted) on ""Vendor - Summary Aging"(Action 57)".

        // modify("Vendor - Labels")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor - Labels"(Action 1905916106)".

        modify("Vendor - Balance to Date")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor - Balance to Date"(Action 1904504206)".

        // addfirst(VendorReportSelections)
        // {
        //     separator(Action11)
        //     {
        //     }
        // }
        addafter(Flow)
        {
            separator(Action108)
            {
            }
        }
        addafter("Recurring Purchase Lines")
        {
            separator(Action117)
            {
            }
        }
        addafter(CancelApprovalRequest)
        {
            // action(ApprovalEntries)
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Approvals';
            //     Image = Approvals;

            //     trigger OnAction()
            //     begin
            //         //ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
            //     end;
            // }
        }
        addfirst(reporting)
        {
        }
        // moveafter("Cross References";ActionContainer102)
        // moveafter(VendorReportSelections;Flow)
        // moveafter("Request Approval";"Vendor - Summary Aging")
    }

    var
        ConfigTemplateMgt: Codeunit "Config. Template Management";
        RecRef: RecordRef;

    var
        VendLedgEntry: Record "Vendor Ledger Entry";
        DtldVendLedgEntry: Record "Detailed Vendor Ledg. Entry";

    var
        MapMgt: Codeunit "Online Map Management";


    //Unsupported feature: Property Modification (Id) on "CustomizedCalEntry(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //CustomizedCalEntry : 1003;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CustomizedCalEntry : 1001;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CustomizedCalendar(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //CustomizedCalendar : 1001;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CustomizedCalendar : 1003;
    //Variable type has not been exported.

    var
        [InDataSet]
        MapPointVisible: Boolean;

    var
        [InDataSet]
        DocumentIsEditable: Boolean;


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CreateVendorFromTemplate;
    ActivateFields;
    OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
    OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);
    WorkflowWebhookManagement.GetCanRequestAndCanCancel(RECORDID,CanRequestApprovalForFlow,CanCancelApprovalForFlow);

    IF "No." <> '' THEN
      CurrPage.AgedAccPayableChart.PAGE.UpdateChartForVendor("No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ActivateFields;
    ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
    OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    */
    //end;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ActivateFields;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ActivateFields;
    SetControlAppearance;
    SetStatusEditable;
    */
    //end;


    //Unsupported feature: Code Insertion on "OnClosePage".

    //trigger OnClosePage()
    //begin
    /*
    TESTFIELD("KRA Pin No.");
    */
    //end;


    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetVendorNoVisibilityOnFactBoxes;

    ContactEditable := TRUE;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ContactEditable := TRUE;
    MapPointVisible := TRUE;
    SetStatusEditable;
    */
    //end;


    //Unsupported feature: Code Insertion (VariableCollection) on "OnOpenPage".

    //trigger (Variable: MapMgt)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ActivateFields;
    IsOfficeAddin := OfficeMgt.IsAvailable;
    SetNoFieldVisible;
    IsSaaS := PermissionManager.SoftwareAsAService;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ActivateFields;
    IF NOT MapMgt.TestSetup THEN
      MapPointVisible := FALSE;
    */
    //end;


    //Unsupported feature: Code Modification on "ActivateFields(PROCEDURE 3)".

    //procedure ActivateFields();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetSocialListeningFactboxVisibility;
    ContactEditable := "Primary Contact No." = '';
    IsCountyVisible := FormatAddress.UseCounty("Country/Region Code");
    IF OfficeMgt.IsAvailable THEN
      ActivateIncomingDocumentsFields;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetSocialListeningFactboxVisibility;
    ContactEditable := "Primary Contact No." = '';
    */
    //end;

    //Unsupported feature: Property Modification (Name) on "SetVendorNoVisibilityOnFactBoxes(PROCEDURE 2)".



    //Unsupported feature: Code Modification on "SetVendorNoVisibilityOnFactBoxes(PROCEDURE 2)".

    //procedure SetVendorNoVisibilityOnFactBoxes();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CurrPage.VendorHistBuyFromFactBox.PAGE.SetVendorNoVisibility(FALSE);
    CurrPage.VendorHistPayToFactBox.PAGE.SetVendorNoVisibility(FALSE);
    CurrPage.VendorStatisticsFactBox.PAGE.SetVendorNoVisibility(FALSE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF Status = Status::Approved THEN
      DocumentIsEditable := FALSE
    ELSE
      DocumentIsEditable := TRUE
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: StatusPermission) (VariableCollection) on "FnRestrictAccess(PROCEDURE 4)".


    //Unsupported feature: Variable Insertion (Variable: ErrorOnRestrictViewTxt) (VariableCollection) on "FnRestrictAccess(PROCEDURE 4)".


    //Unsupported feature: Property Deletion (Local) on "RunReport(PROCEDURE 4)".


    //Unsupported feature: Property Modification (Name) on "RunReport(PROCEDURE 4)".



    //Unsupported feature: Code Modification on "RunReport(PROCEDURE 4)".

    //procedure RunReport();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Vendor.SETRANGE("No.","No.");
    REPORT.RUNMODAL(ReportNumber,TRUE,TRUE,Vendor);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    StatusPermission.RESET;
    StatusPermission.SETRANGE("User ID",USERID);
    StatusPermission.SETRANGE("Edit Vendor",TRUE);
    IF NOT StatusPermission.FIND('-') THEN BEGIN
    CurrPage.EDITABLE:=FALSE;
     END;
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: ApprovalsMgmt) (VariableCollection) on "SetControlAppearance(PROCEDURE 5)".


    //Unsupported feature: Property Deletion (Attributes) on "OnBeforeCreateVendorFromTemplate(PROCEDURE 5)".


    //Unsupported feature: Property Modification (Name) on "OnBeforeCreateVendorFromTemplate(PROCEDURE 5)".



    //Unsupported feature: Code Modification on "OnBeforeCreateVendorFromTemplate(PROCEDURE 5)".

    //procedure OnBeforeCreateVendorFromTemplate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
    OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    */
    //end;

    //Unsupported feature: Deletion (ParameterCollection) on "RunReport(PROCEDURE 4).ReportNumber(Parameter 1000)".


    //Unsupported feature: Deletion (VariableCollection) on "RunReport(PROCEDURE 4).Vendor(Variable 1001)".


    //Unsupported feature: Deletion (ParameterCollection) on "OnBeforeCreateVendorFromTemplate(PROCEDURE 5).NewMode(Parameter 1000)".

}
