// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1321 "Mini Posted Sales Credit Memos"
// {
//     Caption = 'Posted Sales Credit Memos';
//     CardPageID = "Mini Posted Sales Credit Memo";
//     Editable = false;
//     PageType = List;
//     PromotedActionCategories = 'New,Process,Report,Correct,Credit Memo';
//     SourceTable = "Sales Cr.Memo Header";

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("No.";Rec."No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the posted credit memo number.';
//                 }
//                 field("Sell-to Customer Name";Rec."Sell-to Customer Name")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Customer Name';
//                     ToolTip = 'Specifies the name of the customer that you shipped the items on the credit memo to.';
//                 }
//                 field("Due Date";Rec."Due Date")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the date on which the shipment is due for payment. The program calculates the date using the Payment Terms Code and Posting Date fields on the sales header.';
//                 }
//                 field(Amount;Rec.Amount)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the total of the amounts on all the credit memo lines, in the currency of the credit memo. The amount does not include VAT.';

//                     trigger OnDrillDown()
//                     begin
//                         Rec.SetRange(Rec."No.");
//                         Page.RunModal(Page::"Mini Posted Sales Credit Memo",Rec)
//                     end;
//                 }
//                 field("Amount Including VAT";Rec."Amount Including VAT")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the total of the amounts in all the amount fields on the credit memo, in the currency of the credit memo. The amount includes VAT.';

//                     trigger OnDrillDown()
//                     begin
//                         Rec.SetRange(Rec."No.");
//                         Page.RunModal(Page::"Mini Posted Sales Credit Memo",Rec)
//                     end;
//                 }
//                 field("Remaining Amount";Rec."Remaining Amount")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the amount that remains to be paid for the posted sales invoice that relates to this sales credit memo.';
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
//                     HideValue = not Canceled;
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
//                 field("Document Exchange Status";Rec."Document Exchange Status")
//                 {
//                     ApplicationArea = Basic;
//                     StyleExpr = DocExchStatusStyle;
//                     ToolTip = 'Specifies the status of the document if you are using a document exchange service to send it as an electronic document. The status values are reported by the document exchange service.';

//                     trigger OnDrillDown()
//                     begin
//                         DocExchStatusDrillDown;
//                     end;
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
//                     Scope = Repeater;
//                     ShortCutKey = 'Shift+F7';
//                     ToolTip = 'View or edit detailed information about the customer on the selected posted sales document.';
//                 }
//                 action("&Navigate")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = '&Navigate';
//                     Image = Navigate;
//                     Promoted = true;
//                     PromotedCategory = Category5;
//                     PromotedIsBig = true;
//                     Scope = Repeater;
//                     ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected posted sales document.';

//                     trigger OnAction()
//                     begin
//                         Rec.Navigate;
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
//                     Scope = Repeater;
//                     ToolTip = 'Send the selected posted sales document.';

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
//                     Scope = Repeater;
//                     ToolTip = 'Print the selected posted sales document.';

//                     trigger OnAction()
//                     var
//                         SalesCrMemoHeader: Record "Sales Cr.Memo Header";
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
//                     Scope = Repeater;
//                     ToolTip = 'Attach the selected posted sales document to an email to the customer.';

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
//         [InDataSet]
//         AllowDotNetAddIn: Boolean;
//         DocExchStatusStyle: Text;
// }
