// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1324 "Mini Sales Quote"
// {
//     Caption = 'Sales Quote';
//     PageType = Document;
//     PromotedActionCategories = 'New,Process,Report,Quote,Posting,View';
//     RefreshOnActivate = true;
//     SourceTable = "Sales Header";
//     SourceTableView = where("Document Type" = filter(Quote));

//     layout
//     {
//         area(content)
//         {
//             group(SalesQuote)
//             {
//                 Caption = 'Sales Quote';
//                 group(Control13)
//                 {
//                     field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Customer Name';
//                         NotBlank = true;
//                         ShowMandatory = true;
//                         ToolTip = 'Specifies the name of the customer who will receive the products and be billed by default. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';

//                         trigger OnLookup(var Text: Text): Boolean
//                         begin
//                             if MiniCustomerMgt.LookupSellToCustomer(Rec, xRec) then
//                                 CurrPage.Update;
//                         end;

//                         trigger OnValidate()
//                         begin
//                             if MiniCustomerMgt.ValidateSellToCustomer(Rec, xRec) then
//                                 CurrPage.Update;
//                         end;
//                     }
//                     field("Sell-to Address"; Rec."Sell-to Address")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Address';
//                         ToolTip = 'Specifies the address where the customer is located. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                     }
//                     field("Sell-to Address 2"; Rec."Sell-to Address 2")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Address 2';
//                         ToolTip = 'Specifies an additional part of the address where the customer is located. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                     }
//                     field("Sell-to Post Code"; Rec."Sell-to Post Code")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Post Code';
//                         ToolTip = 'Specifies the post code where the customer is located. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                     }
//                     field("Sell-to City"; Rec."Sell-to City")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'City';
//                         ToolTip = 'Specifies the name of the city where the customer is located. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                     }
//                 }
//                 group(Control15)
//                 {
//                     field("Sell-to Contact"; Rec."Sell-to Contact")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Contact';
//                         ToolTip = 'Specifies the name of the person to contact at the customer. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                     }
//                     field("Document Date"; Rec."Document Date")
//                     {
//                         ApplicationArea = Basic;
//                         ToolTip = 'Specifies the date on which you create the sales document. The date will appear on the printed sales document. By default, today''s date is entered.';
//                     }
//                     field("Requested Delivery Date"; Rec."Requested Delivery Date")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Promoted;
//                         ToolTip = 'Specifies the date that the customer has asked for the order to be delivered. The shipment date is calculated from this field. If you leave the field empty, the earliest possible delivery date is calculated and inserted.';
//                     }
//                     field("Shipment Date"; Rec."Shipment Date")
//                     {
//                         ApplicationArea = Basic;
//                         ToolTip = 'Specifies the date you expect to ship items on the sales document. By default, today''s date is entered.';
//                     }
//                     field(Status; Rec.Status)
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Promoted;
//                         ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
//                         Visible = false;
//                     }
//                     field("Due Date"; Rec."Due Date")
//                     {
//                         ApplicationArea = Basic;
//                         Importance = Promoted;
//                         ToolTip = 'Specifies when the sales invoice must be paid. By default, the field is calculated as the date in the Shipment Date field plus the period defined in the Payment Terms Code field.';
//                     }
//                 }
//             }
//             group(QuoteDetails)
//             {
//                 Caption = 'Quote Details';
//                 Visible = ShowDetailsTab;
//                 field("Currency Code"; Rec."Currency Code")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies the currency of amounts on the sales document. By default, the field is filled with the value in the Currency Code field on the customer card.';

//                     trigger OnAssistEdit()
//                     begin
//                         Clear(ChangeExchangeRate);
//                         if Rec."Posting Date" <> 0D then
//                             ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
//                         else
//                             ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
//                         if ChangeExchangeRate.RunModal = Action::OK then begin
//                             Rec.Validate(Rec."Currency Factor", ChangeExchangeRate.GetParameter);
//                             CurrPage.Update;
//                         end;
//                         Clear(ChangeExchangeRate);
//                     end;

//                     trigger OnValidate()
//                     begin
//                         CurrPage.Update;
//                         MiniSalesCalcDiscByType.ApplyDefaultInvoiceDiscount(0, Rec);
//                     end;
//                 }
//                 field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the customer''s VAT specification to link transactions made for this customer with the appropriate general ledger account according to the VAT posting setup.';

//                     trigger OnValidate()
//                     begin
//                         CurrPage.Update;
//                         MiniSalesCalcDiscByType.ApplyDefaultInvoiceDiscount(0, Rec);
//                     end;
//                 }
//                 field("Prices Including VAT"; Rec."Prices Including VAT")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies whether the unit price on the line should be displayed including or excluding VAT.';
//                     Visible = false;

//                     trigger OnValidate()
//                     begin
//                         CurrPage.Update;
//                         Rec.CalcFields(Rec."Invoice Discount Amount");
//                         MiniSalesCalcDiscByType.ApplyDefaultInvoiceDiscount(Rec."Invoice Discount Amount", Rec);
//                     end;
//                 }
//                 field("Payment Terms Code"; Rec."Payment Terms Code")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount on the sales document. By default, the payment term from the customer card is entered.';
//                 }
//                 field("Payment Method Code"; Rec."Payment Method Code")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies how payment for the sales document must be submitted, such as bank transfer or check. By default, the payment method from the customer card is entered.';
//                 }
//                 field("Transaction Type"; Rec."Transaction Type")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the number for the transaction type, for the purpose of reporting to INTRASTAT.';
//                 }
//             }
//             group(BillToAndShipToAddresses)
//             {
//                 Caption = 'Ship-to and Bill-to Addresses';
//                 Visible = ShowBillToShipToTab;
//                 group(ShipToAddress)
//                 {
//                     Caption = 'Ship-to Address';
//                     field("Ship-to Code"; Rec."Ship-to Code")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Address Code';
//                         Importance = Promoted;
//                         ToolTip = 'Specifies the code for another shipment address than the customer''s own address, which is entered by default. To ship products on the sales document to another address, choose the button in the Ship-to Code field and select a code that represents a ship-to address.';
//                     }
//                     field("Ship-to Name"; Rec."Ship-to Name")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Name';
//                         ToolTip = 'Specifies the name that products on the sales document will be shipped to. By default, the field is filled with the value in the Name field on the customer card or with the value in the Name field in the Ship-to Address window.';
//                     }
//                     field("Ship-to Address"; Rec."Ship-to Address")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Address';
//                         ToolTip = 'Specifies the address that products on the sales document will be shipped to. By default, the field is filled with the value in the Address field on the customer card or with the value in the Address field in the Ship-to Address window.';
//                     }
//                     field("Ship-to Address 2"; Rec."Ship-to Address 2")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Address 2';
//                         ToolTip = 'Specifies the second part of the address that products on the sales document will be shipped to. By default, the field is filled with the value in the Address 2 field on the customer card or with the value in the Address 2 field in the Ship-to Address window.';
//                     }
//                     field("Ship-to Post Code"; Rec."Ship-to Post Code")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Post Code';
//                         ToolTip = 'Specifies the post code of the customer''s shipping address.';
//                     }
//                     field("Ship-to City"; Rec."Ship-to City")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'City';
//                         ToolTip = 'Specifies the city name of the address that products on the sales document will be shipped to. By default, the field is filled with the value in the City field on the customer card or with the value in the City field in the Ship-to Address window.';
//                     }
//                     field("Ship-to Contact"; Rec."Ship-to Contact")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Contact';
//                         ToolTip = 'Specifies the name of the contact person at the address that products on the sales document will be shipped to. By default, the field is filled with the value in the Primary Contact No. field on the customer card.';
//                     }
//                 }
//                 group(BillToCustomer)
//                 {
//                     Caption = 'Bill-to Customer';
//                     field("Bill-to Name"; Rec."Bill-to Name")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Name';
//                         ToolTip = 'Specifies the customer to whom you will send the sales invoice, when different from the customer that you are selling to. By default, the name and address of the customer that you are selling to is entered.';

//                         trigger OnLookup(var Text: Text): Boolean
//                         begin
//                             if MiniCustomerMgt.LookupBillToCustomer(Rec, xRec) then
//                                 CurrPage.Update;
//                         end;

//                         trigger OnValidate()
//                         begin
//                             if MiniCustomerMgt.ValidateBillToCustomer(Rec, xRec) then
//                                 CurrPage.Update;
//                         end;
//                     }
//                     field("Bill-to Address"; Rec."Bill-to Address")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Address';
//                         ToolTip = 'Specifies the address of the customer that you will send the invoice to.';
//                     }
//                     field("Bill-to Address 2"; Rec."Bill-to Address 2")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Address 2';
//                         ToolTip = 'Contains another line of the address of the customer that you will send the invoice to.';
//                     }
//                     field("Bill-to Post Code"; Rec."Bill-to Post Code")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Post Code';
//                         ToolTip = 'Specifies the post code of the customer''s billing address.';
//                     }
//                     field("Bill-to City"; Rec."Bill-to City")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'City';
//                         ToolTip = 'Specifies the city name of the customer that you will send the invoice to.';
//                     }
//                     field("Bill-to Contact"; Rec."Bill-to Contact")
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Contact';
//                         ToolTip = 'Specifies the name of the person you should contact at the customer that you are sending the invoice to.';
//                     }
//                 }
//             }
//             part(SalesLines; "Mini Sales Quote Subform")
//             {
//                 SubPageLink = "Document No." = field("No.");
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group(Process)
//             {
//                 Caption = 'Process';
//                 action(MakeInvoice)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Make Invoice';
//                     Image = MakeOrder;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ToolTip = 'Convert the sales quote to a sales invoice.';

//                     trigger OnAction()
//                     begin
//                         MiniLinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);
//                         Codeunit.Run(Codeunit::"Sales-Quote to Invoice Yes/No", Rec);
//                     end;
//                 }
//                 action(Print)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = '&Print';
//                     Ellipsis = true;
//                     Image = Print;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ToolTip = 'Print the sales quote.';

//                     trigger OnAction()
//                     begin
//                         MiniLinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);
//                         DocPrint.PrintSalesHeader(Rec);
//                     end;
//                 }
//                 action(Email)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = '&Email';
//                     Image = Email;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ToolTip = 'Attach the sales quote to an email to the customer.';
//                     Visible = not (OutlookComposeFormAvailable or OutlookReadFormAvailable);

//                     trigger OnAction()
//                     var
//                         ReportDistributionManagement: Codeunit "Report Distribution Management";
//                     begin
//                         MiniLinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);
//                         ReportDistributionManagement.EmailDocumentReport(Rec);
//                     end;
//                 }
//                 action(Attach)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Attach';
//                     Image = Email;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     Visible = OutlookReadFormAvailable or OutlookComposeFormAvailable;

//                     trigger OnAction()
//                     var
//                         TempBlob: Record TempBlob;
//                         ReportDistributionManagement: Codeunit "Report Distribution Management";
//                     begin
//                         MiniLinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);
//                         ReportDistributionManagement.GetReportPDFAsBlob(Rec, TempBlob);

//                         if OutlookReadFormAvailable then
//                             OfficeHost.InvokeExtensionAsync('replyWithAttachment', TempBlob.Blob, QuotePdfTxt);
//                     end;
//                 }
//             }
//             group(Quote)
//             {
//                 Caption = '&Quote';
//                 Image = Invoice;
//                 action(Customer)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Customer';
//                     Enabled = CustomerSelected;
//                     Image = Customer;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     RunObject = Page "Mini Customer Card";
//                     RunPageLink = "No." = field("Sell-to Customer No.");
//                     ShortCutKey = 'Shift+F7';
//                     ToolTip = 'View or edit detailed information about the customer.';
//                 }
//                 action(GetRecurringSalesLines)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Get Recurring Sales Lines';
//                     Ellipsis = true;
//                     Image = CustomerCode;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category4;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     ToolTip = 'Insert sales document lines that you have set up for the customer as recurring. Recurring sales lines could be for a monthly replenishment order or a fixed freight expense.';

//                     trigger OnAction()
//                     var
//                         StdCustSalesCode: Record "Standard Customer Sales Code";
//                     begin
//                         Rec.TestField(Rec."No.");
//                         Rec.TestField(Rec."Sell-to Customer No.");

//                         StdCustSalesCode.FilterGroup := 2;
//                         StdCustSalesCode.SetRange("Customer No.", Rec."Sell-to Customer No.");
//                         StdCustSalesCode.FilterGroup := 0;

//                         if Page.RunModal(Page::"Mini Std Customer Sales Codes", StdCustSalesCode) = Action::LookupOK then
//                             StdCustSalesCode.ApplyStdCodesToSalesLines(Rec, StdCustSalesCode);
//                     end;
//                 }
//                 action(CopyDocument)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Copy Document';
//                     Ellipsis = true;
//                     Image = CopyDocument;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = New;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     ToolTip = 'Copy document lines and header information from another sales document to this document. You can copy a sales invoice into a sales quote to quickly create a similar document.';

//                     trigger OnAction()
//                     begin
//                         CopySalesDoc.SetSalesHeader(Rec);
//                         CopySalesDoc.RunModal;
//                         Clear(CopySalesDoc);
//                     end;
//                 }
//                 action(Dimensions)
//                 {
//                     AccessByPermission = TableData Dimension = R;
//                     ApplicationArea = Basic;
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Shift+Ctrl+D';
//                     ToolTip = 'View or edit the dimension sets that are set up for the customer on the sales document.';

//                     trigger OnAction()
//                     begin
//                         Rec.ShowDocDim;
//                         CurrPage.SaveRecord;
//                     end;
//                 }
//             }
//             group(View)
//             {
//                 Caption = 'View';
//                 action("Ship-to and Bill-to Address")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Ship-to and Bill-to Address';
//                     Image = ShipAddress;
//                     Promoted = true;
//                     PromotedCategory = Category6;
//                     PromotedIsBig = true;
//                     ToolTip = 'Show fields for the customer''s shipping and billing addresses. You can specify a different address where the item or service is delivered or specify a different address where the document is sent.';

//                     trigger OnAction()
//                     begin
//                         ShowBillToShipToTab := not ShowBillToShipToTab;
//                     end;
//                 }
//                 action(QuoteDetails)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Quote Details';
//                     Image = TaxDetail;
//                     Promoted = true;
//                     PromotedCategory = Category6;
//                     PromotedIsBig = true;
//                     ToolTip = 'Show fields for quote details, such as currency, and payment terms.';

//                     trigger OnAction()
//                     begin
//                         ShowDetailsTab := not ShowDetailsTab;
//                     end;
//                 }
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     begin
//         CustomerSelected := Rec."Sell-to Customer No." <> '';
//     end;

//     trigger OnDeleteRecord(): Boolean
//     begin
//         CurrPage.SaveRecord;
//         exit(Rec.ConfirmDeletion);
//     end;

//     trigger OnInit()
//     begin
//         ShowBillToShipToTab := false;
//         ShowDetailsTab := false;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         Rec."Responsibility Center" := UserSetupManagement.GetSalesFilter;
//     end;

//     trigger OnOpenPage()
//     begin
//         if UserSetupManagement.GetSalesFilter <> '' then begin
//             Rec.FilterGroup(2);
//             Rec.SetRange(Rec."Responsibility Center", UserSetupManagement.GetSalesFilter);
//             Rec.FilterGroup(0);
//         end;

//         if OfficeHost.IsAvailable then begin
//             OfficeHost := OfficeHost.Create;
//             if OfficeHost.HostType = 'Outlook-ItemEdit' then
//                 OutlookComposeFormAvailable := true;
//             if OfficeHost.HostType = 'Outlook-ItemRead' then
//                 OutlookReadFormAvailable := true;
//         end;
//     end;

//     var
//         CopySalesDoc: Report "Copy Sales Document";
//         UserSetupManagement: Codeunit "User Setup Management";
//         MiniSalesCalcDiscByType: Codeunit 1300;
//         MiniCustomerMgt: Codeunit "Customer Mgt.";
//         DocPrint: Codeunit "Document-Print";
//         MiniLinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
//         ChangeExchangeRate: Page "Change Exchange Rate";
//         [RunOnClient]
//         OfficeHost: dotnet OfficeHost;
//         ShowBillToShipToTab: Boolean;
//         ShowDetailsTab: Boolean;
//         CustomerSelected: Boolean;
//         OutlookComposeFormAvailable: Boolean;
//         OutlookReadFormAvailable: Boolean;
//         QuotePdfTxt: label 'Quote.pdf';
// }
