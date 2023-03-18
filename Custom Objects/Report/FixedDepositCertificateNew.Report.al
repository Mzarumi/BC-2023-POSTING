#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185643 "Fixed Deposit Certificate New"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fixed Deposit Certificate New.rdlc';

    dataset
    {
        dataitem("Savings Accounts"; "Savings Accounts")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(CompanyInformation_Picture; CompanyInformation.Picture)
            {
            }
            column(CompanyAddress; CompanyAddress)
            {
            }
            column(CompanyTelephone; CompanyTelephone)
            {
            }
            column(CommunicationOnline; CommunicationOnline)
            {
            }
            column(SNo; "SNo.")
            {
            }
            column(CurrDate; Format(Today, 0, 4))
            {
            }
            column(FixedDepositStatus_SavingsAccounts; "Savings Accounts"."Fixed Deposit Status")
            {
            }
            column(PhoneNo_SavingsAccounts; "Savings Accounts"."Phone No.")
            {
            }
            column(Balance_SavingsAccounts; "Savings Accounts".Balance)
            {
            }
            column(No_SavingsAccounts; "Savings Accounts"."No.")
            {
            }
            column(FixedDepositAmount_SavingsAccounts; "Savings Accounts"."Fixed Deposit Amount")
            {
            }
            column(BalanceLCY_SavingsAccounts; "Savings Accounts"."Balance (LCY)")
            {
            }
            column(Status_SavingsAccounts; "Savings Accounts".Status)
            {
            }
            column(EmployerCode_SavingsAccounts; "Savings Accounts"."Employer Code")
            {
            }
            column(RegistrationDate_SavingsAccounts; "Savings Accounts"."Registration Date")
            {
            }
            column(DateofBirth_SavingsAccounts; "Savings Accounts"."Date of Birth")
            {
            }
            column(PayrollStaffNo_SavingsAccounts; "Savings Accounts"."Payroll/Staff No.")
            {
            }
            column(IDNo_SavingsAccounts; "Savings Accounts"."ID No.")
            {
            }
            column(MobilePhoneNo_SavingsAccounts; "Savings Accounts"."Mobile Phone No")
            {
            }
            column(Gender_SavingsAccounts; "Savings Accounts".Gender)
            {
            }
            column(AccountCategory_SavingsAccounts; "Savings Accounts"."Account Category")
            {
            }
            column(ProductType_SavingsAccounts; "Savings Accounts"."Product Type")
            {
            }
            column(MemberNo_SavingsAccounts; "Savings Accounts"."Member No.")
            {
            }
            column(ProductName_SavingsAccounts; "Savings Accounts"."Product Name")
            {
            }
            column(FixedDepositType_SavingsAccounts; "Savings Accounts"."Fixed Deposit Type")
            {
            }
            column(FDMaturityDate_SavingsAccounts; "Savings Accounts"."FD Maturity Date")
            {
            }
            column(NegInterestRate_SavingsAccounts; "Savings Accounts"."Neg. Interest Rate")
            {
            }
            column(FDDuration_SavingsAccounts; "Savings Accounts"."FD Duration")
            {
            }
            column(FDMaturityInstructions_SavingsAccounts; "Savings Accounts"."FD Maturity Instructions")
            {
            }
            column(FixedDepositcertno_SavingsAccounts; "Savings Accounts"."Fixed Deposit cert. no")
            {
            }
            column(SavingsAccountNo_SavingsAccounts; "Savings Accounts"."Savings Account No.")
            {
            }
            column(FDDateRenewed_SavingsAccounts; "Savings Accounts"."FD Date Renewed")
            {
            }
            column(Name_SavingsAccounts; "Savings Accounts".Name)
            {
            }
            column(GlobalDimension1Code_SavingsAccounts; "Savings Accounts"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_SavingsAccounts; "Savings Accounts"."Global Dimension 2 Code")
            {
            }

            trigger OnAfterGetRecord()
            begin
                "SNo." += 1;
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
        if CompanyInformation.Get then
            CompanyInformation.CalcFields(CompanyInformation.Picture);
        CompanyAddress := CompanyInformation.Address + ' -Post Code: ' + CompanyInformation."Post Code" + ' -City:' + CompanyInformation.City + ' Region: ' + CompanyInformation."Country/Region Code";
        CompanyTelephone := 'Tel: ' + CompanyInformation."Phone No." + ' -Office Tel: ' + CompanyInformation."Phone No. 2";
        CommunicationOnline := 'E-mail: ' + CompanyInformation."E-Mail" + '- Website: ' + CompanyInformation."Home Page";
    end;

    var
        CompanyInformation: Record "Company Information";
        CompanyAddress: Text;
        CompanyTelephone: Text;
        CommunicationOnline: Text;
        "SNo.": Integer;
}
