#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185896 "Fixed Deposit Receipt"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fixed Deposit Receipt.rdlc';

    dataset
    {
        dataitem("Savings Accounts"; "Savings Accounts")
        {
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(CompanyPic; CompInfo.Picture)
            {
            }
            column(tODAYSdATE; Format(Today, 0, 4))
            {
            }
            column(Name; UpperCase("Savings Accounts".Name))
            {
            }
            column(Balance; "Savings Accounts".Balance)
            {
            }
            column(MaturityDate; Format("Savings Accounts"."FD Maturity Date", 0, 4))
            {
            }
            column(FixedType; "Savings Accounts"."Fixed Deposit Type")
            {
            }
            column(FDRate; FixedRate)
            {
            }
            column(NumberText_1_; NumberText[1])
            {
            }
            column(ID_No; "Savings Accounts"."ID No.")
            {
            }
            column(No; "Savings Accounts"."No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                FixedRate := 0;
                FDCalcRules.Reset;
                FDCalcRules.SetRange(Code, "Savings Accounts"."Fixed Deposit Type");
                if FDCalcRules.Find('-') then begin
                    repeat
                        if ("Savings Accounts".Balance >= FDCalcRules."Minimum Amount") and ("Savings Accounts".Balance <= FDCalcRules."Maximum Amount") then
                            FixedRate := FDCalcRules."Interest Rate";
                    until
                    FDCalcRules.Next = 0;
                end;

                if "Savings Accounts"."Neg. Interest Rate" <> 0 then
                    FixedRate := "Savings Accounts"."Neg. Interest Rate";

                "Savings Accounts".CalcFields("Savings Accounts"."Balance (LCY)");

                // Amount into words
                // CheckReport.InitTextVariable;
                // CheckReport.FormatNoText(NumberText, "Savings Accounts"."Balance (LCY)", '');
            end;

            trigger OnPreDataItem()
            begin
                CompInfo.Get;
                CompInfo.CalcFields(CompInfo.Picture);
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
        CompInfo: Record "Company Information";
        FixedRate: Decimal;
        FDCalcRules: Record 52185706;
        // CheckReport: Report Check;
        NumberText: array[2] of Text[120];
}
