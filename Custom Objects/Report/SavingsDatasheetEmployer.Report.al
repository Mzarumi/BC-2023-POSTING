// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185671 "Savings Datasheet Employer"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Savings Datasheet Employer.rdlc';

//     dataset
//     {
//         dataitem(Customer; Customer)
//         {
//             DataItemTableView = where("Account Type" = filter(Employer));
//             RequestFilterFields = "No.";
//             column(ReportForNavId_2; 2)
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
//             column(Name; Customer.Name)
//             {
//             }
//             column(No; Customer."No.")
//             {
//             }
//             column(AcctCount; AcctCount)
//             {
//             }
//             column(Period; Period)
//             {
//             }
//             dataitem(52185818;52185818)
//             {
//                 DataItemLink = "Employer Code"=field("No.");
//                 DataItemTableView = where("Product Type"=filter(03|02));
//                 RequestFilterFields = "Advice Date";
//                 column(ReportForNavId_1; 1)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin

//                     AcctCount:=AcctCount+1;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     if "Checkoff Advice Line".GetFilter("Checkoff Advice Line"."Advice Date") ='' then
//                       Error('Kindly specify the Advice date filter');
//                     Period:="Checkoff Advice Line".GetFilter("Checkoff Advice Line"."Advice Date");
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 AcctCount:=1;
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
//         AcctCount: Integer;
//         NoC: Integer;
//         CheckoffAdviceLine: Record 52185818;
//         CompanyInformation: Record "Company Information";
//         Period: Text;
// }
