table 52185809 "Investment Lines"
{

    fields
    {
        field(1; "Investment No"; Code[20])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Institution; Code[10])
        {
            TableRelation = Vendor WHERE ("Vendor Type" = CONST (Institution));
        }
        field(4; "Institution Description"; Text[100])
        {
        }
        field(5; "Investment Amount"; Decimal)
        {

            trigger OnValidate()
            begin

                if Invheader.Get("Investment No") then begin

                    if "Investment Amount" > Invheader."Available Amount" then
                        Error('The investment amount caanot be more than %1', Invheader."Available Amount");


                    "Investment Amount (LCY)" := "Investment Amount";
                    "Total Amount (LCY)" := "Investment Amount (LCY)";
                    "Premium/Discount" := "Investment Amount" - "Face Value";


                end;
            end;
        }
        field(6; "Sector Compliance"; Boolean)
        {
        }
        field(7; "Share in Issue Compliance"; Boolean)
        {
        }
        field(8; "Aggregate Compliance"; Boolean)
        {
        }
        field(9; "Entity Compliance"; Boolean)
        {
        }
        field(10; "Complinace Checked"; Boolean)
        {
        }
        field(11; "Investment Amount (LCY)"; Decimal)
        {
        }
        field(12; "Face Value"; Decimal)
        {

            trigger OnValidate()
            begin
                if Invheader.Get("Investment No") then begin
                    if Invheader."Interest Mode" = Invheader."Interest Mode"::Arrears then begin
                        if Invheader."Period Type" = Invheader."Period Type"::Days then
                            "Interest Amount" := (Invheader."Interest Rate" / 100) * "Face Value" * (Invheader."Frequency Period" / 365);
                        if Invheader."Period Type" = Invheader."Period Type"::Weeks then
                            "Interest Amount" := (Invheader."Interest Rate" / 100) * "Face Value" * (Invheader."Frequency Period" / 52);
                        if Invheader."Period Type" = Invheader."Period Type"::Months then
                            "Interest Amount" := (Invheader."Interest Rate" / 100) * "Face Value" * (Invheader."Frequency Period" / 12);
                        if Invheader."Period Type" = Invheader."Period Type"::Quaters then
                            "Interest Amount" := (Invheader."Interest Rate" / 100) * "Face Value" * (Invheader."Frequency Period" / 4);
                        "Investment Amount" := "Face Value";
                        Validate("Investment Amount");
                    end else
                        if Invheader."Interest Mode" = Invheader."Interest Mode"::Advance then begin
                            if Invheader."Period Type" = Invheader."Period Type"::Days then
                                "Interest Amount" := (Invheader."Interest Rate" / 100) * "Face Value" * (Invheader."Frequency Period" / 365);
                            if Invheader."Period Type" = Invheader."Period Type"::Weeks then
                                "Interest Amount" := (Invheader."Interest Rate" / 100) * "Face Value" * (Invheader."Frequency Period" / 52);
                            if Invheader."Period Type" = Invheader."Period Type"::Months then
                                "Interest Amount" := (Invheader."Interest Rate" / 100) * "Face Value" * (Invheader."Frequency Period" / 12);
                            if Invheader."Period Type" = Invheader."Period Type"::Quaters then
                                "Interest Amount" := (Invheader."Interest Rate" / 100) * "Face Value" * (Invheader."Frequency Period" / 4);

                            "Investment Amount" := "Face Value" - "Interest Amount";
                            Validate("Investment Amount");
                            "Premium/Discount" := "Investment Amount" - "Face Value";

                        end;
                end;

                if TarrifCodes.Get(Invheader."Withholding Tax Code") then begin
                    "Wht Tax Amount" := (TarrifCodes.Percentage / 100) * "Interest Amount";
                    "Net Interest Amount" := "Interest Amount" - "Wht Tax Amount"
                end;

                Validate("Investment Amount")
            end;
        }
        field(13; "Premium/Discount"; Decimal)
        {
            Editable = false;
        }
        field(14; "Interest Amount"; Decimal)
        {
            Editable = false;
        }
        field(15; "Net Interest Amount"; Decimal)
        {
            Editable = false;
        }
        field(16; "Wht Tax Amount"; Decimal)
        {
        }
        field(17; "Effective Exchange Rate"; Decimal)
        {
        }
        field(18; "Total Amount (LCY)"; Decimal)
        {
        }
        field(19; "Invested Amount"; Decimal)
        {
            FieldClass = Normal;
        }
        field(20; "Investment Amount (FCY)"; Decimal)
        {
        }
        field(21; "Fund Compliance"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Investment No", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        InstitutionRec: Record Vendor;
        NoseriesMgt: Codeunit NoSeriesManagement;
        Invheader: Record "Investment Header";
        TarrifCodes: Record "Tariff Code s";
}

