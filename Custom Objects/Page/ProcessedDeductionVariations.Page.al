page 52185646 "Processed Deduction Variations"
{
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "prPayroll Variations";
    SourceTableView = WHERE(Processed = CONST(true),
                            "Transaction Type" = CONST(Deduction));

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
            }
        }
    }

    actions
    {
        area(processing)
        {
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
        Rec."Transaction Type" := Rec."Transaction Type"::Deduction;
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
        //objOcx: Codeunit prPayrollProcessing111;
        strExtractedFrml: Text[30];
        curTransAmount: Decimal;
        empCode: Text[30];
        EmpTrans: Record "PR Employee Transactions";
        EmpTransR: Record "PR Employee Transactions";
        TransVariation: Record "prPayroll Variations";
        objPayrollPeriod: Record "PR Payroll Periods";
}

