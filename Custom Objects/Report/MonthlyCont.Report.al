// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185817 "Monthly Cont."
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Monthly Cont..rdlc';

//     dataset
//     {
//         dataitem(52185700;52185700)
//         {
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(EmployerCode_Members;Members."Employer Code")
//             {
//             }
//             column(No_Members;Members."No.")
//             {
//             }
//             column(Name_Members;Members.Name)
//             {
//             }
//             column(Amnt;Amnt)
//             {
//             }
//             column(MonthlyCont;MonthlyCont)
//             {
//             }
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
//         memberName: Text[100];
//         Employercode: Code[20];
//         SavingsLedgerEntry: Record 52185732;
//         ProductFactory: Record 52185690;
//         ProductName: Text[50];
//         Amnt: Decimal;
//         MonthlyCont: Decimal;
// }
