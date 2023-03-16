// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1300 "Mini Customer Card"
// {
//     Caption = 'Customer Card';
//     PageType = Card;
//     PromotedActionCategories = 'New,Process,Report,New Document,Customer,History,Prices and Discounts,View,Help';
//     RefreshOnActivate = true;
//     SourceTable = Customer;

//     layout
//     {
//         area(content)
//         {
//             group(Control1)
//             {
//                 Caption = 'Customer';
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';

//                     trigger OnAssistEdit()
//                     begin
//                         if Rec.AssistEdit(xRec) then
//                             CurrPage.Update;
//                     end;
//                 }
//                 field(Name; Rec.Name)
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Promoted;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies the customer''s name. This name will appear on all sales documents for the customer. You can enter a maximum of 50 characters, both numbers and letters.';
//                 }
//                 field("<Blocked>"; BlockedCustomer)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Blocked';
//                     Enabled = DynamicEditable;
//                     OptionCaption = ' ,,,All';
//                     ToolTip = 'Specifies if transactions with the customer should be blocked, for example, because the customer is declared insolvent.';

//                     trigger OnValidate()
//                     begin
//                         if BlockedCustomer then
//                             Rec.Blocked := Rec.Blocked::All
//                         else
//                             Rec.Blocked := Rec.Blocked::" ";
//                     end;
//                 }
//                 field("Last Date Modified"; Rec."Last Date Modified")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies when the customer card was last modified.';
//                 }
//                 field(TotalSales2; GetTotalSales)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Total Sales';
//                     Style = Strong;
//                     StyleExpr = true;
//                     ToolTip = 'Specifies your total sales turnover with the customer in the current fiscal year. It is calculated from amounts excluding VAT on all completed and open sales invoices and credit memos.';
//                 }
//                 field("CustSalesLCY - CustProfit - AdjmtCostLCY"; CustSalesLCY - CustProfit - AdjmtCostLCY)
//                 {
//                     ApplicationArea = Basic;
//                     AutoFormatType = 1;
//                     Caption = 'Costs (LCY)';
//                     ToolTip = 'Specifies how much cost you have incurred from the customer in the current fiscal year. It is calculated as the sum of unit costs of all the goods you have sold to the customer. This includes any changes that occurred in your purchase prices of the goods.';
//                 }
//                 field(AdjCustProfit; AdjCustProfit)
//                 {
//                     ApplicationArea = Basic;
//                     AutoFormatType = 1;
//                     Caption = 'Profit (LCY)';
//                     Editable = false;
//                     Importance = Additional;
//                     ToolTip = 'Specifies how much profit you have made from the customer in the current fiscal year. The calculation takes into account any changes that occurred in purchase prices of the sold goods.';
//                 }
//                 field(AdjProfitPct; AdjProfitPct)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Profit %';
//                     DecimalPlaces = 1 : 1;
//                     Editable = false;
//                     Importance = Additional;
//                     ToolTip = 'Specifies how much profit you have made from the customer in the current fiscal year, expressed as a percentage of the customer''s total sales. The calculation takes into account any changes that occurred in purchase prices of the sold goods.';
//                 }
//             }
//             group("Address & Contact")
//             {
//                 Caption = 'Address & Contact';
//                 group(AddressDetails)
//                 {
//                     Caption = 'Address';
//                     field(Address; Rec.Address)
//                     {
//                         ApplicationArea = Basic;
//                         ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer. You can enter a maximum of 50 characters, both numbers and letters.';
//                     }
//                     field("Address 2"; Rec."Address 2")
//                     {
//                         ApplicationArea = Basic;
//                         ToolTip = 'Specifies a second line in the customer''s address. This address will appear on all sales documents for the customer. You can enter a maximum of 30 characters, both numbers and letters.';
//                     }
//                     field("Post Code"; Rec."Post Code")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Promoted;
//                         ToolTip = 'Specifies the customer''s post code.';
//                     }
//                     field(City; Rec.City)
//                     {
//                         ApplicationArea = Basic;
//                         ToolTip = 'Specifies the customer''s city.';
//                     }
//                     field("Country/Region Code"; Rec."Country/Region Code")
//                     {
//                         ApplicationArea = Basic;
//                         ToolTip = 'Specifies a country/region code for the customer. To see the country/region codes and address formats in the Countries/Regions window, click the field.';
//                     }
//                 }
//                 group(ContactDetails)
//                 {
//                     Caption = 'Contact';
//                     field("Phone No."; Rec."Phone No.")
//                     {
//                         ApplicationArea = Basic;
//                         ToolTip = 'Specifies the customer''s telephone number. You can enter a maximum of 30 characters, both numbers and letters.';
//                     }
//                     field("E-Mail"; Rec."E-Mail")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Promoted;
//                         ToolTip = 'Specifies the customer''s e-mail address. You can enter a maximum of 80 characters, both numbers and letters.';
//                     }
//                     field("Home Page"; Rec."Home Page")
//                     {
//                         ApplicationArea = Basic;
//                         ToolTip = 'Specifies the customer''s home page address. You can enter a maximum of 80 characters, both numbers and letters.';
//                     }
//                     field(Contact; Rec.Contact)
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Promoted;
//                         ToolTip = 'Specifies the name of the person you regularly contact when you do business with this customer. You can enter a maximum of 30 characters, both numbers and letters.';
//                     }
//                     field("Document Sending Profile"; Rec."Document Sending Profile")
//                     {
//                         ApplicationArea = Basic;
//                         ToolTip = 'Specifies the preferred method of sending documents to this customer, so that you do not have to select a sending option every time that you post and send a document to the customer. Sales documents to this customer will be sent using the specified sending profile and will override the default document sending profile.';
//                     }
//                 }
//             }
//             group(Invoicing)
//             {
//                 Caption = 'Invoicing';
//                 field("Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the maximum amount by which you allow the customer to exceed the payment balance before warnings are issued.';
//                 }
//                 field("VAT Registration No."; Rec."VAT Registration No.")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies the customer''s VAT registration number for customers in EU countries/regions. Choose the DrillDown button to use a web service that verifies if the number exists in the country''s company register.';

//                     trigger OnDrillDown()
//                     var
//                         VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
//                     begin
//                         VATRegistrationLogMgt.AssistEditCustomerVATReg(Rec);
//                     end;
//                 }
//                 field(GLN; Rec.GLN)
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Identifies the customer in connection with electronic document sending. For the PEPPOL format, the field is used as follows: If the EndPointID element in the Customer group has the SchemeID attribute set to GLN, then the element is mapped to GLN field on the customer card. If the field is blank, then the value in the VAT Registration No. field is used.';
//                 }
//                 field("Bill-to Customer No."; Rec."Bill-to Customer No.")
//                 {
//                     ApplicationArea = Basic;
//                     DrillDownPageID = "Mini Customer List";
//                     Importance = Additional;
//                     LookupPageID = "Mini Customer List";
//                     ToolTip = 'Specifies a different customer who will be invoiced for products that you sell to the customer in the Name field on the customer card.';
//                 }
//                 field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.';
//                 }
//                 field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies the customer''s VAT specification to link transactions made for this customer with the appropriate general ledger account according to the VAT posting setup.';
//                 }
//                 field("Customer Posting Group"; Rec."Customer Posting Group")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies the customer''s market type to link business transactions made for the customer with the appropriate account in the general ledger.';
//                 }
//                 field("Invoice Copies"; Rec."Invoice Copies")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies how many copies of a sales invoice for the customer will be printed at a time. For example, enter 2 if you always keep a copy in your files in addition to the one that you send to the customer.';
//                 }
//                 group(PricesandDiscounts)
//                 {
//                     Caption = 'Prices and Discounts';
//                     field("Customer Price Group"; Rec."Customer Price Group")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Promoted;
//                         ToolTip = 'Specifies the customer price group code, which you can use as a criterion to set up special sales prices in the Sales Prices window.';
//                     }
//                     field("Customer Disc. Group"; Rec."Customer Disc. Group")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Promoted;
//                         ToolTip = 'Specifies the customer discount group code, which you can use as a criterion to set up special discounts in the Sales Line Discounts window.';
//                     }
//                     field("Allow Line Disc."; Rec."Allow Line Disc.")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Additional;
//                         ToolTip = 'Specifies if a sales line discount is calculated when a special sales price is offered according to setup in the Sales Prices window.';
//                     }
//                     field("Prices Including VAT"; Rec."Prices Including VAT")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Additional;
//                         ToolTip = 'Specifies if the Unit Price and Line Amount fields on sales lines for this customer should be shown with or without VAT.';
//                     }
//                 }
//                 group(ForeignTrade)
//                 {
//                     Caption = 'Foreign Trade';
//                     field("Currency Code"; Rec."Currency Code")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Additional;
//                         ToolTip = 'Specifies the default currency for the customer. The code will be inserted on sales documents for the customer by default, but you can change it.';
//                     }
//                     field("Language Code"; Rec."Language Code")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Additional;
//                         ToolTip = 'Specifies the language to be used on printouts for this customer. In the Item Translations window, you can set up foreign language descriptions of items. If you have set these up, then the language code is used to insert the appropriate foreign text on printouts for the customer.';
//                     }
//                 }
//             }
//             group(Payments)
//             {
//                 Caption = 'Payments';
//                 field("Application Method"; Rec."Application Method")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies how to apply payments to entries for this customer. Select Manual to manually specify the document that a payment applies to. This is the default method. Select Apply to Oldest to automatically apply payments to the oldest open customer ledger entry.';
//                 }
//                 field("Payment Terms Code"; Rec."Payment Terms Code")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Promoted;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies a code that indicates the payment terms that you require of the customer. The payment terms code you define in this field is inserted on sales invoices for the customer.';
//                 }
//                 field("Payment Method Code"; Rec."Payment Method Code")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies how the customer usually submits payment, such as bank transfer or check. The payment method code that you select in this field is inserted on sales invoices for the customer.';
//                 }
//                 field("Reminder Terms Code"; Rec."Reminder Terms Code")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies how reminders about late payments are handled for this customer.';
//                 }
//                 field("Fin. Charge Terms Code"; Rec."Fin. Charge Terms Code")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies finance charges are calculated for the customer. A finance charge terms code contains information about the interest calculation method, interest rate, and so on.';
//                 }
//                 field("Print Statements"; Rec."Print Statements")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies whether to include this customer when you print the Statement report.';
//                 }
//                 field("Last Statement No."; Rec."Last Statement No.")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Shows the number of the last statement that was printed for this customer.';
//                 }
//                 field("Block Payment Tolerance"; Rec."Block Payment Tolerance")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies that the customer is not allowed a payment tolerance, for example, to exceed the maximum allowed amount by which the payment or refund can differ from the amount on the invoice or credit memo.';
//                 }
//                 field("Preferred Bank Account"; "Preferred Bank Account")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Additional;
//                     ToolTip = 'Specifies the customer''s bank account that will be used by default when you process refunds to the customer and direct debit collections.';
//                 }
//             }
//             group(Statistics)
//             {
//                 Caption = 'Statistics';
//                 Editable = false;
//                 group(Balance)
//                 {
//                     Caption = 'Balance';
//                     field("Balance (LCY)"; Rec."Balance (LCY)")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Money Owed - Current';
//                         Importance = Additional;
//                         ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';
//                     }
//                     field(GetMoneyOwedExpected; GetMoneyOwedExpected)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Money Owed - Expected';
//                         Importance = Additional;
//                         ToolTip = 'Specifies the payment amount that the customer will owe when ongoing sales invoices and credit memos are completed.';

//                         trigger OnDrillDown()
//                         begin
//                             MiniCustomerMgt.DrillDownMoneyOwedExpected(Rec."No.");
//                         end;
//                     }
//                     field("""Balance (LCY)"" + GetMoneyOwedExpected"; Rec."Balance (LCY)" + GetMoneyOwedExpected)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Money Owed - Total';
//                         Style = Strong;
//                         StyleExpr = true;
//                         ToolTip = 'Specifies the payment amount that the customer owes for completed sales plus sales that are still ongoing. The value is the sum of the values in the Money Owed - Current and Money Owed - Expected fields.';
//                     }
//                     field(CreditLimit; Rec."Credit Limit (LCY)")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Credit Limit';
//                         ToolTip = 'Specifies the maximum amount by which you allow the customer to exceed the payment balance before warnings are issued.';
//                     }
//                     field(CalcCreditLimitLCYExpendedPct; Rec.CalcCreditLimitLCYExpendedPct)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Usage Of Credit Limit';
//                         ExtendedDatatype = Ratio;
//                         Style = Attention;
//                         StyleExpr = BalanceExhausted;
//                         ToolTip = 'Specifies how much of the customer''s payment balance consists of credit. The gauge shows the value in the Money Owed - Total field as a percentage of the value in the Credit Limit field.';
//                     }
//                 }
//                 group(Control39)
//                 {
//                     Caption = 'Payments';
//                     field("Balance Due"; Rec.CalcOverdueBalance)
//                     {
//                         ApplicationArea = Basic;
//                         CaptionClass = FORMAT(STRSUBSTNO(OverduePaymentsCap, FORMAT(WORKDATE)));
//                         ToolTip = 'Specifies payments from the customer that are overdue per today''s date.';

//                         trigger OnDrillDown()
//                         var
//                             DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
//                             CustLedgEntry: Record "Cust. Ledger Entry";
//                         begin
//                             DtldCustLedgEntry.SetFilter("Customer No.", Rec."No.");
//                             Rec.Copyfilter(Rec."Global Dimension 1 Filter", DtldCustLedgEntry."Initial Entry Global Dim. 1");
//                             Rec.Copyfilter(Rec."Global Dimension 2 Filter", DtldCustLedgEntry."Initial Entry Global Dim. 2");
//                             Rec.Copyfilter(Rec."Currency Filter", DtldCustLedgEntry."Currency Code");
//                             CustLedgEntry.DrillDownOnOverdueEntries(DtldCustLedgEntry);
//                         end;
//                     }
//                     field("Payments (LCY)"; Rec."Payments (LCY)")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Payments This Year';
//                         ToolTip = 'Specifies the sum of payments received from the customer in the current fiscal year.';
//                     }
//                     field("MiniCustomerMgt.AvgDaysToPay(""No."")"; MiniCustomerMgt.AvgDaysToPay(Rec."No."))
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Average Collection Period (Days)';
//                         DecimalPlaces = 0 : 1;
//                         Importance = Additional;
//                         ToolTip = 'Specifies how long the customer typically takes to pay invoices in the current fiscal year. This is the average number of days from which invoices are issued until the customer pays the invoice.';
//                     }
//                     field(DaysPaidPastDueDate; DaysPastDueDate)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Average Late Payments (Days)';
//                         DecimalPlaces = 0 : 1;
//                         Importance = Additional;
//                         Style = Attention;
//                         StyleExpr = AttentionToPaidDay;
//                         ToolTip = 'Specifies the average number of days the customer is late with payments.';
//                     }
//                 }
//                 group("Sales This Year")
//                 {
//                     Caption = 'Sales This Year';
//                     field(GetAmountOnPostedInvoices; GetAmountOnPostedInvoices)
//                     {
//                         ApplicationArea = Basic;
//                         CaptionClass = STRSUBSTNO(PostedInvoicesCap, FORMAT(NoPostedInvoices));
//                         ToolTip = 'Specifies your sales to the customer in the current fiscal year based on completed sales invoices. The figure in parenthesis shows the number of invoices.';

//                         trigger OnDrillDown()
//                         begin
//                             MiniCustomerMgt.DrillDownOnPostedInvoices(Rec."No.")
//                         end;
//                     }
//                     field(GetAmountOnCrMemo; GetAmountOnCrMemo)
//                     {
//                         ApplicationArea = Basic;
//                         CaptionClass = STRSUBSTNO(CreditMemosCap, FORMAT(NoPostedCrMemos));
//                         ToolTip = 'Specifies your refunds to the customer in the current fiscal year based on completed sales credit memos. The figure in parenthesis shows the number of credit memos.';

//                         trigger OnDrillDown()
//                         begin
//                             MiniCustomerMgt.DrillDownOnPostedCrMemo(Rec."No.")
//                         end;
//                     }
//                     field(GetAmountOnOutstandingInvoices; GetAmountOnOutstandingInvoices)
//                     {
//                         ApplicationArea = Basic;
//                         CaptionClass = STRSUBSTNO(OutstandingInvoicesCap, FORMAT(NoOutstandingInvoices));
//                         ToolTip = 'Specifies your expected sales to the customer in the current fiscal year based on open sales invoices. The figure in parenthesis shows the number of open invoices.';

//                         trigger OnDrillDown()
//                         begin
//                             MiniCustomerMgt.DrillDownOnUnpostedInvoices(Rec."No.")
//                         end;
//                     }
//                     field(GetAmountOnOutstandingCrMemos; GetAmountOnOutstandingCrMemos)
//                     {
//                         ApplicationArea = Basic;
//                         CaptionClass = STRSUBSTNO(OutstandingCrMemosCap, FORMAT(NoOutstandingCrMemos));
//                         ToolTip = 'Specifies your expected refunds to the customer in the current fiscal year based on open sales credit memos. The figure in parenthesis shows the number of open credit memos.';

//                         trigger OnDrillDown()
//                         begin
//                             MiniCustomerMgt.DrillDownOnUnpostedCrMemos(Rec."No.")
//                         end;
//                     }
//                     field(Totals; Totals)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Total Sales';
//                         Style = Strong;
//                         StyleExpr = true;
//                         ToolTip = 'Specifies your total sales turnover with the customer in the current fiscal year. It is calculated from amounts excluding VAT on all completed and open sales invoices and credit memos.';
//                     }
//                     field(CustInvDiscAmountLCY; CustInvDiscAmountLCY)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Invoice Discounts';
//                         ToolTip = 'Specifies the total of all invoice discounts that you have granted to the customer in the current fiscal year.';
//                     }
//                 }
//                 part(AgedAccReceivableChart; "Aged Acc. Receivable Chart")
//                 {
//                     SubPageLink = "No." = field("No.");
//                     Visible = ShowCharts;
//                 }
//             }
//             part(PriceAndLineDisc; "Sales Price and Line Discounts")
//             {
//             }
//         }
//         area(factboxes)
//         {
//             part(Control159; "Office Customer Details")
//             {
//                 Caption = 'Details';
//                 SubPageLink = "No." = field("No.");
//                 Visible = false;
//             }
//             part(AgedAccReceivableChart2; "Aged Acc. Receivable Chart")
//             {
//                 SubPageLink = "No." = field("No.");
//                 Visible = false;
//             }
//             part(Control89; "CRM Statistics FactBox")
//             {
//                 SubPageLink = "No." = field("No.");
//                 Visible = CRMIsCoupledToRecord;
//             }
//             part(Control87; "Social Listening FactBox")
//             {
//                 SubPageLink = "Source Type" = const(Customer),
//                               "Source No." = field("No.");
//                 Visible = SocialListeningVisible;
//             }
//             part(Control95; "Social Listening Setup FactBox")
//             {
//                 SubPageLink = "Source Type" = const(Customer),
//                               "Source No." = field("No.");
//                 UpdatePropagation = Both;
//                 Visible = SocialListeningSetupVisible;
//             }
//             part(Control77; "Mini Sales Hist. Sell-to FactB")
//             {
//                 Caption = 'Sales History';
//                 SubPageLink = "No." = field("No."),
//                               "Currency Filter" = field("Currency Filter"),
//                               "Date Filter" = field("Date Filter"),
//                               "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
//                               "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
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
//                 action(NewSalesInvoice)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Sales Invoice';
//                     Image = Invoice;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     RunPageMode = Create;
//                     ToolTip = 'Create an invoice for the customer.';

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
//                     PromotedIsBig = true;
//                     RunPageMode = Create;
//                     ToolTip = 'Create a credit memo for the customer.';

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
//                         CRMIntegrationManagement: Codeunit "CRM Integration Management";
//                     begin
//                         CRMIntegrationManagement.UpdateOneNow(Rec.RecordId);
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
//                 action("<Recurrent Sales Lines>")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Recurring Sales Lines';
//                     Ellipsis = true;
//                     Image = CustomerCode;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category5;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "AccountantPortal Activity Cues";
//                     RunPageLink = "Customer No." = field("No.");
//                     ToolTip = 'Set up recurring sales lines for the customer, such as a monthly replenishment order, that can quickly be inserted on a sales document for the customer.';
//                 }
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
//                     ToolTip = 'Set up information about the customer''s bank account.';
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
//                     ToolTip = 'Set up the alternate address where the customer wants the item delivered if different from its regular address.';
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
//                     ToolTip = 'Set up the customer''s own identification of items that you sell to the customer. Cross-references to the customer''s item number means that that item number is automatically shown on sales documents instead of the number that you use.';
//                 }
//                 action("Online Map")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Online Map';
//                     Image = Map;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     ToolTip = 'View the customer''s address on your preferred map website.';

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
//                     ShortCutKey = 'Shift+Ctrl+D';
//                     ToolTip = 'Set up default dimensions for the customer, such as an area or customer group code. You can assign dimension codes to transactions to distribute costs and analyze historical information.';
//                 }
//                 action(CustomerReportSelections)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Document Layouts';
//                     Image = Quote;

//                     trigger OnAction()
//                     var
//                         CustomReportSelection: Record "Custom Report Selection";
//                     begin
//                         CustomReportSelection.SetRange("Source Type", Database::Customer);
//                         CustomReportSelection.SetRange("Source No.", Rec."No.");
//                         Page.RunModal(Page::"Customer Report Selections", CustomReportSelection);
//                     end;
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
//                     ShortCutKey = 'Ctrl+F7';
//                     ToolTip = 'View the history of transactions for the customer.';
//                 }
//             }
//             group(PricesandDiscounts)
//             {
//                 Caption = 'Prices and Discounts';
//                 Image = Sales;
//                 action("Invoice &Discounts")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Invoice &Discounts';
//                     Image = CalculateInvoiceDiscount;
//                     Promoted = true;
//                     PromotedCategory = Category7;
//                     PromotedIsBig = true;
//                     RunObject = Page "Cust. Invoice Discounts";
//                     RunPageLink = Code = field("Invoice Disc. Code");
//                     ToolTip = 'Set up different discounts that are applied to invoices for the customer. An invoice discount is automatically granted to the customer when the total on a sales invoice exceeds a certain amount.';
//                 }
//                 action(Prices)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Prices';
//                     Image = Price;
//                     RunObject = Page "Sales Prices";
//                     RunPageLink = "Sales Type" = const(Customer),
//                                   "Sales Code" = field("No.");
//                     RunPageView = sorting("Sales Type", "Sales Code");
//                     ToolTip = 'Set up different prices for items that you sell to the customer. An item price is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
//                 }
//                 action("Line Discounts")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Line Discounts';
//                     Image = LineDiscount;
//                     RunObject = Page "Sales Line Discounts";
//                     RunPageLink = "Sales Type" = const(Customer),
//                                   "Sales Code" = field("No.");
//                     RunPageView = sorting("Sales Type", "Sales Code");
//                     ToolTip = 'Set up different discounts for items that you sell to the customer. An item discount is automatically granted on invoice lines when the specified criteria are met, such as customer, quantity, or ending date.';
//                 }
//             }
//             group(DataTemplate)
//             {
//                 Caption = 'Data Template';
//                 action(SaveAsTemplate)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Save as Template';
//                     Ellipsis = true;
//                     Image = Save;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = New;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     ToolTip = 'Save the customer card as a template that can be reused to create new customer cards. Customer templates contain preset information to help you fill fields on customer cards.';

//                     trigger OnAction()
//                     var
//                         TempMiniCustomerTemplate: Record "Mini Customer Template" temporary;
//                     begin
//                         TempMiniCustomerTemplate.SaveAsTemplate(Rec);
//                     end;
//                 }
//                 action(Templates)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Templates';
//                     Image = Template;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     RunObject = Page "Config Templates";
//                     RunPageView = where("Table ID" = const(18));
//                     ToolTip = 'View or edit customer templates.';
//                 }
//             }
//             group(Reports)
//             {
//                 Caption = 'Reports';
//                 Image = Reports;
//                 group(FinanceReports)
//                 {
//                     Caption = 'Finance Reports';
//                     Image = "Report";
//                     action("Report Customer Detailed Aging")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer - Detailed Aging';
//                         Image = "Report";
//                         ToolTip = 'View, print, or save a detailed list of each customer''s total payments due, divided into three time periods. The report can be used to decide when to issue reminders, to evaluate a customer''s creditworthiness, or to prepare liquidity analyses.';

//                         trigger OnAction()
//                         var
//                             Customer: Record Customer;
//                         begin
//                             Customer.SetRange("No.", Rec."No.");
//                             Report.RunModal(Report::"Customer Detailed Aging", true, true, Customer);
//                         end;
//                     }
//                     action("Report Customer - Balance to Date")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer - Balance to Date';
//                         Image = "Report";
//                         ToolTip = 'View, print, or save a list with customers'' payment history up until a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.';

//                         trigger OnAction()
//                         var
//                             Customer: Record Customer;
//                         begin
//                             Customer.SetRange("No.", Rec."No.");
//                             Report.RunModal(Report::"Customer - Balance to Date", true, true, Customer);
//                         end;
//                     }
//                     action("Report Statement")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Statement';
//                         Image = "Report";
//                         ToolTip = 'View, print, or save a list of a customer''s transactions for a selected period, for example, to send to the customer at the close of an accounting period. You can choose to have all overdue balances displayed regardless of the period specified, or you can choose to include an aging band.';

//                         trigger OnAction()
//                         var
//                             Customer: Record Customer;
//                         begin
//                             Customer.SetRange("No.", Rec."No.");
//                             Report.RunModal(Report::Statement, true, true, Customer);
//                         end;
//                     }
//                 }
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     var
//         CRMCouplingManagement: Codeunit "CRM Coupling Management";
//     begin
//         GetSalesPricesAndSalesLineDisc;

//         DynamicEditable := CurrPage.Editable;

//         CRMIsCoupledToRecord :=
//           CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId) and CRMIntegrationEnabled;
//     end;

//     trigger OnAfterGetRecord()
//     var
//         AgedAccReceivable: Codeunit "Aged Acc. Receivable";
//     begin
//         BlockedCustomer := (Rec.Blocked = Rec.Blocked::All);
//         BalanceExhausted := 10000 <= Rec.CalcCreditLimitLCYExpendedPct;

//         DaysPastDueDate := AgedAccReceivable.InvoicePaymentDaysAverage(Rec."No.");
//         AttentionToPaidDay := DaysPastDueDate > 0;

//         SetSocialListeningFactboxVisibility;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     var
//         MiniCustomerTemplate: Record "Mini Customer Template";
//         Customer: Record Customer;
//         NewCustomerCode: Code[20];
//     begin
//         if Rec."No." = '' then
//             NewCustomerCode := MiniCustomerTemplate.NewCustomerFromTemplate;
//         if NewCustomerCode = '' then begin
//             CurrPage.Close;
//             exit;
//         end;
//         Rec.Get(NewCustomerCode);
//         if Customer.Get(Rec."No.") then
//             Customer.Delete(true);
//     end;

//     trigger OnOpenPage()
//     var
//         CRMIntegrationManagement: Codeunit "CRM Integration Management";
//     begin
//         CurrPage.PriceAndLineDisc.Page.InitPage(false);
//         ShowCharts := Rec."No." <> '';
//         if ShowCharts then begin
//             CurrPage.AgedAccReceivableChart.Page.SetPerCustomer;
//             CurrPage.AgedAccReceivableChart2.Page.SetPerCustomer;
//         end;

//         Rec.SetFilter(Rec."Date Filter", MiniCustomerMgt.GetCurrentYearFilter);

//         CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
//     end;

//     var
//         MiniCustomerMgt: Codeunit "Customer Mgt.";
//         BlockedCustomer: Boolean;
//         DynamicEditable: Boolean;
//         OverduePaymentsCap: label 'Overdue Payments as of %1', Comment = 'Overdue Payments as of 27-02-2012';
//         [InDataSet]
//         ShowCharts: Boolean;
//         CustSalesLCY: Decimal;
//         AdjmtCostLCY: Decimal;
//         AdjCustProfit: Decimal;
//         CustProfit: Decimal;
//         AdjProfitPct: Decimal;
//         CustInvDiscAmountLCY: Decimal;
//         CustPaymentsLCY: Decimal;
//         BalanceExhausted: Boolean;
//         PostedInvoicesCap: label 'Posted Invoices (%1)', Comment = 'Invoices (5)';
//         CreditMemosCap: label 'Posted Credit Memos (%1)', Comment = 'Credit Memos (3)';
//         OutstandingInvoicesCap: label 'Ongoing Invoices (%1)', Comment = 'Ongoing Invoices (4)';
//         NoPostedInvoices: Integer;
//         NoPostedCrMemos: Integer;
//         NoOutstandingInvoices: Integer;
//         NoOutstandingCrMemos: Integer;
//         AmountOnPostedInvoices: Decimal;
//         AmountOnPostedCrMemos: Decimal;
//         OutstandingCrMemosCap: label 'Ongoing Credit Memos (%1)', Comment = 'Ongoing Credit Memos (4)';
//         AmountOnOutstandingInvoices: Decimal;
//         AmountOnOutstandingCrMemos: Decimal;
//         Totals: Decimal;
//         DaysPastDueDate: Decimal;
//         AttentionToPaidDay: Boolean;
//         [InDataSet]
//         SocialListeningSetupVisible: Boolean;
//         [InDataSet]
//         SocialListeningVisible: Boolean;
//         CRMIntegrationEnabled: Boolean;
//         CRMIsCoupledToRecord: Boolean;

//     local procedure GetTotalSales(): Decimal
//     begin
//         NoPostedInvoices := 0;
//         NoPostedCrMemos := 0;
//         NoOutstandingInvoices := 0;
//         NoOutstandingCrMemos := 0;
//         Totals := 0;

//         AmountOnPostedInvoices := MiniCustomerMgt.CalcAmountsOnPostedInvoices(Rec."No.", NoPostedInvoices);
//         AmountOnPostedCrMemos := MiniCustomerMgt.CalcAmountsOnPostedCrMemos(Rec."No.", NoPostedCrMemos);

//         AmountOnOutstandingInvoices := MiniCustomerMgt.CalculateAmountsOnUnpostedInvoices(Rec."No.", NoOutstandingInvoices);
//         AmountOnOutstandingCrMemos := MiniCustomerMgt.CalculateAmountsOnUnpostedCrMemos(Rec."No.", NoOutstandingCrMemos);

//         Totals := AmountOnPostedInvoices + AmountOnPostedCrMemos + AmountOnOutstandingInvoices + AmountOnOutstandingCrMemos;

//         MiniCustomerMgt.CalculateStatistic(
//           Rec,
//           AdjmtCostLCY, AdjCustProfit, AdjProfitPct,
//           CustInvDiscAmountLCY, CustPaymentsLCY, CustSalesLCY,
//           CustProfit);
//         exit(Totals)
//     end;

//     local procedure GetAmountOnPostedInvoices(): Decimal
//     begin
//         exit(AmountOnPostedInvoices)
//     end;

//     local procedure GetAmountOnCrMemo(): Decimal
//     begin
//         exit(AmountOnPostedCrMemos)
//     end;

//     local procedure GetAmountOnOutstandingInvoices(): Decimal
//     begin
//         exit(AmountOnOutstandingInvoices)
//     end;

//     local procedure GetAmountOnOutstandingCrMemos(): Decimal
//     begin
//         exit(AmountOnOutstandingCrMemos)
//     end;

//     local procedure GetMoneyOwedExpected(): Decimal
//     begin
//         exit(MiniCustomerMgt.CalculateAmountsWithVATOnUnpostedDocuments(Rec."No."))
//     end;

//     local procedure GetSalesPricesAndSalesLineDisc()
//     begin
//         if Rec."No." <> CurrPage.PriceAndLineDisc.Page.GetLoadedCustNo then begin
//             CurrPage.PriceAndLineDisc.Page.LoadCustomer(Rec);
//             CurrPage.PriceAndLineDisc.Page.Update(false);
//         end;
//     end;

//     local procedure SetSocialListeningFactboxVisibility()
//     var
//         SocialListeningMgt: Codeunit 871;
//     begin
//         SocialListeningMgt.GetCustFactboxVisibility(Rec, SocialListeningSetupVisible, SocialListeningVisible);
//     end;
// }
