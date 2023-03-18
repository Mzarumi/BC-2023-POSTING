// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185975 "prBoard Payslip 2"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/prBoard Payslip 2.rdlc';

//     dataset
//     {
//         dataitem(52186196;52186196)
//         {
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(Cname;CompInfo.Name)
//             {
//             }
//             column(CPicture;CompInfo.Picture)
//             {
//             }
//             column(CAdress;CompInfo.Address)
//             {
//             }
//             column(CCity;CompInfo.City)
//             {
//             }
//             column(Names;Names)
//             {
//             }
//             column(Balnc;Balnc)
//             {
//             }
//             column(Payee;payee)
//             {
//             }
//             dataitem(52186194;52186194)
//             {
//                 DataItemLink = "No."=field("No.");
//                 column(ReportForNavId_7; 7)
//                 {
//                 }
//                 column(Amount_PRBoardTransactions;"PR Board Transactions".Amount)
//                 {
//                 }
//                 column(Description_PRBoardTransactions;"PR Board Transactions".Description)
//                 {
//                 }
//                 column(Date_PRBoardTransactions;"PR Board Transactions".Date)
//                 {
//                 }
//                 column(Name_PRBoardTransactions;"PR Board Transactions".Name)
//                 {
//                 }
//                 column(Totalamnt;Totalamnt)
//                 {
//                 }
//                 column(PayPeriodText;PayPeriodtext)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     //Totalamnt:=Totalamnt+"PR Board Transactions".Amount;
//                     //MESSAGE(FORMAT(Totalamnt));
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 Names:= "prBoard Employees"."First Name" + ' ' + "prBoard Employees"."Middle Name" + ' ' + "prBoard Employees"."Last Name";


//                 BoardTransact.Reset;
//                 BoardTransact.SetRange(BoardTransact."No.", "prBoard Employees"."No.");
//                 BoardTransact.SetRange(BoardTransact.Date, SelectedPeriod);
//                 if BoardTransact.Find('-') then
//                   begin
//                     repeat
//                       Totalamnt:= Totalamnt + BoardTransact.Amount;
//                     until BoardTransact.Next=0
//                   end;
//                 Board2.Reset;
//                 Board2.SetRange(Board2."No.", "prBoard Employees"."No.");
//                 Board2.SetRange(Board2.Date, SelectedPeriod);
//                 Board2.SetRange(Board2."Is Paye", true);
//                 if Board2.Find('-') then
//                   begin
//                     repeat
//                       payee:=payee + Board2.Amount;
//                     until Board2.Next=0;
//                   end;
//                 Board2.Reset;
//                 Board2.SetRange(Board2."No.", "prBoard Employees"."No.");
//                 Board2.SetRange(Board2.Date, SelectedPeriod);
//                 Board2.SetRange(Board2."Is Net", true);
//                 if Board2.Find('-') then
//                   begin
//                     repeat
//                       Balnc:=Balnc + Board2.Amount;
//                     until Board2.Next=0;
//                   end;
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field(SelectedPeriod;SelectedPeriod)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Payroll Period';
//                     TableRelation = "PR Payroll Periods"."Date Opened";
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
//         CompInfo.Get;
//         CompInfo.CalcFields(Picture);
//         Totalamnt:=0;
//         if SelectedPeriod=0D then
//         begin
//           //select open perod
//           PayPeriod.Reset;
//           PayPeriod.SetRange(PayPeriod.Closed, false);
//           if PayPeriod.Find('-') then
//             SelectedPeriod:=PayPeriod."Date Opened";
//         end;
//     end;

//     var
//         CompanyInfo: Record "Company Information";
//         boardTransaction: Record 52186194;
//         strEmpName: Text[200];
//         summary: Record 52186203;
//         Allow: Decimal;
//         Grosspay: Decimal;
//         Nssf: Decimal;
//         PAYE: Decimal;
//         PRPeriodTransactions: Record 52186203;
//         prEmployeeTransactions: Record 52186194;
//         prTransactionCodes: Record 52186197;
//         objPeriod: Record 52185613;
//         PeriodName: Text[50];
//         NetPay: Decimal;
//         CompInfo: Record "Company Information";
//         Names: Text[200];
//         PRPayrollPeriods: Record 52185613;
//         SelectedPeriod: Date;
//         Board: Record 52186203;
//         Board2: Record 52186203;
//         Earn: Record 52186197;
//         Emp: Record 52186196;
//         CheckNo: Code[20];
//         "Ref No": Code[20];
//         Trans: Decimal;
//         Desc: Text[100];
//         PayDate: Date;
//         Benefit: Text[100];
//         TotalPay: Decimal;
//         Earnings: Record 52186197;
//         payee: Decimal;
//         amt: Decimal;
//         EP: Record 52186196;
//         Totalamnt: Decimal;
//         Balnc: Decimal;
//         PayPeriod: Record 52185613;
//         PayPeriodtext: Text[30];
//         BeginDate: Date;
//         DateSpecified: Date;
//         Year: Integer;
//         HoldDate: Date;
//         EndDate: Date;
//         BoardTransact: Record 52186194;
//         amt1: Decimal;
// }
