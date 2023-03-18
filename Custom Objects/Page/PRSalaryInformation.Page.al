page 52185615 "PR Salary Information"
{
    AutoSplitKey = false;
    Caption = 'Payment Information';
    DelayedInsert = true;
    LinksAllowed = false;
    PageType = ListPart;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "PR Salary Card";

    layout
    {
        area(content)
        {
            repeater("Payment Info")
            {
                Caption = 'Payment Info';
                field("Basic Pay"; Rec."Basic Pay")
                {
                }
                field("Days Worked"; Rec."Days Worked")
                {
                }
                field("Rate Per Day"; Rec."Rate Per Day")
                {
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                }
                field(Currency; Rec.Currency)
                {
                }
                field("Pays NSSF"; Rec."Pays NSSF")
                {
                }
                field("Pays NHIF"; Rec."Pays NHIF")
                {
                }
                field("Pays PAYE"; Rec."Pays PAYE")
                {
                }
                field("Disable Personal Relief?"; Rec."Disable Personal Relief?")
                {
                }
                field("Insurance Certificate?"; Rec."Insurance Certificate?")
                {
                }
                field("Gratuity Amount"; Rec."Gratuity Amount")
                {
                }
                field("Suspend Pay"; Rec."Suspend Pay")
                {

                    trigger OnValidate()
                    begin

                        if Rec."Suspend Pay" = true then begin
                            Question := 'Suspending means the staff will NOT be paid for [' + PeriodName + '].';
                            Question := Question + '\If any transactions had been posted for [' + PeriodName + '], the system will delete them.\';
                            Question := Question + '\Do you wish to suspend the pay for the staff?';
                            Answer := DIALOG.Confirm(Question, false);
                            if Answer = false then begin
                                Rec."Suspend Pay" := false;
                                Rec."Suspension Reasons" := '';
                                Rec."Suspension Date" := Today;
                            end;

                            if Answer = true then begin
                                PeriodTrans.Reset;
                                PeriodTrans.SetRange(PeriodTrans."Employee Code", Rec."Employee Code");
                                PeriodTrans.SetRange(PeriodTrans."Payroll Period", CurrentMonth);
                                PeriodTrans.DeleteAll;
                            end;
                        end;

                        if Rec."Suspend Pay" = false then Rec."Suspension Reasons" := '';
                    end;
                }
                field("Suspension Date"; Rec."Suspension Date")
                {
                }
                field("Suspension Reasons"; Rec."Suspension Reasons")
                {
                    MultiLine = false;
                }
                field("Cumm BasicPay"; Rec."Cumm BasicPay")
                {
                }
                field("Cumm GrossPay"; Rec."Cumm GrossPay")
                {
                }
                field("Cumm NetPay"; Rec."Cumm NetPay")
                {
                }
                field("Cumm Allowances"; Rec."Cumm Allowances")
                {
                }
                field("Cumm Deductions"; Rec."Cumm Deductions")
                {
                    Editable = false;
                }
                field("Cumm PAYE"; Rec."Cumm PAYE")
                {
                    Editable = false;
                }
                field("Cumm NSSF"; Rec."Cumm NSSF")
                {
                    Editable = false;
                }
                field("Cumm Pension"; Rec."Cumm Pension")
                {
                    Editable = false;
                }
                field("Cumm HELB"; Rec."Cumm HELB")
                {
                    Editable = false;
                }
                field("Cumm NHIF"; Rec."Cumm NHIF")
                {
                    Editable = false;
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

    var
        BasicSalary: Decimal;
        Qtn: Label '''Leave without saving changes?''';
        Question: Text[200];
        Answer: Boolean;
        objPeriod: Record "PR Payroll Periods";
        CurrentMonth: Date;
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
}

