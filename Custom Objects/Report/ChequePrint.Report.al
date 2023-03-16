// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185663 "Cheque Print"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Cheque Print.rdlc';

//     dataset
//     {
//         dataitem("Payments Header"; "Payments Header")
//         {
//             DataItemTableView = sorting("No.");
//             RequestFilterFields = "No.";
//             column(ReportForNavId_6437; 6437)
//             {
//             }
//             // column(DOCNAME; DOCNAME)
//             // {
//             // }
//             // column(Payments_Header__No__; "No.")
//             // {
//             // }
//             // column(CurrCode; CurrCode)
//             // {
//             // }
//             // column(StrCopyText; StrCopyText)
//             // {
//             // }
//             column(Payments_Header__Cheque_No__; "Cheque No.")
//             {
//             }
//             column(Payments_Header_Payee; Payee)
//             {
//             }
//             column(Payments_Header__Payments_Header__Date; "Payments Header".Date)
//             {
//             }
//             column(Payments_Header__Global_Dimension_1_Code_; "Global Dimension 1 Code")
//             {
//             }
//             column(Payments_Header__Shortcut_Dimension_2_Code_; "Shortcut Dimension 2 Code")
//             {
//             }
//             column(USERID; UserId)
//             {
//             }
//             // column(NumberText_1_; NumberText[1])
//             // {
//             // }
//             // column(NumberText_2_; NumberText[2])
//             // {
//             // }
//             // column(TTotal; TTotal)
//             // {
//             // }
//             column(TIME_PRINTED_____FORMAT_TIME_; 'TIME PRINTED:' + Format(Time))
//             {
//                 AutoFormatType = 1;
//             }
//             column(DATE_PRINTED_____FORMAT_TODAY_0_4_; 'DATE PRINTED:' + Format(Today, 0, 4))
//             {
//                 AutoFormatType = 1;
//             }
//             // column(CurrCode_Control1102756010; CurrCode)
//             // {
//             // }
//             // column(CurrCode_Control1102756012; CurrCode)
//             // {
//             // }
//             column(Approved_; 'Approved')
//             {
//                 AutoFormatType = 1;
//             }
//             column(Approval_Status_____; 'Approval Status' + ':')
//             {
//                 AutoFormatType = 1;
//             }
//             column(TIME_PRINTED_____FORMAT_TIME__Control1102755003; 'TIME PRINTED:' + Format(Time))
//             {
//                 AutoFormatType = 1;
//             }
//             column(DATE_PRINTED_____FORMAT_TODAY_0_4__Control1102755004; 'DATE PRINTED:' + Format(Today, 0, 4))
//             {
//                 AutoFormatType = 1;
//             }
//             column(USERID_Control1102755012; UserId)
//             {
//             }
//             // column(NumberText_1__Control1102755016; NumberText[1])
//             // {
//             // }
//             // column(TTotal_Control1102755034; TTotal)
//             // {
//             // }
//             // column(CurrCode_Control1102755035; CurrCode)
//             // {
//             // }
//             // column(CurrCode_Control1102755037; CurrCode)
//             // {
//             // }
//             // column(VATCaption; VATCaptionLbl)
//             // {
//             // }
//             // column(PAYMENT_DETAILSCaption; PAYMENT_DETAILSCaptionLbl)
//             // {
//             // }
//             // column(AMOUNTCaption; AMOUNTCaptionLbl)
//             // {
//             // }
//             // column(NET_AMOUNTCaption; NET_AMOUNTCaptionLbl)
//             // {
//             // }
//             // column(W_TAXCaption; W_TAXCaptionLbl)
//             // {
//             // }
//             // column(Document_No___Caption; Document_No___CaptionLbl)
//             // {
//             // }
//             // column(Currency_Caption; Currency_CaptionLbl)
//             // {
//             // }
//             // column(Payment_To_Caption; Payment_To_CaptionLbl)
//             // {
//             // }
//             // column(Document_Date_Caption; Document_Date_CaptionLbl)
//             // {
//             // }
//             // column(Cheque_No__Caption; Cheque_No__CaptionLbl)
//             // {
//             // }
//             // column(Payments_Header__Global_Dimension_1_Code_Caption; "Payments Header".FieldCaption("Global Dimension 1 Code"))
//             // {
//             // }
//             // column(Payments_Header__Shortcut_Dimension_2_Code_Caption; "Payments Header".FieldCaption("Shortcut Dimension 2 Code"))
//             // {
//             // }
//             // column(R_CENTERCaption; R_CENTERCaptionLbl)
//             // {
//             // }
//             // column(PROJECTCaption; PROJECTCaptionLbl)
//             // {
//             // }
//             // column(TotalCaption; TotalCaptionLbl)
//             // {
//             // }
//             // column(Printed_By_Caption; Printed_By_CaptionLbl)
//             // {
//             // }
//             // column(Amount_in_wordsCaption; Amount_in_wordsCaptionLbl)
//             // {
//             // }
//             // column(EmptyStringCaption; EmptyStringCaptionLbl)
//             // {
//             // }
//             // column(EmptyStringCaption_Control1102755013; EmptyStringCaption_Control1102755013Lbl)
//             // {
//             // }
//             // column(Amount_in_wordsCaption_Control1102755021; Amount_in_wordsCaption_Control1102755021Lbl)
//             // {
//             // }
//             // column(Printed_By_Caption_Control1102755026; Printed_By_Caption_Control1102755026Lbl)
//             // {
//             // }
//             // column(TotalCaption_Control1102755033; TotalCaption_Control1102755033Lbl)
//             // {
//             // }
//             // column(Signature_Caption; Signature_CaptionLbl)
//             // {
//             // }
//             // column(Date_Caption; Date_CaptionLbl)
//             // {
//             // }
//             // column(Name_Caption; Name_CaptionLbl)
//             // {
//             // }
//             // column(RecipientCaption; RecipientCaptionLbl)
//             // {
//             // }
//             // column(CompanyInfoName; CompanyInfo.Name)
//             // {
//             // }
//             // column(CompanyInfoAddress; CompanyInfo.Address)
//             // {
//             // }
//             // column(CompanyInfoAddress2; CompanyInfo."Address 2")
//             // {
//             // }
//             // column(CompanyInfoPic; CompanyInfo.Picture)
//             // {
//             // }
//             column(Bank; "Payments Header"."Paying Bank Account")
//             {
//                 IncludeCaption = true;
//             }
//             column(BankName; "Payments Header"."Bank Name")
//             {
//                 IncludeCaption = true;
//             }
//             column(PayMode; "Payments Header"."Pay Mode")
//             {
//                 IncludeCaption = true;
//             }
//             column(CreationDocNo_PaymentsHeader; "Payments Header"."Creation Doc No.")
//             {
//             }
//             // column(CreationDoc; CreationDoc)
//             // {
//             // }
//             column(MemberNo; "Payments Header"."Member No.")
//             {
//             }
//             column(Date; "Payments Header"."Payment Release Date")
//             {
//             }
//             column(BankersCheque; "Payments Header"."Bankers Cheque No")
//             {
//             }
//             column(Payee; "Payments Header".Payee)
//             {
//             }
//             column(TotalNetAmount; "Payments Header"."Total Net Amount")
//             {
//             }
//             column(TotalAmount; "Payments Header"."Total Payment Amount LCY")
//             {
//             }
//             dataitem("Payment Line";"Payment Line")
//             {
//                 DataItemLink = No = field("No.");
//                 DataItemTableView = sorting("Line No.", No, Type) order(ascending);
//                 column(ReportForNavId_3474; 3474)
//                 {
//                 }
//                 column(Payment_Line__Net_Amount__; "Net Amount")
//                 {
//                 }
//                 column(Payment_Line_Amount; Amount)
//                 {
//                 }
//                 column(Transaction_Name_______Account_No________Account_Name_____; "Transaction Name" + '[' + "Account No." + ':' + "Account Name" + ']')
//                 {
//                 }
//                 column(AccountNo_PaymentLine; "Payment Line"."Account No.")
//                 {
//                 }
//                 column(AccountName_PaymentLine; "Payment Line"."Account Name")
//                 {
//                 }
//                 column(Payment_Line__Withholding_Tax_Amount_; "Withholding Tax Amount")
//                 {
//                 }
//                 column(Payment_Line__VAT_Amount_; "VAT Amount")
//                 {
//                 }
//                 column(Payment_Line__Global_Dimension_1_Code_; "Global Dimension 1 Code")
//                 {
//                 }
//                 column(Payment_Line__Shortcut_Dimension_2_Code_; "Shortcut Dimension 2 Code")
//                 {
//                 }
//                 column(Payment_Line_Line_No_; "Line No.")
//                 {
//                 }
//                 column(Payment_Line_No; No)
//                 {
//                 }
//                 column(Payment_Line_Type; Type)
//                 {
//                 }
//                 column(AppliestoDocNo_PaymentLine; "Payment Line"."Applies-to Doc. No.")
//                 {
//                 }
//                 column(AppliestoID_PaymentLine; "Payment Line"."Applies-to ID")
//                 {
//                 }
//                 column(CurrencyCode_PaymentLine; "Payment Line"."Currency Code")
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     DimVal.Reset;
//                     DimVal.SetRange(DimVal."Dimension Code", 'DEPARTMENT');
//                     DimVal.SetRange(DimVal.Code, "Shortcut Dimension 2 Code");
//                     DimValName := '';
//                     if DimVal.FindFirst then begin
//                         DimValName := DimVal.Name;
//                     end;

//                     TTotal := TTotal + "Net Amount";
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 StrCopyText := '';
//                 if "No. Printed" >= 1 then begin
//                     StrCopyText := 'DUPLICATE';
//                 end;
//                 TTotal := 0;

//                 if "Payments Header"."Payment Type" <> "Payments Header"."payment type"::"Petty Cash" then
//                     DOCNAME := 'PAYMENT VOUCHER'
//                 else
//                     DOCNAME := 'PETTY CASH VOUCHER';

//                 //Set currcode to Default if blank
//                 GLSetup.Get();
//                 if "Payments Header"."Currency Code" = '' then begin
//                     CurrCode := GLSetup."LCY Code";
//                 end else
//                     CurrCode := "Payments Header"."Currency Code";

//                 //For Inv Curr Code
//                 if "Payments Header"."Invoice Currency Code" = '' then begin
//                     InvoiceCurrCode := GLSetup."LCY Code";
//                 end else
//                     InvoiceCurrCode := "Payments Header"."Invoice Currency Code";

//                 //End;
//                 "Payments Header".CalcFields("Total Payment Amount", "Total Witholding Tax Amount", "Total Payment Amount LCY");
//                 // CheckReport.InitTextVariable();
//                 // CheckReport.FormatNoText(NumberText, (ROUND("Total Payment Amount LCY", 0.01, '=')), '');

//                 if "Payments Header"."Creation Doc No." = '' then
//                     CreationDoc := false
//                 else
//                     CreationDoc := true;
//             end;

//             trigger OnPostDataItem()
//             begin
//                 if CurrReport.Preview = false then begin
//                     "No. Printed" := "No. Printed" + 1;
//                     "Payments Header".Modify;
//                 end;
//             end;

//             trigger OnPreDataItem()
//             begin

//                 LastFieldNo := "Payments Header".FieldNo("No.");
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
//         //CheckReport: Report Check;
//                         //  NumberText: array[2] of Text[200];
//                         //  STotal: Decimal;
//                         //  InvoiceCurrCode: Code[10];
//                         //  CurrCode: Code[10];
//                         //  GLSetup: Record "General Ledger Setup";
//                         //  DOCNAME: Text[30];
//                         //  VATCaptionLbl: label 'VAT';
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
