#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185936 "Online Loan Application Form"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Online Loan Application Form.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Online Loans Applications";"Online Loans Applications")
        {
            column(ReportForNavId_1; 1)
            {
            }
            // column(CompName;company.Name)
            // {
            // }
            // column(CompPic;company.Picture)
            // {
            // }
            column(ApplicationNo_OnlineLoansApplications;"Online Loans Applications"."Application No")
            {
            }
            column(ApplicationDate_OnlineLoansApplications;"Online Loans Applications"."Application Date")
            {
            }
            column(MembershipNo_OnlineLoansApplications;"Online Loans Applications"."Membership No")
            {
            }
            column(MemberNames_OnlineLoansApplications;"Online Loans Applications"."Member Names")
            {
            }
            column(EmploymentNo_OnlineLoansApplications;"Online Loans Applications"."Employment No")
            {
            }
            column(Telephone_OnlineLoansApplications;"Online Loans Applications".Telephone)
            {
            }
            column(Email_OnlineLoansApplications;"Online Loans Applications".Email)
            {
            }
            column(LoanTypeDescription_OnlineLoansApplications;"Online Loans Applications"."Loan Type Description")
            {
            }
            column(LoanType_OnlineLoansApplications;"Online Loans Applications"."Loan Type")
            {
            }
            column(LoanAmount_OnlineLoansApplications;"Online Loans Applications"."Loan Amount")
            {
            }
            column(RepaymentPeriod_OnlineLoansApplications;"Online Loans Applications"."Repayment Period")
            {
            }
            column(Approved_OnlineLoansApplications;"Online Loans Applications".Approved)
            {
            }
            column(BasicPay_OnlineLoansApplications;"Online Loans Applications"."Basic Pay")
            {
            }
            column(TotalAllowances_OnlineLoansApplications;"Online Loans Applications"."Total Allowances")
            {
            }
            column(TotalDeduction_OnlineLoansApplications;"Online Loans Applications".TotalDeduction)
            {
            }
            column(InterestRate_OnlineLoansApplications;"Online Loans Applications"."Interest Rate")
            {
            }
            column(GuarantorsApproved_OnlineLoansApplications;"Online Loans Applications"."Guarantors Approved")
            {
            }
            column(topup_OnlineLoansApplications;"Online Loans Applications".topup)
            {
            }
            column(topupref_OnlineLoansApplications;"Online Loans Applications".topupref)
            {
            }
            column(submitted_OnlineLoansApplications;"Online Loans Applications".submitted)
            {
            }
            column(IdNo_OnlineLoansApplications;"Online Loans Applications"."Id No")
            {
            }
            column(LoanNo_OnlineLoansApplications;"Online Loans Applications"."Loan No")
            {
            }
            column(Rejected_OnlineLoansApplications;"Online Loans Applications".Rejected)
            {
            }
            dataitem("Online Loan Guarantors";"Online Loan Guarantors")
            {
                DataItemLink = "Loan Application No"=field("Application No");
                column(ReportForNavId_23; 23)
                {
                }
                column(EntryNo_OnlineLoanGuarantors;"Online Loan Guarantors"."Entry No")
                {
                }
                column(LoanApplicationNo_OnlineLoanGuarantors;"Online Loan Guarantors"."Loan Application No")
                {
                }
                column(GuarantorNo_OnlineLoanGuarantors;"Online Loan Guarantors"."Guarantor No.")
                {
                }
                column(GuarantorNames_OnlineLoanGuarantors;"Online Loan Guarantors"."Guarantor Names")
                {
                }
                column(GuarantorEmail_OnlineLoanGuarantors;"Online Loan Guarantors"."Guarantor Email")
                {
                }
                column(GuarantorIDNo_OnlineLoanGuarantors;"Online Loan Guarantors"."Guarantor ID No")
                {
                }
                column(GuarantorAmount_OnlineLoanGuarantors;"Online Loan Guarantors"."Guarantor Amount")
                {
                }
                column(GuarantorPhone_OnlineLoanGuarantors;"Online Loan Guarantors"."Guarantor Phone")
                {
                }
                column(Approved_OnlineLoanGuarantors;"Online Loan Guarantors".Approved)
                {
                }
                column(ApprovalStatus_OnlineLoanGuarantors;"Online Loan Guarantors"."Approval Status")
                {
                }
                column(GuarantorStatus;GuarantorStatus)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    GuarantorStatus:='Pending';

                    if "Online Loan Guarantors"."Approval Status" then begin
                      if "Online Loan Guarantors".Approved then GuarantorStatus:='Approved' else GuarantorStatus:='Rejected';
                    end;
                end;
            }

            trigger OnPreDataItem()
            begin
                company.Get;
                company.CalcFields(Picture);
            end;
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
        company: Record "Company Information";
        GuarantorStatus: Text;
}
