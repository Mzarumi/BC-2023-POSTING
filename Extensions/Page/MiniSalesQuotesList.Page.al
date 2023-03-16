// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1326 "Mini Sales Quotes List"
// {
//     Caption = 'Sales Quotes';
//     CardPageID = "Mini Sales Quote";
//     Editable = false;
//     PageType = List;
//     PromotedActionCategories = 'New,Process,Report,Quote,Posting';
//     SourceTable = "Sales Header";
//     SourceTableView = where("Document Type"=const(Quote));

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("No.";Rec."No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the number of the sales document. The field can be filled automatically or manually and can be set up to be invisible.';
//                 }
//                 field("Sell-to Customer Name";Rec."Sell-to Customer Name")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Customer Name';
//                     ToolTip = 'Specifies the name of the customer who will receive the products and be billed by default. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                 }
//                 field("Sell-to Contact";Rec."Sell-to Contact")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Contact';
//                     ToolTip = 'Specifies the name of the person to contact at the customer. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
//                 }
//                 field("Posting Date";Rec."Posting Date")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the date when the posting of the sales document will be recorded. By default, today''s date is entered.';
//                 }
//                 field("Due Date";Rec."Due Date")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies when the sales invoice must be paid. By default, the field is calculated as the date in the Shipment Date field plus the period defined in the Payment Terms Code field.';
//                 }
//                 field("Requested Delivery Date";Rec."Requested Delivery Date")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the date that the customer has asked for the order to be delivered. The shipment date is calculated from this field. If you leave the field empty, the earliest possible delivery date is calculated and inserted.';
//                 }
//                 field(Amount;Rec.Amount)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the sum of amounts in the Line Amount field on the sales order lines. It is used to calculate the invoice discount of the sales order.';
//                 }
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
//                     Scope = Repeater;
//                     ToolTip = 'Convert the selected sales quote to a sales invoice.';

//                     trigger OnAction()
//                     begin
//                         MiniLinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);
//                         Codeunit.Run(Codeunit::"Sales-Quote to Invoice Yes/No",Rec);
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
//                     PromotedIsBig = true;
//                     Scope = Repeater;
//                     ToolTip = 'Print the selected sales quote.';

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
//                     Scope = Repeater;
//                     ToolTip = 'Attach the selected sales quote to an email to the customer.';

//                     trigger OnAction()
//                     var
//                         ReportDistributionManagement: Codeunit "Report Distribution Management";
//                     begin
//                         MiniLinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);
//                         ReportDistributionManagement.EmailDocumentReport(Rec);
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
//                     Image = Customer;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     RunObject = Page "Mini Customer Card";
//                     RunPageLink = "No."=field("Sell-to Customer No.");
//                     Scope = Repeater;
//                     ShortCutKey = 'Shift+F7';
//                     ToolTip = 'View or edit detailed information about the customer on the selected sales document.';
//                 }
//             }
//         }
//     }

//     trigger OnOpenPage()
//     begin
//         Rec.SetSecurityFilterOnRespCenter;
//     end;

//     var
//         DocPrint: Codeunit "Document-Print";
//         MiniLinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
// }
