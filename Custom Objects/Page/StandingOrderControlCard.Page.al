page 52186656 "Standing Order Control Card"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Activities, ,Approvals,View,Category9_caption';
    SourceTable = "Standing Order Control";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                    Editable = DocumentTypeEdit;
                    ValuesAllowed = Open, Rejected, Stopped;
                }
                field(Description; Rec.Description)
                {
                    Editable = DescriptionEdit;
                }
                field("Standing Order No"; Rec."Standing Order No")
                {
                    Editable = SONumberEdit;
                }
                field("Source Account No."; Rec."Source Account No.")
                {
                }
                field("Source Account Name"; Rec."Source Account Name")
                {
                }
                field("Income Type"; Rec."Income Type")
                {
                }
                field("Allow Partial Deduction"; Rec."Allow Partial Deduction")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Effective Date"; Rec."Effective Date")
                {
                }
                field(Frequency; Rec.Frequency)
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control22; Notes)
            {
            }
            systempart(Control23; MyNotes)
            {
            }
            systempart(Control24; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Process)
            {
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                // SOProcess: Codeunit "Mngt. Routine Processes";
                begin
                    // Rec.TestField(Status,Status::Approved);
                    // SOProcess.PostPerformingLoanInt(Rec);
                end;
            }
            action("Standing Order")
            {
                Image = Answers;
                Promoted = true;
                PromotedCategory = Category7;
                RunObject = Page "Standing Order";
                RunPageLink = "No." = FIELD("Standing Order No");
            }
        }
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
                        Rec.TestField(Status, Rec.Status::Pending);
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
                        Rec.TestField(Status, Rec.Status::Pending);
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
                        Rec.TestField(Status, Rec.Status::Pending);
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
                    PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        NextofKinError: Label 'You must specify next of Kin for this application.';
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField("Document Type");
                        Rec.TestField("Standing Order No");

                        VarVariant := Rec;
                        //if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        //CustomApprovals.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Status, Rec.Status::Pending);
                        VarVariant := Rec;
                        // CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
        statusControl;
    end;

    var
        DocumentTypeEdit: Boolean;
        DescriptionEdit: Boolean;
        SONumberEdit: Boolean;
        VarVariant: Variant;
        //CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;

    //[Scope('Internal')]
    procedure statusControl()
    begin
        case Rec.Status of
            Rec.Status::Open:
                begin
                    DocumentTypeEdit := true;
                    DescriptionEdit := true;
                    SONumberEdit := true;
                    //OpenApprovalEntriesExist:=TRUE;
                end;
        //here
        // Status::Pending, Status::Approved, Status::Rejected, Status::"5":
        //     begin
        //         DocumentTypeEdit := false;
        //         DescriptionEdit := false;
        //         SONumberEdit := false;
        //         //OpenApprovalEntriesExist:=FALSE;
        //     end;
        end;
    end;

    //[Scope('Internal')]
    procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

