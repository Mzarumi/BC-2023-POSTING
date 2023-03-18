#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185892 "Fixed Deposit Certificate"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Fixed Deposit Certificate.rdlc';

    dataset
    {
        dataitem("Savings Accounts"; "Savings Accounts")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(DayT; Today)
            {
            }
            column(No; "Savings Accounts"."No.")
            {
            }
            column(Amount; Bal)
            {
            }
            column(Name; "Savings Accounts".Name)
            {
            }
            column(FixedDuration; DuratinFD)
            {
            }
            column(Rate; Rate)
            {
            }
            column(NumberText; NumberText[1])
            {
            }
            column(InterestExpected; InterestExpected)
            {
            }
            column(RefNo; RefNo)
            {
            }
            column(WthTax; WthTax)
            {
            }
            column(MaturityD; MaturityD)
            {
            }
            column(compName; COMPANYNAME)
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*
                FixedDepLine.SETRANGE(FixedDepLine."Account No",Table39004418."No.");
                FixedDepLine.SETRANGE(FixedDepLine."Reference No",RefNo);
                IF FixedDepLine.FIND('-') THEN BEGIN
                IF FixedDepLine.Amount>0 THEN BEGIN
                Rate:=FixedDepLine."Negotiated Interest";
                Bal:=FixedDepLine.Amount;
                FdType:=FixedDepLine."Fixed Deposit Type";
                InterestExpected:=FixedDepLine."Interest Expected";
                WthTax:=(FixedDepLine."Interest Expected")*0.15;
                DuratinFD:=FORMAT(FixedDepLine.Duration);
                MaturityD:=FixedDepLine."Maturity Date";
                END;
                END;
                
                
                //Amount into words
                CheckReport.InitTextVariable;
                CheckReport.FormatNoText(NumberText,Bal,'');
                
                
                {
                
                IntRule.RESET;
                IntRule.SETRANGE(IntRule.Code,"SACCO Account"."Fixed Deposit Type");
                IF IntRule.FIND('-') THEN BEGIN
                REPEAT
                IF (Bal>IntRule."Minimum Amount") AND (Bal<IntRule."Maximum Amount") THEN BEGIN
                Rate:=IntRule."Interest Rate";
                END;
                UNTIL IntRule.NEXT=0;
                END;
                IF "SACCO Account"."Neg. Interest Rate"<>0 THEN
                Rate:="SACCO Account"."Neg. Interest Rate";
                 }
                */

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(RefNo; RefNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reference No.';
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

    var
        "Fixed": Record 52185705;
        IntRule: Record 52185706;
        Rate: Decimal;
        //CheckReport: Report Check;
        NumberText: array[2] of Text[120];
        Bal: Decimal;
        RefNo: Code[30];
        InterestExpected: Decimal;
        WthTax: Decimal;
        FdType: Code[20];
        DuratinFD: Code[20];
        MaturityD: Date;
}
