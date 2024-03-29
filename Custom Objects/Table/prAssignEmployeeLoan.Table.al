table 52185659 prAssignEmployeeLoan
{

    fields
    {
        field(1; "Employee Code"; Code[30])
        {
            TableRelation = "HR Employees"."No.";

            trigger OnValidate()
            begin
                if HREmp.Get("Employee Code") then
                    "Employee Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name"
                else
                    "Employee Name" := '';
            end;
        }
        field(2; "Transaction Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";

            trigger OnValidate()
            begin
                objPeriod.Reset;
                objPeriod.SetRange(objPeriod.Closed, false);
                if objPeriod.Find('-') then begin
                    CurrentYr := objPeriod."Period Year";
                    CurrentMonth := objPeriod."Period Month";
                end;



                if Transcode.Get("Transaction Code") then begin
                    if Transcode."IsActing Allowance" = true then begin
                        EmployeeTrans.Reset;
                        EmployeeTrans.SetRange(EmployeeTrans."Employee Code", "Employee Code");
                        EmployeeTrans.SetRange(EmployeeTrans."Transaction Code", "Transaction Code");
                        if EmployeeTrans.Find('-') then begin
                            repeat
                                if EmployeeTrans."Period Year" = CurrentYr then begin
                                    MonthName := Format(EmployeeTrans."Payroll Period", 0, '<Month Text>');
                                    //ERROR(MonthName);
                                    Error('Employee has already been paid leave allowance in the period of %1.- %2', EmployeeTrans."Payroll Period",
                                           EmployeeTrans."Employee Code");
                                end;
                            until EmployeeTrans.Next = 0;
                        end;
                    end;
                end;
            end;
        }
        field(3; "Transaction Name"; Text[100])
        {
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; Balance; Decimal)
        {

            trigger OnValidate()
            begin
                "#of Repayments" := 0;
                //IF (Balance > 0) AND ("#of Repayments" > 0) THEN
                //Amount:=Balance/"#of Repayments"
            end;
        }
        field(6; "Original Amount"; Decimal)
        {
        }
        field(7; "Period Month"; Integer)
        {
        }
        field(8; "Period Year"; Integer)
        {
        }
        field(9; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";

            trigger OnValidate()
            begin
                "Period Month" := Date2DMY("Payroll Period", 2);
                "Period Year" := Date2DMY("Payroll Period", 3);
            end;
        }
        field(10; "#of Repayments"; Integer)
        {

            trigger OnValidate()
            begin
                if (Balance > 0) and ("#of Repayments" > 0) then
                    Amount := Balance / "#of Repayments";
                //"End Date":="Start Date"+"#of Repayments";

                Transcode.Get("Transaction Code");
                Error('%1', Transcode."Repayment Method");
            end;
        }
        field(11; Membership; Code[10])
        {
            TableRelation = "prInstitutional Membership"."Institution No";
        }
        field(12; "Reference No"; Text[100])
        {
        }
        field(13; integera; Integer)
        {
        }
        field(14; "Employer Amount"; Decimal)
        {
        }
        field(15; "Employer Balance"; Decimal)
        {
        }
        field(16; "Stop for Next Period"; Boolean)
        {
        }
        field(17; "Amortized Loan Total Repay Amt"; Decimal)
        {
        }
        field(18; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                //"End Date":="Start Date"+"#of Repayments";
                "Start Date Month" := Date2DMY("Start Date", 2);
                if "Start Date Month" = CurrentMonth then
                    Validate("Payroll Period", objPeriod."Date Opened");
            end;
        }
        field(19; "End Date"; Date)
        {
        }
        field(20; "Loan Number"; Code[10])
        {
        }
        field(21; "Payroll Code"; Code[20])
        {
            TableRelation = "prPayroll Type";
        }
        field(22; "No of Units"; Decimal)
        {

            trigger OnValidate()
            begin
                /*IF Transcode.GET("Transaction Code") THEN BEGIN
                IF (Transcode."Transaction Category" = Transcode."Transaction Category"::Overtime) OR
                   (Transcode."Transaction Category" = Transcode."Transaction Category"::Entertainment) THEN BEGIN
                Amount:=0;
                Transcode.TESTFIELD(Transcode.Suspended);
                IF SalCard.GET("Employee Code") THEN BEGIN
                IF SalaryNotches.GET(SalCard."Date of Birth",SalCard."Scheme Code 2") THEN BEGIN
                IF Transcode.Suspended = Transcode.Suspended::"2" THEN
                Amount:=SalaryNotches."Hourly Rate"*2*"No of Units"
                ELSE IF Transcode.Suspended = Transcode.Suspended::"3" THEN
                Amount:=SalaryNotches."Hourly Rate"*3*"No of Units"
                ELSE
                Amount:=SalaryNotches."Hourly Rate"*1.5*"No of Units";
                
                END;
                END;
                END;
                END;
                */

            end;
        }
        field(23; Suspended; Boolean)
        {
        }
        field(24; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(38; "IsCoop/LnRep"; Boolean)
        {
            CalcFormula = Lookup("PR Transaction Codes"."IsCoop/LnRep" WHERE("Transaction Code" = FIELD("Transaction Code")));
            Description = 'to be able to report the different coop contributions -Dennis';
            FieldClass = FlowField;
        }
        field(101; Status; Option)
        {
            OptionCaption = 'Pending,Pending Approval,Released,Processed,Cancelled';
            OptionMembers = Pending,"Pending Approval",Approved,Posted,Cancelled;
        }
        field(102; "Employee Name"; Text[100])
        {
        }
        field(103; "Start Date Month"; Integer)
        {
        }
        field(323; "Payroll Type"; Option)
        {
            //CalcFormula = Lookup("HR Employees"."Payroll Type" WHERE("No." = FIELD("Employee Code")));
            FieldClass = FlowField;
            OptionCaption = 'General,Directors';
            OptionMembers = General,Directors;
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Transaction Code", "Period Month", "Period Year", "Payroll Period", "Reference No")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Employee Code", "Transaction Code", "Period Month", "Period Year", Suspended)
        {
        }
    }

    fieldgroups
    {
    }

    var
        Transcode: Record "PR Transaction Codes";
        EmployeeTrans: Record "PR Employee Transactions";
        MonthName: Text[100];
        SalCard: Record "PR Salary Card";
        SalaryNotches: Record "Salary Notch";
        CurrentYr: Integer;
        objPeriod: Record "PR Payroll Periods";
        HREmp: Record "HR Employees";
        CurrentMonth: Integer;

    //[Scope('Internal')]
    procedure getloantype()
    begin
        Transcode.Get("Transaction Code");
        if Transcode."Repayment Method" = Transcode."Repayment Method"::Amortized then
            Amount := Round((Transcode."Interest Rate" / 12 / 100) / (1 - Power((1 + (Transcode."Interest Rate" / 12 / 100)), -"#of Repayments")) * Balance, 0.05, '>');
        Error('%1', Amount);
    end;
}

