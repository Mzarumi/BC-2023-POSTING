#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185984 "Membership Closure Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Membership Closure Report.rdlc';

    dataset
    {
        dataitem("Membership closure";"Membership closure")
        {
            RequestFilterFields = "Member No.",Status,"Maturity Date","Closure Type";
            column(ReportForNavId_1; 1)
            {
            }
            column(CName;Company.Name)
            {
            }
            column(CAddress;Company.Address)
            {
            }
            column(CPicture;Company.Picture)
            {
            }
            column(No;"Membership closure"."No.")
            {
            }
            column(MemberNo;"Membership closure"."Member No.")
            {
            }
            column(MemberName;"Membership closure"."Member Name")
            {
            }
            column(ClosingDate;"Membership closure"."Closing Date")
            {
            }
            column(TotalLoan;"Membership closure"."Total Loan")
            {
            }
            column(TotalInterest;"Membership closure"."Total Interest")
            {
            }
            column(MemberSavings;"Membership closure"."Member Savings")
            {
            }
            column(ClosureType;"Membership closure"."Closure Type")
            {
            }
            column(RefundableDeposit;"Membership closure"."Deposit Refundable")
            {
            }
            column(NoticeDate;NoticeDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                NoticeDate:=0D;
                Notice.Reset;
                Notice.SetRange("No.","Membership closure"."Notice Number");
                if Notice.Find('-') then
                  NoticeDate:=Notice."Withdrawal Notice Date";
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

    trigger OnPreReport()
    begin
        Company.Get;
        Company.CalcFields(Company.Picture);
    end;

    var
        Company: Record "Company Information";
        Notice: Record 52185826;
        NoticeDate: Date;
}
