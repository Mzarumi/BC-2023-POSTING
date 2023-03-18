table 52185807 "Investment Header"
{
    // //DrillDownPageID = 39005760;
    // //LookupPageID = 39005760;

    fields
    {
        field(1; "Investment No"; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "Investment No" <> xRec."Investment No" then begin
                    NoSetup.Get();
                    //NoSeriesMgtTestManual(NoSetup."Investment Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Investment Type Code"; Code[50])
        {
            TableRelation = "Investment Type" WHERE(Type = FIELD("Asset Type"));

            trigger OnValidate()
            begin

                if InvestType.Get("Investment Type Code") then begin
                    "Investment Type Description" := InvestType.Description;
                    "Deposit Type" := InvestType."Deposit Type";
                    Validate("Deposit Type");
                end;
            end;
        }
        field(3; "Investment Type Description"; Text[50])
        {
            Editable = false;
        }
        field(4; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Fulfilled';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Fulfilled;
        }
        field(6; "No. Series"; Code[10])
        {
        }
        field(7; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center";
        }
        field(8; "Asset Type"; Option)
        {
            OptionCaption = 'Money Market';
            OptionMembers = "Money Market";
        }
        field(9; "Total Investment"; Decimal)
        {
            CalcFormula = Sum("Investment Lines"."Investment Amount" WHERE("Investment No" = FIELD("Investment No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Transaction Date"; Date)
        {
        }
        field(11; "Compliance Checked"; Boolean)
        {
        }
        field(12; "Trade Type"; Option)
        {
            OptionCaption = ' ,Held To Maturity,Available For Sale,Trading';
            OptionMembers = " ","Held To Maturity","Available For Sale",Trading;
        }
        field(13; Institution; Code[20])
        {
            TableRelation = Vendor WHERE("Vendor Type" = CONST(Institution));

            trigger OnValidate()
            begin
                if Vendor.Get(Institution) then
                    Vendor.CalcFields(Vendor."Balance (LCY)");
                "Institution Name" := Vendor.Name;
                "Vendor Credit Limit(LCY)" := Vendor."Vendor Credit Limit(LCY)";

                "Available Amount" := "Vendor Credit Limit(LCY)" - Abs(Vendor."Balance (LCY)");
            end;
        }
        field(14; "Institution Name"; Text[100])
        {
            Editable = false;
        }
        field(15; "Investment Date"; Date)
        {

            trigger OnValidate()
            var
                NextIntDate: Date;
                PreviousIntDate: Date;
            begin
                CompInfo.Get;

                // NonWorkingDay := CalenderMgt.CheckDateStatus(CompInfo."Base Calendar Code", "Investment Date", DateDesc);
                if NonWorkingDay = true then
                    Error('Expected payment date is falling on a non working day');
            end;
        }
        field(16; "Interest Rate"; Decimal)
        {
        }
        field(17; "Currency Code"; Code[10])
        {
            TableRelation = Currency;
        }
        field(18; "Total Investment (LCY)"; Decimal)
        {
            CalcFormula = Sum("Investment Lines"."Investment Amount (LCY)" WHERE("Investment No" = FIELD("Investment No")));
            FieldClass = FlowField;
        }
        field(19; Tenor; DateFormula)
        {

            trigger OnValidate()
            begin
                "Maturity Date" := CalcDate(Tenor, "Investment Date") - 1;
                CompInfo.Get;

                "Expected Payment Date" := "Maturity Date" + 1;

                // NonWorkingDay := CalenderMgt.CheckDateStatus(CompInfo."Base Calendar Code", "Expected Payment Date", DateDesc);
                if NonWorkingDay = true then
                    Error('Expected payment date is falling on a non working day');
            end;
        }
        field(20; "Expected Payment Date"; Date)
        {
        }
        field(21; "Interest Mode"; Option)
        {
            OptionCaption = ' ,Arrears,Advance';
            OptionMembers = " ",Arrears,Advance;
        }
        field(22; Years; Decimal)
        {
        }
        field(23; "Withholding Tax Code"; Code[20])
        {
            TableRelation = "Tariff Code s".Code WHERE(Type = CONST("W/Tax"));
        }
        field(24; Remarks; Text[250])
        {
        }
        field(25; "Maturity Date"; Date)
        {
        }
        field(26; "Deposit Type"; Option)
        {
            OptionCaption = ' ,Fixed,Call,Securities';
            OptionMembers = " ","Fixed",Call,Securities;

            trigger OnValidate()
            begin
                if "Deposit Type" = "Deposit Type"::Fixed then
                    "Interest Mode" := "Interest Mode"::Arrears
                else
                    if "Deposit Type" = "Deposit Type"::Securities then
                        "Interest Mode" := "Interest Mode"::Advance;
            end;
        }
        field(27; "Period Type"; Option)
        {
            OptionCaption = ' ,Days,Weeks,Months,Quaters,Years';
            OptionMembers = " ",Days,Weeks,Months,Quaters,Years;
        }
        field(28; "Frequency Period"; Integer)
        {

            trigger OnValidate()
            var
                Datefom: DateFormula;
            begin

                if "Period Type" = "Period Type"::Days then
                    Evaluate(Datefom, Format("Frequency Period") + 'D');
                if "Period Type" = "Period Type"::Weeks then
                    Evaluate(Datefom, Format("Frequency Period") + 'W');
                if "Period Type" = "Period Type"::Months then
                    Evaluate(Datefom, Format("Frequency Period") + 'M');
                if "Period Type" = "Period Type"::Quaters then
                    Evaluate(Datefom, Format("Frequency Period") + 'Q');
                if "Period Type" = "Period Type"::Years then
                    Evaluate(Datefom, Format("Frequency Period") + 'Y');

                Tenor := Datefom;
                Validate(Tenor);
            end;
        }
        field(29; "Available Amount"; Decimal)
        {
        }
        field(30; "Vendor Credit Limit(LCY)"; Decimal)
        {
        }
        field(31; "Document Date"; Date)
        {
        }
        field(32; "Date Posted"; Date)
        {
        }
        field(33; "Time Posted"; Time)
        {
        }
        field(34; "Posted By"; Code[50])
        {
        }
        field(35; Posted; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Investment No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Investment No" = '' then begin
            NoSetup.Get();
            NoSetup.TestField(NoSetup."Investment Nos");
            //NoSeriesMgtInitSeries(NoSetup."Investment Nos", xRec."No. Series", 0D, "Investment No", "No. Series");
        end;

        "Transaction Date" := Today;
        "Document Date" := Today;
    end;

    var
        NoSetup: Record "Banking No Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        InvestType: Record "Investment Type";
        Vendor: Record Vendor;
        CompInfo: Record "Company Information";
        CalenderMgt: Codeunit "Calendar Management";
        NonWorkingDay: Boolean;
        DateDesc: Text[30];
        paySetup: Record "Receipts and Payment Types";

    //[Scope('Internal')]
    procedure CreatePaymentDoc()
    var
        PaymentsHeader: Record "Payments Header";
        PaymentsLine: Record "Payment Line";
        InvestLines: Record "Investment Lines";
    begin




        PaymentsHeader.Init;
        PaymentsHeader.Date := Today;
        PaymentsHeader."Pay Mode" := PaymentsHeader."Pay Mode"::Cheque;
        PaymentsHeader."Currency Code" := "Currency Code";
        PaymentsHeader.Payee := "Institution Name";
        PaymentsHeader."Payment Narration" := "Institution Name";
        PaymentsHeader."Responsibility Center" := "Responsibility Center";
        PaymentsHeader."Creation Doc No." := "Investment No";
        PaymentsHeader."Creation Doc Type" := PaymentsHeader."Creation Doc Type"::Investment;
        PaymentsHeader.Insert(true);


        InvestLines.Reset;
        InvestLines.SetRange(InvestLines."Investment No", "Investment No");
        if InvestLines.Find('-') then begin
            repeat
                PaymentsLine.Init;
                PaymentsLine."Line No." := 0;
                PaymentsLine.No := PaymentsHeader."No.";
                PaymentsLine."Account Type" := PaymentsLine."Account Type"::Vendor;
                PaymentsLine."Account No." := Institution;
                PaymentsLine."Account Name" := "Institution Name";
                paySetup.Reset;
                paySetup.SetRange(paySetup."Payment Reference", paySetup."Payment Reference"::Investment);
                if paySetup.Find('-') then begin
                    PaymentsLine.Type := paySetup.Code;
                end;
                PaymentsLine.Amount := InvestLines."Investment Amount";
                //PaymentsLine."Withholding Tax Code":="Withholding Tax Code";
                //PaymentsLine."Withholding Tax Amount":=InvestLines."Wht Tax Amount";
                PaymentsLine.Insert(true);
                PaymentsLine.Validate(PaymentsLine.Amount);
                //PaymentsLine.VALIDATE(PaymentsLine."Account No.");
                PaymentsLine.Modify;
            until InvestLines.Next = 0;
        end;


        PAGE.Run(52185890, PaymentsHeader);
    end;
}

