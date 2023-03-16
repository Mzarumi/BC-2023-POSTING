table 52185843 "Securities Collection Register"
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
                    //NoSeriesMgtTestManual(SalesSetup."Loan Security Collection Nos");
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
            Editable = false;
            TableRelation = Members;
        }
        field(9; "Account Name"; Text[100])
        {
            Editable = false;
        }
        field(10; "Collateral Type"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Real Estate,Plant and Equipment,Natural Reserves,Marketable Securities,Inventory,Motor Vehicle';
            OptionMembers = " ","Real Estate","Plant and Equipment","Natural Reserves","Marketable Securities",Inventory,"Motor Vehicle";
        }
        field(11; Collateral; Code[10])
        {
            Editable = false;
            TableRelation = "Loan Securities Set-up".Code WHERE(Type = FIELD("Collateral Type"));
        }
        field(12; "Collateral Name"; Text[80])
        {
            Editable = false;
        }
        field(15; "Collateral Multiplier"; Integer)
        {
            Editable = false;
        }
        field(16; "Collateral Value"; Decimal)
        {
            Editable = false;
        }
        field(17; "Collateral Limit"; Decimal)
        {
            Description = 'Max. amount Collateral can cover against loan';
            Editable = false;
        }
        field(29; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(30; "Inward/Outward"; Option)
        {
            Editable = false;
            OptionCaption = ' ,In-Store,Returned';
            OptionMembers = " ","In-Store",Returned;
        }
        field(31; "Last Valuation Date"; Date)
        {
            Editable = false;
        }
        field(32; "Forced Sale Value"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            var
                Text001: Label 'Forced sale value cannot be more than collateral limit';
            begin
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
        field(36; "Collateral Register No."; Code[20])
        {
            TableRelation = "Securities Register"."No." WHERE(Status = CONST(Approved),
                                                               "Inward/Outward" = CONST("In-Store"));

            trigger OnValidate()
            begin
                if CollSec.Get("Collateral Register No.") then begin
                    LoanGua.Reset;
                    LoanGua.SetRange("Collateral Reg. No.", "Collateral Register No.");
                    if LoanGua.Find('-') then begin
                        LoanGua.CalcFields("Outstanding Balance");
                        if LoanGua."Outstanding Balance" > 0 then
                            Error(Text006, LoanGua."Outstanding Balance");
                    end;


                    "Account Name" := CollSec."Account Name";
                    "Account No." := CollSec."Account No.";
                    Collateral := CollSec.Collateral;
                    "Collateral Limit" := CollSec."Collateral Limit";
                    "Collateral Multiplier" := CollSec."Collateral Multiplier";
                    "Collateral Name" := CollSec."Collateral Name";
                    "Collateral Perfected" := CollSec."Collateral Perfected";
                    "Collateral Type" := CollSec."Collateral Type";
                    "Collateral Value" := CollSec."Collateral Value";
                    "Forced Sale Value" := CollSec."Forced Sale Value";
                    "Inward/Outward" := CollSec."Inward/Outward";
                    "Last Valuation Date" := CollSec."Last Valuation Date";
                    "Next Valuation Date" := CollSec."Next Valuation Date";
                end;
            end;
        }
    }

    keys
    {
        key(Key1; "No.")
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
            //NoSeriesMgtInitSeries(SalesSetup."Loan Security Collection Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        if (Status = Status::Approved) or (Status = Status::Pending) then
            Error(Text002, Status);
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
        CollSec: Record "Securities Register";
        LoanGua: Record "Loan Guarantors and Security";
        Text006: Label 'The loan which was guaranteed using the collateral has a balance of %1';
}

