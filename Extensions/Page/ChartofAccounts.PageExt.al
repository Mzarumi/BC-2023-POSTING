#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185435 pageextension52185435 extends "Chart of Accounts" 
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
        modify("Net Change")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Net Change"(Control 18)".


            //Unsupported feature: Property Modification (Name) on ""Net Change"(Control 18)".

        }
        modify(Balance)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on "Balance(Control 16)".


            //Unsupported feature: Property Modification (Name) on "Balance(Control 16)".

        }
        modify("Income/Balance")
        {
            ApplicationArea = Basic;
        }
        modify("Account Category")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Account Category"(Control 9)".


            //Unsupported feature: Property Modification (Name) on ""Account Category"(Control 9)".

        }
        modify("Account Subcategory Descript.")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Account Subcategory Descript."(Control 11)".


            //Unsupported feature: Property Modification (Name) on ""Account Subcategory Descript."(Control 11)".

        }
        modify("Account Type")
        {
            ApplicationArea = Basic;
        }
        modify("Direct Posting")
        {
            ApplicationArea = Basic;
        }
        modify(Totaling)
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
        modify("Debit Amount")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Debit Amount"(Control 15)".


            //Unsupported feature: Property Modification (Name) on ""Debit Amount"(Control 15)".

        }
        modify("Credit Amount")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Credit Amount"(Control 17)".


            //Unsupported feature: Property Modification (Name) on ""Credit Amount"(Control 17)".

        }
        modify("Balance at Date")
        {
            ApplicationArea = Basic;
        }
        modify("Additional-Currency Net Change")
        {
            ApplicationArea = Basic;
        }
        modify("Add.-Currency Balance at Date")
        {
            ApplicationArea = Basic;
        }
        modify("Additional-Currency Balance")
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
        modify("Cost Type No.")
        {
            ApplicationArea = Basic;
        }
        modify("Consol. Translation Method")
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

        //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 2)".


        //Unsupported feature: Property Deletion (Width) on "Name(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Name(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Net Change"(Control 18)".


        //Unsupported feature: Property Deletion (Visible) on ""Net Change"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Balance(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Income/Balance"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Account Category"(Control 9)".


        //Unsupported feature: Property Deletion (Visible) on ""Account Category"(Control 9)".


        //Unsupported feature: Property Deletion (DrillDown) on ""Account Subcategory Descript."(Control 11)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Account Subcategory Descript."(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Account Subcategory Descript."(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Account Type"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Direct Posting"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Totaling(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Posting Type"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Bus. Posting Group"(Control 37)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Prod. Posting Group"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Bus. Posting Group"(Control 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Prod. Posting Group"(Control 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Debit Amount"(Control 15)".


        //Unsupported feature: Property Deletion (Visible) on ""Debit Amount"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Credit Amount"(Control 17)".


        //Unsupported feature: Property Deletion (Visible) on ""Credit Amount"(Control 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Balance at Date"(Control 59)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Additional-Currency Net Change"(Control 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Add.-Currency Balance at Date"(Control 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Additional-Currency Balance"(Control 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Consol. Debit Acc."(Control 39)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Consol. Credit Acc."(Control 41)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Cost Type No."(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Consol. Translation Method"(Control 61)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Default IC Partner G/L Acc. No"(Control 57)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Default Deferral Template Code"(Control 7)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905532107(Control 1905532107)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter(Balance)
        {
            field("Budgeted Amount";Rec."Budgeted Amount")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Debit Amount")
        {
            field("Date Filter";Rec."Date Filter")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("No.";"Credit Amount")
        moveafter(Name;"Income/Balance")
        moveafter("Income/Balance";"Account Type")
        moveafter("VAT Prod. Posting Group";Balance)
        moveafter("Net Change";"Account Category")
        moveafter("Credit Amount";"Balance at Date")
        moveafter(Balance;"Additional-Currency Net Change")
    }
    actions
    {
        modify("Ledger E&ntries")
        {
            ApplicationArea = Basic;
        }
        modify("Co&mments")
        {
            ApplicationArea = Basic;
        }
        modify("Dimensions-Single")
        {
            ApplicationArea = Basic;
        }
        modify("Dimensions-&Multiple")
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
        modify("G/L Account Balance/Bud&get")
        {
            ApplicationArea = Basic;
        }
        modify("G/L Balance/B&udget")
        {
            ApplicationArea = Basic;
        }
        modify("Chart of Accounts &Overview")
        {
            ApplicationArea = Basic;
        }
        modify("G/L Register")
        {
            ApplicationArea = Basic;
        }
        modify(IndentChartOfAccounts)
        {
            ApplicationArea = Basic;
        }
        modify("General Journal")
        {
            Caption = 'Recurring General Journal';
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (RunObject) on ""General Journal"(Action 70)".


            //Unsupported feature: Property Modification (Name) on ""General Journal"(Action 70)".

        }
        modify("Close Income Statement")
        {
            ApplicationArea = Basic;
        }
        modify(DocsWithoutIC)
        {
            ApplicationArea = Basic;
        }
        // modify("Detail Trial Balance")
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Trial Balance")
        {
            ApplicationArea = Basic;
        }
        // modify("Trial Balance by Period")
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Insertion (Promoted) on ""Trial Balance by Period"(Action 1902174606)".

        // }
        modify(Action1900210206)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Image) on "Action1900210206(Action 1900210206)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Ledger E&ntries"(Action 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Dimensions-Single"(Action 84)".



        //Unsupported feature: Code Modification on ""Dimensions-&Multiple"(Action 33).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CurrPage.SETSELECTIONFILTER(GLAcc);
            DefaultDimMultiple.SetMultiRecord(GLAcc,FIELDNO("No."));
            DefaultDimMultiple.RUNMODAL;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CurrPage.SETSELECTIONFILTER(GLAcc);
            DefaultDimMultiple.SetMultiGLAcc(GLAcc);
            DefaultDimMultiple.RUNMODAL;
            */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Dimensions-&Multiple"(Action 33)".

        modify(SetDimensionFilter)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""E&xtended Texts"(Action 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Receivables-Payables"(Action 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Where-Used List"(Action 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L &Account Balance"(Action 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L &Balance"(Action 132)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L Balance by &Dimension"(Action 126)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L Account Balance/Bud&get"(Action 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L Balance/B&udget"(Action 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Chart of Accounts &Overview"(Action 56)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""G/L Register"(Action 1900210203)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""G/L Register"(Action 1900210203)".


        //Unsupported feature: Property Deletion (ToolTipML) on "IndentChartOfAccounts(Action 30)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "IndentChartOfAccounts(Action 30)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""General Journal"(Action 70)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""General Journal"(Action 70)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Close Income Statement"(Action 20)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Close Income Statement"(Action 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on "DocsWithoutIC(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Detail Trial Balance"(Action 1900670506)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Detail Trial Balance"(Action 1900670506)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Trial Balance"(Action 1904082706)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Trial Balance"(Action 1904082706)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Trial Balance by Period"(Action 1902174606)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Action1900210206(Action 1900210206)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Action1900210206(Action 1900210206)".

        addafter("G/L Balance by &Dimension")
        {
            separator(Action52)
            {
                Caption = '';
            }
        }
        addafter("G/L Balance/B&udget")
        {
            separator(Action55)
            {
            }
        }
    }

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (QueryCategory).


    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
