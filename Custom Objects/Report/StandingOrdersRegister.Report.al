// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185678 "Standing Orders Register"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Standing Orders Register.rdlc';

//     dataset
//     {
//         dataitem("Standing Order Register";"Standing Order Register")
//         {
//             RequestFilterFields = "Source Account No.","Standing Order No.","No.";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(No;"Standing Order Register"."Document No.")
//             {
//             }
//             column(SourceAccount;"Standing Order Register"."Source Account No.")
//             {
//             }
//             column(SourceName;"Standing Order Register"."Source Account Name")
//             {
//             }
//             column(StaffNo;"Standing Order Register"."Staff/Payroll No.")
//             {
//             }
//             column(MemberNo;"Standing Order Register"."Member No")
//             {
//             }
//             column(DeductionStatus;"Standing Order Register"."Deduction Status")
//             {
//             }
//             column(Amount;"Standing Order Register".Amount)
//             {
//             }
//             column(AmountDeducted;"Standing Order Register"."Amount Deducted")
//             {
//             }
//             column(EfectiveStartDate;"Standing Order Register"."Effective/Start Date")
//             {
//             }
//             column(Duration;"Standing Order Register".Duration)
//             {
//             }
//             column(EndDate;"Standing Order Register"."End Date")
//             {
//             }
//             column(DestinationType;"Standing Order Register"."Destination Account Type")
//             {
//             }
//             column(Remarks;"Standing Order Register".Remarks)
//             {
//             }
//             column(CName;CompanyInformation.Name)
//             {
//             }
//             column(CAddress;CompanyInformation.Address)
//             {
//             }
//             column(CPicture;CompanyInformation.Picture)
//             {
//             }
//             column(DateProcessed;"Standing Order Register"."Date Processed")
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

//     trigger OnPreReport()
//     begin
//         CompanyInformation.Get;
//         CompanyInformation.CalcFields(Picture);
//     end;

//     var
//         CompanyInformation: Record "Company Information";
// }
