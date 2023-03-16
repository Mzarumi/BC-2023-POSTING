// page 52186096 "FA WIP Job Task Lines"
// {
//     Caption = 'FA WIP Job Task Lines';
//     DataCaptionFields = "Job No.";
//     PageType = List;
//     SaveValues = true;
//     SourceTable = "Job Task";

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 IndentationColumn = DescriptionIndent;
//                 IndentationControls = Description;
//                 ShowCaption = false;
//                 field("Job No."; Rec."Job No.")
//                 {
//                     Style = Strong;
//                     StyleExpr = StyleIsStrong;
//                     Visible = false;
//                 }
//                 field("Job Task No."; Rec."Job Task No.")
//                 {
//                     Style = Strong;
//                     StyleExpr = StyleIsStrong;
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     Style = Strong;
//                     StyleExpr = StyleIsStrong;
//                 }
//                 field("Job Task Type"; Rec."Job Task Type")
//                 {
//                 }
//                 field(Totaling; Rec.Totaling)
//                 {
//                 }
//                 field("Job Posting Group"; Rec."Job Posting Group")
//                 {
//                 }
//                 field("WIP-Total"; Rec."WIP-Total")
//                 {
//                 }
//                 field("WIP Method"; Rec."WIP Method")
//                 {
//                 }
//                 field("Start Date"; Rec."Start Date")
//                 {
//                 }
//                 field("End Date"; Rec."End Date")
//                 {
//                 }
//                 field("Schedule (Total Cost)"; Rec."Schedule (Total Cost)")
//                 {
//                 }
//                 field("Schedule (Total Price)"; Rec."Schedule (Total Price)")
//                 {
//                 }
//                 field("Usage (Total Cost)"; Rec."Usage (Total Cost)")
//                 {
//                 }
//                 field("Usage (Total Price)"; Rec."Usage (Total Price)")
//                 {
//                 }
//                 field("Contract (Total Cost)"; Rec."Contract (Total Cost)")
//                 {
//                 }
//                 field("Contract (Total Price)"; Rec."Contract (Total Price)")
//                 {
//                 }
//                 field("Contract (Invoiced Cost)"; Rec."Contract (Invoiced Cost)")
//                 {
//                 }
//                 field("Contract (Invoiced Price)"; Rec."Contract (Invoiced Price)")
//                 {
//                 }
//                 field("Remaining (Total Cost)"; Rec."Remaining (Total Cost)")
//                 {
//                 }
//                 field("Remaining (Total Price)"; Rec."Remaining (Total Price)")
//                 {
//                 }
//                 field("EAC (Total Cost)"; Rec.CalcEACTotalCost)
//                 {
//                     Caption = 'EAC (Total Cost)';
//                 }
//                 field("EAC (Total Price)"; Rec.CalcEACTotalPrice)
//                 {
//                     Caption = 'EAC (Total Price)';
//                 }
//                 field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
//                 {
//                     Visible = false;
//                 }
//                 field("Outstanding Orders"; Rec."Outstanding Orders")
//                 {
//                     Editable = false;
//                     Visible = false;

//                     trigger OnDrillDown()
//                     var
//                         PurchLine: Record "Purchase Line";
//                     begin
//                         PurchLine.SetCurrentKey("Document Type", "Job No.", "Job Task No.");
//                         PurchLine.SetRange("Document Type", PurchLine."Document Type"::Order);
//                         PurchLine.SetRange("Job No.", "Job No.");
//                         PurchLine.SetRange("Job Task No.", "Job Task No.");
//                         PurchLine.SetFilter("Outstanding Amount (LCY)", '<> 0');
//                         PAGE.RunModal(PAGE::"Purchase Lines", PurchLine);
//                     end;
//                 }
//                 field("Amt. Rcd. Not Invoiced"; Rec."Amt. Rcd. Not Invoiced")
//                 {
//                     Editable = false;
//                     Visible = false;

//                     trigger OnDrillDown()
//                     var
//                         PurchLine: Record "Purchase Line";
//                     begin
//                         PurchLine.SetCurrentKey("Document Type", "Job No.", "Job Task No.");
//                         PurchLine.SetRange("Document Type", PurchLine."Document Type"::Order);
//                         PurchLine.SetRange("Job No.", "Job No.");
//                         PurchLine.SetRange("Job Task No.", "Job Task No.");
//                         PurchLine.SetFilter("Amt. Rcd. Not Invoiced (LCY)", '<> 0');
//                         PAGE.RunModal(PAGE::"Purchase Lines", PurchLine);
//                     end;
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             systempart(Control1900383207; Links)
//             {
//                 Visible = false;
//             }
//             systempart(Control1905767507; Notes)
//             {
//                 Visible = false;
//             }
//         }
//     }

//     actions
//     {
//         area(navigation)
//         {
//             group("&Job Task")
//             {
//                 Caption = '&Job Task';
//                 Image = Task;
//                 action("Job &Planning Lines")
//                 {
//                     Caption = 'Job &Planning Lines';
//                     Image = JobLines;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Shift+Ctrl+P';

//                     trigger OnAction()
//                     var
//                         JobPlanningLine: Record "Job Planning Line";
//                         JobPlanningLines: Page "Job Planning Lines";
//                     begin
//                         TestField("Job Task Type", "Job Task Type"::Posting);
//                         TestField("Job No.");
//                         TestField("Job Task No.");
//                         JobPlanningLine.SetRange("Job No.", "Job No.");
//                         JobPlanningLine.SetRange("Job Task No.", "Job Task No.");
//                         JobPlanningLines.SetJobNoVisible(false);
//                         JobPlanningLines.SetJobTaskNoVisible(false);
//                         JobPlanningLines.SetJobNo("Job No.");
//                         JobPlanningLines.SetTableView(JobPlanningLine);
//                         JobPlanningLines.Run;
//                     end;
//                 }
//                 action(JobTaskStatistics)
//                 {
//                     Caption = 'Job Task &Statistics';
//                     Image = StatisticsDocument;
//                     RunObject = Page "Job Task Statistics";
//                     RunPageLink = "Job No." = FIELD("Job No."),
//                                   "Job Task No." = FIELD("Job Task No.");
//                     ShortCutKey = 'F7';
//                 }
//                 action("Job &Task Card")
//                 {
//                     Caption = 'Job &Task Card';
//                     Image = Task;
//                     RunObject = Page "Job Task Card";
//                     RunPageLink = "Job No." = FIELD("Job No."),
//                                   "Job Task No." = FIELD("Job Task No.");
//                     ShortCutKey = 'Shift+F7';
//                 }
//                 separator("-")
//                 {
//                     Caption = '-';
//                 }
//                 group("&Dimensions")
//                 {
//                     Caption = '&Dimensions';
//                     Image = Dimensions;
//                     action("Dimensions-&Single")
//                     {
//                         Caption = 'Dimensions-&Single';
//                         Image = Dimensions;
//                         RunObject = Page "Job Task Dimensions";
//                         RunPageLink = "Job No." = FIELD("Job No."),
//                                       "Job Task No." = FIELD("Job Task No.");
//                         ShortCutKey = 'Shift+Ctrl+D';
//                     }
//                     action("Dimensions-&Multiple")
//                     {
//                         AccessByPermission = TableData Dimension = R;
//                         Caption = 'Dimensions-&Multiple';
//                         Image = DimensionSets;

//                         trigger OnAction()
//                         var
//                             JobTask: Record "Job Task";
//                             JobTaskDimensionsMultiple: Page "Job Task Dimensions Multiple";
//                         begin
//                             CurrPage.SetSelectionFilter(JobTask);
//                             JobTaskDimensionsMultiple.SetMultiJobTask(JobTask);
//                             JobTaskDimensionsMultiple.RunModal;
//                         end;
//                     }
//                 }
//             }
//             group(Documents)
//             {
//                 Caption = 'Documents';
//                 Image = Documents;
//                 action("Sales &Invoices/Credit Memos")
//                 {
//                     Caption = 'Sales &Invoices/Credit Memos';
//                     Image = GetSourceDoc;
//                     Promoted = true;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     var
//                         JobInvoices: Page "Job Invoices";
//                     begin
//                         JobInvoices.SetPrJobTask(Rec);
//                         JobInvoices.RunModal;
//                     end;
//                 }
//             }
//             group("W&IP")
//             {
//                 Caption = 'W&IP';
//                 Image = WIP;
//                 action("&WIP Entries")
//                 {
//                     Caption = '&WIP Entries';
//                     Image = WIPEntries;
//                     RunObject = Page "Job WIP Entries";
//                     RunPageLink = "Job No." = FIELD("Job No.");
//                     RunPageView = SORTING("Job No.", "Job Posting Group", "WIP Posting Date");
//                 }
//                 action("WIP &G/L Entries")
//                 {
//                     Caption = 'WIP &G/L Entries';
//                     Image = WIPLedger;
//                     RunObject = Page "Job WIP G/L Entries";
//                     RunPageLink = "Job No." = FIELD("Job No.");
//                     RunPageView = SORTING("Job No.");
//                 }
//             }
//             group(History)
//             {
//                 Caption = 'History';
//                 Image = History;
//                 action("Job Ledger E&ntries")
//                 {
//                     Caption = 'Job Ledger E&ntries';
//                     Image = JobLedger;
//                     RunObject = Page "Job Ledger Entries";
//                     RunPageLink = "Job No." = FIELD("Job No."),
//                                   "Job Task No." = FIELD("Job Task No.");
//                     RunPageView = SORTING("Job No.", "Job Task No.");
//                     ShortCutKey = 'Ctrl+F7';
//                 }
//             }
//         }
//         area(processing)
//         {
//             group("New Documents")
//             {
//                 Caption = 'New Documents';
//                 Image = Invoice;
//                 action("Create &Sales Invoice")
//                 {
//                     Caption = 'Create &Sales Invoice';
//                     Ellipsis = true;
//                     Image = Invoice;

//                     trigger OnAction()
//                     var
//                         Job: Record Job;
//                         JobTask: Record "Job Task";
//                     begin
//                         TestField("Job No.");
//                         Job.Get("Job No.");
//                         if Job.Blocked = Job.Blocked::All then
//                             Job.TestBlocked;

//                         JobTask.SetRange("Job No.", Job."No.");
//                         if "Job Task No." <> '' then
//                             JobTask.SetRange("Job Task No.", "Job Task No.");

//                         //REPORT.RunModal(REPORT::"Job Create Sales Invoice", true, false, JobTask);
//                     end;
//                 }
//             }
//             group("F&unctions")
//             {
//                 Caption = 'F&unctions';
//                 Image = "Action";
//                 action("Split &Planning Lines")
//                 {
//                     Caption = 'Split &Planning Lines';
//                     Ellipsis = true;
//                     Image = Splitlines;
//                     Promoted = true;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     var
//                         Job: Record Job;
//                         JobTask: Record "Job Task";
//                     begin
//                         TestField("Job No.");
//                         Job.Get("Job No.");
//                         if Job.Blocked = Job.Blocked::All then
//                             Job.TestBlocked;

//                         TestField("Job Task No.");
//                         JobTask.SetRange("Job No.", Job."No.");
//                         JobTask.SetRange("Job Task No.", "Job Task No.");

//                         //REPORT.RunModal(REPORT::"Job Split Planning Line", true, false, JobTask);
//                     end;
//                 }
//                 action("Change &Dates")
//                 {
//                     Caption = 'Change &Dates';
//                     Ellipsis = true;
//                     Image = ChangeDate;

//                     trigger OnAction()
//                     var
//                         Job: Record Job;
//                         JobTask: Record "Job Task";
//                     begin
//                         TestField("Job No.");
//                         Job.Get("Job No.");
//                         if Job.Blocked = Job.Blocked::All then
//                             Job.TestBlocked;

//                         JobTask.SetRange("Job No.", Job."No.");
//                         if "Job Task No." <> '' then
//                             JobTask.SetRange("Job Task No.", "Job Task No.");

//                         //REPORT.RunModal(REPORT::"Change Job Dates", true, false, JobTask);
//                     end;
//                 }
//                 action("<Action7>")
//                 {
//                     Caption = 'I&ndent Job Tasks';
//                     Image = Indent;
//                     RunObject = Codeunit "Job Task-Indent";
//                 }
//                 group("&Copy")
//                 {
//                     Caption = '&Copy';
//                     Image = Copy;
//                     action("Copy Job Planning Lines &from...")
//                     {
//                         Caption = 'Copy Job Planning Lines &from...';
//                         Ellipsis = true;
//                         Image = CopyToTask;
//                         Promoted = true;
//                         PromotedCategory = Process;

//                         trigger OnAction()
//                         var
//                             CopyJobPlanningLines: Page "Copy Job Planning Lines";
//                         begin
//                             TestField("Job Task Type", "Job Task Type"::Posting);
//                             CopyJobPlanningLines.SetToJobTask(Rec);
//                             CopyJobPlanningLines.RunModal;
//                         end;
//                     }
//                     action("Copy Job Planning Lines &to...")
//                     {
//                         Caption = 'Copy Job Planning Lines &to...';
//                         Ellipsis = true;
//                         Image = CopyFromTask;
//                         Promoted = true;
//                         PromotedCategory = Process;

//                         trigger OnAction()
//                         var
//                             CopyJobPlanningLines: Page "Copy Job Planning Lines";
//                         begin
//                             TestField("Job Task Type", "Job Task Type"::Posting);
//                             CopyJobPlanningLines.SetFromJobTask(Rec);
//                             CopyJobPlanningLines.RunModal;
//                         end;
//                     }
//                 }
//                 group("<Action13>")
//                 {
//                     Caption = 'W&IP';
//                     Image = WIP;
//                     action("<Action48>")
//                     {
//                         Caption = '&Calculate WIP';
//                         Ellipsis = true;
//                         Image = CalculateWIP;

//                         trigger OnAction()
//                         var
//                             Job: Record Job;
//                         begin
//                             TestField("Job No.");
//                             Job.Get("Job No.");
//                             Job.SetRange("No.", Job."No.");
//                             //REPORT.RunModal(REPORT::"Job Calculate WIP", true, false, Job);
//                         end;
//                     }
//                     action("<Action49>")
//                     {
//                         Caption = '&Post WIP to G/L';
//                         Ellipsis = true;
//                         Image = PostOrder;
//                         ShortCutKey = 'F9';

//                         trigger OnAction()
//                         var
//                             Job: Record Job;
//                         begin
//                             TestField("Job No.");
//                             Job.Get("Job No.");
//                             Job.SetRange("No.", Job."No.");
//                             //REPORT.RunModal(REPORT::"Job Post WIP to G/L", true, false, Job);
//                         end;
//                     }
//                     action("FA WIP Cost Transfer")
//                     {
//                         Caption = 'FA WIP Cost Transfer';
//                         Image = TransferToLines;
//                         Promoted = true;
//                         PromotedCategory = Process;

//                         trigger OnAction()
//                         begin
//                             TestField("Job No.");


//                             Job.Get("Job No.");
//                             if Job.Blocked = Job.Blocked::All then
//                                 Job.TestBlocked;

//                             Clear(Job);
//                             Job.SetRange("No.", "Job No.");
//                             Job.FindFirst;

//                             //REPORT.RunModal(REPORT::"Convert WIP to FA", true, false, Job);
//                         end;
//                     }
//                 }
//             }
//         }
//         area(reporting)
//         {
//             action("Job Actual to Budget")
//             {
//                 Caption = 'Job Actual to Budget';
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 //here//RunObject = Report "Job Actual To Budget";
//             }
//             action("Job Analysis")
//             {
//                 Caption = 'Job Analysis';
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 RunObject = Report "Job Analysis";
//             }
//             action("Job - Planning Lines")
//             {
//                 Caption = 'Job - Planning Lines';
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 RunObject = Report "Job - Planning Lines";
//             }
//             action("Job - Suggested Billing")
//             {
//                 Caption = 'Job - Suggested Billing';
//                 Image = "Report";
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 //here//RunObject = Report "Job Suggested Billing";
//             }
//             action("Jobs - Transaction Detail")
//             {
//                 Caption = 'Jobs - Transaction Detail';
//                 Image = "Report";
//                 Promoted = false;
//                 //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
//                 //PromotedCategory = "Report";
//                 ////hereRunObject = Report "Job - Transaction Detail";
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     begin
//         DescriptionIndent := Indentation;
//         StyleIsStrong := "Job Task Type" <> "Job Task Type"::Posting;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         ClearTempDim;
//     end;

//     var
//         [InDataSet]
//         DescriptionIndent: Integer;
//         [InDataSet]
//         StyleIsStrong: Boolean;
//         Job: Record Job;
// }

