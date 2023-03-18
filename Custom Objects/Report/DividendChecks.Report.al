#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52186011 "Dividend Checks"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Dividend Checks.rdlc';

    dataset
    {
        dataitem("Worker T 2"; "Worker T 2")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(TopUpAmt; TopUpAmt)
            {
            }
            column(SaccoAmount; SaccoAmount)
            {
            }
            column(VendorAmt; VendorAmt)
            {
            }
            column(UpfrontInterest; UpfrontInterest)
            {
            }
            column(MaxQual; MaxQual)
            {
            }
            column(TotalDefaulted; TotalDefaulted)
            {
            }
            column(ExciseDuty; ExciseDuty)
            {
            }
            column(No_Members; "Worker T 2"."Member No")
            {
            }
            column(Name_Members; "Worker T 2".Name)
            {
            }
            column(NetTakeHome; NetTakeHome)
            {
            }
            column(DividendBal; DividendBal)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TotalDefaulted := 0;
                TopUpAmt := 0;
                SaccoAmount := 0;
                VendorAmt := 0;
                UpfrontInterest := 0;
                NetTakeHome := 0;
                DividendBal := 0;

                HasDefaulted("Worker T 2"."Member No", TotalDefaulted, TopUpAmt, SaccoAmount, VendorAmt, ExciseDuty);
                DividendAdvanceChecks("Worker T 2"."Member No", MinQual, MaxQual, CanApply, msg, DividendBal);
                UpfrontInterest := ROUND(MaxQual * 13 / 100, 1, '>');
                NetTakeHome := MaxQual - (TotalDefaulted + TopUpAmt + SaccoAmount + VendorAmt);
                if MaxQual = 0 then begin
                    TopUpAmt := 0;
                    SaccoAmount := 0;
                    VendorAmt := 0;
                    ExciseDuty := 0;
                    NetTakeHome := 0;
                    UpfrontInterest := 0;
                end;
                if NetTakeHome <= 0 then begin
                    NetTakeHome := 0;
                    TopUpAmt := 0;
                    SaccoAmount := 0;
                    VendorAmt := 0;
                    ExciseDuty := 0;
                    UpfrontInterest := 0;
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
        TopUpAmt: Decimal;
        SaccoAmount: Decimal;
        VendorAmt: Decimal;
        MinQual: Decimal;
        MaxQual: Decimal;
        CanApply: Boolean;
        msg: Text;
        UpfrontInterest: Decimal;
        NetTakeHome: Decimal;
        TotalDefaulted: Decimal;
        ExciseDuty: Decimal;
        DividendBal: Decimal;


    procedure DividendAdvanceChecks(MemberNo: Code[30]; var MinimumQualification: Decimal; var MaximumQualification: Decimal; UserCanApply: Boolean; var Msg: Text; var LoanBal: Decimal)
    var
        Continue: Boolean;
        Members: Record "Members";
        Loans: Record 52185729;
        LoanRep: Decimal;
        ProductFactory: Record 52185690;
        SavingsAccounts: Record 52185730;
        FOSAAcc: Code[30];
        SavingsLedgerEntry: Record 52185732;
    //SkyMbanking: Codeunit 52185423;
    begin
        Continue := true;
        if Members.Get(MemberNo) then begin

            ProductFactory.Get('136');

            SavingsAccounts.Reset;
            SavingsAccounts.SetRange("Member No.", Members."No.");
            SavingsAccounts.SetRange("Product Type", '505');
            if SavingsAccounts.FindFirst then begin
                FOSAAcc := SavingsAccounts."No.";
            end;

            MaximumQualification := 0;
            MinimumQualification := 0;
            // MaximumQualification := SkyMbanking.GetDividendLoanQualifiedAmount(FOSAAcc, ProductFactory."Product ID");

            Loans.Reset;
            Loans.SetRange("Member No.", MemberNo);
            Loans.SetRange("Loan Product Type", '136');
            Loans.SetFilter("Outstanding Balance", '>0');
            if Loans.FindFirst then begin
                Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                LoanBal := Loans."Outstanding Interest" + Loans."Outstanding Balance";
            end;


            if MaximumQualification > ProductFactory."Mobile Max. Loan Amount" then
                MaximumQualification := ProductFactory."Mobile Max. Loan Amount";

            MinimumQualification := ProductFactory."Mobile Min. Loan Amount";
            if MaximumQualification < ProductFactory."Mobile Min. Loan Amount" then begin
                MinimumQualification := 0;
                MaximumQualification := 0;
                Continue := false;
                MaximumQualification := 0;
                MinimumQualification := 0;
                Msg := 'You are not eligible for this loan';
            end;


        end;
    end;

    local procedure HasDefaulted(MemberNo: Code[30]; var TotalDefaulted: Decimal; var TopUpCharge: Decimal; var SaccoFee: Decimal; var VendorFee: Decimal; var TotalExcise: Decimal) HasDefaulted: Boolean
    var
        Loans: Record 52185729;
        CoopSetup: Record 52185471;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        ExciseDuty: Decimal;
        Amt: Decimal;
        ExciseDuty1: Decimal;
        TariffDetails: Record 52185777;
        PCharges: Record 52185734;
        TopUpAmt: Decimal;
        ExciseDutyRate: Decimal;
    //SkyMbanking: Codeunit 52185423;
    begin


        Loans.Reset;
        Loans.SetRange("Member No.", MemberNo);
        Loans.SetFilter("Loans Category-SASRA", '%1|%2|%3|%4', Loans."loans category-sasra"::Watch, Loans."loans category-sasra"::Substandard,
                Loans."loans category-sasra"::Doubtful, Loans."loans category-sasra"::Loss);
        Loans.SetFilter("Outstanding Balance", '>0');
        if Loans.FindFirst then begin
            HasDefaulted := true;
            repeat
                TopUpAmt := 0;
                Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                TotalDefaulted += Loans."Outstanding Balance" + Loans."Outstanding Interest";
                TopUpAmt := Loans."Outstanding Balance" + Loans."Outstanding Interest";
                PCharges.Reset;
                PCharges.SetRange(PCharges."Product Code", Loans."Loan Product Type");
                PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Top up");
                if PCharges.Find('-') then begin
                    repeat
                        if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
                            Amt += (TopUpAmt * (PCharges.Percentage / 100))
                        else
                            if PCharges."Charge Method" = PCharges."charge method"::"Flat Amount" then
                                Amt += PCharges."Charge Amount"
                            else
                                if PCharges."Charge Method" = PCharges."charge method"::Staggered then begin

                                    PCharges.TestField(PCharges."Staggered Charge Code");

                                    TariffDetails.Reset;
                                    TariffDetails.SetRange(TariffDetails.Code, PCharges."Staggered Charge Code");
                                    if TariffDetails.Find('-') then begin
                                        repeat
                                            if (TopUpAmt >= TariffDetails."Lower Limit") and (TopUpAmt <= TariffDetails."Upper Limit") then begin
                                                if TariffDetails."Use Percentage" = true then begin
                                                    Amt += TopUpAmt * TariffDetails.Percentage * 0.01;
                                                end
                                                else begin
                                                    Amt += TariffDetails."Charge Amount";
                                                end;
                                            end;
                                        until TariffDetails.Next = 0;
                                    end;
                                end;

                        if PCharges.Maximum > 0 then
                            if Amt > PCharges.Maximum then
                                Amt := PCharges.Maximum;

                        //If excise duty involved
                        if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin

                            //ExciseDutyRate := SkyMbanking.GetExciseRate();
                            ExciseDuty += Amt * ExciseDutyRate / 100;
                        end;
                    until PCharges.Next = 0;
                end;
            until Loans.Next = 0;
        end else
            HasDefaulted := false;


        CoopSetup.Reset;
        CoopSetup.SetRange("Transaction Type", CoopSetup."transaction type"::"Loan Disbursement");
        if CoopSetup.FindFirst then begin
            SaccoFee := CoopSetup."Sacco Fee";
            VendorCommission := CoopSetup."Vendor Commission";

            TotalCharge := SaccoFee + VendorCommission;
            ExciseDuty := ROUND((SaccoFee) * ExciseDutyRate / 100);
        end
        else begin
            Error('Setup Missing for %1', CoopSetup."transaction type"::"Loan Disbursement");
        end;

        TotalExcise := ExciseDuty + ExciseDuty1;
        TopUpCharge := Amt;
        VendorFee := VendorCommission;
        TotalExcise := ExciseDuty1 + ExciseDuty;
    end;

    local procedure HasDefaulted2(MemberNo: Code[30]) HasDefaulted: Boolean
    var
        Loans: Record 52185729;
        CoopSetup: Record 52185471;
        VendorCommission: Decimal;
        TotalCharge: Decimal;
        ExciseDuty: Decimal;
        Amt: Decimal;
        ExciseDuty1: Decimal;
        TariffDetails: Record 52185777;
        PCharges: Record 52185734;
        TopUpAmt: Decimal;
        ExciseDutyRate: Decimal;
    //SkyMbanking: Codeunit 52185423;
    begin
        Loans.Reset;
        Loans.SetRange("Member No.", MemberNo);
        Loans.SetFilter("Loans Category-SASRA", '%1|%2|%3|%4', Loans."loans category-sasra"::Watch, Loans."loans category-sasra"::Substandard,
                Loans."loans category-sasra"::Doubtful, Loans."loans category-sasra"::Loss);
        Loans.SetFilter("Outstanding Balance", '>0');
        if Loans.FindFirst then begin
            HasDefaulted := true;
        end else
            HasDefaulted := false;
    end;
}
