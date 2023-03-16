// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1348 "Mini General Ledger Setup"
// {
//     Caption = 'General Ledger Setup';
//     DeleteAllowed = false;
//     InsertAllowed = false;
//     PageType = Card;
//     PromotedActionCategories = 'New,Process,Report,General,Posting,VAT,Bank,Journal Templates';
//     SourceTable = "General Ledger Setup";

//     layout
//     {
//         area(content)
//         {
//             group("Setup Fields")
//             {
//                 Caption = 'Setup Fields';
//                 field("Allow Posting From";Rec."Allow Posting From")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the earliest date on which posting to the company is allowed.';
//                 }
//                 field("Allow Posting To";Rec."Allow Posting To")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the last date on which posting to the company is allowed.';
//                 }
//                 field("Allow Posting From [Time]";"Allow Posting From [Time]")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Allow Posting To [Time]";"Allow Posting To [Time]")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Local Address Format";Rec."Local Address Format")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the format in which addresses must appear on printouts. If an address includes a country/region code, the format defined for that country/region code will overrule the format that is defined here.';
//                 }
//                 field("Inv. Rounding Precision (LCY)";Rec."Inv. Rounding Precision (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the size of the interval to be used when rounding amounts in your local currency. You can also specify invoice rounding for each currency in the Currency table.';
//                 }
//                 field("Inv. Rounding Type (LCY)";Rec."Inv. Rounding Type (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies whether an invoice amount will be rounded up or down. The program uses this information together with the interval for rounding that you have specified in the Inv. Rounding Precision (LCY) field.';
//                 }
//                 field("LCY Code";Rec."LCY Code")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the currency code for LCY.';
//                 }
//                 field("VAT Rounding Type";Rec."VAT Rounding Type")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies how the program will round VAT when calculated for the local currency. To see the available options, choose the field.';
//                 }
//                 field("Bank Account Nos.";Rec."Bank Account Nos.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Bank Account Numbers';
//                     ToolTip = 'Specifies the code for the number series that will be used to assign numbers to bank accounts. To see the number series that have been set up in the No. Series window, choose the field.';
//                 }
//                 field("Global Dimension 1 Code";Rec."Global Dimension 1 Code")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the code for Global Dimension 1. You must select the Global Dimension 1 code from one of the dimension codes already set up by you in the Dimension table. You should determine which dimensions you are likely to analyze frequently and select one of these as one of the two global dimensions.';
//                 }
//                 field("Global Dimension 2 Code";Rec."Global Dimension 2 Code")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the code for Global Dimension 2. You must select the Global Dimension 2 code from one of the dimension codes already set up by you in the Dimension table. You should determine which dimensions you are likely to analyze frequently and select one of these as one of the two global dimensions.';
//                 }
//                 field("VAT Reg. No. Validation URL";Rec."VAT Reg. No. Validation URL")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the URL of the EU web service that is used by default to verify VAT registration numbers.';
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             action("<Page Accounting Periods>")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Accounting Periods';
//                 Image = AccountingPeriods;
//                 Promoted = true;
//                 PromotedCategory = Category4;
//                 PromotedIsBig = true;
//                 RunObject = Page "Accounting Periods";
//                 ToolTip = 'Set up a new fiscal year and the number of accounting periods, such as 12 monthly periods, within the fiscal year and specify which period is the start of the new fiscal year. Accounting periods can be used as a time reference in various types of financial analysis, such as the grouping of posted entries in the Income & Expense chart.';
//             }
//             action(Dimensions)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Dimensions';
//                 Image = Dimensions;
//                 Promoted = true;
//                 PromotedCategory = Category4;
//                 PromotedIsBig = true;
//                 RunObject = Page Dimensions;
//                 ToolTip = 'Set up the department and project dimensions that you can assign to sales and purchase documents for financial analysis of your transaction history.';
//             }
//             action("User Setup")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'User Setup';
//                 Image = UserSetup;
//                 Promoted = true;
//                 PromotedCategory = Category4;
//                 PromotedIsBig = true;
//                 RunObject = Page "User Setup";
//                 ToolTip = 'Set up users IDs and passwords for each user to secure your database from unauthorized access.';
//             }
//             action("Cash Flow Setup")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Cash Flow Setup';
//                 Image = CashFlowSetup;
//                 Promoted = true;
//                 PromotedCategory = Category4;
//                 PromotedIsBig = true;
//                 RunObject = Page "Cash Flow Setup";
//                 ToolTip = 'Set up the accounts where cash flow figures for sales, purchase, and fixed-asset transactions are stored.';
//             }
//             action("Bank Export/Import Setup")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Bank Export/Import Setup';
//                 Image = ImportExport;
//                 Promoted = true;
//                 PromotedCategory = Category7;
//                 PromotedIsBig = true;
//                 RunObject = Page "Bank Export/Import Setup";
//                 ToolTip = 'Set up the formats for exporting vendor payments, such as Giro and FIK. Set up the formats for importing bank statements, such as from Danske Bank and Nordea.';
//             }
//             group("General Ledger Posting")
//             {
//                 Caption = 'General Ledger Posting';
//                 action("General Posting Setup")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'General Posting Setup';
//                     Image = GeneralPostingSetup;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     RunObject = Page "General Posting Setup";
//                     ToolTip = 'Set up combinations of general business and general product posting groups by specifying account numbers for posting of sales and purchase transactions.';
//                 }
//                 action("Gen. Business Posting Groups")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Gen. Business Posting Groups';
//                     Image = GeneralPostingSetup;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     RunObject = Page "Gen. Business Posting Groups";
//                     ToolTip = 'Set up the trade-type posting groups that you assign to customer and vendor cards to link transactions with the appropriate general ledger account.';
//                 }
//                 action("Gen. Product Posting Groups")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Gen. Product Posting Groups';
//                     Image = GeneralPostingSetup;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     RunObject = Page "Gen. Product Posting Groups";
//                     ToolTip = 'Set up the item-type posting groups that you assign to customer and vendor cards to link transactions with the appropriate general ledger account.';
//                 }
//             }
//             group("VAT Posting")
//             {
//                 Caption = 'VAT Posting';
//                 action("VAT Posting Setup")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'VAT Posting Setup';
//                     Image = VATPostingSetup;
//                     Promoted = true;
//                     PromotedCategory = Category6;
//                     PromotedIsBig = true;
//                     RunObject = Page "VAT Posting Setup";
//                     ToolTip = 'Set up combinations of VAT business posting groups and VAT product posting groups by specifying a VAT percent, a VAT calculation type, and account numbers for posting of VAT related to sales and purchases.';
//                 }
//                 action("VAT Business Posting Groups")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'VAT Business Posting Groups';
//                     Image = VATPostingSetup;
//                     Promoted = true;
//                     PromotedCategory = Category6;
//                     PromotedIsBig = true;
//                     RunObject = Page "VAT Business Posting Groups";
//                     ToolTip = 'Set up the trade-type posting groups that you assign to customer and vendor cards to link VAT amounts with the appropriate general ledger account.';
//                 }
//                 action("VAT Product Posting Groups")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'VAT Product Posting Groups';
//                     Image = VATPostingSetup;
//                     Promoted = true;
//                     PromotedCategory = Category6;
//                     PromotedIsBig = true;
//                     RunObject = Page "VAT Product Posting Groups";
//                     ToolTip = 'Set up the item-type posting groups that you assign to customer and vendor cards to link VAT amounts with the appropriate general ledger account.';
//                 }
//                 action("VAT Report Setup")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'VAT Report Setup';
//                     Image = VATPostingSetup;
//                     Promoted = true;
//                     PromotedCategory = Category6;
//                     PromotedIsBig = true;
//                     RunObject = Page "VAT Report Setup";
//                     ToolTip = 'Set up number series and options for the report that you periodically send to the authorities to declare your VAT.';
//                 }
//             }
//             group("Bank Posting")
//             {
//                 Caption = 'Bank Posting';
//                 action("Bank Account Posting Groups")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Bank Account Posting Groups';
//                     Image = BankAccount;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     PromotedIsBig = true;
//                     RunObject = Page "Bank Account Posting Groups";
//                     ToolTip = 'Set up posting groups that you assign to your bank accounts, so that payments in and out of the bank account are posted to the general ledger account that is linked to the bank posting group.';
//                 }
//             }
//             group("Journal Templates")
//             {
//                 Caption = 'Journal Templates';
//                 action("General Journal Templates")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'General Journal Templates';
//                     Image = JournalSetup;
//                     Promoted = true;
//                     PromotedCategory = Category8;
//                     PromotedIsBig = true;
//                     RunObject = Page "General Journal Templates";
//                     ToolTip = 'Set up balancing accounts, number series, and reason codes in the journals that you use for bookkeeping tasks, such as cash receipt and payment. By using different templates you can design windows with different layouts and you can assign trace codes, number series, and reports to each template.';
//                 }
//                 action("VAT Statement Templates")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'VAT Statement Templates';
//                     Image = VATStatement;
//                     Promoted = true;
//                     PromotedCategory = Category8;
//                     PromotedIsBig = true;
//                     RunObject = Page "VAT Statement Templates";
//                     ToolTip = 'Set up the reports that you use to settle VAT and report to the customs and tax authorities.';
//                 }
//                 action("Intrastat Templates")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Intrastat Templates';
//                     Image = Template;
//                     Promoted = true;
//                     PromotedCategory = Category8;
//                     PromotedIsBig = true;
//                     RunObject = Page "Intrastat Journal Templates";
//                     ToolTip = 'Define how you want to set up and keep track of journals to report Intrastat figures. By using different templates you can design windows with different layouts and you can assign trace codes, number series, and reports to each template.';
//                 }
//             }
//         }
//         area(processing)
//         {
//             group("F&unctions")
//             {
//                 Caption = 'F&unctions';
//                 Image = "Action";
//                 action("Change Global Dimensions")
//                 {
//                     AccessByPermission = TableData Dimension=R;
//                     ApplicationArea = Basic;
//                     Caption = 'Change Global Dimensions';
//                     Ellipsis = true;
//                     Image = ChangeDimensions;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         Report.RunModal(Report::"Change Global Dimensions");
//                     end;
//                 }
//             }
//         }
//     }

//     trigger OnOpenPage()
//     begin
//         Rec.Reset;
//         if not Rec.Get then begin
//           Rec.Init;
//           Rec.Insert;
//         end;
//     end;
// }
