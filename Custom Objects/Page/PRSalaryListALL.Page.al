page 52185659 "PR Salary List (ALL)"
{
    CardPageID = "PR Header Salary Card - ALL";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Navigate,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "HR Employees";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Full Name"; Rec."Full Name")
                {
                }
                // field("Date Of Join"; Rec."Date Of Join")
                // {
                // }
                field("Contract Type"; Rec."Contract Type")
                {
                }
                // field("Responsibility Center"; Rec."Responsibility Center")
                // {
                // }
                field(Status; Rec.Status)
                {
                    Caption = 'Employment Status';
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Transactions)
            {
                Caption = 'Transactions';
                action("Assign Earning/Deductions")
                {
                    Caption = 'Assign Earning/Deductions';
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "PR Employee Transactions";
                    RunPageLink = "Employee Code" = FIELD("No.");
                }
                action("Salary Arrears")
                {
                    Caption = 'Salary Arrears';
                    Image = SelectEntries;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "pr Salary Arrears";
                    RunPageLink = "No." = FIELD("No.");
                }
            }
        }
        area(processing)
        {
            action(ViewPayslip)
            {
                Caption = 'View Payslip';
                Image = View;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.Find('-') then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    //Display payslip report
                    PRSalaryCard.SetRange("Employee Code",Rec."No.");
                    PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);

                    //REPORT.Run(REPORT::"PR Individual Payslip", true, false, PRSalaryCard);
                end;
            }
            action(ProcessPayroll)
            {
                Caption = 'Process Payroll';
                Image = PayrollStatistics;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Text000: Label '@1@@@@@@@@@@@@@@@@@@@@@';
                begin

                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.Find('-') then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    if PRSalaryCard.Get(Rec."No.") then begin
                        HREmployeePR.Reset;
                        HREmployeePR.SetRange(HREmployeePR.Status, HREmployeePR.Status::Active);

                        if HREmployeePR.Find('-') then begin
                            ProgressWindow.Open('Processing Salary #1#################################################################');
                            repeat
                                ProgressWindow.Update(1, HREmployeePR."No." + ':' + HREmployeePR."Full Name");
                                //if PRSalaryCard.Get(HREmployeePR."No.") then begin
                                    //ProcessPayroll.fnProcesspayroll(HREmployeePR."No.", HREmployeePR."Date Of Join"
                                    // , PRSalaryCard."Basic Pay", PRSalaryCard."Pays PAYE", PRSalaryCard."Pays NSSF", PRSalaryCard."Pays NHIF"
                                    // , SelectedPeriod, SelectedPeriod, '', '', HREmployeePR."Date Of Leaving", true,
                                    // HREmployeePR."Department Code", PRSalaryCard."Insurance Certificate?");
                                //end else begin
                                    //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                //end;
                            until HREmployeePR.Next = 0;
                            ProgressWindow.Close;
                        end;

                        Commit;

                        //CODEUNIT
                        PRSalaryCard.Reset;
                        PRSalaryCard.SetRange("Employee Code", Rec."No.");
                        PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);

                        //AFTER SUCCESS PROCSSING PRINT INDIVIDUAL PAYSLIP
                        //REPORT.Run(REPORT::"PR Individual Payslip", true, false, PRSalaryCard);
                    end;
                end;
            }
            action("Update NSSF NHIF")
            {
                Caption = 'Update NSSF NHIF';

                trigger OnAction()
                var
                    PRSalaryCard: Record "PR Salary Card";
                begin
                    Error('disabled');
                    PRSalaryCard.Reset;
                    if PRSalaryCard.Find('-') then begin
                        repeat
                            PRSalaryCard."Pays NSSF" := true;
                            PRSalaryCard."Pays PAYE" := true;
                            PRSalaryCard."Pays NHIF" := true;
                            PRSalaryCard.Modify;
                        until PRSalaryCard.Next = 0;
                        Message('DONE');
                    end;
                end;
            }
            action("Process Current")
            {
                Caption = 'Process Current';
                Image = PayrollStatistics;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Text000: Label '@1@@@@@@@@@@@@@@@@@@@@@';
                begin

                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.Find('-') then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    if PRSalaryCard.Get(Rec."No.") then begin
                        HREmployeePR.Reset;
                        HREmployeePR.SetRange(HREmployeePR.Status, HREmployeePR.Status::Active);
                        HREmployeePR.SetRange(HREmployeePR."No.", Rec."No.");
                        if HREmployeePR.Find('-') then begin
                            ProgressWindow.Open('Processing Salary #1#################################################################');
                            repeat
                                ProgressWindow.Update(1, HREmployeePR."No." + ':' + HREmployeePR."Full Name");
                                if PRSalaryCard.Get(HREmployeePR."No.") then begin
                                    //ProcessPayroll.fnProcesspayroll(HREmployeePR."No.", HREmployeePR."Date Of Join"
                                    //  , PRSalaryCard."Basic Pay", PRSalaryCard."Pays PAYE", PRSalaryCard."Pays NSSF", PRSalaryCard."Pays NHIF"
                                    //  , SelectedPeriod, SelectedPeriod, '', '', HREmployeePR."Date Of Leaving", true,
                                    //  HREmployeePR."Department Code", PRSalaryCard."Insurance Certificate?");
                                end else begin
                                    //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                end;
                            until HREmployeePR.Next = 0;
                            ProgressWindow.Close;
                        end;

                        Commit;

                        //CODEUNIT
                        PRSalaryCard.Reset;
                        PRSalaryCard.SetRange("Employee Code", Rec."No.");
                        PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);

                        //AFTER SUCCESS PROCSSING PRINT INDIVIDUAL PAYSLIP
                        //REPORT.Run(REPORT::"PR Individual Payslip", true, false, PRSalaryCard);
                    end;
                end;
            }
            action("Update Loan Deductions")
            {
                Caption = 'Update Loan Deductions';
                Image = UnlimitedCredit;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PRTransactionCodes: Record "PR Transaction Codes";
                    PREmployeeTransactions: Record "PR Employee Transactions";
                    HREmployees: Record "HR Employees";
                    ProductFactory: Record "Product Factory";
                    Loans: Record Loans;
                    PRTransactionCodesN: Record "PR Transaction Codes";
                    PREmployeeTransactionsN: Record "PR Employee Transactions";
                    PayPeriod: Record "PR Payroll Periods";
                    dtOpenPeriod: Date;
                    strPeriodName: Text;
                begin

                    if not Confirm('Are you sure you want to update staff loan details?') then exit;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.Find('-') then begin
                        strPeriodName := PayPeriod."Period Name";
                        dtOpenPeriod := PayPeriod."Date Opened";
                    end;
                    if PRSalaryCard.Get(Rec."No.") then begin
                        HREmployees.Reset;
                        HREmployees.SetRange(HREmployees.Status, HREmployees.Status::Active);
                        if HREmployees.Find('-') then begin
                            repeat
                                Loans.Reset;
                                Loans.SetRange("Staff No", HREmployees."No.");
                                Loans.SetFilter("Total Loan Balance", '>%1', 0);
                                Loans.SetFilter("Loan Product Type", '<>%1', '133');

                                if Loans.Find('-') then begin
                                    repeat
                                        PRTransactionCodes.Reset;
                                        PRTransactionCodes.SetRange("Loan Product Type", Loans."Loan Product Type");
                                        if PRTransactionCodes.Find('-') then begin
                                            repeat
                                                PREmployeeTransactions.Reset;
                                                PREmployeeTransactions.SetRange("Employee Code", HREmployees."No.");
                                                PREmployeeTransactions.SetRange("Transaction Code", PRTransactionCodes."Transaction Code");
                                                PREmployeeTransactions.SetRange("Loan Number", Loans."Loan No.");
                                                PREmployeeTransactions.SetRange(PREmployeeTransactions."Payroll Period", dtOpenPeriod);
                                                if PREmployeeTransactions.Find('-') then begin
                                                    repeat
                                                        Loans.CalcFields("Outstanding Balance", "Outstanding Interest", "Outstanding Bills");
                                                        if PREmployeeTransactions.Variated = false then begin
                                                            PREmployeeTransactions.Amount := Loans.Repayment;///ROUND((Loans."Approved Amount"/Loans.Installments)+(Loans."Approved Amount"*Loans.Interest/1200),1,'=');
                                                        end;
                                                        PREmployeeTransactions.Balance := Loans."Outstanding Balance";
                                                        if Loans.Interest = 0 then begin
                                                            PREmployeeTransactions."Loan Interest Rate" := 1;
                                                        end else begin
                                                            PREmployeeTransactions."Loan Interest Rate" := Loans.Interest;
                                                        end;
                                                        PREmployeeTransactions."#of Repayments" := Loans.Installments;
                                                        PREmployeeTransactions."Original Amount" := Loans."Approved Amount";
                                                        PREmployeeTransactions.Modify;

                                                    until PREmployeeTransactions.Next = 0;
                                                end;
                                            until PRTransactionCodes.Next = 0;
                                        end;
                                    until Loans.Next = 0;
                                end;
                            until HREmployees.Next = 0;
                        end;
                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        CheckPayrollView();
        OnAccesRestrictView
    end;

    var
        PRSalaryCard: Record "PR Salary Card";
        PRPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        // ProcessPayroll: Codeunit "PR Payroll Processing";
        HREmployeePR: Record "HR Employees";
        ProgressWindow: Dialog;
        PREmployeeTrans: Record "PR Employee Transactions";
        HREMP: Record "HR Employees";
        i: Integer;
        PRPeriodT: Record "PR Period Transactions";
        PRTransCodes: Record "PR Transaction Codes";
        PrevPayrollPeriod: Date;
        LoanStatus: Option " ","Fully Paid","Partly Paid";
        LoanTransCode: Code[15];
        InterestTransCode: Code[15];
        PREmployeeTrans_2: Record "PR Employee Transactions";
        PREmployeeTrans_3: Record "PR Employee Transactions";
        PREmployeeTrans_4: Record "PR Employee Transactions";
        PRTransCodes_2: Record "PR Transaction Codes";
        LoanTransCode_2: Code[20];
        InterestTransCode_2: Code[20];
        ApprovalEntry: Record "Approval Entry";
        ChangePermission: Record "Status Change Permissions.";

    //[Scope('Internal')]
    procedure CheckPayrollView()
    var
        Text000: Label 'You do not have permissions to VIEW Payroll.Sending An E-mail Alert To The Payroll Manager.';
        StatusPermissions: Record "Status Change Permissions.";
    begin
        /*StatusPermissions.RESET;
        StatusPermissions.SETRANGE(StatusPermissions."User ID");
        StatusPermissions.SETRANGE(StatusPermissions."Function",StatusPermissions."Function"::"View Payroll");
        IF NOT StatusPermissions.FIND('-') THEN
        ERROR(Text000);
        */
        StatusPermissions.Reset;
        StatusPermissions.SetRange(StatusPermissions."User ID", UserId);
        StatusPermissions.SetRange(StatusPermissions."Function", StatusPermissions."Function"::"View Payroll");
        if not StatusPermissions.Find('-') then
            Error(Text000);

    end;

    //[Scope('Internal')]
    procedure OnAccesRestrictView()
    var
        ChangePermission: Record "Status Change Permissions.";
        ErrorOnRestrictViewTxt: Label 'You do Not have Permission on View,Read,Modify on this Page. Contact system administrator for assistance. %1-%2';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("View Payroll", true);
        ChangePermission.SetRange("Function Extended", ChangePermission."Function Extended"::"View Payroll");
        if not ChangePermission.Find('-') then begin
            Error(ErrorOnRestrictViewTxt, UserId, Rec.TableCaption);
        end;
    end;
}

