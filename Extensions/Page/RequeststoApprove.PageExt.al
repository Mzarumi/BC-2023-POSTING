#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185904 pageextension52185904 extends "Requests to Approve" 
{

    //Unsupported feature: Property Modification (SourceTableView) on ""Requests to Approve"(Page 654)".


    //Unsupported feature: Property Insertion (InsertAllowed) on ""Requests to Approve"(Page 654)".


    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Requests to Approve"(Page 654)".


    //Unsupported feature: Property Insertion (ModifyAllowed) on ""Requests to Approve"(Page 654)".

    layout
    {
        modify(ToApprove)
        {
            ApplicationArea = Basic;
        }
        modify(Details)
        {
            ApplicationArea = Basic;
        }
        modify(Comment)
        {
            ApplicationArea = Basic;
        }
        modify("Sender ID")
        {
            ApplicationArea = Basic;
        }
        modify("Due Date")
        {
            ApplicationArea = Basic;
        }
        modify(Status)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Modification (Name) on "CommentsFactBox(Control 3)".


        //Unsupported feature: Property Insertion (SubPageLink) on "CommentsFactBox(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ToApprove(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Details(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Comment(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sender ID"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Due Date"(Control 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Status(Control 6)".

        modify(Amount)
        {
            Visible = false;
        }
        modify("Amount (LCY)")
        {
            Visible = false;
        }
        modify("Currency Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "CommentsFactBox(Control 3)".


        //Unsupported feature: Property Deletion (Visible) on "CommentsFactBox(Control 3)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Change(Control 8)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

    }
    actions
    {
        modify("Record")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (RunPageMode) on "Record(Action 38)".

        }
        modify(Comments)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (PromotedIsBig) on "Comments(Action 42)".

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
        modify(OpenRequests)
        {
            ApplicationArea = Basic;
        }
        modify(AllRequests)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Record(Action 38)".


        //Unsupported feature: Property Deletion (Enabled) on "Record(Action 38)".


        //Unsupported feature: Code Insertion (VariableCollection) on "Comments(Action 42).OnAction".

        //trigger (Variable: ApprovalCommentLine)()
        //Parameters and return type have not been exported.
        //begin
            /*
            */
        //end;


        //Unsupported feature: Code Modification on "Comments(Action 42).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            RecRef.GET("Record ID to Approve");
            CLEAR(ApprovalsMgmt);
            ApprovalsMgmt.GetApprovalCommentForWorkflowStepInstanceID(RecRef,"Workflow Step Instance ID");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ApprovalCommentLine.SETRANGE("Table ID","Table ID");
            ApprovalCommentLine.SETRANGE("Record ID to Approve","Record ID to Approve");
            PAGE.RUN(PAGE::"Approval Comments",ApprovalCommentLine);
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Comments(Action 42)".


        //Unsupported feature: Property Deletion (Enabled) on "Comments(Action 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Approve(Action 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Reject(Action 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Delegate(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on "OpenRequests(Action 49)".


        //Unsupported feature: Property Deletion (ToolTipML) on "AllRequests(Action 50)".

    }

    var
        ApprovalCommentLine: Record "Approval Comment Line";


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ShowChangeFactBox := CurrPage.Change.PAGE.SetFilterFromApprovalEntry(Rec);
        ShowCommentFactbox := CurrPage.CommentsFactBox.PAGE.SetFilterFromApprovalEntry(Rec);
        ShowRecCommentsEnabled := RecRef.GET("Record ID to Approve");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ShowChangeFactBox := CurrPage.Change.PAGE.SetFilterFromApprovalEntry(Rec);
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        FILTERGROUP(2);
        SETRANGE("Approver ID",USERID);
        FILTERGROUP(0);
        SETRANGE(Status,Status::Open);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        FILTERGROUP(2);
        // SETRANGE("Approver ID",USERID);
        // SETFILTER("Table ID",'<>%1',52185729);
        FILTERGROUP(0);
        SETRANGE(Status,Status::Open);
        */
    //end;

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).

}
