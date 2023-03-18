#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52187138 pageextension52187138 extends "Purchase Invoices" 
{
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
        }
        modify(Status)
        {
            ApplicationArea = Basic;
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


        //Unsupported feature: Property Deletion (Visible) on ""Vendor Authorization No."(Control 15)".

        modify("Vendor Invoice No.")
        {
            Visible = false;
        }

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


        //Unsupported feature: Property Deletion (ToolTipML) on ""Shipment Method Code"(Control 1102601020)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Requested Receipt Date"(Control 1102601025)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Queue Status"(Control 5)".

        modify(Amount)
        {
            Visible = false;
        }
        modify("Power BI Report FactBox")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "IncomingDocAttachFactBox(Control 8)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1901138007(Control 1901138007)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify(Statistics)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Statistics(Action 1102601019)".

        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify(Dimensions)
        {
            ApplicationArea = Basic;
        }
        modify(Approvals)
        {
            ApplicationArea = Basic;
        }
        modify(Release)
        {
            ApplicationArea = Basic;
        }
        modify(Reopen)
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

            //Unsupported feature: Property Modification (Image) on "CancelApprovalRequest(Action 12)".

        }
        // modify(Post)
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (PromotedCategory) on "Post(Action 52)".

        // }
        modify(Preview)
        {
            ApplicationArea = Basic;
        }
        modify(TestReport)
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

        //Unsupported feature: Property Deletion (ToolTipML) on "Statistics(Action 1102601019)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Statistics(Action 1102601019)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 1102601021)".


        //Unsupported feature: Property Deletion (Promoted) on ""Co&mments"(Action 1102601021)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Co&mments"(Action 1102601021)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 1102601022)".


        //Unsupported feature: Property Deletion (Promoted) on "Dimensions(Action 1102601022)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Dimensions(Action 1102601022)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Dimensions(Action 1102601022)".

        modify(Invoice)
        {
            Visible = false;
        }


        //Unsupported feature: Code Insertion (VariableCollection) on "Approvals(Action 10).OnAction".

        //trigger (Variable: ApprovalEntries)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on "Approvals(Action 10).OnAction".

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
            // ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
            // ApprovalEntries.RUN;
            approvalsMgmt.OpenApprovalEntriesPage(RECORDID);
            */
        //end;

        //Unsupported feature: Property Deletion (AccessByPermission) on "Approvals(Action 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Approvals(Action 10)".


        //Unsupported feature: Property Deletion (Promoted) on "Approvals(Action 10)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Approvals(Action 10)".

        modify(Vendor)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Release(Action 1102601015)".


        //Unsupported feature: Property Deletion (Promoted) on "Release(Action 1102601015)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Release(Action 1102601015)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Reopen(Action 1102601016)".


        //Unsupported feature: Property Deletion (Promoted) on "Reopen(Action 1102601016)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Reopen(Action 1102601016)".



        //Unsupported feature: Code Modification on "SendApprovalRequest(Action 14).OnAction".

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

        //Unsupported feature: Property Deletion (ToolTipML) on "SendApprovalRequest(Action 14)".



        //Unsupported feature: Code Modification on "CancelApprovalRequest(Action 12).OnAction".

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

        //Unsupported feature: Property Deletion (ToolTipML) on "CancelApprovalRequest(Action 12)".



        //Unsupported feature: Code Modification on "Post(Action 52).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CurrPage.SETSELECTIONFILTER(PurchaseHeader);
            IF PurchaseHeader.COUNT > 1 THEN BEGIN
              PurchaseHeader.FINDSET;
              REPEAT
                VerifyTotal(PurchaseHeader);
              UNTIL PurchaseHeader.NEXT = 0;
              PurchaseBatchPostMgt.RunWithUI(PurchaseHeader,COUNT,ReadyToPostQst);
            END ELSE BEGIN
              VerifyTotal(Rec);
              Post(CODEUNIT::"Purch.-Post (Yes/No)");
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            SendToPosting(CODEUNIT::"Purch.-Post (Yes/No)");
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Post(Action 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Preview(Action 9)".


        //Unsupported feature: Property Deletion (Promoted) on "Preview(Action 9)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Preview(Action 9)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Preview(Action 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TestReport(Action 51)".



        //Unsupported feature: Code Modification on "PostAndPrint(Action 53).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            VerifyTotal(Rec);
            Post(CODEUNIT::"Purch.-Post + Print");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            SendToPosting(CODEUNIT::"Purch.-Post + Print");
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "PostAndPrint(Action 53)".



        //Unsupported feature: Code Modification on "PostBatch(Action 54).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            VerifyTotal(Rec);
            REPORT.RUNMODAL(REPORT::"Batch Post Purchase Invoices",TRUE,TRUE,Rec);
            CurrPage.UPDATE(FALSE);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            REPORT.RUNMODAL(REPORT::"Batch Post Purchase Invoices",TRUE,TRUE,Rec);
            CurrPage.UPDATE(FALSE);
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "PostBatch(Action 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on "RemoveFromJobQueue(Action 3)".

        modify(Display)
        {
            Visible = false;
        }
        modify(ReportFactBoxVisibility)
        {
            Visible = false;
        }
        moveafter(Dimensions;Approvals)
    }

    var
        ApprovalEntries: Page "Approval Entries";
        approvalsMgmt: Codeunit "Approvals Mgmt.";


    //Unsupported feature: Property Modification (Id) on "ReportPrint(Variable 1008)".

    //var
        //>>>> ORIGINAL VALUE:
        //ReportPrint : 1008;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //ReportPrint : 1102601000;
        //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "JobQueueActive(Variable 1003)".

    //var
        //>>>> ORIGINAL VALUE:
        //JobQueueActive : 1003;
        //Variable type has not been exported.
        //>>>> MODIFIED VALUE:
        //JobQueueActive : 1001;
        //Variable type has not been exported.

    var
        DimMgt: Codeunit DimensionManagement;


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetControlAppearance;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);

        // Contextual Power BI FactBox: send data to filter the report in the FactBox: (SourceTableFildToCompare,QueryName/FieldName)
        CurrPage."Power BI Report FactBox".PAGE.SetCurrentListSelection("No.",FALSE,PowerBIVisible);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        SetControlAppearance;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetSecurityFilterOnRespCenter;

        JobQueueActive := PurchasesPayablesSetup.JobQueueActive;

        CopyBuyFromVendorFilter;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
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


    //Unsupported feature: Property Deletion (AdditionalSearchTermsML).


    //Unsupported feature: Property Deletion (RefreshOnActivate).


    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
