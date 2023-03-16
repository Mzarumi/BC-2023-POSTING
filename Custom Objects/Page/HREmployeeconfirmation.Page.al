page 52186517 "HR Employee confirmation"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Employee Confirmation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    Editable = false;
                }
                field("Employee Number"; Rec."Employee Number")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                }
                field("Shortcut Dimension code1"; Rec."Shortcut Dimension code1")
                {
                    Caption = 'Region';
                    Editable = false;
                }
                field("Shortcut Dimension code2"; Rec."Shortcut Dimension code2")
                {
                    Caption = 'Department';
                    Editable = false;
                }
                field(Designation; Rec.Designation)
                {
                    Editable = false;
                }
                field("Request Date"; Rec."Request Date")
                {
                    Editable = false;
                }
                field("Probation Start Date"; Rec."Probation Start Date")
                {
                    Editable = false;
                }
                field("Probation End Date"; Rec."Probation End Date")
                {
                    Editable = false;
                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                }
                field(Reason; Rec.Reason)
                {
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Confirmation Report")
                {
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        EmployeeConfirmation.Reset;
                        EmployeeConfirmation.SetRange(EmployeeConfirmation.No, Rec.No);
                        //if EmployeeConfirmation.Find('-') then
                            //REPORT.Run(REPORT::"Employee Confirmation Report", true, true, EmployeeConfirmation);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Request Date" := Today;
    end;

    var
        HREmp: Record "HR Employees";
        EmpJobDesc: Text[50];
        HRJobs: Record "HR Jobs";
        SupervisorName: Text[60];
        //SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        HRSetup: Record "HR Setup";
        EmpDept: Text[30];
        ApprovalEntries: Page "Approval Entries";
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        EmpName: Text[70];
        ApprovalComments: Page "Approval Comments";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        varDaysApplied: Integer;
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        "LineNo.": Integer;
        sDate: Record Date;
        Customized: Record "HR Leave Calendar";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRJournalBatch: Record "HR Leave Journal Batch";
        EmployeeConfirmation: Record "HR Employee Confirmation";
}

