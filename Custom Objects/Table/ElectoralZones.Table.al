table 52186239 "Electoral Zones"
{
    DataCaptionFields = "Code", "Electoral Zone Name";
    //DrillDownPageID = "Approved Electoral List";
    //LookupPageID = "Approved Electoral List";

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; "Electoral Zone Name"; Text[100])
        {
            Editable = true;

            trigger OnValidate()
            begin
                ElectoralZones.Reset;
                ElectoralZones.SetFilter(Code, '<>%1', Rec.Code);
                ElectoralZones.SetRange("Electoral Zone Name", Rec."Electoral Zone Name");
                if ElectoralZones.FindFirst then
                    Error('The electoral zone %1 already exists', "Electoral Zone Name");
            end;
        }
        field(3; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(4; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(5; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(6; "Creation Date"; Date)
        {
            Editable = false;
        }
        field(7; "No. Series"; Code[20])
        {
        }
        field(8; County; Code[50])
        {
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST(County));
        }
        field(9; "Sub-County"; Code[50])
        {
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST("Sub-County"));
        }
        field(10; "Sub-County Name"; Text[100])
        {
            Editable = false;
        }
        field(11; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;

            trigger OnValidate()
            begin
                if Status = Status::Approved then begin
                    DelegateOfficials.Reset;
                    DelegateOfficials.SetRange("Electoral Zone", Code);
                    if DelegateOfficials.FindSet then begin
                        repeat
                            DelegateOfficials.Status := DelegateOfficials.Status::Approved;
                            "Creation Date" := Today;
                            DelegateOfficials.Modify;
                        until DelegateOfficials.Next = 0;
                    end;
                end;
                if Status = Status::Pending then begin
                    DelegateOfficials.Reset;
                    DelegateOfficials.SetRange("Electoral Zone", Code);
                    if DelegateOfficials.FindSet then begin
                        repeat
                            DelegateOfficials.Status := DelegateOfficials.Status::Pending;
                            DelegateOfficials.Modify;
                        until DelegateOfficials.Next = 0;
                    end;
                end;

                if Status = Status::Rejected then begin
                    DelegateOfficials.Reset;
                    DelegateOfficials.SetRange("Electoral Zone", Code);
                    if DelegateOfficials.FindSet then begin
                        repeat
                            DelegateOfficials.Status := DelegateOfficials.Status::Rejected;
                            DelegateOfficials.Modify;
                        until DelegateOfficials.Next = 0;
                    end;
                end;
            end;
        }
        field(14; Mileage; Integer)
        {
        }
        field(15; "Date Entered"; Date)
        {
            Editable = false;
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
        fieldgroup(as; "Code", "Electoral Zone Name", "Global Dimension 1 Code")
        {
        }
    }

    trigger OnDelete()
    begin
        //ERROR('Delete is not allowed');
    end;

    trigger OnInsert()
    begin
        if Code = '' then begin
            //NoSeriesMgtInitSeries('ELCT_ZONES', xRec."No. Series", 0D, Code, "No. Series");
            "Created By" := UserId;
            "Date Entered" := Today;
        end;
    end;

    var
        ElectrolZonesAreaSvrCenter: Record "Electrol Zones/Area Svr Center";
        MembNoSeries: Record "Banking No Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        SegmentCountyDividendSignat: Record "Segment/County/Dividend/Signat";
        DimensionValue: Record "Dimension Value";
        Members: Record Members;
        DelegateOfficials: Record "Delegate Officials";
        ElectoralZones: Record "Electoral Zones";
}

