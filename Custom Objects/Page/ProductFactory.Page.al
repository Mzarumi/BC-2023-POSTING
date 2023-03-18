page 52185712 "Product Factory"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Activities, ,Category7_caption,Category8_caption,Category9_caption,Approvals';
    SourceTable = "Product Factory";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Product ID"; Rec."Product ID")
                {
                }
                field("Product Description"; Rec."Product Description")
                {
                }
                field("Product Class Type"; Rec."Product Class Type")
                {

                    trigger OnValidate()
                    begin
                        DocumentControl;
                    end;
                }
                field("Min. Customer Age"; Rec."Min. Customer Age")
                {
                }
                field("Max. Member Age"; Rec."Max. Member Age")
                {
                }
                field("Interest Rate (Min.)"; Rec."Interest Rate (Min.)")
                {
                }
                field("Interest Rate (Max.)"; Rec."Interest Rate (Max.)")
                {
                }
                field("Dormancy Period"; Rec."Dormancy Period")
                {
                }
                field("Customer Segment"; Rec."Customer Segment")
                {
                    Visible = false;
                }
                field("Account No. Prefix"; Rec."Account No. Prefix")
                {
                }
                field("Account No. Suffix"; Rec."Account No. Suffix")
                {
                }
                field("Statement Charge"; Rec."Statement Charge")
                {
                }
                field("Closure Fee"; Rec."Closure Fee")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Recovery Priority"; Rec."Recovery Priority")
                {
                }
                field("Search Code"; Rec."Search Code")
                {
                }
            }
            group(Finance)
            {
                Caption = 'Finance';
                Visible = FinancialsVisible;
                field(Currency; Rec.Currency)
                {
                }
                field("Product Posting Group"; Rec."Product Posting Group")
                {
                }
                field("Loan  Account [G/L]"; Rec."Loan  Account [G/L]")
                {
                }
                field("Loan Interest Account [G/L]"; Rec."Loan Interest Account [G/L]")
                {
                }
                field("Loan Receivable Account[G/L]"; Rec."Loan Receivable Account[G/L]")
                {
                }
                field("Suspend Interest Account [G/L]"; Rec."Suspend Interest Account [G/L]")
                {
                }
                field("Bill Account"; Rec."Bill Account")
                {
                }
                field("Billed Account"; Rec."Billed Account")
                {
                }
                field("Penalty Paid Account"; Rec."Penalty Paid Account")
                {
                }
                field("Loan Appraisal Income Acc."; Rec."Loan Appraisal Income Acc.")
                {
                }
                field("Accrue Monthly"; Rec."Accrue Monthly")
                {
                }
                field("Monthly Charges"; Rec."Monthly Charges")
                {
                }
                field("Accrual Fee Acc. (Income)"; Rec."Accrual Fee Acc. (Income)")
                {
                }
                field(Target; Rec.Target)
                {
                }
            }
            group("Saving Product")
            {
                Caption = 'Saving Product';
                Visible = SavingsProductVisible;
                field("Loan Disbursement Account"; Rec."Loan Disbursement Account")
                {
                }
                field("Product Category"; Rec."Product Category")
                {
                }
                field("Auto Open Account"; Rec."Auto Open Account")
                {
                }
                field("Loan Security Inclination"; Rec."Loan Security Inclination")
                {
                }
                field("Allow Multiple Accounts"; Rec."Allow Multiple Accounts")
                {
                }
                field("Minimum Contribution"; Rec."Minimum Contribution")
                {
                }
                field("Minimum Balance"; Rec."Minimum Balance")
                {
                }
                field(Notice; Rec.Notice)
                {
                }
                field("Withdrawal Interval"; Rec."Withdrawal Interval")
                {
                }
                field("Maximum No. of Withdrawal"; Rec."Maximum No. of Withdrawal")
                {
                }
                field("Earns Interest"; Rec."Earns Interest")
                {
                }
                field("Interest Calc Min Balance"; Rec."Interest Calc Min Balance")
                {
                }
                field("Interest Expense Account"; Rec."Interest Expense Account")
                {
                }
                field("Interest Payable Account"; Rec."Interest Payable Account")
                {
                }
                field("Dividend Calc. Method"; Rec."Dividend Calc. Method")
                {
                }
                field("Withholding Tax Account"; Rec."Withholding Tax Account")
                {
                }
                field("WithHolding Tax"; Rec."WithHolding Tax")
                {
                }
                field("Allow Over Draft"; Rec."Allow Over Draft")
                {
                }
                field("Credit Limit(Overdraft)"; Rec."Credit Limit(Overdraft)")
                {
                }
                field("Automatic Overdraft"; Rec."Automatic Overdraft")
                {
                }
                field("Over Draft Interest %"; Rec."Over Draft Interest %")
                {
                }
                field("Over Draft Interest Account"; Rec."Over Draft Interest Account")
                {
                }
                field("Allow Multiple Over Draft"; Rec."Allow Multiple Over Draft")
                {
                }
                field("Savings Duration"; Rec."Savings Duration")
                {
                }
                field("Savings Withdrawal penalty"; Rec."Savings Withdrawal penalty")
                {
                }
                field("Allow Send Email"; Rec."Allow Send Email")
                {
                }
                field("Member Category"; Rec."Member Category")
                {
                    Caption = 'Applicable To member category';
                }
                field("Can Guarantee Loan"; Rec."Can Guarantee Loan")
                {
                }
            }
            group("Credit Product")
            {
                Caption = 'Credit Product';
                Visible = CreditProductVisible;
                field("Maximum Guarantors"; Rec."Maximum Guarantors")
                {
                }
                field("Minimum Guarantors"; Rec."Minimum Guarantors")
                {
                }
                field("Minimum Guarantors on Max Amt"; Rec."Minimum Guarantors on Max Amt")
                {
                }
                field("Max Amt on Guarantors"; Rec."Max Amt on Guarantors")
                {
                }
                field("Interest Calculation Method"; Rec."Interest Calculation Method")
                {
                }
                field("Min. Re-application Period"; Rec."Min. Re-application Period")
                {
                }
                field("Minimum Loan Amount"; Rec."Minimum Loan Amount")
                {
                }
                field("Maximum Loan Amount"; Rec."Maximum Loan Amount")
                {
                }
                field("Prefferential Default installm"; Rec."Prefferential Default installm")
                {
                }
                field("Appraisal Parameter Type"; Rec."Appraisal Parameter Type")
                {
                }
                field("Ordinary Default Intallments"; Rec."Ordinary Default Intallments")
                {
                }
                field("Repay Mode"; Rec."Repay Mode")
                {
                    Editable = false;
                }
                field("Does not Require Batching"; Rec."Does not Require Batching")
                {
                }
                field("Net Salary Multiplier %"; Rec."Net Salary Multiplier %")
                {
                }
                field("Grace Period - Interest"; Rec."Grace Period - Interest")
                {
                }
                field("Grace Period - Principle"; Rec."Grace Period - Principle")
                {
                }
                field("Installment Repayment Interval"; Rec."Installment Repayment Interval")
                {
                }
                field("Compute Interest Due on Postin"; Rec."Compute Interest Due on Postin")
                {
                }
                field("Compute Bills on Posting"; Rec."Compute Bills on Posting")
                {
                }
                field("Fixed Loan Term"; Rec."Fixed Loan Term")
                {
                }
                field("Ordinary Deposits Multiplier"; Rec."Ordinary Deposits Multiplier")
                {
                }
                field("Preferential Dep. Multiplier"; Rec."Preferential Dep. Multiplier")
                {
                }
                field("Repayment Frequency"; Rec."Repayment Frequency")
                {
                }
                field("Loan Span"; Rec."Loan Span")
                {
                }
                field("Nature of Loan Type"; Rec."Nature of Loan Type")
                {
                }
                field("Type of Discounting"; Rec."Type of Discounting")
                {
                }
                field("Discounting %"; Rec."Discounting %")
                {
                }
                field("Computation %"; Rec."Computation %")
                {
                }
                field("No. Of Months for Appr. Saving"; Rec."No. Of Months for Appr. Saving")
                {
                }
                field("No. of Salary Times"; Rec."No. of Salary Times")
                {
                }
                field("Salary Period"; Rec."Salary Period")
                {
                }
                field("Maximum Deposit Contribution"; Rec."Maximum Deposit Contribution")
                {
                }
                field("Minimum Deposit Tiered"; Rec."Minimum Deposit Tiered")
                {
                }
                field("Minimum Deposit Tiered Code"; Rec."Minimum Deposit Tiered Code")
                {
                }
                field("Minimum Dep. Contribution %"; Rec."Minimum Dep. Contribution %")
                {
                }
                field("Minimum Deposit Balance"; Rec."Minimum Deposit Balance")
                {
                }
                field("Source of Funds"; Rec."Source of Funds")
                {
                }
                field("Source Of Funds No."; Rec."Source Of Funds No.")
                {
                }
                field("Minimum Deposit Contribution"; Rec."Minimum Deposit Contribution")
                {
                }
                field("No Interest Bills"; Rec."No Interest Bills")
                {
                }
                field("No Principle Bills"; Rec."No Principle Bills")
                {
                }
                field("View Online"; Rec."View Online")
                {
                }
                field("Allow Multiple Running Loans"; Rec."Allow Multiple Running Loans")
                {
                }
                field("Requires Salary Processing"; Rec."Requires Salary Processing")
                {
                    Editable = false;
                }
                field("Mobile Loan"; Rec."Mobile Loan")
                {
                }
                field(AvailableOnMobile; Rec.AvailableOnMobile)
                {
                }
                field("Mortgage Loan"; Rec."Mortgage Loan")
                {
                }
                field("Shamba Loan"; Rec."Shamba Loan")
                {
                }
                field("Maximum Loan Amount(Mobile)"; Rec."Maximum Loan Amount(Mobile)")
                {
                }
            }
            group("Agency Banking")
            {
                Caption = 'Agency Banking';
                field("Allowed Transaction"; Rec."Allowed Transaction")
                {
                }
                field("Agency Charge Acc"; Rec."Agency Charge Acc")
                {
                }
            }
            group("Sky Mbanking")
            {
                Caption = 'Sky Mbanking';
                field("USSD Product Name"; Rec."USSD Product Name")
                {
                }
                field(Category; Rec.Category)
                {
                }
                group("Sky Savings")
                {
                    Caption = 'Sky Savings';
                    field("Mobile Transaction"; Rec."Mobile Transaction")
                    {
                    }
                    field("Savings Type"; Rec."Savings Type")
                    {
                    }
                    field("Bussiness Acc Prefix"; Rec."Bussiness Acc Prefix")
                    {
                    }
                    field("Business Acc Surfix"; Rec."Business Acc Surfix")
                    {
                    }
                    field("Minimum Amt B/s Accnt"; Rec."Minimum Amt B/s Accnt")
                    {
                    }
                }
                group("Dividend Advance Limit Period")
                {
                    Caption = 'Dividend Advance Limit Period';
                    field("DAdvance Limit Period"; Rec."DAdvance Limit Period")
                    {
                    }
                }
                group("Sky Credit")
                {
                    Caption = 'Sky Credit';
                    field("Restrict to Emp. Code"; Rec."Restrict to Emp. Code")
                    {
                    }
                    field("Interest Recovered Upfront"; Rec."Interest Recovered Upfront")
                    {
                    }
                    field("Auto Send SMS Alerts"; Rec."Auto Send SMS Alerts")
                    {
                    }
                    field("Available To Member"; Rec."Available To Member")
                    {
                    }
                    field("Salary Loans"; Rec."Salary Loans")
                    {
                    }
                    field("Mobile Loan Net %"; Rec."Mobile Loan Net %")
                    {
                    }
                    field("Min. Net after Topup"; Rec."Min. Net after Topup")
                    {
                        Caption = 'Min. Net after Topup';
                    }
                    field("Mobile Loan Req. Guar."; Rec."Mobile Loan Req. Guar.")
                    {
                    }
                    field("Mobile Installments Type"; Rec."Mobile Installments Type")
                    {
                    }
                    field("Min. Mobile Installments"; Rec."Min. Mobile Installments")
                    {
                    }
                    field("Max. Mobile Installments"; Rec."Max. Mobile Installments")
                    {
                    }
                    field("Minimum Guarantor Deposits"; Rec."Minimum Guarantor Deposits")
                    {
                    }
                    field("Shows Mobile Qualification"; Rec."Shows Mobile Qualification")
                    {
                    }
                    field("MLoan Appraisal Start Point"; Rec."MLoan Appraisal Start Point")
                    {
                    }
                    field("MLoan Appraisal Increment"; Rec."MLoan Appraisal Increment")
                    {
                    }
                    field("Sort Order"; Rec."Sort Order")
                    {
                    }
                    field("Requires Branch"; Rec."Requires Branch")
                    {
                    }
                    field("Requires Payslip PIN"; Rec."Requires Payslip PIN")
                    {
                    }
                    field("Requires TnC"; Rec."Requires TnC")
                    {
                    }
                    field("Requires Purpose"; Rec."Requires Purpose")
                    {
                    }
                    field("Loan Nos"; Rec."Loan Nos")
                    {
                    }
                    field(Control100000001; Rec."Min. Net after Topup")
                    {
                    }
                    field("Sky Income From Sacco Interest"; Rec."Sky Income From Sacco Interest")
                    {
                    }
                    field("Mobile Min. Loan Amount"; Rec."Mobile Min. Loan Amount")
                    {
                    }
                    field("Mobile Max. Loan Amount"; Rec."Mobile Max. Loan Amount")
                    {
                    }
                    field("Mobile Min. Guarantors"; Rec."Mobile Min. Guarantors")
                    {
                    }
                    field("Mobile Max. Guarantors"; Rec."Mobile Max. Guarantors")
                    {
                    }
                    field("Portal Viewable"; Rec."Portal Viewable")
                    {
                    }
                    field("Portal Order"; Rec."Portal Order")
                    {
                    }
                    field("Dividend Advance Year"; Rec."Dividend Advance Year")
                    {
                    }
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(Action79)
            {
                action("Product Charges")
                {
                    Image = SetupPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Loan Product Charges";
                    RunPageLink = "Product Code" = FIELD("Product ID");
                }
                action("Appraisal Parameters")
                {
                    Image = Evaluate;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "DCS Product Parameter Matrix";
                    RunPageLink = "Loan Product Code" = FIELD("Product ID");
                }
                action("Related Product")
                {
                    Image = Relatives;
                    Promoted = true;
                    RunObject = Page "Related Product List";
                    RunPageLink = "Product Code" = FIELD("Product ID");
                }
                action("Loans to Bridge")
                {
                    Image = DeleteExpiredComponents;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Loan Products To Bridge";
                    RunPageLink = "Product Code" = FIELD("Product ID");
                }
            }
        }
        area(navigation)
        {
            action("Product Application Document")
            {
                Image = Documents;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Product Document";
                RunPageLink = "Product ID" = FIELD("Product ID");
            }
            action("Mobile Loan Installments")
            {
                RunObject = Page "Mobile Loan Installments";
                RunPageLink = Product = FIELD("Product ID");
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        DocumentControl;
    end;

    var
        FinancialsVisible: Boolean;
        SavingsProductVisible: Boolean;
        CreditProductVisible: Boolean;
        DocumentEdit: Boolean;
        InterestEdit: Boolean;

    //[Scope('Internal')]
    procedure DocumentControl()
    begin
        FinancialsVisible := true;

        if Rec."Product Class Type" = Rec."Product Class Type"::" " then begin
            FinancialsVisible := false;
            SavingsProductVisible := false;
            CreditProductVisible := false;
            InterestEdit := false;
        end;

        if Rec."Product Class Type" = Rec."Product Class Type"::Loan then begin
            InterestEdit := true;
            CreditProductVisible := true;
        end else begin
            InterestEdit := false;
            CreditProductVisible := false;
        end;

        if Rec."Product Class Type" = Rec."Product Class Type"::Savings then begin
            InterestEdit := false;
            SavingsProductVisible := true;
        end else begin
            InterestEdit := true;
            SavingsProductVisible := false;
        end;
    end;
}

