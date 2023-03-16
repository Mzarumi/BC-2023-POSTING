// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185784 "Posted Imprest Surrender"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Posted Imprest Surrender.rdlc';

//     dataset
//     {
//         dataitem(52185885;52185885)
//         {
//             RequestFilterFields = No;
//             column(ReportForNavId_8431; 8431)
//             {
//             }
//             column(Picture;CompanyInfo.Picture)
//             {
//             }
//             column(PF;"Imprest Surrender Header"."Account No.")
//             {
//             }
//             column(From;"Imprest Surrender Header"."Account Name")
//             {
//             }
//             column(Date;"Imprest Surrender Header"."Date Posted")
//             {
//             }
//             dataitem(52185886;52185886)
//             {
//                 DataItemLink = "Surrender Doc No."=field(No);
//                 column(ReportForNavId_9509; 9509)
//                 {
//                 }
//                 column(Purp;"Imprest Surrender Header"."Account Name")
//                 {
//                 }
//                 column(Amount;"Imprest Surrender Header".Amount)
//                 {
//                 }
//             }
//             dataitem(52185910;52185910)
//             {
//                 DataItemLink = No=field("Imprest Issue Doc. No");
//                 column(ReportForNavId_7; 7)
//                 {
//                 }
//                 column(Purpose;"Imprest Lines"."Account Name")
//                 {
//                 }
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
//         TRAVEL_ADVANCE_SURRENDERCaptionLbl: label 'TRAVEL ADVANCE SURRENDER';
//         Issue_Doc__No_CaptionLbl: label 'Issue Doc. No.';
//         Name_CaptionLbl: label 'Name:';
//         Total_Amount_IssuedCaptionLbl: label 'Total Amount Issued';
//         Date_CaptionLbl: label 'Date:';
//         PAYMENT_DETAILSCaptionLbl: label 'PAYMENT DETAILS';
//         ACTUAL_SPENTCaptionLbl: label 'ACTUAL SPENT';
//         CASH_SURRENDERCaptionLbl: label 'CASH SURRENDER';
//         TotalCaptionLbl: label 'Total';
//         Date_Caption_Control1102755030Lbl: label 'Date:';
//         Name_Caption_Control1102755034Lbl: label 'Name:';
//         Approved_By_CaptionLbl: label 'Approved By:';
//         Name_Caption_Control1102755036Lbl: label 'Name:';
//         Date_Caption_Control1102755037Lbl: label 'Date:';
//         Signature_CaptionLbl: label 'Signature:';
//         Printed_By_CaptionLbl: label 'Printed By:';
//         Prepared_By_CaptionLbl: label 'Prepared By:';
//         Signature_Caption_Control1102755042Lbl: label 'Signature:';
//         I_confirm_that_the_above_are_legitimate_business_expenses_and_have_not_been_claimed_before_CaptionLbl: label 'I confirm that the above are legitimate business expenses and have not been claimed before.';
//         EmptyStringCaptionLbl: label '================================================================================================================================================================================================';
//         Approvals_CaptionLbl: label 'Approvals:';
//         Amount_in_wordsCaptionLbl: label 'Amount in words';
//         AdvanceDetails: Text;
//         Lines: Record 52185910;
//         CompanyInfo: Record "Company Information";
// }
