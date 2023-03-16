// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1319 "Mini Sales Credit Memo"
// {
//     Caption = 'Sales Credit Memo';
//     PageType = Document;
//     PromotedActionCategories = 'New,Process,Report,Credit Memo,Posting,View';
//     RefreshOnActivate = true;
//     SourceTable = "Sales Header";
//     SourceTableView = where("Document Type" = filter("Credit Memo"));

//     layout
//     {
//         area(content)
//         {
//             group(SalesCreditMemo)
//             {
//                 Caption = 'Sales Credit Memo';
//                 field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Customer Name';
//                     DrillDownPageID = "Mini Customer List";
//                     LookupPageID = "Mini Customer List";
//                     NotBlank = true;
//                     ShowMandatory = true;
//                     TableRelation = Customer.Name;
//                     ToolTip = 'Specifies the name of the customer who will receive the products and be billed by default. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';

//                     trigger OnValidate()
//                     var
//                         NewCustomerNo: Code[20];
//                     begin
//                         if Rec."No." = '' then
//                             Rec.InitRecord;
//                         if (Rec."Sell-to Customer Name" <> xRec."Sell-to Customer Name")
//                         then begin
//                             NewCustomerNo := GetCustNoByName(Rec."Sell-to Customer Name");
//                             Rec.Validate(Rec."Sell-to Customer No.", NewCustomerNo);
//                         end;
//                         CurrPage.Update;
//                         MiniSalesCalcDiscByType.ApplyDefaultInvoiceDiscount(0, Rec);
//                     end;
//                 }
//                 field("Sell-to Address"; Rec."Sell-to Address")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Address';
//                     ToolTip = 'Specifies the address where the customer is located. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                 }
//                 field("Sell-to Address 2"; Rec."Sell-to Address 2")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Address 2';
//                     ToolTip = 'Specifies an additional part of the address where the customer is located. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                 }
//                 field("Sell-to Post Code"; Rec."Sell-to Post Code")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Post Code';
//                     ToolTip = 'Specifies the post code where the customer is located. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                 }
//                 field("Sell-to City"; Rec."Sell-to City")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'City';
//                     ToolTip = 'Specifies the name of the city where the customer is located. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                 }
//                 field("Sell-to Contact"; Rec."Sell-to Contact")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Contact';
//                     ToolTip = 'Specifies the name of the person to contact at the customer. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                 }
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies the date when the posting of the sales document will be recorded. By default, today''s date is entered.';
//                 }
//                 field("Document Date"; Rec."Document Date")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the date on which you create the sales document. The date will appear on the printed sales document. By default, today''s date is entered.';
//                 }
//                 field("Due Date"; Rec."Due Date")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies when the sales invoice must be paid. By default, the field is calculated as the date in the Shipment Date field plus the period defined in the Payment Terms Code field.';
//                 }
//                 field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'You can use this field if you want the invoice, when you post it, to be applied to a document that has already been posted. In this case, enter here the type of document that it should be applied to.';
//                 }
//                 field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'You can use this field if you want to apply the invoice to a document that has already been posted. If so, enter the number of the document that the invoice should be applied to.';
//                 }
//                 field("Applies-to ID"; Rec."Applies-to ID")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the applies-to ID of entries that will be applied to by the sales document if you use the Apply Entries function.';
//                 }
//             }
//             group(CreditMemoDetails)
//             {
//                 Caption = 'Credit Memo Details';
//                 Visible = ShowDetailsTab;
//                 field("Currency Code"; Rec."Currency Code")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies the currency of amounts on the sales document. By default, the field is filled with the value in the Currency Code field on the customer card.';

//                     trigger OnAssistEdit()
//                     var
//                         ChangeExchangeRate: Page "Change Exchange Rate";
//                     begin
//                         if Rec."Posting Date" <> 0D then
//                             ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date")
//                         else
//                             ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", WorkDate);
//                         if ChangeExchangeRate.RunModal = Action::OK then begin
//                             Rec.Validate(Rec."Currency Factor", ChangeExchangeRate.GetParameter);
//                             CurrPage.Update;
//                         end;
//                     end;

//                     trigger OnValidate()
//                     begin
//                         CurrPage.Update;
//                         MiniSalesCalcDiscByType.ApplyDefaultInvoiceDiscount(0, Rec);
//                     end;
//                 }
//                 field("Shipment Date"; Rec."Shipment Date")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the date you expect to ship items on the sales document. By default, today''s date is entered.';
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
//                 field(Status; Rec.Status)
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
//                     Visible = false;
//                 }
//                 field("Transaction Type"; Rec."Transaction Type")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the number for the transaction type, for the purpose of reporting to INTRASTAT.';
//                 }
//             }
//             group(BilltoandShiptoAddresses)
//             {
//                 Caption = 'Bill-to Customer Addresses';
//                 Visible = ShowBillToShipToTab;
//                 field("Bill-to Name"; Rec."Bill-to Name")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Name';
//                     DrillDownPageID = "Mini Customer List";
//                     LookupPageID = "Mini Customer List";
//                     TableRelation = Customer.Name;
//                     ToolTip = 'Specifies the customer to whom you will send the sales invoice, when different from the customer that you are selling to. By default, the name and address of the customer that you are selling to is entered.';

//                     trigger OnValidate()
//                     var
//                         MiniCustomerMgt: Codeunit "Customer Mgt.";
//                         NewCustomerNo: Code[20];
//                     begin
//                         if Rec."Bill-to Name" <> xRec."Bill-to Name" then begin
//                             NewCustomerNo := MiniCustomerMgt.GetCustNoByName(Rec."Bill-to Name");
//                             Rec.Validate(Rec."Bill-to Customer No.", NewCustomerNo);
//                         end;
//                         CurrPage.Update;
//                         MiniSalesCalcDiscByType.ApplyDefaultInvoiceDiscount(0, Rec);
//                     end;
//                 }
//                 field("Bill-to Address"; Rec."Bill-to Address")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Address';
//                     ToolTip = 'Specifies the address of the customer that you will send the invoice to.';
//                 }
//                 field("Bill-to Address 2"; Rec."Bill-to Address 2")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Address 2';
//                     ToolTip = 'Contains another line of the address of the customer that you will send the invoice to.';
//                 }
//                 field("Bill-to Post Code"; Rec."Bill-to Post Code")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Post Code';
//                     ToolTip = 'Specifies the post code of the customer''s billing address.';
//                 }
//                 field("Bill-to City"; Rec."Bill-to City")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'City';
//                     ToolTip = 'Specifies the city name of the customer that you will send the invoice to.';
//                 }
//                 field("Bill-to Contact"; Rec."Bill-to Contact")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Contact';
//                     ToolTip = 'Specifies the name of the person you should contact at the customer that you are sending the invoice to.';
//                 }
//             }
//             part(SalesLines; ExcelTemplateCompanyInfo)
//             {
//                 SubPageLink = "Document No." = field("No.");
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group("Credit Memo")
//             {
//                 Caption = '&Credit Memo';
//                 Image = CreditMemo;
//                 action(Customer)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Customer';
//                     Image = Customer;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     RunObject = Page "Mini Customer Card";
//                     RunPageLink = "No." = field("Sell-to Customer No.");
//                     ShortCutKey = 'Shift+F7';
//                     ToolTip = 'View or edit detailed information about the customer on the sales document.';
//                 }
//                 action("Copy Document")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Copy Document';
//                     Ellipsis = true;
//                     Image = CopyDocument;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = New;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     ToolTip = 'Copy fields and document lines from another document to this document.';

//                     trigger OnAction()
//                     var
//                         CopySalesDoc: Report "Copy Sales Document";
//                     begin
//                         CopySalesDoc.SetSalesHeader(Rec);
//                         CopySalesDoc.RunModal;
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
//             group(Apply)
//             {
//                 Caption = 'Apply';
//                 action(ApplyEntries)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Apply Entries';
//                     Ellipsis = true;
//                     Image = ApplyEntries;
//                     Promoted = false;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Process;
//                     RunObject = Codeunit "Sales Header Apply";
//                     ShortCutKey = 'Shift+F11';
//                     ToolTip = 'Select one or more posted sales documents that you want the sales credit memo to be applied to.';
//                 }
//             }
//             group(Posting)
//             {
//                 Caption = 'P&osting';
//                 Image = Post;
//                 action(Post)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'P&ost';
//                     Image = PostOrder;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'F9';
//                     ToolTip = 'Finalize the sales document. Posting updates your books with the document''s amounts and quantities.';

//                     trigger OnAction()
//                     begin
//                         Post(Codeunit::"Sales-Post (Yes/No)");
//                     end;
//                 }
//                 action(PostAndSend)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Post and &Send';
//                     Ellipsis = true;
//                     Image = PostSendTo;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     ToolTip = 'Finalize and send the sales document.';

//                     trigger OnAction()
//                     begin
//                         Rec.SendToPosting(Codeunit::"Sales-Post and Send");
//                     end;
//                 }
//                 action(Printer)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = '&Print';
//                     Ellipsis = true;
//                     Image = Print;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category5;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     ToolTip = 'Finalize and print the sales document.';

//                     trigger OnAction()
//                     begin
//                         PostAndPrint(Codeunit::"Sales-Post");
//                     end;
//                 }
//                 action("Email as PDF")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = '&Email';
//                     Ellipsis = true;
//                     Image = Email;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category5;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     ToolTip = 'Finalize and attach the sales document to an email to the customer.';
//                     Visible = AllowDotNetAddIn;

//                     trigger OnAction()
//                     begin
//                         Post(Codeunit::"Sales-Post + Email");
//                     end;
//                 }
//                 action("Preview Posting")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Preview Posting';
//                     Image = ViewPostedOrder;

//                     trigger OnAction()
//                     begin
//                         ShowPreview;
//                     end;
//                 }
//             }
//             group(View)
//             {
//                 Caption = 'View';
//                 action("Bill-to and Ship-to Address")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Bill-to Addresses';
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
//                 action(CreditMemoDetails)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Credit Memo Details';
//                     Image = TaxDetail;
//                     Promoted = true;
//                     PromotedCategory = Category6;
//                     PromotedIsBig = true;
//                     ToolTip = 'Show fields for credit memo details, such as currency, shipment date, and payment terms.';

//                     trigger OnAction()
//                     begin
//                         ShowDetailsTab := not ShowDetailsTab;
//                     end;
//                 }
//             }
//         }
//     }

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
//     var
//         FileManagement: Codeunit "File Management";
//     begin
//         if UserSetupManagement.GetSalesFilter <> '' then begin
//             Rec.FilterGroup(2);
//             Rec.SetRange(Rec."Responsibility Center", UserSetupManagement.GetSalesFilter);
//             Rec.FilterGroup(0);
//         end;

//         AllowDotNetAddIn := FileManagement.CanRunDotNetOnClient;
//     end;

//     var
//         UserSetupManagement: Codeunit "User Setup Management";
//         MiniSalesCalcDiscByType: Codeunit 1300;
//         MiniLinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
//         ShowBillToShipToTab: Boolean;
//         ShowDetailsTab: Boolean;
//         SelectCustErr: label 'You must select an existing customer.';
//         OpenPostedSalesCrMemoQst: label 'The credit memo has been posted and archived.\\Do you want to open the posted credit memo from the Posted Sales Credit Memo list?';
//         [InDataSet]
//         AllowDotNetAddIn: Boolean;
//         PostAndPrintQst: label 'Do you want to post and print the credit memo?';

//     local procedure Post(PostingCodeunitID: Integer)
//     var
//         PreAssignedNo: Code[20];
//     begin
//         MiniLinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);
//         PreAssignedNo := Rec."No.";
//         Rec.SendToPosting(PostingCodeunitID);
//         if Rec."Job Queue Status" = Rec."job queue status"::"Scheduled for Posting" then
//             CurrPage.Close
//         else
//             ShowPostedConfirmationMessage(PreAssignedNo);
//     end;

//     local procedure PostAndPrint(PostingCodeunitID: Integer)
//     var
//         SalesCrMemoHeader: Record "Sales Cr.Memo Header";
//         DocumentNo: Code[20];
//         PreAssignedNo: Code[20];
//     begin
//         MiniLinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);

//         if not Confirm(PostAndPrintQst, false) then
//             exit;

//         PreAssignedNo := Rec."No.";
//         Rec.SendToPosting(PostingCodeunitID);

//         if Rec."Last Posting No." = '' then
//             DocumentNo := Rec."No."
//         else
//             DocumentNo := Rec."Last Posting No.";

//         if SalesCrMemoHeader.Get(DocumentNo) then begin
//             SalesCrMemoHeader.SetRecfilter;
//             Commit;
//             SalesCrMemoHeader.PrintRecords(not AllowDotNetAddIn);
//             ShowPostedConfirmationMessage(PreAssignedNo);
//         end;
//     end;

//     local procedure GetCustNoByName(CustomerName: Text[50]): Code[20]
//     var
//         Customer: Record Customer;
//     begin
//         Customer.SetRange(Name, CustomerName);
//         case Customer.Count of
//             0:
//                 Error(SelectCustErr);
//             1:
//                 begin
//                     Customer.FindFirst;
//                     exit(Customer."No.");
//                 end;
//             else
//                 exit(PickCustomer(Customer));
//         end;
//     end;

//     local procedure PickCustomer(Customer: Record Customer): Code[20]
//     var
//         MiniCustomerList: Page "Mini Customer List";
//     begin
//         MiniCustomerList.SetTableview(Customer);
//         MiniCustomerList.LookupMode := true;
//         if MiniCustomerList.RunModal <> Action::LookupOK then
//             Error(SelectCustErr);

//         MiniCustomerList.GetRecord(Customer);
//         exit(Customer."No.");
//     end;

//     local procedure ShowPostedConfirmationMessage(PreAssignedNo: Code[20])
//     var
//         SalesCrMemoHeader: Record "Sales Cr.Memo Header";
//     begin
//         SalesCrMemoHeader.SetRange("Pre-Assigned No.", PreAssignedNo);
//         if SalesCrMemoHeader.FindFirst then
//             if Dialog.Confirm(OpenPostedSalesCrMemoQst, false) then
//                 Page.Run(Page::"Mini Posted Sales Credit Memo", SalesCrMemoHeader);
//     end;


//     procedure ShowPreview()
//     var
//         SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
//     begin
//         SalesPostYesNo.Preview(Rec);
//     end;
// }
