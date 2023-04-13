page 52186801 "Human Resource Role Center"
{
    Caption = 'Human Resource Role Center';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Control76; "Headline RC Accountant")
            {
                ApplicationArea = Basic, Suite;
            }

            part(Control1902304208; "Accountant Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control123; "Team Member Activities")
            {
                ApplicationArea = Suite;
            }
            part(Control1907692008; "My Accounts")
            {
                ApplicationArea = Basic, Suite;
            }

            part(Control9; "Help And Chart Wrapper")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control100; "Cash Flow Forecast Chart")
            {
                ApplicationArea = Basic, Suite;
            }
            part(Control108; "Report Inbox Part")
            {
                AccessByPermission = TableData "Report Inbox" = IMD;
                ApplicationArea = Basic, Suite;
            }
            part(Control122; "Power BI Report Spinner Part")
            {
                ApplicationArea = Basic, Suite;
            }
            systempart(Control1901377608; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
    actions
    {
        area(Sections)
        {
            group("Job Management")
            {
                Caption = 'Job Management';
                Image = ResourcePlanning;

                action("HR Job Management")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Jobs';
                    Image = Job;
                    RunObject = Page "HR Jobs List";
                }
                action("HR Job Qualifications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Job Qualifications';
                    RunObject = Page "HR Job Qualifications";
                }

            }
            group("HR Employee Recruitment")
            {
                Caption = 'HR Employee Recruitment';
                Image = Marketing;
                action("HR Employee Requisitions")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Employee Requisitions';
                    RunObject = Page "HR Employee Requisitions List";
                }
                action("HR Job Applications")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Job Applications';
                    RunObject = Page "HR Job Applications List";
                }
                action("HR Shortlisting")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Shortlisting';
                    RunObject = Page "HR Shortlisting List";
                }
                action("HR Job Applicant(s) Qualified")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Job Applicant(s) Qualified';
                    RunObject = Page "HR Job Applicants Qualified L";
                }
                action("HR Job Applicant(s) UnQualified")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Job Applicant(s) UnQualified';
                    RunObject = Page "HR Applicants UnQualified L";
                }
                action("HR Successful Job Applicant(s)")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Successful Job Applicant(s)';
                    RunObject = Page "HR  App Qualified Applicants";
                }
                action("HR Job Applicants Uploaded")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Job Applicants Uploaded';
                    RunObject = Page "HR Job Applicants Uploaded";
                }
                action("HR Employee Requisitions Approved")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Employee Requisitions Approved';
                    RunObject = Page "HR Employee Reqs List Approved";
                }
            }
            group("HR Employee Management")
            {
                Caption = 'HR Employee Management';
                Image = HumanResources;
                action("HR Induction Schedule")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Induction Schedule';
                    RunObject = Page "HR Induction Schedule List";
                }
                action("Unapproved HR Employee-List (All)")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Unapproved HR Employee-List (All)';
                    RunObject = Page "HR Employee List - Pending App";
                }
                action("Approved HR Employee-List (All)")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved HR Employee-List (All)';
                    RunObject = Page "HR Employee List - Active";
                }
                action("Approved HR Employee-List (Permanent)")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved HR Employee-List (Permanent)';
                    RunObject = Page "HR Employee List - New";
                }
                action("Approved HR Employee-List (Contract)")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved HR Employee-List (Contract)';
                    RunObject = Page "HR Employee-List (Contract) Ap";
                }
                action("Approved HR Employee-List (Casuals)")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved HR Employee-List (Casuals)';
                    RunObject = Page "HR Employee-List (Casuals) App";
                }
                action("Approved HR Employee-List (Interns)")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Approved HR Employee-List (Interns)';
                    RunObject = Page "HR Employee-List (Interns) App";
                }
                action("Deactivated HR Employee-List")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Deactivated HR Employee-List';
                    RunObject = Page "HR Employee-List Disabled";
                }
            }
            group(" HR Leave Management")
            {
                Caption = 'HR Leave Management';
                Image = Capacities;
                action("HR Leave Applications")
                {
                    Caption = 'HR Leave Applications';
                    RunObject = Page "HR Leave Applications List";
                }
                action("HR Leave Reimbursments")
                {
                    Caption = 'HR Leave Reimbursments';
                    RunObject = Page "HR Leave Reimbursment List";
                }
                action("HR Leave Types")
                {
                    Caption = 'HR Leave Types';
                    RunObject = Page "HR Leave Types";
                }
                action("HR Leave Periods")
                {
                    Caption = 'HR Leave Periods';
                    RunObject = Page "HR Leave Period List";
                }
                action("HR Leave Applications History")
                {
                    Caption = 'HR Leave Applications History';
                    RunObject = Page "HR Leave Applications History";
                }
            }
            group("HR Training Management")
            {
                Caption = 'HR Training Management';
                Image = Payables;
                action("HR Training Needs")
                {
                    Caption = 'HR Training Needs';
                    RunObject = Page "HR Training Needs List";
                }
                action("HR Training Applications")
                {
                    Caption = 'HR Training Applications';
                    RunObject = Page "HR Training Application List";
                }
                action("HR Training Applications - Approved")
                {
                    Caption = 'HR Training Applications - Approved';
                    RunObject = Page "HR Training App List -Approved";
                }
            }
            group("Company Activities")
            {
                Caption = 'Company Activities';
                Image = Dimensions;
                action("HR Company Activities")
                {
                    Caption = 'HR Company Activities';
                    RunObject = Page "HR Company Activities List";
                }
                action("HR Closed Company Activities")
                {
                    Caption = 'HR Closed Company Activities';
                    RunObject = Page "HR Company Activities List Clo";
                }
            }
            group("Disciplinary Management")
            {
                Caption = 'Disciplinary Management';
                Image = Statistics;
                action("HR Disciplinary Cases")
                {
                    Caption = 'HR Disciplinary Cases';
                    RunObject = Page "HR Disciplinary Cases List N";
                }
                action("HR Closed Disciplinary Cases")
                {
                    Caption = 'HR Closed Disciplinary Cases';
                    RunObject = Page "HR Disciplinary Cases ListClsd";
                }
                action("HR Disciplinary Actions")
                {
                    Caption = 'HR Disciplinary Actions';
                    RunObject = Page "HR Disciplinary Actions";
                }
            }
            group("BSC Appraisal")
            {
                Caption = 'BSC Appraisal';
                Image = CostAccounting;
                action("HR BSC List Target Setting")
                {
                    Caption = 'HR BSC List Target Setting';
                    RunObject = Page "HR BSC List Targets";
                }
                action("HR BSC List Review")
                {
                    Caption = 'HR BSC List Review';
                    RunObject = Page "HR BSC List Review";
                }
                action("HR BSC List End Year")
                {
                    Caption = 'HR BSC List End Year';
                    RunObject = Page "HR BSC List End Year";
                }
            }
            group("Professional Bodies")
            {
                Caption = 'Professional Bodies';
                Image = FiledPosted;
                action("HR Professional Bodies")
                {
                    Caption = 'HR Professional Bodies';
                    RunObject = Page "HR Professional Bodies List";
                }
            }
            group("Employee Promotion")
            {
                Caption = 'Employee Promotion';
                Image = ExecuteBatch;
                action("HR Promotion Recommendations")
                {
                    Caption = 'HR Promotion Recommendations';
                    RunObject = Page "HR Promotion Recommend List";
                }
                action("Effected HR Promotion Recommendations")
                {
                    Caption = 'Effected HR Promotion Recommendations';
                    RunObject = Page "HR Promotion Recommend AppList";
                }
            }
            group("Exit interviews")
            {
                Caption = 'HR Exit Management';
                Image = Alerts;
                action("HR Exit Interviews")
                {
                    Caption = 'HR Exit Interviews';
                    RunObject = Page "HR Exit Interview list";
                }
                action("HR Closed Exit Interviews")
                {
                    Caption = 'HR Closed Exit Interviews';
                    RunObject = Page "Closed HR Exit Interview list";
                }
            }
            group("HR General Setup")
            {
                Caption = 'HR General Setup';
                action("HR Leave Calender")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Leave Calender';
                    RunObject = page "HR Leave Calendar List";
                }
                action("Lookup Value")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'HR Lookup Value';
                    RunObject = page "HR Lookup Values List";
                }
                action("Commitees")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Committes';
                    RunObject = page "HR Committees";
                }
                action("Policies")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Policies';
                    RunObject = Page "HR Policies";
                    ;
                }
                action("Email Parameters")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Email Parameters';
                    RunObject = page "HR E-Mail Parameters List";
                }

            }
            group("Staff Loan")
            {
                Caption = 'StaffLoan';
                action("HR Staffloan")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Staff loans';
                    RunObject = Page "prSalary Advance";
                }
            }
        }//END  SECTIONS
        area(reporting)
        {
            action("Pay Advice")
            {
                Caption = 'Pay Advice';
                Image = Currencies;
                RunObject = Report prPaySlip2Local;
            }
            action("Payroll Benefits")
            {
                Caption = 'Payroll Benefits';
                Image = Resource;
                RunObject = Report "PR Payroll Summary";
            }
            action("Payroll Deductions")
            {
                Caption = 'Payroll ITAX Report';
                Image = AdjustEntries;
                RunObject = Report "PR iTax Report";
            }
            action("Payroll Provident Fund")
            {
                Caption = 'Payroll Provident Fund';
                Image = BankContact;
                RunObject = Report P10A;
            }
            action("P10")
            {
                Caption = 'P10';
                Image = PaymentForecast;
                RunObject = Report P10;
            }
            action("Payroll Summary")
            {
                Caption = 'Payroll Summary';
                Image = PaymentHistory;
                RunObject = Report "PR Payroll Summary";
            }
            action("NSSF Report")
            {
                Caption = 'NSSF Report';
                Image = Payment;
                RunObject = Report "PR NSSF NEW";
            }
            action("Payroll Bank Details")
            {
                Caption = 'Payroll Bank Details';
                Image = Bank;
                RunObject = Report "prBank Payments";
            }
            // action("Payroll Bank DetailsByBranch")
            // {
            //     Caption = 'Payroll Bank DetailsByBranch';
            //     Image = BankAccount;
            //     RunObject = Report "PR Bank Summary";
            // }
            // action("prPayroll Bank Summary")
            // {
            //     Caption = 'prPayroll Bank Summary';
            //     Image = BankAccountStatement;
            //     RunObject = Report "PR E-Mail Individual Payslip";
            // }
            action("Payroll Details")
            {
                Caption = 'Payroll Details';
                Image = CustomerLedger;
                RunObject = Report "prPayroll Details";
            }
            action("GRA Form 51")
            {
                Caption = 'GRA Form 51';
                Image = AdjustVATExemption;
                RunObject = Report "prGRA Form 51";
            }
            action("Pension Details")
            {
                Caption = 'Pension Details';
                Image = Allocations;
                RunObject = Report "prStaff Pension Contribution";
            }
            action("ZRA Form 51")
            {
                Caption = 'ZRA Form 51';
                Image = "1099Form";
                RunObject = Report "prZRA Form 51";
            }
        }//End reports
        area(embedding)
        {
            action("Salary")
            {
                Caption = 'Salary List';
                RunObject = Page "PR Salary List (ALL)";
            }
            action("Salary Process")
            {
                Caption = 'Salary Process';
                RunObject = Page "Payroll Salary Process";
            }
            action("Bank Branches")
            {
                Caption = 'Bank Branches';
                RunObject = Page "Payroll Salary Process";
            }
        }//END  EMBEDDING
        area(processing)
        {
            action("HR Leave Adjustments")
            {
                Caption = 'HR Leave Adjustments';
                Image = LimitedCredit;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category6;
                RunObject = Page "HR Leave Journal Lines";
            }
        }//end processing
    }//END  ACTION MAIN
    // actions

    // {
    //     area(processing)
    //     {
    //         action("HR Leave Adjustments")
    //         {
    //             Caption = 'HR Leave Adjustments';
    //             Image = LimitedCredit;
    //             //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
    //             //PromotedCategory = Category6;
    //             RunObject = Page "HR Leave Journal Lines";
    //         }
    //     }
    //     area(Sections)
    //     {
    //         group("Group")
    //         {
    //             Caption = 'Human Resource';
    //             action("Human Resource")
    //             {
    //                 ApplicationArea = Jobs;
    //                 Caption = 'Human Resource';
    //                 RunObject = page "HR General Manager Cue";
    //             }

    //             group("Employees")
    //             {
    //                 Caption = 'HR Employees';
    //                 action("HR Employees")
    //                 {
    //                     ApplicationArea = Basic, Suite;
    //                     Caption = 'HR Employees';
    //                     RunObject = page "HR Employee List - (FixedTc)";
    //                 }
    //                 action("Active Employees")
    //                 {
    //                     ApplicationArea = Jobs;
    //                     Caption = 'HR Employeees Active';
    //                     RunObject = page "HR Employee List - Active";
    //                 }
    //                 action("Inactive Employees")
    //                 {
    //                     ApplicationArea = Jobs;
    //                     Caption = 'HR Employeees Active';
    //                     RunObject = page "HR Employee List - InActive";
    //                 }
    //                 action("ctive Employees")
    //                 {
    //                     ApplicationArea = Jobs;
    //                     Caption = 'HR Employeees Active';
    //                     RunObject = page "HR Employee List - New";
    //                 }
    //             }
    //             group("Group3")
    //             {
    //                 Caption = 'Staff Application';
    //                 action("Overtime  Application")
    //                 {
    //                     ApplicationArea = Jobs;
    //                     Caption = 'Overtime  Application';
    //                     RunObject = Page "HR Overtime List";
    //                     RunPageView = WHERE(Status = CONST(New));
    //                 }
    //                 action("Training Application")
    //                 {
    //                     ApplicationArea = Jobs;
    //                     Caption = 'Training Application';
    //                     RunObject = Page "HR Emp Training Appl. Req List";
    //                     RunPageView = WHERE(Status = CONST(New));
    //                 }
    //                 action("Medical Claim Application")
    //                 {
    //                     ApplicationArea = Jobs;
    //                     Caption = 'Medical Claim Application';
    //                     RunObject = Page "HR Medical Claims List";
    //                 }
    //                 action("Transport Request")
    //                 {
    //                     ApplicationArea = Jobs;
    //                     Caption = 'Transport Request';
    //                     RunObject = Page "HR Transport Requests List";
    //                 }
    //                 action("Leave Application")
    //                 {
    //                     ApplicationArea = Jobs;
    //                     Caption = 'Leave Application';
    //                     RunObject = Page "HR Leave Applications List";
    //                 }
    //                 action(Appraisal)
    //                 {
    //                     ApplicationArea = Jobs;
    //                     Caption = 'Appraisal';
    //                     RunObject = Page "HR 360 Appraisals List - TS";
    //                     RunPageView = WHERE(Status = CONST(Open));
    //                 }


    //             }
    //             group("Recruitment Management")
    //             {
    //                 Caption = 'Recruitment Management';
    //                 Image = Marketing;
    //                 action("HR Employee Requisitions")
    //                 {
    //                     Caption = 'HR Employee Requisitions';
    //                     RunObject = Page "HR Employee Requisitions List";
    //                 }
    //                 action("HR Job Applications")
    //                 {
    //                     Caption = 'HR Job Applications';
    //                     RunObject = Page "HR Job Applications List";
    //                 }
    //                 action("HR Shortlisting")
    //                 {
    //                     Caption = 'HR Shortlisting';
    //                     RunObject = Page "HR Shortlisting List";
    //                 }
    //                 action("HR Job Applicant(s) Qualified")
    //                 {
    //                     Caption = 'HR Job Applicant(s) Qualified';
    //                     RunObject = Page "HR Job Applicants Qualified L";
    //                 }
    //                 action("HR Job Applicant(s) UnQualified")
    //                 {
    //                     Caption = 'HR Job Applicant(s) UnQualified';
    //                     RunObject = Page "HR Applicants UnQualified L";
    //                 }
    //                 action("HR Successful Job Applicant(s)")
    //                 {
    //                     Caption = 'HR Successful Job Applicant(s)';
    //                     RunObject = Page "HR  App Qualified Applicants";
    //                 }
    //                 action("HR Job Applicants Uploaded")
    //                 {
    //                     Caption = 'HR Job Applicants Uploaded';
    //                     RunObject = Page "HR Job Applicants Uploaded";
    //                 }
    //                 action("HR Employee Requisitions Approved")
    //                 {
    //                     Caption = 'HR Employee Requisitions Approved';
    //                     RunObject = Page "HR Employee Reqs List Approved";
    //                 }
    //             }
    //             group("Employee Management")
    //             {
    //                 Caption = 'Employee Management';
    //                 Image = HumanResources;
    //                 action("HR Induction Schedule")
    //                 {
    //                     Caption = 'HR Induction Schedule';
    //                     RunObject = Page "HR Induction Schedule List";
    //                 }
    //                 action("Unapproved HR Employee-List (All)")
    //                 {
    //                     Caption = 'Unapproved HR Employee-List (All)';
    //                     RunObject = Page "HR Employee List - Pending App";
    //                 }
    //                 action("Approved HR Employee-List (All)")
    //                 {
    //                     Caption = 'Approved HR Employee-List (All)';
    //                     RunObject = Page "HR Employee List - Active";
    //                 }
    //                 action("Approved HR Employee-List (Permanent)")
    //                 {
    //                     Caption = 'Approved HR Employee-List (Permanent)';
    //                     RunObject = Page "HR Employee List - New";
    //                 }
    //                 action("Approved HR Employee-List (Contract)")
    //                 {
    //                     Caption = 'Approved HR Employee-List (Contract)';
    //                     RunObject = Page "HR Employee-List (Contract) Ap";
    //                 }
    //                 action("Approved HR Employee-List (Casuals)")
    //                 {
    //                     Caption = 'Approved HR Employee-List (Casuals)';
    //                     RunObject = Page "HR Employee-List (Casuals) App";
    //                 }
    //                 action("Approved HR Employee-List (Interns)")
    //                 {
    //                     Caption = 'Approved HR Employee-List (Interns)';
    //                     RunObject = Page "HR Employee-List (Interns) App";
    //                 }
    //                 action("Deactivated HR Employee-List")
    //                 {
    //                     Caption = 'Deactivated HR Employee-List';
    //                     RunObject = Page "HR Employee-List Disabled";
    //                 }
    //             }
    //             group("Employee Confirmation")
    //             {
    //                 Caption = 'Employee Confirmation';
    //                 Image = Confirm;
    //                 action("HR Employee Confirmation")
    //                 {
    //                     Caption = 'HR Employee Confirmation';
    //                     RunObject = Page "HR Employee Confirmation List";
    //                 }
    //             }
    //             group("Employee Promotion")
    //             {
    //                 Caption = 'Employee Promotion';
    //                 Image = ExecuteBatch;
    //                 action("HR Promotion Recommendations")
    //                 {
    //                     Caption = 'HR Promotion Recommendations';
    //                     RunObject = Page "HR Promotion Recommend List";
    //                 }
    //                 action("Effected HR Promotion Recommendations")
    //                 {
    //                     Caption = 'Effected HR Promotion Recommendations';
    //                     RunObject = Page "HR Promotion Recommend AppList";
    //                 }
    //             }
    //             group("Professional Bodies")
    //             {
    //                 Caption = 'Professional Bodies';
    //                 Image = FiledPosted;
    //                 action("HR Professional Bodies")
    //                 {
    //                     Caption = 'HR Professional Bodies';
    //                     RunObject = Page "HR Professional Bodies List";
    //                 }
    //             }
    //             group("Employee Transfer")
    //             {
    //                 Caption = 'Employee Transfer';
    //                 Image = Departments;
    //                 action("HR Employee Transfer")
    //                 {
    //                     Caption = 'HR Employee Transfer';
    //                     RunObject = Page "HR Employee Transfer List";
    //                 }
    //                 action("Effected HR Employee Transfer")
    //                 {
    //                     Caption = 'Effected HR Employee Transfer';
    //                     RunObject = Page "HR Employee Transfer List Effe";
    //                 }
    //             }
    //             group("Asset Transfer")
    //             {
    //                 Caption = 'Asset Transfer';
    //                 Image = FixedAssets;
    //                 action("HR Asset Transfer")
    //                 {
    //                     Caption = 'HR Asset Transfer';
    //                     RunObject = Page "HR Asset Transfer List";
    //                 }
    //                 action("Effected HR Asset Transfer")
    //                 {
    //                     Caption = 'Effected HR Asset Transfer';
    //                     RunObject = Page "HR EffectedAsset Transfer List";
    //                 }
    //             }
    //             group("Transport Management")
    //             {
    //                 Caption = 'Transport Management';
    //                 Image = AnalysisView;
    //                 action("HR Transport Requisitions")
    //                 {
    //                     Caption = 'HR Transport Requisitions';
    //                     RunObject = Page "HR Transport Requisition List";
    //                 }
    //                 action("HR Transport Allocations")
    //                 {
    //                     Caption = 'HR Transport Allocations';
    //                     RunObject = Page "HR Transport Allocations List";
    //                 }
    //                 action("Company Pool Vehicles")
    //                 {
    //                     Caption = 'Company Pool Vehicles';
    //                     RunObject = Page "Company Vehicles list";
    //                 }
    //             }
    //             group("Medical Scheme Management")
    //             {
    //                 Caption = 'Medical Scheme Management';
    //                 Image = Travel;
    //                 action("HR Medical Schemes")
    //                 {
    //                     Caption = 'HR Medical Schemes';
    //                     RunObject = Page "HR Medical Schemes List";
    //                 }
    //                 action("HR Medical Scheme Members")
    //                 {
    //                     Caption = 'HR Medical Scheme Members';
    //                     RunObject = Page "HR Medical Scheme Members List";
    //                 }
    //                 action("HR Medical Claims")
    //                 {
    //                     Caption = 'HR Medical Claims';
    //                     RunObject = Page "HR Medical Claims List";
    //                 }
    //             }
    //             group("Overtime Management")
    //             {
    //                 Caption = 'Overtime Management';
    //                 Image = Reconcile;
    //                 action("HR Overtime")
    //                 {
    //                     Caption = 'HR Overtime';
    //                     RunObject = Page "HR Overtime List";
    //                 }
    //                 action("HR Overtime Rates")
    //                 {
    //                     Caption = 'HR Overtime Rates';
    //                     RunObject = Page "HR Overtime Rates List";
    //                 }
    //                 action("HR Converted Overtime")
    //                 {
    //                     Caption = 'HR Converted Overtime';
    //                     RunObject = Page "HR Overtime List - Converted";
    //                 }
    //             }
    //             group("360 degrees Appraisal")
    //             {
    //                 Caption = '360 degrees Appraisal';
    //                 Image = Calculator;
    //                 action("HR 360 Appraisals List - Appraisee")
    //                 {
    //                     Caption = 'HR 360 Appraisals List - Appraisee';
    //                     RunObject = Page "HR 360 Appraisals List - TS";
    //                 }
    //                 action("HR 360 Appraisals List - Supervisor")
    //                 {
    //                     Caption = 'HR 360 Appraisals List - Supervisor';
    //                     RunObject = Page "HR 360 Appraisals List - TA";
    //                 }
    //                 action("HR 360 Appraisals List - Evaluation")
    //                 {
    //                     Caption = 'HR 360 Appraisals List - Evaluation';
    //                     RunObject = Page "HR 360 Appraisals List - EV";
    //                 }
    //                 action("HR Appraisal Evaluation Areas - Job Specific")
    //                 {
    //                     Caption = 'HR Appraisal Evaluation Areas - Job Specific';
    //                     RunObject = Page "HR Appraisal Eval Areas - JS";
    //                 }
    //                 action("HR Appraisal Evaluation Areas - Employee's Peers")
    //                 {
    //                     Caption = 'HR Appraisal Evaluation Areas - Employee''s Peers';
    //                     RunObject = Page "HR Appraisal Eval Areas - EP";
    //                 }
    //                 action("HR Appraisal Evaluation Areas - Employee's Subordinates")
    //                 {
    //                     Caption = 'HR Appraisal Evaluation Areas - Employee''s Subordinates';
    //                     RunObject = Page "HR Appraisal Eval Areas - ES";
    //                 }
    //                 action("HR Appraisal Evaluation Areas - External Sources")
    //                 {
    //                     Caption = 'HR Appraisal Evaluation Areas - External Sources';
    //                     RunObject = Page "HR Appraisal Eval Areas - ExS";
    //                 }
    //                 action("Human Resource Unit of Measure")
    //                 {
    //                     Caption = 'Human Resource Unit of Measure';
    //                     RunObject = Page "Human Resource Unit of Measure";
    //                 }
    //             }
    //             group("BSC Appraisal")
    //             {
    //                 Caption = 'BSC Appraisal';
    //                 Image = CostAccounting;
    //                 action("HR BSC List Target Setting")
    //                 {
    //                     Caption = 'HR BSC List Target Setting';
    //                     RunObject = Page "HR BSC List Targets";
    //                 }
    //                 action("HR BSC List Review")
    //                 {
    //                     Caption = 'HR BSC List Review';
    //                     RunObject = Page "HR BSC List Review";
    //                 }
    //                 action("HR BSC List End Year")
    //                 {
    //                     Caption = 'HR BSC List End Year';
    //                     RunObject = Page "HR BSC List End Year";
    //                 }
    //             }
    //             group("Training Management")
    //             {
    //                 Caption = 'Training Management';
    //                 Image = Payables;
    //                 action("HR Training Needs")
    //                 {
    //                     Caption = 'HR Training Needs';
    //                     RunObject = Page "HR Training Needs List";
    //                 }
    //                 action("HR Training Applications")
    //                 {
    //                     Caption = 'HR Training Applications';
    //                     RunObject = Page "HR Training Application List";
    //                 }
    //                 action("HR Training Applications - Approved")
    //                 {
    //                     Caption = 'HR Training Applications - Approved';
    //                     RunObject = Page "HR Training App List -Approved";
    //                 }
    //             }
    //             group("Succession Planning")
    //             {
    //                 Caption = 'Succession Planning';
    //                 Image = ResourcePlanning;
    //                 action("HR Jobs to Succeed")
    //                 {
    //                     Caption = 'HR Jobs to Succeed';
    //                     RunObject = Page "HR Jobs to Succeed List";
    //                 }
    //                 action("HR Succession Planning List")
    //                 {
    //                     Caption = 'HR Succession Planning List';
    //                     RunObject = Page "HR Succession Planning List";
    //                 }
    //             }
    //             group("Disciplinary Management")
    //             {
    //                 Caption = 'Disciplinary Management';
    //                 Image = Statistics;
    //                 action("HR Disciplinary Cases")
    //                 {
    //                     Caption = 'HR Disciplinary Cases';
    //                     RunObject = Page "HR Disciplinary Cases List N";
    //                 }
    //                 action("HR Closed Disciplinary Cases")
    //                 {
    //                     Caption = 'HR Closed Disciplinary Cases';
    //                     RunObject = Page "HR Disciplinary Cases ListClsd";
    //                 }
    //                 action("HR Disciplinary Actions")
    //                 {
    //                     Caption = 'HR Disciplinary Actions';
    //                     RunObject = Page "HR Disciplinary Actions";
    //                 }
    //             }
    //             group("Leave Management")
    //             {
    //                 Caption = 'Leave Management';
    //                 Image = Capacities;
    //                 action("HR Leave Applications")
    //                 {
    //                     Caption = 'HR Leave Applications';
    //                     RunObject = Page "HR Leave Applications List";
    //                 }
    //                 action("HR Leave Reimbursments")
    //                 {
    //                     Caption = 'HR Leave Reimbursments';
    //                     RunObject = Page "HR Leave Reimbursment List";
    //                 }
    //                 action("HR Leave Types")
    //                 {
    //                     Caption = 'HR Leave Types';
    //                     RunObject = Page "HR Leave Types";
    //                 }
    //                 action("HR Leave Periods")
    //                 {
    //                     Caption = 'HR Leave Periods';
    //                     RunObject = Page "HR Leave Period List";
    //                 }
    //                 action("HR Leave Applications History")
    //                 {
    //                     Caption = 'HR Leave Applications History';
    //                     RunObject = Page "HR Leave Applications History";
    //                 }
    //             }
    //             group("Shift Management")
    //             {
    //                 Caption = 'Shift Management';
    //                 Image = Job;
    //                 action("HR Login Management")
    //                 {
    //                     Caption = 'HR Login Management';
    //                     RunObject = Page "HR Emp. Login Management List";
    //                 }
    //                 action("HR Shift Management")
    //                 {
    //                     Caption = 'HR Shift Management';
    //                     RunObject = Page "HR Shift Management List";
    //                 }
    //                 action("HR Shift Schedule")
    //                 {
    //                     Caption = 'HR Shift Schedule';
    //                     RunObject = Page "HR Shift Schedule Header List";
    //                 }
    //             }
    //             group("Company Activities")
    //             {
    //                 Caption = 'Company Activities';
    //                 Image = Dimensions;
    //                 action("HR Company Activities")
    //                 {
    //                     Caption = 'HR Company Activities';
    //                     RunObject = Page "HR Company Activities List";
    //                 }
    //                 action("HR Closed Company Activities")
    //                 {
    //                     Caption = 'HR Closed Company Activities';
    //                     RunObject = Page "HR Company Activities List Clo";
    //                 }
    //             }
    //             group("Occupational Health and Safety")
    //             {
    //                 Caption = 'Occupational Health and Safety';
    //                 Image = LotInfo;
    //                 action("HR Incidents")
    //                 {
    //                     Caption = 'HR Incidents';
    //                     RunObject = Page "HR OSIncident List";
    //                 }
    //                 action("HR Investigations")
    //                 {
    //                     Caption = 'HR Investigations';
    //                     RunObject = Page "HR OSInvestigation List";
    //                 }
    //                 action("HR Inspection")
    //                 {
    //                     Caption = 'HR Inspection';
    //                     RunObject = Page "HR OSInspection List";
    //                 }
    //                 action("HR Safety Rules")
    //                 {
    //                     Caption = 'HR Safety Rules';
    //                     RunObject = Page "HR OSSafety Rules";
    //                 }
    //             }
    //             group("Exit Management")
    //             {
    //                 Caption = 'Exit Management';
    //                 Image = Alerts;
    //                 action("HR Exit Interviews")
    //                 {
    //                     Caption = 'HR Exit Interviews';
    //                     RunObject = Page "HR Exit Interview list";
    //                 }
    //                 action("HR Closed Exit Interviews")
    //                 {
    //                     Caption = 'HR Closed Exit Interviews';
    //                     RunObject = Page "Closed HR Exit Interview list";
    //                 }
    //             }
    //             group(Approvals)
    //             {
    //                 Caption = 'Approvals';
    //                 Image = AdministrationSalesPurchases;
    //                 action("Approval Entries")
    //                 {
    //                     Caption = 'Approval Entries';
    //                     RunObject = Page "Approval Entries";
    //                 }
    //             }


    //         }

    //     }
    // }
}

profile "Human Resource RTC"
{
    Caption = 'Human Resource';
    RoleCenter = "Human Resource Role Center";
}