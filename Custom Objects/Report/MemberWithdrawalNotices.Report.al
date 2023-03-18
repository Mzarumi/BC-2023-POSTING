#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185773 "Member Withdrawal Notices"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Member Withdrawal Notices.rdlc';

    dataset
    {
        dataitem("Member withdrawal Notice"; "Member withdrawal Notice")
        {
            RequestFilterFields = "Member No.", "Maturity Date", "Notice Type", "Entered By";
            column(ReportForNavId_1; 1)
            {
            }
            column(No; "Member withdrawal Notice"."No.")
            {
            }
            column(MemberNo; "Member withdrawal Notice"."Member No.")
            {
            }
            column(Name; "Member withdrawal Notice".Name)
            {
            }
            column(WithdrawaNoticelDate; "Member withdrawal Notice"."Withdrawal Notice Date")
            {
            }
            column(MaturityDate; "Member withdrawal Notice"."Maturity Date")
            {
            }
            column(Status; "Member withdrawal Notice".Status)
            {
            }
            column(LoansOutstandingBalance; "Member withdrawal Notice"."Loans Outstanding Balance")
            {
            }
            column(LoansOutstandingInterest; "Member withdrawal Notice"."Loans Outstanding Interest")
            {
            }
            column(MemberDeposit; "Member withdrawal Notice"."Member Deposit")
            {
            }
            column(NoticeType; "Member withdrawal Notice"."Notice Type")
            {
            }
            column(DateClosed; DatePaid)
            {
            }
            column(Refund; AmntRefunded)
            {
            }
            column(PaymentStatus; PaymentStatus)
            {
            }

            trigger OnAfterGetRecord()
            begin
                DatePaid := 0D;
                AmntRefunded := 0;
                PaymentStatus := '';
                Mclosure.Reset;
                Mclosure.SetRange("Member No.", "Member withdrawal Notice"."Member No.");
                Mclosure.SetRange(Posted, true);
                Mclosure.SetRange(Status, Mclosure.Status::Approved);
                if Mclosure.Find('+') then begin
                    repeat
                        AmntRefunded := Mclosure."Deposit Refundable";
                        PaymentStatus := 'Paid'
                    until Mclosure.Next = 0;
                end else
                    PaymentStatus := 'Pending';


                Mclosure.Reset;
                Mclosure.SetRange("Member No.", "Member withdrawal Notice"."Member No.");
                Mclosure.SetRange(Posted, true);
                Mclosure.SetRange(Status, Mclosure.Status::Approved);
                if Mclosure.Find('+') then begin
                    repeat
                        AmntRefunded := Mclosure."Deposit Refundable";
                        DatePaid := Mclosure."Closing Date";
                    until Mclosure.Next = 0;
                end;
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
        Mclosure: Record 52185824;
        DatePaid: Date;
        AmntRefunded: Decimal;
        PaymentStatus: Text;
}
