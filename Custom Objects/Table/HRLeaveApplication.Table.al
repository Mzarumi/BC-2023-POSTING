table 52185532 "HR Leave Application"
{
    //DrillDownPageID = "HR Leave Applications History";
    //LookupPageID = "HR Leave Applications History";

    fields
    {
        field(1; "Application Code"; Code[20])
        {

            trigger OnValidate()
            begin
                //TEST IF MANUAL NOs ARE ALLOWED
                if "Application Code" <> xRec."Application Code" then begin
                    HRSetup.Get;
                    //NoSeriesMgtTestManual(HRSetup."Leave Application Nos.");
                    "No series" := '';
                end;
            end;
        }
        field(3; "Leave Type"; Code[30])
        {
            TableRelation = "HR Leave Types".Code WHERE(Active = FILTER(true));

            trigger OnValidate()
            begin
                HRLeaveTypes.Reset;
                HRLeaveTypes.SetRange(HRLeaveTypes.Code, "Leave Type");
                if HRLeaveTypes.Find('-') then begin
                    HREmp.Reset;
                    HREmp.SetRange(HREmp."No.", "Applicant Staff No.");
                    HREmp.SetRange(HREmp.Gender, HRLeaveTypes.Gender);
                    if HREmp.Find('-') then
                        exit
                    else
                        if HRLeaveTypes.Gender <> HRLeaveTypes.Gender::Both then
                            Error('This leave type is restricted to the ' + Format(HRLeaveTypes.Gender) + ' gender');
                end;
                "Days Applied" := 0;
            end;
        }
        field(4; "Days Applied"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                TestField("Leave Type");
                if ("Days Applied" <> 0) and ("Start Date" <> 0D) then begin
                    // "Return Date" := DetermineLeaveReturnDate("Start Date", "Days Applied");
                    // "End Date" := DeterminethisLeaveEndDate("Return Date");

                    if Date2DMY(Today, 3) < Date2DMY("End Date", 3) then
                        Error('Leave appllication must be done within the current year %1', Format(Date2DMY(Today, 3)));
                    Modify;
                end;
                if "Days Applied" >= 15 then "Request Leave Allowance" := true;
                if "Days Applied" < 15 then "Request Leave Allowance" := false;


                if "Days Applied" < 1 then Error('Days applied cannot be less than 1');
            end;
        }
        field(5; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                //IF "Start Date"<TODAY THEN ERROR('You cannot postdate your application. Please contact the HR/IT Department');

                if "Start Date" = 0D then begin
                    "Return Date" := 0D;
                    "End Date" := 0D;
                end else begin
                    // if DetermineIfIsNonWorking("Start Date") = true then begin
                    //     Error('Start date must be a working day');
                    // end;
                    Validate("Days Applied");
                end;



                //check for overlap
                HRLeaveApp.Reset;
                HRLeaveApp.SetRange(HRLeaveApp."Applicant Staff No.", "Applicant Staff No.");
                HRLeaveApp.SetRange(HRLeaveApp.Status, HRLeaveApp.Status::Approved);
                if HRLeaveApp.Find('-') then begin
                    // REPEAT
                    // IF "Start Date"<HRLeaveApp."Return Date" THEN
                    //   ERROR('You already have an active leave application!');
                    //UNTIL HRLeaveApp.NEXT=0;
                end;
            end;
        }
        field(6; "Return Date"; Date)
        {
            Caption = 'Return Date';
            Editable = false;
        }
        field(7; "Application Date"; Date)
        {
        }
        field(12; Status; Option)
        {
            Editable = false;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;

            trigger OnValidate()
            begin
                if Status = Status::Approved then begin
                    if Date2DMY(Today, 3) < Date2DMY("Return Date", 3) then
                        Error('Leave appllication must be done within the current year %1', Format(Date2DMY(Today, 3)));
                    intEntryNo := 0;

                    HRLeaveEntries.Reset;
                    HRLeaveEntries.SetRange(HRLeaveEntries."Entry No.");
                    if HRLeaveEntries.Find('-') then intEntryNo := HRLeaveEntries."Entry No.";

                    intEntryNo := intEntryNo + 1;
                    HRLeaveEntries.Init;
                    HRLeaveEntries."Entry No." := intEntryNo;
                    HRLeaveEntries."Staff No." := "Applicant Staff No.";
                    HRLeaveEntries."Staff Name" := Names;
                    HRLeaveEntries."Posting Date" := Today;
                    HRLeaveEntries."Leave Entry Type" := HRLeaveEntries."Leave Entry Type"::Negative;
                    HRLeaveEntries."Leave Approval Date" := "Application Date";
                    HRLeaveEntries."Document No." := "Application Code";
                    HRLeaveEntries."External Document No." := "Applicant Staff No.";
                    HRLeaveEntries."Job ID" := "Job Tittle";
                    HRLeaveEntries."No. of days" := "Days Applied";
                    HRLeaveEntries."Leave Start Date" := "Start Date";
                    HRLeaveEntries."Leave Posting Description" := 'Leave';
                    HRLeaveEntries."Leave End Date" := "End Date";
                    HRLeaveEntries."Leave Return Date" := "Return Date";
                    HRLeaveEntries."User ID" := "Applicant User ID";
                    HRLeaveEntries."Leave Type" := "Leave Type";
                    HRLeaveEntries.Insert;
                end;

                // if Status = Status::Approved then
                //  // NotifyReliever
            end;
        }
        field(15; "Applicant Comments"; Text[250])
        {
        }
        field(17; "No series"; Code[30])
        {
        }
        field(18; Gender; Option)
        {
            Editable = false;
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(28; Selected; Boolean)
        {
        }
        field(31; "Current Balance"; Decimal)
        {
            FieldClass = Normal;
        }
        field(32; Posted; Boolean)
        {
        }
        field(33; "Posted By"; Text[250])
        {
        }
        field(34; "Date Posted"; Date)
        {
        }
        field(35; "Time Posted"; Time)
        {
        }
        field(36; Reimbursed; Boolean)
        {
        }
        field(37; "Days Reimbursed"; Decimal)
        {
        }
        field(3900; "End Date"; Date)
        {
            Editable = true;
        }
        field(3901; "Total Taken"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(3921; "E-mail Address"; Text[60])
        {
            Editable = false;
            ExtendedDatatype = EMail;
        }
        field(3924; "Entry No"; Integer)
        {
        }
        field(3929; "Start Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(3936; "Cell Phone Number"; Integer)
        {
            // ExtendedDatatype = PhoneNo;
            NotBlank = true;
        }
        field(3937; "Request Leave Allowance"; Boolean)
        {
        }
        field(3939; Picture; BLOB)
        {
        }
        field(3940; Names; Text[100])
        {
        }
        field(3942; "Leave Allowance Entittlement"; Boolean)
        {
        }
        field(3943; "Leave Allowance Amount"; Decimal)
        {
        }
        field(3945; "Details of Examination"; Text[200])
        {
        }
        field(3947; "Date of Exam"; Date)
        {
        }
        field(3949; Reliever; Code[50])
        {
            // TableRelation = "HR Employees"."No." WHERE(Status = CONST(Active),
            //                                             "Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
            //                                             "Global Dimension 2 Code" = FIELD("Global Dimension 2 Code"));

            trigger OnValidate()
            begin
                if Reliever = "Applicant Staff No." then
                    Error('Employee cannot relieve him/herself');

                if HREmp.Get(Reliever) then begin
                    "Reliever Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                end else begin
                    "Reliever Name" := '';
                end;
            end;
        }
        field(3950; "Reliever Name"; Text[100])
        {
        }
        field(3952; Description; Text[30])
        {
        }
        field(3955; "Supervisor Email"; Text[50])
        {
        }
        field(3956; "Number of Previous Attempts"; Text[200])
        {
        }
        field(3958; "Job Tittle"; Text[50])
        {
        }
        field(3959; "Applicant User ID"; Code[50])
        {
        }
        field(3961; "Applicant Staff No."; Code[20])
        {
            TableRelation = "HR Employees"."No.";
        }
        field(3962; "Applicant Supervisor"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(3969; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility CenterBR".Code WHERE(Code = FILTER(<> ''));
        }
        field(3970; "Approved days"; Integer)
        {

            trigger OnValidate()
            begin
                if "Approved days" > "Days Applied" then
                    Error(TEXT001);
            end;
        }
        field(3971; Attachments; Integer)
        {
            Editable = false;
        }
        field(3972; Emergency; Boolean)
        {
            Description = 'This is used to ensure one can apply annual leave which is emergency';
        }
        field(3973; "Approver Comments"; Text[200])
        {
        }
        field(3974; "Employee Name"; Text[100])
        {
        }
        field(3975; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                "Global Dimension 1 Name" := '';
                DimValue.Reset;
                DimValue.SetRange(DimValue.Code, "Global Dimension 1 Code");
                if DimValue.Find('-') then begin
                    "Global Dimension 1 Name" := DimValue.Name;
                end;
            end;
        }
        field(3976; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                "Global Dimension 2 Name" := '';
                DimValue.Reset;
                DimValue.SetRange(DimValue.Code, "Global Dimension 2 Code");
                if DimValue.Find('-') then begin
                    "Global Dimension 2 Name" := DimValue.Name;
                end;
            end;
        }
        field(3977; "Global Dimension 1 Name"; Text[60])
        {
            Editable = false;
        }
        field(3978; "Global Dimension 2 Name"; Text[60])
        {
            Editable = false;
        }
        field(3979; Address; Code[50])
        {
        }
        field(3980; "Alternative CellPhone No."; Integer)
        {
        }
        field(3981; "Sent Online"; Boolean)
        {
        }
        field(3982; "Recall Date"; Date)
        {
        }
        field(3983; "New End Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Application Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Application Code", Names)
        {
        }
    }

    trigger OnDelete()
    begin
        //ERROR('Please edit document instead of deleting');
    end;

    trigger OnInsert()
    begin
        //No. Series
        if "Application Code" = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Leave Application Nos.");
            //NoSeriesMgtInitSeries(HRSetup."Leave Application Nos.", xRec."No series", 0D, "Application Code", "No series");
        end;

        if UserId <> ' HARAMBEESACCO\WEBPORTAL' then begin
            HREmp.Reset;
            HREmp.SetRange(HREmp."User ID", UserId);
            if HREmp.Find('-') then begin
                //HREmp.TestField(HREmp."Date Of Join");

                Calendar.Reset;
                Calendar.SetRange("Period Type", Calendar."Period Type"::Month);
                //Calendar.SetRange("Period Start", HREmp."Date Of Join", Today);
                empMonths := Calendar.Count;


                //Populate fields
                UserSetUp.Get(UserId);
                "Applicant Staff No." := HREmp."No.";
                Names := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                Gender := HREmp.Gender;
                "Application Date" := Today;
                "Applicant User ID" := UserId;
                "Job Tittle" := HREmp."Job Title";
                HREmp.CalcFields(HREmp.Picture);
                // "Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
                // "Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
                // "Responsibility Center" := UserSetUp."Responsibility Centre";

                Picture := HREmp.Picture;
                //"Responsibility Center":=HREmp."Responsibility Center";
                //Approver details
                // GetApplicantSupervisor(UserId);

            end else begin
                //ERROR('UserID'+' '+'['+USERID+']'+' has not been assigned to any employee. Please consult the HR officer for assistance')
            end;
        end;




        xRec.Reset;
        xRec.SetRange(xRec."Applicant User ID", UserId);
        xRec.SetRange(xRec.Status, xRec.Status::"Pending Approval");
        // if xRec.Find('-') then
        //ERROR('You your leave application no'+ ' ' +xRec."Application Code"+ 'is still  pending Approval. Kindy Contact the HR department to have it approved first')
        //     BEGIN
        //     // REPEAT
        //        IF "Start Date"<HRLeaveApp."Return Date" THEN
        //          ERROR('You already have an active leave application!');
        //        UNTIL HRLeaveApp.NEXT=0;
        //       END;
    end;

    var
        HRSetup: Record "HR Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        HREmp: Record "HR Employees";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        // SMTP: Codeunit "SMTP Mail";
        HRJournalLine: Record "HR Leave Journal Line";
        "LineNo.": Integer;
        ApprovalComments: Record "Approval Comment Line";
        URL: Text[500];
        sDate: Record Date;
        HRLeaveCal: Record "HR Leave Calendar";
        Customized: Record "HR Leave Calendar Lines";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRJournalBatch: Record "HR Leave Journal Batch";
        TEXT001: Label 'Days Approved cannot be more than applied days';
        HRLeaveEntries: Record "HR Leave Ledger Entries";
        intEntryNo: Integer;
        Calendar: Record Date;
        empMonths: Integer;
        HRLeaveApp: Record "HR Leave Application";
        mWeekDay: Integer;
        empGender: Option Female;
        mMinDays: Integer;
        Text002: Label 'You cannot apply for leave until your are over [%1] months old in the company';
        Text003: Label 'UserID [%1] does not exist in [%2]';
        DimValue: Record "Dimension Value";
        LeaveAllowances: Record "Leave Allowances";
        prVitalSetup: Record "PR Vital Setup Info";
        PRSalCard: Record "PR Salary Card";
        UserSetUp: Record "User Setup";
        HRLeavePeriods: Record "HR Leave Periods";

    //[Scope('Internal')]
    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    begin
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
        // if DetermineIfIncludesNonWorking("Leave Type") = false then begin
        //     fReturnDate := CalcDate('1D', fReturnDate);
        //     if DetermineIfIsNonWorking(fReturnDate) then
        //         varDaysApplied := varDaysApplied + 1
        //     else
        //         varDaysApplied := varDaysApplied;
        //     varDaysApplied := varDaysApplied - 1
        // end
        // else begin
        //     fReturnDate := CalcDate('1D', fReturnDate);
        //     varDaysApplied := varDaysApplied - 1;
        // end;
        until varDaysApplied = 0;
        exit(fReturnDate);
    end;

    //[Scope('Internal')]
    procedure DetermineIfIncludesNonWorking(var fLeaveCode: Code[10]): Boolean
    begin
        if HRLeaveTypes.Get(fLeaveCode) then begin
            if HRLeaveTypes."Inclusive of Non Working Days" = true then
                exit(true);
        end;
    end;

    //[Scope('Internal')]
    procedure DetermineIfIsNonWorking(var bcDate: Date) Isnonworking: Boolean
    begin

        HRLeavePeriods.Reset;
        HRLeavePeriods.SetRange(Closed, false);
        if HRLeavePeriods.Find('-') then begin
            Customized.Reset;
            Customized.SetRange(Customized.Date, bcDate);
            Customized.SetRange(Code, HRLeavePeriods."Period Code");
            if Customized.Find('-') then begin
                if Customized."Non Working" = true then
                    exit(true)
                else
                    exit(false);
            end;
        end


        /*
        Customized.RESET;
        Customized.SETRANGE(Customized.Date,bcDate);
        IF Customized.FIND('-') THEN BEGIN
            IF Customized."Non Working" = TRUE THEN
            EXIT(TRUE)
            ELSE
            EXIT(FALSE);
        END;
        */

    end;

    //[Scope('Internal')]
    procedure DeterminethisLeaveEndDate(var fDate: Date) fEndDate: Date
    begin
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('-1D', fEndDate);
            while (ReturnDateLoop) do begin
                // if DetermineIfIsNonWorking(fEndDate) then
                //     fEndDate := CalcDate('-1D', fEndDate)
                // else
                //     ReturnDateLoop := false;
            end
        end;
        exit(fEndDate);
    end;

    //[Scope('Internal')]
    procedure CreateLeaveLedgerEntries()
    begin
        //GET OPEN LEAVE PERIOD
        HRLeaveCal.Reset;
        HRLeaveCal.SetRange(HRLeaveCal."Current Leave Calendar", true);
        HRLeaveCal.Find('-');

        HRJournalBatch.Reset;
        HRSetup.Get;
        HRSetup.TestField(HRSetup."Default Leave Posting Template");
        HRSetup.TestField(HRSetup."Negative Leave Posting Batch");

        HRJournalBatch.Get(HRSetup."Default Leave Posting Template", HRSetup."Negative Leave Posting Batch");

        //POPULATE JOURNAL LINES
        HRJournalLine.Reset;
        HRJournalLine.SetRange(HRJournalLine."Journal Template Name", HRSetup."Default Leave Posting Template");
        HRJournalLine.SetRange(HRJournalLine."Journal Batch Name", HRSetup."Negative Leave Posting Batch");
        if not HRJournalLine.Find('-') then
            HRJournalLine."Line No." := 1000
        else
            HRJournalLine.DeleteAll;
        HRJournalLine."Line No." := HRJournalLine."Line No." + 1000;

        "LineNo." := HRJournalLine."Line No.";

        HRJournalLine.Init;
        HRJournalLine."Journal Template Name" := HRSetup."Default Leave Posting Template";
        HRJournalLine."Journal Batch Name" := HRSetup."Negative Leave Posting Batch";
        HRJournalLine."Line No." := "LineNo.";
        HRJournalLine."Leave Calendar Code" := HRLeaveCal."Calendar Code";
        HRJournalLine."Document No." := "Application Code";
        HRJournalLine."Staff No." := "Applicant Staff No.";
        HRJournalLine.Validate(HRJournalLine."Staff No.");
        HRJournalLine."Posting Date" := Today;
        HRJournalLine."Leave Entry Type" := HRJournalLine."Leave Entry Type"::Negative;
        HRJournalLine."Leave Approval Date" := Today;
        HRJournalLine.Description := 'Leave Taken [' + "Application Code" + ']';
        HRJournalLine."Leave Type" := "Leave Type";
        HRJournalLine."Leave Period Start Date" := HRLeaveCal."Start Date";
        HRJournalLine."Leave Period End Date" := HRLeaveCal."End Date";
        HRJournalLine."No. of Days" := "Days Applied";

        HRJournalLine.Insert(true);

        //Post Journal
        HRJournalLine.Reset;
        HRJournalLine.SetRange("Journal Template Name", HRSetup."Default Leave Posting Template");
        HRJournalLine.SetRange("Journal Batch Name", HRSetup."Negative Leave Posting Batch");
        if HRJournalLine.Find('-') then begin
            // CODEUNIT.Run(CODEUNIT::"HR Leave Jnl.-Post", HRJournalLine);
            //Notify Leave Applicant

            // NotifyApplicant;
            // NotifyReliever;

            // if ("Days Applied" >= 5) and ("Days Applied" < 15) then
            //     NotifyICT;

            // if "Days Applied" >= 15 then begin
            //     NotifyICT;
            //     NotifyHR;
            // end;



        end;
        //Mark document as posted
        Posted := true;
        "Posted By" := UserId;
        "Date Posted" := Today;
        "Time Posted" := Time;
        Modify;




        //Insert into Leave allowance table
        if "Request Leave Allowance" = true then begin
            prVitalSetup.Reset;
            prVitalSetup.Get;
            //Mandatory fields
            // prVitalSetup.TESTFIELD(prVitalSetup."Leave Allowance Percentage");
            // prVitalSetup.TESTFIELD(prVitalSetup."Leave Allowance Based On");
            // prVitalSetup.TESTFIELD(prVitalSetup."Max. Leave Allowance");

            if prVitalSetup."Leave Allowance Based On" = prVitalSetup."Leave Allowance Based On"::"Basic Pay" then          //Based on BPAY
            begin
                //Get Basic Pay
                PRSalCard.Reset;
                if not PRSalCard.Find('-') then begin
                    Error('Enter BPAY for Staff');
                end;
            end;

            //Insert entry

            LeaveAllowances.Init;
            LeaveAllowances."Application No." := "Application Code";
            LeaveAllowances."Employee No." := "Applicant Staff No.";
            LeaveAllowances."Employee Name" := Names;
            LeaveAllowances."Start Date" := "Start Date";
            LeaveAllowances."End Date" := "End Date";
            LeaveAllowances."Date Posted" := Today;
            LeaveAllowances.Year := Date2DMY(LeaveAllowances."Date Posted", 3);
            LeaveAllowances.Amount := prVitalSetup."Leave Allowance Percentage" * PRSalCard."Basic Pay";
            //Not Exceed 50000
            if LeaveAllowances.Amount > prVitalSetup."Max. Leave Allowance" then LeaveAllowances.Amount := prVitalSetup."Max. Leave Allowance";

            LeaveAllowances.Insert
        end;
    end;

    //[Scope('Internal')]
    procedure NotifyApplicant()
    begin
        /*//NOTIFY APPLICANT DERRICK
        HREmp.GET("Applicant Staff No.");
        HREmp.TESTFIELD(HREmp."Company E-Mail");
        
        HREmailParameters.RESET;
        HREmailParameters.GET(HREmailParameters."Associate With"::"Leave Notifications");
        SMTP.CreateMessage(HREmailParameters."Sender Name",HREmailParameters."Sender Address",HREmp."Company E-Mail",
        HREmailParameters.Subject,'Dear'+' '+ HREmp."First Name" +' '+
        HREmailParameters.Body+' '+"Application Code"+' '+'for'+' '+FORMAT("Days Applied")+' '+'Days starting on'+' '+FORMAT("Start Date")+' '+'and ending on'+' '+FORMAT("End Date")+'.'+ HREmailParameters."Body 2",TRUE);
        SMTP.Send();
        MESSAGE('Leave applicant has been notified successfully');
        */


        HREmp.Get("Applicant Staff No.");
        HREmp.TestField(HREmp."Company E-Mail");
        // SMTP.CreateMessage(
        //                     'HARAMBEE SACCO HRMS',
        //                     'no-reply@harambeesacco.com',
        //                     HREmp."Company E-Mail",
        //                     'Leave Approval Notification',
        //                     '<br>''Dear' + ' ' + HREmp."First Name" +
        //                     '<br>' + 'Your leave application no.' + "Application Code" + '  ' + 'has been fully approved:<br><br>' +
        //                     '<br>Employee No. ' + "Applicant Staff No." + ' - ' + UpperCase(Names) +
        //                     '<br>Application No - ' + "Application Code" +
        //                     '<br>Start Date - ' + Format("Start Date") +
        //                     '<br>End Date - ' + Format("End Date") +
        //                     '<br>Return Date - ' + Format("Return Date") +
        //                     '<br>Days Applied - ' + Format("Days Applied") +
        //                     '<br><br>Kind Regards',
        //                     true
        //                   );
        //  SMTP.AddCC("Supervisor Email");
        //  SMTP.AddCC('fdgdgd');
        //  SMTP.AddAttachment('C:\Leave\'+"Application Code"+'.Excel',"Application Code");


        // SMTP.Send();
        // Message('Leave applicant has been notified successfully');

    end;

    //[Scope('Internal')]
    procedure GetApplicantSupervisor(EmpUserID: Code[50]) SupervisorID: Code[10]
    var
        UserSetup: Record "User Setup";
        UserSetup2: Record "User Setup";
        HREmp2: Record "HR Employees";
    begin
        SupervisorID := '';

        UserSetup.Reset;
        if UserSetup.Get(EmpUserID) then begin
            UserSetup.TestField(UserSetup."Approver ID");

            //Get supervisor e-mail
            UserSetup2.Reset;
            if UserSetup2.Get(UserSetup."Approver ID") then begin
                UserSetup2.TestField(UserSetup2."E-Mail");
                "Applicant Supervisor" := UserSetup."Approver ID";
                "Supervisor Email" := UserSetup2."E-Mail";
            end;

        end else begin
            Error(Text003, EmpUserID, UserSetup.TableCaption);
        end;
    end;

    //[Scope('Internal')]
    procedure NotifyReliever()
    begin
        HREmp.Get(Reliever);
        HREmp.TestField(HREmp."Company E-Mail");

        HREmailParameters.Reset;
        HREmailParameters.Get(HREmailParameters."Associate With"::"Leave Notifications");
        // SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HREmp."Company E-Mail",

        // 'Leave Reliever Notification', 'Dear' + '<br>' + HREmp."First Name" +
        // 'You are hereby notified that you''ve' + ' ' + 'been appointed as a Leave Reliever for' + ' ' + Names + ' ' + 'for a period of' + ' ' + Format("Days Applied") +
        // ' ' + 'days' + ' ' + 'from' + ' ' + Format("Start Date") + ' ' + 'to' + ' ' + Format("End Date") + '.' + ' ' + 'Please ensure that you understand the responsibilities given to you for that duration.', true);
        // SMTP.Send();
        // Message('Leave Reliever has been notified successfully');
        //DERRICK NOTIFY RELIVER.
    end;

    //[Scope('Internal')]
    procedure NotifyICT()
    begin
        //HREmp.GET(Reliever);
        //HREmp.TESTFIELD(HREmp."Company E-Mail");

        HREmailParameters.Reset;
        HREmailParameters.Get(HREmailParameters."Associate With"::"Leave Notifications");
        // SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HREmailParameters."ICT mail",

        // 'Leave Notification', 'Dear' + '<br>' + 'ICT Department' + ' ' + ' <br>' +
        // 'You are hereby notified that the leave application for' + ' ' + Names + ' ' + ' has been fully approved for' + ' ' + Format("Days Applied") +
        // ' ' + 'days' + ' ' + 'from' + ' ' + Format("Start Date") + ' ' + 'to' + ' ' + Format("End Date") + '.' + ' ', true);
        // SMTP.Send();
        Message('ICT has been notified successfully');
        //DERRICK NOTIFY RELIVER.
    end;

    //[Scope('Internal')]
    procedure NotifyHR()
    begin
        //HREmp.GET(Reliever);
        //HREmp.TESTFIELD(HREmp."Company E-Mail");

        HREmailParameters.Reset;
        HREmailParameters.Get(HREmailParameters."Associate With"::"Leave Notifications");
        // sSMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", HREmailParameters."HR Email",

        // 'Leave Notification', 'Dear' + '<br>' + 'HR Department' + ' ' + ' <br>' +
        // 'You are hereby notified that' + ' ' + Names + ' ' + ' has been fully approved for' + ' ' + Format("Days Applied") +
        // ' ' + 'days' + ' ' + 'from' + ' ' + Format("Start Date") + ' ' + 'to' + ' ' + Format("End Date") + ' and hence qualifies for leave allowance.' + ' ', true);
        // SMTP.Send();
        Message('HR has been notified successfully');
        //DERRICK NOTIFY RELIVER.
    end;

    //[Scope('Internal')]
    procedure ModifyUserDate()
    var
        User: Record User;
    begin
        User.Reset;
        User.SetRange("User Name", "Applicant User ID");
        if User.Find('-') then begin
            if "Days Applied" > 3 then
                User."Expiry Date" := CreateDateTime("Start Date", 0T);
            User.Modify
        end
    end;
}

