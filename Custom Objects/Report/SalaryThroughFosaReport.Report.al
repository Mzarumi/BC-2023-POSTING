#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185865 "Salary Through Fosa Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Salary Through Fosa Report.rdlc';

    dataset
    {
        dataitem("Savings Accounts"; "Savings Accounts")
        {
            DataItemTableView = where("Product Type" = filter(505));
            RequestFilterFields = "No.", "Member No.", "Salary Through FOSA";
            column(ReportForNavId_1; 1)
            {
            }
            column(EmployerCode_SavingsAccounts; "Savings Accounts"."Employer Code")
            {
            }
            column(PayrollStaffNo; "Savings Accounts"."Payroll/Staff No.")
            {
            }
            column(MobilePhoneNo; "Savings Accounts"."Mobile Phone No")
            {
            }
            column(TransactionalMobileNo; "Savings Accounts"."Transactional Mobile No")
            {
            }
            column(No; "Savings Accounts"."No.")
            {
            }
            column(MemberNo; "Savings Accounts"."Member No.")
            {
            }
            column(Name; "Savings Accounts".Name)
            {
            }
            column(PhoneNo; "Savings Accounts"."Phone No.")
            {
            }
            column(BalanceLCY; "Savings Accounts"."Balance (LCY)")
            {
            }
            column(CompanyInformationName; CompanyInformation.Name)
            {
            }
            column(CompanyInformationPicture; CompanyInformation.Picture)
            {
            }
            column(Status_SavingsAccounts; "Savings Accounts".Status)
            {
            }
            column(Counts; Counts)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Counts := 0;
                Counts := "Savings Accounts".Count;
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
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        Counts: Integer;
}
