// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185703 "BBF Claim Report"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/BBF Claim Report.rdlc';

//     dataset
//     {
//         dataitem("BFF Requisation Header"; "BFF Requisation Header")
//         {
//             column(ReportForNavId_25; 25)
//             {
//             }
//             column(CompanyName; CompanyInformation.Name)
//             {
//             }
//             column(Picture; CompanyInformation.Picture)
//             {
//             }
//             column(SNO; sno)
//             {
//             }
//             column(No_BBFRequisationHeader; "BBF Requisation Header".No)
//             {
//             }
//             column(Date_BBFRequisationHeader; "BBF Requisation Header".Date)
//             {
//             }
//             column(CapturedBy_BBFRequisationHeader; "BBF Requisation Header"."Captured By")
//             {
//             }
//             column(Amount_BBFRequisationHeader; "BBF Requisation Header".Amount)
//             {
//             }
//             column(MemberNo_BBFRequisationHeader; "BBF Requisation Header"."Member No")
//             {
//             }
//             column(AccountName_BBFRequisationHeader; "BBF Requisation Header"."Account Name")
//             {
//             }
//             column(ResponsibilyCenter_BBFRequisationHeader; "BBF Requisation Header"."Responsibily Center")
//             {
//             }
//             column(Type_BBFRequisationHeader; "BBF Requisation Header".Type)
//             {
//             }
//             column(NoSeries_BBFRequisationHeader; "BBF Requisation Header"."No. Series")
//             {
//             }
//             column(Status_BBFRequisationHeader; "BBF Requisation Header".Status)
//             {
//             }
//             column(Payed_BBFRequisationHeader; "BBF Requisation Header".Payed)
//             {
//             }
//             column(Posted_BBFRequisationHeader; "BBF Requisation Header".Posted)
//             {
//             }
//             column(GlobalDimension1Code_BBFRequisationHeader; "BBF Requisation Header"."Global Dimension 1 Code")
//             {
//             }
//             column(GlobalDimension2Code_BBFRequisationHeader; "BBF Requisation Header"."Global Dimension 2 Code")
//             {
//             }
//             column(PaymentReleaseDate_BBFRequisationHeader; "BBF Requisation Header"."Payment Release Date")
//             {
//             }
//             dataitem(52186127;52186127)
//             {
//                 column(ReportForNavId_1; 1)
//                 {
//                 }
//                 column(EntryNo_BBFRequisationLines;"BBF Requisation Lines"."Entry No.")
//                 {
//                 }
//                 column(MemberNo_BBFRequisationLines;"BBF Requisation Lines"."Member No")
//                 {
//                 }
//                 column(Name_BBFRequisationLines;"BBF Requisation Lines".Name)
//                 {
//                 }
//                 column(Relationship_BBFRequisationLines;"BBF Requisation Lines".Relationship)
//                 {
//                 }
//                 column(Beneficiary_BBFRequisationLines;"BBF Requisation Lines".Beneficiary)
//                 {
//                 }
//                 column(DateofBirth_BBFRequisationLines;"BBF Requisation Lines"."Date of Birth")
//                 {
//                 }
//                 column(Address_BBFRequisationLines;"BBF Requisation Lines".Address)
//                 {
//                 }
//                 column(Telephone_BBFRequisationLines;"BBF Requisation Lines".Telephone)
//                 {
//                 }
//                 column(Fax_BBFRequisationLines;"BBF Requisation Lines".Fax)
//                 {
//                 }
//                 column(Email_BBFRequisationLines;"BBF Requisation Lines".Email)
//                 {
//                 }
//                 column(IDNo_BBFRequisationLines;"BBF Requisation Lines"."ID No.")
//                 {
//                 }
//                 column(Allocation_BBFRequisationLines;"BBF Requisation Lines"."%Allocation")
//                 {
//                 }
//                 column(Type_BBFRequisationLines;"BBF Requisation Lines".Type)
//                 {
//                 }
//                 column(Deceased_BBFRequisationLines;"BBF Requisation Lines".Deceased)
//                 {
//                 }
//                 column(BBFEntitlementCode_BBFRequisationLines;"BBF Requisation Lines"."BBF Entitlement Code")
//                 {
//                 }
//                 column(BBFEntitlement_BBFRequisationLines;"BBF Requisation Lines"."BBF Entitlement")
//                 {
//                 }
//                 column(LineNo_BBFRequisationLines;"BBF Requisation Lines"."Line No.")
//                 {
//                 }
//                 column(AccountNo_BBFRequisationLines;"BBF Requisation Lines"."Account No.")
//                 {
//                 }
//                 column(NextofKin_BBFRequisationLines;"BBF Requisation Lines"."Next of Kin")
//                 {
//                 }
//                 column(Posted_BBFRequisationLines;"BBF Requisation Lines".Posted)
//                 {
//                 }
//                 column(HeaderNo_BBFRequisationLines;"BBF Requisation Lines"."Header No")
//                 {
//                 }
//                 column(LoanNo_BBFRequisationLines;"BBF Requisation Lines"."Loan No.")
//                 {
//                 }
//                 column(TransactionType_BBFRequisationLines;"BBF Requisation Lines"."Transaction Type")
//                 {
//                 }
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 sno+=1;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 CompanyInformation.Get();
//                 CompanyInformation.CalcFields(CompanyInformation.Picture);
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
//         sno: Integer;
//         CompanyInformation: Record "Company Information";
// }
