// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 829 "DO Payment Trans. Log Entries"
// {
//     Caption = 'Credit Cards Transaction Log Entries.';
//     Editable = false;
//     PageType = List;
//     SourceTable = 829;

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 field("Document Type"; "Document Type")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Document No."; "Document No.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Customer No."; "Customer No.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Credit Card No."; "Credit Card No.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Transaction Type"; "Transaction Type")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Transaction Result"; "Transaction Result")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Transaction Description"; "Transaction Description")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field(Amount; Amount)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Transaction Date-Time"; "Transaction Date-Time")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Transaction Status"; "Transaction Status")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Cust. Ledger Entry No."; "Cust. Ledger Entry No.")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Currency Code"; "Currency Code")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("User ID"; "User ID")
//                 {
//                     ApplicationArea = Basic;
//                     Visible = false;
//                 }
//                 field("Entry No."; "Entry No.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Parent Entry No."; "Parent Entry No.")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Transaction ID"; "Transaction ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group("F&unctions")
//             {
//                 Caption = 'F&unctions';
//                 Image = "Action";
//                 action("Update Transaction Status from Payment Services")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Update Transaction Status from Payment Services';
//                     Image = Refresh;

//                     trigger OnAction()
//                     var
//                         DOPaymentIntegrationMgt: Codeunit "Purch. Post Invoice Events";
//                     begin
//                         if (not Rec.IsEmpty) and ("Transaction Result" <> "transaction result"::Failed) then
//                             DOPaymentIntegrationMgt.RefreshTransactionStatus(Rec);
//                     end;
//                 }
//             }
//         }
//     }
// }
