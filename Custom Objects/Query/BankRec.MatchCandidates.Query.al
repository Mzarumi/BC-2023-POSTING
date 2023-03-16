// Query 1251 "Bank Rec. Match Candidatess"//
// {
//     Caption = 'Bank Rec. Match Candidates';

//     elements
//     {
//         dataitem(Bank_Acc__Reconciliation; "Bank Acc. Reconciliation Line")
//         {
//             DataItemTableFilter = Difference = filter(<> 0), Type = filter(= "Bank Account Ledger Entry");
//             column(BankRecon_Bank_Account_No; "Bank Account No.")
//             {
//             }
//             column(BankRecon_Statement_No; "Statement No.")
//             {
//             }
//             column(BankRecon_Statement_Line_No; "Statement Line No.")
//             {
//             }
//             column(BankRecon_Transaction_Date; "Transaction Date")
//             {
//             }
//             column(BankRecon_Description; Description)
//             {
//             }
//             column(BankRecon_RltdPty_Name; "Related-Party Name")
//             {
//             }
//             column(BankRecon_Transaction_Info; "Additional Transaction Info")
//             {
//             }
//             column(BankRecon_Statement_Amount; "Statement Amount")
//             {
//             }
//             column(BankRecon_Applied_Amount; "Applied Amount")
//             {
//             }
//             column(BankRecon_Difference; Difference)
//             {
//             }
//             column(BankRecon_Type; Type)
//             {
//             }
//             column(BankRecon_Applied_Entries; "Applied Entries")
//             {
//             }
//             column(BankRecon_Check_No; "Check No.")
//             {
//             }
//             column(BankRecon_Doc_No; "Document No.")
//             {
//             }
//             dataitem(Bank_Account_Ledger_Entry; "Bank Account Ledger Entry")
//             {
//                 DataItemLink = "Bank Account No." = Bank_Acc__Reconciliation."Bank Account No.";
//                 //DataItemTableFilter = "Remaining Amount"=filter(<>0), open=const(Yes),"Statement Status"=filter(Open),Reversed=const(No);
//                 column(BankLedger_Entry_No; "Entry No.")
//                 {
//                 }
//                 column(BankLedger_Bank_Account_No; "Bank Account No.")
//                 {
//                 }
//                 column(BankLedger_Posting_Date; "Posting Date")
//                 {
//                 }
//                 column(BankLedger_Document_No; "Document No.")
//                 {
//                 }
//                 column(BankLedger_Description; Description)
//                 {
//                 }
//                 column(BankLedger_Remaining_Amount; "Remaining Amount")
//                 {
//                 }
//                 column(BankLedger_Open; Open)
//                 {
//                 }
//                 column(BankLedger_Statement_Status; "Statement Status")
//                 {
//                 }
//                 column(BankLedger_Ext_Doc_No; "External Document No.")
//                 {
//                 }
//                 column(BankLedger_Reversed; Reversed)
//                 {
//                 }
//             }
//         }
//     }
// }
