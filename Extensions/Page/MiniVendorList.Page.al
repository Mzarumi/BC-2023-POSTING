// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1331 "Mini Vendor List"
// {
//     Caption = 'Vendor List';
//     CardPageID = "Mini Vendor Card";
//     Editable = false;
//     PageType = List;
//     PromotedActionCategories = 'New,Process,Report,New Document,Vendor,History,Prices and Discounts';
//     SourceTable = Vendor;

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the number of the vendor. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
//                 }
//                 field(Name; Rec.Name)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the vendor''s name. You can enter a maximum of 30 characters, both numbers and letters.';
//                 }
//                 field("Phone No."; Rec."Phone No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the vendor''s telephone number. You can enter a maximum of 30 characters, both numbers and letters.';
//                 }
//                 field(Contact; Rec.Contact)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the name of the person you regularly contact when you do business with this vendor. You can enter a maximum of 30 characters, both numbers and letters.';
//                 }
//                 field("Balance (LCY)"; Rec."Balance (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Shows the vendor''s current balance in LCY.';
//                 }
//                 field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Shows the balance due to this vendor in LCY.';
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             part(Control23; "Mini Ven. Hist. Buy-from FactB")
//             {
//                 Caption = 'Purchase History';
//                 SubPageLink = "No." = field("No."),
//                               "Currency Filter" = field("Currency Filter"),
//                               "Date Filter" = field("Date Filter"),
//                               "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
//                               "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
//                 Visible = false;
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group(NewDocument)
//             {
//                 Caption = 'New Document';
//                 action(NewPurchaseInvoice)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Purchase Invoice';
//                     Image = Invoice;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     RunPageMode = Create;
//                     Scope = Repeater;
//                     ToolTip = 'Create a purchase invoice for the selected vendor.';

//                     trigger OnAction()
//                     begin
//                         Rec.CreateAndShowNewInvoice;
//                     end;
//                 }
//                 action(NewPurchaseCreditMemo)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Purchase Credit Memo';
//                     Image = CreditMemo;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     RunPageMode = Create;
//                     Scope = Repeater;
//                     ToolTip = 'Create a purchase credit memo for the selected vendor.';

//                     trigger OnAction()
//                     begin
//                         Rec.CreateAndShowNewCreditMemo;
//                     end;
//                 }
//             }
//             group(History)
//             {
//                 Caption = 'History';
//                 Image = History;
//                 action("<Page Vendor Ledger Entries>")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Ledger E&ntries';
//                     Image = VendorLedger;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category6;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Vendor Ledger Entries";
//                     RunPageLink = "Vendor No." = field("No.");
//                     RunPageView = sorting("Vendor No.");
//                     Scope = Repeater;
//                     ShortCutKey = 'Ctrl+F7';
//                     ToolTip = 'View the history of transactions for the selected vendor.';
//                 }
//             }
//             group(PricesAndDiscounts)
//             {
//                 Caption = 'Prices and Discounts';
//                 action("<Page Vendor Invoice Discounts>")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Invoice &Discounts';
//                     Image = CalculateInvoiceDiscount;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category7;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Vend. Invoice Discounts";
//                     RunPageLink = Code = field("Invoice Disc. Code");
//                     Scope = Repeater;
//                     ToolTip = 'Set up different discounts that the selected vendor grants you. An invoice discount is automatically granted when the total on a purchase invoice exceeds a certain amount.';
//                 }
//                 action("<Page Purchase Prices>")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Prices';
//                     Image = Price;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category7;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Purchase Prices";
//                     RunPageLink = "Vendor No." = field("No.");
//                     RunPageView = sorting("Vendor No.");
//                     Scope = Repeater;
//                     ToolTip = 'Set up different prices for items that you buy from the selected vendor. An item price is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';
//                 }
//                 action("<Page Purchase Line Discounts>")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Line Discounts';
//                     Image = LineDiscount;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category7;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Purchase Line Discounts";
//                     RunPageLink = "Vendor No." = field("No.");
//                     RunPageView = sorting("Vendor No.");
//                     Scope = Repeater;
//                     ToolTip = 'Set up different discounts for items that you buy from the selected vendor. An item discount is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';
//                 }
//             }
//             group(ReportsVendor)
//             {
//                 Caption = 'Reports';
//                 group("Purchase Reports")
//                 {
//                     Caption = 'Purchase Reports';
//                     Image = "Report";
//                     action("Vendor - Top 10 List")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Vendor - Top 10 List';
//                         Image = "Report";
//                         RunObject = Report 311;
//                         ToolTip = 'View, print, or save a list of the vendors from whom you purchase the most or to whom you owe the most.';
//                     }
//                     action("Purchase Statistics")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Purchase Statistics';
//                         Image = "Report";
//                         RunObject = Report 312;
//                         ToolTip = 'View, print, or save an overview of amounts for purchases, invoice discount, and payment discount in LCY for each vendor, for example, to analyze item purchases for an individual customer and trends for item purchases.';
//                     }
//                     action("Vendor - Purchase List")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Vendor - Purchase List';
//                         Image = "Report";
//                         RunObject = Report "Vendor - Purchase List";
//                         ToolTip = 'View, print, or save a list of your purchases in a period, for example, to report purchase activity to customs and tax authorities.';
//                     }
//                     action("Vendor Item Catalog")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Vendor Item Catalog';
//                         Image = "Report";
//                         RunObject = Report 320;
//                         ToolTip = 'View a list of the items that you can buy from the vendor.';
//                     }
//                     action("Vendor/Item Purchases")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Vendor/Item Purchases';
//                         Image = "Report";
//                         RunObject = Report 313;
//                         ToolTip = 'View all the items that you have purchased from the vendor over time.';
//                     }
//                 }
//                 group("Finance Reports")
//                 {
//                     Caption = 'Finance Reports';
//                     Image = "Report";
//                     action("Vendor - Balance to Date")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Vendor - Balance to Date';
//                         Image = "Report";
//                         RunObject = Report "Vendor - Balance to Date";
//                         ToolTip = 'View, print, or save a list with your payment history to vendors up until a specified date. You can use the report to extract your total payment liabilities at the close of an accounting period or fiscal year.';
//                     }
//                     action("Vendor - Trial Balance")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Vendor - Trial Balance';
//                         Image = "Report";
//                         RunObject = Report "Vendor - Trial Balance";
//                         ToolTip = 'View, print, or save the beginning and ending balance for vendors with entries within a specified period.';
//                     }
//                     action("Vendor - Detail Trial Balance")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Vendor - Detail Trial Balance';
//                         Image = "Report";
//                         RunObject = Report "Vendor - Detail Trial Balance";
//                         ToolTip = 'View, print, or save the balance for vendors with balances on a specified date, for example, at the close of an accounting period or for an audit.';
//                     }
//                     action("Vendor - Summary Aging")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Vendor - Summary Aging';
//                         Image = "Report";
//                         RunObject = Report 305;
//                         ToolTip = 'View, print, or save a summary of the payables owed to each vendor, divided into three time periods.';
//                     }
//                     action("Aged Accounts Payable")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Aged Accounts Payable';
//                         Image = "Report";
//                         RunObject = Report "Aged Accounts Payable";
//                         ToolTip = 'View, print, or save an overview of when your payables to vendors are due or overdue, divided into four periods.';
//                     }
//                     action("Payments on Hold")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Payments on Hold';
//                         Image = "Report";
//                         RunObject = Report "Payments on Hold";
//                         ToolTip = 'View purchase invoices with outstanding payments to the vendor.';
//                     }
//                 }
//             }
//         }
//     }
// }
