// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185478 "HR Leave Adjustment"
// {
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem("HR EMPLOYEES"; "HR EMPLOYEES")
//         {
//             DataItemTableView = sorting("No.") order(ascending) where(Status = filter(Active));
//             RequestFilterFields = "No.", "Global Dimension 1 Code", "Global Dimension 2 Code";
//             column(ReportForNavId_1; 1)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin

//                 "HR Employees".TestField(Gender);
//                 "HR Employees".TestField("Global Dimension 1 Code");
//                 "HR Employees".TestField("Global Dimension 2 Code");

//                 //Get current leave period
//             //     HRLeaveCal.Reset;
//             //     HRLeaveCal.SetRange(HRLeaveCal."Current Leave Calendar", true);
//             //     if HRLeaveCal.Find('-') then begin
//             //         HRLeaveTypes.Reset;
//             //         if LeaveTypeFilter <> '' then begin
//             //             HRLeaveTypes.SetRange(HRLeaveTypes.Code, LeaveTypeFilter);
//             //         end;

//             //         if HRLeaveTypes.Find('-') then begin
//             //             repeat
//             //                 HRLeaveLedger.SetRange(HRLeaveLedger."Staff No.", "HR Employees"."No.");
//             //                 HRLeaveLedger.SetRange(HRLeaveLedger."Leave Type", HRLeaveTypes.Code);
//             //                 HRLeaveLedger.SetRange(HRLeaveLedger."Leave Entry Type", LeaveEntryType);
//             //                 HRLeaveLedger.SetFilter(HRLeaveLedger."Leave Posting Description", '<>%1', '*B/F');
//             //                 HRLeaveLedger.SetRange(HRLeaveLedger."Leave Calendar Code", HRLeaveCal."Calendar Code");
//             //                 if not HRLeaveLedger.Find('-') then begin
//             //                     OK := CheckGender("HR Employees", HRLeaveTypes);
//             //                     if OK then begin
//             //                         begin
//             //                             HRJournalLine.Init;
//             //                             "Journal Template Name" := Text0001;
//             //                             HRJournalLine.Validate("Journal Template Name");

//             //                             "Journal Batch Name" := Format(BatchName);
//             //                             "Line No." := "Line No." + 1000;

//             //                             "Leave Calendar Code" := HRLeaveCal."Calendar Code";
//             //                             HRJournalLine.Validate("Leave Calendar Code");

//             //                             "Leave Period Start Date" := HRLeaveCal."Start Date";
//             //                             HRJournalLine.Validate("Leave Period Start Date");

//             //                             "Staff No." := "HR Employees"."No.";
//             //                             HRJournalLine.Validate("Staff No.");

//             //                             "Posting Date" := Today;
//             //                             Description := PostingDescription;

//             //                             "Leave Entry Type" := LeaveEntryType;
//             //                             "Leave Type" := HRLeaveTypes.Code;
//             //                             "Document No." := HRLeaveCal."Calendar Code";

//             //                             "Global Dimension 1 Code" := "HR Employees"."Global Dimension 1 Code";
//             //                             HRJournalLine.Validate("Global Dimension 1 Code");

//             //                             "Global Dimension 2 Code" := "HR Employees"."Global Dimension 2 Code";
//             //                             HRJournalLine.Validate("Global Dimension 2 Code");
//             //                             "No. of Days" := 0;

//             //                             if (("HR Employees".Grade = 'GRADE 4') and ("HR Employees"."Contract Type" = 'CONTRACT')) or ("HR Employees".Grade = 'GRADE 1')
//             //                                 or ("HR Employees".Grade = 'GRADE 2') or ("HR Employees".Grade = 'GRADE 3') /*AND (HRLeaveTypes.Code='LTY02')*/
//             //                             then begin
//             //                                 if (HRLeaveTypes.Code = 'LTY02') then
//             //                                     "No. of Days" := HRLeaveTypes.Days;

//             //                             end else
//             //                                 if (("HR Employees".Grade = 'GRADE 4') and ("HR Employees"."Contract Type" = 'PERMANENT')) or ("HR Employees".Grade = 'GRADE 5')
//             //                          or ("HR Employees".Grade = 'GRADE 6') or ("HR Employees".Grade = 'GRADE 7') or ("HR Employees".Grade = 'GRADE 8')
//             //                          or ("HR Employees".Grade = 'GRADE 9') /*AND (HRLeaveTypes.Code = 'LTY01')*/
//             //                        then begin
//             //                                     if (HRLeaveTypes.Code = 'LTY01') then
//             //                                         "No. of Days" := HRLeaveTypes.Days
//             //                                 end;

//             //                             if (HRLeaveTypes.Code <> 'LTY01') and (HRLeaveTypes.Code <> 'LTY02') then
//             //                                 "No. of Days" := HRLeaveTypes.Days;

//             //                             if "No. of Days" <> 0 then
//             //                                 HRJournalLine.Insert(true);

//             //                         end;
//             //                     end;
//             //                 end else begin
//             //                     Error('Allocation has already been done');
//             //                 end;
//             //             until HRLeaveTypes.Next = 0;
//             //         end else begin
//             //             Error('No Leave Type found within the applied filters [%1]', HRLeaveTypes.GetFilters);
//             //         end;
//             //     end else begin
//             //         Error('No Leave Period have been created');
//             //     end;

//             // end;
//         }
//         dataitem("HR Leave Types";"HR Leave Types")
//         {
//             RequestFilterFields = "Code";
//             column(ReportForNavId_2; 2)
//             {
//             }
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field(LeaveEntryType; LeaveEntryType)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Leave Entry Type';
//                 }
//                 field(PostingDescription; PostingDescription)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Posting Description';
//                 }
//                 field(BatchName; BatchName)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Batch Name';
//                 }
//             }
//         }

//         actions
//         {
//         }

//         trigger OnOpenPage()
//         begin
//             PostingDescription := 'Leave Allocation on ' + Format(Today);
//         end;
//     }

//     labels
//     {
//     }

//     trigger OnPostReport()
//     begin
//         Message('Process complete');
//     end;

//     trigger OnPreReport()
//     begin
//         if PostingDescription = '' then Error('Please enter posting description');

//         begin
//             if not HRJournalLine.IsEmpty then begin
//                 if Confirm(Text0002 + Text0003, false, HRJournalLine.Count, UpperCase(HRJournalLine.TableCaption), Text0001, BatchName) = true then begin
//                     HRJournalLine.DeleteAll;
//                 end else begin
//                     Error('Process aborted');
//                 end;
//             end;
//         end;

//         //Get Leave type filter
//         LeaveTypeFilter := "HR Leave Types".GetFilter("HR Leave Types".Code);
//     end;

//     var
//         AllocationDone: Boolean;
//         HRLeaveTypes: Record 52185531;
//         HRLeaveLedger: Record 52185537;
//         LeaveEntryType: Option Postive,Negative,Reimbursement;
//         OK: Boolean;
//         HRJournalLine: Record 52185544;
//         PostingDescription: Text;
//         BatchName: Option POSITIVE,NEGATIVE;
//         JournalTemplate: Code[20];
//         Text0001: label 'LEAVE';
//         Text0002: label 'There are [%1] entries in [%2  TABLE], Journal Template Name - [%3], Journal Batch Name [%4]';
//         Text0003: label '\\Do you want to proceed and overwite these entries?';
//         LeaveTypeFilter: Text;
//         i: Integer;
//         HRLeaveCal: Record 52185551;
//         HrEmp: Record "HR Employees";


//     // procedure CheckGender(Emp: Record "HR Employees"; LeaveType: Record UnknownRecord52185531) Allocate: Boolean
//     // begin
//     //     if Emp.Gender = Emp.Gender::Male then begin
//     //         if LeaveType.Gender = LeaveType.Gender::Male then Allocate := true;
//     //     end;

//     //     if Emp.Gender = Emp.Gender::" " then begin
//     //         if LeaveType.Gender = LeaveType.Gender::Female then Allocate := true;
//     //     end;

//     //     if LeaveType.Gender = LeaveType.Gender::Both then Allocate := true;
//     //     exit(Allocate);

//     //     if Emp.Gender <> LeaveType.Gender then Allocate := false;

//     //     exit(Allocate);
//     // end;
// }
