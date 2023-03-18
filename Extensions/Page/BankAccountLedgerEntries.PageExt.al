#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185668 pageextension52185668 extends "Bank Account Ledger Entries" 
{
    Editable = true;
    layout
    {
        modify(Control1)
        {
            Editable = true;
        }
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
        modify("Bank Account No.")
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
            Editable = true;
        }
        modify("Global Dimension 1 Code")
        {
            ApplicationArea = Basic;
        }
        modify("Global Dimension 2 Code")
        {
            ApplicationArea = Basic;
        }
        modify("Our Contact Code")
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
        modify("Debit Amount")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Debit Amount"(Control 3)".


            //Unsupported feature: Property Modification (Name) on ""Debit Amount"(Control 3)".

        }
        modify("Remaining Amount")
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
        modify(Open)
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
        modify("Entry No.")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Type"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bank Account No."(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Global Dimension 1 Code"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Global Dimension 2 Code"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Our Contact Code"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Amount(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Amount (LCY)"(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Debit Amount"(Control 3)".


        //Unsupported feature: Property Deletion (Visible) on ""Debit Amount"(Control 3)".

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

        //Unsupported feature: Property Deletion (ToolTipML) on ""Remaining Amount"(Control 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account Type"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account No."(Control 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Open(Control 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""User ID"(Control 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Source Code"(Control 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reason Code"(Control 56)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Reversed(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reversed by Entry No."(Control 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reversed Entry No."(Control 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Entry No."(Control 62)".

        modify("Dimension Set ID")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        moveafter("Document No.";"Debit Amount")
    }
    actions
    {
        modify("Check Ledger E&ntries")
        {
            ApplicationArea = Basic;
        }
        modify(Dimensions)
        {
            ApplicationArea = Basic;
        }
        modify("Reverse Transaction")
        {
            ApplicationArea = Basic;
        }
        modify("&Navigate")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""&Navigate"(Action 21)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Check Ledger E&ntries"(Action 46)".


        //Unsupported feature: Property Deletion (Promoted) on ""Check Ledger E&ntries"(Action 46)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Check Ledger E&ntries"(Action 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 25)".


        //Unsupported feature: Property Deletion (Promoted) on "Dimensions(Action 25)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Dimensions(Action 25)".

        modify(SetDimensionFilter)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Reverse Transaction"(Action 37)".


        //Unsupported feature: Property Deletion (Promoted) on ""Reverse Transaction"(Action 37)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Reverse Transaction"(Action 37)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""&Navigate"(Action 21)".

    }

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (SourceTableView).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
