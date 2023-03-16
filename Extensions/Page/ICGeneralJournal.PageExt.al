#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185873 pageextension52185873 extends "IC General Journal"
{
    Caption = 'IC General Journal';
    layout
    {
        modify(CurrentJnlBatchName)
        {
            ApplicationArea = Basic;
        }
        modify("Posting Date")
        {
            ApplicationArea = Basic;
        }
        modify("Document Date")
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
        modify("External Document No.")
        {
            ApplicationArea = Basic;
        }
        modify("Account Type")
        {
            ApplicationArea = Basic;
        }
        modify("Account No.")
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify("Salespers./Purch. Code")
        {
            ApplicationArea = Basic;
        }
        modify("Campaign No.")
        {
            ApplicationArea = Basic;
        }
        modify("Currency Code")
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
        modify(Amount)
        {
            ApplicationArea = Basic;
        }
        modify("Debit Amount")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on ""Debit Amount"(Control 1000)".

        }
        modify("Credit Amount")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on ""Credit Amount"(Control 1001)".

        }
        modify("VAT Amount")
        {
            ApplicationArea = Basic;
        }
        modify("VAT Difference")
        {
            ApplicationArea = Basic;
        }
        modify("Bal. VAT Amount")
        {
            ApplicationArea = Basic;
        }
        modify("Bal. VAT Difference")
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
        modify("Bal. Gen. Posting Type")
        {
            ApplicationArea = Basic;
        }
        modify("Bal. Gen. Bus. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Bal. Gen. Prod. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("IC Partner G/L Acc. No.")
        {
            ApplicationArea = Basic;
        }
        modify("Bal. VAT Prod. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Bal. VAT Bus. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Bill-to/Pay-to No.")
        {
            ApplicationArea = Basic;
        }
        modify("Ship-to/Order Address Code")
        {
            ApplicationArea = Basic;
        }
        modify("Payment Terms Code")
        {
            ApplicationArea = Basic;
        }
        modify("Applies-to Doc. Type")
        {
            ApplicationArea = Basic;
        }
        modify("Applies-to Doc. No.")
        {
            ApplicationArea = Basic;
        }
        modify("Applies-to ID")
        {
            ApplicationArea = Basic;
        }
        modify("On Hold")
        {
            ApplicationArea = Basic;
        }
        modify("Bank Payment Type")
        {
            ApplicationArea = Basic;
        }
        modify("Reason Code")
        {
            ApplicationArea = Basic;
        }
        modify(Comment)
        {
            ApplicationArea = Basic;
        }
        modify(AccName)
        {
            ApplicationArea = Basic;
        }
        modify(BalAccName)
        {
            ApplicationArea = Basic;
        }
        modify(Balance)
        {
            ApplicationArea = Basic;
        }
        modify(TotalBalance)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "CurrentJnlBatchName(Control 39)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Date"(Control 83)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Type"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""External Document No."(Control 81)".


        //Unsupported feature: Code Modification on ""Account Type"(Control 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        EnableApplyEntriesAction;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Account Type"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Account No."(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Salespers./Purch. Code"(Control 65)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Campaign No."(Control 93)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 67)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Posting Type"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Bus. Posting Group"(Control 77)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Prod. Posting Group"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Bus. Posting Group"(Control 41)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Prod. Posting Group"(Control 85)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Amount(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Debit Amount"(Control 1000)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Credit Amount"(Control 1001)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Amount"(Control 101)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Difference"(Control 99)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Amount"(Control 103)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Difference"(Control 105)".

        // modify("Bal. Account Type")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account Type"(Control 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account No."(Control 55)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Posting Type"(Control 57)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Bus. Posting Group"(Control 79)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Prod. Posting Group"(Control 59)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""IC Partner G/L Acc. No."(Control 71)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Prod. Posting Group"(Control 89)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Bus. Posting Group"(Control 87)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bill-to/Pay-to No."(Control 95)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to/Order Address Code"(Control 97)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Terms Code"(Control 69)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to Doc. Type"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to Doc. No."(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to ID"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""On Hold"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bank Payment Type"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reason Code"(Control 73)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Comment(Control 3)".

        modify("Shortcut Dimension 1 Code")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        modify(ShortcutDimCode3)
        {
            Visible = false;
        }
        modify(ShortcutDimCode4)
        {
            Visible = false;
        }
        modify(ShortcutDimCode5)
        {
            Visible = false;
        }
        modify(ShortcutDimCode6)
        {
            Visible = false;
        }
        modify(ShortcutDimCode7)
        {
            Visible = false;
        }
        modify(ShortcutDimCode8)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "AccName(Control 35)".


        //Unsupported feature: Property Deletion (ShowCaption) on "AccName(Control 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on "BalAccName(Control 37)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Balance(Control 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TotalBalance(Control 33)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("Ship-to/Order Address Code")
        {
            // field("Shortcut Dimension 1 Code";Rec."Shortcut Dimension 1 Code")
            // {
            //     ApplicationArea = Basic;
            //     Visible = false;
            // }
            // field("Shortcut Dimension 2 Code";Rec."Shortcut Dimension 2 Code")
            // {
            //     ApplicationArea = Basic;
            //     Visible = false;
            // }
            field("ShortcutDimCode[3]"; ShortcutDimCode[3])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,3';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                              "Dimension Value Type" = const(Standard),
                                                              Blocked = const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                end;
            }
            field("ShortcutDimCode[4]"; ShortcutDimCode[4])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,4';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4),
                                                              "Dimension Value Type" = const(Standard),
                                                              Blocked = const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                end;
            }
            field("ShortcutDimCode[5]"; ShortcutDimCode[5])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,5';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                              "Dimension Value Type" = const(Standard),
                                                              Blocked = const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                end;
            }
            field("ShortcutDimCode[6]"; ShortcutDimCode[6])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,6';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6),
                                                              "Dimension Value Type" = const(Standard),
                                                              Blocked = const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                end;
            }
            field("ShortcutDimCode[7]"; ShortcutDimCode[7])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,7';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7),
                                                              "Dimension Value Type" = const(Standard),
                                                              Blocked = const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                end;
            }
            field("ShortcutDimCode[8]"; ShortcutDimCode[8])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,8';
                TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8),
                                                              "Dimension Value Type" = const(Standard),
                                                              Blocked = const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                end;
            }
        }
    }
    actions
    {
        modify(Dimensions)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Dimensions(Action 76)".

        }
        modify(Card)
        {
            ApplicationArea = Basic;
        }
        modify("Ledger E&ntries")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Promoted) on ""Ledger E&ntries"(Action 45)".


            //Unsupported feature: Property Modification (PromotedCategory) on ""Ledger E&ntries"(Action 45)".

        }
        modify("Renumber Document Numbers")
        {
            ApplicationArea = Basic;
        }
        modify("Apply Entries")
        {
            ApplicationArea = Basic;
        }
        modify("Insert Conv. LCY Rndg. Lines")
        {
            ApplicationArea = Basic;
        }
        modify(Reconcile)
        {
            ApplicationArea = Basic;
        }
        modify("Test Report")
        {
            ApplicationArea = Basic;
        }
        modify("P&ost")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""P&ost"(Action 50)".

        }
        modify(Preview)
        {
            ApplicationArea = Basic;
        }
        modify("Post and &Print")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Post and &Print"(Action 51)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 76)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Card(Action 44)".


        //Unsupported feature: Property Deletion (Promoted) on "Card(Action 44)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Card(Action 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ledger E&ntries"(Action 45)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Renumber Document Numbers"(Action 5)".


        //Unsupported feature: Property Deletion (Promoted) on ""Renumber Document Numbers"(Action 5)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Renumber Document Numbers"(Action 5)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Renumber Document Numbers"(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Apply Entries"(Action 91)".


        //Unsupported feature: Property Deletion (Enabled) on ""Apply Entries"(Action 91)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Insert Conv. LCY Rndg. Lines"(Action 92)".


        //Unsupported feature: Property Deletion (Promoted) on ""Insert Conv. LCY Rndg. Lines"(Action 92)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Insert Conv. LCY Rndg. Lines"(Action 92)".


        //Unsupported feature: Property Deletion (PromotedOnly) on ""Insert Conv. LCY Rndg. Lines"(Action 92)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Reconcile(Action 48)".


        //Unsupported feature: Property Deletion (Promoted) on "Reconcile(Action 48)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Reconcile(Action 48)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Reconcile(Action 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Test Report"(Action 49)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""P&ost"(Action 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Preview(Action 9)".


        //Unsupported feature: Property Deletion (Promoted) on "Preview(Action 9)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Preview(Action 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post and &Print"(Action 51)".

    }


    //Unsupported feature: Property Modification (Id) on "ChangeExchangeRate(Variable 1001)".

    //var
    //>>>> ORIGINAL VALUE:
    //ChangeExchangeRate : 1001;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ChangeExchangeRate : 1000;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "GLReconcile(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //GLReconcile : 1000;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GLReconcile : 1001;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Length) on "AccName(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //AccName : 100;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AccName : 50;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Length) on "BalAccName(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //BalAccName : 100;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BalAccName : 50;
    //Variable type has not been exported.


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
    UpdateBalance;
    EnableApplyEntriesAction;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
    UpdateBalance;
    */
    //end;


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UpdateBalance;
    EnableApplyEntriesAction;
    SetUpNewLine(xRec,Balance,BelowxRec);
    CLEAR(ShortcutDimCode);
    CLEAR(AccName);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    UpdateBalance;
    #3..5
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetDimensionsVisibility;

    IF IsOpenedFromBatch THEN BEGIN
      CurrentJnlBatchName := "Journal Batch Name";
      GenJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
    #6..8
    IF NOT JnlSelected THEN
      ERROR('');
    GenJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #3..11
    */
    //end;

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
