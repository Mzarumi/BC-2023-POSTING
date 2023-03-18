#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185438 pageextension52185438 extends "General Ledger Entries" 
{

    //Unsupported feature: Property Modification (DeleteAllowed) on ""General Ledger Entries"(Page 20)".

    Editable = false;
    layout
    {
        modify("Posting Date")
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
        modify("G/L Account No.")
        {
            ApplicationArea = Basic;
        }
        modify("G/L Account Name")
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify("Job No.")
        {
            ApplicationArea = Basic;
        }
        modify("Global Dimension 1 Code")
        {
            ApplicationArea = Basic;
        }
        modify("Global Dimension 2 Code")
        {
            ApplicationArea = Basic;
        }
        modify("IC Partner Code")
        {
            ApplicationArea = Basic;
        }
        modify("Gen. Posting Type")
        {
            ApplicationArea = Basic;
        }
        modify("Gen. Bus. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Gen. Prod. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify(Quantity)
        {
            ApplicationArea = Basic;
        }
        modify(Amount)
        {
            ApplicationArea = Basic;
        }
        modify("Debit Amount")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Debit Amount"(Control 17)".


            //Unsupported feature: Property Modification (Name) on ""Debit Amount"(Control 17)".

        }
        modify("Additional-Currency Amount")
        {
            ApplicationArea = Basic;
        }
        modify("VAT Amount")
        {
            ApplicationArea = Basic;
        }
        modify("Bal. Account Type")
        {
            ApplicationArea = Basic;
        }
        modify("Bal. Account No.")
        {
            ApplicationArea = Basic;
        }
        modify("User ID")
        {
            ApplicationArea = Basic;
        }
        modify("Source Code")
        {
            ApplicationArea = Basic;
        }
        modify("Reason Code")
        {
            ApplicationArea = Basic;
        }
        modify(Reversed)
        {
            ApplicationArea = Basic;
        }
        modify("Reversed by Entry No.")
        {
            ApplicationArea = Basic;
        }
        modify("Reversed Entry No.")
        {
            ApplicationArea = Basic;
        }
        modify("FA Entry Type")
        {
            ApplicationArea = Basic;
        }
        modify("FA Entry No.")
        {
            ApplicationArea = Basic;
        }
        modify("Entry No.")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Deletion (Editable) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Type"(Control 4)".


        //Unsupported feature: Property Deletion (Editable) on ""Document Type"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 6)".


        //Unsupported feature: Property Deletion (Editable) on ""Document No."(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L Account No."(Control 8)".


        //Unsupported feature: Property Deletion (Editable) on ""G/L Account No."(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L Account Name"(Control 40)".


        //Unsupported feature: Property Deletion (Editable) on ""G/L Account Name"(Control 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job No."(Control 26)".


        //Unsupported feature: Property Deletion (Editable) on ""Job No."(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Global Dimension 1 Code"(Control 28)".


        //Unsupported feature: Property Deletion (Editable) on ""Global Dimension 1 Code"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Global Dimension 2 Code"(Control 30)".


        //Unsupported feature: Property Deletion (Editable) on ""Global Dimension 2 Code"(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""IC Partner Code"(Control 51)".


        //Unsupported feature: Property Deletion (Editable) on ""IC Partner Code"(Control 51)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Posting Type"(Control 12)".


        //Unsupported feature: Property Deletion (Editable) on ""Gen. Posting Type"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Bus. Posting Group"(Control 32)".


        //Unsupported feature: Property Deletion (Editable) on ""Gen. Bus. Posting Group"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Prod. Posting Group"(Control 14)".


        //Unsupported feature: Property Deletion (Editable) on ""Gen. Prod. Posting Group"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Quantity(Control 5)".


        //Unsupported feature: Property Deletion (Editable) on "Quantity(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Amount(Control 16)".


        //Unsupported feature: Property Deletion (Visible) on "Amount(Control 16)".


        //Unsupported feature: Property Deletion (Editable) on "Amount(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Debit Amount"(Control 17)".


        //Unsupported feature: Property Deletion (Visible) on ""Debit Amount"(Control 17)".


        //Unsupported feature: Property Deletion (Editable) on ""Debit Amount"(Control 17)".

        modify("Credit Amount")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Additional-Currency Amount"(Control 54)".


        //Unsupported feature: Property Deletion (Editable) on ""Additional-Currency Amount"(Control 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Amount"(Control 36)".


        //Unsupported feature: Property Deletion (Editable) on ""VAT Amount"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account Type"(Control 52)".


        //Unsupported feature: Property Deletion (Editable) on ""Bal. Account Type"(Control 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account No."(Control 18)".


        //Unsupported feature: Property Deletion (Editable) on ""Bal. Account No."(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""User ID"(Control 46)".


        //Unsupported feature: Property Deletion (Editable) on ""User ID"(Control 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Source Code"(Control 42)".


        //Unsupported feature: Property Deletion (Editable) on ""Source Code"(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reason Code"(Control 44)".


        //Unsupported feature: Property Deletion (Editable) on ""Reason Code"(Control 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Reversed(Control 58)".


        //Unsupported feature: Property Deletion (Editable) on "Reversed(Control 58)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reversed by Entry No."(Control 60)".


        //Unsupported feature: Property Deletion (Editable) on ""Reversed by Entry No."(Control 60)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reversed Entry No."(Control 62)".


        //Unsupported feature: Property Deletion (Editable) on ""Reversed Entry No."(Control 62)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""FA Entry Type"(Control 34)".


        //Unsupported feature: Property Deletion (Editable) on ""FA Entry Type"(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""FA Entry No."(Control 38)".


        //Unsupported feature: Property Deletion (Editable) on ""FA Entry No."(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Entry No."(Control 20)".


        //Unsupported feature: Property Deletion (Editable) on ""Entry No."(Control 20)".

        modify("Dimension Set ID")
        {
            Visible = false;
        }
        modify("External Document No.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "IncomingDocAttachFactBox(Control 7)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        moveafter(Amount;"Additional-Currency Amount")
    }
    actions
    {
        modify(Dimensions)
        {
            ApplicationArea = Basic;
        }
        modify(GLDimensionOverview)
        {
            ApplicationArea = Basic;
        }
        modify("Value Entries")
        {
            ApplicationArea = Basic;
        }
        modify(ReverseTransaction)
        {
            ApplicationArea = Basic;
        }
        modify(IncomingDocCard)
        {
            ToolTip = '';
            ApplicationArea = Basic;
        }
        modify(SelectIncomingDoc)
        {
            ToolTip = '';
            ApplicationArea = Basic;
        }
        modify(IncomingDocAttachFile)
        {
            ToolTip = '';
            ApplicationArea = Basic;
        }
        modify("&Navigate")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""&Navigate"(Action 24)".

        }
        modify(DocsWithoutIC)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 49)".


        //Unsupported feature: Property Deletion (Promoted) on "Dimensions(Action 49)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Dimensions(Action 49)".

        modify(SetDimensionFilter)
        {
            Visible = false;
        }

        //Unsupported feature: Code Modification on "GLDimensionOverview(Action 50).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ISTEMPORARY THEN BEGIN
              GLEntriesDimensionOverview.SetTempGLEntry(Rec);
              GLEntriesDimensionOverview.RUN;
            END ELSE
              PAGE.RUN(PAGE::"G/L Entries Dimension Overview",Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            PAGE.RUN(PAGE::"G/L Entries Dimension Overview",Rec);
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "GLDimensionOverview(Action 50)".


        //Unsupported feature: Property Deletion (Promoted) on "GLDimensionOverview(Action 50)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "GLDimensionOverview(Action 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Value Entries"(Action 65)".


        //Unsupported feature: Property Deletion (Promoted) on ""Value Entries"(Action 65)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Value Entries"(Action 65)".



        //Unsupported feature: Code Modification on "ReverseTransaction(Action 63).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CLEAR(ReversalEntry);
            IF Reversed THEN
              ReversalEntry.AlreadyReversedEntry(TABLECAPTION,"Entry No.");
            IF "Journal Batch Name" = '' THEN
              ReversalEntry.TestFieldError;
            TESTFIELD("Transaction No.");
            ReversalEntry.ReverseTransaction("Transaction No.")
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*

            // IF USERID="User ID" THEN
            //   ERROR(Err001);
            CLEAR(ReversalEntry);

            #2..7
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "ReverseTransaction(Action 63)".


        //Unsupported feature: Property Deletion (Promoted) on "ReverseTransaction(Action 63)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "ReverseTransaction(Action 63)".



        //Unsupported feature: Code Modification on "SelectIncomingDoc(Action 9).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IncomingDocument.SelectIncomingDocumentForPostedDocument("Document No.","Posting Date",RECORDID);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IncomingDocument.SelectIncomingDocumentForPostedDocument("Document No.","Posting Date");
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""&Navigate"(Action 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on "DocsWithoutIC(Action 11)".

    }

    var
        Err001: label 'You cannot reverse a transaction you posted';

    //Unsupported feature: Property Deletion (Permissions).


    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (InsertAllowed).


    //Unsupported feature: Property Deletion (SourceTableView).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (AdditionalSearchTermsML).


    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
