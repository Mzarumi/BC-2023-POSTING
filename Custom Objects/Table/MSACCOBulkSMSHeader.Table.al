table 52185765 "M-SACCO Bulk SMS Header"
{

    fields
    {
        field(1; No; Code[20])
        {
            NotBlank = false;
        }
        field(2; "Date Entered"; Date)
        {
        }
        field(3; "Time Entered"; Time)
        {
        }
        field(4; "Entered By"; Code[40])
        {
        }
        field(5; "SMS Type"; Option)
        {
            OptionMembers = Dimension,Telephone,Everyone;
        }
        field(6; "SMS Status"; Option)
        {
            OptionMembers = Pending,Sent,Cancelled;
        }
        field(7; "Status Date"; Date)
        {
        }
        field(8; "Status Time"; Time)
        {
        }
        field(9; "Status By"; Code[40])
        {
        }
        field(10; Message_; Text[250])
        {
        }
        field(11; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(12; "Use Line Message"; Boolean)
        {
        }
        field(13; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(14; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility CenterBR";
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
            NoSetup.Get;
            NoSetup.TestField(NoSetup."BULK SMS Nos");
            //NoSeriesMgtInitSeries(NoSetup."BULK SMS Nos", xRec."No. Series", 0D, No, "No. Series");
        end;

        "Date Entered" := Today;
        "Time Entered" := Time;
        "Entered By" := UserId;
        "SMS Type" := "SMS Type"::Telephone;
    end;

    var
        NoSetup: Record "Banking No Setup";
    //NoSeriesMgt: Codeunit NoSeriesManagement;
}

