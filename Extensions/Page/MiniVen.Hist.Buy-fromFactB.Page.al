// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 1332 "Mini Ven. Hist. Buy-from FactB"
// {
//     Caption = 'Buy-from Vendor History';
//     PageType = CardPart;
//     SourceTable = Vendor;

//     layout
//     {
//         area(content)
//         {
//             field(NoOfInvoices;NoOfInvoices)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Open Purchase Invoices';
//                 DrillDown = true;
//                 Editable = true;
//                 Visible = RegularFastTabVisible;

//                 trigger OnDrillDown()
//                 var
//                     PurchaseHeader: Record "Purchase Header";
//                 begin
//                     PurchaseHeader.SetRange("Buy-from Vendor No.",Rec."No.");
//                     Page.Run(Page::"Mini Purchase Invoice List",PurchaseHeader);
//                 end;
//             }
//             field(NoOfCreditMemos;NoOfCreditMemos)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Open Purchase Credit Memos';
//                 DrillDown = true;
//                 DrillDownPageID = "Purchase Credit Memos";
//                 Editable = true;
//                 Visible = RegularFastTabVisible;

//                 trigger OnDrillDown()
//                 var
//                     PurchaseHeader: Record "Purchase Header";
//                 begin
//                     PurchaseHeader.SetRange("Buy-from Vendor No.",Rec."No.");
//                     Page.Run(Page::"Mini Purchase Credit Memos",PurchaseHeader);
//                 end;
//             }
//             field(NoOfPostedInvoices;NoOfPostedInvoices)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Posted Purchase Invoices';
//                 DrillDown = true;
//                 DrillDownPageID = "Posted Purchase Invoices";
//                 Editable = true;
//                 Visible = RegularFastTabVisible;

//                 trigger OnDrillDown()
//                 var
//                     PurchInvHeader: Record "Purch. Inv. Header";
//                 begin
//                     PurchInvHeader.SetRange("Buy-from Vendor No.",Rec."No.");
//                     Page.Run(Page::"Mini Posted Purchase Invoices",PurchInvHeader);
//                 end;
//             }
//             field(NoOfPostedCreditMemos;NoOfPostedCreditMemos)
//             {
//                 ApplicationArea = Basic;
//                 Caption = 'Posted Purchase Credit Memos';
//                 DrillDown = true;
//                 DrillDownPageID = "Posted Purchase Credit Memos";
//                 Editable = true;
//                 Visible = RegularFastTabVisible;

//                 trigger OnDrillDown()
//                 var
//                     PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
//                 begin
//                     PurchCrMemoHdr.SetRange("Buy-from Vendor No.",Rec."No.");
//                     Page.Run(Page::"Mini Posted Purch. Cr. Memos",PurchCrMemoHdr);
//                 end;
//             }
//             cuegroup(Control5)
//             {
//                 Visible = CuesVisible;
//                 field(NoOfInvoicesTile;NoOfInvoices)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Open Purchase Invoices';
//                     DrillDown = true;
//                     Editable = true;

//                     trigger OnDrillDown()
//                     var
//                         PurchaseHeader: Record "Purchase Header";
//                     begin
//                         PurchaseHeader.SetRange("Buy-from Vendor No.",Rec."No.");
//                         Page.Run(Page::"Mini Purchase Invoice List",PurchaseHeader);
//                     end;
//                 }
//                 field(NoOfCreditMemosTile;NoOfCreditMemos)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Open Purchase Credit Memos';
//                     DrillDown = true;
//                     DrillDownPageID = "Purchase Credit Memos";
//                     Editable = true;

//                     trigger OnDrillDown()
//                     var
//                         PurchaseHeader: Record "Purchase Header";
//                     begin
//                         PurchaseHeader.SetRange("Buy-from Vendor No.",Rec."No.");
//                         Page.Run(Page::"Mini Purchase Credit Memos",PurchaseHeader);
//                     end;
//                 }
//                 field(NoOfPostedInvoicesTile;NoOfPostedInvoices)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Posted Purchase Invoices';
//                     DrillDown = true;
//                     DrillDownPageID = "Posted Purchase Invoices";
//                     Editable = true;

//                     trigger OnDrillDown()
//                     var
//                         PurchInvHeader: Record "Purch. Inv. Header";
//                     begin
//                         PurchInvHeader.SetRange("Buy-from Vendor No.",Rec."No.");
//                         Page.Run(Page::"Mini Posted Purchase Invoices",PurchInvHeader);
//                     end;
//                 }
//                 field(NoOfPostedCreditMemosTile;NoOfPostedCreditMemos)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Posted Purchase Credit Memos';
//                     DrillDown = true;
//                     DrillDownPageID = "Posted Purchase Credit Memos";
//                     Editable = true;

//                     trigger OnDrillDown()
//                     var
//                         PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
//                     begin
//                         PurchCrMemoHdr.SetRange("Buy-from Vendor No.",Rec."No.");
//                         Page.Run(Page::"Mini Posted Purch. Cr. Memos",PurchCrMemoHdr);
//                     end;
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }

//     trigger OnAfterGetRecord()
//     begin
//         CalcNoOfBuyRecords;
//     end;

//     trigger OnFindRecord(Which: Text): Boolean
//     begin
//         NoOfInvoices := 0;
//         NoOfCreditMemos := 0;
//         NoOfPostedInvoices := 0;
//         NoOfPostedCreditMemos := 0;

//         exit(Rec.Find(Which));
//     end;

//     trigger OnInit()
//     begin
//         RegularFastTabVisible := CurrentClientType = Clienttype::Windows;
//         CuesVisible := not RegularFastTabVisible;
//     end;

//     trigger OnOpenPage()
//     begin
//         CalcNoOfBuyRecords;
//     end;

//     var
//         NoOfInvoices: Integer;
//         NoOfCreditMemos: Integer;
//         NoOfPostedInvoices: Integer;
//         NoOfPostedCreditMemos: Integer;
//         RegularFastTabVisible: Boolean;
//         CuesVisible: Boolean;

//     local procedure ShowDetails()
//     begin
//         Page.Run(Page::"Vendor Card",Rec);
//     end;

//     local procedure CalcNoOfBuyRecords()
//     var
//         PurchHeader: Record "Purchase Header";
//         PurchInvHeader: Record "Purch. Inv. Header";
//         PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr.";
//     begin
//         PurchHeader.Reset;
//         PurchHeader.SetRange("Document Type",PurchHeader."document type"::Invoice);
//         PurchHeader.SetRange("Buy-from Vendor No.",Rec."No.");
//         NoOfInvoices := PurchHeader.Count;

//         PurchHeader.Reset;
//         PurchHeader.SetRange("Document Type",PurchHeader."document type"::"Credit Memo");
//         PurchHeader.SetRange("Buy-from Vendor No.",Rec."No.");
//         NoOfCreditMemos := PurchHeader.Count;

//         PurchInvHeader.Reset;
//         PurchInvHeader.SetRange("Buy-from Vendor No.",Rec."No.");
//         NoOfPostedInvoices := PurchInvHeader.Count;

//         PurchCrMemoHdr.Reset;
//         PurchCrMemoHdr.SetRange("Buy-from Vendor No.",Rec."No.");
//         NoOfPostedCreditMemos := PurchCrMemoHdr.Count;
//     end;
// }
