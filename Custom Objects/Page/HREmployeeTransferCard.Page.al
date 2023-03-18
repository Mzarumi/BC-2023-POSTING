page 52186474 "HR Employee Transfer Card"
{
    PageType = Card;
    PromotedActionCategories = 'Manage,Process,Report,Redeploy';
    SourceTable = "HR Employee Transfer Header";
    SourceTableView = WHERE("Transfer details Updated" = CONST(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Request No"; Rec."Request No")
                {
                }
                field("Date Requested"; Rec."Date Requested")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                }
                field("Job ID"; Rec."Job ID")
                {
                    Editable = false;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Dimension 1 Code"; Rec."Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Dimension 1 Description"; Rec."Dimension 1 Description")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Dimension 2 Code"; Rec."Dimension 2 Code")
                {
                    Editable = false;
                }
                field("Dimension 2 Description"; Rec."Dimension 2 Description")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Dimension 3 Code"; Rec."Dimension 3 Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Dimension 3 Description"; Rec."Dimension 3 Description")
                {
                    Editable = false;
                    ShowCaption = false;
                    Visible = false;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    Editable = false;
                }
                field("Salary Notch"; Rec."Salary Notch")
                {
                    Editable = false;
                }
                field("New Job ID"; Rec."New Job ID")
                {
                }
                field("New Job Description"; Rec."New Job Description")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("New Dimension 1 Code"; Rec."New Dimension 1 Code")
                {
                }
                field("New Dimension 1 Description"; Rec."New Dimension 1 Description")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("New Dimension 2 Code"; Rec."New Dimension 2 Code")
                {
                }
                field("New Dimension 2 Description"; Rec."New Dimension 2 Description")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("New Dimension 3 Code"; Rec."New Dimension 3 Code")
                {
                    Visible = false;
                }
                field("New Dimension 3 Description"; Rec."New Dimension 3 Description")
                {
                    Editable = false;
                    ShowCaption = false;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                }
                field("Reason for Transfer"; Rec."Reason for Transfer")
                {
                }
                field("Transfer details Updated"; Rec."Transfer details Updated")
                {
                    Editable = false;
                }
            }
            group("Transfer Duration")
            {
                field("Effective From"; Rec."Effective From")
                {
                }
                field(Duration; Rec.Duration)
                {
                }
                field("Effective To"; Rec."Effective To")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
            }
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
                action(Redeploy)
                {
                    Caption = 'Redeploy';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;

                    trigger OnAction()
                    begin
                        //Rec.TestField(Status,Status::Approved);

                        if Confirm(Text002, false) = true then begin

                            Employees.Reset;
                            Employees.SetRange(Employees."No.", Rec."Employee No");
                            if Employees.Find('-') then begin
                                Employees.Position := Rec."New Job ID";
                                Employees."Job Title" := Rec."New Job Description";
                                Employees."Department Code" := Rec."New Dimension 1 Code";
                                // Employees."Employee Classification" := Rec."New Dimension 1 Description";
                                Employees.Office := Rec."New Dimension 2 Code";
                                //Employees."Dimension 2 Description":="New Dimension 2 Description";

                                Employees.Modify;
                            end;

                            Rec."Transfer details Updated" := true;
                            Rec.Modify;
                            Message(Text001, Rec."Employee No");

                        end;
                    end;
                }
            }
        }
    }

    var
        ApprovalComments: Page "Approval Comments";
        Employees: Record "HR Employees";
        Text001: Label 'Employee No. %1 has been successfully redeployed';
        Text002: Label 'Do you want to effect this transfer';
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExist: Boolean;
}

