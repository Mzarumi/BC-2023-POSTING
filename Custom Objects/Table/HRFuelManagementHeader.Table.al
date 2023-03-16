table 52185978 "HR Fuel Management Header"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; "Vehicle Registration No."; Code[10])
        {

            trigger OnValidate()
            begin
                FixedAsset.Reset;
                FixedAsset.SetRange(FixedAsset."No.", "Vehicle Registration No.");
                if FixedAsset.Find('-') then
                    "Name Vehicle" := FixedAsset.Description;
            end;
        }
        field(3; "Vehicle Type"; Option)
        {
            OptionCaption = 'Authority';
            OptionMembers = Authority;
        }
        field(4; "Fuel Type"; Option)
        {
            OptionCaption = ' ,Petrol';
            OptionMembers = " ",Petrol;
        }
        field(5; "Type Of Payment"; Option)
        {
            OptionCaption = ' ,Card, Cash, Direct Fueling';
            OptionMembers = " ",Card," Cash"," Direct Fueling";
        }
        field(6; "Total Cost"; Decimal)
        {
        }
        field(7; "Driver Details"; Code[20])
        {
            TableRelation = "HR Drivers";
        }
        field(107; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(50009; "Vehicle Fueled"; Code[20])
        {

            trigger OnValidate()
            begin
                FixedAsset.Reset;
                FixedAsset.SetRange(FixedAsset."No.", "Vehicle Registration No.");
                if FixedAsset.Find('-') then
                    "Name Vehicle" := FixedAsset.Description;
            end;
        }
        field(50010; "Name Vehicle"; Text[100])
        {
        }
        field(50011; "E-Mail"; Text[80])
        {
        }
        field(50012; Performance; Text[40])
        {
        }
        field(50013; "Source of Fueling"; Text[30])
        {
        }
        field(50014; "Fuel Cost"; Decimal)
        {
        }
        field(50015; "Type of fuel"; Text[30])
        {
        }
        field(50016; "Fuel Consumed"; Integer)
        {
        }
        field(50017; "Date /Time"; DateTime)
        {
        }
        field(50018; "Card No"; Code[20])
        {
        }
        field(50019; "Work Ticket No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        if Code = '' then begin
            HrSetup.Get;
            begin
                TestNoSeries;
                //NoSeriesMgtInitSeries(HrSetup."Fuel Maintenance No", xRec."No. Series", 0D, Code, "No. Series");
            end;
        end;
    end;

    var
        FixedAsset: Record "Fixed Asset";
        HrSetup: Record "HR Setup";
    //NoSeriesMgt: Codeunit NoSeriesManagement;

    local procedure TestNoSeries(): Boolean
    begin
        /*CASE "Document Type" OF
          "Document Type"::Quote:
            PurchSetup.TESTFIELD("Quote Nos.");
        
          "Document Type"::Order:
            PurchSetup.TESTFIELD("Order Nos.");
          "Document Type"::Invoice:
            BEGIN
              PurchSetup.TESTFIELD("Invoice Nos.");
              PurchSetup.TESTFIELD("Posted Invoice Nos.");
            END;
          "Document Type"::"Return Order":
            PurchSetup.TESTFIELD("Return Order Nos.");
          "Document Type"::"Credit Memo":
            BEGIN
              PurchSetup.TESTFIELD("Credit Memo Nos.");
              PurchSetup.TESTFIELD("Posted Credit Memo Nos.");
            END;
          "Document Type"::"Blanket Order":
            PurchSetup.TESTFIELD("Blanket Order Nos.");
        END;
                    */

    end;
}

