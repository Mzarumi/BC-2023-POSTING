table 52185650 "HR EMPLOYEES"
{
    Caption = 'HR Employees';
    DataCaptionFields = "No.", "Full Name", "Job Title";

    fields
    {
        field(1; "No."; Code[20])
        {

            trigger OnValidate()
            begin

                if "No." <> xRec."No." then begin
                   //HrSetup.Get;
                    ////NoSeriesMgtTestManual(HrSetup."Employee Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "First Name"; Text[80])
        {

            trigger OnValidate()
            begin

                //fn_FullName;
            end;
        }
        field(3; "Middle Name"; Text[50])
        {

            trigger OnValidate()
            begin
                //fn_FullName;
            end;
        }
        field(4; "Last Name"; Text[50])
        {

            trigger OnValidate()
            var
                Reason: Text[30];
            begin
                //fn_FullName;
            end;
        }
        field(5; Initials; Text[15])
        {
        }
        field(7; "Full Name"; Text[100])
        {
        }
        field(8; "Postal Address"; Text[30])
        {
        }
        field(9; "Residential Address"; Text[40])
        {
        }
        field(10; City; Text[30])
        {
            Editable = false;
        }
        field(11; "Post Code"; Code[10])
        {
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
             begin
            //     City := PostCode.City;
            //     County := '';
            //     "Postal Address" := '';
            //     Rec.PostCode.Reset;
            //     PostCode.SetRange(PostCode.Code, "Post Code");
            //     if Rec.PostCode.Find('-') then begin
            //         City := Rec.PostCode.City;
            //         County := Rec.PostCode.County;
              end;
             //end;
        }
        field(12; County; Text[30])
        {
            Editable = false;
            TableRelation = "Post Code".County;
        }
        field(13; "Home Phone Number"; Integer)
        {
        }
        field(14; "Cellular Phone Number"; Integer)
        {
        }
        field(15; "Work Phone Number"; Integer)
        {
        }
        field(16; "Ext."; Text[7])
        {
        }
        field(17; "E-Mail"; Text[80])
        {
            ExtendedDatatype = EMail;

            trigger OnValidate()
            begin
                // Smtp.CheckValidEmailAddresses("E-Mail");
            end;
        }
        field(19; Picture; BLOB)
        {
            SubType = Bitmap;
        }
        field(21; "ID Number"; Integer)
        {
        }
        field(22; "Union Code"; Code[10])
        {
            TableRelation = Union;
        }
        field(23; "UIF Number"; Text[30])
        {
        }
        field(24; Gender; Option)
        {
            OptionMembers = " ",Male,Female;
        }
        field(25; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(28; "Statistics Group Code"; Code[10])
        {
            TableRelation = "Employee Statistics Group";
        }
        field(31; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Active,InActive;

            trigger OnValidate()
            var
                PRPeriodTrans: Record "PR Period Transactions";
                PRPayrollPeriod: Record "PR Payroll Periods";
                PREmployerDeduc: Record "prEmployer Deductions";
            begin
                TestField("ID Number");
                TestField("Date Of Birth");
                TestField("First Name");
                TestField("Last Name");
                //Clear entries for payroll period in PR Period Trans and PR Employer Deductions
                //Get open payroll period
                if Status = Status::InActive then begin
                    //"User ID":='';

                    PRPayrollPeriod.Reset;
                    PRPayrollPeriod.SetRange(PRPayrollPeriod.Closed, false);
                    if PRPayrollPeriod.Find('-') then begin
                        //Clear employer contributinos
                        PREmployerDeduc.Reset;
                        PREmployerDeduc.SetRange(PREmployerDeduc."Payroll Period", PRPayrollPeriod."Date Opened"); //Open Period
                        PREmployerDeduc.SetRange(PREmployerDeduc."Employee Code", "No.");
                        if PREmployerDeduc.Find('-') then begin
                            PREmployerDeduc.DeleteAll;
                        end;

                        //Clear period trans
                        PRPeriodTrans.Reset;
                        PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PRPayrollPeriod."Date Opened");
                        PRPeriodTrans.SetRange(PRPeriodTrans."Employee Code", "No.");
                        if PRPeriodTrans.Find('-') then begin
                            PRPeriodTrans.DeleteAll;
                        end;
                    end;
                end;
                //Clear user id
            end;
        }
        field(35; "Location/Division Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
        }
        field(36; "Department Code"; Code[20])
        {
        }
        field(37; Office; Code[20])
        {
            Description = 'Dimension 2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          "Dimension Value Type" = CONST(Standard));
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          //"Dimension Value Type" = CONST(Standard));
        }
        field(38; "Resource No."; Code[20])
        {
            TableRelation = Resource;
        }
        field(39; Comment; Boolean)
        {
            Editable = false;
        }
        field(40; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(41; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(42; "Department Filter 1"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        field(43; "Office Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(47; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(49; "Fax Number"; Text[30])
        {
        }
        field(50; "Company E-Mail"; Text[80])
        {
            ExtendedDatatype = EMail;

            trigger OnValidate()
            begin
                // Smtp.CheckValidEmailAddresses("Company E-Mail");
            end;
        }
        field(51; Title; Option)
        {
            OptionMembers = " ",Mr,Mrs,Miss,Ms,"Dr."," Eng. ",Prof;
        }
        field(52; "Salespers./Purch. Code"; Code[10])
        {
        }
        field(53; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(54; "Known As"; Text[30])
        {
        }
        field(55; Position; Text[30])
        {

            trigger OnValidate()
            begin
                /*
                    IF ((Position <> xRec.Position) AND (xRec.Position <> '')) THEN BEGIN
                      Jobs.RESET;
                      Jobs.SETRANGE(Jobs."Job ID",Position);
                      IF Jobs.FIND('-') THEN BEGIN
                          Payroll.RESET;
                          Payroll.SETRANGE(Payroll.Code,"No.");
                          IF Payroll.FIND('-') THEN BEGIN
                              Payroll."Salary Scheme Category":=Jobs.Category;
                              Payroll."Salary Steps":=Jobs.Grade;
                              Payroll.VALIDATE(Payroll."Salary Steps");
                              Payroll.MODIFY;
                          END
                      END



                        {
                      CareerEvent.SetMessage('Job Title Changed');
                     CareerEvent.RUNMODAL;
                     OK:= CareerEvent.ReturnResult;
                      IF OK THEN BEGIN
                         CareerHistory.INIT;
                         IF NOT CareerHistory.FIND('-') THEN
                          CareerHistory."Line No.":=1
                        ELSE BEGIN
                          CareerHistory.FIND('+');
                          CareerHistory."Line No.":=CareerHistory."Line No."+1;
                        END;

                         CareerHistory."Employee No.":= "No.";
                         CareerHistory."Date Of Event":= WORKDATE;
                         CareerHistory."Career Event":= 'Job Title Changed';
                         CareerHistory."Job Title":= "Position Title";
                         CareerHistory."Employee First Name":= "Known As";
                         CareerHistory."Employee Last Name":= "Last Name";
                         CareerHistory.INSERT;
                      END;
                      }

                  END;
               */

            end;
        }
        field(57; "Full / Part Time"; Option)
        {
            OptionMembers = " ","Full Time"," Part Time",Contract;
        }
        field(58; "Contract Type"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code WHERE(Type = CONST("Contract Type"));
            //TableRelation = "HR Lookup Values".Code WHERE(Type = CONST("Contract Type"));
        }
        field(59; "Contract End Date"; Date)
        {
        }
        field(60; "Notice Period"; Code[10])
        {
        }
        field(61; "Union Member?"; Boolean)
        {
        }
        field(62; "Shift Worker?"; Boolean)
        {
        }
        field(63; "Contracted Hours"; Decimal)
        {
        }
        field(64; "Pay Period"; Option)
        {
            OptionMembers = Weekly,"2 Weekly","4 Weekly",Monthly," ";
        }
        field(65; "Pay Per Period"; Decimal)
        {
        }
        field(66; "Cost Code"; Code[20])
        {
        }
        field(68; "Secondment Institution"; Text[30])
        {
        }
        field(69; "UIF Contributor?"; Boolean)
        {
        }
        field(73; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
        }
        field(74; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;
        }
        field(75; "First Language (R/W/S)"; Code[10])
        {
        }
        field(76; "Driving Licence"; Code[10])
        {
        }
        field(77; "Vehicle Registration Number"; Code[10])
        {
        }
        field(78; Disabled; Option)
        {
            OptionMembers = No,Yes," ";
        }
        field(79; "Health Assesment?"; Boolean)
        {
        }
        field(80; "Health Assesment Date"; Date)
        {
        }
        field(81; "Date Of Birth"; Date)
        {

            trigger OnValidate()
            begin
                /*{
                            IF (DATE2DMY(TODAY,3) - DATE2DMY("Date Of Birth",3)) < 18 THEN
                              ERROR('Staff is below allowed employable Limit');
                              }
                
                ag:=(TODAY-"Date Of Birth");
                IF "Date Of Birth" >=TODAY THEN BEGIN
                    ERROR('Date of Birth cannot be after %1',TODAY);
                END;
                
                Age:=HRCodeunit.DetermineAge("Date Of Birth",TODAY);
                //IF ag>20075 THEN ERROR('Your Age is above 55 years');
                
                
                
                
                
                //calculate age 02-05-1988
                yTODAY:=DATE2DMY(TODAY,3); //2014
                
                yDOB:=DATE2DMY("Date Of Birth",3);
                dDOB:= DATE2DMY("Date Of Birth",1);
                mDOB:=DATE2DMY("Date Of Birth",2);
                
                AppAge:=yTODAY-yDOB;
                HREmp.FIND('-');
                
                 IF HREmp.Disabled= HREmp.Disabled::No THEN BEGIN
                
                //calculate how many years remaining for this employee to retire : ret yr is 65
                noYrsToRetirement:=60 - AppAge;
                
                
                //add noYrsToRetirement to current year to get retirement year da
                RetirementYear:= yTODAY + noYrsToRetirement;
                //ERROR(FORMAT(RetirementYear));
                RetirementDate:=DMY2DATE(dDOB,mDOB,RetirementYear);
                "Retirement date":=RetirementDate;
                 END ELSE
                 //IF HREmp.Disabled= HREmp.Disabled::Yes THEN
                //calculate how many years remaining for this employee to retire : ret yr is 60
                noYrsToRetirement:=70 - AppAge;
                
                //add noYrsToRetirement to current year to get retirement year da
                RetirementYear:= yTODAY + noYrsToRetirement;
                //ERROR(FORMAT(RetirementYear));
                RetirementDate:=DMY2DATE(dDOB,mDOB,RetirementYear);
                "Retirement date":=RetirementDate;
                //END;
                //END;
                */

            end;
        }
        field(82; Age; Text[80])
        {
        }
        field(84; "Length Of Service"; Text[80])
        {
        }
        field(85; "End Of Probation Date"; Date)
        {
        }
        field(86; "Pension Scheme Join"; Date)
        {
        }
        field(87; "Time Pension Scheme"; Text[80])
        {
        }
        field(88; "Medical Scheme Join"; Date)
        {
        }
        field(89; "Time Medical Scheme"; Text[80])
        {
            //This property is currently not supported
            //TestTableRelation = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
        }
        field(90; "Date Of Leaving"; Date)
        {
        }
        field(91; Paterson; Code[10])
        {
        }
        field(92; Peromnes; Code[10])
        {
        }
        field(93; "Professional Body"; Code[20])
        {
            TableRelation = "HR Professional body Header"."No.";
        }
        field(94; Castellion; Code[10])
        {
        }
        field(95; "Per Annum"; Decimal)
        {
        }
        field(96; "Allow Overtime"; Option)
        {
            OptionMembers = Yes,No," ";
        }
        field(97; "Medical Scheme No."; Text[30])
        {

            trigger OnValidate()
            begin
                //MedicalAidBenefit.SETRANGE("Employee No.","No.");
            end;
        }
        field(98; "Medical Scheme Head Member"; Text[60])
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //   OK := MedicalAidBenefit.FIND('+');
                //  IF OK THEN BEGIN
                //  REPEAT
                //   MedicalAidBenefit."Medical Aid Head Member":= "Medical Aid Head Member";
                //    MedicalAidBenefit.MODIFY;
                //  UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(99; "Number Of Dependants"; Integer)
        {

            trigger OnValidate()
            begin
                // MedicalAidBenefit.SETRANGE("Employee No.","No.");
                // OK := MedicalAidBenefit.FIND('+');
                // IF OK THEN BEGIN
                //REPEAT
                //  MedicalAidBenefit."Number Of Dependants":= "Number Of Dependants";
                //  MedicalAidBenefit.MODIFY;
                //UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(100; "Medical Scheme Name"; Text[150])
        {

            trigger OnValidate()
            begin
                //MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //OK := MedicalAidBenefit.FIND('+');
                //IF OK THEN BEGIN
                // REPEAT
                // MedicalAidBenefit."Medical Aid Name":= "Medical Aid Name";
                //  MedicalAidBenefit.MODIFY;
                // UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(101; "Amount Paid By Employee"; Decimal)
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //  OK := MedicalAidBenefit.FIND('+');
                //   IF OK THEN BEGIN
                //     REPEAT
                //      MedicalAidBenefit."Amount Paid By Employee":= "Amount Paid By Employee";
                //       MedicalAidBenefit.MODIFY;
                //     UNTIL MedicalAidBenefit.NEXT = 0;
                //    END;
            end;
        }
        field(102; "Amount Paid By Company"; Decimal)
        {

            trigger OnValidate()
            begin
                //  MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //   OK := MedicalAidBenefit.FIND('+');
                //  IF OK THEN BEGIN
                // REPEAT
                //      MedicalAidBenefit."Amount Paid By Company":= "Amount Paid By Company";
                //      MedicalAidBenefit.MODIFY;
                // UNTIL MedicalAidBenefit.NEXT = 0;
                //   END;
            end;
        }
        field(103; "Receiving Car Allowance ?"; Boolean)
        {
        }
        field(104; "Second Language (R/W/S)"; Code[10])
        {
        }
        field(105; "Additional Language"; Code[10])
        {
        }
        field(106; "Cell Phone Reimbursement?"; Boolean)
        {
        }
        field(107; "Amount Reimbursed"; Decimal)
        {
        }
        field(108; "UIF Country"; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(109; "Direct/Indirect"; Option)
        {
            OptionMembers = Direct,Indirect;
        }
        field(110; "Primary Skills Category"; Option)
        {
            OptionMembers = Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(111; Level; Option)
        {
            OptionMembers = " ","Level 1","Level 2","Level 3","Level 4","Level 5","Level 6","Level 7";
        }
        field(112; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
            end;
        }
        field(113; "Job ID"; Code[30])
        {
            Description = 'To put description on Job title field';
            TableRelation = "HR Jobs"."Job ID";

            trigger OnValidate()
            begin
            //     objJobs.Reset;
            //     objJobs.SetRange(objJobs."Job ID", "Job ID");
            //     if objJobs.Find('-') then begin
            //         "Job Title" := objJobs."Job Description";
                 end;
             //end;
        }
        field(114; DateOfBirth; Date)
        {

            trigger OnValidate()
             begin
                //calculate age 02-05-1988
                yTODAY := Date2DMY(Today, 3); //2014

                yDOB := Date2DMY("Date Of Birth", 3);
                dDOB := Date2DMY("Date Of Birth", 1);
                mDOB := Date2DMY("Date Of Birth", 2);

                AppAge := yTODAY - yDOB;
                HREmp.Find('-');

                if HREmp.Disabled = HREmp.Disabled::No then begin

                    //calculate how many years remaining for this employee to retire : ret yr is 65
                    noYrsToRetirement := 60 - AppAge;

                    //add noYrsToRetirement to current year to get retirement year da
                    RetirementYear := yTODAY + noYrsToRetirement;
                    //ERROR(FORMAT(RetirementYear));
                    RetirementDate := DMY2Date(dDOB, mDOB, RetirementYear);
                    "Retirement date" := RetirementDate;
                end else
                    //IF HREmp.Disabled= HREmp.Disabled::Yes THEN
                    //calculate how many years remaining for this employee to retire : ret yr is 60
                    noYrsToRetirement := 70 - AppAge;

                //add noYrsToRetirement to current year to get retirement year da
                RetirementYear := yTODAY + noYrsToRetirement;
                //ERROR(FORMAT(RetirementYear));
                RetirementDate := DMY2Date(dDOB, mDOB, RetirementYear);
                "Retirement date" := RetirementDate;
                //END;
                END;
         //end;
        }
        field(115; DateEngaged; Text[8])
        {
        }
        field(116; "Postal Address2"; Text[30])
        {
        }
        field(117; "Postal Address3"; Text[20])
        {
        }
        field(118; "Residential Address2"; Text[30])
        {
        }
        field(119; "Residential Address3"; Text[20])
        {
        }
        field(120; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(121; Citizenship; Code[10])
        {
            TableRelation = "Country/Region".Code;
        }
        field(122; "Name Of Manager"; Text[45])
        {
        }
        field(123; "User ID"; Code[40])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnLookup()
            begin
                // UserMgt.LookupUserID("User ID");
            end;

            trigger OnValidate()
            begin
                // UserMgt.ValidateUserID("User ID");

                if "User ID" = '' then exit;
                /*
                HREmp.RESET;
                IF HREmp.GET("User ID") THEN
                BEGIN
                   EmpFullName:=HREmp."First Name" + SPACER + HREmp."Middle Name" + SPACER + HREmp."Last Name";
                   ERROR('UserID [%1] has already been assigned to another Employee [%2]',"User ID",EmpFullName);
                END;
                */

            end;
        }
        field(124; "Disabling Details"; Text[20])
        {
        }
        field(125; "Disability Grade"; Text[20])
        {
        }
        field(126; "Passport Number"; Text[20])
        {
        }
        field(127; "2nd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(128; "3rd Skills Category"; Option)
        {
            OptionMembers = " ",Auditors,Consultants,Training,Certification,Administration,Marketing,Management,"Business Development",Other;
        }
        field(129; PensionJoin; Text[8])
        {
        }
        field(130; DateLeaving; Text[30])
        {
        }
        field(131; Region; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('REGION'));
            //TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('REGION'));
        }
        field(132; "Manager Emp No"; Code[30])
        {
        }
        field(133; Temp; Text[20])
        {
        }
        field(134; "Employee Qty"; Decimal)
        {
            FieldClass = Normal;
        }
        field(135; "Employee Act. Qty"; Decimal)
        {
            FieldClass = Normal;
        }
        field(136; "Employee Arc. Qty"; Decimal)
        {
            FieldClass = Normal;
        }
        field(137; "Contract Location"; Text[20])
        {
            Description = 'Location where contract was closed';
        }
        field(138; "First Language Read"; Boolean)
        {
        }
        field(139; "First Language Write"; Boolean)
        {
        }
        field(140; "First Language Speak"; Boolean)
        {
        }
        field(141; "Second Language Read"; Boolean)
        {
        }
        field(142; "Second Language Write"; Boolean)
        {
        }
        field(143; "Second Language Speak"; Boolean)
        {
        }
        field(144; "Custom Grading"; Code[20])
        {
        }
        field(145; "PIN No."; Code[20])
        {
        }
        field(146; "NSSF No."; Code[20])
        {
        }
        field(147; "NHIF No."; Code[20])
        {
        }
        field(148; "Cause of Inactivity Code"; Code[10])
        {
            Caption = 'Cause of Inactivity Code';
            TableRelation = "Cause of Inactivity";
        }
        field(149; "Grounds for Term. Code"; Code[10])
        {
            Caption = 'Grounds for Term. Code';
            TableRelation = "Grounds for Termination";
        }
        field(150; "Sacco Staff No"; Code[20])
        {
        }
        field(151; "Period Filter"; Date)
        {
        }
        field(152; "HELB No"; Text[10])
        {
        }
        field(153; "Co-Operative No"; Text[30])
        {
        }
        field(154; "Wedding Anniversary"; Date)
        {
        }
        field(156; "Competency Area"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(157; "Cost Center Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          "Dimension Value Type" = CONST(Standard));
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          //"Dimension Value Type" = CONST(Standard));
        }
        field(158; "Position To Succeed"; Code[20])
        {
        }
        field(159; "Succesion Date"; Date)
        {
        }
        field(160; "Send Alert to"; Code[20])
        {
        }
        field(161; Tribe; Code[20])
        {
        }
        field(162; Religion; Code[20])
        {
            TableRelation = "HR Lookup Values".Code WHERE(Type = FILTER(Religion));
            //TableRelation = "HR Lookup Values".Code WHERE(Type = FILTER(Religion));
        }
        field(163; "Job Title"; Text[50])
        {
        }
        field(164; "Post Office No"; Text[20])
        {
        }
        field(165; "Posting Group"; Code[20])
        {
            NotBlank = false;
            TableRelation = "prEmployee Posting Group".Code;
        }
        field(166; "Payroll Posting Group"; Code[20])
        {
        }
        field(167; "Served Notice Period"; Boolean)
        {
        }
        field(168; "Exit Interview Date"; Date)
        {
        }
        field(169; "Exit Interview Done by"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
        }
        field(170; "Allow Re-Employment In Future"; Boolean)
        {
        }
        field(171; "Medical Scheme Name #2"; Text[50])
        {

            trigger OnValidate()
            begin
                //MedicalAidBenefit.SETRANGE("Employee No.","No.");
                //OK := MedicalAidBenefit.FIND('+');
                //IF OK THEN BEGIN
                // REPEAT
                // MedicalAidBenefit."Medical Aid Name":= "Medical Aid Name";
                //  MedicalAidBenefit.MODIFY;
                // UNTIL MedicalAidBenefit.NEXT = 0;
                // END;
            end;
        }
        field(172; "Resignation Date"; Date)
        {
        }
        field(173; "Suspension Date"; Date)
        {
        }
        field(174; "Demised Date"; Date)
        {
        }
        field(175; "Retirement date"; Date)
        {

            trigger OnValidate()
            begin
                //calculate age 02-05-1988
                // yTODAY := Date2DMY(Today, 3); //2014

                // yDOB := Date2DMY("Date Of Birth", 3);
                // dDOB := Date2DMY("Date Of Birth", 1);
                // mDOB := Date2DMY("Date Of Birth", 2);

                // AppAge := yTODAY - yDOB;
                // HREmp.Find('-');
                // if HREmp.Disabled = HREmp.Disabled::No then begin
                //     //calculate how many years remaining for this employee to retire : ret yr is 60
                //     noYrsToRetirement := 60 - AppAge;

                //     //add noYrsToRetirement to current year to get retirement year da
                //     RetirementYear := yTODAY + noYrsToRetirement;
                //     //ERROR(FORMAT(RetirementYear));
                //     RetirementDate := DMY2Date(dDOB, mDOB, RetirementYear);
                //     "Retirement date" := RetirementDate;
                // end else
                //     if HREmp.Disabled = HREmp.Disabled::Yes then
                //         //calculate how many years remaining for this employee to retire : ret yr is 60
                //         noYrsToRetirement := 70 - AppAge;

                // //add noYrsToRetirement to current year to get retirement year da
                // RetirementYear := yTODAY + noYrsToRetirement;
                // //ERROR(FORMAT(RetirementYear));
                // RetirementDate := DMY2Date(dDOB, mDOB, RetirementYear);
                // "Retirement date" := RetirementDate;
                //END;
                //END;
            end;
        }
        field(176; "Retrenchment date"; Date)
        {
        }
        field(177; Campus; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('CAMPUS'));
            //TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('CAMPUS'));
        }
        field(178; Permanent; Boolean)
        {
        }
        field(179; "Library Category"; Option)
        {
            OptionMembers = "ADMIN STAFF","TEACHING STAFF",DIRECTORS;
        }
        field(180; Category; Code[20])
        {
        }
        field(181; "Payroll Departments"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
        }
        // field(188; "Salary Grade"; Code[20])
        // {
        //     TableRelation = "Salary Grades"."Salary Grade";

        //     trigger OnValidate()
        //     begin
        //         //must be within Salary Grade
        //         Rec.SalCard.Reset;
        //         salGrade.SetRange(salGrade."Salary Grade", "Salary Grade");
        //         if salGrade.Find('-') then begin
        //             if ("Basic Pay" < salGrade."Minimum Amount") then
        //                 Error('Basic Pay Must be greater than ' + Format(salGrade."Minimum Amount"));
        //             if ("Basic Pay" > salGrade."Maxmum Amount") then
        //                 Error('Basic Pay Must be greater than ' + Format(salGrade."Maxmum Amount"));
        //         end;
        //     end;
        // }
        field(189; "Company Type"; Option)
        {
            OptionCaption = 'Others,USAID';
            OptionMembers = Others,USAID;
        }
        field(190; "Main Bank"; Code[20])
        {
        }
        field(191; "Branch Bank"; Code[20])
        {
        }
        field(192; "Lock Bank Details"; Boolean)
        {
        }
        field(193; "Bank Account Number"; Code[20])
        {
        }
        field(195; "Payroll Code"; Code[20])
        {
        }
        field(196; "Holiday Days Entitlement"; Decimal)
        {
        }
        field(197; "Holiday Days Used"; Decimal)
        {
        }
        field(198; "Payment Mode"; Option)
        {
            Description = 'Bank Transfer,Cheque,Cash,SACCO';
            OptionMembers = " ","Bank Transfer",Cheque,Cash,FOSA;
        }
        field(199; "Hourly Rate"; Decimal)
        {
        }
        field(200; "Daily Rate"; Decimal)
        {
        }
        field(300; "Social Security No."; Code[20])
        {
        }
        field(301; "Pension House"; Code[20])
        {
            TableRelation = "prInstitutional Membership"."Institution No" WHERE("Group No" = CONST('PENSION'));
            //TableRelation = "prInstitutional Membership"."Institution No" WHERE("Group No" = CONST('PENSION'));
        }
        field(302; "Salary Notch/Step"; Code[20])
        {
        }
        field(303; "Status Change Date"; Date)
        {
        }
        field(304; "Previous Month Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(305; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(306; "Prev. Basic Pay"; Decimal)
        {
            FieldClass = Normal;
        }
        field(307; "Curr. Basic Pay"; Decimal)
        {
            FieldClass = Normal;
        }
        field(308; "Prev. Gross Pay"; Decimal)
        {
            FieldClass = Normal;
        }
        field(309; "Curr. Gross Pay"; Decimal)
        {
            FieldClass = Normal;
        }
        field(310; "Gross Income Variation"; Decimal)
        {
            FieldClass = Normal;
        }
        field(311; "Basic Pay 2"; Decimal)
        {
            Editable = false;
        }
        field(312; "Net Pay"; Decimal)
        {
        }
        field(313; "Transaction Amount"; Decimal)
        {
        }
        field(314; "Transaction Code Filter"; Text[30])
        {
        }
        field(317; "Account Type"; Option)
        {
            OptionCaption = ' ,Savings,Current';
            OptionMembers = " ",Savings,Current;
        }
        field(318; "Location/Division Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('LOC/DIV'));
            //TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('LOC/DIV'));
        }
        field(319; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DEPARTMENT'));
            //TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('DEPARTMENT'));
        }
        field(320; "Cost Centre Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COSTCENTRE'));
            //TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('COSTCENTRE'));
        }
            //Description = 'General,Consultants,Seconded Staff';
            //OptionCaption = 'General,Consultants,Seconded Staff';
            //OptionMembers = General,Consultants,"Seconded Staff";
        //}
        //// field(324; "Employee Classification"; Code[20])
        // {
        //     Description = 'Service';
        // }
        // field(328; "Department Name"; Text[80])
        // {
        // }
        //field(2004; "Total Leave Taken"; Decimal)
        // {
        //     CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Staff No." = FIELD("No."),
        //                                                                      "Posting Date" = FIELD("Date Filter"),
        //                                                                      "Leave Entry Type" = CONST(Negative),
        //                                                                      Closed = CONST(false),
        //                                                                      "Leave Type" = FILTER('LTY01' | 'LTY02'),
        //                                                                      "Leave Calendar Code" = FILTER('2018')));
        //     // CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Staff No." = FIELD("No."),
        //     //                                                                  "Posting Date" = FIELD("Date Filter"),
        //     //                                                                  "Leave Entry Type" = CONST(Negative),
        //     //                                                                  Closed = CONST(false),
        //     //                                                                  "Leave Type" = FILTER('LTY01' | 'LTY02'),
        //     //                                                                  "Leave Calendar Code" = FILTER('2018')));
        //     DecimalPlaces = 2 : 2;
        //     FieldClass = FlowField;
        //}
        field(2006; "Total (Leave Days)"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            Editable = false;
        }
        field(2007; "Cash - Leave Earned"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(2008; "Reimbursed Leave Days"; Decimal)
        {
            CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Staff No." = FIELD("No."),
                                                                             "Posting Date" = FIELD("Date Filter"),
                                                                             "Leave Entry Type" = CONST(Reimbursement),
                                                                             Closed = CONST(false)));
            // CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Staff No." = FIELD("No."),
            //                                                                  "Posting Date" = FIELD("Date Filter"),
            //                                                                  "Leave Entry Type" = CONST(Reimbursement),
            //                                                                  Closed = CONST(false)));
            DecimalPlaces = 2 : 2;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                Validate("Allocated Leave Days");
            end;
        }
        field(2009; "Cash per Leave Day"; Decimal)
        {
            DecimalPlaces = 2 : 2;
        }
        field(2023; "Allocated Leave Days"; Decimal)
        {
            // CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Staff No." = FIELD("No."),
            //                                                                  "Posting Date" = FIELD("Date Filter"),
            //                                                                  "Leave Entry Type" = FILTER(Positive | Negative),
            //                                                                  Closed = CONST(false)));
            // CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Staff No." = FIELD("No."),
            //                                                                  "Posting Date" = FIELD("Date Filter"),
            //                                                                  "Leave Entry Type" = FILTER(Positive | Negative),
            //                                                                  Closed = CONST(false)));
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin

                //CalcFields("Total Leave Taken");
                "Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
                //SUM UP LEAVE LEDGER ENTRIES
                //"Leave Balance" := "Total (Leave Days)" - "Total Leave Taken";
                //TotalDaysVal := Rec."Total Leave Taken";
            end;
        }
        field(2024; "End of Contract Date"; Date)
        {
        }
        field(2040; "Leave Period Filter"; Code[20])
        {
        }
        field(3899; "Mutliple Bank A/Cs"; Boolean)
        {
        }
        field(3900; "No. Of Bank A/Cs"; Integer)
        {
            CalcFormula = Count("HR Employee Bank Accounts" WHERE("Bank  Code" = FILTER(<> ''),
                                                                   "Branch Code" = FILTER(<> ''),
                                                                   "A/C  Number" = FILTER(<> ''),
                                                                   "Employee Code" = FIELD("No.")));
            // CalcFormula = Count("HR Employee Bank Accounts" WHERE("Bank  Code" = FILTER(<> ''),
            //                                                        "Branch Code" = FILTER(<> ''),
            //                                                        "A/C  Number" = FILTER(<> ''),
            //                                                        "Employee Code" = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(3971; "Annual Leave Account"; Decimal)
        {
            // CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = FILTER('LTY06' | 'LTY01' | 'LTY02'),
            //                                                                  "Staff No." = FIELD("No."),
            //                                                                  Closed = CONST(false)));
            // CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = FILTER('LTY06' | 'LTY01' | 'LTY02'),
            //                                                                  "Staff No." = FIELD("No."),
            //                                                                  Closed = CONST(false)));
            FieldClass = FlowField;
        }
        field(3972; "Compassionate Leave Acc."; Decimal)
        {
            CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = CONST(''),
                                                                             "Staff No." = FIELD("No."),
                                                                             Closed = CONST(false)));
            // CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = CONST(''),
            //                                                                  "Staff No." = FIELD("No."),
            //                                                                  Closed = CONST(false)));
            FieldClass = FlowField;
        }
        field(3973; "Maternity Leave Acc."; Decimal)
        {
            CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = CONST('LTY03'),
                                                                             "Staff No." = FIELD("No."),
                                                                             Closed = CONST(false)));
            // CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = CONST('LTY03'),
            //                                                                  "Staff No." = FIELD("No."),
            //                                                                  Closed = CONST(false)));
            FieldClass = FlowField;
        }
        field(3974; "Paternity Leave Acc."; Decimal)
        {
            CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = CONST('LTY04'),
                                                                             "Staff No." = FIELD("No."),
                                                                             Closed = CONST(false)));
            // CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = CONST('LTY04'),
            //                                                                  "Staff No." = FIELD("No."),
            //                                                                  Closed = CONST(false)));
            FieldClass = FlowField;
        }
        field(3975; "Sick Leave Acc."; Decimal)
        {
            CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = CONST('ANNUAL'),
                                                                             "Staff No." = FIELD("No."),
                                                                             Closed = CONST(false)));
            // CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = CONST('ANNUAL'),
            //                                                                  "Staff No." = FIELD("No."),
            //                                                                  Closed = CONST(false)));
            FieldClass = FlowField;
        }
        field(3976; "Study Leave Acc"; Decimal)
        {
            CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = CONST('LTY05'),
                                                                             "Staff No." = FIELD("No."),
                                                                             Closed = CONST(false)));
            // CalcFormula = Sum("HR Leave Ledger Entries"."No. of days" WHERE("Leave Type" = CONST('LTY05'),
            //                                                                  "Staff No." = FIELD("No."),
            //                                                                  Closed = CONST(false)));
            FieldClass = FlowField;
        }
        field(3977; "Appraisal Method"; Option)
        {
            OptionCaption = ' ,Normal Appraisal,360 Appraisal';
            OptionMembers = " ","Normal Appraisal","360 Appraisal";
        }
        field(3988; "Leave Type"; Code[20])
        {
            TableRelation = "HR Leave Types".Code;
        }
        field(3989; "Employee Type"; Option)
        {
            OptionCaption = ' ,Primary,Secondary,Board';
            OptionMembers = " ",Primary,Secondary,Board;
        }
        field(39003900; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                "Global Dimension 1 Name" := '';
                DimensionValue.Reset;
                DimensionValue.SetRange(DimensionValue.Code, "Global Dimension 1 Code");
                if DimensionValue.Find('-') then begin
                    "Global Dimension 1 Name" := DimensionValue.Name;
                end;
            end;
        }
        field(39003901; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            //TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                "Global Dimension 2 Name" := '';
                DimensionValue.Reset;
                DimensionValue.SetRange(DimensionValue.Code, "Global Dimension 2 Code");
                if DimensionValue.Find('-') then begin
                    "Global Dimension 2 Name" := DimensionValue.Name;
                end;
            end;
        }
        field(39003902; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(39003903; HR; Boolean)
        {
        }
        field(39003904; "Date Of Join"; Date)
        {
            Caption = 'Date Of Joining the Company';

            trigger OnValidate()
            begin

                if "Date Of Join" <> 0D then begin
                    "End Of Probation Date" := "Date Of Join" + 180;
                    "Pension Scheme Join" := "Date Of Join" + 360;
                    "Medical Scheme Join" := "Date Of Join" + 360;
                end else
                    "End Of Probation Date" := 0D;
            end;
        }
        field(39003905; "Date Of Leaving the Company"; Date)
        {
        }
        field(39003906; "Termination Grounds"; Option)
        {
            OptionCaption = ' ,Resignation,Non-Renewal Of Contract,Dismissal,Retirement,Death,Other';
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;
        }
        field(39003907; "Cell Phone Number"; Text[15])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(39003908; Grade; Code[10])
        {
            TableRelation = "HR Lookup Values".Code WHERE(Type = CONST(Grade));
            //TableRelation = "HR Lookup Values".Code WHERE(Type = CONST(Grade));
        }
        field(39003909; "Employee UserID"; Code[30])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(39003910; "Leave Balance"; Decimal)
        {
        }
        field(39003911; "Leave Status"; Option)
        {
            OptionCaption = ' ,On Leave,Resumed';
            OptionMembers = " ","On Leave",Resumed;
        }
        field(39003912; "Pension Scheme Join Date"; Date)
        {
        }
        field(39003913; "Medical Scheme Join Date"; Date)
        {
        }
        field(39003914; "Leave Type Filter"; Code[20])
        {
            TableRelation = "HR Leave Types";
        }
        field(39003915; "Acrued Leave Days"; Decimal)
        {
        }
        field(39003925; "Basic Pay"; Decimal)
        {

            trigger OnValidate()
            begin
                //must be within Salary Grade
                SalCard.Reset;
                //salGrade.SetRange(salGrade."Salary Grade", "Salary Grade");
                if salGrade.Find('-') then begin
                    if ("Basic Pay" < salGrade."Minimum Amount") then
                        Error('Basic Pay Must be greater than ' + Format(salGrade."Minimum Amount"));
                    if ("Basic Pay" > salGrade."Maxmum Amount") then
                        Error('Basic Pay Must be greater than ' + Format(salGrade."Maxmum Amount"));
                end;
            end;
        }
        field(39003928; "Last Date Modified By"; Code[30])
        {
            Editable = false;
        }
        field(39003930; "Global Dimension 1 Name"; Text[60])
        {
            Editable = false;
        }
        field(39003931; "Global Dimension 2 Name"; Text[60])
        {
            Editable = false;
        }
        field(39003932; "Effective From Date"; Date)
        {
        }
        field(39003933; "Expiry Date"; Date)
        {
        }
        field(39003934; Activate; Option)
        {
            OptionCaption = ',re-engage,re-instate';
            OptionMembers = ,"re-engage","re-instate";

            trigger OnValidate()
            begin
                if Status = Status::InActive then begin
                    if Activate = Activate::"re-instate"
                      then begin
                        Status := Status::Active;
                    end;
                    if Activate = Activate::"re-engage"
                      then begin
                        Status := Status::Active;
                        "Date Of Join" := 0D;
                    end;
                    Modify;
                end;
            end;
        }
        field(39003935; "Supervisor Code"; Code[50])
        {
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            var
                UserSetup: Record "User Setup";
            begin
                UserSetup.Get("Supervisor Code");
                "Supervisor Name" := UserSetup."Full Name";
                Modify;
            end;
        }
        field(39003936; "Supervisor Name"; Text[50])
        {
            Editable = false;
        }
        field(39003937; "Probation Duration"; DateFormula)
        {

            trigger OnValidate()
            begin
                "End Of Probation Date" := CalcDate("Probation Duration", "Date Of Join");
            end;
        }
        field(39003938; Users; Text[50])
        {
        }
        field(39003939; "Reason For Status Change"; Code[40])
        {
        }
        field(39003940; "Employee Group"; Option)
        {
            OptionMembers = Unionisable,Management;
        }
        field(39003941; "Residential status"; Option)
        {
            OptionMembers = Resident,"Non Resident";
        }
        field(39003942; "Type of Employee"; Option)
        {
            OptionMembers = Primary,Secondary;
        }
        field(39003943; Year; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "First Name")
        {
        }
        key(Key3; "Middle Name")
        {
        }
        key(Key4; "Last Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Initials, "First Name", "Middle Name", "Last Name")
        {
        }
    }

    trigger OnInsert()
    begin

        if "No." = '' then begin
            HrSetup.Get;
            HrSetup.TestField("Employee Nos.");
            ////NoSeriesMgtInitSeries(HrSetup."Employee Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        /*
        //Insert on Salary card
        SalCard.RESET;
        SalCard.INIT;
        SalCard."Employee Code":="No.";
        SalCard.INSERT;
        */

    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
        "Last Date Modified By" := UserId;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    var
        salGrade: Record "Salary Grades";
        Res: Record Resource;
        PostCode: Record "Post Code";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        ////NoSeriesMgt: Codeunit NoSeriesManagement;
        OK: Boolean;
        User: Record "User Setup";
        ERROR1: Label 'Employee Career History Starting Information already exist.';
        MSG1: Label 'Employee Career History Starting Information successfully created.';
        ReasonDiaglog: Dialog;
        EmpQualification: Record "Employee Qualification";
        PayStartDate: Date;
        PayPeriodText: Text[30];
        ToD: Date;
        CurrentMonth: Date;
        HrSetup: Record "HR Setup";
        SalCard: Record "PR Salary Card";
        PRPayrollPeriod: Record "PR Payroll Periods";
        EmpTrans: Record "PR Employee Transactions";
        EmpTransR: Record "PR Employee Transactions";
        //UserMgt: Codeunit "User Management";
        DimVal: Record "Dimension Value";
        objJobs: Record "HR Jobs";
        HREmp: Record "HR Employees";
        EmpFullName: Text;
        SPACER: Label ' ';
        yDOB: Integer;
        yTODAY: Integer;
        noYrsToRetirement: Integer;
        RetirementYear: Integer;
        AppAge: Integer;
        RetirementYear2: Text;
        //Dates: Codeunit "HR Codeunit2";
        DimensionValue: Record "Dimension Value";
        RetirementDate: Date;
        dDOB: Integer;
        mDOB: Integer;
        DaystoRetirement: Text;
        HasHRSetup: Boolean;
        PRPeriodTrans: Record "PR Period Transactions";
        Text0005: Label 'Please note that ALL PAYROLL TRANSACTIONS PROCESSED for [EMPLOYEE  :: %1 - %2  ] in the [CURRENT PAYROLL PERIOD :: %3 ] will be deleted. \\Proceed?';
        ag: Integer;
    //HRCodeunit: Codeunit "HR Codeunit";
    // Smtp: Codeunit "SMTP Mail";

    //[Scope('Internal')]
    // procedure AssistEdit(): Boolean
    // begin
    //     // GetHRSetup;
    //     HrSetup.TestField("Employee Nos.");
    //     if //NoSeriesMgtSelectSeries(HrSetup."Employee Nos.", xRec."No. Series", "No. Series") then begin
    //         //NoSeriesMgtSetSeries("No.");
    //         exit(true);
    //     end;
    // end;

    //[Scope('Internal')]
    //[Scope('Internal')]
    procedure FullName(): Text[100]
    begin
        if "Middle Name" = '' then
            exit("Known As" + ' ' + "Last Name")
        else
            exit("Known As" + ' ' + "Middle Name" + ' ' + "Last Name");
    end;

    //[Scope('Internal')]
    //[Scope('Internal')]
    procedure CurrentPayDetails()
    begin
    end;

    //[Scope('Internal')]
    //[Scope('Internal')]
    procedure UpdtResUsersetp(var HREmpl: Record "HR Succession Job Rotation")
    var
        Res: Record Resource;
        Usersetup: Record "User Setup";
    begin
        /*
        ContMgtSetup.GET;
        IF ContMgtSetup."Customer Integration" =
           ContMgtSetup."Customer Integration"::"No Integration"
        THEN
          EXIT;
        */
        /*
        Res.SETCURRENTKEY("No.");
        Res.SETRANGE("No.",HREmpl."Resource No.");
        IF Res.FIND('-') THEN BEGIN
          Res."Global Dimension 1 Code" := HREmpl."Department Code";
          Res."Global Dimension 2 Code" := HREmpl.Office;
          Res.MODIFY;
        END;
        
        IF Usersetup.GET(HREmpl."User ID") THEN BEGIN
          Usersetup.Department := HREmpl."Department Code";
          Usersetup.Office := HREmpl.Office;
          Usersetup.MODIFY;
        END;
        */

    end;

    //[Scope('Internal')]
    //[Scope('Internal')]
    procedure SetEmployeeHistory()
    begin
    end;

    //[Scope('Internal')]
    //[Scope('Internal')]
    procedure GetPayPeriod()
    begin
    end;

    local procedure fn_FullName()
    begin
        "Full Name" := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
    end;

    //[Scope('Internal')]
    //[Scope('Internal')]
    procedure GetHRSetup()
    begin
        if not HasHRSetup then begin
            HrSetup.Get;
            HasHRSetup := true;
        end;
    end;
}

