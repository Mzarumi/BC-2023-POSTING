#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185446 "HR Leave Year - Close"
{
    TableNo = 52185535;

    trigger OnRun()
    begin
        AccountingPeriod.Copy(Rec);
        Code;
        Rec := AccountingPeriod;
    end;

    var
        Text001: label 'You must create a new fiscal year before you can close the old year.';
        Text002: label 'This function closes the fiscal year from %1 to %2. ';
        Text003: label 'Once the fiscal year is closed it cannot be opened again, and the periods in the fiscal year cannot be changed.\\';
        Text004: label 'Do you want to close the fiscal year?';
        LeaveTypes: Record 52185531;
        LeaveLedgerEntries2: Record 52185537;
        DaystoCarryOver: Decimal;
        LeaveBalance: Decimal;
        Employees: Record 52185650;
        AccountingPeriod: Record 52185535;
        AccountingPeriod2: Record 52185535;
        AccountingPeriod3: Record 52185535;
        FiscalYearStartDate: Date;
        FiscalYearEndDate: Date;
        LeaveLedgerEntries: Record 52185537;
        HRJournalBatch: Record 52185534;
        HRSetup: Record 52185550;
        HRJournalLine: Record 52185544;
        "LineNo.": Integer;
        Txt006: label 'There are no Leave Type Defined as Annual in the Leave Types';
        HrCalendar: Record 52185551;
        CalCode: Code[20];
        Ltype: Code[10];

    local procedure "Code"()
    var
        Yr: Code[10];
    begin
        begin
            AccountingPeriod2.SetRange(Closed, false);
            AccountingPeriod2.Find('-');

            FiscalYearStartDate := AccountingPeriod2."Starting Date";
            //error(format(FiscalYearStartDate));
            AccountingPeriod := AccountingPeriod2;
            AccountingPeriod.TestField("New Fiscal Year", true);

            AccountingPeriod2.SetRange("New Fiscal Year", true);
            if AccountingPeriod2.Find('>') then begin
                //error(format(AccountingPeriod2."Starting Date"));
                //Set the fiscal year end date to be the 1st Day of the Next Month
                FiscalYearEndDate := CalcDate('<-1D>', AccountingPeriod2."Starting Date");
                //error(format(FiscalYearEndDate));

                AccountingPeriod3 := AccountingPeriod2;
                AccountingPeriod2.SetRange("New Fiscal Year");
                AccountingPeriod2.Find('<');
            end else
                Error(Text001);

            if not
               Confirm(
                 Text002 +
                 Text003 +
                 Text004, false,
                 FiscalYearStartDate, FiscalYearEndDate)
            then
                exit;

            AccountingPeriod.Reset;

            AccountingPeriod.SetRange("Starting Date", FiscalYearStartDate, AccountingPeriod2."Starting Date");
            AccountingPeriod.ModifyAll(Closed, true);

            AccountingPeriod.SetRange("Starting Date", FiscalYearStartDate, AccountingPeriod3."Starting Date");
            AccountingPeriod.ModifyAll("Date Locked", true);

            AccountingPeriod.Reset;
        end;
        //Mark Ledger Entries for that Period as Closed
        LeaveLedgerEntries.Reset;
        LeaveLedgerEntries.SetRange(LeaveLedgerEntries."Posting Date", FiscalYearStartDate, AccountingPeriod3."Starting Date");//"Leave Start Date"
        if LeaveLedgerEntries.FindSet then begin
            repeat
                LeaveLedgerEntries.Closed := true;
                LeaveLedgerEntries.Modify;
            until LeaveLedgerEntries.Next = 0;
        end;

        //Carry Forward Leave Balances
        HRJournalBatch.Reset;
        HRSetup.Get;
        HRSetup.TestField(HRSetup."Default Leave Posting Template");
        HRSetup.TestField(HRSetup."Positive Leave Posting Batch");

        HRJournalBatch.Get(HRSetup."Default Leave Posting Template", HRSetup."Positive Leave Posting Batch");

        //Check whether Journal Line has any entries
        HRJournalLine.Reset;
        HRJournalLine.SetRange(HRJournalLine."Journal Template Name", HRSetup."Default Leave Posting Template");
        HRJournalLine.SetRange(HRJournalLine."Journal Batch Name", HRSetup."Positive Leave Posting Batch");
        if HRJournalLine.Find('-') then
            HRJournalLine.DeleteAll;

        "LineNo." := 0;


        //Get employees whose balances to carry over
        Employees.Reset;
        Employees.SetRange(Employees.Status, Employees.Status::Active);
        if Employees.Find('-') then begin

            repeat
                LeaveBalance := 0;
                DaystoCarryOver := 0;
                LeaveLedgerEntries2.Reset;
                LeaveLedgerEntries2.SetRange(LeaveLedgerEntries2."Posting Date", FiscalYearStartDate, AccountingPeriod3."Starting Date");//"Leave Start Date"
                LeaveLedgerEntries2.SetRange(LeaveLedgerEntries2."Staff No.", Employees."No.");
                LeaveLedgerEntries2.SetFilter(LeaveLedgerEntries2."Leave Type", ('%1|%2|%3'), 'LTY01', 'LTY02', 'LTY06');
                //LeaveLedgerEntries2.SETRANGE(LeaveLedgerEntries2."Is For Annual Leave",TRUE);
                if LeaveLedgerEntries2.FindSet then begin
                    Ltype := LeaveLedgerEntries2."Leave Type";
                    repeat
                        LeaveBalance := LeaveBalance + LeaveLedgerEntries2."No. of days";
                    until LeaveLedgerEntries2.Next = 0;
                    //MESSAGE('Leave Bal %1 ',LeaveBalance);

                    //Get Maximum Days to Carry Over
                    LeaveTypes.Reset;
                    LeaveTypes.SetRange(LeaveTypes.Code, Ltype);
                    LeaveTypes.SetRange(LeaveTypes."Is Annual Leave", true);
                    if LeaveTypes.Find('-') then begin
                        if LeaveTypes."Carry Forward Allowed" = true then begin
                            if LeaveBalance > LeaveTypes."Max Carry Forward Days" then
                                DaystoCarryOver := LeaveTypes."Max Carry Forward Days"
                            else
                                DaystoCarryOver := LeaveBalance;
                        end;
                    end
                    else
                        Error(Txt006);

                end;

                if DaystoCarryOver < 0 then
                    DaystoCarryOver := 0;

                HrCalendar.Reset;
                HrCalendar.SetRange(HrCalendar."Current Leave Calendar", true);
                if HrCalendar.Find('-') then
                    CalCode := HrCalendar."Calendar Code";

                Yr := Format(Date2dmy(Today, 3));
                if CalCode <> Yr then Error('Please create the new year calendar before closing the period');

                //Populate Journal Lines
                "LineNo." := "LineNo." + 1000;

                HRJournalLine.Init;
                HRJournalLine."Journal Template Name" := HRSetup."Default Leave Posting Template";
                HRJournalLine."Journal Batch Name" := HRSetup."Positive Leave Posting Batch";
                HRJournalLine."Line No." := "LineNo.";
                HRJournalLine."Leave Calendar Code" := CalCode; //FORMAT(AccountingPeriod3."Starting Date");
                HRJournalLine."Document No." := Format(AccountingPeriod3."Starting Date");
                HRJournalLine."Staff No." := Employees."No.";
                HRJournalLine.Validate(HRJournalLine."Staff No.");
                HRJournalLine."Posting Date" := Today;
                HRJournalLine."Leave Entry Type" := HRJournalLine."leave entry type"::Positive;
                HRJournalLine."Leave Approval Date" := Today;
                HRJournalLine.Description := Format(AccountingPeriod3."Starting Date") + ' B/F';
                HRJournalLine."Leave Type" := Ltype;//LeaveTypes.Code;
                HRJournalLine."No. of Days" := DaystoCarryOver;

                HRJournalLine.Insert(true);

            until Employees.Next = 0;

            //Post Journal
            HRJournalLine.Reset;
            HRJournalLine.SetRange("Journal Template Name", HRSetup."Default Leave Posting Template");
            HRJournalLine.SetRange("Journal Batch Name", HRSetup."Positive Leave Posting Batch");
            if HRJournalLine.Find('-') then begin
                Codeunit.Run(Codeunit::"HR Leave Jnl.-Post", HRJournalLine);
            end;

        end;

        //END //ELSE
        //ERROR(Txt002);
        //END;
    end;


    procedure fnLeavebalance(lvApplicationcode: Code[10]; lvLeavetype: Code[10]; lvStaffno: Code[10]; lvBalance: Decimal)
    var
        lvLeavebalance: Record 52185650;
        HRLeaveTypes: Record 52185531;
    begin
        /*IF Balance = 0 THEN EXIT;
        WITH fnLeavebalance DO BEGIN
            INIT;
            "No.":= Staffno;
            "Transaction Code" := TCode;
            "Group Text" := TGroup;
            "Transaction Name" := Description;
            INSERT;
          //Update the prEmployee Transactions  with the Amount
           fnLeavebalance( "No.","Transaction Code",Amount,"Period Month","Period Year","Payroll Period");
        END;
        
        
        lvLeavebalance.RESET;
        lvLeavebalance.SETRANGE(lvLeavebalance."No.",lvStaffno);
        lvLeavebalance.SETRANGE(lvLeavebalance."Leave Type Filter",lvLeavetype);
        
        IF lvLeavebalance.FIND('-') THEN BEGIN
        IF lvLeavebalance."Leave Balance" >=  HRLeaveTypes."Max Carry Forward Days" THEN BEGIN
        lvLeavebalance."Reimbursed Leave Days":=HRLeaveTypes."Max Carry Forward Days";
        END ELSE IF
        lvLeavebalance."Leave Balance" < HRLeaveTypes."Max Carry Forward Days" THEN
        lvLeavebalance."Reimbursed Leave Days":=lvLeavebalance."Leave Balance";
        lvLeavebalance.MODIFY;
        
        
        SETFILTER("Leave Type Filter","HR Employees".GETFILTER("HR Employees"."Leave Type Filter"));
        
        HRLeaveTypes.GET("HR Employees".GETFILTER("Leave Type Filter"));
        
        VALIDATE("Allocated Leave Days");
        
        IF "HR Employees"."Leave Balance" >=  HRLeaveTypes."Max Carry Forward Days" THEN BEGIN
        "HR Employees"."Reimbursed Leave Days":=HRLeaveTypes."Max Carry Forward Days";
        END ELSE IF
        "HR Employees"."Leave Balance" < HRLeaveTypes."Max Carry Forward Days" THEN
        "HR Employees"."Reimbursed Leave Days":="HR Employees"."Leave Balance";
        "HR Employees".MODIFY;
        
        END;
          */

    end;
}
