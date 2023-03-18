#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185725 "Loan Repayment Schedule"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Loan Repayment Schedule.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            column(ReportForNavId_4645; 4645)
            {
            }
            column(Loans_Loans_Interest; Loans.Interest)
            {
                DecimalPlaces = 2 : 2;
            }
            column(Loans_Loans__Approved_Amount_; Loans."Approved Amount")
            {
            }
            column(Loans_Loans__Loan_Product_Type_Name_; Loans."Loan Product Type Name")
            {
            }
            column(Loans_Loans__Client_Name_; Loans."Member Name")
            {
            }
            column(Loans_Loans__Client_Code_; Loans."Member No.")
            {
            }
            column(Loans__Repayment_Method_; Loans."Interest Calculation Method")
            {
            }
            // column(Intallments__Months_Caption; Intallments__Months_CaptionLbl)
            // {
            // }
            // column(Loans_Loans__Loan__No__; Loans."Loan No.")
            // {
            // }
            // column(Disbursment_DateCaption; Disbursment_DateCaptionLbl)
            // {
            // }
            // column(Current_InterestCaption; Current_InterestCaptionLbl)
            // {
            // }
            // column(Loan_AmountCaption; Loan_AmountCaptionLbl)
            // {
            // }
            // column(Loan_ProductCaption; Loan_ProductCaptionLbl)
            // {
            // }
            // column(Loan_No_Caption; Loan_No_CaptionLbl)
            // {
            // }
            // column(Account_No_Caption; Account_No_CaptionLbl)
            // {
            // }
            column(COMPANY_NAME; COMPANYNAME)
            {
            }
            dataitem("Loan Repayment Schedule";"Loan Repayment Schedule")
            {
                DataItemLink = "Loan No." = field("Loan No.");
                DataItemTableView = sorting("Loan No.", "Member No.", "Repayment Date");
                RequestFilterFields = "Member No.", "Loan Category";
                column(ReportForNavId_9169; 9169)
                {
                }
                column(ROUND__Monthly_Repayment__10_____; ROUND("Monthly Repayment"))
                {
                }
                column(FORMAT__Repayment_Date__0_4_; Format("Repayment Date", 0, 4))
                {
                }
                column(ROUND__Principal_Repayment__10_____; ROUND("Principal Repayment"))
                {
                }
                column(ROUND__Monthly_Interest__10_____; ROUND("Monthly Interest"))
                {
                }
                column(LoanBalance; ROUND(LoanBalance))
                {
                }
                column(Loan_Repayment_Schedule__Repayment_Code_; "Repayment Code")
                {
                }
                column(ROUND__Monthly_Repayment__10______Control1000000043; ROUND("Monthly Repayment", 10, '='))
                {
                }
                column(ROUND__Principal_Repayment__10______Control1000000014; ROUND("Principal Repayment", 10, '='))
                {
                }
                column(ROUND__Monthly_Interest__10______Control1000000015; ROUND("Monthly Interest", 10, '='))
                {
                }
                column(Monthly_RepaymentCaption; Monthly_RepaymentCaptionLbl)
                {
                }
                column(InterestCaption; InterestCaptionLbl)
                {
                }
                column(Principal_RepaymentCaption; Principal_RepaymentCaptionLbl)
                {
                }
                column(Due_DateCaption; Due_DateCaptionLbl)
                {
                }
                column(Loan_BalanceCaption; Loan_BalanceCaptionLbl)
                {
                }
                column(Loan_RepaymentCaption; Loan_RepaymentCaptionLbl)
                {
                }
                column(TotalCaption; TotalCaptionLbl)
                {
                }
                column(Loan_Repayment_Schedule_Loan_No_; "Loan No.")
                {
                }
                column(Loan_Repayment_Schedule_Member_No_; "Member No.")
                {
                }
                column(Loan_Repayment_Schedule_Repayment_Date; "Repayment Date")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    i := i + 1;

                    TotalPrincipalRepayment := TotalPrincipalRepayment + "Loan Repayment Schedule"."Principal Repayment";
                    if "Loan Repayment Schedule"."Reset Schedule" then begin

                        if "Loan Repayment Schedule"."Reset Doc No." = PreviousDocNo then begin
                            //MESSAGE('%1',TotalPrincipalRepayment);
                            TotalPrincipalRepayment2 := TotalPrincipalRepayment2 + "Loan Repayment Schedule"."Principal Repayment";
                            i2 := i2 + 1;
                            if i2 = 1 then
                                LoanBalance := "Loan Repayment Schedule"."Loan Amount"
                            else
                                LoanBalance := "Loan Repayment Schedule"."Loan Amount" - TotalPrincipalRepayment2 + "Loan Repayment Schedule"."Principal Repayment";
                        end else begin
                            i2 := 1;
                            //TotalPrincipalRepayment2:="Loan Repayment Schedule"."Principal Repayment";
                            TotalPrincipalRepayment2 := TotalPrincipalRepayment2 + "Loan Repayment Schedule"."Principal Repayment";
                            LoanBalance := "Loan Repayment Schedule"."Loan Amount" - TotalPrincipalRepayment2 + "Loan Repayment Schedule"."Principal Repayment";
                            //MESSAGE('%1',PreviousDocNO);
                        end;
                    end else begin
                        if i = 1 then
                            LoanBalance := "Loan Repayment Schedule"."Loan Amount"
                        else begin
                            LoanBalance := "Loan Repayment Schedule"."Loan Amount" - TotalPrincipalRepayment + "Loan Repayment Schedule"."Principal Repayment";
                        end;
                    end;
                    CumInterest := CumInterest + "Loan Repayment Schedule"."Monthly Interest";
                    CumMonthlyRepayment := CumMonthlyRepayment + "Loan Repayment Schedule"."Monthly Repayment";
                    CumPrincipalRepayment := CumPrincipalRepayment + "Loan Repayment Schedule"."Principal Repayment";
                end;

                trigger OnPreDataItem()
                begin
                    //LastFieldNo := UnknownTable52185738.FieldNo("Member No.");
                    i := 0;
                    j := 0;
                    i2 := 0;
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

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: label 'Total for ';
        Duration: Integer;
        MemberLoan: Record Customer;
        IssuedDate: Date;
        LoanCategory: Record 52185685;
        i: Integer;
        LoanBalance: Decimal;
        CumInterest: Decimal;
        CumMonthlyRepayment: Decimal;
        CumPrincipalRepayment: Decimal;
        j: Integer;
        LoanApp: Record 52185729;
        GroupName: Text[70];
        TotalPrincipalRepayment: Decimal;
        Rate: Decimal;
        BankDetails: Text[250];
        Cust: Record Customer;
        Intallments__Months_CaptionLbl: label 'Intallments (Months)';
        Disbursment_DateCaptionLbl: label 'Disbursment Date';
        Current_InterestCaptionLbl: label 'Current Interest';
        Loan_AmountCaptionLbl: label 'Loan Amount';
        Loan_ProductCaptionLbl: label 'Loan Product';
        Loan_No_CaptionLbl: label 'Loan No.';
        Account_No_CaptionLbl: label 'Account No.';
        Monthly_RepaymentCaptionLbl: label 'Monthly Repayment';
        InterestCaptionLbl: label 'Interest';
        Principal_RepaymentCaptionLbl: label 'Principal Repayment';
        Due_DateCaptionLbl: label 'Due Date';
        Loan_BalanceCaptionLbl: label 'Loan Balance';
        Loan_RepaymentCaptionLbl: label 'Loan Repayment';
        TotalCaptionLbl: label 'Total';
        i2: Integer;
        TotalPrincipalRepayment2: Decimal;
        PreviousDocNo: Code[10];
}
