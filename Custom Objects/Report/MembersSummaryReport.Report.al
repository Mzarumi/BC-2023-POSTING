// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185741 "Members Summary Report"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Members Summary Report.rdlc';

//     dataset
//     {
//         dataitem(Customer; Customer)
//         {
//             DataItemTableView = where("Account Type" = filter(Employer));
//             RequestFilterFields = "No.";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(CName; CompanyInformation.Name)
//             {
//             }
//             column(CAddress; CompanyInformation.Address)
//             {
//             }
//             column(CPicture; CompanyInformation.Picture)
//             {
//             }
//             column(No; Customer."No.")
//             {
//             }
//             column(Name; Customer.Name)
//             {
//             }
//             column(NoAcc; NoAcc)
//             {
//             }
//             dataitem(52185700;52185700)
//             {
//                 DataItemLink = "Employer Code"=field("No.");
//                 RequestFilterFields = "No.",Status;
//                 column(ReportForNavId_5; 5)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     NoAcc+=1;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 NoAcc:=0;
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
//         CompanyInformation.Get;
//         CompanyInformation.CalcFields(Picture);
//     end;

//     var
//         NoAcc: Integer;
//         CompanyInformation: Record "Company Information";
// }
