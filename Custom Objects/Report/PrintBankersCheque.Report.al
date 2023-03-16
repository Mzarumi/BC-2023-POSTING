// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185437 "Print Bankers Cheque"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Print Bankers Cheque.rdlc';

//     dataset
//     {
//         dataitem("Cashier Transactions";"Cashier Transactions")
//         {
//             DataItemTableView = sorting("No. Series");
//             RequestFilterFields = "No. Series";
//             column(ReportForNavId_6437; 6437)
//             {
//             }
//             column(DOCNAME;DOCNAME)
//             {
//             }
//             column(Payments_Header__No__;"Cashier Transactions".No)
//             {
//             }
//             column(CurrCode;CurrCode)
//             {
//             }
//             column(StrCopyText;StrCopyText)
//             {
//             }
//             column(Payee;"Cashier Transactions".Payee)
//             {
//             }
//             column(USERID;UserId)
//             {
//             }
//             column(NumberText_1_;NumberText[1])
//             {
//             }
//             column(NumberText_2_;NumberText[2])
//             {
//             }
//             column(TTotal;"Cashier Transactions".Amount)
//             {
//             }
//             column(TIME_PRINTED_____FORMAT_TIME_;'TIME PRINTED:' + Format(Time))
//             {
//                 AutoFormatType = 1;
//             }
//             column(DATE_PRINTED_____FORMAT_TODAY_0_4_;'DATE PRINTED:' + Format(Today,0,4))
//             {
//                 AutoFormatType = 1;
//             }
//             column(CurrCode_Control1102756010;CurrCode)
//             {
//             }
//             column(CurrCode_Control1102756012;CurrCode)
//             {
//             }
//             column(Approved_;'Approved')
//             {
//                 AutoFormatType = 1;
//             }
//             column(Approval_Status_____;'Approval Status'+':')
//             {
//                 AutoFormatType = 1;
//             }
//             column(TIME_PRINTED_____FORMAT_TIME__Control1102755003;'TIME PRINTED:' + Format(Time))
//             {
//                 AutoFormatType = 1;
//             }
//             column(DATE_PRINTED_____FORMAT_TODAY_0_4__Control1102755004;'DATE PRINTED:' + Format(Today,0,4))
//             {
//                 AutoFormatType = 1;
//             }
//             column(USERID_Control1102755012;UserId)
//             {
//             }
//             column(NumberText_1__Control1102755016;NumberText[1])
//             {
//             }
//             column(TTotal_Control1102755034;TTotal)
//             {
//             }
//             column(CurrCode_Control1102755035;CurrCode)
//             {
//             }
//             column(CurrCode_Control1102755037;CurrCode)
//             {
//             }
//             column(VATCaption;VATCaptionLbl)
//             {
//             }
//             column(PAYMENT_DETAILSCaption;PAYMENT_DETAILSCaptionLbl)
//             {
//             }
//             column(AMOUNTCaption;AMOUNTCaptionLbl)
//             {
//             }
//             column(NET_AMOUNTCaption;NET_AMOUNTCaptionLbl)
//             {
//             }
//             column(W_TAXCaption;W_TAXCaptionLbl)
//             {
//             }
//             column(Document_No___Caption;Document_No___CaptionLbl)
//             {
//             }
//             column(Currency_Caption;Currency_CaptionLbl)
//             {
//             }
//             column(Payment_To_Caption;Payment_To_CaptionLbl)
//             {
//             }
//             column(Document_Date_Caption;Document_Date_CaptionLbl)
//             {
//             }
//             column(Cheque_No__Caption;Cheque_No__CaptionLbl)
//             {
//             }
//             // column(Payments_Header__Global_Dimension_1_Code_Caption;UnknownTable52185776.FieldCaption("Global Dimension 1 Code"))
//             // {
//             // }
//             column(R_CENTERCaption;R_CENTERCaptionLbl)
//             {
//             }
//             column(PROJECTCaption;PROJECTCaptionLbl)
//             {
//             }
//             column(TotalCaption;TotalCaptionLbl)
//             {
//             }
//             column(Printed_By_Caption;Printed_By_CaptionLbl)
//             {
//             }
//             column(Amount_in_wordsCaption;Amount_in_wordsCaptionLbl)
//             {
//             }
//             column(EmptyStringCaption;EmptyStringCaptionLbl)
//             {
//             }
//             column(EmptyStringCaption_Control1102755013;EmptyStringCaption_Control1102755013Lbl)
//             {
//             }
//             column(Amount_in_wordsCaption_Control1102755021;Amount_in_wordsCaption_Control1102755021Lbl)
//             {
//             }
//             column(Printed_By_Caption_Control1102755026;Printed_By_Caption_Control1102755026Lbl)
//             {
//             }
//             column(TotalCaption_Control1102755033;TotalCaption_Control1102755033Lbl)
//             {
//             }
//             column(Signature_Caption;Signature_CaptionLbl)
//             {
//             }
//             column(Date;"Cashier Transactions"."Transaction Date")
//             {
//             }
//             column(Name_Caption;Name_CaptionLbl)
//             {
//             }
//             column(RecipientCaption;RecipientCaptionLbl)
//             {
//             }
//             column(CompanyInfoName;CompanyInfo.Name)
//             {
//             }
//             column(CompanyInfoAddress;CompanyInfo.Address)
//             {
//             }
//             column(CompanyInfoAddress2;CompanyInfo."Address 2")
//             {
//             }
//             column(CompanyInfoPic;CompanyInfo.Picture)
//             {
//             }

//             trigger OnAfterGetRecord()
//             // begin
//             //     CheckReport.InitTextVariable();
//             //     CheckReport.FormatNoText(NumberText,(ROUND("Cashier Transactions".Amount,0.01,'=')),'');
//             // end;

//             // trigger OnPreDataItem()
//             // begin

//             //     LastFieldNo := UnknownTable52185776.FieldNo(No);
//             // end;
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
//                          NumberText: array [2] of Text[200];
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
// }
