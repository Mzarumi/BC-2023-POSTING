// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1317 "Mini Sales Credit Memos"
// {
//     Caption = 'Sales Credit Memos';
//     CardPageID = "Mini Sales Credit Memo";
//     Editable = false;
//     PageType = List;
//     PromotedActionCategories = 'New,Process,Report,Credit Memo,Posting';
//     SourceTable = "Sales Header";
//     SourceTableView = where("Document Type" = const("Credit Memo"));

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("No."; Rec."No.")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the number of the sales document. The field can be filled automatically or manually and can be set up to be invisible.';
//                 }
//                 field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Customer Name';
//                     ToolTip = 'Specifies the name of the customer who will receive the products and be billed by default. The value is automatically inserted from the customer card when you fill the Sell-to Customer No. field. The value will appear on the printed sales document.';
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
//                     ToolTip = 'Specifies the date when the posting of the sales document will be recorded. By default, today''s date is entered.';
//                 }
//                 field("Due Date"; Rec."Due Date")
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies when the sales invoice must be paid. By default, the field is calculated as the date in the Shipment Date field plus the period defined in the Payment Terms Code field.';
//                 }
//                 field(Amount; Rec.Amount)
//                 {
//                     ApplicationArea = Basic;
//                     ToolTip = 'Specifies the sum of amounts in the Line Amount field on the sales order lines. It is used to calculate the invoice discount of the sales order.';
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//         }
//         area(processing)
//         {
//             group(CreditMemo)
//             {
//                 Caption = 'Credit Memo';
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
//                     RunPageLink = "No." = field("Sell-to Customer No.");
//                     Scope = Repeater;
//                     ShortCutKey = 'Shift+F7';
//                     ToolTip = 'View or edit detailed information about the customer on the selected sales document.';
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
//                     Scope = Repeater;
//                     ShortCutKey = 'F9';
//                     ToolTip = 'Finalize the selected sales document. Posting updates the books with the document''s amounts and quantities.';

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
//                     Scope = Repeater;
//                     ToolTip = 'Finalize and send the selected sales document.';

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
//                     Scope = Repeater;
//                     ToolTip = 'Finalize and print the selected sales document.';

//                     trigger OnAction()
//                     begin
//                         PostAndPrint(Codeunit::"Sales-Post");
//                     end;
//                 }
//                 action("Email as PDF")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Email';
//                     Ellipsis = true;
//                     Image = Email;
//                     //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedCategory = Category5;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = true;
//                     Scope = Repeater;
//                     ToolTip = 'Finalize and attach the selected sales document to an email to the customer.';
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
//                         ToolTip = 'View, print, or save the customer''s total cost, sale, and profit over time, for example, to analyze earnings trends. The report shows amounts for original and adjusted cost, sales, profit, invoice discount, payment discount, and profit percentage in three adjustable periods.';
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
//                         ToolTip = 'View, print, or save customers'' balances on a certain date. You can use the report to extract your total sales income at the close of an accounting period or fiscal year.';
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
//                         ToolTip = 'View, print, or save the balance for customers with balances on a specified date, for example, at the close of an accounting period or for an audit.';
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

//     trigger OnOpenPage()
//     var
//         FileManagement: Codeunit "File Management";
//     begin
//         Rec.SetSecurityFilterOnRespCenter;

//         AllowDotNetAddIn := FileManagement.CanRunDotNetOnClient;
//     end;

//     var
//         MiniLinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
//         [InDataSet]
//         AllowDotNetAddIn: Boolean;
//         OpenPostedSalesCrMemoQst: label 'The credit memo has been posted and archived.\\Do you want to open the posted credit memo from the Posted Sales Credit Memo list?';
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
