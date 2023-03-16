#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185912 "Member Portfolio"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Member Portfolio.rdlc';

    dataset
    {
        dataitem(Members; Members)
        {
            RequestFilterFields = "No.", "Member Category", "Single Party/Multiple", Status, "Employer Code", "Registration Date", "Group Account", "Global Dimension 1 Code", "Global Dimension 2 Code", Nationality;
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
            column(No_Members; Members."No.")
            {
            }
            column(AccountType_Members; Members."Single Party/Multiple")
            {
            }
            column(Name_Members; Members.Name)
            {
            }
            column(GlobalDimension1Code_Members; Members."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Members; Members."Global Dimension 2 Code")
            {
            }
            column(RegistrationDate_Members; Members."Registration Date")
            {
            }
            column(EmployerCode_Members; Members."Employer Code")
            {
            }
            column(Nationality_Members; Members.Nationality)
            {
            }
            column(PayrollStaffNo_Members; Members."Payroll/Staff No.")
            {
            }
            column(PhoneNo_Members; Members."Phone No.")
            {
            }
            column(IDNumber_Members; Members."ID No.")
            {
            }
            column(BirthCertificateNo_Members; Members."Birth Certificate No.")
            {
            }
            column(GroupAccountNo_Members; Members."Group Account No.")
            {
            }
            column(SalespersonCode_Members; Members."Recruited By")
            {
            }
            column(MemberSegment_Members; Members."Member Segment")
            {
            }
            column(CreatedBy_Members; Members."Created By")
            {
            }
            column(Source_Members; Members.Source)
            {
            }
            column(Status_Members; Members.Status)
            {
            }
            column(SCount; SNo)
            {
            }
            column(MemberCategory_Members; Members."Member Category")
            {
            }
            column(AplhaDeposit; AplhaDeposit)
            {
            }
            column(SharesCapital; SharesCapital)
            {
            }
            column(RegFees; RegFees)
            {
            }
            column(BranchCode_Members; Members."Branch Code")
            {
            }
            column(CreatedBy; CreatedBy)
            {
            }
            column(FOSA; Fosa)
            {
            }
            column(Invest; Invest)
            {
            }
            column(Premier; Premier)
            {
            }
            column(Employer_Name; Members."Employer Name")
            {
            }

            trigger OnAfterGetRecord()
            begin
                SNo += 1;
                SharesCapital := 0;
                AplhaDeposit := 0;
                RegFees := 0;
                Invest := 0;
                Premier := 0;
                Fosa := 0;
                Fixed := 0;
                CreatedBy := '';
                User.Reset;
                User.SetRange("User Name", Members."Created By");
                if User.Find('-') then begin
                    CreatedBy := User."Full Name";
                end;

                SavingAcc.Reset;
                SavingAcc.SetRange("Member No.", "No.");
                SavingAcc.SetRange("Product Category", SavingAcc."product category"::"Deposit Contribution");
                if SavingAcc.Find('-') then begin
                    SavingAcc.CalcFields(Balance);
                    AplhaDeposit := SavingAcc.Balance;
                end;

                SavingAcc.Reset;
                SavingAcc.SetRange("Member No.", "No.");
                SavingAcc.SetRange("Product Category", SavingAcc."product category"::"Share Capital");
                if SavingAcc.Find('-') then begin
                    SavingAcc.CalcFields(Balance);
                    SharesCapital := SavingAcc.Balance;
                end;

                SavingAcc.Reset;
                SavingAcc.SetRange("Member No.", "No.");
                SavingAcc.SetRange("Product Category", SavingAcc."product category"::"Registration Fee");
                if SavingAcc.Find('-') then begin
                    SavingAcc.CalcFields(Balance);
                    RegFees := SavingAcc.Balance;
                end;

                SavingAcc.Reset;
                SavingAcc.SetRange("Member No.", "No.");
                SavingAcc.SetRange("Product Category", SavingAcc."product category"::"Premier Club Account");
                if SavingAcc.Find('-') then begin
                    SavingAcc.CalcFields(Balance);
                    Premier := SavingAcc.Balance;
                end;

                SavingAcc.Reset;
                SavingAcc.SetRange("Member No.", "No.");
                SavingAcc.SetRange("Product Type", '505');
                if SavingAcc.Find('-') then begin
                    SavingAcc.CalcFields(Balance);
                    Fosa := SavingAcc.Balance;
                end;

                SavingAcc.Reset;
                SavingAcc.SetRange("Member No.", "No.");
                SavingAcc.SetRange("Product Category", SavingAcc."product category"::"Investment Account");
                if SavingAcc.Find('-') then begin
                    SavingAcc.CalcFields(Balance);
                    Invest := SavingAcc.Balance;
                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
            }
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
        SNo: Integer;
        SavingAcc: Record 52185730;
        CreditAcc: Record 52185731;
        LoanAcc: Record 52185729;
        AplhaDeposit: Decimal;
        SharesCapital: Decimal;
        RegFees: Decimal;
        CreditLoans: Decimal;
        BankingLoans: Decimal;
        ShortTLoans: Decimal;
        LongTLoans: Decimal;
        TotalLoans: Decimal;
        CreatedBy: Text;
        User: Record User;
        NextofKIN: Record 52185701;
        ImageData: Record 52185702;
        HASNextKin: Boolean;
        HASImage: Boolean;
        ShowNextofKin: Boolean;
        ShowImage: Boolean;
        Fosa: Decimal;
        Invest: Decimal;
        Premier: Decimal;
        "Fixed": Decimal;
}
