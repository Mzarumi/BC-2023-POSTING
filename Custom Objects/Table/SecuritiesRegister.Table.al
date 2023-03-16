table 52185840 "Securities Register"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SalesSetup.Get;
                    //NoSeriesMgtTestManual(SalesSetup."Loan Security Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(5; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(8; "Account No."; Code[20])
        {
            TableRelation = Members;

            trigger OnValidate()
            begin
                if CusMembr.Get("Account No.") then
                    "Account Name" := CusMembr.Name;
            end;
        }
        field(9; "Account Name"; Text[100])
        {
            Editable = false;
        }
        field(10; "Collateral Type"; Option)
        {
            OptionCaption = ' ,Land,Real Estate/Plot,Plant and Equipment,Natural Reserves,Marketable Securities,Inventory,Motor Vehicle';
            OptionMembers = " ",Land,"Real Estate/Plot","Plant and Equipment","Natural Reserves","Marketable Securities",Inventory,"Motor Vehicle";
        }
        field(11; Collateral; Code[10])
        {
            TableRelation = "Loan Securities Set-up".Code WHERE(Type = FIELD("Collateral Type"));

            trigger OnValidate()
            begin
                if SecurityRegSetUp.Get(Collateral) then begin
                    if SecurityRegSetUp.Blocked then
                        Error(Text001, SecurityRegSetUp."Security Description");

                    "Collateral Name" := SecurityRegSetUp."Security Description";
                    "Collateral Multiplier" := SecurityRegSetUp."Collateral Multiplier";
                    "Collateral Limit" := "Collateral Value" * ("Collateral Multiplier" / 100);
                end;
            end;
        }
        field(12; "Collateral Name"; Text[80])
        {
            Editable = false;
        }
        field(15; "Collateral Multiplier"; Integer)
        {
            Editable = true;

            trigger OnValidate()
            begin
                Validate("Collateral Value");
                if ("Collateral Multiplier" > 100) or
                  ("Collateral Multiplier" < 0)
                  then
                    "Collateral Multiplier" := 0
            end;
        }
        field(16; "Collateral Value"; Decimal)
        {

            trigger OnValidate()
            begin

                if ("Collateral Multiplier" > 100) or
                 ("Collateral Multiplier" < 0)
                 then
                    "Collateral Multiplier" := 0 else
                    "Collateral Multiplier" := "Collateral Multiplier";
                "Collateral Limit" := "Collateral Value" * ("Collateral Multiplier" / 100);
                Validate("Collateral Limit");
            end;
        }
        field(17; "Collateral Limit"; Decimal)
        {
            Description = 'Max. amount Collateral can cover against loan';
            Editable = false;

            trigger OnValidate()
            begin
                "Forced Sale Value" := "Collateral Limit";
                Validate("Forced Sale Value");
            end;
        }
        field(29; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(30; "Inward/Outward"; Option)
        {
            OptionCaption = ' ,In-Store,Returned';
            OptionMembers = " ","In-Store",Returned;
        }
        field(31; "Last Valuation Date"; Date)
        {

            trigger OnValidate()
            begin
                GenSetup.Get;
                if "Last Valuation Date" <> 0D then begin
                    if "Last Valuation Date" > Today then
                        Error(Text004);
                    GenSetup.TestField("Maximum Valuation Period");
                    if CalcDate(GenSetup."Maximum Valuation Period", "Last Valuation Date") < Today then
                        Error(Text003, GenSetup."Maximum Valuation Period");
                    SecurityRegSetUp.Reset;
                    SecurityRegSetUp.SetRange(SecurityRegSetUp.Type, "Collateral Type");
                    if SecurityRegSetUp.Find('-') then begin
                        if Format(SecurityRegSetUp."Revaluation Frequency") <> '' then
                            "Next Valuation Date" := CalcDate(SecurityRegSetUp."Revaluation Frequency", "Last Valuation Date");
                    end;
                end;
            end;
        }
        field(32; "Forced Sale Value"; Decimal)
        {

            trigger OnValidate()
            var
                Text001: Label 'Forced sale value cannot be more than collateral limit';
            begin
                if "Forced Sale Value" > "Collateral Limit" then
                    Error(Text005, "Collateral Limit");
            end;
        }
        field(33; "Collateral Perfected"; Boolean)
        {
            Editable = false;
        }
        field(34; "Next Valuation Date"; Date)
        {
            Editable = false;
        }
        field(35; Remarks; Text[150])
        {
        }
        field(36; "Collateral Ref No."; Text[100])
        {
        }
        field(37; "Captured By"; Text[100])
        {

            trigger OnValidate()
            begin
                "Captured By" := UserId;
            end;
        }
        field(38; "Date Captured"; Date)
        {

            trigger OnValidate()
            begin
                "Date Captured" := Today;
            end;
        }
    }

    keys
    {
        key(Key1; "No.", "Account No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", "Collateral Name")
        {
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            SalesSetup.Get;
            SalesSetup.TestField(SalesSetup."Loan Security Nos.");
            //NoSeriesMgtInitSeries(SalesSetup."Loan Security Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        Validate("Captured By");
        Validate("Date Captured");
    end;

    trigger OnModify()
    begin
        //IF (Status=Status::Approved) OR (Status=Status::Pending) THEN
        //ERROR(Text002,Status);
    end;

    var
        SalesSetup: Record "Credit Nos. Series";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        CusMembr: Record Members;
        SecurityRegSetUp: Record "Loan Securities Set-up";
        Text001: Label 'This collateral is blocked thus not avaialable for use.';
        Text002: Label 'This application is %1 thus cannot modify.';
        GenSetup: Record "General Set-Up";
        Text003: Label 'The last valuation day is more than %1 hence is invalid';
        Text004: Label 'Last valuation date cannot be greater than today';
        Text005: Label 'The forced sale value cannot be greater than collateral maximum limit of %1';
}

