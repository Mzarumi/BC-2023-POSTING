#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185933 "Member Withdrawal Notice"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Member Withdrawal Notice.rdlc';

    dataset
    {
        dataitem("Member withdrawal Notice"; "Member withdrawal Notice")
        {
            RequestFilterFields = "Member No.", Status, "Notice Type";
            column(ReportForNavId_1; 1)
            {
            }
            column(Notice_No; "Member withdrawal Notice"."No.")
            {
            }
            column(Mem_No; "Member withdrawal Notice"."Member No.")
            {
            }
            column(NoticeDate; "Member withdrawal Notice"."Withdrawal Notice Date")
            {
            }
            column(MaturityDate; "Member withdrawal Notice"."Maturity Date")
            {
            }
            column(NoticeType; "Member withdrawal Notice"."Notice Type")
            {
            }
            column(LoanBalance; "Member withdrawal Notice"."Loans Outstanding Balance")
            {
            }
            column(Out_Interest; "Member withdrawal Notice"."Loans Outstanding Interest")
            {
            }
            column(Mem_Deposits; "Member withdrawal Notice"."Member Deposit")
            {
            }
            column(CompName; Company.Name)
            {
            }
            column(CompPic; Company.Picture)
            {
            }
            column(MemName; MemName)
            {
            }
            column(SNo; StaffNo)
            {
            }
            column(Paid; paid)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Members.Reset;
                Members.SetRange("No.", "Member withdrawal Notice"."Member No.");
                if Members.FindFirst then
                    MemName := Members.Name;
                StaffNo := Members."Payroll/Staff No.";

                //check if posted on member closure
                MemClosure.Reset;
                MemClosure.SetRange("Notice Number", "Member withdrawal Notice"."No.");
                if MemClosure.FindFirst then
                    if MemClosure.Posted = true then
                        paid := 'Paid'
                    else
                        if MemClosure.Posted = false then
                            paid := 'Pending';

                if not MemClosure.FindFirst then
                    paid := 'Pending';
            end;

            trigger OnPreDataItem()
            begin
                Company.Get;
                Company.CalcFields(Picture);
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
        MemName: Text;
        Members: Record "Members";
        Company: Record "Company Information";
        StaffNo: Code[50];
        MemClosure: Record 52185824;
        paid: Text;
}
