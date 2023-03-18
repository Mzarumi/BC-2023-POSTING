#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185840 "HR Leave Balance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Leave Balance.rdlc';

    dataset
    {
        dataitem("HR EMPLOYEES"; "HR EMPLOYEES")
        {
            DataItemTableView = where(Status = filter(Active));
            // RequestFilterFields = "No.", "Global Dimension 1 Code", "Global Dimension 2 Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(FullName_HREmployees; "HR Employees"."Full Name")
            {
            }
            column(No_HREmployees; "HR Employees"."No.")
            {
            }
            column(JobTitle_HREmployees; "HR Employees"."Job Title")
            {
            }
            column(LeaveTypeFilter; LeaveTypeFilter)
            {
            }
            // column(GlobalDimension2Code_HREmployees; "HR Employees"."Global Dimension 2 Code")
            // {
            // }
            // column(GlobalDimension1Code_HREmployees; "HR Employees"."Global Dimension 1 Code")
            // {
            // }
            column(DaysAllocated; DaysAllocated)
            {
            }
            column(DaysTaken; DaysTaken)
            {
            }
            column(LeaveBalance; LeaveBalance)
            {
            }
            column(AppliedFilters; AppliedFilters)
            {
            }
            column(CompInfoName; CompInfo.Name)
            {
            }
            column(r; CompInfo.Address)
            {
            }
            column(CompInfoCity; CompInfo.City)
            {
            }
            column(CompInfoPicture; CompInfo.Picture)
            {
            }
            column(CompInfoEMail; CompInfo."E-Mail")
            {
            }
            column(CompInfoHomePage; CompInfo."Home Page")
            {
            }
            column(Rcount; Rcount)
            {
            }
            column(LeaveName; LeaveName)
            {
            }

            trigger OnAfterGetRecord()
            begin
                //Initialize
                DaysAllocated := 0;
                DaysTaken := 0;
                LeaveBalance := 0;
                Rcount := Rcount + 1;


                //Allocated Leave Days
                HRLeaveLedger.Reset;
                HRLeaveLedger.SetRange(HRLeaveLedger."Staff No.", "HR Employees"."No.");
                HRLeaveLedger.SetRange(HRLeaveLedger."Leave Entry Type", HRLeaveLedger."leave entry type"::Positive);
                HRLeaveLedger.SetRange(HRLeaveLedger."Leave Type", LeaveTypeFilter);
                if HRLeaveLedger.Find('-') then begin
                    HRLeaveLedger.CalcSums(HRLeaveLedger."No. of days");
                    DaysAllocated := HRLeaveLedger."No. of days";
                end;

                //Days Taken
                HRLeaveLedger.Reset;
                HRLeaveLedger.SetRange(HRLeaveLedger."Staff No.", "HR Employees"."No.");
                HRLeaveLedger.SetRange(HRLeaveLedger."Leave Entry Type", HRLeaveLedger."leave entry type"::Negative);
                HRLeaveLedger.SetRange(HRLeaveLedger."Leave Type", LeaveTypeFilter);
                if HRLeaveLedger.Find('-') then begin
                    HRLeaveLedger.CalcSums(HRLeaveLedger."No. of days");
                    DaysTaken := Abs(HRLeaveLedger."No. of days");
                end;

                //Leave Balance
                LeaveBalance := DaysAllocated - DaysTaken;

                if (DaysAllocated = 0) and (DaysTaken = 0) and (LeaveBalance = 0) then CurrReport.Skip;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(LeaveTypeFilter; LeaveTypeFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Type Filter';
                    TableRelation = "HR Leave Types".Code;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        if LeaveTypeFilter = '' then Error('Please select leave type');
        AppliedFilters := LeaveTypeFilter + ' Leave, ' + "HR Employees".GetFilters;

        CompInfo.Get;
        CompInfo.CalcFields(CompInfo.Picture);


        HRLeaveTypes.Reset;
        HRLeaveTypes.SetRange(HRLeaveTypes.Code, LeaveTypeFilter);
        if HRLeaveTypes.Find('-') then begin
            LeaveName := HRLeaveTypes.Description;
        end;
    end;

    var
        LeaveTypeFilter: Code[20];
        HRLeaveLedger: Record 52185537;
        DaysAllocated: Decimal;
        DaysTaken: Decimal;
        LeaveBalance: Decimal;
        AppliedFilters: Text;
        CompInfo: Record "Company Information";
        Rcount: Integer;
        HRLeaveTypes: Record 52185531;
        LeaveName: Text[30];
}
