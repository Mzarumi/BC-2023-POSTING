// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1322 "Mini Posted Sales Credit Memo"
// {
//     Caption = 'Posted Sales Credit Memo';
//     InsertAllowed = false;
//     ModifyAllowed = false;
//     PageType = Document;
//     PromotedActionCategories = 'New,Process,Report,Correct,Credit Memo';
//     RefreshOnActivate = true;
//     SourceTable = "Sales Cr.Memo Header";

//     layout
//     {
//         area(content)
//         {
//             group("Posted Sales Credit Memo")
//             {
//                 Caption = 'Posted Sales Credit Memo';
//                 field("Sell-to Customer Name";Rec."Sell-to Customer Name")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Customer Name';
//                     DrillDownPageID = "Mini Customer List";
//                     Editable = false;
//                     LookupPageID = "Mini Customer List";
//                     TableRelation = Customer.Name;
//                     ToolTip = 'Specifies the name of the customer that you shipped the items on the credit memo to.';
//                 }
//                 field("Sell-to Address";Rec."Sell-to Address")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Address';
//                     Editable = false;
//                     ToolTip = 'Specifies the address of the customer that the items on the credit memo were sent to.';
//                 }
//                 field("Sell-to Address 2";Rec."Sell-to Address 2")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Address 2';
//                     Editable = false;
//                     ToolTip = 'Specifies an additional part of the address of the customer to whom you shipped the items on the credit memo.';
//                 }
//                 field("Sell-to Post Code";Rec."Sell-to Post Code")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Post Code';
//                     Editable = false;
//                     ToolTip = 'Specifies the post code of the customer that the items were sold to.';
//                 }
//                 field("Sell-to City";Rec."Sell-to City")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'City';
//                     Editable = false;
//                     ToolTip = 'Specifies the city name of the customer that the items on the credit memo were shipped to.';
//                 }
//                 field("Sell-to Contact";Rec."Sell-to Contact")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Contact';
//                     Editable = false;
//                     ToolTip = 'Specifies the name of the person to contact when you communicate with the customer that you shipped the items on the credit memo to.';
//                 }
//                 field("Posting Date";Rec."Posting Date")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies the date on which the credit memo was posted.';
//                 }
//                 field("Document Date";Rec."Document Date")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     ToolTip = 'Specifies the date on which you created the sales document.';
//                 }
//                 field("Due Date";Rec."Due Date")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies the date on which the shipment is due for payment. The program calculates the date using the Payment Terms Code and Posting Date fields on the sales header.';
//                 }
//                 field("Document Exchange Status";Rec."Document Exchange Status")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     StyleExpr = DocExchStatusStyle;
//                     ToolTip = 'Specifies the status of the document if you are using a document exchange service to send it as an electronic document. The status values are reported by the document exchange service.';

//                     trigger OnDrillDown()
//                     begin
//                         DocExchStatusDrillDown;
//                     end;
//                 }
//                 field(Paid;Rec.Paid)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies if the posted sales invoice that relates to this sales credit memo is paid.';
//                 }
//                 field(Canceled;Canceled)
//                 {
//                     ApplicationArea = Basic;
//                     DrillDownPageID = "Mini Posted Sales Invoices";
//                     Editable = false;
//                     LookupPageID = "Mini Posted Sales Invoices";
//                     Style = Unfavorable;
//                     StyleExpr = Canceled;
//                     ToolTip = 'Specifies if the posted sales invoice that relates to this sales credit memo has been either corrected or canceled.';

//                     trigger OnDrillDown()
//                     var
//                         SalesInvoiceHeader: Record "Sales Invoice Header";
//                     begin
//                         if Canceled then begin
//                           SalesInvoiceHeader.SetRange("No.",Rec."Applies-to Doc. No.");
//                           Page.Run(Page::"Mini Posted Sales Invoices",SalesInvoiceHeader);
//                         end;
//                     end;
//                 }
//                 field("No. Printed";Rec."No. Printed")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     ToolTip = 'Specifies how many times the credit memo has been printed.';
//                 }
//             }
//             part(SalesCrLines;"Mini Pst.Sales Cr.Memo Subform")
//             {
//                 SubPageLink = "Document No."=field("No.");
//             }
//             group(CreditMemoDetails)
//             {
//                 Caption = 'Credit Memo Details';
//                 field("Currency Code";Rec."Currency Code")
//                 {
//                     ApplicationArea = Basic;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies the currency code of the credit memo.';
//                 }
//                 field("Shipment Date";Rec."Shipment Date")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     ToolTip = 'Copies the date for this field from the Shipment Date field on the sales header, which is used for planning purposes.';
//                 }
//                 field("Pre-Assigned No.";Rec."Pre-Assigned No.")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     ToolTip = 'Specifies the number of the credit memo that the posted credit memo was created from.';
//                 }
//                 field("Payment Terms Code";Rec."Payment Terms Code")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     Importance = Promoted;
//                     ToolTip = 'Specifies the code to use to find the payment terms that apply to the credit memo.';
//                 }
//                 field("Payment Method Code";Rec."Payment Method Code")
//                 {
//                     ApplicationArea = Basic;
//                     Editable = false;
//                     ToolTip = 'Describes the customer''s method of payment. The program has copied the code from the Payment Method Code field on the sales header.';
//                 }
//                 field("Transaction Type";Rec."Transaction Type")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Shows the transaction type of the sales header that this line was posted from.';
//                 }
//             }
//             group("Bill-to Customer Addresses")
//             {
//                 Caption = 'Bill-to Customer Addresses';
//                 field("Bill-to Name";Rec."Bill-to Name")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Name';
//                     Editable = false;
//                     ToolTip = 'Specifies the name of the customer that the credit memo was sent to.';
//                 }
//                 field("Bill-to Address";Rec."Bill-to Address")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Address';
//                     Editable = false;
//                     ToolTip = 'Specifies the address of the customer that the credit memo was sent to.';
//                 }
//                 field("Bill-to Address 2";Rec."Bill-to Address 2")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Address 2';
//                     Editable = false;
//                     ToolTip = 'Contains an additional part of the address of the customer that the credit memo was sent to.';
//                 }
//                 field("Bill-to Post Code";Rec."Bill-to Post Code")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Post Code';
//                     Editable = false;
//                     ToolTip = 'Specifies the post code of the customer''s billing address.';
//                 }
//                 field("Bill-to City";Rec."Bill-to City")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'City';
//                     Editable = false;
//                     ToolTip = 'Specifies the city name of the customer that the credit memo was sent to.';
//                 }
//                 field("Bill-to Contact";Rec."Bill-to Contact")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Contact';
//                     Editable = false;
//                     ToolTip = 'Specifies the name of the person you regularly contact when you communicate with the customer to whom the credit memo was sent.';
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group("Credit Memo")
//             {
//                 Caption = 'Credit Memo';
//                 Image = Invoice;
//                 action(Customer)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Customer';
//                     Image = Customer;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     RunObject = Page "Mini Customer Card";
//                     RunPageLink = "No."=field("Sell-to Customer No.");
//                     ShortCutKey = 'Shift+F7';
//                     ToolTip = 'View or edit detailed information about the customer on the posted sales document.';
//                 }
//                 action("&Navigate")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = '&Navigate';
//                     Image = Navigate;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     ToolTip = 'Find all entries and documents that exist for the document number and posting date on the posted sales document.';

//                     trigger OnAction()
//                     begin
//                         Rec.Navigate;
//                     end;
//                 }
//                 action(Dimensions)
//                 {
//                     AccessByPermission = TableData Dimension=R;
//                     ApplicationArea = Basic;
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Shift+Ctrl+D';
//                     ToolTip = 'View or edit the dimension sets that are set up for the customer on the sales document.';

//                     trigger OnAction()
//                     begin
//                         Rec.ShowDimensions;
//                     end;
//                 }
//             }
//             group(Send)
//             {
//                 Caption = 'Send';
//                 action(SendCustom)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Send';
//                     Ellipsis = true;
//                     Image = SendToMultiple;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ToolTip = 'Send the posted sales document.';

//                     trigger OnAction()
//                     var
//                         SalesCrMemoHeader: Record "Sales Cr.Memo Header";
//                     begin
//                         SalesCrMemoHeader := Rec;
//                         CurrPage.SetSelectionFilter(SalesCrMemoHeader);
//                         SalesCrMemoHeader.SendRecords;
//                     end;
//                 }
//                 action("&Print")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = '&Print';
//                     Ellipsis = true;
//                     Image = Print;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Process;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     ToolTip = 'Print the posted sales document.';

//                     trigger OnAction()
//                     begin
//                         SalesCrMemoHeader := Rec;
//                         CurrPage.SetSelectionFilter(SalesCrMemoHeader);
//                         SalesCrMemoHeader.PrintRecords(not AllowDotNetAddIn);
//                     end;
//                 }
//                 action("&Email")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = '&Email';
//                     Ellipsis = true;
//                     Image = Email;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Process;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     ToolTip = 'Attach the posted sales document to an email to the customer.';

//                     trigger OnAction()
//                     var
//                         ReportDistributionManagement: Codeunit "Report Distribution Management";
//                     begin
//                         ReportDistributionManagement.EmailDocumentReport(Rec);
//                     end;
//                 }
//             }
//             action(ActivityLog)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Activity Log';
//                 Image = Log;

//                 trigger OnAction()
//                 begin
//                     Rec.ShowActivityLog;
//                 end;
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     begin
//         DocExchStatusStyle := Rec.GetDocExchStatusStyle;
//     end;

//     trigger OnAfterGetRecord()
//     begin
//         DocExchStatusStyle := Rec.GetDocExchStatusStyle;
//     end;

//     trigger OnOpenPage()
//     var
//         FileManagement: Codeunit "File Management";
//     begin
//         Rec.SetSecurityFilterOnRespCenter;

//         AllowDotNetAddIn := FileManagement.CanRunDotNetOnClient;
//     end;

//     var
//         SalesCrMemoHeader: Record "Sales Cr.Memo Header";
//         [InDataSet]
//         AllowDotNetAddIn: Boolean;
//         DocExchStatusStyle: Text;
// }
