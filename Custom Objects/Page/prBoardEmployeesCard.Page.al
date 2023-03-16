page 52186632 "prBoard Employees Card"
{
    PageType = Card;
    SourceTable = "prBoard Employees";

    layout
    {
        area(content)
        {
            group(General)
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
                field(Mail; Rec.Mail)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Board Member"; Rec."Board Member")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                }
                field("Bank Branch"; Rec."Bank Branch")
                {
                }
                field("Branch Namecode"; Rec."Branch Namecode")
                {
                }
                field("Branch name"; Rec."Branch name")
                {
                }
                field("National ID"; Rec."National ID")
                {
                }
                field("P.I.N"; Rec."P.I.N")
                {
                }
                field("Posting Group"; Rec."Posting Group")
                {
                }
                field("Pays SSF?"; Rec."Pays SSF?")
                {
                }
            }
            part(Control18; "prBoard Payment")
            {
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Process Payroll")
            {
                Caption = 'Process Payroll';
                Image = MakeOrder;
                Promoted = true;

                trigger OnAction()
                begin
                    objPeriod.Reset;
                    objPeriod.SetRange(objPeriod.Closed, false);
                    if objPeriod.Find('-') then;
                    SelectedPeriod := objPeriod."Date Opened";

                    SalCard.Get(Rec."No.");

                    //Use CODEUNIT
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee."Board Member", true);
                    HrEmployee.SetRange(HrEmployee."No.", Rec."No.");
                    if HrEmployee.Find('-') then begin
                        //Progress Window
                        ProgressWindow.Open('Processing Salary for Employee No. #1#######');
                        repeat
                            //Progress Window
                            Sleep(100);
                            //Progress Window
                            //Suspended
                            //IF NOT SalCard. THEN BEGIN
                            ProgressWindow.Update(1, HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name");
                        //END;
                        //payrollprocessingCasual.fnProcesspayroll(SelectedPeriod, HrEmployee."No.", HrEmployee."Pays SSF?");

                        until HrEmployee.Next = 0;
                        ////Progress Window
                        ProgressWindow.Close;
                    end;
                    //CODEUNIT

                    Commit;

                    //payrollprocessing.pa


                    BoardTransactions.Reset;
                    BoardTransactions.SetRange(BoardTransactions."No.", Rec."No.");
                    BoardTransactions.SetRange(BoardTransactions.Date, SelectedPeriod);


                    //REPORT.Run(REPORT::"prBoard Payslip", true, false, BoardTransactions);
                    //
                    /*
                    employees.RESET;
                    employees.SETRANGE(employees."No.", "No.");
                    //REPORT.Run(REPORT::"prBoard Payslip 2", TRUE, FALSE, employees);
                    */

                end;
            }
        }
    }

    var
        BoardTransactions: Record "PR Board Transactions";
        employees: Record "prBoard Employees";
        //payrollprocessingCasual: Codeunit "PrPayroll Processing Casual";
        objEmp: Record "HR Employees";
        SalCard: Record "prBoard Employees";
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        HrEmployee: Record "prBoard Employees";
        Employee: Record "prBoard Employees";
        ProgressWindow: Dialog;
        prPeriodTransactions: Record "PR Board Transactions";
}

