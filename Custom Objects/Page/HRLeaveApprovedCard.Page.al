page 52186229 "HR Leave Approved Card"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Leave Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Application Code"; Rec."Application Code")
                {
                    Caption = 'Application No';
                    Editable = false;
                    Enabled = true;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Application Date"; Rec."Application Date")
                {
                    Editable = false;
                }
                field("Applicant Staff No."; Rec."Applicant Staff No.")
                {
                    Caption = 'No.';
                    Enabled = false;
                    Importance = Promoted;
                }
                field(Names; Rec.Names)
                {
                    Caption = 'Name';
                    Editable = false;
                    Importance = Promoted;
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    Caption = 'Job Title';
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Applicant Supervisor"; Rec."Applicant Supervisor")
                {
                    Editable = false;
                }
                field("Supervisor Email"; Rec."Supervisor Email")
                {
                    Editable = false;
                }
                label("**")
                {
                    Caption = '*';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    Importance = Promoted;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        GetLeaveStats(Rec."Leave Type");
                    end;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    Importance = Promoted;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if Rec."Days Applied" > dLeft then Error('Days applied exceeds Leave balance');
                    end;
                }
                field("Start Date"; Rec."Start Date")
                {
                    Importance = Promoted;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        //IF "Start Date"<>0D THEN
                        //BEGIN
                        //check for overlap


                        //END;
                    end;
                }
                field("End Date"; Rec."End Date")
                {
                }
                field("Return Date"; Rec."Return Date")
                {
                    Editable = false;
                }
                label("***")
                {
                    Caption = '*';
                }
                // field(dAlloc; Rec.dAlloc)
                // {
                //     Caption = 'Allocated days';
                //     Editable = false;
                // }
                // field(dEarnd; Rec.dEarnd)
                // {
                //     Caption = 'Total Leave Days';
                //     Editable = false;
                //     Style = Strong;
                //     StyleExpr = TRUE;
                // }
                // field(dTaken; Rec.dTaken)
                // {
                //     Caption = 'Total Leave Taken';
                //     Editable = false;
                //     Style = Strong;
                //     StyleExpr = TRUE;
                // }
                // field(dLeft; Rec.dLeft)
                // {
                //     Caption = 'Leave Balance';
                //     Editable = false;
                //     Enabled = true;
                //     Style = Strong;
                //     StyleExpr = TRUE;
                // }
                field("Leave Allowance Entittlement"; Rec."Leave Allowance Entittlement")
                {
                }
                field("Request Leave Allowance"; Rec."Request Leave Allowance")
                {
                    Editable = false;
                }
                label("****")
                {
                    Caption = '*';
                }
                field(Reliever; Rec.Reliever)
                {
                    Caption = 'Reliever Code';
                    ShowMandatory = true;
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    Editable = false;
                }
                label("*****")
                {
                    Caption = '*';
                }
                field(Posted; Rec.Posted)
                {
                    Enabled = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    Editable = false;
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    Editable = false;
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
            }
            group("More Leave Details")
            {
                Caption = 'More Leave Details';
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                }
                field("Alternative CellPhone No."; Rec."Alternative CellPhone No.")
                {
                }
                field("E-mail Address"; Rec."E-mail Address")
                {
                    Importance = Promoted;
                }
                field(Address; Rec.Address)
                {
                }
                field("Details of Examination"; Rec."Details of Examination")
                {
                    Importance = Promoted;
                }
                field("Date of Exam"; Rec."Date of Exam")
                {
                    Importance = Promoted;
                }
                field("Number of Previous Attempts"; Rec."Number of Previous Attempts")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755004; Outlook)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Comments";
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Reliever);
                        Rec.TestField("Cell Phone Number");
                        Rec.TestField("Days Applied");
                        Rec.TestField("Start Date");
                        Rec.TestField("Leave Type");
                        Rec.TestField(Address);
                        Rec.TestField("E-mail Address");
                        /*Rec.TestField(Description);
                        Rec.TestField("Interest Due Date");*/

                        if Rec."Days Applied" > dLeft then Error('You have applied for more days than those you have in your balance');

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
            group(Reliver)
            {
                Caption = 'Reliver';
                action("Additional Reliver")
                {
                    Caption = 'Additional Reliver';
                    Image = Employee;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "HR Leave Reliver";
                    RunPageLink = "leave No" = FIELD("Application Code"),
                                  Employee = FIELD("Applicant Staff No.");
                }
                action("Update Dimensions")
                {
                    Image = UpdateDescription;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        UserSetup: Record "User Setup";
                    begin
                        UserSetup.Reset;
                        UserSetup.SetRange("User ID", Rec."Applicant User ID");
                        if UserSetup.Find('-') then begin
                            Rec."Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                            Rec."Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                            Rec."Responsibility Center" := UserSetup."Responsibility Centre";
                            Rec."Application Date" := Today;
                            Rec.Modify;
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //Get Employee Details
        FillVariables;


        //Get leave statistics
        GetLeaveStats(Rec."Leave Type");

        //Approvals
        SetControlAppearance;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        HRLeaveApp.Reset;
        HRLeaveApp.SetRange(HRLeaveApp.Status, HRLeaveApp.Status::New);
        HRLeaveApp.SetRange(HRLeaveApp."Applicant User ID", UserId);
        if HRLeaveApp.Find('-') then begin
            if HRLeaveApp.Count > 1 then begin
                Error('There are still some untilized Leave Application Documents [ %1 ]. Please utilise them first'
                      , HRLeaveApp."Application Code");
            end;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        xRec.Reset;
        xRec.SetRange(xRec."Applicant User ID", UserId);
        xRec.SetRange(xRec.Status, xRec.Status::New);
        if xRec.Find('-') then
            Error('You still have a new leave application no' + ' ' + xRec."Application Code" + 'that needs to be utilized first');


        xRec.Reset;
        xRec.SetRange(xRec."Applicant User ID", UserId);
        xRec.SetRange(xRec.Status, xRec.Status::"Pending Approval");
        if xRec.Find('-') then
            Error('Your leave application no' + ' ' + xRec."Application Code" + 'is still  pending Approval. Kindy Contact the HR department to have it approved first')
    end;

    trigger OnOpenPage()
    begin
        EditableFields := true;
        if Rec.Status = Rec.Status::New then begin
            Rec."Application Date" := Today;
            Rec.Modify
        end;

        GetLeaveStats(Rec."Leave Type");
        if Rec.Status = Rec.Status::Approved then
            CurrPage.Editable := false
    end;

    var
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        HREmp: Record "HR Employees";
        EmpJobDesc: Text[50];
        HRJobs: Record "HR Jobs";
        SupervisorName: Text[60];
        //SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        dAlloc: Decimal;
        dEarnd: Decimal;
        dTaken: Decimal;
        dLeft: Decimal;
        cReimbsd: Decimal;
        cPerDay: Decimal;
        cbf: Decimal;
        HRSetup: Record "HR Setup";
        EmpDimension_1: Text[60];
        EmpDimension_2: Text[60];
        HRLeaveApp: Record "HR Leave Application";
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        EmpName: Text[70];
        ApprovalComments: Page "Approval Comments";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        LeaveGjline: Record "HR Leave Journal Line";
        "LineNo.": Integer;
        sDate: Record Date;
        Customized: Record "HR Leave Calendar Lines";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRJournalBatch: Record "HR Leave Journal Batch";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        HRLeaveCal: Record "HR Leave Calendar";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        EditableFields: Boolean;

    //[Scope('Internal')]
    procedure FillVariables()
    begin
        //Only modify document if status is not NEW
        if Rec.Status <> Rec.Status::New then begin
            //Fill Employee Details

        end;
    end;

    //[Scope('Internal')]
    procedure GetLeaveStats(LeaveType: Text[50])
    begin

        dAlloc := 0;
        dEarnd := 0;
        dTaken := 0;
        dLeft := 0;
        cReimbsd := 0;
        cPerDay := 0;
        cbf := 0;
        HREmp.Reset;
        if HREmp.Get(Rec."Applicant Staff No.") then begin

            HRLeaveCal.Reset;
            HRLeaveCal.SetRange(HRLeaveCal."Current Leave Calendar", true);
            if not HRLeaveCal.Find('-') then Error('Leave Calendar not setup');

            //Filter by Leave Period from HR Setup
            HRLeaveLedgerEntries.Reset;
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Staff No.", Rec."Applicant Staff No.");
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Entry Type", HRLeaveLedgerEntries."Leave Entry Type"::Positive, HRLeaveLedgerEntries."Leave Entry Type"::Reimbursement);
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Calendar Code", HRLeaveCal."Calendar Code");
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Type", LeaveType);
            if HRLeaveLedgerEntries.Find('-') then begin
                dAlloc := 0;
                repeat
                    dAlloc := HRLeaveLedgerEntries."No. of days" + dAlloc;
                until HRLeaveLedgerEntries.Next = 0;
            end;


            HRLeaveLedgerEntries.Reset;
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Staff No.", Rec."Applicant Staff No.");
            HRLeaveLedgerEntries.SetRange("Leave Entry Type", HRLeaveLedgerEntries."Leave Entry Type"::Negative);//'%1|%2',,HRLeaveLedgerEntries."Leave Entry Type"::Reimbursement
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Calendar Code", HRLeaveCal."Calendar Code");
            HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Type", LeaveType);
            if HRLeaveLedgerEntries.Find('-') then begin
                dTaken := 0;
                repeat
                    dTaken := HRLeaveLedgerEntries."No. of days" + dTaken;
                until HRLeaveLedgerEntries.Next = 0;
            end;

            //Leave Balance
            dEarnd := dAlloc - dTaken;
            dLeft := dAlloc; // +  dTaken;

            //Reimbursed Leave Days
            // cbf := HREmp."Reimbursed Leave Days";
            // cReimbsd := HREmp."Cash - Leave Earned";
            // cPerDay := HREmp."Cash per Leave Day";

        end;
    end;

    //[Scope('Internal')]
    procedure TESTFIELDS()
    begin
        Rec.TestField("Leave Type");
        Rec.TestField("Days Applied");
        Rec.TestField("Start Date");
        Rec.TestField(Reliever);
        Rec.TestField("Applicant Supervisor");
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        //HasIncomingDocument := "Incoming Document Entry No." <> 0;
        //SetExtDocNoMandatoryCondition;
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

