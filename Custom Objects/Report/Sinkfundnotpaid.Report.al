// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185943 "Sinkfund not paid"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Sinkfund not paid.rdlc';

//     dataset
//     {
//         dataitem(SinkFund; SinkFund)
//         {
//             DataItemTableView = where(Status = filter(Approved));
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(Notice_Number; SinkFund.No)
//             {
//             }
//             column(Member_No; SinkFund."Member No")
//             {
//             }
//             column(Member_Name; SinkFund."Member Name")
//             {
//             }
//             column(Notice_Date; SinkFund.Date)
//             {
//             }
//             column(Death_Date; SinkFund."Date of Death")
//             {
//             }
//             column(Claim_Option; SinkFund."Claim Option")
//             {
//             }
//             column(Deceased_Person; SinkFund."Deceased Person")
//             {
//             }
//             column(Claim_Amount; SinkFund."Benevolent Claim Amount")
//             {
//             }
//             column(Company_Name; Company.Name)
//             {
//             }
//             column(Company_Picture; Company.Picture)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 BBFheader.Reset;
//                 BBFheader.SetRange("Report Notice No", SinkFund.No);
//                 if BBFheader.FindFirst then
//                     if BBFheader.Posted = true then
//                         CurrReport.Skip;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 Company.Get;
//                 Company.CalcFields(Picture);
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
//         Company: Record "Company Information";
//         BBFheader: Record 52186126;
// }
