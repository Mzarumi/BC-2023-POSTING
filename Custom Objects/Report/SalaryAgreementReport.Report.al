// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185870 "Salary Agreement Report"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Salary Agreement Report.rdlc';

//     dataset
//     {
//         dataitem("Salary Agreement";"Salary Agreement")
//         {
//             DataItemTableView = where(Status=filter(<>Rejected));
//             RequestFilterFields = "Member No","Payroll No","Date Captured",Category;
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(CompanyInfoName;CompanyInfo.Name)
//             {
//             }
//             column(CompanyInfoAddress;CompanyInfo.Address)
//             {
//             }
//             column(MemberNo;"Salary Agreement"."Member No")
//             {
//             }
//             column(MemberName;"Salary Agreement"."Member Name")
//             {
//             }
//             column(IDNo;"Salary Agreement"."ID No")
//             {
//             }
//             column(PayrollNo;"Salary Agreement"."Payroll No")
//             {
//             }
//             column(Department;"Salary Agreement".Department)
//             {
//             }
//             column(Ministry;"Salary Agreement".Ministry)
//             {
//             }
//             column(FosaAccountNo;"Salary Agreement"."Fosa Account No")
//             {
//             }
//             column(WithEffectFrom;"Salary Agreement"."With Effect From")
//             {
//             }
//             column(Category;"Salary Agreement".Category)
//             {
//             }
//             column(DateCaptured;"Salary Agreement"."Date Captured")
//             {
//             }
//             column(Picture;CompanyInfo.Picture)
//             {
//             }
//             column(Adopted;Adopted)
//             {
//             }
//             column(period;period)
//             {
//             }
//             column(RecruitedBy_SalaryAgreement;"Salary Agreement"."Recruited By")
//             {
//             }
//             column(FormattedPeriod;FormattedPeriod)
//             {
//             }
//             column(DateCapturedF;DateCapturedF)
//             {
//             }
//             column(PreviewUserid;PreviewUserid)
//             {
//             }
//             column(PreviewDate;PreviewDate)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 SavingsAccounts.Reset;
//                 SavingsAccounts.SetRange("No.","Salary Agreement"."Fosa Account No");
//                 if SavingsAccounts.Find('-') then
//                   Adopted:=SavingsAccounts."Salary Through FOSA";
//                 DateCapturedF := Format(Date2dmy("Salary Agreement"."Date Captured",1))+'/'+Format(Date2dmy("Salary Agreement"."Date Captured",2))
//                 +'/'+Format(Date2dmy("Salary Agreement"."Date Captured",3));

//                 PreviewUserid:=UserId;
//                 PreviewDate:=Format(Date2dmy(Today,1))+'/'+Format(Date2dmy(Today,2))+'/'+Format(Date2dmy(Today,3));
//             end;

//             trigger OnPreDataItem()
//             begin
//                 if period=0D then Error('You must specify the period');
//                 "Salary Agreement".SetRange("Salary Agreement"."With Effect From",period);
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field(period;period)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Period';
//                     TableRelation = "Interest Due Period";
//                 }
//             }
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
//         CompanyInfo.Get;
//         CompanyInfo.CalcFields(Picture);
//         FormattedPeriod := Format(Date2dmy(period,1))+'/'+Format(Date2dmy(period,2))+'/'+Format(Date2dmy(period,3));
//     end;

//     var
//         VATCaptionLbl: label 'VAT';
//         PAYMENT_DETAILSCaptionLbl: label 'PAYMENT DETAILS';
//         AMOUNTCaptionLbl: label 'AMOUNT';
//         NET_AMOUNTCaptionLbl: label 'AMOUNT';
//         W_TAXCaptionLbl: label 'W/TAX';
//         Document_No___CaptionLbl: label 'Document No. :';
//         Currency_CaptionLbl: label 'Currency:';
//         Payment_To_CaptionLbl: label 'Payment To:';
//         Document_Date_CaptionLbl: label 'Document Date:';
//         Cheque_No__CaptionLbl: label 'Cheque No.:';
//         R_CENTERCaptionLbl: label 'R.CENTER CODE';
//         PROJECTCaptionLbl: label 'PROJECT CODE';
//         TotalCaptionLbl: label 'Total';
//         Printed_By_CaptionLbl: label 'Printed By:';
//         Amount_in_wordsCaptionLbl: label 'Amount in words';
//         EmptyStringCaptionLbl: label '================================================================================================================================================================================================';
//         EmptyStringCaption_Control1102755013Lbl: label '================================================================================================================================================================================================';
//         Amount_in_wordsCaption_Control1102755021Lbl: label 'Amount in words';
//         Printed_By_Caption_Control1102755026Lbl: label 'Printed By:';
//         TotalCaption_Control1102755033Lbl: label 'Total';
//         Signature_CaptionLbl: label 'Signature:';
//         Date_CaptionLbl: label 'Date:';
//         Name_CaptionLbl: label 'Name:';
//         RecipientCaptionLbl: label 'Recipient';
//         CompanyInfo: Record "Company Information";
//         BudgetLbl: label 'Budget';
//         UserSetup: Record "User Setup";
//         SavingsAccounts: Record 52185730;
//         Adopted: Boolean;
//         period: Date;
//         FormattedPeriod: Text;
//         DateCapturedF: Text;
//         PreviewUserid: Code[50];
//         PreviewDate: Text;
// }
