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

        

        modify(AccountName)
        {
            Visible = false;
        }

        

        modify("Amount (LCY)")
        {
            Visible = false;
        }

        

        modify("Bal. Account Type")
        {
            Visible = false;
        }

        

        modify("Deferral Code")
        {
            Visible = false;
        }

        

        modify(Correction)
        {
            Visible = false;
        }

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


        addafter("Payer Information")
        {
            
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

            trigger OnBeforeAction();
            var
                Publisher: Codeunit "Events Publisher";
            begin
                Publisher.OnPostEvent();
            end;
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
       
        modify("Prepare journal")
        {

           
            Caption = 'Approvals';

           
        }

       

        modify(ImportPayrollTransactions)
        {
            Visible = false;
        }


        modify(CreateFlow)
        {
            Visible = false;
        }
        modify(SeeFlows)
        {
            Visible = false;
        }


       

        modify("Opening Balance")
        {
            Visible = false;
        }


       
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

}
