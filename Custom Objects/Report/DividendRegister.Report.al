#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185628 "Dividend Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Dividend Register.rdlc';

    dataset
    {
        dataitem(Members; Members)
        {
            RequestFilterFields = "No.", Status, "Employer Code";
            column(ReportForNavId_11; 11)
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
            column(Name_Members; Members.Name)
            {
            }
            column(Shares_DividendProgression; Amount[1])
            {
            }
            column(QualifyingShares_DividendProgression; Amount[2])
            {
            }
            column(GrossDividends_DividendProgression; Amount[3])
            {
            }
            column(WitholdingTax_DividendProgression; Amount[4])
            {
            }
            column(NetDividends_DividendProgression; Amount[5])
            {
            }
            column(Sno; Sno)
            {
            }
            column(Status_Members; Members.Status)
            {
            }
            column(LoanCat; LoanCat)
            {
            }
            column(EmployerCode_Members; Members."Employer Code")
            {
            }
            column(PayrollStaffNo_Members; Members."Payroll/Staff No.")
            {
            }
            column(SavingsStatus; SavingsStatus)
            {
            }
            column(ShareCapital; Shares)
            {
            }
            column(DepositContributions; Deposits)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Shares := 0;
                Deposits := 0;
                DividendProgression.Reset;
                DividendProgression.SetRange(DividendProgression."Member No", Members."No.");
                DividendProgression.SetRange(Year, DividendsYear);
                if DividendProgression.Find('-') then begin
                    DividendProgression.CalcSums(DividendProgression.Shares, DividendProgression."Qualifying Shares", DividendProgression."Gross Dividends",
                                                 DividendProgression."Witholding Tax", DividendProgression."Net Dividends");

                    Amount[1] := DividendProgression.Shares;
                    Amount[2] := DividendProgression."Qualifying Shares";
                    Amount[3] := DividendProgression."Gross Dividends";
                    Amount[4] := DividendProgression."Witholding Tax";
                    Amount[5] := DividendProgression."Net Dividends";


                end else
                    CurrReport.Skip;


                DividendProgression.Reset;
                DividendProgression.SetRange(DividendProgression."Member No", Members."No.");
                DividendProgression.SetRange(Year, DividendsYear);
                DividendProgression.SetRange("Product Type", '03');
                if DividendProgression.Find('-') then begin
                    DividendProgression.CalcSums(DividendProgression.Shares, DividendProgression."Qualifying Shares", DividendProgression."Gross Dividends",
                                                 DividendProgression."Witholding Tax", DividendProgression."Net Dividends");
                    Shares := DividendProgression.Shares;
                end;

                DividendProgression.Reset;
                DividendProgression.SetRange(DividendProgression."Member No", Members."No.");
                DividendProgression.SetRange(Year, DividendsYear);
                DividendProgression.SetRange("Product Type", '02');
                if DividendProgression.Find('-') then begin
                    DividendProgression.CalcSums(DividendProgression.Shares, DividendProgression."Qualifying Shares", DividendProgression."Gross Dividends",
                                                 DividendProgression."Witholding Tax", DividendProgression."Net Dividends");
                    Deposits := DividendProgression.Shares;
                end;


                Sno += 1;
                Loans.Reset;
                Loans.SetRange("Member No.", Members."No.");
                Loans.SetFilter("Outstanding Balance", '>%1', 0);
                Loans.SetCurrentkey("Loans Category-SASRA");
                if Loans.FindLast then begin
                    LoanCat := Loans."Loans Category-SASRA";
                end;
                SavingsStatus := Savingsstatus::" ";
                SavingsAccounts.Reset;
                SavingsAccounts.SetRange("Member No.", Members."No.");
                SavingsAccounts.SetRange("Loan Disbursement Account", true);
                if SavingsAccounts.Find('-') then begin
                    SavingsStatus := SavingsAccounts.Status;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DividendsYear = 0 then Error('Kindly specify dividends year');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Dividends Year"; DividendsYear)
                {
                    ApplicationArea = Basic;
                    BlankZero = true;
                }
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
        CompanyAddress: Text;
        CompanyTelephone: Text;
        CommunicationOnline: Text;
        CompanyInformation: Record "Company Information";
        DividendProgression: Record 52185713;
        DividendSavings: Decimal;
        QualifyingSavings: Decimal;
        GrossDividend: Decimal;
        WTax: Decimal;
        NetDividend: Decimal;
        Amount: array[10] of Decimal;
        ProductFactory: Record 52185690;
        IntOnDep: Decimal;
        ShareCapInt: Decimal;
        DividendsYear: Integer;
        Sno: Integer;
        Loans: Record 52185729;
        LoanCat: Option Perfoming,Watch,Substandard,Doubtful,Loss;
        SavingsAccounts: Record 52185730;
        SavingsStatus: Option " ",New,Active,Dormant,Frozen,"Withdrawal Application",Withdrawn,Deceased,Defaulter,Closed;
        Shares: Decimal;
        Deposits: Decimal;
}
