// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// PageExtension 52186448 pageextension52186448 extends "Fixed Asset List" 
// {
//     Caption = 'Fixed Asset List';
//     layout
//     {
//         modify("No.")
//         {
//             ApplicationArea = Basic;
//         }
//         modify(Description)
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Vendor No.")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Modification (Visible) on ""Vendor No."(Control 23)".

//         }
//         modify("Maintenance Vendor No.")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Modification (Visible) on ""Maintenance Vendor No."(Control 6)".

//         }
//         modify("Responsible Employee")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (Visible) on ""Responsible Employee"(Control 35)".

//         }
//         modify("FA Class Code")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("FA Subclass Code")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("FA Location Code")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (Visible) on ""FA Location Code"(Control 33)".

//         }
//         modify("Budgeted Asset")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Search Description")
//         {
//             ApplicationArea = Basic;
//         }
//         modify(Acquired)
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Modification (SourceExpr) on "Acquired(Control 12)".


//             //Unsupported feature: Property Modification (Name) on "Acquired(Control 12)".


//             //Unsupported feature: Property Insertion (Visible) on "Acquired(Control 12)".

//         }

//         //Unsupported feature: Property Insertion (Visible) on "Control1905767507(Control 1905767507)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""No."(Control 2)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Description(Control 4)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Vendor No."(Control 23)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Maintenance Vendor No."(Control 6)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Responsible Employee"(Control 35)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""FA Class Code"(Control 25)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""FA Subclass Code"(Control 27)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""FA Location Code"(Control 33)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Budgeted Asset"(Control 17)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Search Description"(Control 8)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Acquired(Control 12)".


//         //Unsupported feature: Property Deletion (ApplicationArea) on "Control1900383207(Control 1900383207)".


//         //Unsupported feature: Property Deletion (ApplicationArea) on "Control1905767507(Control 1905767507)".

//         moveafter(Description;Acquired)
//     }
//     actions
//     {
//         modify("Depreciation &Books")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (Promoted) on ""Depreciation &Books"(Action 32)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on ""Depreciation &Books"(Action 32)".

//         }
//         modify(Statistics)
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Dimensions-Single")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Dimensions-&Multiple")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Main&tenance Ledger Entries")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (Promoted) on ""Main&tenance Ledger Entries"(Action 39)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on ""Main&tenance Ledger Entries"(Action 39)".

//         }
//         modify(Picture)
//         {
//             ApplicationArea = Basic;
//         }
//         modify("FA Posting Types Overview")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Co&mments")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("M&ain Asset Components")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Ma&in Asset Statistics")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Ledger E&ntries")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Modification (RunPageView) on ""Ledger E&ntries"(Action 37)".


//             //Unsupported feature: Property Insertion (Promoted) on ""Ledger E&ntries"(Action 37)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on ""Ledger E&ntries"(Action 37)".

//         }
//         modify("Error Ledger Entries")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Modification (RunPageView) on ""Error Ledger Entries"(Action 38)".

//         }
//         modify("Maintenance &Registration")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (Promoted) on ""Maintenance &Registration"(Action 43)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on ""Maintenance &Registration"(Action 43)".

//         }
//         modify("Fixed Asset Journal")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (Promoted) on ""Fixed Asset Journal"(Action 9)".


//             //Unsupported feature: Property Insertion (PromotedIsBig) on ""Fixed Asset Journal"(Action 9)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on ""Fixed Asset Journal"(Action 9)".

//         }
//         modify("Fixed Asset G/L Journal")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Fixed Asset Reclassification Journal")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (Promoted) on ""Fixed Asset Reclassification Journal"(Action 61)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on ""Fixed Asset Reclassification Journal"(Action 61)".

//         }
//         modify("Recurring Fixed Asset Journal")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (Promoted) on ""Recurring Fixed Asset Journal"(Action 60)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on ""Recurring Fixed Asset Journal"(Action 60)".

//         }
//         modify(CalculateDepreciation)
//         {

//             //Unsupported feature: Property Modification (Name) on "CalculateDepreciation(Action 11)".

//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (RunObject) on "CalculateDepreciation(Action 11)".

//         }
//         modify("C&opy Fixed Asset")
//         {

//             //Unsupported feature: Property Modification (Level) on ""C&opy Fixed Asset"(Action 13)".

//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (Promoted) on ""C&opy Fixed Asset"(Action 13)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on ""C&opy Fixed Asset"(Action 13)".

//         }
//         modify("Fixed Assets List")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Acquisition List")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Modification (Promoted) on ""Acquisition List"(Action 1903109606)".

//         }
//         modify(Details)
//         {
//             ApplicationArea = Basic;
//         }
//         modify("FA Book Value")
//         {
//             Caption = 'Book Value 01';
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Modification (Name) on ""FA Book Value"(Action 1905598506)".


//             //Unsupported feature: Property Insertion (Promoted) on ""FA Book Value"(Action 1905598506)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on ""FA Book Value"(Action 1905598506)".

//         }
//         modify("FA Book Val. - Appr. & Write-D")
//         {
//             Caption = 'Book Value 02';
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Modification (Name) on ""FA Book Val. - Appr. & Write-D"(Action 1905598606)".


//             //Unsupported feature: Property Insertion (Promoted) on ""FA Book Val. - Appr. & Write-D"(Action 1905598606)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on ""FA Book Val. - Appr. & Write-D"(Action 1905598606)".

//         }
//         modify(Analysis)
//         {
//             ApplicationArea = Basic;
//         }
//         modify("Projected Value")
//         {
//             ApplicationArea = Basic;
//         }
//         modify("G/L Analysis")
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (Promoted) on ""G/L Analysis"(Action 1903345906)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on ""G/L Analysis"(Action 1903345906)".

//         }
//         modify(Register)
//         {
//             ApplicationArea = Basic;

//             //Unsupported feature: Property Insertion (Promoted) on "Register(Action 1903807106)".


//             //Unsupported feature: Property Insertion (PromotedCategory) on "Register(Action 1903807106)".

//         }

//         //Unsupported feature: Property Deletion (ToolTipML) on ""Depreciation &Books"(Action 32)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Statistics(Action 46)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Dimensions-Single"(Action 41)".


//         //Unsupported feature: Property Deletion (Promoted) on ""Dimensions-Single"(Action 41)".


//         //Unsupported feature: Property Deletion (PromotedCategory) on ""Dimensions-Single"(Action 41)".


//         //Unsupported feature: Code Modification on ""Dimensions-&Multiple"(Action 50).OnAction".

//         //trigger OnAction()
//         //Parameters and return type have not been exported.
//         //>>>> ORIGINAL CODE:
//         //begin
//             /*
//             CurrPage.SETSELECTIONFILTER(FA);
//             DefaultDimMultiple.SetMultiRecord(FA,FIELDNO("No."));
//             DefaultDimMultiple.RUNMODAL;
//             */
//         //end;
//         //>>>> MODIFIED CODE:
//         //begin
//             /*
//             CurrPage.SETSELECTIONFILTER(FA);
//             DefaultDimMultiple.SetMultiFA(FA);
//             DefaultDimMultiple.RUNMODAL;
//             */
//         //end;

//         //Unsupported feature: Property Deletion (ToolTipML) on ""Dimensions-&Multiple"(Action 50)".


//         //Unsupported feature: Property Deletion (Promoted) on ""Dimensions-&Multiple"(Action 50)".


//         //Unsupported feature: Property Deletion (PromotedCategory) on ""Dimensions-&Multiple"(Action 50)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Main&tenance Ledger Entries"(Action 39)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Picture(Action 42)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""FA Posting Types Overview"(Action 48)".


//         //Unsupported feature: Property Deletion (Promoted) on ""FA Posting Types Overview"(Action 48)".


//         //Unsupported feature: Property Deletion (PromotedCategory) on ""FA Posting Types Overview"(Action 48)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Co&mments"(Action 40)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""M&ain Asset Components"(Action 44)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Ma&in Asset Statistics"(Action 47)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Ledger E&ntries"(Action 37)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Error Ledger Entries"(Action 38)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Maintenance &Registration"(Action 43)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Fixed Asset Journal"(Action 9)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Fixed Asset G/L Journal"(Action 10)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Fixed Asset Reclassification Journal"(Action 61)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Recurring Fixed Asset Journal"(Action 60)".

//         modify(CalculateDepreciation)
//         {
//             Visible = false;
//         }

//         //Unsupported feature: Property Deletion (ToolTipML) on "CalculateDepreciation(Action 11)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""C&opy Fixed Asset"(Action 13)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Fixed Assets List"(Action 1907091306)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Acquisition List"(Action 1903109606)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Details(Action 1901902606)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""FA Book Value"(Action 1905598506)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""FA Book Val. - Appr. & Write-D"(Action 1905598606)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Analysis(Action 1901105406)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""Projected Value"(Action 1902048606)".


//         //Unsupported feature: Property Deletion (ToolTipML) on ""G/L Analysis"(Action 1903345906)".


//         //Unsupported feature: Property Deletion (ToolTipML) on "Register(Action 1903807106)".

//         moveafter(Picture;"C&opy Fixed Asset")
//     }

//     //Unsupported feature: Property Deletion (ApplicationArea).


//     //Unsupported feature: Property Deletion (UsageCategory).


//     //Unsupported feature: Property Deletion (AdditionalSearchTermsML).

// }
