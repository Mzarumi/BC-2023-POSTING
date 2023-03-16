// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185730 "Posted Checkoff Receipts"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Posted Checkoff Receipts.rdlc';

//     dataset
//     {
//         dataitem(52185819;52185819)
//         {
//             DataItemTableView = where(Posted=const(Yes));
//             RequestFilterFields = "Entered By","Posting Date","Account No.","Employer Code";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(CompanyInformation_Name;CompanyInformation.Name)
//             {
//             }
//             column(CompanyInformation_Picture;CompanyInformation.Picture)
//             {
//             }
//             column(CompanyAddress;CompanyAddress)
//             {
//             }
//             column(CompanyTelephone;CompanyTelephone)
//             {
//             }
//             column(CommunicationOnline;CommunicationOnline)
//             {
//             }
//             column(SNo;"SNo.")
//             {
//             }
//             column(EnteredBy;"Checkoff Header"."Entered By")
//             {
//             }
//             column(PostingDate;"Checkoff Header"."Posting Date")
//             {
//             }
//             column(AccountType;"Checkoff Header"."Account Type")
//             {
//             }
//             column(EmployerCode;"Checkoff Header"."Employer Code")
//             {
//             }
//             column(EmployerName;"Checkoff Header"."Employer Name")
//             {
//             }
//             column(DocumentNo;"Checkoff Header"."Document No.")
//             {
//             }
//             column(ScheduleAmount;"Checkoff Header".Amount)
//             {
//             }
//             column(DateEntered;"Checkoff Header"."Date Entered")
//             {
//             }
//             column(No;"Checkoff Header"."No.")
//             {
//             }
//             column(Status;"Checkoff Header".Status)
//             {
//             }
//             dataitem(52185820;52185820)
//             {
//                 DataItemLink = "Checkoff Header"=field("No.");
//                 DataItemTableView = where(Posted=const(Yes));
//                 column(ReportForNavId_12; 12)
//                 {
//                 }
//                 column(Posted;"Checkoff Lines".Posted)
//                 {
//                 }
//                 column(Type_CheckoffLines;"Checkoff Lines".Type)
//                 {
//                 }
//                 column(CreditAccount;"Checkoff Lines"."Credit Account")
//                 {
//                 }
//                 column(Name;"Checkoff Lines".Name)
//                 {
//                 }
//                 column(SavingsAccount;"Checkoff Lines"."Savings Account")
//                 {
//                 }
//                 column(Amount;"Checkoff Lines".Amount)
//                 {
//                 }
//                 column(LoanNo;"Checkoff Lines"."Loan No.")
//                 {
//                 }
//                 column(MemberNo;"Checkoff Lines"."Member No.")
//                 {
//                 }
//                 column(AccountNo;"Checkoff Lines"."Account No.")
//                 {
//                 }
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 "SNo."+=1;
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
//         if CompanyInformation.Get then
//           CompanyInformation.CalcFields(CompanyInformation.Picture);
//           CompanyAddress:= CompanyInformation.Address+' -Post Code: '+CompanyInformation."Post Code"+' -City:'+CompanyInformation.City+' Region: '+ CompanyInformation."Country/Region Code";
//           CompanyTelephone :='Tel: '+CompanyInformation."Phone No."+' -Office Tel: '+CompanyInformation."Phone No. 2";
//           CommunicationOnline:='E-mail: '+CompanyInformation."E-Mail"+'- Website: '+CompanyInformation."Home Page";
//     end;

//     var
//         CompanyInformation: Record "Company Information";
//         CompanyAddress: Text;
//         CompanyTelephone: Text;
//         CommunicationOnline: Text;
//         "SNo.": Integer;
// }
