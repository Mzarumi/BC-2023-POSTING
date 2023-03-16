// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185433 priTax
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/priTax.rdlc';

//     dataset
//     {
//         dataitem(pr ;52185624)
//         {
//             DataItemTableView = where("Transaction Code" = filter(GPAY));
//             RequestFilterFields = "Employee Code";
//             column(ReportForNavId_1000000000; 1000000000)
//             {
//             }
//             column(Residential; objEmp."Residential status")
//             {
//             }
//             column(ype; objEmp."Type of Employee")
//             {
//             }
//             column(mBPAY; mBPAY)
//             {
//             }
//             column(Name; Name)
//             {
//             }
//             column(Pin; Pin)
//             {
//             }
//             column(HouseAll; "Housing Allowance")
//             {
//             }
//             column(LeaveAll; "Leave Allowance")
//             {
//             }
//             column(TransAll; "Transport Allowance")
//             {
//             }
//             column(OT; OT)
//             {
//             }
//             column(Directors; "Directors Fees")
//             {
//             }
//             column(LumpSum; "Lum[ Sum")
//             {
//             }
//             column(Other; "other allowance")
//             {
//             }
//             column(TotCashPay; "total cash pay")
//             {
//             }
//             column(ValueofCar; "value of car")
//             {
//             }
//             column(OtherNon; "other non cash")
//             {
//             }
//             column(TotNonCash; "total non cash")
//             {
//             }
//             column(GlobalNonIncome; "global income")
//             {
//             }
//             column(TypeOfHousing; "type of housing")
//             {
//             }
//             column(Rent; "rent income")
//             {
//             }
//             column(ComputedRent; "Computed Rent")
//             {
//             }
//             column(RentRecovered; "Rent Recovered")
//             {
//             }
//             column(NetHousing; "net Housing")
//             {
//             }
//             column(TotalGross; "total Gross")
//             {
//             }
//             column(ThirtyCash; "30% cash")
//             {
//             }
//             column(ActualContrib; "Actual contribution")
//             {
//             }
//             column(PermissibleInt; "permisible interest")
//             {
//             }
//             column(MorgageInt; "mortgage interest")
//             {
//             }
//             column(Hosp; HOSp)
//             {
//             }
//             column(AmntofBenefit; "Amount of benefit")
//             {
//             }
//             column(TaxablePay; "taxable pay")
//             {
//             }
//             column(TaxSlab; "total pable slab")
//             {
//             }
//             column(MonthlyRelief; "monthly Relief")
//             {
//             }
//             column(InsuranceRelief; "insurance relief")
//             {
//             }
//             column(Paye; PAYE)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 mBPAY := 0;
//                 "Housing Allowance" := 0;
//                 "Transport Allowance" := 0;
//                 "Leave Allowance" := 0;
//                 OT := 0;
//                 "Directors Fees" := 0;
//                 "Lum[ Sum" := 0;
//                 "other allowance" := 0;
//                 "total cash pay" := 0;
//                 "value of car" := 0;
//                 "other non cash" := 0;
//                 "total non cash" := 0;
//                 "global income" := 0;
//                 "type of housing" := 0;
//                 "rent of house" := 0;
//                 "Computed Rent" := 0;
//                 "Rent Recovered" := 0;
//                 "net Housing" := 0;
//                 "total gross pay" := 0;
//                 "30% cash" := 0;
//                 "Actual contribution" := 0;
//                 "permisable limit" := 0;
//                 "mortgage interest" := 0;
//                 HOSp := 0;
//                 "Amount of benefit" := 0;
//                 "taxable pay" := 0;
//                 "total pable slab" := 0;
//                 "monthly Relief" := 0;
//                 "insurance relief" := 0;
//                 PAYE := 0;



//                 objEmp.Reset;
//                 objEmp.SetRange("No.", "PR Period Transactions"."Employee Code");
//                 if objEmp.Find('-') then begin
//                     Pin := objEmp."PIN No.";
//                     Name := objEmp."First Name" + ' ' + objEmp."Middle Name" + objEmp."Last Name";
//                 end;

//                 PeriodTran1.Reset;
//                 PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
//                 PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
//                 PeriodTran1.SetRange(PeriodTran1."Transaction Code", 'BPAY');
//                 PeriodTran1.SetRange(PeriodTran1."Payroll Code", "Payroll Code");
//                 if PeriodTran1.Find('-') then begin
//                     mBPAY := PeriodTran1.Amount;
//                 end;

//                 transCode.Reset;
//                 transCode.SetRange(transCode."iTax Grouping", transCode."itax grouping"::"Housing Allowances");
//                 if transCode.Find('-') then
//                     repeat
//                         PeriodTran1.Reset;
//                         PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
//                         PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Code", "Payroll Code");
//                         if PeriodTran1.Find('-') then begin
//                             "Housing Allowance" := "Housing Allowance" + PeriodTran1.Amount;
//                         end;
//                     until transCode.Next = 0;

//                 transCode.Reset;
//                 transCode.SetRange(transCode."iTax Grouping", transCode."itax grouping"::"Transport Allowance");
//                 if transCode.Find('-') then
//                     repeat
//                         PeriodTran1.Reset;
//                         PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
//                         PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Code", "Payroll Code");
//                         if PeriodTran1.Find('-') then begin
//                             "Transport Allowance" := "Transport Allowance" + PeriodTran1.Amount;
//                         end;
//                     until transCode.Next = 0;

//                 transCode.Reset;
//                 transCode.SetRange(transCode."iTax Grouping", transCode."itax grouping"::OT);
//                 if transCode.Find('-') then
//                     repeat
//                         PeriodTran1.Reset;
//                         PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
//                         PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Code", "Payroll Code");
//                         if PeriodTran1.Find('-') then begin
//                             OT := OT + PeriodTran1.Amount;
//                         end;
//                     until transCode.Next = 0;

//                 transCode.Reset;
//                 transCode.SetRange(transCode."iTax Grouping", transCode."itax grouping"::"Directors Fees");
//                 if transCode.Find('-') then
//                     repeat
//                         PeriodTran1.Reset;
//                         PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
//                         PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Code", "Payroll Code");
//                         if PeriodTran1.Find('-') then begin
//                             "Directors Fees" := "Directors Fees" + PeriodTran1.Amount;
//                         end;
//                     until transCode.Next = 0;

//                 //----------------------------------
//                 transCode.Reset;
//                 transCode.SetRange(transCode."iTax Grouping", transCode."itax grouping"::" ");
//                 transCode.SetRange(transCode."Transaction Type", transCode."transaction type"::Income);
//                 if transCode.Find('-') then
//                     repeat
//                         PeriodTran1.Reset;
//                         PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
//                         PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Code", "Payroll Code");
//                         if PeriodTran1.Find('-') then begin
//                             "other allowance" := "other allowance" + PeriodTran1.Amount;
//                         end;
//                     until transCode.Next = 0;


//                 //Actual contribution------------
//                 transCode.Reset;
//                 transCode.SetRange(transCode."Special Transactions", transCode."special transactions"::"Defined Contribution");
//                 if transCode.Find('-') then
//                     repeat
//                         PeriodTran1.Reset;
//                         PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
//                         PeriodTran1.SetRange(PeriodTran1."Transaction Code", transCode."Transaction Code");
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
//                         PeriodTran1.SetRange(PeriodTran1."Payroll Code", "Payroll Code");
//                         if PeriodTran1.Find('-') then begin
//                             "Actual contribution" := "Actual contribution" + PeriodTran1.Amount;
//                         end;
//                     until transCode.Next = 0;

//                 PeriodTran1.Reset;
//                 PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
//                 PeriodTran1.SetRange(PeriodTran1."Transaction Code", 'NSSF');
//                 PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
//                 PeriodTran1.SetRange(PeriodTran1."Payroll Code", "Payroll Code");
//                 if PeriodTran1.Find('-') then begin
//                     "Actual contribution" := "Actual contribution" + PeriodTran1.Amount;
//                 end;

//                 //"monthly Relief":=0;
//                 PeriodTran1.Reset;
//                 PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
//                 PeriodTran1.SetRange(PeriodTran1."Transaction Code", 'PSNR');
//                 PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
//                 PeriodTran1.SetRange(PeriodTran1."Payroll Code", "Payroll Code");
//                 if PeriodTran1.Find('-') then begin
//                     "monthly Relief" := "monthly Relief" + PeriodTran1.Amount;
//                 end;

//                 //"insurance relief":=0;  INSR
//                 PeriodTran1.Reset;
//                 PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
//                 PeriodTran1.SetRange(PeriodTran1."Transaction Code", 'INSR');
//                 PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
//                 PeriodTran1.SetRange(PeriodTran1."Payroll Code", "Payroll Code");
//                 if PeriodTran1.Find('-') then begin
//                     "insurance relief" := "insurance relief" + PeriodTran1.Amount;
//                 end;

//                 //PAYE
//                 PeriodTran1.Reset;
//                 PeriodTran1.SetRange(PeriodTran1."Employee Code", "PR Period Transactions"."Employee Code");
//                 PeriodTran1.SetRange(PeriodTran1."Transaction Code", 'PAYE');
//                 PeriodTran1.SetRange(PeriodTran1."Payroll Period", SelectedPeriod);
//                 PeriodTran1.SetRange(PeriodTran1."Payroll Code", "Payroll Code");
//                 if PeriodTran1.Find('-') then begin
//                     PAYE := PAYE + PeriodTran1.Amount;
//                 end;


//                 //MakeExcelDataBody;
//             end;

//             trigger OnPostDataItem()
//             begin
//                 //CreateExcelbook;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 UserSetup.Get(UserId);
//                 //IF UserSetup."Payroll Accountant"=FALSE THEN ERROR('Under Construction');


//                 //SETFILTER("Payroll Code",'=%1',UserSetup."Payroll Code");
//                 "PR Period Transactions".SetFilter("PR Period Transactions"."Payroll Period", '=%1', SelectedPeriod);
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field("Selected Period"; SelectedPeriod)
//                 {
//                     ApplicationArea = Basic;
//                     TableRelation = "PR Payroll Periods";
//                 }
//                 field("Payroll Code"; payrollcode)
//                 {
//                     ApplicationArea = Basic;
//                     TableRelation = "prPayroll Type";
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

//         if SelectedPeriod = 0D then Error('You must specify the period filter');

//         //IF PrintToExcel THEN
//         // MakeExcelInfo;
//     end;

//     var
//         PeriodTrans: Record 52185624;
//         EmployeeName: Text[100];
//         objPeriod: Record 52185613;
//         UserSetup: Record "User Setup";
//         SelectedPeriod: Date;
//         PeriodFilter: Text[30];
//         objEmp: Record "HR Employees";
//         controlinfo: Record 52185926;
//         NoofEntries: Integer;
//         ExcelBuf: Record "Excel Buffer" temporary;
//         PrintToExcel: Boolean;
//         "Period Names": Text[30];
//         dimVal: Record "Dimension Value";
//         mCount: Integer;
//         mPercDist: Decimal;
//         mPercLeave: Decimal;
//         "HR Timesheets": Record Customer;
//         FromDate: Date;
//         ToDate: Date;
//         mHours: Decimal;
//         mPerc: Decimal;
//         HRday: Integer;
//         totMhours: Decimal;
//         mDate: Record Date;
//         mPercTotal: Decimal;
//         mHorPercTotal: array[100] of Decimal;
//         PeriodTran1: Record 52185624;
//         i: Integer;
//         approved: Record Customer;
//         dt1: Date;
//         dt2: Date;
//         objholidays: Record 52185520;
//         "no of holidays": Integer;
//         objbasecalenderchange: Record 52185639;
//         DATE1: Date;
//         DATE2: Date;
//         tempDate: Date;
//         mtotalGrosspay: Decimal;
//         mRealTotals: Decimal;
//         mDay: Integer;
//         Text000: label 'Period: %1';
//         Text001: label 'Before';
//         Text002: label 'Salary Distribution';
//         Text003: label 'More than';
//         Text004: label 'Aged by %1';
//         Text005: label 'Total for %1';
//         Text006: label 'Aged as of %1';
//         Text007: label 'Aged by %1';
//         Text008: label 'All Amounts in LCY';
//         Text009: label 'Due Date,Posting Date,Document Date';
//         Text010: label 'The Date Formula %1 cannot be used. Try to restate it. E.g. 1M+CM instead of CM+1M.';
//         Text011: label 'Data';
//         Text012: label 'Aged Accounts Receivable';
//         Text013: label 'Company Name';
//         Text014: label 'Report No.';
//         Text015: label 'Report Name';
//         Text016: label 'User ID';
//         Text017: label 'Date';
//         Text018: label 'Customer Filters';
//         Text019: label 'Cust. Ledger Entry Filters';
//         myFilter: Text[1000];
//         Trans: Record "PR Transaction Codes";
//         mNetPay: Decimal;
//         mPAYE: Decimal;
//         mBPAY: Decimal;
//         payrollcode: Code[50];
//         "Housing Allowance": Decimal;
//         "Transport Allowance": Decimal;
//         "Leave Allowance": Decimal;
//         OT: Decimal;
//         "Directors Fees": Decimal;
//         "Lum[ Sum": Decimal;
//         "other allowance": Decimal;
//         "total cash pay": Decimal;
//         "value of car": Decimal;
//         o: Decimal;
//         "other non cash": Decimal;
//         "total non cash": Decimal;
//         "global non income": Decimal;
//         "global income": Decimal;
//         "type of housing": Decimal;
//         "rent income": Decimal;
//         "rent of house": Decimal;
//         "Computed Rent": Decimal;
//         "Rent Recovered": Decimal;
//         "net Housing": Decimal;
//         "total Gross": Decimal;
//         "total gross pay": Decimal;
//         "30% cash": Decimal;
//         "Actual contribution": Decimal;
//         "permisible interest": Decimal;
//         "mortgage interest": Decimal;
//         HOSp: Decimal;
//         "Amount of benefit": Decimal;
//         "taxable pay": Decimal;
//         "total pable slab": Decimal;
//         "monthly Relief": Decimal;
//         "insurance relief": Decimal;
//         "permisable limit": Decimal;
//         slab: Decimal;
//         transCode: Record "PR Transaction Codes";
//         PAYE: Decimal;
//         Pin: Code[20];
//         Name: Text;


//     procedure MakeExcelInfo()
//     begin
//         //ExcelBuf.SetUseInfoSheed;
//         ExcelBuf.ClearNewRow;
//         MakeExcelDataHeader;
//     end;

//     local procedure MakeExcelDataHeader()
//     begin
//         ExcelBuf.NewRow;
//         ExcelBuf.AddColumn('Pin of Employee', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Name of Employee', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Residential status', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Type of Employee', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Basic Salary', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Housing Allowance', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Transport Allowance', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Leave Allowance', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('OT', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Directors Fees', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Lum[ sum', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('oter allowance', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('total cash pay', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Value of Car', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('other non cash', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('total non cash', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Global income', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('type of Housing', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Rent of house', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('computed  Rent', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Rent Recovered', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('net housing', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('total gross  pay', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('30% cash', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Actual contribution', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('permisable limit', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('mortgage interest', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('HOSp', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('Amount of Benefit', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('taxable pay', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('total pable, slab', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('monthly relief', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('insurance relief', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('', false, '', false, false, false, '', 0);
//         ExcelBuf.AddColumn('PAYE', false, '', false, false, false, '', 0);
//         ExcelBuf.NewRow;
//     end;


//     procedure MakeExcelDataBody()
//     var
//         BlankFiller: Text[250];
//     begin
//         objEmp.Reset;
//         objEmp.SetRange(objEmp."No.", "PR Period Transactions"."Employee Code");
//         if objEmp.Find('-') then begin
//             ExcelBuf.AddColumn(objEmp."PIN No.", false, '', false, false, true, '', 0);
//             ExcelBuf.AddColumn(objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name", false, '', false, false, true, '', 1);

//             ExcelBuf.AddColumn(objEmp."Residential status", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn(objEmp."Employee Type", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn(mBPAY, false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("Housing Allowance", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("Transport Allowance", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("Leave Allowance", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn(OT, false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("Directors Fees", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("Lum[ Sum", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("other allowance", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("total cash pay", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("value of car", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("other non cash", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("total non cash", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("global income", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn('Benefit not given', false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("rent of house", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("Computed Rent", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("Rent Recovered", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("net Housing", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("total gross pay", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("30% cash", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("Actual contribution", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("permisable limit", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("mortgage interest", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn(HOSp, false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("Amount of benefit", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("taxable pay", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("total pable slab", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("monthly Relief", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn("insurance relief", false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn(0, false, '', false, false, false, '', 0);
//             ExcelBuf.AddColumn(PAYE, false, '', false, false, false, '', 0);
//             ExcelBuf.NewRow;
//         end;
//     end;


//     procedure CreateExcelbook()
//     begin
//         /*ExcelBuf.CreateBook();
//           ExcelBuf.CreateBookAndOpenExcel('Sheet1','Sheet1','iTax',USERID);
//           // ExcelBuf.CreateBookAndOpenExcel(SheetName,ReportHeader,CompanyName,UserID2)
//           // ExcelBuf.CreateBookAndOpenExcel(FileName,SheetName,ReportHeader,CompanyName2,UserID2)
//         //ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
//         ExcelBuf.GiveUserControl;
//         MESSAGE('DONE');*/

//         ExcelBuf.CreateBook('iTax', 'Test');
//         ExcelBuf.CreateBookAndOpenExcel('iTax', 'Sheet1', 'Sheet1', 'Sheet1', 'Sheet1');
//         // ExcelBuf.CreateBookAndOpenExcel(SheetName,ReportHeader,CompanyName,UserID2)
//         // ExcelBuf.CreateBookAndOpenExcel(FileName,SheetName,ReportHeader,CompanyName2,UserID2)
//         //ExcelBuf.CreateSheet(Text002,Text001,COMPANYNAME,USERID);
//         ExcelBuf.GiveUserControl;
//         Message('DONE');

//     end;
// }
