// page 52185532 "HR Proffesional Body Members"
// {
//     CardPageID = "HR Employees Factbox";
//     DeleteAllowed = false;
//     Editable = false;
//     InsertAllowed = false;
//     ModifyAllowed = false;
//     PageType = List;
//     SourceTable = "HR Employees";
//     SourceTableView = SORTING("No.")
//                       ORDER(Ascending)
//                       WHERE(Status = FILTER(Active));

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 ShowCaption = false;
//                 field("No."; Rec."No.")
//                 {
//                 }
//                 field("First Name"; Rec."First Name")
//                 {
//                 }
//                 field("Last Name"; Rec."Last Name")
//                 {
//                 }
//                 field("Job Title"; Rec."Job Title")
//                 {
//                 }
//                 field("Department Code"; Rec."Department Code")
//                 {
//                 }
//                 field(Office; Rec.Office)
//                 {
//                 }
//                 field("Effective From Date"; Rec."Effective From Date")
//                 {
//                 }
//                 field("Expiry Date"; Rec."Expiry Date")
//                 {
//                 }
//                 field(Status; Rec.Status)
//                 {
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action("Import Notches")
//             {
//                 Caption = 'Import Notches';
//                 ////RunObject = XMLport XMLport50051;
//             }
//             action("Import Notch Transactions")
//             {
//                 Caption = 'Import Notch Transactions';
//                 ////RunObject = XMLport XMLport50061;
//             }
//             action("Import Payroll Variations")
//             {
//                 Caption = 'Import Payroll Variations';
//                 ////RunObject = XMLport "Checkoff Buffer";
//             }
//             action("Import Employee Trans")
//             {
//                 Caption = 'Import Employee Trans';
//                 ////RunObject = XMLport XMLport50060;
//             }
//             action(Abscence)
//             {
//                 Caption = 'Abscence';
//                 Image = Absence;
//                 Promoted = true;
//                 RunObject = Page "Employee Absences";
//                 RunPageLink = "Employee No." = FIELD("No.");
//                 Visible = false;
//             }
//             action(Lateness)
//             {
//                 Caption = 'Lateness';
//                 Image = AbsenceCalendar;
//                 Promoted = true;
//                 RunObject = Page prLatenessLedger;
//                 RunPageLink = "Employee Code" = FIELD("No.");
//                 Visible = false;
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     begin
//         DepName := '';
//         DValues.Reset;
//         DValues.SetRange(DValues.Code, "Department Code");
//         if DValues.Find('-') then
//             DepName := DValues.Name;

//         BankName := '';
//         Banks.Reset;
//         Banks.SetRange(Banks."Branch Code", "Main Bank");
//         Banks.SetRange(Banks."Branch Name", "Branch Bank");
//         if Banks.Find('-') then
//             BankName := Banks."Bank Name";
//     end;

//     trigger OnOpenPage()
//     begin
//         if (DepCode <> '') then
//             SetFilter("Department Code", ' = %1', DepCode);
//         if (OfficeCode <> '') then
//             SetFilter(Office, ' = %1', OfficeCode);
//     end;

//     var
//         Mail: Codeunit Mail;
//         PictureExists: Boolean;
//         DepCode: Code[10];
//         OfficeCode: Code[10];
//         DepName: Text[100];
//         BankName: Text[200];
//         DValues: Record "Dimension Value";
//         Banks: Record "PR Bank Branches";

//     //[Scope('Internal')]
//     procedure SetNewFilter(var DepartmentCode: Code[10]; var "Office Code": Code[10])
//     begin
//         DepCode := DepartmentCode;
//         OfficeCode := "Office Code";
//     end;
// }

