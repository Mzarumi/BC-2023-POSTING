#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185513 "Loans Attached"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Loans Attached.rdlc';

    dataset
    {
        dataitem(Loans; Loans)
        {
            // DataItemTableView = where("Loan Recovery No." = filter(<> ""));
            RequestFilterFields = "Disbursement Date";
            column(ReportForNavId_1; 1)
            {
            }
            column(LoanNo_Loans; Loans."Loan No.")
            {
            }
            column(MemberNo; Loans."Member No.")
            {
            }
            column(MemberName; Loans."Member Name")
            {
            }
            column(LoanType; Loans."Loan Product Type")
            {
            }
            column(LoanCategory; Loans."Loans Category-SASRA")
            {
            }
            column(Disbursement; Loans."Disbursement Date")
            {
            }
            column(AmountAttached; Loans."Approved Amount")
            {
            }
            column(Repayment; Loans.Repayment)
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
            column(LoaneeNo; LoaneeNo)
            {
            }
            column(DepositsAttached; DepositsAttached)
            {
            }
            column(LoanAttached; LoanAttached)
            {
            }
            column(AttachedBy; AttachedBy)
            {
            }
            column(DefaultedLoan; DefaultedLoan)
            {
            }
            column(PFNo; PFNo)
            {
            }
            column(MemberNamedf; MemberName)
            {
            }
            column(LoanTypeDF; LoanType)
            {
            }
            column(Employer; Employer)
            {
            }
            column(OriginalLoanAmount; OriginalLoanAmount)
            {
            }
            column(PrintedBy; PrintedBy)
            {
            }
            column(PrintedAt; PrintedAt)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if LoanRecoveryHeader.Get(Loans."Loan Recovery No.") then
                    if LoanRecoveryHeader."Recovery Type" = LoanRecoveryHeader."recovery type"::Detachement then CurrReport.Skip;
                "SNo." += 1;
                LoanRecoveryHeader.Reset;
                LoanRecoveryHeader.SetRange("No.", Loans."Loan Recovery No.");
                if LoanRecoveryHeader.Find('-') then begin
                    repeat
                        LoaneeNo := LoanRecoveryHeader."Member No.";
                        DepositsAttached := LoanRecoveryHeader."Member Deposits";
                        LoanAttached := (LoanRecoveryHeader."Outsatnding Interest" + LoanRecoveryHeader."Outstanding Balance");
                        AttachedBy := CopyStr(LoanRecoveryHeader."Entered By", StrPos(LoanRecoveryHeader."Entered By", '\') + 1, StrLen(LoanRecoveryHeader."Entered By"));
                        DefaultedLoan := LoanRecoveryHeader."Loan No.";

                    until LoanRecoveryHeader.Next = 0;
                end;

                LoanRecoveryHeader.Reset;
                LoanRecoveryHeader.SetRange("No.", Loans."Loan Recovery No.");
                if LoanRecoveryHeader.Find('-') then begin
                    LoansApp.Reset;
                    LoansApp.SetRange("Loan No.", LoanRecoveryHeader."Loan No.");
                    if LoansApp.Find('-') then begin
                        PFNo := LoansApp."Staff No";
                        Employer := LoansApp."Employer Code";
                    end;
                    LGuarantors.Reset;
                    LGuarantors.SetRange(LGuarantors."Loan No", LoanRecoveryHeader."Loan No.");
                    LGuarantors.SetRange(LGuarantors.Substituted, false);
                    LGuarantors.SetRange("Guarantor Type", LGuarantors."guarantor type"::Guarantor);
                    LGuarantors.SetRange("Self Guarantee", false);
                    if LGuarantors.FindFirst then begin
                        TotalGuarantors := LGuarantors.Count();
                    end;
                    OriginalLoanAmount := Loans."Requested Amount" * TotalGuarantors;
                end;
            end;

            trigger OnPreDataItem()
            begin
                PrintedBy := CopyStr(UserId, StrPos(UserId, '\') + 1, StrLen(UserId));
                // PrintedAt := SkyHarambeePortal.FormatDateTimeReverse(CurrentDatetime);
                if CompanyInformation.Get then
                    CompanyInformation.CalcFields(CompanyInformation.Picture);
                CompanyAddress := CompanyInformation.Address + ' -Post Code: ' + CompanyInformation."Post Code" + ' -City:' + CompanyInformation.City + ' Region: ' + CompanyInformation."Country/Region Code";
                CompanyTelephone := 'Tel: ' + CompanyInformation."Phone No." + ' -Office Tel: ' + CompanyInformation."Phone No. 2";
                CommunicationOnline := 'E-mail: ' + CompanyInformation."E-Mail" + '- Website: ' + CompanyInformation."Home Page";
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
        LoanRecoveryHeader: Record 52185829;
        LoaneeNo: Code[10];
        DepositsAttached: Decimal;
        LoanAttached: Decimal;
        AttachedBy: Text;
        DefaultedLoan: Code[20];
        Members: Record "Members";
        PFNo: Code[20];
        MemberName: Text[100];
        LoanType: Code[10];
        LoansApp: Record 52185729;
        Employer: Code[20];
        OriginalLoanAmount: Decimal;
        LGuarantors: Record 52185739;
        TotalGuarantors: Integer;
        PrintedBy: Text;
        PrintedAt: Text;
        //SkyHarambeePortal: Codeunit 52185428;
}
