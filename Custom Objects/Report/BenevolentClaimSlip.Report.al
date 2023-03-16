#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185998 "Benevolent Claim Slip"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Benevolent Claim Slip.rdlc';

    dataset
    {
        dataitem("SinkFund Report Information"; "SinkFund Report Information")
        {
            DataItemTableView = sorting(No);
            RequestFilterFields = No;
            column(ReportForNavId_1; 1)
            {
            }
            column(MemberName; "SinkFund Report Information"."Member Name")
            {
            }
            column(MemberNo; "SinkFund Report Information"."Member No")
            {
            }
            column(ReportedByName; "SinkFund Report Information"."Reported By Name")
            {
            }
            column(ReportedByID; "SinkFund Report Information"."Reported By ID No")
            {
            }
            column(ReportedByRel; "SinkFund Report Information"."Reported By Relationship")
            {
            }
            column(DeathDate; "SinkFund Report Information"."Date of Death")
            {
            }
            column(ClaimOption; "SinkFund Report Information"."Claim Option")
            {
            }
            column(DecPerson; "SinkFund Report Information"."Deceased Person")
            {
            }
            column(Status; "SinkFund Report Information".Status)
            {
            }
            column(TLoan; "SinkFund Report Information"."Total Outstanding Loan")
            {
            }
            column(TInterest; "SinkFund Report Information"."Total Outstanding Interest")
            {
            }
            column(TNetAount; "SinkFund Report Information"."Total Net Amount")
            {
            }
            column(InsuStatus; "SinkFund Report Information"."Insurance Payment Status")
            {
            }
            column(CompanyInfo__Address_2_; Company."Address 2")
            {
            }
            column(CompanyInfo_Address; Company.Address)
            {
            }
            column(Company_Name; Company.Name)
            {
            }
            column(Company_Picture; Company.Picture)
            {
            }
            column(ClaimAmount; "SinkFund Report Information"."Benevolent Claim Amount")
            {
            }
            column(ClaimDate; "SinkFund Report Information".Date)
            {
            }
            column(SavBal; "SinkFund Report Information"."Savings Balance")
            {
            }
            column(UserName; UserName)
            {
            }

            trigger OnAfterGetRecord()
            begin
                UserSetup.Reset;
                UserSetup.SetRange("User ID", "SinkFund Report Information"."Posted By");
                if UserSetup.Find('-') then begin
                    UserName := UserSetup."Full Name";
                end;
            end;

            trigger OnPreDataItem()
            begin
                if Company.Get() then
                    Company.CalcFields(Company.Picture);
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
        Company: Record "Company Information";
        UserSetup: Record "User Setup";
        UserName: Text;
}
