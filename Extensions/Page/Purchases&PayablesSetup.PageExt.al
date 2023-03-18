#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185746 pageextension52185746 extends "Purchases & Payables Setup" 
{
    layout
    {
        modify("Discount Posting")
        {
            ApplicationArea = Basic;
        }
        modify("Receipt on Invoice")
        {
            ApplicationArea = Basic;
        }
        modify("Return Shipment on Credit Memo")
        {
            ApplicationArea = Basic;
        }
        modify("Invoice Rounding")
        {
            ApplicationArea = Basic;
        }
        modify("Create Item from Item No.")
        {

            //Unsupported feature: Property Modification (ControlType) on ""Create Item from Item No."(Control 13)".


            //Unsupported feature: Property Modification (Name) on ""Create Item from Item No."(Control 13)".

            Caption = 'Post & Print';

            //Unsupported feature: Property Insertion (GroupType) on ""Create Item from Item No."(Control 13)".

        }
        modify("Copy Vendor Name to Entries")
        {

            //Unsupported feature: Property Modification (Level) on ""Copy Vendor Name to Entries"(Control 17)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Copy Vendor Name to Entries"(Control 17)".


            //Unsupported feature: Property Modification (Name) on ""Copy Vendor Name to Entries"(Control 17)".

        }
        modify("Ext. Doc. No. Mandatory")
        {
            ApplicationArea = Basic;
        }
        modify("Allow VAT Difference")
        {
            ApplicationArea = Basic;
        }
        modify("Calc. Inv. Discount")
        {
            ApplicationArea = Basic;
        }
        modify("Calc. Inv. Disc. per VAT ID")
        {
            ApplicationArea = Basic;
        }
        modify("Appln. between Currencies")
        {
            ApplicationArea = Basic;
        }
        modify("Copy Comments Blanket to Order")
        {
            ApplicationArea = Basic;
        }
        modify("Copy Comments Order to Invoice")
        {
            ApplicationArea = Basic;
        }
        modify("Copy Comments Order to Receipt")
        {
            ApplicationArea = Basic;
        }
        modify("Copy Cmts Ret.Ord. to Cr. Memo")
        {
            ApplicationArea = Basic;
        }
        modify("Copy Cmts Ret.Ord. to Ret.Shpt")
        {
            ApplicationArea = Basic;
        }
        modify("Exact Cost Reversing Mandatory")
        {
            ApplicationArea = Basic;
        }
        modify("Check Prepmt. when Posting")
        {
            ApplicationArea = Basic;
        }
        modify("Prepmt. Auto Update Frequency")
        {

            //Unsupported feature: Property Modification (ControlType) on ""Prepmt. Auto Update Frequency"(Control 9)".


            //Unsupported feature: Property Modification (Name) on ""Prepmt. Auto Update Frequency"(Control 9)".

            Caption = 'General';

            //Unsupported feature: Property Insertion (GroupType) on ""Prepmt. Auto Update Frequency"(Control 9)".

        }
        modify("Default Posting Date")
        {
            ApplicationArea = Basic;
        }
        modify("Default Qty. to Receive")
        {
            ApplicationArea = Basic;
        }
        modify("Allow Document Deletion Before")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Allow Document Deletion Before"(Control 35)".


            //Unsupported feature: Property Modification (Name) on ""Allow Document Deletion Before"(Control 35)".

        }
        modify("Ignore Updated Addresses")
        {

            //Unsupported feature: Property Modification (Level) on ""Ignore Updated Addresses"(Control 11)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Ignore Updated Addresses"(Control 11)".


            //Unsupported feature: Property Modification (Name) on ""Ignore Updated Addresses"(Control 11)".

        }
        modify("Number Series")
        {
            Caption = 'Numbering';

            //Unsupported feature: Property Modification (Name) on ""Number Series"(Control 1904569201)".

        }
        modify("Vendor Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Quote Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Blanket Order Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Order Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Return Order Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Invoice Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Invoice Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Credit Memo Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Credit Memo Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Receipt Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Return Shpt. Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Prepmt. Inv. Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Posted Prepmt. Cr. Memo Nos.")
        {
            ApplicationArea = Basic;
        }
        modify("Post with Job Queue")
        {

            //Unsupported feature: Property Modification (Level) on ""Post with Job Queue"(Control 19)".

            ApplicationArea = Basic;
        }
        modify("Post & Print with Job Queue")
        {

            //Unsupported feature: Property Modification (Level) on ""Post & Print with Job Queue"(Control 15)".

            ApplicationArea = Basic;
        }
        modify("Job Queue Category Code")
        {

            //Unsupported feature: Property Modification (Level) on ""Job Queue Category Code"(Control 5)".

            ApplicationArea = Basic;
        }
        modify("Notify On Success")
        {

            //Unsupported feature: Property Modification (Level) on ""Notify On Success"(Control 3)".

            ApplicationArea = Basic;
        }
        modify("Archive Orders")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Archive Orders"(Control 41)".


            //Unsupported feature: Property Modification (Name) on ""Archive Orders"(Control 41)".

        }
        modify("Archive Blanket Orders")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Archive Blanket Orders"(Control 39)".


            //Unsupported feature: Property Modification (Name) on ""Archive Blanket Orders"(Control 39)".

        }
        modify("Archive Return Orders")
        {

            //Unsupported feature: Property Modification (Level) on ""Archive Return Orders"(Control 37)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Archive Return Orders"(Control 37)".


            //Unsupported feature: Property Modification (Name) on ""Archive Return Orders"(Control 37)".

        }
        modify("Default Accounts")
        {
            Caption = 'Data Exchange';

            //Unsupported feature: Property Modification (Name) on ""Default Accounts"(Control 21)".

        }
        modify("Debit Acc. for Non-Item Lines")
        {
            ApplicationArea = Basic;
        }
        modify("Credit Acc. for Non-Item Lines")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Discount Posting"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Receipt on Invoice"(Control 4)".


        //Unsupported feature: Property Deletion (Importance) on ""Receipt on Invoice"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Return Shipment on Credit Memo"(Control 32)".


        //Unsupported feature: Property Deletion (Importance) on ""Return Shipment on Credit Memo"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Invoice Rounding"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Create Item from Item No."(Control 13)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""Create Item from Item No."(Control 13)".


        //Unsupported feature: Property Deletion (SourceExpr) on ""Create Item from Item No."(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Copy Vendor Name to Entries"(Control 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ext. Doc. No. Mandatory"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow VAT Difference"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Calc. Inv. Discount"(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Calc. Inv. Disc. per VAT ID"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Appln. between Currencies"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Copy Comments Blanket to Order"(Control 12)".


        //Unsupported feature: Property Deletion (Importance) on ""Copy Comments Blanket to Order"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Copy Comments Order to Invoice"(Control 16)".


        //Unsupported feature: Property Deletion (Importance) on ""Copy Comments Order to Invoice"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Copy Comments Order to Receipt"(Control 18)".


        //Unsupported feature: Property Deletion (Importance) on ""Copy Comments Order to Receipt"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Copy Cmts Ret.Ord. to Cr. Memo"(Control 36)".


        //Unsupported feature: Property Deletion (Importance) on ""Copy Cmts Ret.Ord. to Cr. Memo"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Copy Cmts Ret.Ord. to Ret.Shpt"(Control 30)".


        //Unsupported feature: Property Deletion (Importance) on ""Copy Cmts Ret.Ord. to Ret.Shpt"(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Exact Cost Reversing Mandatory"(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Check Prepmt. when Posting"(Control 55)".


        //Unsupported feature: Property Deletion (Importance) on ""Check Prepmt. when Posting"(Control 55)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Prepmt. Auto Update Frequency"(Control 9)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""Prepmt. Auto Update Frequency"(Control 9)".


        //Unsupported feature: Property Deletion (SourceExpr) on ""Prepmt. Auto Update Frequency"(Control 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Default Posting Date"(Control 59)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Default Qty. to Receive"(Control 61)".


        //Unsupported feature: Property Deletion (Importance) on ""Default Qty. to Receive"(Control 61)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allow Document Deletion Before"(Control 35)".


        //Unsupported feature: Property Deletion (Importance) on ""Allow Document Deletion Before"(Control 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ignore Updated Addresses"(Control 11)".


        //Unsupported feature: Property Deletion (GroupType) on ""Number Series"(Control 1904569201)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor Nos."(Control 83)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Quote Nos."(Control 42)".


        //Unsupported feature: Property Deletion (Importance) on ""Quote Nos."(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Blanket Order Nos."(Control 14)".


        //Unsupported feature: Property Deletion (Importance) on ""Blanket Order Nos."(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Order Nos."(Control 44)".


        //Unsupported feature: Property Deletion (Importance) on ""Order Nos."(Control 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Return Order Nos."(Control 34)".


        //Unsupported feature: Property Deletion (Importance) on ""Return Order Nos."(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Invoice Nos."(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Invoice Nos."(Control 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Credit Memo Nos."(Control 87)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Credit Memo Nos."(Control 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Receipt Nos."(Control 46)".


        //Unsupported feature: Property Deletion (Importance) on ""Posted Receipt Nos."(Control 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Return Shpt. Nos."(Control 26)".


        //Unsupported feature: Property Deletion (Importance) on ""Posted Return Shpt. Nos."(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Prepmt. Inv. Nos."(Control 52)".


        //Unsupported feature: Property Deletion (Importance) on ""Posted Prepmt. Inv. Nos."(Control 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posted Prepmt. Cr. Memo Nos."(Control 40)".


        //Unsupported feature: Property Deletion (Importance) on ""Posted Prepmt. Cr. Memo Nos."(Control 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post with Job Queue"(Control 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post & Print with Job Queue"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Job Queue Category Code"(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Notify On Success"(Control 3)".

        modify(Archiving)
        {
            Visible = false;
        }
        modify("Archive Quotes")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Archive Orders"(Control 41)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Archive Blanket Orders"(Control 39)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Archive Return Orders"(Control 37)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Debit Acc. for Non-Item Lines"(Control 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Credit Acc. for Non-Item Lines"(Control 27)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("Check Prepmt. when Posting")
        {
            // field("Archive Quotes and Orders";Rec."Archive Quotes and Orders")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("Stores Requisition No"; Rec."Stores Requisition No")
            {
                ApplicationArea = Basic;
            }
            field("Requisition No"; Rec."Requisition No")
            {
                ApplicationArea = Basic;
            }
            field("Quotation Request No"; Rec."Quotation Request No")
            {
                ApplicationArea = Basic;
            }
        }
        addfirst("Background Posting")
        {
            group(Post)
            {
                Caption = 'Post';
            }
        }
        moveafter("Invoice Rounding";"Ext. Doc. No. Mandatory")
        moveafter("Check Prepmt. when Posting";"Default Posting Date")
        // moveafter("Requisition Default Vendor";"Archive Blanket Orders")
        // moveafter("Allow Invoice on PO";"Number Series")
        // moveafter("Order Nos.";"Archive Orders")
        // moveafter("Contract No";"Return Order Nos.")
        // moveafter("Post with Job Queue";"Copy Vendor Name to Entries")
        // moveafter("Post & Print";"Post & Print with Job Queue")
        moveafter("Post & Print with Job Queue";"Ignore Updated Addresses")
    }
    actions
    {
        // modify(ActionContainer33)
        // {
        //     Visible = false;
        // }
        modify("Vendor Posting Groups")
        {
            Visible = false;
        }
        modify("Incoming Documents Setup")
        {
            Visible = false;
        }
    }

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).

}
