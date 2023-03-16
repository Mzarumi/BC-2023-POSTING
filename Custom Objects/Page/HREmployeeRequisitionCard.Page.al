page 52185535 "HR Employee Requisition Card"
{
    DeleteAllowed = false;
    InsertAllowed = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions,Requisition';
    SourceTable = "HR Employee Requisitions";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Requisition No."; Rec."Requisition No.")
                {
                    Importance = Promoted;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field(Requestor; Rec.Requestor)
                {
                    Importance = Promoted;
                }
                field("Job ID"; Rec."Job ID")
                {
                    Importance = Promoted;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Caption = 'Job Title';
                    Importance = Promoted;
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    Enabled = false;
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                }
                field("Employment Type"; Rec."Employment Type")
                {
                }
                field(Priority; Rec.Priority)
                {
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    Importance = Promoted;
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    Importance = Promoted;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    Importance = Promoted;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                    Importance = Promoted;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Completion Status"; Rec."Completion Status")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
            }
            group("Additional Information")
            {
                Caption = 'Additional Information';
                field("Any Additional Information"; Rec."Any Additional Information")
                {
                    MultiLine = true;
                }
                field("Reason for Request(Other)"; Rec."Reason for Request(Other)")
                {
                    MultiLine = true;
                    ShowMandatory = true;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755020; Outlook)
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
                        //Rec.TestField("No of Posts");
                        /*Rec.TestField("Document No.");
                        Rec.TestField(Description);
                        Rec.TestField("Interest Due Date");*/
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
            group(Requisition)
            {
                Caption = 'Requisition';
                action(Requirements)
                {
                    Caption = 'Requirements';
                    Image = JobListSetup;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Requirement Lines(RO)";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
                action(Responsibilities)
                {
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
                action("Advertise (Internal Staff)")
                {
                    Caption = 'Advertise (Internal Staff)';
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin

                        Rec.TestField("Approval Status", "Approval Status"::Approved);

                        if Rec."Requisition Type" = Rec."Requisition Type"::External then Error('Requisition Type must be "Internal" or "Both"');

                        if Confirm(Text0001, false, Rec."Job ID", Rec."Job Description") = false then exit;

                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        if HREmp.Find('-') then begin
                            HREmp.TestField(HREmp."Company E-Mail");
                            //Check if SMTP mail setup is done
                            //SMTPMailSetup.Get;

                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                            HREmailParam.Reset;
                            HREmailParam.SetRange(HREmailParam."Associate With", HREmailParam."Associate With"::"Vacancy Advertisements");
                            if HREmailParam.Find('-') then begin
                                HREmailParam.TestField(HREmailParam."Sender Name");
                                HREmailParam.TestField(HREmailParam."Sender Address");
                                HREmailParam.TestField(HREmailParam.Subject);
                                repeat
                                // SMTP.CreateMessage(HREmailParam."Sender Name", HREmailParam."Sender Address", HREmp."Company E-Mail",
                                // HREmailParam.Subject, 'Dear' + ' ' + HREmp."First Name" + '<br>' +
                                // Text0002 + ' ' + "Job Description" + ' ' + 'is open for application to all Internal Staff' + '<br><br>Regards', true);
                                // SMTP.Send();
                                until HREmp.Next = 0;
                                Message('[%1] Employees have been notified about this vacancy', HREmp.Count);
                            end else begin
                                Error('No E-Mail Parameters have been setup for Internal Vacany  notifications');
                            end;
                        end;
                    end;
                }
                action("Close Requisition")
                {
                    Enabled = CloseReq;
                    Image = Close;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        Rec.Closed := true;
                        Rec."Completion Status" := Rec."Completion Status"::Closed;
                        Rec.Modify;
                    end;
                }
                action("Job Interview details")
                {
                    Caption = 'Job Interview details';
                    Enabled = false;
                    Image = ApplicationWorksheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "HR Job Interview";
                    RunPageLink = "Applicant No" = FIELD("Job ID");
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        UpdateControls;
    end;

    trigger OnOpenPage()
    begin
        UpdateControls;
        if Rec."Approval Status" <> "Approval Status"::Approved
          then
            CloseReq := false else
            CloseReq := true
    end;

    var
        ApprovalEntries: Page "Approval Entries";
        HREmpReq: Record "HR Employee Requisitions";
        //SMTP: Codeunit "SMTP Mail";
        HRSetup: Record "HR Setup";
        CTEXTURL: Text[30];
        HREmp: Record "HR Employees";
        HREmailParam: Record "HR E-Mail Parameters";
        ContractDesc: Text[30];
        HRLookupValues: Record "HR Lookup Values";
        DimValue: Record "Dimension Value";
        objEmp: Record "HR Employees";
        Text0001: Label 'Do you want to advertise Job Position [ %1  - %2 ] to Internal Staff ?';
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        //SMTPMailSetup: Record "SMTP Mail Setup";
        HRCodeunit: Codeunit "HR Codeunit2";
        Text0002: Label 'Job position ';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        CloseReq: Boolean;

    local procedure UpdateControls()
    begin
        CurrPage.Editable := HRCodeunit.fn_UpdateControls(Format(Rec."Approval Status"));
    end;
}

