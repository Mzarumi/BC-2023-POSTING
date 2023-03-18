page 52186058 "prSalary Info Casual"
{
    PageType = CardPart;
    SourceTable = "prSalary Card Casual";

    layout
    {
        area(content)
        {
            repeater("Payment Info")
            {
                field("Basic Pay"; Rec."Basic Pay")
                {
                }
                field("Hours Worked"; Rec."Hours Worked")
                {
                }
                field("Overtime Hours"; Rec."Overtime Hours")
                {
                }
                field("Public Holidays&Weekend Hours"; Rec."Public Holidays&Weekend Hours")
                {
                }
                field("Non Taxable"; Rec."Non Taxable")
                {
                }
                field("Pays PAYE"; Rec."Pays PAYE")
                {
                }
                field("Pays NHIF"; Rec."Pays NHIF")
                {
                }
                field("Pays NSSF"; Rec."Pays NSSF")
                {
                }
                field("Cumm BasicPay"; Rec."Cumm BasicPay")
                {
                }
                field("Cumm GrossPay"; Rec."Cumm GrossPay")
                {
                }
                field("Cumm Allowances"; Rec."Cumm Allowances")
                {
                }
                field("Cumm PAYE"; Rec."Cumm PAYE")
                {
                }
                field("Cumm Deductions"; Rec."Cumm Deductions")
                {
                }
                field("Cumm NetPay"; Rec."Cumm NetPay")
                {
                }
                field("Suspend Pay"; Rec."Suspend Pay")
                {
                }
                field("Suspension Date"; Rec."Suspension Date")
                {
                }
                field("Suspension Reasons"; Rec."Suspension Reasons")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        //Get the open period
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            CurrentMonth := objPeriod."Date Opened";
            PeriodName := objPeriod."Period Name";
        end;
    end;

    trigger OnOpenPage()
    begin
        // CurrPage.EDITABLE:=TRUE;
    end;

    var
        BasicSalary: Decimal;
        Question: Text[200];
        Answer: Boolean;
        objPeriod: Record "PR Payroll Periods";
        CurrentMonth: Date;
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
}

