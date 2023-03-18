#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185905 pageextension52185905 extends "Approval Entries" 
{

    //Unsupported feature: Property Modification (SourceTableView) on ""Approval Entries"(Page 658)".

    layout
    {
        modify(Overdue)
        {
            ToolTip = 'Overdue Entry';
            ApplicationArea = Basic;
        }
        modify("Table ID")
        {
            ApplicationArea = Basic;
        }
        modify("Limit Type")
        {
            ApplicationArea = Basic;
        }
        modify("Approval Type")
        {
            ApplicationArea = Basic;
        }
        modify("Document Type")
        {
            ApplicationArea = Basic;
        }
        modify("Document No.")
        {
            ApplicationArea = Basic;
        }
        modify(RecordIDText)
        {
            ApplicationArea = Basic;
        }
        modify(Details)
        {
            ApplicationArea = Basic;
        }
        modify("Sequence No.")
        {
            ApplicationArea = Basic;
        }
        modify(Status)
        {
            ApplicationArea = Basic;
        }
        modify("Sender ID")
        {
            ApplicationArea = Basic;
        }
        modify("Salespers./Purch. Code")
        {
            ApplicationArea = Basic;
        }
        modify("Approver ID")
        {
            ApplicationArea = Basic;
        }
        modify("Currency Code")
        {
            ApplicationArea = Basic;
        }
        modify("Amount (LCY)")
        {
            ApplicationArea = Basic;
        }
        modify("Available Credit Limit (LCY)")
        {
            ApplicationArea = Basic;
        }
        modify("Date-Time Sent for Approval")
        {
            ApplicationArea = Basic;
        }
        modify("Last Date-Time Modified")
        {
            ApplicationArea = Basic;
        }
        modify("Last Modified By User ID")
        {
            ApplicationArea = Basic;
        }
        modify(Comment)
        {
            ApplicationArea = Basic;
        }
        modify("Due Date")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Table ID"(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Limit Type"(Control 45)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Approval Type"(Control 43)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Type"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on "RecordIDText(Control 2)".


        //Unsupported feature: Property Deletion (CaptionML) on "Details(Control 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Details(Control 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sequence No."(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Status(Control 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Sender ID"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Salespers./Purch. Code"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Approver ID"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Amount (LCY)"(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Available Credit Limit (LCY)"(Control 47)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Date-Time Sent for Approval"(Control 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Last Date-Time Modified"(Control 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Last Modified By User ID"(Control 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Comment(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Due Date"(Control 31)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Change(Control 11)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control5(Control 5)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control4(Control 4)".

    }
    actions
    {
        modify("Record")
        {
            ApplicationArea = Basic;
        }
        modify(Comments)
        {
            ApplicationArea = Basic;
        }
        modify("O&verdue Entries")
        {
            ApplicationArea = Basic;
        }
        modify("All Entries")
        {
            ApplicationArea = Basic;
        }
        modify("&Delegate")
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


        //Unsupported feature: Property Deletion (ToolTipML) on ""O&verdue Entries"(Action 49)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""All Entries"(Action 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Delegate"(Action 35)".


        //Unsupported feature: Property Deletion (Enabled) on ""&Delegate"(Action 35)".

    }

    var
        ApprovalCommentLine: Record "Approval Comment Line";

    var
        Usersetup: Record "User Setup";


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ShowChangeFactBox := CurrPage.Change.PAGE.SetFilterFromApprovalEntry(Rec);
        DelegateEnable := CanCurrentUserEdit;
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
        MarkAllWhereUserisApproverOrSender;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF Usersetup.GET(USERID) THEN
          SETCURRENTKEY("Table ID","Document Type","Document No.");
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "Setfilters(PROCEDURE 1)".



    //Unsupported feature: Code Modification on "Setfilters(PROCEDURE 1)".

    //procedure Setfilters();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF TableId <> 0 THEN BEGIN
          FILTERGROUP(2);
          SETCURRENTKEY("Table ID","Document Type","Document No.","Date-Time Sent for Approval");
          SETRANGE("Table ID",TableId);
          SETRANGE("Document Type",DocumentType);
          IF DocumentNo <> '' THEN
            SETRANGE("Document No.",DocumentNo);
          FILTERGROUP(0);
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF TableId <> 0 THEN BEGIN
          FILTERGROUP(2);
          SETCURRENTKEY("Table ID","Document Type","Document No.");
        #4..9
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "CalledFrom(PROCEDURE 3)".


    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).

}
