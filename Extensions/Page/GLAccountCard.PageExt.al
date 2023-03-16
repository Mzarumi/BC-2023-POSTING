#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185436 pageextension52185436 extends "G/L Account Card"
{
    layout
    {
        modify("No.")
        {
            ApplicationArea = Basic;
        }
        modify(Name)
        {
            ApplicationArea = Basic;
        }
        modify("Income/Balance")
        {
            ApplicationArea = Basic;
        }
        // modify("Account Category")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (SourceExpr) on ""Account Category"(Control 11)".


        //     //Unsupported feature: Property Modification (Name) on ""Account Category"(Control 11)".

        // }
        // modify(SubCategoryDescription)
        // {

        //     //Unsupported feature: Property Modification (Name) on "SubCategoryDescription(Control 13)".

        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (SourceExpr) on "SubCategoryDescription(Control 13)".

        // }
        modify("Debit/Credit")
        {
            ApplicationArea = Basic;
        }
        modify("Account Type")
        {
            ApplicationArea = Basic;
        }
        modify(Totaling)
        {
            ApplicationArea = Basic;
        }
        modify("No. of Blank Lines")
        {
            ApplicationArea = Basic;
        }
        modify("New Page")
        {
            ApplicationArea = Basic;
        }
        modify("Search Name")
        {
            ApplicationArea = Basic;
        }
        modify(Balance)
        {
            ApplicationArea = Basic;
        }
        modify("Reconciliation Account")
        {
            ApplicationArea = Basic;
        }
        modify("Automatic Ext. Texts")
        {
            ApplicationArea = Basic;
        }
        modify("Direct Posting")
        {
            ApplicationArea = Basic;
        }
        modify(Blocked)
        {
            ApplicationArea = Basic;
        }
        modify("Last Date Modified")
        {
            ApplicationArea = Basic;
        }
        modify("Omit Default Descr. in Jnl.")
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
        modify("VAT Bus. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("VAT Prod. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Default IC Partner G/L Acc. No")
        {
            ApplicationArea = Basic;
        }
        modify("Default Deferral Template Code")
        {
            ApplicationArea = Basic;
        }
        modify("Consol. Debit Acc.")
        {
            ApplicationArea = Basic;
        }
        modify("Consol. Credit Acc.")
        {
            ApplicationArea = Basic;
        }
        modify("Consol. Translation Method")
        {
            ApplicationArea = Basic;
        }
        modify("Exchange Rate Adjustment")
        {
            ApplicationArea = Basic;
        }
        modify("Cost Type No.")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Name(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Income/Balance"(Control 6)".

        modify("Account Category")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Account Category"(Control 11)".

        // modify(SubCategoryDescription)
        // {
        //     Visible = false;
        // }
        // modify(SubCategoryDescription)
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (CaptionML) on "SubCategoryDescription(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SubCategoryDescription(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Debit/Credit"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Account Type"(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Totaling(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""No. of Blank Lines"(Control 18)".


        //Unsupported feature: Property Deletion (Importance) on ""No. of Blank Lines"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""New Page"(Control 20)".


        //Unsupported feature: Property Deletion (Importance) on ""New Page"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Search Name"(Control 22)".


        //Unsupported feature: Property Deletion (Importance) on ""Search Name"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Balance(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reconciliation Account"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Automatic Ext. Texts"(Control 57)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Direct Posting"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Blocked(Control 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Last Date Modified"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Omit Default Descr. in Jnl."(Control 7)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Posting Type"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Bus. Posting Group"(Control 55)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Prod. Posting Group"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Bus. Posting Group"(Control 39)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Prod. Posting Group"(Control 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Default IC Partner G/L Acc. No"(Control 59)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Default Deferral Template Code"(Control 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Consol. Debit Acc."(Control 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Consol. Credit Acc."(Control 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Consol. Translation Method"(Control 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Exchange Rate Adjustment"(Control 64)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Cost Type No."(Control 5)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905532107(Control 1905532107)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("Omit Default Descr. in Jnl.")
        {
            //field("Budget Controlled"; "Budget Controlled")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        moveafter("No."; SubCategoryDescription)
        moveafter("Income/Balance"; "Debit/Credit")
    }
    actions
    {
        modify("Ledger E&ntries")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunPageView) on ""Ledger E&ntries"(Action 41)".


            //Unsupported feature: Property Modification (Promoted) on ""Ledger E&ntries"(Action 41)".


            //Unsupported feature: Property Modification (PromotedCategory) on ""Ledger E&ntries"(Action 41)".

        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify(Dimensions)
        {
            ApplicationArea = Basic;
        }
        modify("E&xtended Texts")
        {
            ApplicationArea = Basic;
        }
        modify("Receivables-Payables")
        {
            ApplicationArea = Basic;
        }
        modify("Where-Used List")
        {
            ApplicationArea = Basic;
        }
        modify("G/L &Account Balance")
        {
            ApplicationArea = Basic;
        }
        modify("G/L &Balance")
        {
            ApplicationArea = Basic;
        }
        modify("G/L Balance by &Dimension")
        {
            ApplicationArea = Basic;
        }
        modify("General Posting Setup")
        {
            ApplicationArea = Basic;
        }
        modify("VAT Posting Setup")
        {
            ApplicationArea = Basic;
        }
        modify("G/L Register")
        {
            ApplicationArea = Basic;
        }
        // modify("Detail Trial Balance")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Insertion (Promoted) on ""Detail Trial Balance"(Action 1900670506)".

        // }
        // modify("Trial Balance")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Insertion (Promoted) on ""Trial Balance"(Action 1904082706)".

        // }
        // modify("Trial Balance by Period")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Insertion (Promoted) on ""Trial Balance by Period"(Action 1902174606)".

        // }
        modify(Action1900210206)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Promoted) on "Action1900210206(Action 1900210206)".

        }
        modify("Apply Template")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Ledger E&ntries"(Action 41)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Ledger E&ntries"(Action 41)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 38)".


        //Unsupported feature: Property Deletion (Promoted) on ""Co&mments"(Action 38)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Co&mments"(Action 38)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Co&mments"(Action 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 84)".


        //Unsupported feature: Property Deletion (Promoted) on "Dimensions(Action 84)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Dimensions(Action 84)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Dimensions(Action 84)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""E&xtended Texts"(Action 166)".


        //Unsupported feature: Property Deletion (Promoted) on ""E&xtended Texts"(Action 166)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""E&xtended Texts"(Action 166)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""E&xtended Texts"(Action 166)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Receivables-Payables"(Action 40)".


        //Unsupported feature: Property Deletion (Promoted) on ""Receivables-Payables"(Action 40)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Receivables-Payables"(Action 40)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Receivables-Payables"(Action 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Where-Used List"(Action 47)".


        //Unsupported feature: Property Deletion (Promoted) on ""Where-Used List"(Action 47)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Where-Used List"(Action 47)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Where-Used List"(Action 47)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L &Account Balance"(Action 46)".


        //Unsupported feature: Property Deletion (Promoted) on ""G/L &Account Balance"(Action 46)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""G/L &Account Balance"(Action 46)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""G/L &Account Balance"(Action 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L &Balance"(Action 154)".


        //Unsupported feature: Property Deletion (Promoted) on ""G/L &Balance"(Action 154)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""G/L &Balance"(Action 154)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""G/L &Balance"(Action 154)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L Balance by &Dimension"(Action 138)".


        //Unsupported feature: Property Deletion (Promoted) on ""G/L Balance by &Dimension"(Action 138)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""G/L Balance by &Dimension"(Action 138)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""G/L Balance by &Dimension"(Action 138)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""General Posting Setup"(Action 1906497203)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""General Posting Setup"(Action 1906497203)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Posting Setup"(Action 1900660103)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""VAT Posting Setup"(Action 1900660103)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L Register"(Action 1900210203)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""G/L Register"(Action 1900210203)".

        modify(DocsWithoutIC)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Detail Trial Balance"(Action 1900670506)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Trial Balance"(Action 1904082706)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Trial Balance by Period"(Action 1902174606)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Action1900210206(Action 1900210206)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Apply Template"(Action 62)".

    }


    //Unsupported feature: Code Insertion on "OnOpenPage".

    //trigger OnOpenPage()
    //begin
    /*
    FnRestrictAccess();
    */
    //end;

    procedure FnRestrictAccess()
    var
        StatusPermission: Record 52185687;
        ErrorOnRestrictViewTxt: label 'You do not have permissions to EDIT this Page. Contact your system administrator for further details';
    begin
        StatusPermission.Reset;
        StatusPermission.SetRange("User ID", UserId);
        StatusPermission.SetRange("Edit  G/L Account", true);
        StatusPermission.SetRange("View G/L Account", true);
        if not StatusPermission.Find('-') then begin
            CurrPage.Editable := false;
        end;
    end;

    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
