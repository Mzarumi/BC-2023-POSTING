// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// PageExtension 52186470 pageextension52186470 extends "Fixed Asset G/L Journal" 
// {
//     Caption = 'Fixed Asset G/L Journal';
//     layout
//     {
//         modify(CurrentJnlBatchName)
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Posting Date")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Document Date")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Document Type")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Document No.")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("External Document No.")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Account Type")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Account No.")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Depreciation Book Code")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("FA Posting Type")
//         {
//             ApplicationArea = Basic;
//         }
//         modify(GetAddCurrCode)
//         {
//             ApplicationArea = Basic;
//         }
//         modify(Description)
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Business Unit Code")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Salespers./Purch. Code")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Campaign No.")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Currency Code")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Gen. Posting Type")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Gen. Bus. Posting Group")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Gen. Prod. Posting Group")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("VAT Bus. Posting Group")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("VAT Prod. Posting Group")
//         {
//             ApplicationArea = Basic;
//         }
//         modify(Amount)
//         {
//             ApplicationArea = Basic;
//         }
//         modify("VAT Amount")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("VAT Difference")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Bal. VAT Amount")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Bal. VAT Difference")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Bal. Account Type")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Bal. Account No.")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Bal. Gen. Posting Type")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Bal. Gen. Prod. Posting Group")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Bal. VAT Bus. Posting Group")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Bal. VAT Prod. Posting Group")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Bal. Gen. Bus. Posting Group")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Payment Terms Code")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Applies-to Doc. Type")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Applies-to Doc. No.")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Applies-to ID")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("On Hold")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Bank Payment Type")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Reason Code")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("FA Posting Date")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Salvage Value")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("No. of Depreciation Days")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Depr. until FA Posting Date")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Depr. Acquisition Cost")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Maintenance Code")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Insurance No.")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Budgeted FA No.")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Duplicate in Depreciation Book")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Use Duplication List")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("FA Reclassification Entry")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("FA Error Entry No.")
//         {
//             ApplicationArea = Basic;
//         }
//         modify(AccName)
//         {
//             ApplicationArea = Basic;
//         }
//         modify(BalAccountName)
//         {
//             ApplicationArea = Basic;
//         }
//         modify(Balance)
//         {
//             ApplicationArea = Basic;
//         }
//         modify(TotalBalance)
//         {
//             ApplicationArea = Basic;
//         }

//         //Unsupported feature: Property Deletion (ToolTipML) on "CurrentJnlBatchName(Control 39)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Posting Date"(Control 2)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Document Date"(Control 83)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Document Type"(Control 4)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Document No."(Control 6)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""External Document No."(Control 81)".


//         //Unsupported feature: Code Modification on ""Account Type"(Control 8).OnValidate".

//         //trigger OnValidate()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//             /*
//             GenJnlManagement.GetAccounts(Rec,AccName,BalAccountName);
//             EnableApplyEntriesAction;
//             */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//             /*
//             GenJnlManagement.GetAccounts(Rec,AccName,BalAccountName);
//             */
//         //end;

//         //Unsupported feature: Property Deletion (ToolTipML) on ""Account Type"(Control 8)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Account No."(Control 10)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Depreciation Book Code"(Control 87)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""FA Posting Type"(Control 85)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "GetAddCurrCode(Control 75)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 12)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Business Unit Code"(Control 71)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Salespers./Purch. Code"(Control 65)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Campaign No."(Control 46)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Currency Code"(Control 67)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Posting Type"(Control 14)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Bus. Posting Group"(Control 77)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Gen. Prod. Posting Group"(Control 16)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Bus. Posting Group"(Control 97)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Prod. Posting Group"(Control 115)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Amount(Control 18)".

//         modify("Debit Amount")
//         {
//             Visible = false;
//         }
//         modify("Credit Amount")
//         {
//             Visible = false;
//         }

//         //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Amount"(Control 126)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""VAT Difference"(Control 130)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Amount"(Control 128)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Difference"(Control 132)".

//         modify("Bal. Account Type")
//         {
//             Visible = false;
//         }

//         //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account Type"(Control 53)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Account No."(Control 55)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Posting Type"(Control 57)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Prod. Posting Group"(Control 59)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Bus. Posting Group"(Control 117)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. VAT Prod. Posting Group"(Control 119)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Bal. Gen. Bus. Posting Group"(Control 79)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Payment Terms Code"(Control 69)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to Doc. Type"(Control 24)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to Doc. No."(Control 26)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Applies-to ID"(Control 22)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""On Hold"(Control 28)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Bank Payment Type"(Control 20)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Reason Code"(Control 73)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""FA Posting Date"(Control 41)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Salvage Value"(Control 89)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""No. of Depreciation Days"(Control 91)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Depr. until FA Posting Date"(Control 93)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Depr. Acquisition Cost"(Control 95)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Maintenance Code"(Control 101)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Insurance No."(Control 103)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Budgeted FA No."(Control 105)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Duplicate in Depreciation Book"(Control 98)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Use Duplication List"(Control 109)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""FA Reclassification Entry"(Control 111)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""FA Error Entry No."(Control 113)".

//         modify("Shortcut Dimension 1 Code")
//         {
//             Visible = false;
//         }
//         modify("Shortcut Dimension 2 Code")
//         {
//             Visible = false;
//         }
//         modify(ShortcutDimCode3)
//         {
//             Visible = false;
//         }
//         modify(ShortcutDimCode4)
//         {
//             Visible = false;
//         }
//         modify(ShortcutDimCode5)
//         {
//             Visible = false;
//         }
//         modify(ShortcutDimCode6)
//         {
//             Visible = false;
//         }
//         modify(ShortcutDimCode7)
//         {
//             Visible = false;
//         }
//         modify(ShortcutDimCode8)
//         {
//             Visible = false;
//         }

//         //Unsupported feature: Property Deletion (ShowCaption) on "AccName(Control 35)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "BalAccountName(Control 37)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Balance(Control 31)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "TotalBalance(Control 33)".


//         //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


//         //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

//         addafter("FA Posting Date")
//         {
//             field("Shortcut Dimension 1 Code";Rec."Shortcut Dimension 1 Code")
//             {
//                 ApplicationArea = Basic;
//                 Visible = false;
//             }
//             field("Shortcut Dimension 2 Code";Rec."Shortcut Dimension 2 Code")
//             {
//                 ApplicationArea = Basic;
//                 Visible = false;
//             }
//             field("ShortcutDimCode[3]";ShortcutDimCode[3])
//             {
//                 ApplicationArea = Basic;
//                 CaptionClass = '1,2,3';
//                 TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3),
//                                                               "Dimension Value Type"=const(Standard),
//                                                               Blocked=const(false));
//                 Visible = false;

//                 trigger OnValidate()
//                 begin
//                     Rec.ValidateShortcutDimCode(3,ShortcutDimCode[3]);
//                 end;
//             }
//             field("ShortcutDimCode[4]";ShortcutDimCode[4])
//             {
//                 ApplicationArea = Basic;
//                 CaptionClass = '1,2,4';
//                 TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4),
//                                                               "Dimension Value Type"=const(Standard),
//                                                               Blocked=const(false));
//                 Visible = false;

//                 trigger OnValidate()
//                 begin
//                     Rec.ValidateShortcutDimCode(4,ShortcutDimCode[4]);
//                 end;
//             }
//             field("ShortcutDimCode[5]";ShortcutDimCode[5])
//             {
//                 ApplicationArea = Basic;
//                 CaptionClass = '1,2,5';
//                 TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5),
//                                                               "Dimension Value Type"=const(Standard),
//                                                               Blocked=const(false));
//                 Visible = false;

//                 trigger OnValidate()
//                 begin
//                     Rec.ValidateShortcutDimCode(5,ShortcutDimCode[5]);
//                 end;
//             }
//             field("ShortcutDimCode[6]";ShortcutDimCode[6])
//             {
//                 ApplicationArea = Basic;
//                 CaptionClass = '1,2,6';
//                 TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(6),
//                                                               "Dimension Value Type"=const(Standard),
//                                                               Blocked=const(false));
//                 Visible = false;

//                 trigger OnValidate()
//                 begin
//                     Rec.ValidateShortcutDimCode(6,ShortcutDimCode[6]);
//                 end;
//             }
//             field("ShortcutDimCode[7]";ShortcutDimCode[7])
//             {
//                 ApplicationArea = Basic;
//                 CaptionClass = '1,2,7';
//                 TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(7),
//                                                               "Dimension Value Type"=const(Standard),
//                                                               Blocked=const(false));
//                 Visible = false;

//                 trigger OnValidate()
//                 begin
//                     Rec.ValidateShortcutDimCode(7,ShortcutDimCode[7]);
//                 end;
//             }
//             field("ShortcutDimCode[8]";ShortcutDimCode[8])
//             {
//                 ApplicationArea = Basic;
//                 CaptionClass = '1,2,8';
//                 TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(8),
//                                                               "Dimension Value Type"=const(Standard),
//                                                               Blocked=const(false));
//                 Visible = false;

//                 trigger OnValidate()
//                 begin
//                     Rec.ValidateShortcutDimCode(8,ShortcutDimCode[8]);
//                 end;
//             }
//         }
//     }
//     actions
//     {
//         modify(Dimensions)
//         {
//             ApplicationArea = Basic;
//         }
//         modify(Card)
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Ledger E&ntries")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Renumber Document Numbers")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Apply Entries")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Insert FA &Bal. Account")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Insert Conv. LCY Rndg. Lines")
//         {
//             ApplicationArea = Basic;
//         }
//         modify(Reconcile)
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Test Report")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("P&ost")
//         {
//             ApplicationArea = Basic;
//         }
//         modify(Preview)
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Post and &Print")
//         {
//             ApplicationArea = Basic;
//         }

//         //Unsupported feature: Property Deletion (ToolTipML) on "Dimensions(Action 122)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Card(Action 44)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Ledger E&ntries"(Action 45)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Renumber Document Numbers"(Action 3)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Apply Entries"(Action 123)".


//         //Unsupported feature: Property Deletion (Enabled) on ""Apply Entries"(Action 123)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Insert FA &Bal. Account"(Action 107)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Insert Conv. LCY Rndg. Lines"(Action 124)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Reconcile(Action 48)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Test Report"(Action 49)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""P&ost"(Action 50)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Preview(Action 5)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Post and &Print"(Action 51)".

//         modify("Page")
//         {
//             Visible = false;
//         }
//         modify(EditInExcel)
//         {
//             Visible = false;
//         }
//     }


//     //Unsupported feature: Property Modification (Id) on "ChangeExchangeRate(Variable 1002)".

//     //var
//         //>>>> ORIGINAL VALUE:
//         //ChangeExchangeRate : 1002;
//         //Variable type has not been exported.
//         //>>>> MODIFIED VALUE:
//         //ChangeExchangeRate : 1001;
//         //Variable type has not been exported.


//     //Unsupported feature: Property Modification (Id) on "GLReconcile(Variable 1001)".

//     //var
//         //>>>> ORIGINAL VALUE:
//         //GLReconcile : 1001;
//         //Variable type has not been exported.
//         //>>>> MODIFIED VALUE:
//         //GLReconcile : 1002;
//         //Variable type has not been exported.


//     //Unsupported feature: Property Modification (Length) on "AccName(Variable 1006)".

//     //var
//         //>>>> ORIGINAL VALUE:
//         //AccName : 100;
//         //Variable type has not been exported.
//         //>>>> MODIFIED VALUE:
//         //AccName : 50;
//         //Variable type has not been exported.


//     //Unsupported feature: Property Modification (Length) on "BalAccountName(Variable 1007)".

//     //var
//         //>>>> ORIGINAL VALUE:
//         //BalAccountName : 100;
//         //Variable type has not been exported.
//         //>>>> MODIFIED VALUE:
//         //BalAccountName : 50;
//         //Variable type has not been exported.


//     //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

//     //trigger OnAfterGetCurrRecord()
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         GenJnlManagement.GetAccounts(Rec,AccName,BalAccountName);
//         UpdateBalance;
//         EnableApplyEntriesAction;
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         GenJnlManagement.GetAccounts(Rec,AccName,BalAccountName);
//         UpdateBalance;
//         */
//     //end;


//     //Unsupported feature: Code Modification on "OnNewRecord".

//     //trigger OnNewRecord(BelowxRec: Boolean)
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         UpdateBalance;
//         EnableApplyEntriesAction;
//         SetUpNewLine(xRec,Balance,BelowxRec);
//         CLEAR(ShortcutDimCode);
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         UpdateBalance;
//         SetUpNewLine(xRec,Balance,BelowxRec);
//         CLEAR(ShortcutDimCode);
//         */
//     //end;


//     //Unsupported feature: Code Modification on "OnOpenPage".

//     //trigger OnOpenPage()
//     //>>>> ORIGINAL CODE:
//     //begin
//         /*
//         IsSaasExcelAddinEnabled := ServerConfigSettingHandler.GetIsSaasExcelAddinEnabled;
//         IF ClientTypeManagement.GetCurrentClientType = CLIENTTYPE::ODataV4 THEN
//           EXIT;

//         BalAccountName := '';
//         SetDimensionsVisibility;

//         IF IsOpenedFromBatch THEN BEGIN
//           CurrentJnlBatchName := "Journal Batch Name";
//           GenJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
//         #11..13
//         IF NOT JnlSelected THEN
//           ERROR('');
//         GenJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
//         */
//     //end;
//     //>>>> MODIFIED CODE:
//     //begin
//         /*
//         BalAccountName := '';
//         #8..16
//         */
//     //end;

//     //Unsupported feature: Property Deletion (ApplicationArea).


//     //Unsupported feature: Property Deletion (UsageCategory).


//     //Unsupported feature: Property Deletion (PromotedActionCategoriesML).

// }
