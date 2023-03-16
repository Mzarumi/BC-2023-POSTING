// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185856 "Tenant Invoices"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Tenant Invoices.rdlc';

//     dataset
//     {
//         dataitem(52186025;52186025)
//         {
//             RequestFilterFields = "No.";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(No_LeasesBilled;"Leases Billed"."No.")
//             {
//             }
//             column(PropertyNo_LeasesBilled;"Leases Billed"."Property No.")
//             {
//             }
//             column(BatchNo_LeasesBilled;"Leases Billed"."Batch No")
//             {
//             }
//             column(LeasedAmount_LeasesBilled;"Leases Billed"."Leased Amount")
//             {
//             }
//             column(LeasedVATAmount_LeasesBilled;"Leases Billed"."Leased VAT Amount")
//             {
//             }
//             column(TotalInclVAT_LeasesBilled;"Leases Billed"."Total Incl. VAT")
//             {
//             }
//             column(CompanyInfoPicture;CompanyInfo.Picture)
//             {
//             }
//             column(LastBillDate;"Leases Billed"."Last Bill Date")
//             {
//             }
//             column(NextBillDate;"Leases Billed"."Next Bill Date")
//             {
//             }
//             column(BatchNo;"Leases Billed"."Batch No")
//             {
//             }
//             column(CompanyInfoName;CompanyInfo.Name)
//             {
//             }
//             column(CompanyInfoAddress;CompanyInfo.Address)
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
//         CompanyInfo.Get;
//         CompanyInfo.CalcFields(Picture);
//     end;

//     var
//         StrCopyText: Text[30];
//         LastFieldNo: Integer;
//         FooterPrinted: Boolean;
//         DimVal: Record "Dimension Value";
//         DimValName: Text[30];
//         TTotal: Decimal;
//         CheckReport: Report Check;
//                          NumberText: array [2] of Text[80];
//                          STotal: Decimal;
//                          InvoiceCurrCode: Code[10];
//                          CurrCode: Code[10];
//                          GLSetup: Record "General Ledger Setup";
//                          DOCNAME: Text[30];
//                          VATCaptionLbl: label 'VAT';
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
//         CreationDoc: Boolean;
//         ChequeNo: Code[10];
//         UserSetup: Record "User Setup";
//         UserName: Text;
// }
