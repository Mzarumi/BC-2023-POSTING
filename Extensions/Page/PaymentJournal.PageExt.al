#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 52185595 pageextension52185595 extends "Payment Journal"
{
    Caption = 'Payment Journal';

    //Unsupported feature: Property Modification (PromotedActionCategoriesML) on ""Payment Journal"(Page 256)".

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
        modify("Recipient Bank Account")
        {
            ApplicationArea = Basic;
            ShowMandatory = true;
        }
        modify("Message to Recipient")
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
        modify("Payment Method Code")
        {
            ApplicationArea = Basic;
        }
        modify("Payment Reference")
        {
            ApplicationArea = Basic;
        }
        modify("Creditor No.")
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
        modify("Bal. VAT Bus. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Bal. VAT Prod. Posting Group")
        {
            ApplicationArea = Basic;
        }
        modify("Applied (Yes/No)")
        {
            ApplicationArea = Basic;
        }
        modify("Applies-to Doc. Type")
        {
            ApplicationArea = Basic;
        }
        modify(AppliesToDocNo)
        {

            //Unsupported feature: Property Modification (Name) on "AppliesToDocNo(Control 20)".

            ApplicationArea = Basic;
        }
        modify("Applies-to ID")
        {
            ApplicationArea = Basic;
        }
        modify(GetAppliesToDocDueDate)
        {
            ApplicationArea = Basic;
        }
        modify("Bank Payment Type")
        {
            ApplicationArea = Basic;
        }
        modify("Check Printed")
        {
            ApplicationArea = Basic;
        }
        modify("Reason Code")
        {
            ApplicationArea = Basic;
        }
        // modify(Control3)
        // {
        //     ApplicationArea = Basic;
        // }
        modify("Exported to Payment File")
        {
            ApplicationArea = Basic;
        }
        modify(TotalExportedAmount)
        {
            ApplicationArea = Basic;
        }
        modify("Has Payment Export Error")
        {
            ApplicationArea = Basic;
        }
        // modify(ShortcutDimCode7)
        // {

        //     //Unsupported feature: Property Modification (Name) on "ShortcutDimCode7(Control 51)".

        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (SourceExpr) on "ShortcutDimCode7(Control 51)".


        //     //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode7(Control 51)".

        // }
        // modify(ShortcutDimCode8)
        // {

        //     //Unsupported feature: Property Modification (Name) on "ShortcutDimCode8(Control 49)".

        //     ApplicationArea = Basic;

        //     //Unsupported feature: Property Modification (SourceExpr) on "ShortcutDimCode8(Control 49)".


        //     //Unsupported feature: Property Modification (Visible) on "ShortcutDimCode8(Control 49)".

        // }
        modify(OverdueWarningText)
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

        //Unsupported feature: Code Modification on "CurrentJnlBatchName(Control 33).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SAVERECORD;
        GenJnlManagement.LookupName(CurrentJnlBatchName,Rec);
        SetControlAppearanceFromBatch;
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

        //Unsupported feature: Property Deletion (ToolTipML) on "CurrentJnlBatchName(Control 33)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 2)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Date"(Control 35)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document Type"(Control 4)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 6)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Incoming Document Entry No."(Control 9)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""External Document No."(Control 83)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to Ext. Doc. No."(Control 21)".



        //Unsupported feature: Code Modification on ""Account Type"(Control 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        EnableApplyEntriesAction;
        CurrPage.SAVERECORD;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Account Type"(Control 8)".



        //Unsupported feature: Code Modification on ""Account No."(Control 10).OnValidate".

        //trigger "(Control 10)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        ShowShortcutDimCode(ShortcutDimCode);
        CurrPage.SAVERECORD;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        ShowShortcutDimCode(ShortcutDimCode);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Account No."(Control 10)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Recipient Bank Account"(Control 13)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Message to Recipient"(Control 11)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 12)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Salespers./Purch. Code"(Control 53)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Campaign No."(Control 95)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 55)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Posting Type"(Control 77)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Bus. Posting Group"(Control 79)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Prod. Posting Group"(Control 81)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Bus. Posting Group"(Control 85)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Prod. Posting Group"(Control 87)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Method Code"(Control 100)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Reference"(Control 110)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Creditor No."(Control 115)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Amount(Control 14)".


        //Unsupported feature: Property Deletion (Visible) on "Amount(Control 14)".

        modify("Amount (LCY)")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Debit Amount"(Control 1000)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Credit Amount"(Control 1001)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Amount"(Control 97)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Difference"(Control 101)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Amount"(Control 99)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Difference"(Control 103)".

        modify("Bal. Account Type")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account Type"(Control 61)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account No."(Control 16)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Posting Type"(Control 71)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Bus. Posting Group"(Control 73)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Prod. Posting Group"(Control 75)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Bus. Posting Group"(Control 89)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Prod. Posting Group"(Control 91)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applied (Yes/No)"(Control 5)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to Doc. Type"(Control 18)".


        //Unsupported feature: Property Deletion (ToolTipML) on "AppliesToDocNo(Control 20)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to ID"(Control 22)".


        //Unsupported feature: Property Deletion (ToolTipML) on "GetAppliesToDocDueDate(Control 105)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Bank Payment Type"(Control 67)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Check Printed"(Control 59)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Reason Code"(Control 69)".

        // modify(Correction)
        // {
        //     Visible = false;
        // }

        //Unsupported feature: Property Deletion (ToolTipML) on "Control3(Control 3)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Exported to Payment File"(Control 290)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TotalExportedAmount(Control 28)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Has Payment Export Error"(Control 17)".

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

        //Unsupported feature: Property Deletion (CaptionClass) on "ShortcutDimCode7(Control 51)".


        //Unsupported feature: Property Deletion (TableRelation) on "ShortcutDimCode7(Control 51)".

        modify(ShortcutDimCode8)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (CaptionClass) on "ShortcutDimCode8(Control 49)".


        //Unsupported feature: Property Deletion (TableRelation) on "ShortcutDimCode8(Control 49)".


        //Unsupported feature: Property Deletion (ToolTipML) on "OverdueWarningText(Control 84)".


        //Unsupported feature: Property Deletion (ToolTipML) on "AccName(Control 29)".


        //Unsupported feature: Property Deletion (ShowCaption) on "AccName(Control 29)".


        //Unsupported feature: Property Deletion (ToolTipML) on "BalAccName(Control 31)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Balance(Control 25)".


        //Unsupported feature: Property Deletion (ToolTipML) on "TotalBalance(Control 27)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "IncomingDocAttachFactBox(Control 30)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control7(Control 7)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900919607(Control 1900919607)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "WorkflowStatusBatch(Control 88)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "WorkflowStatusLine(Control 44)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


        //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

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
        moveafter("Bal. VAT Prod. Posting Group"; ShortcutDimCode8)
        moveafter("Shortcut Dimension 1 Code"; ShortcutDimCode7)
    }
    actions
    {
        modify(Dimensions)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Dimensions(Action 58)".

        }
        modify(IncomingDoc)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "IncomingDoc(Action 92)".

        }
        modify(Card)
        {
            ApplicationArea = Basic;
        }
        modify("Ledger E&ntries")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Promoted) on ""Ledger E&ntries"(Action 39)".


            //Unsupported feature: Property Modification (PromotedCategory) on ""Ledger E&ntries"(Action 39)".

        }
        modify(SuggestVendorPayments)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "SuggestVendorPayments(Action 42)".

        }
        modify(PreviewCheck)
        {
            ApplicationArea = Basic;
        }
        modify(PrintCheck)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "PrintCheck(Action 64)".

        }
        modify(ExportPaymentsToFile)
        {

            //Unsupported feature: Property Modification (Level) on "ExportPaymentsToFile(Action 15)".

            Caption = 'Export Payments to File';
            ApplicationArea = Basic;
        }
        modify("Void Check")
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on ""Void Check"(Action 65)".

        }
        modify("Void &All Checks")
        {
            ApplicationArea = Basic;
        }
        modify(CreditTransferRegEntries)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (PromotedIsBig) on "CreditTransferRegEntries(Action 26)".

        }
        modify(CreditTransferRegisters)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Insertion (PromotedIsBig) on "CreditTransferRegisters(Action 23)".

        }
        modify(Approvals)
        {
            ApplicationArea = Basic;
        }
        modify("Renumber Document Numbers")
        {
            ApplicationArea = Basic;
        }
        modify(ApplyEntries)
        {
            ApplicationArea = Basic;
        }
        modify(CalculatePostingDate)
        {
            ApplicationArea = Basic;
        }
        modify("Insert Conv. LCY Rndg. Lines")
        {
            ApplicationArea = Basic;
        }
        modify(PositivePayExport)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (Visible) on "PositivePayExport(Action 34)".

        }
        modify(Reconcile)
        {
            ApplicationArea = Basic;

            //Unsupported feature: Property Modification (PromotedCategory) on "Reconcile(Action 48)".

        }
        modify(PreCheck)
        {
            ApplicationArea = Basic;
        }
        modify("Test Report")
        {
            ApplicationArea = Basic;
        }
        modify(Post)
        {
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

            //Unsupported feature: Property Modification (Image) on "CancelApprovalRequestJournalBatch(Action 50)".

        }
        modify(CancelApprovalRequestJournalLine)
        {
            ApplicationArea = Basic;
            // Enabled = OpenApprovalEntriesOnJnlLineExist;

            //Unsupported feature: Property Modification (Image) on "CancelApprovalRequestJournalLine(Action 96)".

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

        //     //Unsupported feature: Property Insertion (RunObject) on "Comment(Action 56)".


        //     //Unsupported feature: Property Insertion (RunPageLink) on "Comment(Action 56)".

        // }

        //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 58)".



        //Unsupported feature: Code Modification on "IncomingDoc(Action 92).OnAction".

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

        //Unsupported feature: Property Deletion (ToolTipML) on "IncomingDoc(Action 92)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Card(Action 38)".


        //Unsupported feature: Property Deletion (Promoted) on "Card(Action 38)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Card(Action 38)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Ledger E&ntries"(Action 39)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SuggestVendorPayments(Action 42)".

        modify(SuggestEmployeePayments)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "PreviewCheck(Action 63)".


        //Unsupported feature: Property Deletion (Promoted) on "PreviewCheck(Action 63)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "PreviewCheck(Action 63)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PrintCheck(Action 64)".

        modify("Electronic Payments")
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on "ExportPaymentsToFile(Action 15).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckIfPrivacyBlocked;

        Window.OPEN(GeneratingPaymentsMsg);
        GenJnlLine.COPYFILTERS(Rec);
        IF GenJnlLine.FINDFIRST THEN
          GenJnlLine.ExportPaymentFile;
        Window.CLOSE;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        GenJnlLine.COPYFILTERS(Rec);
        GenJnlLine.FINDFIRST;
        GenJnlLine.ExportPaymentFile;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "ExportPaymentsToFile(Action 15)".

        modify(VoidPayments)
        {
            Visible = false;
        }
        modify(TransmitPayments)
        {
            Visible = false;
        }


        //Unsupported feature: Code Modification on ""Void Check"(Action 65).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TESTFIELD("Bank Payment Type","Bank Payment Type"::"Computer Check");
        TESTFIELD("Check Printed",TRUE);
        IF ConfirmManagement.ConfirmProcess(STRSUBSTNO(Text000,"Document No."),TRUE) THEN
          CheckManagement.VoidCheck(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TESTFIELD("Bank Payment Type","Bank Payment Type"::"Computer Check");
        TESTFIELD("Check Printed",TRUE);
        IF CONFIRM(Text000,FALSE,"Document No.") THEN
          CheckManagement.VoidCheck(Rec);
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Void Check"(Action 65)".



        //Unsupported feature: Code Modification on ""Void &All Checks"(Action 66).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ConfirmManagement.ConfirmProcess(Text001,TRUE) THEN BEGIN
          GenJnlLine.RESET;
          GenJnlLine.COPY(Rec);
          GenJnlLine.SETRANGE("Bank Payment Type","Bank Payment Type"::"Computer Check");
        #5..8
              CheckManagement.VoidCheck(GenJnlLine2);
            UNTIL GenJnlLine.NEXT = 0;
        END;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IF CONFIRM(Text001,FALSE) THEN BEGIN
        #2..11
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on ""Void &All Checks"(Action 66)".


        //Unsupported feature: Property Deletion (Promoted) on ""Void &All Checks"(Action 66)".


        //Unsupported feature: Property Deletion (PromotedCategory) on ""Void &All Checks"(Action 66)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CreditTransferRegEntries(Action 26)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CreditTransferRegisters(Action 23)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Approvals(Action 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Approvals(Action 54)".


        //Unsupported feature: Property Deletion (Promoted) on "Approvals(Action 54)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Approvals(Action 54)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Renumber Document Numbers"(Action 19)".


        //Unsupported feature: Property Deletion (ToolTipML) on "ApplyEntries(Action 93)".


        //Unsupported feature: Property Deletion (Enabled) on "ApplyEntries(Action 93)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CalculatePostingDate(Action 68)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Insert Conv. LCY Rndg. Lines"(Action 94)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PositivePayExport(Action 34)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Reconcile(Action 48)".


        //Unsupported feature: Property Deletion (ToolTipML) on "PreCheck(Action 78)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Test Report"(Action 45)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Post(Action 46)".


        //Unsupported feature: Property Deletion (ToolTipML) on "Preview(Action 32)".


        //Unsupported feature: Property Deletion (Promoted) on "Preview(Action 32)".


        //Unsupported feature: Property Deletion (PromotedCategory) on "Preview(Action 32)".


        //Unsupported feature: Property Deletion (ToolTipML) on ""Post and &Print"(Action 47)".



        //Unsupported feature: Code Modification on "SendApprovalRequestJournalBatch(Action 76).OnAction".

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
        ApprovalsMgmt.TrySendJournalBatchApprovalRequest(Rec);
        SetControlAppearance;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "SendApprovalRequestJournalBatch(Action 76)".


        //Unsupported feature: Property Deletion (ToolTipML) on "SendApprovalRequestJournalLine(Action 74)".



        //Unsupported feature: Code Modification on "CancelApprovalRequestJournalBatch(Action 50).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ApprovalsMgmt.TryCancelJournalBatchApprovalRequest(Rec);
        SetControlAppearanceFromBatch;
        SetControlAppearance;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ApprovalsMgmt.TryCancelJournalBatchApprovalRequest(Rec);
        SetControlAppearance;
        */
        //end;

        //Unsupported feature: Property Deletion (ToolTipML) on "CancelApprovalRequestJournalBatch(Action 50)".


        //Unsupported feature: Property Deletion (ToolTipML) on "CancelApprovalRequestJournalLine(Action 96)".

        modify(CreateFlow)
        {
            Visible = false;
        }
        modify(SeeFlows)
        {
            Visible = false;
        }
        modify(Workflow)
        {
            Visible = false;
        }
        modify(CreateApprovalWorkflow)
        {
            Visible = false;
        }
        modify(ManageApprovalWorkflows)
        {
            Visible = false;
        }


        //Unsupported feature: Code Insertion (VariableCollection) on "Approve(Action 70).OnAction".

        //trigger (Variable: GenJournalBatch)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Approve(Action 70).OnAction".

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

        //Unsupported feature: Property Deletion (ToolTipML) on "Approve(Action 70)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Approve(Action 70)".



        //Unsupported feature: Code Insertion (VariableCollection) on "Reject(Action 62).OnAction".

        //trigger (Variable: GenJournalBatch)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Reject(Action 62).OnAction".

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

        //Unsupported feature: Property Deletion (ToolTipML) on "Reject(Action 62)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Reject(Action 62)".



        //Unsupported feature: Code Insertion (VariableCollection) on "Delegate(Action 60).OnAction".

        //trigger (Variable: GenJournalBatch)()
        //Parameters and return type have not been exported.
        //begin
        /*
        */
        //end;


        //Unsupported feature: Code Modification on "Delegate(Action 60).OnAction".

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

        //Unsupported feature: Property Deletion (ToolTipML) on "Delegate(Action 60)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Delegate(Action 60)".

        modify(Comment)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (ToolTipML) on "Comment(Action 56)".


        //Unsupported feature: Property Deletion (PromotedOnly) on "Comment(Action 56)".

        modify("Page")
        {
            Visible = false;
        }
        modify(EditInExcel)
        {
            Visible = false;
        }
        moveafter(PrintCheck; "Void Check")
    }

    // var
    //     GenJournalBatch: Record "Gen. Journal Batch";

    // var
    //     GenJournalBatch: Record "Gen. Journal Batch";

    var
        GenJournalBatch: Record "Gen. Journal Batch";


    //Unsupported feature: Property Modification (Length) on "AccName(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //AccName : 100;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AccName : 50;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Length) on "BalAccName(Variable 1013)".

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
    StyleTxt := GetOverdueDateInteractions(OverdueWarningText);
    GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
    UpdateBalance;
    EnableApplyEntriesAction;
    SetControlAppearance;
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);

    IF GenJournalBatch.GET("Journal Template Name","Journal Batch Name") THEN BEGIN
      ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.PAGE.SetFilterOnWorkflowRecord(GenJournalBatch.RECORDID);
      IsAllowPaymentExport := GenJournalBatch."Allow Payment Export";
    END;
    ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.PAGE.SetFilterOnWorkflowRecord(RECORDID);

    EventFilter := WorkflowEventHandling.RunWorkflowOnSendGeneralJournalLineForApprovalCode;
    EnabledApprovalWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::"Gen. Journal Line",EventFilter);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    */
    //end;


    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    StyleTxt := GetOverdueDateInteractions(OverdueWarningText);
    ShowShortcutDimCode(ShortcutDimCode);
    HasPmtFileErr := HasPaymentFileErrors;
    RecipientBankAccountMandatory := IsAllowPaymentExport AND
      (("Bal. Account Type" = "Bal. Account Type"::Vendor) OR ("Bal. Account Type" = "Bal. Account Type"::Customer));
    CurrPage.IncomingDocAttachFactBox.PAGE.SetCurrentRecordID(RECORDID);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    SetControlAppearance;
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
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TotalBalanceVisible := TRUE;
    BalanceVisible := TRUE;
    */
    //end;


    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    HasPmtFileErr := FALSE;
    UpdateBalance;
    EnableApplyEntriesAction;
    SetUpNewLine(xRec,Balance,BelowxRec);
    CLEAR(ShortcutDimCode);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    HasPmtFileErr := FALSE;
    UpdateBalance;
    SetUpNewLine(xRec,Balance,BelowxRec);
    CLEAR(ShortcutDimCode);
    */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsSaasExcelAddinEnabled := ServerConfigSettingHandler.GetIsSaasExcelAddinEnabled;
    IsSaaS := PermissionManager.SoftwareAsAService;
    IF ClientTypeManagement.GetCurrentClientType = CLIENTTYPE::ODataV4 THEN
      EXIT;

    BalAccName := '';
    SetControlVisibility;
    SetDimensionsVisibility;

    IF IsOpenedFromBatch THEN BEGIN
      CurrentJnlBatchName := "Journal Batch Name";
      GenJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
      SetControlAppearanceFromBatch;
      EXIT;
    END;
    GenJnlManagement.TemplateSelection(PAGE::"Payment Journal",4,FALSE,Rec,JnlSelected);
    IF NOT JnlSelected THEN
      ERROR('');
    GenJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
    SetControlAppearanceFromBatch;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    BalAccName := '';
    #9..12
      SetControlAppearance;
    #14..19
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

    //Unsupported feature: Property Modification (Name) on "SetControlAppearanceFromBatch(PROCEDURE 4)".



    //Unsupported feature: Code Modification on "SetControlAppearanceFromBatch(PROCEDURE 4)".

    //procedure SetControlAppearanceFromBatch();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IF ("Journal Template Name" <> '') AND ("Journal Batch Name" <> '') THEN
      GenJournalBatch.GET("Journal Template Name","Journal Batch Name")
    ELSE
      IF NOT GenJournalBatch.GET(GETRANGEMAX("Journal Template Name"),CurrentJnlBatchName) THEN
        EXIT;

    CheckOpenApprovalEntries(GenJournalBatch.RECORDID);

    CanCancelApprovalForJnlBatch := ApprovalsMgmt.CanCancelApprovalForRecord(GenJournalBatch.RECORDID);

    WorkflowWebhookManagement.GetCanRequestAndCanCancelJournalBatch(
      GenJournalBatch,CanRequestFlowApprovalForBatch,CanCancelFlowApprovalForBatch,CanRequestFlowApprovalForAllLines);
    CanRequestFlowApprovalForBatchAndAllLines := CanRequestFlowApprovalForBatch AND CanRequestFlowApprovalForAllLines;
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
    OpenApprovalEntriesOnJnlLineExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    OpenApprovalEntriesOnBatchOrCurrJnlLineExist := OpenApprovalEntriesOnJnlBatchExist OR OpenApprovalEntriesOnJnlLineExist;

    OpenApprovalEntriesOnBatchOrAnyJnlLineExist :=
      OpenApprovalEntriesOnJnlBatchExist OR
      ApprovalsMgmt.HasAnyOpenJournalLineApprovalEntries("Journal Template Name","Journal Batch Name");
    */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "SetControlAppearanceFromBatch(PROCEDURE 4).WorkflowWebhookManagement(Variable 1001)".


    //Unsupported feature: Deletion (VariableCollection) on "SetControlAppearanceFromBatch(PROCEDURE 4).CanRequestFlowApprovalForAllLines(Variable 1003)".


    //Unsupported feature: Property Deletion (ApplicationArea).


    //Unsupported feature: Property Deletion (UsageCategory).


    //Unsupported feature: Property Deletion (AdditionalSearchTermsML).

}
