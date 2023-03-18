// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185769 "Contract Status"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Contract Status.rdlc';

//     dataset
//     {
//         dataitem(Contrac ContractsRequestFilterFields = "Cont "St art Date", te", Date", e","End Date";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(ContractNo_Contrac ts;Contracts."Contract No")
//             {
//             }
//             column(Name_Contrac ts;Contracts."Contractor Name")
//             {
//             }
//             column(StartDate_Contrac ts;Contracts."Start Date")
//             {
//             }
//             column(EndDate_Contrac ts;Contracts."End Date")
//             {
//             }
//             column(ContractValue_Contrac ts;Contracts."Contract Amount")
//             {
          
//            column(SerialN o;SerialNo)
//             {
//             } 
//             column(ContractStatus;Contracts."Contract Description")
//             {
//             } 
//             column(Picture;CompInfo.Picture)
//             {
//             } 
//             column(ContractorNo_Contracts;Contracts."Contractor No")
//             {
//             } 
//             column(Type_Contracts;Contracts."Contractor Type")
//             {
//             } 
//             column(Balance_Contracts;Contracts.Balance)
//             {
//             } 
//             column(TotalBalance_Contracts;Contracts."Total Balance")
//             {
//             } 
//             // column(Category_Contracts;Contracts.Category)
//             // {
//             // }
//             // column(RenewedContract_Contracts;Contracts."Renewed Contract")
//             // {
//             // }
//             column(Terminated_Contracts;Contracts.Terminated)
//             { 
//             }
//             column(TerminationReason_Contracts;Contracts."Termination Reason")
//             {
//             }
//             column(Status_Contracts;Contracts.Status)
//             { += 
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 SerialNo+=1;
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

//     trigger OnPreReport()
//     begin
//                CompInfo.Reset;
//                CompInfo.Get();
//                CompInfo.CalcFields(CompInfo.Picture);
//     end;

//     var
//         SerialNo: Integer;
//         CompInfo: Record "Company Information";
// }
