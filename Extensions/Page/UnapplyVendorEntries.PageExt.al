#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185885 pageextension52185885 extends "Unapply Vendor Entries" 
{
    layout
    {
        modify(DocuNo)
        {
            ApplicationArea = Basic;
        }
        modify(PostDate)
        {
            ApplicationArea = Basic;
        }
        modify("Posting Date")
        {
            ApplicationArea = Basic;
        }
        modify("Entry Type")
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
        modify("Vendor No.")
        {
            ApplicationArea = Basic;
        }
        modify("Initial Document Type")
        {
            ApplicationArea = Basic;
        }
        // modify(GetDocumentNo)
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Initial Entry Global Dim. 1")
        {
            ApplicationArea = Basic;
        }
        modify("Initial Entry Global Dim. 2")
        {
            ApplicationArea = Basic;
        }
        modify("Currency Code")
        {
            ApplicationArea = Basic;
        }
        modify(Amount)
        {
            ApplicationArea = Basic;
        }
        modify("Amount (LCY)")
        {
            ApplicationArea = Basic;
        }
        modify("Initial Entry Due Date")
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
        modify("Vendor Ledger Entry No.")
        {
            ApplicationArea = Basic;
        }
        modify("Entry No.")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "DocuNo(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PostDate(Control 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Entry Type"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Type"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor No."(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Initial Document Type"(Control 43)".


        //Unsupported feature: Property Deletion (ToolTipML) on "GetDocumentNo(Control 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Initial Entry Global Dim. 1"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Initial Entry Global Dim. 2"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Amount(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Amount (LCY)"(Control 20)".

        modify("Debit Amount")
        {
            Visible = false;
        }
        modify("Debit Amount (LCY)")
        {
            Visible = false;
        }
        modify("Credit Amount")
        {
            Visible = false;
        }
        modify("Credit Amount (LCY)")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Initial Entry Due Date"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""User ID"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Source Code"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reason Code"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Ledger Entry No."(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Entry No."(Control 38)".

    }
    actions
    {
        modify(Unapply)
        {
            ApplicationArea = Basic;
        }
        modify(Preview)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Code Modification on "Unapply(Action 42).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ISEMPTY THEN
              ERROR(Text010);
            IF NOT ConfirmManagement.ConfirmProcess(Text011,TRUE) THEN
              EXIT;

            VendEntryApplyPostedEntries.PostUnApplyVendor(DtldVendLedgEntry2,DocNo,PostingDate);
            #7..9
            MESSAGE(Text009);

            CurrPage.CLOSE;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF ISEMPTY THEN
              ERROR(Text010);
            IF NOT CONFIRM(Text011,FALSE) THEN
            #4..12
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Unapply(Action 42)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Unapply(Action 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Preview(Action 3)".


        //Unsupported feature: Property Deletion (Promoted) on "Preview(Action 3)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Preview(Action 3)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Preview(Action 3)".

    }

    //Unsupported feature: Property Deletion (Attributes) on "SetDtldVendLedgEntry(PROCEDURE 4)".



    //Unsupported feature: Code Modification on "InsertEntries(PROCEDURE 1)".

    //procedure InsertEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF DtldVendLedgEntry2."Transaction No." = 0 THEN BEGIN
          DtldVendLedgEntry.SETCURRENTKEY("Application No.","Vendor No.","Entry Type");
          DtldVendLedgEntry.SETRANGE("Application No.",DtldVendLedgEntry2."Application No.");
        #4..12
               NOT DtldVendLedgEntry.Unapplied
            THEN BEGIN
              Rec := DtldVendLedgEntry;
              OnBeforeRecInsert(Rec,DtldVendLedgEntry,DtldVendLedgEntry2);
              INSERT;
            END;
          UNTIL DtldVendLedgEntry.NEXT = 0;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..15
        #17..19
        */
    //end;

    //Unsupported feature: Property Deletion (DeleteAllowed).

}
