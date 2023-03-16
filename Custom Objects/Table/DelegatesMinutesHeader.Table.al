table 52186056 "Delegates Minutes Header"
{

    fields
    {
        field(1; "Code"; Code[50])
        {
            Editable = false;
        }
        field(2; Venue; Text[30])
        {
        }
        field(3; "Start Time"; Time)
        {
        }
        field(4; "End Time"; Time)
        {
        }
        field(5; Month; Integer)
        {

            trigger OnValidate()
            begin
                /*IF Month>DATE2DMY(TODAY,2) THEN
                  ERROR(Err0001);*/

                Year := Date2DMY(Today, 3);

            end;
        }
        field(6; Year; Integer)
        {
        }
        field(9; "No. Series"; Code[20])
        {
        }
        field(10; "Electoral Region"; Code[50])
        {
            TableRelation = "Electrol Zones/Area Svr Center".Code;
        }
        field(11; "Created By"; Code[50])
        {
        }
        field(12; "Created Date"; Date)
        {
        }
        field(13; Posted; Boolean)
        {
        }
        field(14; "Meeting Date Time"; DateTime)
        {
        }
        field(15; "Delegate Region"; Code[50])
        {
            TableRelation = "Delegate Region".Code;

            trigger OnValidate()
            begin


                DelegateRegion.Reset;
                DelegateRegion.SetRange(Code, "Delegate Region");
                if DelegateRegion.Find('-') then begin
                    if UserId <> 'HARAMBEESACCO\WEBPORTAL' then
                        if Date2DMY(DelegateRegion."Creation Date", 3) <> Date2DMY(Today, 3) then Error('Meeting code must be of the current year');
                    StatusChangePermissions.Reset;
                    StatusChangePermissions.SetRange("User ID", UserId);
                    StatusChangePermissions.SetRange("Register ADM Attendance", true);
                    if StatusChangePermissions.FindFirst then
                        if DelegateRegion."Electoral Zone" <> 'ALL' then Error('You cannot create this meeting, please refer Delegates to the Members'' Portal');

                    "Electoral Name" := DelegateRegion."Delegate Region Description";
                    "Electoral Region" := DelegateRegion."Electoral Zone Name";
                    "Electoral Zone" := DelegateRegion."Electoral Zone";
                    "Created Date" := Today;
                    Type := DelegateRegion.Type;
                end;
            end;
        }
        field(16; "Posted By"; Code[50])
        {
        }
        field(17; "Posted Date"; DateTime)
        {
        }
        field(18; "Electoral Name"; Code[50])
        {
        }
        field(19; "Electoral Zone"; Code[15])
        {
            TableRelation = "Electrol Zones/Area Svr Center".Code WHERE(Type = FILTER("Electral Zone"));
        }
        field(20; Type; Option)
        {
            OptionCaption = 'Normal,ADM';
            OptionMembers = Normal,ADM;
        }
        field(21; "Delegate Member No"; Code[30])
        {
        }
        field(22; "Delegate Name"; Text[100])
        {
        }
        field(23; "Total Branch Members"; Integer)
        {
            CalcFormula = Lookup("Delegates Monthly Returns"."Total Branch Members" WHERE("Header No" = FIELD(Code),
                                                                                           "Caption Type" = CONST('TOTAL_BRANCH_MEMBERS')));
            FieldClass = FlowField;
        }
        field(24; "Meeting Venue"; Text[100])
        {
        }
        field(25; "Meeting Date"; Date)
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
        StatusChangePermissions.Reset;
        StatusChangePermissions.SetRange("User ID", UserId);
        StatusChangePermissions.SetRange("Register ADM Attendance", true);
        if not StatusChangePermissions.FindFirst then
            if UserId <> 'HARAMBEESACCO\WEBPORTAL' then Error('You cannot create this meeting, please refer Delegates to the Members'' Portal');


        if Code = '' then begin
            MembNoSeries.Get;
            MembNoSeries.TestField(MembNoSeries."Delegate Minutes Nos.");
            //NoSeriesMgtInitSeries(MembNoSeries."Delegate Minutes Nos.", xRec."No. Series", 0D, Code, "No. Series");
            "Created By" := UserId;
            "Created Date" := Today;
        end;
    end;

    var
        MembNoSeries: Record "Banking No Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        DelegateRegion: Record "Delegate Region";
        Err0001: Label 'You cannot make payment for a month in future.';
        DelegatesMeetingAttendees: Record "Delegates Meeting Attendees";
        StatusChangePermissions: Record "Status Change Permissions.";
}

