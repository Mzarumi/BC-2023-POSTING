#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185675 pageextension52185675 extends "Bank Acc. Reconciliation" 
{

    //Unsupported feature: Property Modification (PromotedActionCategoriesML) on ""Bank Acc. Reconciliation"(Page 379)".


    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Bank Acc. Reconciliation"(Page 379)".

    layout
    {
        modify(BankAccountNo)
        {
            ApplicationArea = Basic;
        }
        modify(StatementNo)
        {
            ApplicationArea = Basic;
        }
        modify(StatementDate)
        {
            ApplicationArea = Basic;
        }
        modify(BalanceLastStatement)
        {
            ApplicationArea = Basic;
        }
        modify(StatementEndingBalance)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Modification (SubPageLink) on "ApplyBankLedgerEntries(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on "BankAccountNo(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on "StatementNo(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on "StatementDate(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on "BalanceLastStatement(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on "StatementEndingBalance(Control 30)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "StmtLine(Control 11)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "ApplyBankLedgerEntries(Control 6)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter(BankAccountNo)
        {
            // field("Reconciliation Type";"Reconciliation Type")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        addafter(StatementEndingBalance)
        {
            // field("Notes Line 1";"Notes Line 1")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Notes Line 2";"Notes Line 2")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Notes Line 3";"Notes Line 3")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Notes Line 4";"Notes Line 4")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Notes Line 5";"Notes Line 5")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Notes Line 6";"Notes Line 6")
            // {
            //     ApplicationArea = Basic;
            // }
        }
    }
    actions
    {
        // modify(ActionContainer1900000003)
        // {
        //     Visible = false;
        // }
        // modify("&Recon.")
        // {
        //     Visible = false;
        // }
        // modify("&Card")
        // {
        //     Visible = false;
        // }
        // modify(ActionContainer1900000004)
        // {
        //     Visible = false;
        // }
        modify("F&unctions")
        {
            Visible = false;
        }
        modify(SuggestLines)
        {
            Visible = false;
        }
        modify("Transfer to General Journal")
        {
            Visible = false;
        }
        modify("Ba&nk")
        {
            Visible = false;
        }
        modify(ImportBankStatement)
        {
            Visible = false;
        }
        modify("M&atching")
        {
            Visible = false;
        }
        modify(MatchAutomatically)
        {
            Visible = false;
        }
        modify(MatchManually)
        {
            Visible = false;
        }
        modify(RemoveMatch)
        {
            Visible = false;
        }
        modify(All)
        {
            Visible = false;
        }
        modify(NotMatched)
        {
            Visible = false;
        }
        modify("P&osting")
        {
            Visible = false;
        }
        modify("&Test Report")
        {
            Visible = false;
        }
        modify(Post)
        {
            Visible = false;
        }
        modify(PostAndPrint)
        {
            Visible = false;
        }
        addfirst(navigation)
        {
            // group("&Recon.")
            // {
            //     Caption = '&Recon.';
            //     Image = BankAccountRec;
            // }
            // action("&Card")
            // {
            //     ApplicationArea = Basic;
            //     Caption = '&Card';
            //     Image = EditLines;
            //     RunObject = Page "Bank Account Card";
            //     RunPageLink = "No."=field("Bank Account No.");
            //     ShortCutKey = 'Shift+F7';
            // }
        }
    }
}