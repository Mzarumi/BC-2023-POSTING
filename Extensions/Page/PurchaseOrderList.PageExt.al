#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187137 pageextension52187137 extends "Purchase Order List"
{
    Editable = true;
    layout
    {
        modify("No.")
        {
            ApplicationArea = Basic;
        }
        modify("Buy-from Vendor No.")
        {
            ApplicationArea = Basic;
        }
        modify("Order Address Code")
        {
            ApplicationArea = Basic;
        }
        modify("Buy-from Vendor Name")
        {
            ApplicationArea = Basic;
        }
        modify("Vendor Authorization No.")
        {
            ApplicationArea = Basic;
        }
        modify("Buy-from Post Code")
        {
            ApplicationArea = Basic;
        }
        modify("Buy-from Country/Region Code")
        {
            ApplicationArea = Basic;
        }
        modify("Buy-from Contact")
        {
            ApplicationArea = Basic;
        }
        modify("Pay-to Vendor No.")
        {
            ApplicationArea = Basic;
        }
        modify("Pay-to Name")
        {
            ApplicationArea = Basic;
        }
        modify("Pay-to Post Code")
        {
            ApplicationArea = Basic;
        }
        modify("Pay-to Country/Region Code")
        {
            ApplicationArea = Basic;
        }
        modify("Pay-to Contact")
        {
            ApplicationArea = Basic;
        }
        modify("Ship-to Code")
        {
            ApplicationArea = Basic;
        }
        modify("Ship-to Name")
        {
            ApplicationArea = Basic;
        }
        modify("Ship-to Post Code")
        {
            ApplicationArea = Basic;
        }
        modify("Ship-to Country/Region Code")
        {
            ApplicationArea = Basic;
        }
        modify("Ship-to Contact")
        {
            ApplicationArea = Basic;
        }
        modify("Posting Date")
        {
            ApplicationArea = Basic;
        }
        modify("Shortcut Dimension 1 Code")
        {
            ApplicationArea = Basic;
        }
        modify("Shortcut Dimension 2 Code")
        {
            ApplicationArea = Basic;
        }
        modify("Location Code")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Location Code"(Control 115)".

        }
        modify("Purchaser Code")
        {
            ApplicationArea = Basic;
        }
        modify("Assigned User ID")
        {
            ApplicationArea = Basic;
        }
        modify("Currency Code")
        {
            ApplicationArea = Basic;
        }
        modify("Document Date")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on ""Document Date"(Control 1102601001)".

        }
        modify(Status)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Visible) on "Status(Control 1102601003)".

        }
        modify("Payment Terms Code")
        {
            ApplicationArea = Basic;
        }
        modify("Due Date")
        {
            ApplicationArea = Basic;
        }
        modify("Payment Discount %")
        {
            ApplicationArea = Basic;
        }
        modify("Payment Method Code")
        {
            ApplicationArea = Basic;
        }
        modify("Shipment Method Code")
        {
            ApplicationArea = Basic;
        }
        modify("Requested Receipt Date")
        {
            ApplicationArea = Basic;
        }
        modify("Job Queue Status")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Insertion (Visible) on "Control1901138007(Control 1901138007)".


        //Unsupported feature: Property Insertion (Visible) on "Control1905767507(Control 1905767507)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Vendor No."(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Order Address Code"(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Vendor Name"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Authorization No."(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Post Code"(Control 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Country/Region Code"(Control 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Buy-from Contact"(Control 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Vendor No."(Control 163)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Name"(Control 161)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Post Code"(Control 33)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Country/Region Code"(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Pay-to Contact"(Control 151)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to Code"(Control 147)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to Name"(Control 145)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to Post Code"(Control 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to Country/Region Code"(Control 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to Contact"(Control 135)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 131)".


        //Unsupported feature: Code Insertion on ""Shortcut Dimension 1 Code"(Control 113)".

        //trigger OnLookup(var Text: Text): Boolean
        //begin
        /*
        DimMgt.LookupDimValueCodeNoUpdate(1);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Shortcut Dimension 1 Code"(Control 113)".



        //Unsupported feature: Code Insertion on ""Shortcut Dimension 2 Code"(Control 111)".

        //trigger OnLookup(var Text: Text): Boolean
        //begin
        /*
        DimMgt.LookupDimValueCodeNoUpdate(2);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Shortcut Dimension 2 Code"(Control 111)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Location Code"(Control 115)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Purchaser Code"(Control 99)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Assigned User ID"(Control 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Date"(Control 1102601001)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Status(Control 1102601003)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Terms Code"(Control 1102601005)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Due Date"(Control 1102601007)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Discount %"(Control 1102601009)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Method Code"(Control 1102601011)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shipment Method Code"(Control 1102601013)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Requested Receipt Date"(Control 1102601027)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Queue Status"(Control 5)".

        modify("Amount Received Not Invoiced excl. VAT (LCY)")
        {
            Visible = false;
        }
        modify("Amount Received Not Invoiced (LCY)")
        {
            Visible = false;
        }
        modify(Amount)
        {
            Visible = false;
        }
        modify("Amount Including VAT")
        {
            Visible = false;
        }
        modify("Posting Description")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "IncomingDocAttachFactBox(Control 14)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1901138007(Control 1901138007)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify(Dimensions)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Promoted) on "Dimensions(Action 1102601035)".


            //Unsupported feature: Property Modification (PromotedIsBig) on "Dimensions(Action 1102601035)".

        }
        modify(Statistics)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Statistics(Action 1102601028)".

        }
        modify(Approvals)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Promoted) on "Approvals(Action 18)".


            //Unsupported feature: Property Insertion (PromotedIsBig) on "Approvals(Action 18)".

        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify(Receipts)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Promoted) on "Receipts(Action 1102601031)".

        }
        modify(PostedPurchaseInvoices)
        {

            //Unsupported feature: Property Modification (Name) on "PostedPurchaseInvoices(Action 1102601032)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Promoted) on "PostedPurchaseInvoices(Action 1102601032)".

        }
        modify(PostedPurchasePrepmtInvoices)
        {

            //Unsupported feature: Property Modification (Name) on "PostedPurchasePrepmtInvoices(Action 1102601033)".

            ApplicationArea = Basic;
        }
        modify("Prepayment Credi&t Memos")
        {
            ApplicationArea = Basic;
        }
        modify("In&vt. Put-away/Pick Lines")
        {
            ApplicationArea = Basic;
        }
        modify("Whse. Receipt Lines")
        {
            ApplicationArea = Basic;
        }
        // modify(ActionGroup9)
        // {
        //     Caption = 'General';

        //     //Unsupported feature: Property Modification (Name) on "ActionGroup9(Action 9)".

        // }
        modify(Print)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Print(Action 55)".

        }
        modify(Release)
        {
            ApplicationArea = Basic;
        }
        modify(Reopen)
        {
            ApplicationArea = Basic;
        }
        modify("Send IC Purchase Order")
        {
            ApplicationArea = Basic;
        }
        modify(SendApprovalRequest)
        {
            ApplicationArea = Basic;
           // Enabled = not OpenApprovalEntriesExist;
        }
        modify(CancelApprovalRequest)
        {
            ApplicationArea = Basic;
           // Enabled = OpenApprovalEntriesExist;

            //Unsupported feature: Property Modification (Image) on "CancelApprovalRequest(Action 1102601019)".

        }
        modify("Create &Whse. Receipt")
        {
            ApplicationArea = Basic;
        }
        modify("Create Inventor&y Put-away/Pick")
        {
            ApplicationArea = Basic;
        }
        modify(TestReport)
        {
            ApplicationArea = Basic;
        }
        modify(Post)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Post(Action 52)".

        }
        modify(Preview)
        {
            ApplicationArea = Basic;
        }
        modify(PostAndPrint)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "PostAndPrint(Action 53)".

        }
        modify(PostBatch)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "PostBatch(Action 54)".

        }
        modify(RemoveFromJobQueue)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 1102601035)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Dimensions(Action 1102601035)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Statistics(Action 1102601028)".



        //Unsupported feature: Code Insertion (VariableCollection) on "Approvals(Action 18).OnAction".

        //trigger (Variable: ApprovalEntries)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Approvals(Action 18).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RECORDID,DATABASE::"Purchase Header","Document Type","No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
        ApprovalEntries.RUN;
        */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on "Approvals(Action 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Approvals(Action 18)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Approvals(Action 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 1102601030)".


        //Unsupported feature: Property Deletion (Promoted) on ""Co&mments"(Action 1102601030)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Co&mments"(Action 1102601030)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Receipts(Action 1102601031)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Receipts(Action 1102601031)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PostedPurchaseInvoices(Action 1102601032)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "PostedPurchaseInvoices(Action 1102601032)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PostedPurchasePrepmtInvoices(Action 1102601033)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepayment Credi&t Memos"(Action 1102601034)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""In&vt. Put-away/Pick Lines"(Action 1102601039)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Whse. Receipt Lines"(Action 1102601038)".



        //Unsupported feature: Code Modification on "Print(Action 55).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PurchaseHeader := Rec;
        CurrPage.SETSELECTIONFILTER(PurchaseHeader);
        PurchaseHeader.PrintRecords(TRUE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        DocPrint.PrintPurchHeader(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Print(Action 55)".

        modify(Send)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Release(Action 1102601021)".


        //Unsupported feature: Property Deletion (Promoted) on "Release(Action 1102601021)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Release(Action 1102601021)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Release(Action 1102601021)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Reopen(Action 1102601022)".


        //Unsupported feature: Property Deletion (Promoted) on "Reopen(Action 1102601022)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Reopen(Action 1102601022)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Reopen(Action 1102601022)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Send IC Purchase Order"(Action 1102601025)".

        modify("Delete Invoiced")
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 1102601018).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF ApprovalsMgmt.CheckPurchaseApprovalsWorkflowEnabled(Rec) THEN
          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "SendApprovalRequest(Action 1102601018)".



        //Unsupported feature: Code Modification on "CancelApprovalRequest(Action 1102601019).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
        WorkflowWebhookManagement.FindAndCancel(RECORDID);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "CancelApprovalRequest(Action 1102601019)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Create &Whse. Receipt"(Action 1102601015)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Create Inventor&y Put-away/Pick"(Action 1102601016)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TestReport(Action 51)".



        //Unsupported feature: Code Modification on "Post(Action 52).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ApplicationAreaMgmtFacade.IsFoundationEnabled THEN
          LinesInstructionMgt.PurchaseCheckAllLinesHaveQuantityAssigned(Rec);

        CurrPage.SETSELECTIONFILTER(PurchaseHeader);

        IF PurchaseHeader.COUNT > 1 THEN BEGIN
          BatchProcessingMgt.AddParameter(BatchPostParameterTypes.Invoice,TRUE);
          BatchProcessingMgt.AddParameter(BatchPostParameterTypes.Receive,TRUE);

          PurchaseBatchPostMgt.SetBatchProcessor(BatchProcessingMgt);
          PurchaseBatchPostMgt.RunWithUI(PurchaseHeader,COUNT,ReadyToPostQst);
        END ELSE
          SendToPosting(CODEUNIT::"Purch.-Post (Yes/No)");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        SendToPosting(CODEUNIT::"Purch.-Post (Yes/No)");
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Post(Action 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Preview(Action 16)".


        //Unsupported feature: Property Deletion (Promoted) on "Preview(Action 16)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Preview(Action 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PostAndPrint(Action 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PostBatch(Action 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on "RemoveFromJobQueue(Action 3)".

        addafter("Prepayment Credi&t Memos")
        {
            separator(Action1102601037)
            {
            }
        }
        addafter("Whse. Receipt Lines")
        {
            separator(Action1102601040)
            {
            }
        }
        addafter(Reopen)
        {
            separator(Action1102601023)
            {
            }
        }
        addafter("Create Inventor&y Put-away/Pick")
        {
            separator(Action1102601017)
            {
            }
        }
        addafter(RemoveFromJobQueue)
        {
            action("Delivery Note")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    DMS.Reset;
                    DMS.SetRange(DMS.Key, DMS.Key::"Delivery Note");
                    if DMS.Find('-') then begin
                        Hyperlink(DMS."url path" + Rec."No.");
                    end;
                end;
            }
        }
    }

    var
        ApprovalEntries: Page "Approval Entries";

    var
        DimMgt: Codeunit DimensionManagement;

    var
        DocPrint: Codeunit "Document-Print";

    var
        DMS: Record 52185686;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF GETFILTER(Receive) <> '' THEN
      FilterPartialReceived;
    IF GETFILTER(Invoice) <> '' THEN
      FilterPartialInvoiced;

    SetSecurityFilterOnRespCenter;

    JobQueueActive := PurchasesPayablesSetup.JobQueueActive;

    CopyBuyFromVendorFilter;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #6..8
    */
    //end;


    //Unsupported feature: Code Modification on "SetControlAppearance(PROCEDURE 5)".

    //procedure SetControlAppearance();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);

    CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);

    WorkflowWebhookManagement.GetCanRequestAndCanCancel(RECORDID,CanRequestApprovalForFlow,CanCancelApprovalForFlow);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "SetControlAppearance(PROCEDURE 5).WorkflowWebhookManagement(Variable 1001)".


    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (DataCaptionFields).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (QueryCategory).


    //Unsupported feature: Property Deletion (RefreshOnActivate).


    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
