// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1301 "Mini Customer List"
// {
//     Caption = 'Customer List';
//     CardPageID = "Mini Customer Card";
//     Editable = false;
//     PageType = List;
//     PromotedActionCategories = 'New,Process,Report,New Document,Master Data,History,Prices and Discounts';
//     SourceTable = Customer;

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
//                 }
//                 field(Name; Rec.Name)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the customer''s name. This name will appear on all sales documents for the customer. You can enter a maximum of 50 characters, both numbers and letters.';
//                 }
//                 field("Phone No."; Rec."Phone No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the customer''s telephone number. You can enter a maximum of 30 characters, both numbers and letters.';
//                 }
//                 field(Contact; Rec.Contact)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the name of the person you regularly contact when you do business with this customer. You can enter a maximum of 30 characters, both numbers and letters.';
//                 }
//                 field("Balance (LCY)"; Rec."Balance (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';
//                 }
//                 field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Displays the customer''s balance due in LCY.';
//                 }
//                 field("Sales (LCY)"; Rec."Sales (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Shows the total net amount of sales to the customer in LCY.';
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             part(Control23; "Mini Sales Hist. Sell-to FactB")
//             {
//                 Caption = 'Sales History';
//                 SubPageLink = "No." = field("No."),
//                               "Currency Filter" = field("Currency Filter"),
//                               "Date Filter" = field("Date Filter"),
//                               "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
//                               "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
//                 Visible = false;
//             }
//             part(Control12; "CRM Statistics FactBox")
//             {
//                 SubPageLink = "No." = field("No.");
//                 Visible = CRMIsCoupledToRecord;
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group("New Document")
//             {
//                 Caption = 'New Document';
//                 action(NewSalesInvoice)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Sales Invoice';
//                     Image = Invoice;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     RunPageMode = Create;
//                     Scope = Repeater;
//                     ToolTip = 'Create an invoice for the selected customer.';

//                     trigger OnAction()
//                     begin
//                         Rec.CreateAndShowNewInvoice;
//                     end;
//                 }
//                 action(NewSalesQuote)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Sales Quote';
//                     Image = Quote;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     RunPageMode = Create;
//                     Scope = Repeater;
//                     ToolTip = 'Create a quote for the customer.';

//                     trigger OnAction()
//                     begin
//                         Rec.CreateAndShowNewQuote;
//                     end;
//                 }
//                 action(NewSalesCreditMemo)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Sales Credit Memo';
//                     Image = CreditMemo;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     RunPageMode = Create;
//                     Scope = Repeater;
//                     ToolTip = 'Create a credit memo for the selected customer.';

//                     trigger OnAction()
//                     begin
//                         Rec.CreateAndShowNewCreditMemo;
//                     end;
//                 }
//             }
//             group(ActionGroupCRM)
//             {
//                 Caption = 'Dynamics CRM';
//                 Visible = CRMIntegrationEnabled;
//                 action(CRMGotoAccount)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Account';
//                     Image = CoupledCustomer;
//                     ToolTip = 'Open the coupled Microsoft Dynamics CRM account.';

//                     trigger OnAction()
//                     var
//                         CRMIntegrationManagement: Codeunit "CRM Integration Management";
//                     begin
//                         CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
//                     end;
//                 }
//                 action(CRMSynchronizeNow)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Synchronize Now';
//                     Image = Refresh;
//                     ToolTip = 'Send or get updated data to or from Microsoft Dynamics CRM.';

//                     trigger OnAction()
//                     var
//                         Customer: Record Customer;
//                         CRMIntegrationManagement: Codeunit "CRM Integration Management";
//                         CustomerRecordRef: RecordRef;
//                     begin
//                         CurrPage.SetSelectionFilter(Customer);
//                         Customer.Next;

//                         if Customer.Count = 1 then
//                             CRMIntegrationManagement.UpdateOneNow(Customer.RecordId)
//                         else begin
//                             CustomerRecordRef.GetTable(Customer);
//                             CRMIntegrationManagement.UpdateMultipleNow(CustomerRecordRef);
//                         end
//                     end;
//                 }
//                 action(UpdateStatisticsInCRM)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Update Account Statistics';
//                     Enabled = CRMIsCoupledToRecord;
//                     Image = UpdateXML;
//                     ToolTip = 'Send Customer Statistics data to Microsoft Dynamics CRM to update the Account Statistics factbox';

//                     trigger OnAction()
//                     var
//                         CRMIntegrationManagement: Codeunit "CRM Integration Management";
//                     begin
//                         CRMIntegrationManagement.CreateOrUpdateCRMAccountStatistics(Rec);
//                     end;
//                 }
//                 group(Coupling)
//                 {
//                     Caption = 'Coupling', Comment = 'Coupling is a noun';
//                     Image = LinkAccount;
//                     ToolTip = 'Create, change, or delete a coupling between the Microsoft Dynamics NAV record and a Microsoft Dynamics CRM record.';
//                     action(ManageCRMCoupling)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Set Up Coupling';
//                         Image = LinkAccount;
//                         ToolTip = 'Create or modify the coupling to a Microsoft Dynamics CRM account.';

//                         trigger OnAction()
//                         var
//                             CRMIntegrationManagement: Codeunit "CRM Integration Management";
//                         begin
//                             CRMIntegrationManagement.CreateOrUpdateCoupling(Rec.RecordId);
//                         end;
//                     }
//                     action(DeleteCRMCoupling)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Delete Coupling';
//                         Enabled = CRMIsCoupledToRecord;
//                         Image = UnLinkAccount;
//                         ToolTip = 'Delete the coupling to a Microsoft Dynamics CRM account.';

//                         trigger OnAction()
//                         var
//                             CRMCouplingManagement: Codeunit "CRM Coupling Management";
//                         begin
//                             CRMCouplingManagement.RemoveCoupling(Rec.RecordId);
//                         end;
//                     }
//                 }
//             }
//             group(Customer)
//             {
//                 Caption = 'Customer';
//                 Image = Customer;
//                 action("Bank Accounts")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Bank Accounts';
//                     Image = BankAccount;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category5;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Customer Bank Account List";
//                     RunPageLink = "Customer No." = field("No.");
//                     Scope = Repeater;
//                     ToolTip = 'Set up information about the customer''s bank account.';
//                     Visible = false;
//                 }
//                 action("Ship-&to Addresses")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Ship-&to Addresses';
//                     Image = ShipAddress;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category5;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Ship-to Address List";
//                     RunPageLink = "Customer No." = field("No.");
//                     Scope = Repeater;
//                     ToolTip = 'Set up the alternate address where the selected customer wants the item delivered if different from its regular address.';
//                     Visible = false;
//                 }
//                 action("Cross Re&ferences")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Cross Re&ferences';
//                     Image = Change;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category5;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Cross References";
//                     RunPageLink = "Cross-Reference Type" = const(Customer),
//                                   "Cross-Reference Type No." = field("No.");
//                     RunPageView = sorting("Cross-Reference Type", "Cross-Reference Type No.");
//                     Scope = Repeater;
//                     ToolTip = 'Set up the customer''s own identification of items that you sell to the customer. Cross-references to the customer''s item number means that that item number is automatically shown on sales documents instead of the number that you use.';
//                     Visible = false;
//                 }
//                 action("<Online Map>")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Online Map';
//                     Image = Map;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     Scope = Repeater;
//                     ToolTip = 'View the selected customer''s address on your preferred map website.';
//                     Visible = false;

//                     trigger OnAction()
//                     begin
//                         Rec.DisplayMap;
//                     end;
//                 }
//                 action(Dimensions)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category5;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Default Dimensions";
//                     RunPageLink = "Table ID" = const(18),
//                                   "No." = field("No.");
//                     Scope = Repeater;
//                     ShortCutKey = 'Shift+Ctrl+D';
//                     ToolTip = 'Set up default dimensions for the selected customer, such as an area or customer group code. You can assign dimension codes to transactions to distribute costs and analyze historical information.';
//                     Visible = false;
//                 }
//             }
//             group(History)
//             {
//                 Caption = 'History';
//                 Image = History;
//                 action("Ledger E&ntries")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Ledger E&ntries';
//                     Image = CustomerLedger;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category6;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Customer Ledger Entries";
//                     RunPageLink = "Customer No." = field("No.");
//                     RunPageView = sorting("Customer No.");
//                     Scope = Repeater;
//                     ShortCutKey = 'Ctrl+F7';
//                     ToolTip = 'View the history of transactions for the selected customer.';
//                 }
//             }
//             group(PricesAndDiscounts)
//             {
//                 Caption = 'Prices and Discounts';
//                 action("Invoice &Discounts")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Invoice &Discounts';
//                     Image = CalculateInvoiceDiscount;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category7;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Cust. Invoice Discounts";
//                     RunPageLink = Code = field("Invoice Disc. Code");
//                     Scope = Repeater;
//                     ToolTip = 'Set up different discounts applied to invoices for the selected customer. An invoice discount is automatically granted to the customer when the total on a sales invoice exceeds a certain amount.';
//                 }
//                 action(Prices)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Prices';
//                     Image = Price;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category7;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Sales Prices";
//                     RunPageLink = "Sales Type" = const(Customer),
//                                   "Sales Code" = field("No.");
//                     RunPageView = sorting("Sales Type", "Sales Code");
//                     Scope = Repeater;
//                     ToolTip = 'Set up different prices for items that you sell to the selected customer. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
//                 }
//                 action("Line Discounts")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Line Discounts';
//                     Image = LineDiscount;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category7;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Sales Line Discounts";
//                     RunPageLink = "Sales Type" = const(Customer),
//                                   "Sales Code" = field("No.");
//                     RunPageView = sorting("Sales Type", "Sales Code");
//                     Scope = Repeater;
//                     ToolTip = 'Set up different discounts for items that you sell to the selected customer. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
//                 }
//             }
//             group(Reports)
//             {
//                 Caption = 'Reports';
//                 group(SalesReports)
//                 {
//                     Caption = 'Sales Reports';
//                     Image = "Report";
//                     action("Customer - Top 10 List")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer - Top 10 List';
//                         Image = "Report";
//                         RunObject = Report "Customer - Top 10 List";
//                         ToolTip = 'View, print, or save an overview of the customers that purchase the most or that owe the most in a selected period. Only customers that have either purchases during the period or a balance at the end of the period will be included.';
//                     }
//                     action("Customer - Sales List")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer - Sales List';
//                         Image = "Report";
//                         RunObject = Report "Customer - Sales List";
//                         ToolTip = 'View, print, or save customer sales in a period, for example, to report sales activity to customs and tax authorities.';
//                     }
//                     action("Sales Statistics")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Sales Statistics';
//                         Image = "Report";
//                         RunObject = Report 112;
//                         ToolTip = 'View, print, or save customers'' total costs, sales, and profits over time, for example, to analyze earnings trends. The report shows amounts for original and adjusted costs, sales, profits, invoice discounts, payment discounts, and profit percentage in three adjustable periods.';
//                     }
//                 }
//                 group(FinanceReports)
//                 {
//                     Caption = 'Finance Reports';
//                     Image = "Report";
//                     action(Statement)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Statement';
//                         Image = "Report";
//                         RunObject = Report Statement;
//                         ToolTip = 'View, print, or save a list of a customer''s transactions for a selected period, for example, to send to the customer at the close of an accounting period. You can choose to have all overdue balances displayed regardless of the period specified, or you can choose to include an aging band.';
//                     }
//                     action("Customer - Balance to Date")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer - Balance to Date';
//                         Image = "Report";
//                         RunObject = Report "Customer - Balance to Date";
//                         ToolTip = 'View, print, or save a customer''s balance on a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.';
//                     }
//                     action("Customer - Trial Balance")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer - Trial Balance';
//                         Image = "Report";
//                         RunObject = Report "Customer - Trial Balance";
//                         ToolTip = 'View, print, or save the beginning and ending balance for customers with entries within a specified period. The report can be used to verify that the balance for a customer posting group is equal to the balance on the corresponding general ledger account on a certain date.';
//                     }
//                     action("Customer - Detail Trial Bal.")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer - Detail Trial Bal.';
//                         Image = "Report";
//                         RunObject = Report "Customer - Detail Trial Bal.";
//                         ToolTip = 'View, print, or save the balance for customers with balances on a specified date. The report can be used at the close of an accounting period, for example, or for an audit.';
//                     }
//                     action("Customer - Summary Aging")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer - Summary Aging';
//                         Image = "Report";
//                         RunObject = Report 105;
//                         ToolTip = 'View, print, or save a summary of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.';
//                     }
//                     action("Customer - Detailed Aging")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer - Detailed Aging';
//                         Image = "Report";
//                         RunObject = Report 106;
//                         ToolTip = 'View, print, or save a detailed list of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.';
//                     }
//                     action("Aged Accounts Receivable")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Aged Accounts Receivable';
//                         Image = "Report";
//                         RunObject = Report "Aged Accounts Receivable";
//                         ToolTip = 'View, print, or save an overview of when customer payments are due or overdue, divided into four periods. You must specify the date you want aging calculated from and the length of the period that each column will contain data for.';
//                     }
//                     action("Customer - Payment Receipt")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer - Payment Receipt';
//                         Image = "Report";
//                         RunObject = Report "Customer - Payment Receipt";
//                         ToolTip = 'View, print, or save a document showing which customer ledger entries that a payment has been applied to. This report can be used as a payment receipt that you send to the customer.';
//                     }
//                 }
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     var
//         CRMCouplingManagement: Codeunit "CRM Coupling Management";
//     begin
//         CRMIsCoupledToRecord :=
//           CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId) and CRMIntegrationEnabled;
//     end;

//     trigger OnOpenPage()
//     var
//         CRMIntegrationManagement: Codeunit "CRM Integration Management";
//     begin
//         Rec.SetRange(Rec."Date Filter", 0D, WorkDate);
//         CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
//     end;

//     var
//         CRMIntegrationEnabled: Boolean;
//         CRMIsCoupledToRecord: Boolean;
// }
