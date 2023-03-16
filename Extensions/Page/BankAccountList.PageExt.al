#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185667 pageextension52185667 extends "Bank Account List"
{
    Editable = true;
    Caption = 'Bank Account List';

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Bank Account List"(Page 371)".

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
        modify(OnlineFeedStatementStatus)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on "OnlineFeedStatementStatus(Control 12)".


            //Unsupported feature: Property Modification (Name) on "OnlineFeedStatementStatus(Control 12)".

        }
        modify("Post Code")
        {
            ApplicationArea = Basic;
        }
        modify("Country/Region Code")
        {
            ApplicationArea = Basic;
        }
        modify("Phone No.")
        {
            ApplicationArea = Basic;
        }
        modify("Fax No.")
        {
            ApplicationArea = Basic;
        }
        modify(Contact)
        {
            ApplicationArea = Basic;
        }
        modify("Bank Account No.")
        {
            ApplicationArea = Basic;
        }
        modify("SWIFT Code")
        {
            ApplicationArea = Basic;
        }
        modify(Iban)
        {
            ApplicationArea = Basic;
        }
        modify("Our Contact Code")
        {
            ApplicationArea = Basic;
        }
        modify("Bank Acc. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Currency Code")
        {
            ApplicationArea = Basic;
        }
        modify("Language Code")
        {
            ApplicationArea = Basic;
        }
        modify("Search Name")
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Insertion (Visible) on "Control1905767507(Control 1905767507)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Name(Control 4)".


        //Unsupported feature: Property Deletion (CaptionML) on "OnlineFeedStatementStatus(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on "OnlineFeedStatementStatus(Control 12)".


        //Unsupported feature: Property Deletion (Visible) on "OnlineFeedStatementStatus(Control 12)".


        //Unsupported feature: Property Deletion (Editable) on "OnlineFeedStatementStatus(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post Code"(Control 87)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Country/Region Code"(Control 89)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Phone No."(Control 91)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Fax No."(Control 93)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Contact(Control 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bank Account No."(Control 105)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""SWIFT Code"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on "IBAN(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Our Contact Code"(Control 95)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bank Acc. Posting Group"(Control 97)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Language Code"(Control 103)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Search Name"(Control 10)".


        //Unsupported feature: Property Deletion (Visible) on ""Search Name"(Control 10)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905532107(Control 1905532107)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter(Contact)
        {
            field("Balance (LCY)"; Rec."Balance (LCY)")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(OnlineFeedStatementStatus)
        {
            // field("Responsibility Center";"Responsibility Center")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        moveafter(Name; "Post Code")
    }
    actions
    {
        modify(Statistics)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Statistics(Action 17)".

        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify(PositivePayExport)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on "PositivePayExport(Action 9)".

        }
        modify("Dimensions-Single")
        {
            ApplicationArea = Basic;
        }
        modify("Dimensions-&Multiple")
        {
            ApplicationArea = Basic;
        }
        modify(Balance)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Balance(Action 6)".

        }
        modify(Statements)
        {
            ApplicationArea = Basic;
        }
        modify("Ledger E&ntries")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunPageView) on ""Ledger E&ntries"(Action 19)".


            //Unsupported feature: Property Modification (Promoted) on ""Ledger E&ntries"(Action 19)".


            //Unsupported feature: Property Modification (PromotedCategory) on ""Ledger E&ntries"(Action 19)".

        }
        modify("Chec&k Ledger Entries")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunPageView) on ""Chec&k Ledger Entries"(Action 20)".

        }
        modify("C&ontact")
        {
            ApplicationArea = Basic;
        }
        modify(PagePosPayEntries)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on "PagePosPayEntries(Action 5)".

        }
        modify("Detail Trial Balance")
        {
            ApplicationArea = Basic;
        }
        modify("Check Details")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Promoted) on ""Check Details"(Action 1904208406)".

        }
        modify("Trial Balance by Period")
        {
            ApplicationArea = Basic;
        }
        modify("Trial Balance")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Promoted) on ""Trial Balance"(Action 1904082706)".

        }
        modify("Bank Account Statements")
        {
            ToolTip = 'View, print, or save statements for selected bank accounts. For each bank transaction, the report shows a description, an applied amount, a statement amount, and other information.';
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Statistics(Action 17)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Statistics(Action 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 18)".


        //Unsupported feature: Property Deletion (Promoted) on ""Co&mments"(Action 18)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Co&mments"(Action 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PositivePayExport(Action 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Dimensions-Single"(Action 84)".


        //Unsupported feature: Property Deletion (Promoted) on ""Dimensions-Single"(Action 84)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Dimensions-Single"(Action 84)".



        //Unsupported feature: Code Modification on ""Dimensions-&Multiple"(Action 21).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(BankAcc);
        DefaultDimMultiple.SetMultiRecord(BankAcc,FIELDNO("No."));
        DefaultDimMultiple.RUNMODAL;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(BankAcc);
        DefaultDimMultiple.SetMultiBankAcc(BankAcc);
        DefaultDimMultiple.RUNMODAL;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Dimensions-&Multiple"(Action 21)".


        //Unsupported feature: Property Deletion (Promoted) on ""Dimensions-&Multiple"(Action 21)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Dimensions-&Multiple"(Action 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Balance(Action 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Statements(Action 7)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ledger E&ntries"(Action 19)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on ""Ledger E&ntries"(Action 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Chec&k Ledger Entries"(Action 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""C&ontact"(Action 25)".


        //Unsupported feature: Property Deletion (Promoted) on ""C&ontact"(Action 25)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""C&ontact"(Action 25)".

        modify(CreateNewLinkedBankAccount)
        {
            Visible = false;
        }
        modify(LinkToOnlineBankAccount)
        {
            Visible = false;
        }
        modify(UnlinkOnlineBankAccount)
        {
            Visible = false;
        }
        modify(RefreshOnlineBankAccount)
        {
            Visible = false;
        }
        modify(UpdateBankAccountLinking)
        {
            Visible = false;
        }
        modify(AutomaticBankStatementImportSetup)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "PagePosPayEntries(Action 5)".


        //Unsupported feature: Property Deletion (RunPageView) on "PagePosPayEntries(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Detail Trial Balance"(Action 1900670506)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Detail Trial Balance"(Action 1900670506)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Check Details"(Action 1904208406)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Trial Balance by Period"(Action 1902174606)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Trial Balance by Period"(Action 1902174606)".

        modify(List)
        {
            Visible = false;
        }
        modify("Receivables-Payables")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Trial Balance"(Action 1904082706)".

    }


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CALCFIELDS("Check Report Name");
    GetOnlineFeedStatementStatus(OnlineFeedStatementStatus,Linked);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CALCFIELDS("Check Report Name");
    */
    //end;

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
