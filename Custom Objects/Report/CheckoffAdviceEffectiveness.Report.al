#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185692 "Checkoff Advice  Effectiveness"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Checkoff Advice  Effectiveness.rdlc';

    dataset
    {
        dataitem("Checkoff Advice Header"; "Checkoff Advice Header")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_2; 2)
            {
            }
            dataitem("Checkoff Advice Line"; "Checkoff Advice Line")
            {
                DataItemLink = "Advice Header No." = field("No.");
                DataItemTableView = where("Advice Type" = filter(<> Stoppage));
                RequestFilterFields = "Employer Code";
                column(ReportForNavId_1; 1)
                {
                }
                column(MemberNo; "Checkoff Advice Line"."Member No.")
                {
                }
                column(PayrollNo; "Checkoff Advice Line"."Payroll No")
                {
                }
                column(Name; Name)
                {
                }
                column(AmountOn; "Checkoff Advice Line"."Amount On")
                {
                }
                column(AmountOff; "Checkoff Advice Line"."Amount Off")
                {
                }
                column(BalanceOn; "Checkoff Advice Line"."Balance On")
                {
                }
                column(BalaceOff; "Checkoff Advice Line"."Balance Off")
                {
                }
                column(ProductFactory; CheckoffAdviceLine."Product Name")
                {
                }
                column(CompanyName; Company.Name)
                {
                }
                column(CompanyAddress; Company.Address)
                {
                }
                column(ComapnyPicture; Company.Picture)
                {
                }
                column(Period; "Checkoff Advice Header".Period)
                {
                }
                column(EmployerName; "Checkoff Advice Header"."Employer Name")
                {
                }
                column(EmployerAccountNo; EmployerAccountNo)
                {
                }
                column(Narration; NarationCode)
                {
                }
                column(VoteNo; "Checkoff Advice Line"."Employer Code")
                {
                }
                column(SaccoCode; SaccoCode)
                {
                }
                column(EDcode; EDcode)
                {
                }
                column(TransType; ActionCode)
                {
                }
                column(Interest; IntCode)
                {
                }
                column("Action"; TransCode)
                {
                }
                column(BookNo; BookNo)
                {
                }
                column(LoanAmount; LoanAmount)
                {
                }
                column(InterestAmount; InterestAmount)
                {
                }
                column(EmployerCode; "Checkoff Advice Line"."Employer Code")
                {
                }
                column(AdviceDate; adviceDate)
                {
                }
                column(EffectiveMonth; ExpectedDate)
                {
                }
                column(SavingAmount; SavingsAmount)
                {
                }
                column(Type; "Checkoff Advice Line".Type)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    GeneralSetUp.Get();
                    Amount := 0;
                    SavingsAmount := 0;
                    "Checkoff Advice Header".Reset;
                    "Checkoff Advice Header".SetRange("Checkoff Advice Header"."No.", "Checkoff Advice Line"."Advice Header No.");
                    if "Checkoff Advice Header".Find() then
                        adviceDate := "Checkoff Advice Header"."End Date" + 1;
                    LoanAmount := 0;
                    InterestAmount := 0;
                    ExpectedDate := CalcDate(GeneralSetUp."Salary Period", adviceDate);
                    if ProductFactory.Get("Checkoff Advice Line"."Product Type") then begin
                        if ProductFactory."Product Class Type" = ProductFactory."product class type"::Savings then
                            CurrReport.Skip;
                    end;

                    if Members.Get("Checkoff Advice Line"."Member No.") then begin
                        CheckoffAdviceLine.Reset;
                        CheckoffAdviceLine.SetCurrentkey("Member No.");
                        CheckoffAdviceLine.SetRange("Advice Header No.", "Checkoff Advice Header"."No.");
                        CheckoffAdviceLine.SetRange("Member No.", Members."No.");
                        if CheckoffAdviceLine.Find('-') then begin
                            repeat
                                MemberNo := CheckoffAdviceLine."Member No.";
                                Name := CheckoffAdviceLine.Names;
                                Amount := Amount + CheckoffAdviceLine."Amount On" + CheckoffAdviceLine.Interest;
                            until CheckoffAdviceLine.Next = 0;
                        end;
                    end;

                    if "Checkoff Advice Line"."Advice Type" = "Checkoff Advice Line"."advice type"::Adjustment then begin
                        NarationCode := Format("Checkoff Advice Line"."Employer Code") + 'ADJUSTMENT';
                        ActionCode := '5';
                        TransCode := 1;
                        SavingsLedger.Reset;
                        SavingsLedger.SetRange("Customer No.", "Checkoff Advice Line"."Account No.");
                        SavingsLedger.SetRange(Reversed, false);
                        SavingsLedger.SetRange("Posting Date", adviceDate, ExpectedDate);
                        if SavingsLedger.Find('-') then begin
                            SavingsLedger.CalcSums("Amount (LCY)");
                            SavingsAmount := SavingsLedger."Amount (LCY)" * -1;
                        end;

                    end else
                        if "Checkoff Advice Line"."Advice Type" = "Checkoff Advice Line"."advice type"::Stoppage then begin
                            NarationCode := Format("Checkoff Advice Line"."Employer Code") + 'STOPPAGE';
                            ActionCode := '3';
                            TransCode := 1;
                            SavingsLedger.Reset;
                            SavingsLedger.SetRange("Customer No.", "Checkoff Advice Line"."Account No.");
                            SavingsLedger.SetRange(Reversed, false);
                            SavingsLedger.SetRange("Posting Date", adviceDate, ExpectedDate);
                            if SavingsLedger.Find('-') then begin
                                SavingsLedger.CalcSums("Amount (LCY)");
                                SavingsAmount := SavingsLedger."Amount (LCY)" * -1;
                            end;
                        end else
                            if "Checkoff Advice Line"."Advice Type" = "Checkoff Advice Line"."advice type"::"New Loan" then begin
                                NarationCode := Format("Checkoff Advice Line"."Employer Code") + 'NEW LOAN';
                                TransCode := 2;
                                ActionCode := '12';
                                CreditLedger.Reset;
                                CreditLedger.SetRange("Loan No", "Checkoff Advice Line"."Loan No.");
                                CreditLedger.SetFilter("Transaction Type", '%1', CreditLedger."transaction type"::Repayment);
                                CreditLedger.SetRange(Reversed, false);
                                CreditLedger.SetRange("Posting Date", adviceDate, ExpectedDate);
                                if CreditLedger.Find('-') then begin
                                    repeat
                                        CreditLedger.CalcSums(Amount);
                                        LoanAmount := CreditLedger.Amount * -1;
                                    until CreditLedger.Next = 0;
                                end;
                                CreditLedger.Reset;
                                CreditLedger.SetRange("Loan No", "Checkoff Advice Line"."Loan No.");
                                CreditLedger.SetFilter("Transaction Type", '%1', CreditLedger."transaction type"::"Interest Paid");
                                CreditLedger.SetRange(Reversed, false);
                                CreditLedger.SetRange("Posting Date", adviceDate, ExpectedDate);
                                if CreditLedger.Find('-') then begin
                                    repeat
                                        CreditLedger.CalcSums(Amount);
                                        InterestAmount := CreditLedger.Amount * -1;
                                    until CreditLedger.Next = 0;
                                end;
                                SavingsLedger.Reset;
                                SavingsLedger.SetRange("Customer No.", "Checkoff Advice Line"."Account No.");
                                SavingsLedger.SetRange(Reversed, false);
                                SavingsLedger.SetRange("Posting Date", adviceDate, ExpectedDate);
                                if SavingsLedger.Find('-') then begin
                                    SavingsLedger.CalcSums("Amount (LCY)");
                                    SavingsAmount := SavingsLedger."Amount (LCY)" * -1;
                                end;
                            end else
                                if "Checkoff Advice Line"."Advice Type" = "Checkoff Advice Line"."advice type"::Refeeding then begin
                                    NarationCode := Format("Checkoff Advice Line"."Employer Code") + 'NEW LOAN';
                                    TransCode := 1;
                                    ActionCode := '12';
                                    CreditLedger.Reset;
                                    CreditLedger.SetRange("Loan No", "Checkoff Advice Line"."Loan No.");
                                    CreditLedger.SetFilter("Transaction Type", '%1', CreditLedger."transaction type"::Repayment);
                                    CreditLedger.SetRange(Reversed, false);
                                    CreditLedger.SetRange("Posting Date", adviceDate, ExpectedDate);
                                    if CreditLedger.Find('-') then begin
                                        repeat
                                            CreditLedger.CalcSums(Amount);
                                            LoanAmount := CreditLedger.Amount * -1;
                                        until CreditLedger.Next = 0;
                                    end;
                                    CreditLedger.Reset;
                                    CreditLedger.SetRange("Loan No", "Checkoff Advice Line"."Loan No.");
                                    CreditLedger.SetFilter("Transaction Type", '%1', CreditLedger."transaction type"::"Interest Paid");
                                    CreditLedger.SetRange(Reversed, false);
                                    CreditLedger.SetRange("Posting Date", adviceDate, ExpectedDate);
                                    if CreditLedger.Find('-') then begin
                                        repeat
                                            CreditLedger.CalcSums(Amount);
                                            InterestAmount := CreditLedger.Amount * -1;
                                        until CreditLedger.Next = 0;
                                    end;
                                    SavingsLedger.Reset;
                                    SavingsLedger.SetRange("Customer No.", "Checkoff Advice Line"."Account No.");
                                    SavingsLedger.SetRange(Reversed, false);
                                    SavingsLedger.SetRange("Posting Date", adviceDate, ExpectedDate);
                                    if SavingsLedger.Find('-') then begin
                                        SavingsLedger.CalcSums("Amount (LCY)");
                                        SavingsAmount := SavingsLedger."Amount (LCY)" * -1;
                                    end;
                                end else
                                    if "Checkoff Advice Line"."Advice Type" = "Checkoff Advice Line"."advice type"::Variations then begin
                                        NarationCode := Format("Checkoff Advice Line"."Employer Code") + 'VARIATION';
                                        ActionCode := '2';
                                        TransCode := 1;
                                        CreditLedger.Reset;
                                        CreditLedger.SetRange("Loan No", "Checkoff Advice Line"."Loan No.");
                                        CreditLedger.SetFilter("Transaction Type", '%1', CreditLedger."transaction type"::Repayment);
                                        CreditLedger.SetRange(Reversed, false);
                                        CreditLedger.SetRange("Posting Date", adviceDate, ExpectedDate);
                                        if CreditLedger.Find('-') then begin
                                            repeat
                                                CreditLedger.CalcSums(Amount);
                                                LoanAmount := CreditLedger.Amount * -1;
                                            until CreditLedger.Next = 0;
                                        end;
                                        CreditLedger.Reset;
                                        CreditLedger.SetRange("Loan No", "Checkoff Advice Line"."Loan No.");
                                        CreditLedger.SetFilter("Transaction Type", '%1', CreditLedger."transaction type"::"Interest Paid");
                                        CreditLedger.SetRange(Reversed, false);
                                        CreditLedger.SetRange("Posting Date", adviceDate, ExpectedDate);
                                        if CreditLedger.Find('-') then begin
                                            repeat
                                                CreditLedger.CalcSums(Amount);
                                                InterestAmount := CreditLedger.Amount * -1;
                                            until CreditLedger.Next = 0;
                                        end;
                                        SavingsLedger.Reset;
                                        SavingsLedger.SetRange("Customer No.", "Checkoff Advice Line"."Account No.");
                                        SavingsLedger.SetRange(Reversed, false);
                                        SavingsLedger.SetRange("Posting Date", adviceDate, ExpectedDate);
                                        if SavingsLedger.Find('-') then begin
                                            SavingsLedger.CalcSums("Amount (LCY)");
                                            SavingsAmount := SavingsLedger."Amount (LCY)" * -1;
                                        end;
                                    end;
                    if Loans.Get("Checkoff Advice Line"."Loan No.") then begin
                        if (Loans."Interest Calculation Method" = Loans."interest calculation method"::"Reducing Flat") or
                          (Loans."Interest Calculation Method" = Loans."interest calculation method"::Amortised) then
                            IntCode := 1
                        else
                            IntCode := 0;
                    end;
                    //IF Turn=2 THEN CurrReport.SKIP
                    EDcode := Company."ED Code";
                    SaccoCode := Company."Sacco Code";
                    BookNo := CopyStr("Checkoff Advice Line"."Payroll No", 10, 1);
                    if "Checkoff Advice Line"."Employer Account No." = '' then
                        EmployerAccountNo := "Checkoff Advice Line"."Account No." else
                        EmployerAccountNo := "Checkoff Advice Line"."Employer Account No.";
                end;

                trigger OnPreDataItem()
                begin
                    i := 1;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        Company.Get;
        Company.CalcFields(Picture);
    end;

    var
        ProductFactory: Record 52185690;
        Loans: Record 52185729;
        Members: Record "Members";
        ClolumHeader: Code[10];
        ColumnValue: Decimal;
        MemberNo: Code[10];
        PayrollNo: Code[10];
        Name: Text;
        Interest: Decimal;
        Amount: Decimal;
        CheckoffAdviceLine: Record 52185818;
        Turn: Integer;
        CulumnA: array[50] of Code[10];
        Company: Record "Company Information";
        i: Integer;
        EDcode: Code[10];
        SaccoCode: Code[10];
        NarationCode: Text;
        IntCode: Integer;
        ActionCode: Code[10];
        TransCode: Integer;
        BookNo: Code[10];
        EmployerAccountNo: Code[50];
        CreditLedger: Record 52185733;
        SavingsLedger: Record 52185732;
        LoanAmount: Decimal;
        SavingsAmount: Decimal;
        ExpectedDate: Date;
        Days: DateFormula;
        GeneralSetUp: Record 52185689;
        InterestAmount: Decimal;
        adviceDate: Date;
}
