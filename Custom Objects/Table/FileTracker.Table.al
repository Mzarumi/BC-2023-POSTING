table 52186080 "File Tracker"
{

    fields
    {
        field(1; "Request Number"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "File Number"; Code[50])
        {
            TableRelation = Members."No.";

            trigger OnValidate()
            begin
                if Cust.Get("File Number") then begin
                    "Member Name" := Cust.Name;
                    "ID No." := Cust."ID No.";
                    "Staff No" := Cust."Payroll/Staff No.";

                end;

                //not to allow  more than one record of a file
                FileTracker.Reset;
                FileTracker.SetRange("File Number", "File Number");
                if FileTracker.Find('-') then
                    Error('File has an existing Record');
            end;
        }
        field(3; "Folio Number"; Code[60])
        {
        }
        field(4; "Move to"; Code[10])
        {
            TableRelation = "File Stations"."Station Code";

            trigger OnValidate()
            begin
                APPSET.SetRange("Station Code", Rec."Move to");
                if APPSET.Find('-') then
                    Rec."Sent To" := APPSET.Description;
                //VALIDATE("Office Name");
                /*FileMovementTracker.RESET;
                FileMovementTracker.SETRANGE(FileMovementTracker."Member No.","File Number");
                IF FileMovementTracker.FIND('+') THEN BEGIN
                IF FileMovementTracker.Stage = "Move to" THEN
                ERROR('File already in %1',FileMovementTracker.Station);
                END;*/

                //restrict movement to same department
                UserStations.Reset;
                UserStations.SetRange("User Id", UserId);
                if UserStations.Find('-') then
                    if UserStations."Station Code" = "Move to" then Error('You cannot move a file to your Section');

            end;
        }
        field(5; "File Movement Remarks"; Text[50])
        {
            TableRelation = "File Movement Remarks".Description;
        }
        field(6; "File MVT User ID"; Code[60])
        {
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(7; "File MVT Time"; Time)
        {
        }
        field(8; "Current File Location"; Code[10])
        {
            CalcFormula = Max("File Location"."Section Code" WHERE("Member No." = FIELD("File Number"),
                                                                    "Current Location" = FILTER(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "File MVT Date"; Date)
        {
        }
        field(10; "File received date"; Date)
        {
        }
        field(11; "File received Time"; Time)
        {
        }
        field(12; "File Received by"; Code[60])
        {
        }
        field(13; "File Received"; Boolean)
        {
        }
        field(14; "Action"; Option)
        {
            OptionCaption = 'Open ,Issued,Received,Forwarded';
            OptionMembers = "Open ",Issued,Received,Forwarded;
        }
        field(15; "Member Name"; Code[100])
        {
            Editable = false;
        }
        field(16; "Office Name"; Text[50])
        {
            Editable = false;
            Enabled = true;
        }
        field(17; "Sent To"; Code[60])
        {
            Editable = false;
        }
        field(18; "File Recalled"; Boolean)
        {
        }
        field(19; "ID No."; Code[20])
        {
            Editable = false;
        }
        field(20; Overdue; Boolean)
        {
            Editable = false;
        }
        field(22; "No. Series"; Code[10])
        {
            Editable = false;
        }
        field(23; "Loan No"; Code[20])
        {
            TableRelation = Loans."Loan No." WHERE("Member No." = FIELD("Folio Number"));

            trigger OnValidate()
            begin
                // //MEMBER WITH AN EXISTING APPLICATION
                // FileT.RESET;
                // FileT.SETRANGE(FileT."File Number","File Number");
                // FileT.SETRANGE(FileT."Loan No","Loan No");
                // //MESSAGE('%1',"Loan No");
                // FileT.SETRANGE(FileT."File Received by",'');
                //
                // IF FileT.FIND('-') THEN BEGIN
                // REPEAT
                // IF FileT."Request Number" <> "Request Number" THEN
                //
                // ERROR('File already has an existing application. Let the previous file be received before proceeding.');
                // UNTIL FileT.NEXT = 0;
                // END;
                // //MEMBER WITH AN EXISTING LOAN APPLICATION
            end;
        }
        field(24; "Staff No"; Code[20])
        {
            Editable = false;
        }
        field(25; "Other  Doc  No"; Code[20])
        {
        }
        field(26; "File  Forwarded"; Boolean)
        {
        }
        field(27; Narration; Text[50])
        {
        }
        field(28; Status; Option)
        {
            OptionCaption = 'Being Processed,Processed,Forwarded';
            OptionMembers = "Being Processed",Processed,Forwarded;
        }
        field(29; "File Created By"; Code[50])
        {
            Editable = false;
        }
        field(30; "File Creation Date"; Date)
        {
            Editable = false;
        }
        field(31; Create; Boolean)
        {
            Editable = false;
        }
        field(32; "File Issued"; Boolean)
        {
            Editable = false;
        }
        field(33; "Member Status"; Option)
        {
            CalcFormula = Lookup(Members.Status WHERE("No." = FIELD("File Number")));
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = ' ,New,Active,Dormant,Frozen,Withdrawal Applicant,Withdrawn,Deceased,Defaulter,Closed,Withdrawn Shareholder';
            OptionMembers = " ",New,Active,Dormant,Frozen,"Withdrawal Applicant",Withdrawn,Deceased,Defaulter,Closed,"Withdrawn Shareholder";
        }
    }

    keys
    {
        key(Key1; "Request Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ElectrolZonesAreaSvrCenter: Record "Electrol Zones/Area Svr Center";
        MembNoSeries: Record "Banking No Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        SegmentCountyDividendSignat: Record "Segment/County/Dividend/Signat";
        Cust: Record Members;
        APPSET: Record "File Stations";
        FileMovementTracker: Record "File Location";
        FileTracker: Record "File Tracker";
        UserStations: Record "User Stations";
}

