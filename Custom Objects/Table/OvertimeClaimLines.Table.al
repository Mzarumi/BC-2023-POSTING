table 52185937 "Overtime Claim Lines"
{
    //DrillDownPageID = "Overtime Claim Lines";
    //LookupPageID = "Overtime Claim Lines";

    fields
    {
        field(10; "Claim Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(20; "Claim No"; Code[10])
        {
        }
        field(30; Date; Date)
        {
        }
        field(40; "Work Description/Reason"; Text[30])
        {

            trigger OnValidate()
            begin
                TestField(Date);
            end;
        }
        field(50; "No. of Hours"; Decimal)
        {
        }
        field(60; Amount; Decimal)
        {
        }
        field(61; "Overtime Type"; Option)
        {
            OptionCaption = ' ,Weekdays,Weekends and Holidays';
            OptionMembers = " ",Weekdays,"Weekends and Holidays";
        }
        field(62; "Time From"; Time)
        {

            trigger OnValidate()
            begin
                TestField(Date);
                TestField("Overtime Type");

                if ("Time To" <> 0T) and ("Time From" <> 0T) then
                    TimeDifference := "Time To" - "Time From";

                if TimeDifference <> 0 then
                    "No. of Hours" := TimeDifference / 3600000;
            end;
        }
        field(63; "Time To"; Time)
        {

            trigger OnValidate()
            begin
                TestField(Date);
                TestField("Overtime Type");

                if "Time To" < "Time From" then
                    Error('Time to can not be less than the time from enter right time');

                if "Time To" = "Time From" then
                    Error('Time to can not beequal to time from enter right time');
                if ("Time To" <> 0T) and ("Time From" <> 0T) then
                    TimeDifference := "Time To" - "Time From";
                if TimeDifference <> 0 then
                    "No. of Hours" := TimeDifference / 3600000;
            end;
        }
    }

    keys
    {
        key(Key1; "Claim Line No", "Claim No")
        {
            Clustered = true;
            SumIndexFields = "No. of Hours";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        OvertimeHeader.Reset;
        OvertimeHeader.SetRange(OvertimeHeader."Claim No", "Claim No");
        if OvertimeHeader.FindFirst then begin
            if (OvertimeHeader.Status = OvertimeHeader.Status::Approved) or
                (OvertimeHeader.Status = OvertimeHeader.Status::Cancelled) or
                (OvertimeHeader.Status = OvertimeHeader.Status::"Pending Approval") then
                Error('You Cannot Modify this record its status is not Pending');
        end;
    end;

    trigger OnModify()
    begin

        OvertimeHeader.Reset;
        OvertimeHeader.SetRange(OvertimeHeader."Claim No", "Claim No");
        if OvertimeHeader.FindFirst then begin
            if (OvertimeHeader.Status = OvertimeHeader.Status::Approved) or
                (OvertimeHeader.Status = OvertimeHeader.Status::Cancelled) or
                (OvertimeHeader.Status = OvertimeHeader.Status::"Pending Approval") then
                Error('You Cannot Modify this record its status is not Pending');
        end;
    end;

    var
        OvertimeHeader: Record "Overtime Claim Header";
        TimeDifference: Decimal;
}

