#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185706 "Withdrawal Notices"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Withdrawal Notices.rdlc';

    dataset
    {
        dataitem("Member withdrawal Notice"; "Member withdrawal Notice")
        {
            DataItemTableView = where(Status = const(Approved));
            column(ReportForNavId_1; 1)
            {
            }
            column(No; "Member withdrawal Notice"."No.")
            {
            }
            column(MemberNo; "Member withdrawal Notice"."Member No.")
            {
            }
            column(Reasonforwithdrawal; "Member withdrawal Notice"."Reason for withdrawal")
            {
            }
            column(WithdrawaNoticelDate; "Member withdrawal Notice"."Withdrawal Notice Date")
            {
            }
            column(MaturityDate; "Member withdrawal Notice"."Maturity Date")
            {
            }
            column(EnteredBy; "Member withdrawal Notice"."Entered By")
            {
            }
            column(DateEntered; "Member withdrawal Notice"."Date Entered")
            {
            }
            column(TimeEntered; "Member withdrawal Notice"."Time Entered")
            {
            }
            column(Status; "Member withdrawal Notice".Status)
            {
            }
            column(NoSeries; "Member withdrawal Notice"."No. Series")
            {
            }
            column(Name; "Member withdrawal Notice".Name)
            {
            }
            column(GlobalDimension1Code; "Member withdrawal Notice"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Member withdrawal Notice"."Global Dimension 2 Code")
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
            column(Paid; Paid)
            {
            }
            column(DatePaid; Datepaid)
            {
            }
            column(DepositRefunded; Refund)
            {
            }
            column(CI_Name; CI.Name)
            {
                IncludeCaption = true;
            }
            column(CI_Address; CI.Address)
            {
                IncludeCaption = true;
            }
            column(CI_Address2; CI."Address 2")
            {
                IncludeCaption = true;
            }
            column(CI_PhoneNo; CI."Phone No.")
            {
                IncludeCaption = true;
            }
            column(CI_Picture; CI.Picture)
            {
                IncludeCaption = true;
            }
            column(CI_City; CI.City)
            {
                IncludeCaption = true;
            }
            column(USERID; UserId)
            {
            }
            column(TODAY; Today)
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*IF Membershipclosure.GET(Membershipclosure."Notice Number") THEN*/
                Paid := false;
                Datepaid := 0D;
                Refund := 0;
                Membershipclosure.Reset;
                Membershipclosure.SetRange(Membershipclosure."Notice Number", "Member withdrawal Notice"."No.");
                if Membershipclosure.Find('-') then begin
                    repeat
                        Paid := Membershipclosure.Posted;
                        Datepaid := Membershipclosure."Closing Date";
                        Refund := Membershipclosure."Deposit Refundable";
                    until Membershipclosure.Next = 0;
                end;

            end;

            trigger OnPreDataItem()
            begin
                /*IF Membershipclosure.GET(Membershipclosure."Notice Number") THEN
                Paid:=Membershipclosure.Posted;
                Datepaid:=Membershipclosure."Closing Date";
                Refund:=Membershipclosure."Deposit Refundable";
                */

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
        if CI.Get() then
            CI.CalcFields(CI.Picture);
    end;

    var
        Membershipclosure: Record "Membership closure";
        Paid: Boolean;
        Datepaid: Date;
        Refund: Decimal;
        Matured: Boolean;
        CompanyInfo: Record "Company Information";
        CI: Record "Company Information";
}
