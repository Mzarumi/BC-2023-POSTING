// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1318 "Mini Sales Hist. Sell-to FactB"
// {
//     Caption = 'Sell-to Customer Sales History';
//     PageType = CardPart;
//     SourceTable = Customer;

//     layout
//     {
//         area(content)
//         {
//             field("No. of Invoices";Rec."No. of Invoices")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Ongoing Sales Invoices';
//                 DrillDownPageID = "Mini Sales Invoice List";
//                 ToolTip = 'Specifies the number of unposted sales invoices that have been registered for the customer.';
//                 Visible = RegularFastTabVisible;
//             }
//             field("No. of Credit Memos";Rec."No. of Credit Memos")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Ongoing Sales Credit Memos';
//                 DrillDownPageID = "Mini Sales Credit Memos";
//                 ToolTip = 'Specifies the number of unposted sales credit memos that have been registered for the customer.';
//                 Visible = RegularFastTabVisible;
//             }
//             field("No. of Pstd. Invoices";Rec."No. of Pstd. Invoices")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Posted Sales Invoices';
//                 DrillDownPageID = "Mini Posted Sales Invoices";
//                 ToolTip = 'Specifies the number of posted sales invoices that have been registered for the customer.';
//                 Visible = RegularFastTabVisible;
//             }
//             field("No. of Pstd. Credit Memos";Rec."No. of Pstd. Credit Memos")
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Posted Sales Credit Memos';
//                 DrillDownPageID = "Mini Posted Sales Credit Memos";
//                 ToolTip = 'Specifies the number of posted sales credit memos that have been registered for the customer.';
//                 Visible = RegularFastTabVisible;
//             }
//             cuegroup(Control6)
//             {
//                 Visible = CuesVisible;
//                 field(NoofQuotesTile;Rec."No. of Quotes")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Ongoing Sales Quotes';
//                     DrillDown = true;
//                     ToolTip = 'Specifies the number of sales quotes that have been registered for the customer.';

//                     trigger OnDrillDown()
//                     var
//                         SalesHeader: Record "Sales Header";
//                     begin
//                         SalesHeader.SetRange("Sell-to Customer No.",Rec."No.");
//                         Page.Run(Page::"Mini Sales Quotes List",SalesHeader);
//                     end;
//                 }
//                 field(NoofInvoicesTile;Rec."No. of Invoices")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Ongoing Sales Invoices';
//                     DrillDown = true;
//                     ToolTip = 'Specifies the number of unposted sales invoices that have been registered for the customer.';

//                     trigger OnDrillDown()
//                     var
//                         SalesHeader: Record "Sales Header";
//                     begin
//                         SalesHeader.SetRange("Sell-to Customer No.",Rec."No.");
//                         Page.Run(Page::"Mini Sales Invoice List",SalesHeader);
//                     end;
//                 }
//                 field(NoOfCreditMemosTile;Rec."No. of Credit Memos")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Ongoing Sales Credit Memos';
//                     DrillDown = true;
//                     ToolTip = 'Specifies the number of unposted sales credit memos that have been registered for the customer.';

//                     trigger OnDrillDown()
//                     var
//                         SalesHeader: Record "Sales Header";
//                     begin
//                         SalesHeader.SetRange("Sell-to Customer No.",Rec."No.");
//                         Page.Run(Page::"Mini Sales Credit Memos",SalesHeader);
//                     end;
//                 }
//                 field(NoOfPstdInvoicesTile;Rec."No. of Pstd. Invoices")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Posted Sales Invoices';
//                     DrillDown = true;
//                     ToolTip = 'Specifies the number of posted sales invoices that have been registered for the customer.';

//                     trigger OnDrillDown()
//                     var
//                         SalesInvoiceHeader: Record "Sales Invoice Header";
//                     begin
//                         SalesInvoiceHeader.SetRange("Sell-to Customer No.",Rec."No.");
//                         Page.Run(Page::"Mini Posted Sales Invoices",SalesInvoiceHeader);
//                     end;
//                 }
//                 field(NoOfPstdCreditMemosTile;Rec."No. of Pstd. Credit Memos")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Posted Sales Credit Memos';
//                     DrillDown = true;
//                     ToolTip = 'Specifies the number of posted sales credit memos that have been registered for the customer.';

//                     trigger OnDrillDown()
//                     var
//                         SalesCrMemoHeader: Record "Sales Cr.Memo Header";
//                     begin
//                         SalesCrMemoHeader.SetRange("Sell-to Customer No.",Rec."No.");
//                         Page.Run(Page::"Mini Posted Sales Credit Memos",SalesCrMemoHeader);
//                     end;
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }

//     trigger OnOpenPage()
//     begin
//         RegularFastTabVisible := CurrentClientType = Clienttype::Windows;
//         CuesVisible := not RegularFastTabVisible;
//     end;

//     var
//         RegularFastTabVisible: Boolean;
//         CuesVisible: Boolean;
// }
