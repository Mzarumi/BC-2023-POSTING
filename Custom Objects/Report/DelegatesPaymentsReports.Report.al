// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185731 "Delegates Payments Reports"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Delegates Payments Reports.rdlc';

//     dataset
//     {
//         dataitem(52186067;52186067)
//         {
//             DataItemTableView = where(Posted=const(Yes),"Total Payment"=filter(<>0));
//             RequestFilterFields = "Delegate Region","Posted By","Date Posted","Transaction Type",Type;
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
//             column("Code";"Delegates Payment".Code)
//             {
//             }
//             column(DelegateRegion;"Delegates Payment"."Delegate Region")
//             {
//             }
//             column(DelegateRegionDescription;"Delegates Payment"."Delegate Region Description")
//             {
//             }
//             column(ElectoralZone;"Delegates Payment"."Electoral Zone")
//             {
//             }
//             column(ElectoralZoneName;"Delegates Payment"."Electoral Zone Name")
//             {
//             }
//             column(DatePosted;"Delegates Payment"."Date Posted")
//             {
//             }
//             column(PostedBy;"Delegates Payment"."Posted By")
//             {
//             }
//             column(PostingDate;"Delegates Payment"."Posting Date")
//             {
//             }
//             column(PaymentDescription;"Delegates Payment"."Payment Description")
//             {
//             }
//             column(TotalPayment;"Delegates Payment"."Total Payment")
//             {
//             }
//             column(TransactionType;"Delegates Payment"."Transaction Type")
//             {
//             }
//             column(PaymentFrequency;"Delegates Payment"."Payment Frequency")
//             {
//             }
//             column(PeriodEndingDate;"Delegates Payment"."Period Ending Date")
//             {
//             }
//             column(MinuteNo;"Delegates Payment"."Minute No.")
//             {
//             }
//             column(Type;"Delegates Payment".Type)
//             {
//             }
//             dataitem(52186068;52186068)
//             {
//                 DataItemLink = Code=field(Code),"Delegate Region"=field("Delegate Region"),"Payment Frequency"=field("Payment Frequency");
//                 column(ReportForNavId_7; 7)
//                 {
//                 }
//                 column(DelegateMNo;"Delegate Payment Line"."Delegate MNO.")
//                 {
//                 }
//                 column(DelegateName;"Delegate Payment Line"."Delegate Name")
//                 {
//                 }
//                 column(TariffCode;Tarrif)
//                 {
//                 }
//                 column(AmountPayable;"Delegate Payment Line"."Amount Payable")
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     RegionDelegatesTariff.Reset;
//                     RegionDelegatesTariff.SetRange("Region Code","Delegate Payment Line"."Delegate Region");
//                     RegionDelegatesTariff.SetRange(Code,"Delegate Payment Line"."Tariff Code");
//                     if RegionDelegatesTariff.Find('-') then begin
//                     Tarrif:=RegionDelegatesTariff.Description;
//                     end;
//                 end;
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
//         RegionDelegatesTariff: Record 52186059;
//         Tarrif: Text;
// }
