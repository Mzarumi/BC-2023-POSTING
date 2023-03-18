#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185677 pageextension52185677 extends "Apply Bank Acc. Ledger Entries" 
{

    //Unsupported feature: Property Insertion (SourceTableView) on ""Apply Bank Acc. Ledger Entries"(Page 381)".

    layout
    {
        modify(LineApplied)
        {
            ApplicationArea = Basic;
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
        modify(Description)
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

            //Unsupported feature: Property Modification (SourceExpr) on ""Debit Amount"(Control 20)".


            //Unsupported feature: Property Modification (Name) on ""Debit Amount"(Control 20)".

            Editable = false;
        }
        modify("Credit Amount")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (SourceExpr) on ""Credit Amount"(Control 21)".


            //Unsupported feature: Property Modification (Name) on ""Credit Amount"(Control 21)".

            Editable = false;
        }
        modify("Remaining Amount")
        {
            ApplicationArea = Basic;
        }
        modify(Open)
        {
            ApplicationArea = Basic;
        }
        modify(Positive)
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
        modify("Check Ledger Entries")
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
        modify(Control15)
        {
            ApplicationArea = Basic;
        }
        modify(Balance)
        {
            ApplicationArea = Basic;
        }
        modify(CheckBalance)
        {
            ApplicationArea = Basic;
        }
        modify(BalanceToReconcile)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "LineApplied(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Type"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Amount(Control 10)".


        //Unsupported feature: Property Deletion (Visible) on "Amount(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Debit Amount"(Control 20)".


        //Unsupported feature: Property Deletion (Visible) on ""Debit Amount"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Credit Amount"(Control 21)".


        //Unsupported feature: Property Deletion (Visible) on ""Credit Amount"(Control 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Remaining Amount"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Open(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Positive(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account Type"(Control 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account No."(Control 19)".

        modify("Statement Status")
        {
            Visible = false;
        }
        modify("Statement No.")
        {
            Visible = false;
        }
        modify("Statement Line No.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Check Ledger Entries"(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Global Dimension 1 Code"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Global Dimension 2 Code"(Control 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Balance(Control 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CheckBalance(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on "BalanceToReconcile(Control 13)".

        addafter("Document No.")
        {
            field("Entry No.";Rec."Entry No.")
            {
                ApplicationArea = Basic;
                Editable = false;
            }
            // field("Statement Status";Rec."Statement Status")
            // {
            //     ApplicationArea = Basic;
            //     Editable = false;
            // }
            // field("Statement No.";Rec."Statement No.")
            // {
            //     ApplicationArea = Basic;
            //     Editable = false;
            // }
            // field("Statement Line No.";Rec."Statement Line No.")
            // {
            //     ApplicationArea = Basic;
            //     Editable = false;
            // }
        }
        moveafter("Document No.";"Debit Amount")
        moveafter(Amount;"Remaining Amount")
    }


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        LineApplied := IsApplied;
        SetUserInteractions;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        LineApplied := IsApplied;
        SetUserInteractions;
        CalcBalance;
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "GetSelectedRecords(PROCEDURE 2)".


    //Unsupported feature: Property Deletion (Attributes) on "SetUserInteractions(PROCEDURE 3)".



    //Unsupported feature: Code Modification on "SetUserInteractions(PROCEDURE 3)".

    //procedure SetUserInteractions();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        StyleTxt := '';
        IF LineApplied THEN
          StyleTxt := 'Favorable';
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        StyleTxt := SetStyle;
        */
    //end;


    //Unsupported feature: Code Modification on "CalcBalance(PROCEDURE 4)".

    //procedure CalcBalance();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF BankAccount.GET("Bank Account No.") THEN BEGIN
          BankAccount.CALCFIELDS(Balance,"Total on Checks");
          Balance := BankAccount.Balance;
          CheckBalance := BankAccount."Total on Checks";
          BalanceToReconcile := CalcBalanceToReconcile;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
          BalanceToReconcile := Balance - CheckBalance;
        END;
        */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "ToggleMatchedFilter(PROCEDURE 5)".


    procedure SetDateFilter(StatementDate: Date)
    begin
        Rec.SetFilter(Rec."Posting Date",'<=%1',StatementDate);
        CurrPage.Update;
    end;
}
