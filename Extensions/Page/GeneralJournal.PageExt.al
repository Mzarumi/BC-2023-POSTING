#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185451 pageextension52185451 extends "General Journal"
{
    Caption = 'General Journal';

    //Unsupported feature: Property Modification (PromotedActionCategoriesML) on ""General Journal"(Page 39)".

    layout
    {
        modify(CurrentJnlBatchName)
        {

            //Unsupported feature: Property Modification (Level) on "CurrentJnlBatchName(Control 39)".

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
        modify("Incoming Document Entry No.")
        {
            ApplicationArea = Basic;
        }
        modify("External Document No.")
        {
            ApplicationArea = Basic;
        }
        modify("Applies-to Ext. Doc. No.")
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
        modify("Payer Information")
        {
            ApplicationArea = Basic;
        }
        modify("Transaction Information")
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

            //Unsupported feature: Property Modification (Visible) on ""Currency Code"(Control 67)".

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
        modify(Quantity)
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
        // modify("Bal. Account Type")
        // {
        //     ApplicationArea = Basic;
        // }
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
        // modify("Deferral Code")
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Bal. VAT Bus. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Bal. VAT Prod. Posting Group")
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
        modify("Applied Automatically")
        {
            ApplicationArea = Basic;
        }
        modify(Applied)
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
        // modify(Control7)
        // {
        //     ApplicationArea = Basic;
        // }
        // modify("Direct Debit Mandate ID")
        // {
        //     ApplicationArea = Basic;
        // }
        // modify(ShortcutDimCode7)
        // {

        //     //Unsupported feature: Property Modification (Name) on "ShortcutDimCode7(Control 63)".

        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (SourceExpr) on "ShortcutDimCode7(Control 63)".


        //     //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode7(Control 63)".

        // }
        // modify(ShortcutDimCode8)
        // {

        //     //Unsupported feature: Property Modification (Name) on "ShortcutDimCode8(Control 61)".

        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (SourceExpr) on "ShortcutDimCode8(Control 61)".


        //     //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode8(Control 61)".

        // }

        //Unsupported feature: Property Insertion (GroupType) on ""Account Name"(Control 1900545301)".

        modify(AccName)
        {
            ApplicationArea = Basic;
        }
        modify(BalAccName)
        {
            ApplicationArea = Basic;
        }

        //Unsupported feature: Property Insertion (GroupType) on "Control1902759701(Control 1902759701)".

        modify(Balance)
        {
            ApplicationArea = Basic;
        }
        modify(TotalBalance)
        {
            ApplicationArea = Basic;
        }
        modify(Control120)
        {
            Visible = false;
        }

        //Unsupported feature: Code Modification on "CurrentJnlBatchName(Control 39).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SAVERECORD;
        GenJnlManagement.LookupName(CurrentJnlBatchName,Rec);
        SetControlAppearanceFromBatch;
        // Set simple view when batch is changed
        SetDataForSimpleModeOnBatchChange;
        CurrPage.UPDATE(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SAVERECORD;
        GenJnlManagement.LookupName(CurrentJnlBatchName,Rec);
        CurrPage.UPDATE(FALSE);
        */
        //end;


        //Unsupported feature: Code Modification on "CurrentJnlBatchName(Control 39).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlManagement.CheckName(CurrentJnlBatchName,Rec);
        CurrentJnlBatchNameOnAfterVali;
        SetDataForSimpleModeOnBatchChange;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJnlManagement.CheckName(CurrentJnlBatchName,Rec);
        CurrentJnlBatchNameOnAfterVali;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "CurrentJnlBatchName(Control 39)".

        modify("<Document No. Simple Page>")
        {
            Visible = false;
        }
        modify("<CurrentPostingDate>")
        {
            Visible = false;
        }
        modify("<CurrentCurrencyCode>")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Deletion (Visible) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Date"(Control 83)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Type"(Control 4)".


        //Unsupported feature: Property Deletion (Visible) on ""Document Type"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 6)".


        //Unsupported feature: Property Deletion (Visible) on ""Document No."(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Incoming Document Entry No."(Control 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""External Document No."(Control 81)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to Ext. Doc. No."(Control 32)".



        //Unsupported feature: Code Modification on ""Account Type"(Control 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        SetUserInteractions;
        EnableApplyEntriesAction;
        CurrPage.SAVERECORD;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        SetUserInteractions;
        CurrPage.UPDATE;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Account Type"(Control 8)".


        //Unsupported feature: Property Deletion (Visible) on ""Account Type"(Control 8)".



        //Unsupported feature: Code Modification on ""Account No."(Control 10).OnValidate".

        //trigger "(Control 10)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        ShowShortcutDimCode(ShortcutDimCode);
        SetUserInteractions;
        // On TAB81 Account No. - OnValidate() will reset currency code to empty if
        // there is no balancing account for this G/L line. This happens under GetGLAccount
        // function. So, we need to validate current curency code again.
        IF IsSimplePage THEN
          VALIDATE("Currency Code",CurrentCurrencyCode);
        CurrPage.SAVERECORD;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
        CurrPage.UPDATE;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Account No."(Control 10)".

        modify(AccountName)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payer Information"(Control 17)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Transaction Information"(Control 15)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Business Unit Code"(Control 71)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Salespers./Purch. Code"(Control 65)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Campaign No."(Control 93)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 67)".

        // modify("EU 3-Party Trade")
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Posting Type"(Control 14)".


        //Unsupported feature: Property Deletion (Visible) on ""Gen. Posting Type"(Control 14)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Bus. Posting Group"(Control 77)".


        //Unsupported feature: Property Deletion (Visible) on ""Gen. Bus. Posting Group"(Control 77)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Prod. Posting Group"(Control 16)".


        //Unsupported feature: Property Deletion (Visible) on ""Gen. Prod. Posting Group"(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Bus. Posting Group"(Control 41)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Prod. Posting Group"(Control 85)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Quantity(Control 40)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Amount(Control 18)".


        //Unsupported feature: Property Deletion (Visible) on "Amount(Control 18)".

        modify("Amount (LCY)")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Debit Amount"(Control 1000)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Credit Amount"(Control 1001)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Amount"(Control 101)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Difference"(Control 99)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Amount"(Control 103)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Difference"(Control 105)".

        modify("Bal. Account Type")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account Type"(Control 53)".


        //Unsupported feature: Property Deletion (Visible) on ""Bal. Account Type"(Control 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account No."(Control 55)".


        //Unsupported feature: Property Deletion (Visible) on ""Bal. Account No."(Control 55)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Posting Type"(Control 57)".


        //Unsupported feature: Property Deletion (Visible) on ""Bal. Gen. Posting Type"(Control 57)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Bus. Posting Group"(Control 79)".


        //Unsupported feature: Property Deletion (Visible) on ""Bal. Gen. Bus. Posting Group"(Control 79)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Prod. Posting Group"(Control 59)".


        //Unsupported feature: Property Deletion (Visible) on ""Bal. Gen. Prod. Posting Group"(Control 59)".

        modify("Deferral Code")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Deferral Code"(Control 80)".


        //Unsupported feature: Property Deletion (Visible) on ""Deferral Code"(Control 80)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Bus. Posting Group"(Control 87)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Prod. Posting Group"(Control 89)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bill-to/Pay-to No."(Control 95)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ship-to/Order Address Code"(Control 97)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Terms Code"(Control 69)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applied Automatically"(Control 36)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Applied(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to Doc. Type"(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to Doc. No."(Control 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to ID"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""On Hold"(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bank Payment Type"(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reason Code"(Control 73)".

        modify(Correction)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Control7(Control 7)".


        //Unsupported feature: Property Deletion (Visible) on "Control7(Control 7)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Direct Debit Mandate ID"(Control 38)".

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

        //Unsupported feature: Property Deletion (CaptionClass) on "ShortcutDimCode7(Control 63)".


        //Unsupported feature: Property Deletion (TableRelation) on "ShortcutDimCode7(Control 63)".

        modify(ShortcutDimCode8)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionClass) on "ShortcutDimCode8(Control 61)".


        //Unsupported feature: Property Deletion (TableRelation) on "ShortcutDimCode8(Control 61)".


        //Unsupported feature: Property Deletion (ToolTipML) on "AccName(Control 35)".


        //Unsupported feature: Property Deletion (ShowCaption) on "AccName(Control 35)".


        //Unsupported feature: Property Deletion (Visible) on ""Bal. Account Name"(Control 1900295701)".


        //Unsupported feature: Property Deletion (GroupType) on ""Bal. Account Name"(Control 1900295701)".


        //Unsupported feature: Property Deletion (ToolTipML) on "BalAccName(Control 37)".

        modify("Total Debit")
        {
            Visible = false;
        }
        modify(DisplayTotalDebit)
        {
            Visible = false;
        }
        modify("Total Credit")
        {
            Visible = false;
        }
        modify(DisplayTotalCredit)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Balance(Control 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TotalBalance(Control 33)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900919607(Control 1900919607)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "IncomingDocAttachFactBox(Control 154)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "WorkflowStatusBatch(Control 94)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "WorkflowStatusLine(Control 90)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

        addafter("Payer Information")
        {
            // field("Transaction Type"; "Transaction Type")
            // {
            //     ApplicationArea = Basic;
            // }
            // field("Loan No"; "Loan No")
            // {
            //     ApplicationArea = Basic;
            // }
        }
        addafter(ShortcutDimCode7)
        {
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
        addafter("Applies-to ID")
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Ship-to/Order Address Code"; ShortcutDimCode8)
        moveafter("Shortcut Dimension 1 Code"; ShortcutDimCode7)
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
        modify(Approvals)
        {
            ApplicationArea = Basic;
        }
        modify("Renumber Document Numbers")
        {
            ApplicationArea = Basic;
        }
        modify("Insert Conv. LCY Rndg. Lines")
        {
            ApplicationArea = Basic;
        }
        modify(GetStandardJournals)
        {
            ApplicationArea = Basic;
        }
        modify(SaveAsStandardJournal)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (Promoted) on "SaveAsStandardJournal(Action 108)".


            //Unsupported feature: Property Insertion (PromotedCategory) on "SaveAsStandardJournal(Action 108)".

        }
        modify("Test Report")
        {
            ApplicationArea = Basic;
        }
        modify(Post)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Post(Action 50)".

        }
        modify(Preview)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Promoted) on "Preview(Action 48)".

        }
        modify(PostAndPrint)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "PostAndPrint(Action 51)".

        }
        modify(DeferralSchedule)
        {
            ApplicationArea = Basic;
        }
        modify(IncomingDocCard)
        {
            ToolTip = '';
            ApplicationArea = Basic;
        }
        modify(SelectIncomingDoc)
        {
            ToolTip = '';
            ApplicationArea = Basic;
        }
        modify(IncomingDocAttachFile)
        {
            ToolTip = '';
            ApplicationArea = Basic;
        }
        modify(RemoveIncomingDoc)
        {
            ToolTip = '';
            ApplicationArea = Basic;
        }
        modify(ImportBankStatement)
        {
            ApplicationArea = Basic;
        }
        modify(ShowStatementLineDetails)
        {
            ApplicationArea = Basic;
        }
        modify(Reconcile)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Reconcile(Action 23)".

        }
        modify("Apply Entries")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Apply Entries"(Action 91)".

        }
        modify(Match)
        {
            ApplicationArea = Basic;
        }
        modify(AddMappingRule)
        {
            ApplicationArea = Basic;
        }
        modify(ImportPayrollFile)
        {

            //Unsupported feature: Property Modification (Name) on "ImportPayrollFile(Action 29)".

            Caption = 'Import Payroll Transactions';
            ApplicationArea = Basic;
        }
        modify(SendApprovalRequestJournalBatch)
        {
            ApplicationArea = Basic;
            // Enabled = not OpenApprovalEntriesOnBatchOrAnyJnlLineExist;
        }
        modify(SendApprovalRequestJournalLine)
        {
            ApplicationArea = Basic;
            //Enabled = not OpenApprovalEntriesOnBatchOrCurrJnlLineExist;
        }
        modify(CancelApprovalRequestJournalBatch)
        {
            ApplicationArea = Basic;
            //Enabled = OpenApprovalEntriesOnJnlBatchExist;

            //Unsupported feature: Property Modification (Image) on "CancelApprovalRequestJournalBatch(Action 60)".

        }
        modify(CancelApprovalRequestJournalLine)
        {
            ApplicationArea = Basic;
            // Enabled = OpenApprovalEntriesOnJnlLineExist;

            //Unsupported feature: Property Modification (Image) on "CancelApprovalRequestJournalLine(Action 88)".

        }
        modify(Approve)
        {
            ApplicationArea = Basic;
        }
        modify(Reject)
        {
            ApplicationArea = Basic;
        }
        modify(Delegate)
        {
            ApplicationArea = Basic;
        }
        // modify(Comment)
        // {
        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Insertion (RunObject) on "Comment(Action 68)".


        //     //Unsupported feature: Property Insertion (RunPageLink) on "Comment(Action 68)".

        // }
        modify("Prepare journal")
        {

            //Unsupported feature: Property Modification (Level) on ""Prepare journal"(Action 100)".


            //Unsupported feature: Property Modification (ActionType) on ""Prepare journal"(Action 100)".


            //Unsupported feature: Property Modification (Name) on ""Prepare journal"(Action 100)".

            Caption = 'Approvals';

            //Unsupported feature: Property Modification (Image) on ""Prepare journal"(Action 100)".


            //Unsupported feature: Property Insertion (Promoted) on ""Prepare journal"(Action 100)".


            //Unsupported feature: Property Insertion (PromotedCategory) on ""Prepare journal"(Action 100)".

            //ApplicationArea = Basic;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 76)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Card(Action 44)".


        //Unsupported feature: Property Deletion (Promoted) on "Card(Action 44)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Card(Action 44)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ledger E&ntries"(Action 45)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Approvals(Action 66)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Approvals(Action 66)".


        //Unsupported feature: Property Deletion (Promoted) on "Approvals(Action 66)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Approvals(Action 66)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Renumber Document Numbers"(Action 13)".


        //Unsupported feature: Property Deletion (Visible) on ""Renumber Document Numbers"(Action 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Insert Conv. LCY Rndg. Lines"(Action 92)".



        //Unsupported feature: Code Modification on "GetStandardJournals(Action 109).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        StdGenJnl.FILTERGROUP := 2;
        StdGenJnl.SETRANGE("Journal Template Name","Journal Template Name");
        StdGenJnl.FILTERGROUP := 0;

        IF PAGE.RUNMODAL(PAGE::"Standard General Journals",StdGenJnl) = ACTION::LookupOK THEN BEGIN
          IF IsSimplePage THEN
            // If this page is opend in simple mode then use the current doc no. for every G/L lines that are created
            // from standard journal.
            StdGenJnl.CreateGenJnlFromStdJnlWithDocNo(StdGenJnl,CurrentJnlBatchName,CurrentDocNo)
          ELSE
            StdGenJnl.CreateGenJnlFromStdJnl(StdGenJnl,CurrentJnlBatchName);
          MESSAGE(Text000,StdGenJnl.Code);
        END;

        CurrPage.UPDATE(TRUE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..5
          StdGenJnl.CreateGenJnlFromStdJnl(StdGenJnl,CurrentJnlBatchName);
        #12..15
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "GetStandardJournals(Action 109)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SaveAsStandardJournal(Action 108)".



        //Unsupported feature: Code Modification on ""Test Report"(Action 49).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ReportPrint.PrintGenJnlLine(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CheckUserBatchAttached();
        ReportPrint.PrintGenJnlLine(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Test Report"(Action 49)".



        //Unsupported feature: Code Modification on "Post(Action 50).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",Rec);
        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
        IF IsSimplePage THEN
          SetDataForSimpleModeOnPost;
        CurrPage.UPDATE(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        UserSetup.GET(USERID);
        //Check batch status is approved
        GenJnlBatch.RESET;
        GenJnlBatch.SETRANGE(GenJnlBatch.Name,CurrentJnlBatchName);
        GenJnlBatch.SETRANGE(GenJnlBatch."Journal Template Name","Journal Template Name");
        IF GenJnlBatch.FIND('-') THEN BEGIN

        //  IF GenJnlBatch.Status<>GenJnlBatch.Status::Approved THEN
        //     ERROR('The Batch %1 you are trying to post is yet to be approved',CurrentJnlBatchName);
        END;



        CheckUserBatchAttached();
        IF UserSetup."Allow Overdrawal"=FALSE THEN BEGIN
        //Prevent Overdrawing Accounts
        Gnjline.RESET;
        Gnjline.SETRANGE(Gnjline."Journal Template Name","Journal Template Name");
        Gnjline.SETRANGE(Gnjline."Journal Batch Name",CurrentJnlBatchName);
        Gnjline.SETRANGE("Account Type",Gnjline."Account Type"::Savings);
        IF Gnjline.FIND('-') THEN BEGIN
           REPEAT

               IF Gnjline."Debit Amount" > 0 THEN BEGIN
                  Account.RESET;
                  Account.SETRANGE(Account."No.",Gnjline."Account No.");
                  IF Account.FIND('-') THEN BEGIN
                      Account.CALCFIELDS(Account."Balance (LCY)");
                      IF Gnjline."Debit Amount" > (Account."Balance (LCY)") THEN
                        ERROR('The following transaction will result in Over-withdrawal \Line No. '+FORMAT(Gnjline."Line No."));
                  END;

               END;

          UNTIL Gnjline.NEXT=0;
        END;
        END;
        //Prevent Overdrawing Accounts


        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",Rec);
        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
        CurrPage.UPDATE(FALSE);

        GenJnlBatch.Status:=GenJnlBatch.Status::Open;
        GenJnlBatch.MODIFY;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Post(Action 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Preview(Action 48)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Preview(Action 48)".



        //Unsupported feature: Code Modification on "PostAndPrint(Action 51).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post+Print",Rec);
        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
        IF IsSimplePage THEN
          SetDataForSimpleModeOnPost;
        CurrPage.UPDATE(FALSE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CheckUserBatchAttached();
        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post+Print",Rec);
        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
        CurrPage.UPDATE(FALSE);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "PostAndPrint(Action 51)".



        //Unsupported feature: Code Modification on "DeferralSchedule(Action 58).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShowDeferralSchedule;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF "Account Type" = "Account Type"::"Fixed Asset" THEN
          ERROR(AccTypeNotSupportedErr);

        ShowDeferrals("Posting Date","Currency Code");
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "DeferralSchedule(Action 58)".



        //Unsupported feature: Code Modification on "SelectIncomingDoc(Action 52).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        VALIDATE("Incoming Document Entry No.",IncomingDocument.SelectIncomingDocument("Incoming Document Entry No.",RECORDID));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        VALIDATE("Incoming Document Entry No.",IncomingDocument.SelectIncomingDocument("Incoming Document Entry No."));
        */
        //end;


        //Unsupported feature: Code Modification on "RemoveIncomingDoc(Action 42).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF IncomingDocument.GET("Incoming Document Entry No.") THEN
          IncomingDocument.RemoveLinkToRelatedRecord;
        "Incoming Document Entry No." := 0;
        MODIFY(TRUE);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        "Incoming Document Entry No." := 0;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "ImportBankStatement(Action 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ShowStatementLineDetails(Action 21)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Reconcile(Action 23)".


        //Unsupported feature: Property Deletion (PromotedIsBig) on "Reconcile(Action 23)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Apply Entries"(Action 91)".


        //Unsupported feature: Property Deletion (Enabled) on ""Apply Entries"(Action 91)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Match(Action 27)".


        //Unsupported feature: Property Deletion (ToolTipML) on "AddMappingRule(Action 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ImportPayrollFile(Action 29)".

        modify(ImportPayrollTransactions)
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on "SendApprovalRequestJournalBatch(Action 62).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalsMgmt.TrySendJournalBatchApprovalRequest(Rec);
        SetControlAppearanceFromBatch;
        SetControlAppearance;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Shortcut Dimension 1 Code");
        TESTFIELD("Shortcut Dimension 2 Code");
        CheckUserBatchAttached();
        //Prevent Overdrawing Accounts
        UserSetup.GET(USERID);
        IF UserSetup."Allow Overdrawal"=FALSE THEN BEGIN
        Gnjline.RESET;
        Gnjline.SETRANGE(Gnjline."Journal Template Name","Journal Template Name");
        Gnjline.SETRANGE(Gnjline."Journal Batch Name",CurrentJnlBatchName);
        Gnjline.SETRANGE("Account Type",Gnjline."Account Type"::Savings);
        IF Gnjline.FIND('-') THEN BEGIN
           REPEAT

               IF Gnjline."Debit Amount" > 0 THEN BEGIN
                  Account.RESET;
                  Account.SETRANGE(Account."No.",Gnjline."Account No.");
                  IF Account.FIND('-') THEN BEGIN
                      Account.CALCFIELDS(Account."Balance (LCY)");
                      IF Gnjline."Debit Amount" > (Account."Balance (LCY)") THEN
                        ERROR('The following transaction will result in Over-withdrawal \Line No. '+FORMAT(Gnjline."Line No."));
                  END;
               END;
          UNTIL Gnjline.NEXT=0;
        END;

        //Prevent Overdrawing Accounts

        //Prevent Overdrawing Accounts
        Gnjline.RESET;
        Gnjline.SETRANGE(Gnjline."Journal Template Name","Journal Template Name");
        Gnjline.SETRANGE(Gnjline."Journal Batch Name",CurrentJnlBatchName);
        IF Gnjline.FIND('-') THEN BEGIN
           REPEAT

               IF Gnjline."Credit Amount"> 0 THEN BEGIN
                  Loans.RESET;
                  Loans.SETRANGE("Loan No.",Gnjline."Loan No");
                  IF Loans.FIND('-') THEN BEGIN
                      Loans.CALCFIELDS("Outstanding Interest");//hk
                      Loans.CALCFIELDS("Outstanding Balance");
                      Loans.CALCFIELDS("Outstanding Bills");
                      IF (Gnjline."Credit Amount">(Loans."Outstanding Interest") )AND (Gnjline."Credit Amount" > (Loans."Outstanding Balance")) AND (Gnjline."Credit Amount" > (Loans."Outstanding Bills")) THEN
                        ERROR('The following transaction will result in Over payment of loan in \Line No. '+FORMAT(Gnjline."Line No."));
                  END;
               END;
          UNTIL Gnjline.NEXT=0;
        END;
        END;


        //Prevent Overdrawing Accounts

        ApprovalsMgmt.TrySendJournalBatchApprovalRequest(Rec);

        GenJournalBatch.GET("Journal Template Name","Journal Batch Name");
        GenJournalBatch.Status:=GenJournalBatch.Status::"Pending Approval";
        GenJournalBatch.MODIFY;
        SetControlAppearance;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "SendApprovalRequestJournalBatch(Action 62)".



        //Unsupported feature: Code Modification on "SendApprovalRequestJournalLine(Action 84).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetCurrentlySelectedLines(GenJournalLine);
        ApprovalsMgmt.TrySendJournalLineApprovalRequests(GenJournalLine);
        SetControlAppearanceFromBatch;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CheckUserBatchAttached();
        //Prevent Overdrawing Accounts
        UserSetup.GET(USERID);
        IF UserSetup."Allow Overdrawal"=FALSE THEN BEGIN
        Gnjline.RESET;
        Gnjline.SETRANGE(Gnjline."Journal Template Name","Journal Template Name");
        Gnjline.SETRANGE(Gnjline."Journal Batch Name",CurrentJnlBatchName);
        IF Gnjline.FIND('-') THEN BEGIN
           REPEAT

               IF Gnjline."Debit Amount" > 0 THEN BEGIN
                  Account.RESET;
                  Account.SETRANGE(Account."No.",Gnjline."Account No.");
                  IF Account.FIND('-') THEN BEGIN
                      Account.CALCFIELDS(Account."Balance (LCY)");
                      IF Gnjline."Debit Amount" > (Account."Balance (LCY)") THEN
                        ERROR('The following transaction will result in Over-withdrawal \Line No. '+FORMAT(Gnjline."Line No."));
                  END;
               END;
          UNTIL Gnjline.NEXT=0;
        END;
        END;
        //Prevent Overdrawing Accounts


        GetCurrentlySelectedLines(GenJournalLine);
        ApprovalsMgmt.TrySendJournalLineApprovalRequests(GenJournalLine);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "SendApprovalRequestJournalLine(Action 84)".



        //Unsupported feature: Code Modification on "CancelApprovalRequestJournalBatch(Action 60).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalsMgmt.TryCancelJournalBatchApprovalRequest(Rec);
        SetControlAppearance;
        SetControlAppearanceFromBatch;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ApprovalsMgmt.TryCancelJournalBatchApprovalRequest(Rec);
        SetControlAppearance;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "CancelApprovalRequestJournalBatch(Action 60)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CancelApprovalRequestJournalLine(Action 88)".

        modify(CreateFlow)
        {
            Visible = false;
        }
        modify(SeeFlows)
        {
            Visible = false;
        }


        //Unsupported feature: Code Insertion (VariableCollection) on "Approve(Action 74).OnAction".

        //trigger (Variable: GenJournalBatch)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Approve(Action 74).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalsMgmt.ApproveGenJournalLineRequest(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJournalBatch.GET("Journal Template Name","Journal Batch Name");
        IF NOT ApprovalsMgmt.ApproveRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
          ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Approve(Action 74)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Approve(Action 74)".



        //Unsupported feature: Code Insertion (VariableCollection) on "Reject(Action 72).OnAction".

        //trigger (Variable: GenJournalBatch)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Reject(Action 72).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalsMgmt.RejectGenJournalLineRequest(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJournalBatch.GET("Journal Template Name","Journal Batch Name");
        IF NOT ApprovalsMgmt.RejectRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
          ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Reject(Action 72)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Reject(Action 72)".



        //Unsupported feature: Code Insertion (VariableCollection) on "Delegate(Action 70).OnAction".

        //trigger (Variable: GenJournalBatch)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Delegate(Action 70).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalsMgmt.DelegateGenJournalLineRequest(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJournalBatch.GET("Journal Template Name","Journal Batch Name");
        IF NOT ApprovalsMgmt.DelegateRecordApprovalRequest(GenJournalBatch.RECORDID) THEN
          ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "Delegate(Action 70)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Delegate(Action 70)".

        // modify(Comment)
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on "Comment(Action 68)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Comment(Action 68)".

        modify("Opening Balance")
        {
            Visible = false;
        }


        //Unsupported feature: Code Insertion on "Action100(Action 100)".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //begin
        /*
        GenJournalBatch.GET("Journal Template Name","Journal Batch Name");
        approvalsMgmt.OpenApprovalEntriesPage(GenJournalBatch.RECORDID);
        */
        //end;
        modify("G/L Accounts Opening balance ")
        {
            Visible = false;
        }
        modify("Customers Opening balance")
        {
            Visible = false;
        }
        modify("Vendors Opening balance")
        {
            Visible = false;
        }
        modify("Page")
        {
            Visible = false;
        }
        modify(EditInExcel)
        {
            Visible = false;
        }
        modify(PreviousDocNumberTrx)
        {
            Visible = false;
        }
        modify(NextDocNumberTrx)
        {
            Visible = false;
        }
        modify(ClassicView)
        {
            Visible = false;
        }
        modify(SimpleView)
        {
            Visible = false;
        }
        modify("New Doc No.")
        {
            Visible = false;
        }
        moveafter(CancelApprovalRequestJournalLine; "Prepare journal")
    }

    var
    // GenJournalBatch: Record "Gen. Journal Batch";

    var
    // GenJournalBatch: Record "Gen. Journal Batch";

    var
    // GenJournalBatch: Record "Gen. Journal Batch";


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

    var
        AccTypeNotSupportedErr: label 'You cannot specify a deferral code for this type of account.';

    var
        Gnjline: Record "Gen. Journal Line";
        Account: Record 52185730;
        GenJournalBatch: Record "Gen. Journal Batch";
        NotJournalUserErr: label 'User %1 is not attached to this batch, and hence can not modify the batch';
        approvalsMgmt: Codeunit "Approvals Mgmt.";
        Text002: label 'Standard General Journal %1 has been successfully created.';
        GenJnlBatch: Record "Gen. Journal Batch";
        CreditAccounts: Record 52185731;
        Loans: Record 52185729;
        UserSetup: Record "User Setup";


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
    IF ClientTypeManagement.GetCurrentClientType <> CLIENTTYPE::ODataV4 THEN
      UpdateBalance;
    EnableApplyEntriesAction;
    SetControlAppearance;
    // PostedFromSimplePage is set to TRUE when 'POST' / 'POST+PRINT' action is executed in simple page mode.
    // It gets set to FALSE when OnNewRecord is called in the simple mode.
    // After posting we try to find the first record and filter on its document number
    // Executing LoaddataFromRecord for incomingDocAttachFactbox is also forcing this (PAG39) page to update
    // and for some reason after posting this page doesn't refresh with the filter set by POST / POST-PRINT action in simple mode.
    // To resolve this only call LoaddataFromRecord if PostedFromSimplePage is FALSE.
    IF NOT PostedFromSimplePage THEN
      CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
    UpdateBalance;
    SetControlAppearance;
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    */
    //end;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
    ShowShortcutDimCode(ShortcutDimCode);
    HasIncomingDocument := "Incoming Document Entry No." <> 0;
    CurrPage.IncomingDocAttachFactBox.PAGE.SetCurrentRecordID(RECORDID);
    SetUserInteractions;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    HasIncomingDocument := "Incoming Document Entry No." <> 0;
    SetUserInteractions;
    */
    //end;


    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TotalBalanceVisible := TRUE;
    BalanceVisible := TRUE;
    AmountVisible := TRUE;
    // Get simple / classic mode for this page except when called from a webservices (SOAP or ODATA)
    IF ClientTypeManagement.GetCurrentClientType IN [CLIENTTYPE::SOAP,CLIENTTYPE::OData,CLIENTTYPE::ODataV4]
    THEN
      IsSimplePage := FALSE
    ELSE
      IsSimplePage := GenJnlManagement.GetJournalSimplePageModePreference(PAGE::"General Journal");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TotalBalanceVisible := TRUE;
    BalanceVisible := TRUE;
    */
    //end;


    //Unsupported feature: Code Modification on "OnModifyRecord".

    //trigger OnModifyRecord(): Boolean
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetUserInteractions;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetUserInteractions;
    CheckUserBatchAttached();
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
    // set values from header for currency code, doc no. and posting date
    // for show less columns or simple page mode
    IF IsSimplePage THEN BEGIN
      PostedFromSimplePage := FALSE;
      SetDataForSimpleModeOnNewRecord;
    END;
    CLEAR(ShortcutDimCode);
    CLEAR(AccName);
    SetUserInteractions;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    UpdateBalance;
    SetUpNewLine(xRec,Balance,BelowxRec);
    #10..12
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsSaasExcelAddinEnabled := ServerConfigSettingHandler.GetIsSaasExcelAddinEnabled;
    IF ClientTypeManagement.GetCurrentClientType = CLIENTTYPE::ODataV4 THEN
      EXIT;

    BalAccName := '';
    SetControlVisibility;
    SetDimensionVisibility;
    IF IsOpenedFromBatch THEN BEGIN
      CurrentJnlBatchName := "Journal Batch Name";
      GenJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
      SetControlAppearanceFromBatch;
      SetDataForSimpleModeOnOpen;
      EXIT;
    END;
    GenJnlManagement.TemplateSelection(PAGE::"General Journal",0,FALSE,Rec,JnlSelected);
    IF NOT JnlSelected THEN
      ERROR('');

    LastGenJnlBatch := GenJnlManagement.GetLastViewedJournalBatchName(PAGE::"General Journal");
    IF LastGenJnlBatch <> '' THEN
      CurrentJnlBatchName := LastGenJnlBatch;
    GenJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
    SetControlAppearanceFromBatch;

    IsSaaS := PermissionManager.SoftwareAsAService;
    SetDataForSimpleModeOnOpen;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    BalAccName := '';
    #8..10
      SetControlAppearance;
    #13..17
    GenJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
    SetControlAppearance;
    */
    //end;


    //Unsupported feature: Code Modification on "CurrentJnlBatchNameOnAfterVali(PROCEDURE 19002411)".

    //procedure CurrentJnlBatchNameOnAfterVali();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CurrPage.SAVERECORD;
    GenJnlManagement.SetName(CurrentJnlBatchName,Rec);
    SetControlAppearanceFromBatch;
    CurrPage.UPDATE(FALSE);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CurrPage.SAVERECORD;
    GenJnlManagement.SetName(CurrentJnlBatchName,Rec);
    CurrPage.UPDATE(FALSE);
    */
    //end;

    //Unsupported feature: Property Deletion (Attributes) on "SetUserInteractions(PROCEDURE 2)".


    //Unsupported feature: Variable Insertion (Variable: GenJournalBatch) (VariableCollection) on "SetControlAppearance(PROCEDURE 5)".



    //Unsupported feature: Code Modification on "SetControlAppearance(PROCEDURE 5)".

    //procedure SetControlAppearance();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OpenApprovalEntriesExistForCurrUser :=
      OpenApprovalEntriesExistForCurrUser OR
      ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);

    OpenApprovalEntriesOnJnlLineExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    OpenApprovalEntriesOnBatchOrCurrJnlLineExist := OpenApprovalEntriesOnJnlBatchExist OR OpenApprovalEntriesOnJnlLineExist;

    ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.PAGE.SetFilterOnWorkflowRecord(RECORDID);

    CanCancelApprovalForJnlLine := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);

    SetPayrollAppearance;

    WorkflowWebhookManagement.GetCanRequestAndCanCancel(RECORDID,CanRequestFlowApprovalForLine,CanCancelFlowApprovalForLine);
    CanRequestFlowApprovalForBatchAndCurrentLine := CanRequestFlowApprovalForBatch AND CanRequestFlowApprovalForLine;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IF GenJournalBatch.GET("Journal Template Name","Journal Batch Name") THEN;
    OpenApprovalEntriesExistForCurrUser :=
      ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(GenJournalBatch.RECORDID) OR
      ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);

    OpenApprovalEntriesOnJnlBatchExist := ApprovalsMgmt.HasOpenApprovalEntries(GenJournalBatch.RECORDID);
    #5..7
    OpenApprovalEntriesOnBatchOrAnyJnlLineExist :=
      OpenApprovalEntriesOnJnlBatchExist OR
      ApprovalsMgmt.HasAnyOpenJournalLineApprovalEntries("Journal Template Name","Journal Batch Name");

    ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    */
    //end;

    //Unsupported feature: Property Modification (Name) on "SetPayrollAppearance(PROCEDURE 7)".



    //Unsupported feature: Code Modification on "SetPayrollAppearance(PROCEDURE 7)".

    //procedure SetPayrollAppearance();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    PayrollManagement.OnRegisterPayrollService(TempPayrollServiceConnection);
    ImportPayrollTransactionsAvailable := NOT TempPayrollServiceConnection.ISEMPTY;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    GenJournalBatch.GET("Journal Template Name","Journal Batch Name");
    IF GenJournalBatch."User Id" <> USERID THEN ERROR(NotJournalUserErr,USERID);
    */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "SetControlAppearance(PROCEDURE 5).WorkflowWebhookManagement(Variable 1000)".


    //Unsupported feature: Deletion (VariableCollection) on "SetControlAppearance(PROCEDURE 5).CanRequestFlowApprovalForLine(Variable 1001)".


    //Unsupported feature: Deletion (VariableCollection) on "SetPayrollAppearance(PROCEDURE 7).TempPayrollServiceConnection(Variable 1000)".


    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).

}
