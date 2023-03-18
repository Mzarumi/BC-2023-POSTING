#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185607 pageextension52185607 extends "Recurring General Journal" 
{
    Caption = 'Recurring General Journal';
    layout
    {
        modify(CurrentJnlBatchName)
        {
            ApplicationArea = Basic;
        }
        modify("Recurring Method")
        {
            ApplicationArea = Basic;
        }
        modify("Recurring Frequency")
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
        modify("Account Type")
        {
            ApplicationArea = Basic;
        }
        modify("Account No.")
        {
            ApplicationArea = Basic;
        }
        modify("Depreciation Book Code")
        {
            ApplicationArea = Basic;
        }
        modify("FA Posting Type")
        {
            ApplicationArea = Basic;
        }
        modify(Description)
        {
            ApplicationArea = Basic;
        }
        modify("Business Unit Code")
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
        modify("Allocated Amt. (LCY)")
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
        modify("Expiration Date")
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
        modify(Balance)
        {
            ApplicationArea = Basic;
        }
        modify(TotalBalance)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "CurrentJnlBatchName(Control 37)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Recurring Method"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Recurring Frequency"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Date"(Control 74)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Type"(Control 8)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Account Type"(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Account No."(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Depreciation Book Code"(Control 39)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""FA Posting Type"(Control 78)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Business Unit Code"(Control 68)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Salespers./Purch. Code"(Control 52)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Campaign No."(Control 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Posting Type"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Bus. Posting Group"(Control 76)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Prod. Posting Group"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Bus. Posting Group"(Control 80)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Prod. Posting Group"(Control 82)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Amount(Control 22)".


        //Unsupported feature: Property Deletion (Visible) on "Amount(Control 22)".

        modify("Amount (LCY)")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Debit Amount"(Control 1000)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Credit Amount"(Control 1001)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Amount"(Control 92)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Difference"(Control 96)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Terms Code"(Control 70)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to Doc. Type"(Control 58)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to Doc. No."(Control 60)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to ID"(Control 72)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""On Hold"(Control 62)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bank Payment Type"(Control 64)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reason Code"(Control 66)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Allocated Amt. (LCY)"(Control 24)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bill-to/Pay-to No."(Control 88)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to/Order Address Code"(Control 90)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Expiration Date"(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Comment(Control 3)".

        // modify("Shortcut Dimension 1 Code")
        // {
        //     Visible = false;
        // }
        // modify("Shortcut Dimension 2 Code")
        // {
        //     Visible = false;
        // }
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

        //Unsupported feature: Property Deletion (ToolTipML) on "AccName(Control 33)".


        //Unsupported feature: Property Deletion (ShowCaption) on "AccName(Control 33)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Balance(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TotalBalance(Control 31)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("VAT Difference")
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
            field("ShortcutDimCode[3]";ShortcutDimCode[3])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,3';
                TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3),
                                                              "Dimension Value Type"=const(Standard),
                                                              Blocked=const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(3,ShortcutDimCode[3]);
                end;
            }
            field("ShortcutDimCode[4]";ShortcutDimCode[4])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,4';
                TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4),
                                                              "Dimension Value Type"=const(Standard),
                                                              Blocked=const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(4,ShortcutDimCode[4]);
                end;
            }
            field("ShortcutDimCode[5]";ShortcutDimCode[5])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,5';
                TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5),
                                                              "Dimension Value Type"=const(Standard),
                                                              Blocked=const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(5,ShortcutDimCode[5]);
                end;
            }
            field("ShortcutDimCode[6]";ShortcutDimCode[6])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,6';
                TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(6),
                                                              "Dimension Value Type"=const(Standard),
                                                              Blocked=const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(6,ShortcutDimCode[6]);
                end;
            }
            field("ShortcutDimCode[7]";ShortcutDimCode[7])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,7';
                TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(7),
                                                              "Dimension Value Type"=const(Standard),
                                                              Blocked=const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(7,ShortcutDimCode[7]);
                end;
            }
            field("ShortcutDimCode[8]";ShortcutDimCode[8])
            {
                ApplicationArea = Basic;
                CaptionClass = '1,2,8';
                TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(8),
                                                              "Dimension Value Type"=const(Standard),
                                                              Blocked=const(false));
                Visible = false;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(8,ShortcutDimCode[8]);
                end;
            }
        }
    }
    actions
    {
        modify(Allocations)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Allocations(Action 84)".

        }
        modify(Dimensions)
        {
            ApplicationArea = Basic;
        }
        modify(Card)
        {
            ApplicationArea = Basic;
        }
        modify("Ledger E&ntries")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Promoted) on ""Ledger E&ntries"(Action 43)".


            //Unsupported feature: Property Modification (PromotedCategory) on ""Ledger E&ntries"(Action 43)".

        }
        modify("Insert Conv. LCY Rndg. Lines")
        {
            ApplicationArea = Basic;
        }
        modify("Test Report")
        {
            ApplicationArea = Basic;
        }
        modify(Post)
        {

            //Unsupported feature: Property Modification (Name) on "Post(Action 46)".

            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Post(Action 46)".

        }
        modify(Preview)
        {
            ApplicationArea = Basic;
        }
        modify("Post and &Print")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Post and &Print"(Action 47)".

        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Allocations(Action 84)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 57)".


        //Unsupported feature: Property Deletion (Promoted) on "Dimensions(Action 57)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Dimensions(Action 57)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Card(Action 42)".


        //Unsupported feature: Property Deletion (Promoted) on "Card(Action 42)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Card(Action 42)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ledger E&ntries"(Action 43)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Insert Conv. LCY Rndg. Lines"(Action 87)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Test Report"(Action 45)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Post(Action 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Preview(Action 5)".


        //Unsupported feature: Property Deletion (Promoted) on "Preview(Action 5)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Preview(Action 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post and &Print"(Action 47)".

    }


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


    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TotalBalanceVisible := TRUE;
        BalanceVisible := TRUE;
        AmountVisible := TRUE;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        TotalBalanceVisible := TRUE;
        BalanceVisible := TRUE;
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetControlVisibility;
        SetDimensionsVisibility;

        IF IsOpenedFromBatch THEN BEGIN
          CurrentJnlBatchName := "Journal Batch Name";
          GenJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
        #7..9
        IF NOT JnlSelected THEN
          ERROR('');
        GenJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #4..12
        */
    //end;

    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

}
