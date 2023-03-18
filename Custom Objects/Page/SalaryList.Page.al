page 52185647 "Salary List"
{
    CardPageID = "prHeader Salary Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Navigate,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "HR Employees";
    SourceTableView = WHERE(Status = FILTER(New));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("First Name"; Rec."First Name")
                {
                }
                field("Middle Name"; Rec."Middle Name")
                {
                }
                field("Last Name"; Rec."Last Name")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field(Office; Rec.Office)
                {
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                }
                // field("Date Of Join"; Rec."Date Of Join")
                // {
                // }
                field(Status; Rec.Status)
                {
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Other Info")
            {
                Caption = 'Other Info';
                action("Cost Centers")
                {
                    Caption = 'Cost Centers';
                    Image = Dimensions;
                    RunObject = Page "prStaff Dimensions";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    Visible = false;
                }
                separator(Action1000000017)
                {
                }
                action("Banking Details")
                {
                    Caption = 'Banking Details';
                    Image = BankAccount;
                    RunObject = Page "prEmployee Banks";
                    RunPageLink = "Employee Code" = FIELD("No.");
                }
                separator(Action1000000015)
                {
                }
                action("Pension Details")
                {
                    Caption = 'Pension Details';
                    Image = PlanningWorksheet;
                    RunObject = Page "Pension Contribution Details";
                    RunPageLink = "Employee Code" = FIELD("No.");
                }
            }
            group(Transactions)
            {
                Caption = 'Transactions';
                action("Payroll Transactions")
                {
                    Caption = 'Payroll Transactions';
                    Image = Trace;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "PR Employee Transactions";
                    RunPageLink = "Employee Code" = FIELD("No.");
                }
                separator(Action1000000011)
                {
                }
                action("View Trans Codes")
                {
                    Caption = 'View Trans Codes';
                    Image = Track;
                    RunObject = Page "PR Bank Branches";
                    Visible = false;
                }
                separator(Action1000000009)
                {
                }
                action("Insurance Policies")
                {
                    Caption = 'Insurance Policies';
                    Image = Insurance;
                    RunObject = Page "prInsurance Policies";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    Visible = false;
                }
                separator(Action1000000007)
                {
                }
                action("Staff Loans")
                {
                    Caption = 'Staff Loans';
                    Image = Loaner;
                    RunObject = Page "prInsurance Policies";
                    Visible = false;
                }
                separator(Action1000000005)
                {
                }
                action("Basic Salary Arrears")
                {
                    Caption = 'Basic Salary Arrears';
                    Image = CalculateRegenerativePlan;
                    RunObject = Page "prSalary Arrears";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    RunPageView = SORTING("Employee Code", "PAYE Arrears", "Period Month");
                    Visible = false;
                }
            }
        }
        area(processing)
        {
            action("View Payslip")
            {
                Caption = 'View Payslip';
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin

                    objPeriod.Reset;
                    objPeriod.SetRange(objPeriod.Closed, false);
                    if objPeriod.Find('-') then;
                    SelectedPeriod := objPeriod."Date Opened";

                    //CLEAR(objOcx);
                    //objOcx.fnMandatoryProcesses;

                    //Display payslip report
                    /*
                    SalCard.GET("No.");
                    SalCard.SETRANGE("Employee Code","No.");
                    SalCard.SETRANGE(SalCard."Period Filter",SelectedPeriod);
                    //REPORT.Run(52185622,TRUE,FALSE,SalCard);
                    */
                    prPostingGroup.Get(Rec."Posting Group");
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee."No.", Rec."No.");
                    HrEmployee.SetRange(HrEmployee."Current Month Filter", SelectedPeriod);
                    //if prPostingGroup."Payslip Report" <> 0 then
                    //REPORT.Run(prPostingGroup."Payslip Report", true, false, HrEmployee)
                    // else
                    // Error('Please Specify the Posting group %1 payslip report', "Posting Group");
                    /*
                    IF SalCard.Currency = '' THEN
                      BEGIN
                        HrEmployee.RESET;
                        HrEmployee.SETRANGE(HrEmployee."No.","No.");
                        HrEmployee.SETRANGE(HrEmployee."Current Month Filter",SelectedPeriod);
                        IF prPostingGroup."Payslip Report" <> 0 THEN
                         //REPORT.Run(prPostingGroup."Payslip Report",TRUE,FALSE,HrEmployee)
                        ELSE
                         //REPORT.Run(52185622,TRUE,FALSE,HrEmployee);
                      END
                    ELSE IF SalCard."Does Not Pay PAYE On Basic" = TRUE THEN
                      BEGIN
                        HrEmployee.RESET;
                        HrEmployee.SETRANGE(HrEmployee."No.","No.");
                        HrEmployee.SETRANGE(HrEmployee."Current Month Filter",SelectedPeriod);
                        //REPORT.Run(52185651,TRUE,FALSE,HrEmployee);
                      END
                    ELSE
                      BEGIN
                        HrEmployee.RESET;
                        HrEmployee.SETRANGE(HrEmployee."No.","No.");
                        HrEmployee.SETRANGE(HrEmployee."Current Month Filter",SelectedPeriod);
                        //REPORT.Run(52185650,TRUE,FALSE,HrEmployee);
                      END
                    */

                end;
            }
            action("Process Current")
            {
                Caption = 'Process Current';
                Image = CalculatePlan;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    ContrInfo.Get;
                    VitalInfo.Get('');

                    objPeriod.Reset;
                    objPeriod.SetRange(objPeriod.Closed, false);
                    if objPeriod.Find('-') then;
                    SelectedPeriod := objPeriod."Date Opened";

                    SalCard.Get(Rec."No.");

                    //For Multiple Payroll
                    if ContrInfo."Multiple Payroll" then begin
                        PayrollDefined := '';
                        PayrollType.Reset;
                        PayrollType.SetCurrentKey(EntryNo);
                        if PayrollType.FindFirst then begin
                            NoofRecords := PayrollType.Count;
                            i := 0;
                            repeat
                                i += 1;
                                PayrollDefined := PayrollDefined + '&' + PayrollType."Payroll Code";
                                if i < NoofRecords then
                                    PayrollDefined := PayrollDefined + ','
                            until PayrollType.Next = 0;
                        end;


                        Selection := StrMenu(PayrollDefined, NoofRecords);
                        PayrollType.Reset;
                        PayrollType.SetRange(PayrollType.EntryNo, Selection);
                        if PayrollType.Find('-') then begin
                            PayrollCode := PayrollType."Payroll Code";
                        end;
                    end;
                    //End Multiple Payroll

                    //Delete all Records from the prPeriod Transactions for Reprocessing
                    prPeriodTransactions.Reset;
                    prPeriodTransactions.SetRange(prPeriodTransactions."Employee Code", Rec."No."); //PKK
                    if ContrInfo."Multiple Payroll" then
                        prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Code", PayrollCode);
                    prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", SelectedPeriod);
                    if prPeriodTransactions.Find('-') then
                        prPeriodTransactions.DeleteAll;

                    //Delete all Records from prEmployer Deductions
                    prEmployerDeductions.Reset;
                    prEmployerDeductions.SetRange(prEmployerDeductions."Employee Code", Rec."No."); //PKK
                    if ContrInfo."Multiple Payroll" then
                        prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Code", PayrollCode);

                    prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Period", SelectedPeriod);
                    if prEmployerDeductions.Find('-') then
                        prEmployerDeductions.DeleteAll;

                    //Use CODEUNIT
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee.Status, HrEmployee.Status::Active);
                    //PKK - PROCESS CURRENT ONLY
                    HrEmployee.SetRange(HrEmployee."No.", Rec."No.");
                    //PKK - PROCESS CURRENT ONLY
                    if ContrInfo."Multiple Payroll" then
                        HrEmployee.SetRange(HrEmployee."Payroll Code", PayrollCode);
                    //HrEmployee.SETRANGE(HrEmployee."No.",'CSS0005');
                    if HrEmployee.Find('-') then begin
                        //Progress Window
                        ProgressWindow.Open('Processing Salary for Employee No. #1#######');
                        repeat
                            //Progress Window
                            Sleep(100);
                            //Progress Window
                            //Suspended
                            if not SalCard."Suspend Pay" then begin
                                ProgressWindow.Update(1, HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name");
                                if SalCard.Get(HrEmployee."No.") then
                                    // HrEmployee.TestField(HrEmployee."Date Of Join");
                                //PKK Check NHF Age
                                if (HrEmployee."Date Of Birth" <> 0D) then begin
                                    if CalcDate(VitalInfo."NHF - Maximum Age", HrEmployee."Date Of Birth") <> HrEmployee."Date Of Birth" then begin
                                        if CalcDate(VitalInfo."NHF - Maximum Age", HrEmployee."Date Of Birth") < Today then
                                            SalCard."Pays NHIF" := false;
                                    end;
                                end;
                                //PKK Check NHF Age
                                // HrEmployee.TestField(HrEmployee."Date Of Join");
                                // ProcessPayroll.fnProcesspayroll(HrEmployee."No.", HrEmployee."Date Of Join", SalCard."Basic Pay", SalCard."Pays PAYE"
                                //     , SalCard."Pays NSSF", SalCard."Pays NHIF", SelectedPeriod, SelectedPeriod, '', '',
                                //     HrEmployee."Date Of Leaving", true, HrEmployee."Department Code", PayrollCode);
                            end;
                        until HrEmployee.Next = 0;
                        ////Progress Window
                        ProgressWindow.Close;
                    end;
                    //CODEUNIT

                    Commit;

                    prPostingGroup.Get(Rec."Posting Group");
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee."No.", Rec."No.");
                    HrEmployee.SetRange(HrEmployee."Current Month Filter", SelectedPeriod);
                    //if prPostingGroup."Payslip Report" <> 0 then
                    //REPORT.Run(prPostingGroup."Payslip Report", true, false, HrEmployee)
                    // else
                    // Error('Please Specify the Posting group %1 payslip report', "Posting Group");
                end;
            }
            action("Process Payroll")
            {
                Caption = 'Process Payroll';
                Image = CalculateCalendar;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    ContrInfo.Get;

                    objPeriod.Reset;
                    objPeriod.SetRange(objPeriod.Closed, false);
                    if objPeriod.Find('-') then;
                    SelectedPeriod := objPeriod."Date Opened";

                    //SalCard.GET("No.");

                    //For Multiple Payroll
                    if ContrInfo."Multiple Payroll" then begin
                        PayrollDefined := '';
                        PayrollType.Reset;
                        PayrollType.SetCurrentKey(EntryNo);
                        if PayrollType.FindFirst then begin
                            NoofRecords := PayrollType.Count;
                            i := 0;
                            repeat
                                i += 1;
                                PayrollDefined := PayrollDefined + '&' + PayrollType."Payroll Code";
                                if i < NoofRecords then
                                    PayrollDefined := PayrollDefined + ','
                            until PayrollType.Next = 0;
                        end;


                        Selection := StrMenu(PayrollDefined, NoofRecords);
                        PayrollType.Reset;
                        PayrollType.SetRange(PayrollType.EntryNo, Selection);
                        if PayrollType.Find('-') then begin
                            PayrollCode := PayrollType."Payroll Code";
                        end;
                    end;
                    //End Multiple Payroll

                    //Delete all Records from the prPeriod Transactions for Reprocessing
                    prPeriodTransactions.Reset;
                    if ContrInfo."Multiple Payroll" then
                        prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Code", PayrollCode);
                    prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", SelectedPeriod);
                    if prPeriodTransactions.Find('-') then
                        prPeriodTransactions.DeleteAll;

                    //Delete all Records from prEmployer Deductions
                    prEmployerDeductions.Reset;
                    if ContrInfo."Multiple Payroll" then
                        prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Code", PayrollCode);
                    prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Period", SelectedPeriod);
                    if prEmployerDeductions.Find('-') then
                        prEmployerDeductions.DeleteAll;

                    //Use CODEUNIT
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee.Status, HrEmployee.Status::Active);
                    if ContrInfo."Multiple Payroll" then
                        HrEmployee.SetRange(HrEmployee."Payroll Code", PayrollCode);
                    if HrEmployee.Find('-') then begin
                        //Progress Window
                        ProgressWindow.Open('Processing Salary for Employee No. #1#######');
                        repeat
                            //Progress Window
                            Sleep(100);
                            //Progress Window
                            //Suspended
                            if SalCard.Get(HrEmployee."No.") then begin
                                if not SalCard."Suspend Pay" then begin
                                    // HrEmployee.TestField(HrEmployee."Date Of Join");
                                    //PKK Check NHF Age
                                    if (HrEmployee."Date Of Birth" <> 0D) then begin
                                        if CalcDate(VitalInfo."NHF - Maximum Age", HrEmployee."Date Of Birth") <> HrEmployee."Date Of Birth" then begin
                                            if CalcDate(VitalInfo."NHF - Maximum Age", HrEmployee."Date Of Birth") < Today then
                                                SalCard."Pays NHIF" := false;
                                        end;
                                    end;
                                    //PKK Check NHF Age
                                    //PKProgressWindow.UPDATE(1,HrEmployee."No."+':'+HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name");

                                    if SalCard.Get(HrEmployee."No.") then begin
                                        // HrEmployee.TestField(HrEmployee."Date Of Join");
                                        //ProcessPayroll.fnProcesspayroll(HrEmployee."No.", HrEmployee."Date Of Join", SalCard."Basic Pay", SalCard."Pays PAYE"
                                        //, SalCard."Pays NSSF", SalCard."Pays NHIF", SelectedPeriod, SelectedPeriod, '', '',
                                        //HrEmployee."Date Of Leaving", true, HrEmployee."Department Code", PayrollCode);
                                    end;
                                end;
                            end;

                            ProgressWindow.Update(1, HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name");

                        until HrEmployee.Next = 0;
                        ////Progress Window
                        ProgressWindow.Close;
                    end;
                    //CODEUNIT

                    Message('Payroll processing completed successfully.');

                    /*
                    SalCard.RESET;
                    SalCard.SETRANGE("Employee Code","No.");
                    SalCard.SETRANGE(SalCard."Period Filter",SelectedPeriod);
                    //REPORT.Run(52185622,TRUE,FALSE,SalCard);
                    */

                end;
            }
        }
    }

    var
        objEmp: Record "HR Employees";
        SalCard: Record "PR Salary Card";
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ///ProcessPayroll: Codeunit prPayrollProcessing111;
        HrEmployee: Record "HR Employees";
        Employee: Record "HR Employees";
        ProgressWindow: Dialog;
        prPeriodTransactions: Record "PR Period Transactions";
        prEmployerDeductions: Record "prEmployer Deductions";
        PayrollType: Record "prPayroll Type";
        Selection: Integer;
        PayrollDefined: Text[30];
        PayrollCode: Code[10];
        NoofRecords: Integer;
        i: Integer;
        ContrInfo: Record "Control-Information";
        DepName: Text[200];
        DValues: Record "Dimension Value";
        VitalInfo: Record "PR Vital Setup Info";
        prPostingGroup: Record "prEmployee Posting Group";
}

