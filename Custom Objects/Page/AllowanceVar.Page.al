page 52185643 "Allowance Var"
{
    PageType = List;
    SourceTable = "prPayroll Variations";
    SourceTableView = WHERE(Processed = CONST(false),
                            "Transaction Type" = CONST(Income));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Employee Code"; Rec."Employee Code")
                {
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {

                    trigger OnValidate()
                    begin
                        blnIsLoan := false;
                        if objTransCodes.Get(Rec."Transaction Code") then
                            Rec."Transaction Name" := objTransCodes."Transaction Name";
                        Rec.Frequency := objTransCodes.Frequency;
                        Rec."Payroll Period" := SelectedPeriod;
                        Rec."Period Month" := PeriodMonth;
                        Rec."Period Year" := PeriodYear;
                        if objTransCodes."Special Transactions" = 8 then blnIsLoan := true;

                        /*IF objTransCodes."Is Formula"=TRUE THEN
                        BEGIN
                         empCode:="Employee Code";
                         CLEAR(objOcx);
                         curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,objTransCodes.Formula);
                         Amount:=curTransAmount;
                        END;
                        */
                        //*************ENTER IF EMPLOYER DEDUCTION IS SET UP
                        curTransAmount := 0;
                        /*
                        IF objTransCodes."Include Employer Deduction"=TRUE THEN
                        BEGIN
                          curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,objTransCodes."Is Formula for employer");
                          "Employer Amount":=curTransAmount;
                        END;
                        */

                    end;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    Editable = false;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Editable = false;
                }
                field(Frequency; Rec.Frequency)
                {
                    Editable = false;
                }
                field("No of Units"; Rec."No of Units")
                {
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                }
                field(Amount; Rec.Amount)
                {

                    trigger OnValidate()
                    begin
                        if (blnIsLoan = true) and (Rec.Balance > 0) and (Rec.Amount > 0) then begin
                            Rec."#of Repayments" := Round(Rec.Balance / Rec.Amount, 1, '>');
                            Rec."#of Repayments" := Round(Rec."#of Repayments", 1, '>');
                        end;
                    end;
                }
                field(Balance; Rec.Balance)
                {

                    trigger OnValidate()
                    begin
                        if (blnIsLoan = true) and (Rec.Balance > 0) and (Rec.Amount > 0) then begin
                            Rec."#of Repayments" := Round(Rec.Balance / Rec.Amount, 1, '>');
                            Rec."#of Repayments" := Round(Rec."#of Repayments", 1, '>');
                        end;
                    end;
                }
                field("#of Repayments"; Rec."#of Repayments")
                {
                    Editable = true;
                    Visible = true;

                    trigger OnValidate()
                    begin
                        if blnIsLoan = true then begin
                            Rec."#of Repayments" := Round(Rec.Balance / Rec.Amount, 1, '>');
                            Rec."#of Repayments" := Round(Rec."#of Repayments", 1, '>');
                        end;
                    end;
                }
                field("Amortized Loan Total Repay Amt"; Rec."Amortized Loan Total Repay Amt")
                {
                    Visible = false;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    Editable = false;
                }
                field(Membership; Rec.Membership)
                {
                }
                field("Loan Number"; Rec."Loan Number")
                {
                    Visible = false;
                }
                field("Reference No"; Rec."Reference No")
                {
                    Visible = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    Visible = false;
                }
                field("End Date"; Rec."End Date")
                {
                    Visible = false;
                }
                field(Suspended; Rec.Suspended)
                {
                    Visible = false;
                }
                field("Stop for Next Period"; Rec."Stop for Next Period")
                {
                    Visible = false;
                }
                field("Employer Amount"; Rec."Employer Amount")
                {
                }
                field("Employer Balance"; Rec."Employer Balance")
                {
                }
                field(Currency; Rec.Currency)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Process All")
            {
                Caption = 'Process All';
                Image = Recalculate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if not Confirm('This will effect the changes to the employee transactions. ' +
                                    'Do you wish to continue?', false) then begin
                        exit;

                    end;


                    objPayrollPeriod.Reset;
                    objPayrollPeriod.SetRange(objPayrollPeriod.Closed, false);
                    if objPayrollPeriod.Find('-') then begin

                        TransVariation.Reset;
                        TransVariation.SetRange(TransVariation."Transaction Type", TransVariation."Transaction Type"::Income);
                        TransVariation.SetRange(TransVariation.Processed, false);
                        TransVariation.SetRange(TransVariation."Payroll Period", objPayrollPeriod."Date Opened");
                        if TransVariation.Find('-') then begin
                            repeat

                                EmpTrans.Reset;
                                EmpTrans.SetCurrentKey(EmpTrans."Employee Code", EmpTrans."Transaction Code");
                                EmpTrans.SetRange(EmpTrans."Employee Code", TransVariation."Employee Code");
                                EmpTrans.SetRange(EmpTrans."Transaction Code", TransVariation."Transaction Code");
                                EmpTrans.SetRange(EmpTrans."Payroll Period", objPayrollPeriod."Date Opened");
                                EmpTrans.SetRange(EmpTrans."Reference No", TransVariation."Reference No");
                                if EmpTrans.Find('-') then begin
                                    EmpTrans.Amount := TransVariation.Amount;
                                    EmpTrans.Balance := TransVariation.Balance;
                                    EmpTrans."#of Repayments" := TransVariation."#of Repayments";
                                    EmpTrans."No of Units" := TransVariation."No of Units";
                                    EmpTrans."Employer Amount" := TransVariation."Employer Amount";
                                    EmpTrans."Employer Balance" := TransVariation."Employer Balance";
                                    EmpTrans."Start Date" := TransVariation."Start Date";
                                    EmpTrans."End Date" := TransVariation."End Date";
                                    EmpTrans.Membership := TransVariation.Membership;
                                    EmpTrans."Loan Number" := TransVariation."Loan Number";
                                    EmpTrans."Payroll Code" := TransVariation."Payroll Code";
                                    EmpTrans.Suspended := TransVariation.Suspended;
                                    EmpTrans.Modify;

                                end else begin
                                    EmpTransR.Init;
                                    EmpTransR."Employee Code" := TransVariation."Employee Code";
                                    EmpTransR."Transaction Code" := TransVariation."Transaction Code";
                                    EmpTransR."Reference No" := TransVariation."Reference No";
                                    EmpTransR."Period Month" := objPayrollPeriod."Period Month";
                                    EmpTransR."Period Year" := objPayrollPeriod."Period Year";
                                    EmpTransR."Payroll Period" := objPayrollPeriod."Date Opened";
                                    EmpTransR."Transaction Name" := TransVariation."Transaction Name";
                                    EmpTransR.Amount := TransVariation.Amount;
                                    EmpTransR.Balance := TransVariation.Balance;
                                    EmpTransR."#of Repayments" := TransVariation."#of Repayments";
                                    EmpTransR."No of Units" := TransVariation."No of Units";
                                    EmpTransR."Employer Amount" := TransVariation."Employer Amount";
                                    EmpTransR."Employer Balance" := TransVariation."Employer Balance";
                                    EmpTransR."Start Date" := TransVariation."Start Date";
                                    EmpTransR."End Date" := TransVariation."End Date";
                                    EmpTransR.Membership := TransVariation.Membership;
                                    EmpTransR."Loan Number" := TransVariation."Loan Number";
                                    EmpTransR."Payroll Code" := TransVariation."Payroll Code";
                                    EmpTransR.Suspended := TransVariation.Suspended;
                                    EmpTransR.Insert;

                                end;

                                TransVariation.Processed := true;
                                TransVariation.Modify;
                            until TransVariation.Next = 0;
                        end;

                    end;
                end;
            }
            action("13Month Print/Preview")
            {
                Caption = '13Month Print/Preview';
                Image = Print;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //RunObject = Report "Dividend Statement";here
            }
        }
    }

    trigger OnInit()
    begin

        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            SelectedPeriod := objPeriod."Date Opened";
            PeriodName := objPeriod."Period Name";
            PeriodMonth := objPeriod."Period Month";
            PeriodYear := objPeriod."Period Year";
            //objEmpTrans.RESET;
            //objEmpTrans.SETRANGE("Payroll Period",SelectedPeriod);
        end;

        //Filter per period  - Dennis
        Rec.SetFilter("Payroll Period", Format(objPeriod."Date Opened"));
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Transaction Type" := Rec."Transaction Type"::Income;
    end;

    var
        objTransCodes: Record "PR Transaction Codes";
        SelectedPeriod: Date;
        objPeriod: Record "PR Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
        blnIsLoan: Boolean;
        objEmpTrans: Record "PR Employee Transactions";
        transType: Text[30];
        objOcx: Codeunit prPayrollProcessing111;
        strExtractedFrml: Text[30];
        curTransAmount: Decimal;
        empCode: Text[30];
        EmpTrans: Record "PR Employee Transactions";
        EmpTransR: Record "PR Employee Transactions";
        TransVariation: Record "prPayroll Variations";
        objPayrollPeriod: Record "PR Payroll Periods";
}

