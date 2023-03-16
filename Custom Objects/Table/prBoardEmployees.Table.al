table 52186196 "prBoard Employees"
{

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin
                if Emp.Get("No.") then begin
                    "First Name" := Emp."First Name";
                    "Middle Name" := Emp."Middle Name";
                    "Last Name" := Emp."Last Name";
                    //"Country Code":=Emp."Country Code";
                    "Department Code" := Emp."Department Code";

                    //Each record should have a costing center
                    /* IF  "Department Code" = '' THEN
                      ERROR('Cost Centre Must be specified under the employee data');
                     */
                    "Project Code" := Emp.Office;
                    "Job Title" := Emp.Position;
                    "Social Security No." := Emp."NSSF No.";
                    "N.H.I.F No" := Emp."NHIF No.";
                    "P.I.N" := Emp."PIN No.";
                    Status := Emp.Status;

                    //Globals applicable to each employee**
                    "HR Setup".Get;
                    "Tax Relief Amount" := "HR Setup"."Tax Relief Amount";
                    "Posting Group" := "HR Setup"."Posting Group";
                    "Pays tax?" := true;


                    // Global Earnings and Deductions
                    LoadEarnings.Reset;
                    LoadDeductions.Reset;

                    // Get first open pay period
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Date Opened";
                    /*
                    //LoadEarnings.SETRANGE(LoadEarnings.Code);
                    LoadEarnings.SETRANGE(LoadEarnings.IsMandatory,TRUE);
                    IF LoadEarnings.FIND('-') THEN BEGIN
                      REPEAT
                            AssMatrix.INIT;
                            AssMatrix."Employee Code":="No.";
                            AssMatrix.Type:=AssMatrix.Type::Payment;
                            AssMatrix.Code:=LoadEarnings.Code;
                            AssMatrix."Payroll Period":=CurrentMonth;
                            AssMatrix.VALIDATE(Code);
                            //AssMatrix.Amount:=LoadEarnings."Total Amount";
                            AssMatrix.Amount:=LoadEarnings."Flat Amount";
                            AssMatrix.VALIDATE(Amount);
                            AssMatrix.INSERT;
                
                      UNTIL LoadEarnings.NEXT = 0;
                    END;
                
                   //LoadDeductions.SETRANGE(LoadDeductions.Code);
                   LoadDeductions.SETRANGE(LoadDeductions.IsMandatory,TRUE);
                   LoadDeductions.SETRANGE(LoadDeductions."Pension Scheme",FALSE); //Nothing related to pensions will b entered here
                   IF LoadDeductions.FIND('-') THEN BEGIN
                      REPEAT
                            AssMatrix.INIT;
                            AssMatrix."Employee No":="No.";
                            AssMatrix.Type:=AssMatrix.Type::Deduction;
                            AssMatrix.Code:=LoadDeductions.Code;
                            AssMatrix."Payroll Period":=CurrentMonth;
                            AssMatrix.VALIDATE(Code);
                            AssMatrix.Amount:=LoadDeductions."Flat Amount";
                            AssMatrix.VALIDATE(Amount);
                            AssMatrix.INSERT;
                
                      UNTIL LoadDeductions.NEXT = 0;
                    END;
                    {Differentiate between Pension and Provident HERE
                      Put here since one cannot contribute both}
                     LoadDeductions.RESET;
                     LoadDeductions.SETRANGE(LoadDeductions.IsMandatory,TRUE);
                     LoadDeductions.SETRANGE(LoadDeductions."Pension Scheme",TRUE);
                    // LoadDeductions.SETRANGE(LoadDeductions.IsStatutoryDeduction,FALSE);
                     IF LoadDeductions.FIND('-') THEN BEGIN
                       ContractType.RESET;
                       ContractType.SETRANGE(ContractType.Contract,Emp."Contract Type");
                       IF ContractType.FIND('-') THEN BEGIN
                          IF ContractType."Pays Pension"=TRUE THEN BEGIN
                           LoadDeductions.SETRANGE(LoadDeductions.IsProvident,FALSE);
                            IF LoadDeductions.FIND('-') THEN BEGIN
                            REPEAT
                
                            AssMatrix.INIT;
                            AssMatrix."Employee No":="No.";
                            AssMatrix.Type:=AssMatrix.Type::Deduction;
                            AssMatrix.Code:=LoadDeductions.Code;
                            AssMatrix."Payroll Period":=CurrentMonth;
                            AssMatrix.VALIDATE(Code);
                            //AssMatrix.Amount:=LoadDeductions."Total Amount";
                            AssMatrix.Amount:=LoadDeductions."Flat Amount";
                            AssMatrix.VALIDATE(Amount);
                            AssMatrix.INSERT;
                            UNTIL LoadDeductions.NEXT=0;
                            END;
                          END ELSE
                          BEGIN
                            //LoadDeductions.SETRANGE(LoadDeductions.IsProvident,TRUE);
                            //IF LoadDeductions.FIND('-') THEN BEGIN
                            REPEAT
                            IF (LoadDeductions.IsProvident=TRUE)OR(LoadDeductions.IsStatutoryDeduction=TRUE)THEN BEGIN
                            AssMatrix.INIT;
                            AssMatrix."Employee No":="No.";
                            AssMatrix.Type:=AssMatrix.Type::Deduction;
                            AssMatrix.Code:=LoadDeductions.Code;
                            AssMatrix."Payroll Period":=CurrentMonth;
                            AssMatrix.VALIDATE(Code);
                            AssMatrix.Amount:=LoadDeductions."Flat Amount";
                            AssMatrix.VALIDATE(Amount);
                            AssMatrix.INSERT;
                            END;
                            UNTIL LoadDeductions.NEXT=0;
                           // END;
                
                         END;
                       END;
                     END;
                */
                end;

            end;
        }
        field(2; "First Name"; Text[30])
        {
        }
        field(3; "Middle Name"; Text[30])
        {
        }
        field(4; "Last Name"; Text[30])
        {
        }
        field(6; "Job Title"; Text[50])
        {
        }
        field(21; "Social Security No."; Text[30])
        {
        }
        field(25; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(31; Status; Option)
        {
            OptionMembers = Active,Inactive,Terminated;

            trigger OnValidate()
            begin
                //EmployeeQualification.SETRANGE("Employee No.","No.");
                //EmployeeQualification.MODIFYALL("Employee Status",Status);
                /*
                IF ("Inactive Date" <> 0D) AND (Status = Status::Inactive) THEN BEGIN "Inactive Date" := 0D; MODIFY; END;
                IF Status = Status::Inactive THEN
                 IF CONFIRM('Are you sure you want to inactivate the Employee - %1',FALSE,"No.") THEN BEGIN
                
                   Ledgers.RESET;
                  Ledgers.SETRANGE(Ledgers.Employee,"No.");
                  Ledgers.SETCURRENTKEY(Employee,"Payroll Period");
                  Ledgers.ASCENDING := FALSE;
                  IF Ledgers.FIND('-') THEN
                  "Inactive Date" := Ledgers."Payroll Period";
                  MODIFY;
                 END;
                 */

            end;
        }
        field(36; "Department Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(37; "Project Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(41; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(42; "Department Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(43; "Project Filter"; Code[10])
        {
            FieldClass = FlowFilter;

        }
        field(47; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(50000; "Pays SSF?"; Boolean)
        {
        }
        field(50001; "Pays tax?"; Boolean)
        {
        }
        field(50002; "Section/Location"; Code[10])
        {

            trigger OnValidate()
            begin
                //IF SalaryGrade.GET("Salary Grade") THEN
                //"Basic Pay":=SalaryGrade."Minimum salary";
                //MaximumPay:=SalaryGrade."Maximum Salary";
            end;
        }
        field(50003; "Basic Pay"; Decimal)
        {

            trigger OnValidate()
            begin
                // Get first open pay period
                PayPeriod.Reset;
                PayPeriod.SetRange(PayPeriod.Closed, false);
                if PayPeriod.Find('-') then
                    CurrentMonth := PayPeriod."Date Opened";
                /*
            IF Employee.GET("No.") THEN  BEGIN
              AssMatrix.SETRANGE(AssMatrix."Employee No","No.");
              AssMatrix.SETRANGE(AssMatrix."Payroll Period",CurrentMonth);

                IF AssMatrix.FIND('-') THEN BEGIN

                 REPEAT
                   IF AssMatrix.Type=AssMatrix.Type::Payment THEN BEGIN

                     Earn.SETRANGE(Earn.Code,AssMatrix.Code);
                     Earn.SETRANGE(Earn."Calculation Method",Earn."Calculation Method"::"% of Basic pay");
                       IF Earn.FIND('-') THEN BEGIN
                         IF Earn."Calculation Method"=Earn."Calculation Method"::"% of Basic pay" THEN BEGIN
                          Amount:=Earn.Percentage/100* Employee."Basic Pay";
                          Employee."Basic Pay":= Amount;
                          MODIFY;
                          AssMatrix.VALIDATE(Code);
                          AssMatrix.MODIFY;
                         END;

                        END;
                   END ELSE BEGIN
                    Ded.SETRANGE(Ded.Code,AssMatrix.Code);
                    Ded.SETRANGE(Ded."Calculation Method",Ded."Calculation Method"::"% of Basic Pay");
                    IF Ded.FIND('-') THEN BEGIN
                         IF Ded."Calculation Method"=Ded."Calculation Method"::"% of Basic Pay" THEN BEGIN
                          Amount:=Ded.Percentage/100* Employee."Basic Pay";
                          Employee."Basic Pay":= Amount;
                          MODIFY;
                          AssMatrix.VALIDATE(Code);
                          AssMatrix.MODIFY;
                         END;

                    END;
                   END;
                    //Cater for AssignBased on Table
                        Ded.SETRANGE(Ded.Code,AssMatrix.Code);
                        Ded.SETRANGE(Ded."Calculation Method",Ded."Calculation Method"::"Based on Table");
                         IF Ded.FIND('-') THEN BEGIN
                         IF Ded."Calculation Method"=Ded."Calculation Method"::"Based on Table" THEN BEGIN
                          MODIFY;
                          AssMatrix.VALIDATE(Code);
                          AssMatrix.MODIFY;
                         END;
                         END;
                   //End Cater for AssignBased on Table

                 UNTIL AssMatrix.NEXT = 0;

                END;
            END;
            //For NIC Global OVertime Hrly Rate

            "HR Setup".GET;
            IF "HR Setup"."Overtime Indicator"<>0 THEN
            "Hourly Rate":=("Basic Pay"/20)/8;


            //For cases where Where based on a table


             "Basic Pay Period Specific":="Basic Pay";
              IF Employee.GET("No.") THEN  BEGIN
              AssMatrix.SETRANGE(AssMatrix."Employee No","No.");
               AssMatrix.SETRANGE(AssMatrix."Payroll Period",CurrentMonth);
              IF  AssMatrix.FIND('-')THEN BEGIN
              REPEAT
                AssMatrix."Basic Pay":="Basic Pay";
                AssMatrix.MODIFY;
               UNTIL  AssMatrix.NEXT=0;
              END;
              END
            //End NIC Global OVertime Hrly Rate
            */

            end;
        }
        field(50004; "Salary Type"; Code[10])
        {
        }
        field(50005; "Paid Overtime?"; Boolean)
        {
        }
        field(50006; "Tax Relief"; Boolean)
        {
        }
        field(50007; "Overtime taxed"; Boolean)
        {
        }
        field(50008; "Agency Car"; Boolean)
        {
        }
        field(50009; "Housed by Employer"; Boolean)
        {
        }
        field(50010; "Employee's Bank"; Code[10])
        {

            trigger OnValidate()
            begin
                /*prBanks.RESET;
                prBanks.SETRANGE(prBanks.code,"Employee's Bank");
                IF prBanks.FIND('-') THEN BEGIN
                "Branch name":=prBanks.Name;
                MODIFY;
                END; */

            end;
        }
        field(50011; "Paying Bank Code"; Code[10])
        {
            TableRelation = "Bank Account";
        }
        field(50012; "Taxable Allowance"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
        }
        field(50013; "Tax Deductible Amount"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
        }
        field(50014; "Employee Type"; Code[10])
        {

        }
        field(50015; "Total Allowances"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Total Deductions"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; Payment; Code[10])
        {
            TableRelation = "prBoard Earnings";
        }
        field(50018; Deduction; Code[10])
        {
            TableRelation = "prBoard Deductions";
        }
        field(50019; "Posting Group"; Code[10])
        {
            NotBlank = true;
            TableRelation = "prEmployee Posting Group";
        }
        field(50020; "Total Savings"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
        }
        field(50021; "Bank Account Number"; Code[20])
        {
        }
        field(50022; "Bank Branch"; Code[20])
        {
        }
        field(50023; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods";
        }
        field(50024; "Opening SSF"; Decimal)
        {
        }
        field(50025; "Opening PAYE"; Decimal)
        {
        }
        field(50026; "Tax Deductible to Date"; Decimal)
        {
            FieldClass = FlowField;
        }
        field(50027; "SSF Employer to Date"; Decimal)
        {
            FieldClass = FlowField;
        }
        field(50028; "Opening Employer SSF"; Decimal)
        {
        }
        field(50029; "Cumm. Basic Pay"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "Tax Relief Amount"; Decimal)
        {
        }
        field(50031; "P.I.N"; Code[20])
        {
        }
        field(50032; "Passport No."; Code[20])
        {
        }
        field(50033; "Cumm. PAYE"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
        }
        field(50034; "Cumm. Net Pay"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
        }
        field(50037; "N.H.I.F No"; Code[20])
        {
        }
        field(50038; "Hourly Rate"; Decimal)
        {
        }
        field(50039; "Daily Rate"; Decimal)
        {
        }
        field(50040; "Pays N.H.I.F"; Boolean)
        {
        }
        field(50041; "Last Modified By"; Code[20])
        {
            Editable = false;
        }
        field(50042; "Gross Cash"; Decimal)
        {
        }
        field(50043; "Debtor Code"; Code[10])
        {
            TableRelation = Customer;
        }
        field(50045; "Benefits-Non Cash"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
        }
        field(50046; "Pay Mode"; Option)
        {
            OptionMembers = Bank,Cash,Cheque,"Bank Transfer";
        }
        field(50047; Housing; Option)
        {
            OptionMembers = Agricultural,Directors,Ordinary;
        }
        field(50048; "Home Savings"; Decimal)
        {
            FieldClass = FlowField;
        }
        field(50049; "Retirement Contribution"; Decimal)
        {
            FieldClass = FlowField;
        }
        field(50050; "Home Ownership Status"; Option)
        {
            OptionMembers = "None","Owner Occupier","Home Savings";
        }
        field(50052; "National ID"; Code[20])
        {
        }
        field(50053; "House Rent"; Decimal)
        {
        }
        field(50054; "Employer Rent"; Boolean)
        {
        }
        field(50055; "Total Quarters"; Decimal)
        {
        }
        field(50056; "Cumulative Quarters"; Decimal)
        {
            FieldClass = FlowField;
        }
        field(50057; BfMpr; Decimal)
        {
            FieldClass = FlowField;
        }
        field(50058; PensionNo; Code[10])
        {
        }
        field(50059; "Salary Scheme Category"; Code[20])
        {
            TableRelation = "prBoard Category";
        }
        field(50060; "Salary Steps"; Code[20])
        {
            TableRelation = "prBoard Salary Steps"."Step Code" WHERE("Category code" = FIELD("Salary Scheme Category"),
                                                                      Level = FIELD(Level));

            trigger OnValidate()
            begin
                if Employee.Get("No.") then
                    if Status = Employee.Status::Active then begin
                        // populate the basic salary based on the steps
                        if SalaryStep.Get("Salary Steps", SalaryStep.Level::"Level 1", "Salary Scheme Category") then begin
                            "Basic Pay" := SalaryStep."Basic amount";
                            "Gross pay" := SalaryStep."Gross pay";
                        end;
                        // Get first open pay period
                        PayPeriod.Reset;
                        PayPeriod.SetRange(PayPeriod.Closed, false);
                        if PayPeriod.Find('-') then
                            CurrentMonth := PayPeriod."Date Opened";
                        /*
                        //House all
                        IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."House All. Code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          AssMatrix.Amount:=SalaryStep."House allowance";
                          AssMatrix.MODIFY;
                        END;
                        //std allowance
                        IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Standard Overtime code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          AssMatrix.Amount:=SalaryStep."Standard overtime";
                          AssMatrix.MODIFY;
                        END;
                        //duty allowance
                        IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Duty Allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          AssMatrix.Amount:=SalaryStep."Duty allowance";
                          AssMatrix.MODIFY;
                        END;
                        //personal allow
                        IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Personal Allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          AssMatrix.Amount:=SalaryStep."Personal allowance";
                          AssMatrix.MODIFY;
                        END;
                        // performance
                        IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Performance Allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          AssMatrix.Amount:=SalaryStep."Perfomance allowance";
                          AssMatrix.MODIFY;
                        END;
                        //Standard Allowance
                        IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Std Allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          AssMatrix.Amount:=SalaryStep."Std Allowance";
                          AssMatrix.MODIFY;
                        END;
                        // Dog handler
                        IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Dog handlers allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          AssMatrix.Amount:=SalaryStep."Dog handlers allowance";
                          AssMatrix.MODIFY;
                        END;

                        // Public holiday
                        IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Public holiday allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          AssMatrix.Amount:=SalaryStep."Public holiday allowance";
                          AssMatrix.MODIFY;
                        END;

                        // Insert

                        //House all
                        IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."House All. Code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          //find earnings
                          IF Earn.GET(SalaryStep."House All. Code") THEN BEGIN
                           AssMatrix.Code:=Earn.Code;
                           AssMatrix.Description:=Earn.Description;
                           AssMatrix.Taxable:=Earn.Taxable;
                           IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                           AssMatrix."Next Period Entry":=TRUE
                           ELSE
                           AssMatrix."Next Period Entry":=FALSE;
                          END;
                          AssMatrix."Employee No":="No.";
                          AssMatrix.Type:=AssMatrix.Type::Payment;
                          AssMatrix.Code:=SalaryStep."House All. Code";
                          AssMatrix."Payroll Period":=CurrentMonth;
                          AssMatrix."Department Code":="Department Code";
                          AssMatrix.Amount:=SalaryStep."House allowance";
                          IF AssMatrix.Amount<>0 THEN
                            AssMatrix.INSERT;
                        END;
                        //std allowance
                        IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Standard Overtime code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          //find earnings
                          IF Earn.GET(SalaryStep."Standard Overtime code") THEN BEGIN
                           AssMatrix.Code:=Earn.Code;
                           AssMatrix.Description:=Earn.Description;
                           AssMatrix.Taxable:=Earn.Taxable;
                           IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                           AssMatrix."Next Period Entry":=TRUE
                           ELSE
                           AssMatrix."Next Period Entry":=FALSE;
                          END;
                          AssMatrix."Employee No":="No.";
                          AssMatrix.Type:=AssMatrix.Type::Payment;
                          AssMatrix.Code:=SalaryStep."Standard Overtime code";
                          AssMatrix."Payroll Period":=CurrentMonth;
                          AssMatrix."Department Code":="Department Code";
                          AssMatrix.Amount:=SalaryStep."Standard overtime";
                         IF AssMatrix.Amount<>0 THEN
                          AssMatrix.INSERT;
                        END;
                        //duty allowance
                        IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Duty Allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          //find earnings
                          IF Earn.GET(SalaryStep."Duty Allowance code") THEN BEGIN
                           AssMatrix.Code:=Earn.Code;
                           AssMatrix.Description:=Earn.Description;
                           AssMatrix.Taxable:=Earn.Taxable;
                           IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                           AssMatrix."Next Period Entry":=TRUE
                           ELSE
                           AssMatrix."Next Period Entry":=FALSE;
                          END;
                          AssMatrix."Employee No":="No.";
                          AssMatrix.Type:=AssMatrix.Type::Payment;
                          AssMatrix.Code:=SalaryStep."Duty Allowance code";
                          AssMatrix."Payroll Period":=CurrentMonth;
                          AssMatrix."Department Code":="Department Code";
                          AssMatrix.Amount:=SalaryStep."Duty allowance";
                          IF AssMatrix.Amount<>0 THEN
                           AssMatrix.INSERT;
                        END;
                        //personal allow
                        IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Personal Allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          //find earnings
                          IF Earn.GET(SalaryStep."Personal Allowance code") THEN BEGIN
                           AssMatrix.Code:=Earn.Code;
                           AssMatrix.Description:=Earn.Description;
                           AssMatrix.Taxable:=Earn.Taxable;
                           IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                           AssMatrix."Next Period Entry":=TRUE
                           ELSE
                           AssMatrix."Next Period Entry":=FALSE;
                          END;
                          AssMatrix."Employee No":="No.";
                          AssMatrix.Type:=AssMatrix.Type::Payment;
                          AssMatrix.Code:=SalaryStep."Personal Allowance code";
                          AssMatrix."Payroll Period":=CurrentMonth;
                          AssMatrix."Department Code":="Department Code";
                          AssMatrix.Amount:=SalaryStep."Personal allowance";
                          IF AssMatrix.Amount<>0 THEN
                          AssMatrix.INSERT;
                        END;
                        //Standard allowance
                        IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Std Allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          //find earnings
                          IF Earn.GET(SalaryStep."Std Allowance code") THEN BEGIN
                           AssMatrix.Code:=Earn.Code;
                           AssMatrix.Description:=Earn.Description;
                           AssMatrix.Taxable:=Earn.Taxable;
                           IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                           AssMatrix."Next Period Entry":=TRUE
                           ELSE
                           AssMatrix."Next Period Entry":=FALSE;
                          END;
                          AssMatrix."Employee No":="No.";
                          AssMatrix.Type:=AssMatrix.Type::Payment;
                          AssMatrix.Code:=SalaryStep."Personal Allowance code";
                          AssMatrix."Payroll Period":=CurrentMonth;
                          AssMatrix."Department Code":="Department Code";
                          AssMatrix.Amount:=SalaryStep."Std Allowance";
                          IF AssMatrix.Amount<>0 THEN
                          AssMatrix.INSERT;
                        END;
                        // Dog handler
                        IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Dog handlers allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          //find earnings
                          IF Earn.GET(SalaryStep."Dog handlers allowance code") THEN BEGIN
                           AssMatrix.Code:=Earn.Code;
                           AssMatrix.Description:=Earn.Description;
                           AssMatrix.Taxable:=Earn.Taxable;
                           IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                           AssMatrix."Next Period Entry":=TRUE
                           ELSE
                           AssMatrix."Next Period Entry":=FALSE;
                          END;
                          AssMatrix."Employee No":="No.";
                          AssMatrix.Type:=AssMatrix.Type::Payment;
                          AssMatrix.Code:=SalaryStep."Dog handlers allowance code";
                          AssMatrix."Payroll Period":=CurrentMonth;
                          AssMatrix."Department Code":="Department Code";
                          AssMatrix.Amount:=SalaryStep."Dog handlers allowance";
                          IF AssMatrix.Amount<>0 THEN
                          AssMatrix.INSERT;
                        END;

                        // performance
                        IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Performance Allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          //find earnings
                          IF Earn.GET(SalaryStep."Performance Allowance code") THEN BEGIN
                           AssMatrix.Code:=Earn.Code;
                           AssMatrix.Description:=Earn.Description;
                           AssMatrix.Taxable:=Earn.Taxable;
                           IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                           AssMatrix."Next Period Entry":=TRUE
                           ELSE
                           AssMatrix."Next Period Entry":=FALSE;
                          END;
                          AssMatrix."Employee No":="No.";
                          AssMatrix.Type:=AssMatrix.Type::Payment;
                          AssMatrix.Code:=SalaryStep."Performance Allowance code";
                          AssMatrix."Payroll Period":=CurrentMonth;
                          AssMatrix.Amount:=SalaryStep."Perfomance allowance";
                          IF AssMatrix.Amount<>0 THEN
                           AssMatrix.INSERT;
                        END;

                        // Public holiday allowance
                        IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Public holiday allowance code",CurrentMonth,"Department Code") THEN
                        BEGIN
                          //find earnings
                          IF Earn.GET(SalaryStep."Public holiday allowance code") THEN BEGIN
                           AssMatrix.Code:=Earn.Code;
                           AssMatrix.Description:=Earn.Description;
                           AssMatrix.Taxable:=Earn.Taxable;
                           IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                           AssMatrix."Next Period Entry":=TRUE
                           ELSE
                           AssMatrix."Next Period Entry":=FALSE;
                          END;
                          AssMatrix."Employee No":="No.";
                          AssMatrix.Type:=AssMatrix.Type::Payment;
                          AssMatrix.Code:=SalaryStep."Public holiday allowance code";
                          AssMatrix."Payroll Period":=CurrentMonth;
                          AssMatrix.Amount:=SalaryStep."Public holiday allowance";
                          IF AssMatrix.Amount<>0 THEN
                           AssMatrix.INSERT;
                        */

                        //END;
                    end else
                        Error('Employee not active');

            end;
        }
        field(50061; Level; Option)
        {
            OptionMembers = "Level 1","Level 2";
        }
        field(50065; "Share Amount"; Decimal)
        {
            Caption = 'coop skg fund';
            FieldClass = FlowField;
        }
        field(50066; "House allowance"; Decimal)
        {
        }
        field(50067; Overtime; Decimal)
        {
        }
        field(50068; Absence; Decimal)
        {
        }
        field(50069; "Other allowances"; Decimal)
        {
        }
        field(50070; "Total earnings"; Decimal)
        {
        }
        field(50071; PAYE; Decimal)
        {
        }
        field(50072; NHIF; Decimal)
        {
        }
        field(50073; NSSF; Decimal)
        {
        }
        field(50074; Advance; Decimal)
        {
            FieldClass = FlowField;
        }
        field(50075; Loans; Decimal)
        {
        }
        field(50076; COOP; Decimal)
        {
        }
        field(50077; "Other deductions"; Decimal)
        {
        }
        field(50079; "Net pay"; Decimal)
        {
        }
        field(50080; "Advance Code Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "prBoard Deductions".Code;
        }
        field(50081; "Gross pay"; Decimal)
        {
        }
        field(50082; interest; Decimal)
        {
            FieldClass = FlowField;
        }
        field(50083; "Account Group"; Code[20])
        {
        }
        field(50084; "Payslip Message"; Text[100])
        {
        }
        field(50085; "Actual Basic Salary"; Decimal)
        {
        }
        field(50086; "Days Worked"; Integer)
        {

            trigger OnValidate()
            begin
                if "Days Worked" <> 0 then begin
                    if "Actual Basic Salary" <> 0 then begin
                        BasicPay := ("Actual Basic Salary" / 30) * "Days Worked";
                        "Basic Pay" := BasicPay;
                        Modify;
                        Validate("Basic Pay")
                    end;
                end;
            end;
        }
        field(50087; "Owner Occupier"; Decimal)
        {
            FieldClass = FlowField;
        }
        field(50088; "Low Interest Benefits"; Decimal)
        {
        }
        field(50089; "Terminal Dues Code"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "prBoard Earnings".Code;
        }
        field(50090; Pensionable; Boolean)
        {
        }
        field(50091; "Account Type"; Code[20])
        {
        }
        field(50092; "Specify Tax Band"; Boolean)
        {
        }
        field(50093; "Tax Percentage"; Decimal)
        {
        }
        field(50094; "Board Member"; Boolean)
        {
        }
        field(50095; "Inactive Date"; Date)
        {
        }
        field(50097; "Basic Pay Period Specific"; Decimal)
        {
            FieldClass = FlowField;
        }
        field(50098; "Branch Namecode"; Code[50])
        {
        }
        field(50099; "Branch name"; Text[50])
        {
        }
        field(50100; Mail; Text[100])
        {
        }
        field(50101; "Suspend Pay"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Pay Mode")
        {
        }
        key(Key3; "Department Code")
        {
        }
        key(Key4; Status)
        {
        }
    }

    fieldgroups
    {
    }

    var
        Emp: Record "HR Employees";
        SalaryStep: Record "prBoard Salary Steps";
        PayPeriod: Record "PR Payroll Periods";
        CurrentMonth: Date;
        AssMatrix: Record "PR Period Transactions";
        Earn: Record "prBoard Earnings";
        Netpay: Decimal;
        EmployeeLegderEntry: RecordID;
        Employee: Record "prBoard Employees";
        "HR Setup": Record "HR Setup";
        LoadEarnings: Record "prBoard Earnings";
        LoadDeductions: Record "prBoard Deductions";
        BasicPay: Decimal;
        ActualBasicPay: Decimal;
        Ded: Record "prBoard Deductions";
        Amount: Decimal;
}

