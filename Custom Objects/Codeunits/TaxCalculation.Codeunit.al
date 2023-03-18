#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185490 "Tax Calculation"
{

    trigger OnRun()
    begin
    end;


    procedure CalculateTax(Rec: Record 52185878; CalculationType: Option VAT,"W/Tax",Retention,"W/VAT") Amount: Decimal
    begin
        case CalculationType of
            Calculationtype::VAT:
                begin
                    Amount := (Rec."VAT Rate" / (100 + Rec."VAT Rate")) * Rec.Amount;
                end;
            Calculationtype::"W/Tax":
                begin
                    Amount := (Rec.Amount - ((Rec."VAT Rate" / (100 + Rec."VAT Rate")) * Rec.Amount))
                    * (Rec."W/Tax Rate" / 100);
                end;
            Calculationtype::Retention:
                begin
                    Amount := (Rec.Amount - ((Rec."VAT Rate" / (100 + Rec."VAT Rate")) * Rec.Amount))
                     * (Rec."Retention Rate" / 100);
                end;

            Calculationtype::"W/VAT":
                begin
                    Amount := (Rec.Amount * Rec."VAT Withholding Rate" / (100 + Rec."VAT Rate"));
                end;

        end;
    end;


    procedure CalculatePurchTax(Rec: Record "Purchase Line"; CalculationType: Option VAT,"W/Tax",Retention) Amount: Decimal
    begin
        /*
        CASE CalculationType OF
          CalculationType::VAT:
            BEGIN
                //Amount:=(Rec."VAT Rate"/(100+Rec."VAT Rate"))*Rec.Amount;
                Amount:=(Rec."VAT Rate"/(100+Rec."VAT Rate"))*Rec.Amount;
            END;
          CalculationType::"W/Tax":
            BEGIN
                //Amount:=(Rec.Amount-((Rec."VAT Rate"/(100+Rec."VAT Rate"))*Rec.Amount))
                //*(Rec."W/Tax Rate"/100);
                Amount:=(Rec.Amount*(Rec."W/Tax Rate"/(100+Rec."VAT Rate")));
        
            END;
          CalculationType::Retention:
            BEGIN
                Amount:=(Rec.Amount-((Rec."VAT Rate"/100)*Rec.Amount))
                 *(Rec."Retention Rate"/100);
            END;
        END;
        */

    end;
}
