table 52185922 "Vote Transfer"
{
    //DrillDownPageID = "Vote Transfer List.";
    //LookupPageID = "Vote Transfer List.";

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; Date; Date)
        {
        }
        field(3; "Source Vote"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(4; "Destination Vote"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(5; "Budget Name"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(6; Amount; Decimal)
        {
        }
        field(7; "Source Dimension 1"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(8; "Destination Dimension 1"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(12; Remarks; Text[200])
        {
        }
        field(13; "Raised By"; Code[20])
        {
        }
        field(14; "Raised Date"; Date)
        {
        }
        field(15; "Approved By"; Code[20])
        {
        }
        field(16; "Approved Date"; Date)
        {
        }
        field(17; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(18; Posted; Boolean)
        {
        }
        field(19; "Posted Date"; Date)
        {
        }
        field(20; "Posted By"; Code[20])
        {
        }
        field(21; "Source Dimension 2"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(22; "Destination Dimension 2"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(23; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Cancelled';
            OptionMembers = Open,"Pending Approval",Approved,Cancelled;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            GenLedgerSetup.Get;
            GenLedgerSetup.TestField(GenLedgerSetup."Vote Transfer Nos.");
            //NoSeriesMgtInitSeries(GenLedgerSetup."Vote Transfer Nos.", xRec."No. Series", 0D, No, "No. Series");

        end;
    end;

    var
        GenLedgerSetup: Record "General Ledger Setup";
    //NoSeriesMgt: Codeunit NoSeriesManagement;
}

