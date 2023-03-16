// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185453 "Send PIN"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Send PIN.rdlc';

//     dataset
//     {
//         dataitem(Send; Send)
//         {
//             column(ReportForNavId_1; 1)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin


//                 SavingsAccounts.Reset;
//                 SavingsAccounts.SetRange("Transactional Mobile No", "Mobile No.");
//                 if SavingsAccounts.FindFirst then begin


//                     Auth.Reset;
//                     Auth.SetRange("Account No.", SavingsAccounts."No.");
//                     Auth.SetRange("Mobile No.", Send."Mobile No.");
//                     if not Auth.FindFirst then begin
//                         Auth.Init;
//                         Auth."Mobile No." := SavingsAccounts."Transactional Mobile No";
//                         Auth."Account No." := SavingsAccounts."No.";
//                         Auth."User Status" := Auth."user status"::Active;
//                         Auth.Insert;
//                         SkyMbanking.GenerateNewPin(CopyStr(SavingsAccounts."Transactional Mobile No", 2, 12));
//                         Send.Sent := true;
//                         Send.Modify;
//                         Commit;
//                     end;
//                 end;
//             end;

//             trigger OnPreDataItem()
//             begin

//                 Send.SetRange(Sent, false);
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     var
//         Auth: Record 52185476;
//         SavingsAccounts: Record 52185730;
//         SkyMbanking: Codeunit 52185423;
// }
