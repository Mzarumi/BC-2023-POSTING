// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52186001 "Delegates Payment Voucher"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Delegates Payment Voucher.rdlc';

//     dataset
//     {
//         dataitem("Company Information"; "Company Information")
//         {
//             DataItemTableView = sorting("Primary Key");
//             column(ReportForNavId_4; 4)
//             {
//             }
//             column(Name_CompanyInformation; "Company Information".Name)
//             {
//             }
//             column(Address_CompanyInformation; "Company Information".Address)
//             {
//             }
//             column(Picture_CompanyInformation; "Company Information".Picture)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 "Company Information".CalcFields("Company Information".Picture);
//             end;
//         }
//         dataitem(52185897;52185897)
//         {
//             column(ReportForNavId_1000000000; 1000000000)
//             {
//             }
//             column(cOMPnAME; COMPANYNAME)
//             {
//             }
//             column(Remarks; Remarks)
//             {
//             }
//             column(Amount; Amount)
//             {
//             }
//             column(TransNo; "Transaction No.")
//             {
//             }
//             column(TransDate; Format("Transaction Date", 0, 4))
//             {
//             }
//             column(UserID; "User ID")
//             {
//             }
//             column(Time; "Transaction Time")
//             {
//             }
//             column(PaymentType_PaymentsHeaderBoard; Format("Payments Header Delegates"."Payment Type") + ' Payment')
//             {
//             }
//             dataitem(52185898;52185898)
//             {
//                 DataItemLink = "Document No" = field("Transaction No.");
//                 DataItemTableView = sorting("Member No.");
//                 RequestFilterFields = "Member No.";
//                 column(ReportForNavId_1000000001; 1000000001)
//                 {
//                 }
//                 column(DocNo; "Document No")
//                 {
//                 }
//                 column(PaymentType; "Payment Types")
//                 {
//                 }
//                 column(MName; "Member Name")
//                 {
//                 }
//                 column(Description; Description)
//                 {
//                 }
//                 column(AmountLines; Amount)
//                 {
//                 }
//                 column(WitholdingTaxAmount; "Payment Line Delegate"."W/Tax Amount")
//                 {
//                 }
//                 column(Activity; "Shortcut Dimension 1 Code")
//                 {
//                 }
//                 column(Branch; "Shortcut Dimension 2 Code")
//                 {
//                 }
//                 column(EXTDOC; "External DOC No")
//                 {
//                 }
//                 column(Payee; Payee)
//                 {
//                 }
//                 column(net; Amount - Payee)
//                 {
//                 }
//                 column(MemberNo_PaymentLineBoard; "Payment Line Delegate"."Member No.")
//                 {
//                 }
//                 column(StaffNo_PaymentLineBoard; MbrNo)
//                 {
//                 }
//                 column(PaymentTypes_PaymentLineBoard; "Payment Line Delegate"."Payment Types")
//                 {
//                 }
//                 column(DailyRateAmount_PaymentLineBoard; "Payment Line Delegate"."Daily Rate(Amount)")
//                 {
//                 }
//                 column(NoofDays_PaymentLineBoard; "Payment Line Delegate"."No of Days")
//                 {
//                 }
//                 column(NetAmount_PaymentLineBoard; "Payment Line Delegate"."Net Amount")
//                 {
//                 }
//                 column(LineNo_PaymentLineBoard; "Payment Line Delegate"."Line No")
//                 {
//                 }
//                 column(PerDiemRate; PerDiemRate)
//                 {
//                 }
//                 column(PerDiemDays; PerDiemDays)
//                 {
//                 }
//                 column(PerDiemNet; PerDiemNet)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     /*
//                     Payee:=0;
//                     Payee:=ROUND((Amount-"Perdiem Amount")*3/10);
//                     */
//                     PerDiemDays := 0;
//                     PerDiemNet := 0;
//                     PerDiemRate := 0;
//                     if ("Payment Line Delegate"."Payment Types" = 'PER DIEM') then// OR ("Payment Line Board"."Payment Types" = 'PERDIEM')  THEN
//                     begin
//                         PerDiemDays := "Payment Line Delegate"."No of Days";
//                         PerDiemNet := "Payment Line Delegate"."Net Amount";
//                         PerDiemRate := "Payment Line Delegate"."Daily Rate(Amount)";
//                         "Net Amount" := 0;
//                     end;
//                     Members.Reset;
//                     Members.SetRange("Payroll/Staff No.", "Payment Line Delegate"."Staff No.");
//                     if Members.Find('-') then begin
//                         MbrNo := Members."No.";
//                     end;

//                 end;
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

//     var
//         Payee: Decimal;
//         PerDiemRate: Decimal;
//         PerDiemDays: Integer;
//         PerDiemNet: Decimal;
//         Members: Record "Members";
//         MbrNo: Code[10];
// }
