page 52185433 "Sky Mbanking Changes Card"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "M-SACCO Change PIN No";
    SourceTableView = WHERE(Status = CONST(Pending));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                    Editable = false;
                }
                field("Time Entered"; Rec."Time Entered")
                {
                    Editable = false;
                }
                field("Entered By"; Rec."Entered By")
                {
                    Editable = false;
                }
                field("Type of Change"; Rec."Type of Change")
                {

                    trigger OnValidate()
                    begin
                        Rec.Comments := Format(Rec."Type of Change");
                        Rec.Modify;
                    end;
                }
                field("MPESA Application No"; Rec."MPESA Application No")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                    Editable = false;
                }
                field("Customer ID No"; Rec."Customer ID No")
                {
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Editable = false;
                }
                field("MPESA Mobile No"; Rec."MPESA Mobile No")
                {
                    Editable = false;
                }
                field("MPESA Corporate No"; Rec."MPESA Corporate No")
                {
                    Editable = false;
                }
                field(Comments; Rec.Comments)
                {
                    Editable = false;
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                }
                field("Date Sent"; Rec."Date Sent")
                {
                    Editable = false;
                }
                field("Time Sent"; Rec."Time Sent")
                {
                    Editable = false;
                }
                field("Sent By"; Rec."Sent By")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Sent To Server"; Rec."Sent To Server")
                {
                    Editable = false;
                }
            }
            group(Queries)
            {
                field("Membership No."; Rec."Membership No.")
                {
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field("Personal Number"; Rec."Personal Number")
                {
                }
                field("Next of Kin"; Rec."Next of Kin")
                {
                }
                field("Last Transaction"; Rec."Last Transaction")
                {
                }
                field("Loan with SACCO"; Rec."Loan with SACCO")
                {
                }
                field("Phone Number"; Rec."Phone Number")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Change Mpesa pin No")
            {
                Caption = 'Change Mpesa pin No';
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
                        if Rec.Comments = '' then begin

                            Error('Enter a reason for PIN Change');

                        end;


                        Rec.TestField("Membership No.");
                        Rec.TestField("ID Number");
                        Rec.TestField("Personal Number");
                        Rec.TestField("Next of Kin");
                        Rec.TestField("Last Transaction");
                        Rec.TestField("Loan with SACCO");
                        Rec.TestField("Phone Number");








                        Rec.TestField("ID Number");
                        Rec.TestField("Next of Kin");
                        if Rec."Type of Change" = Rec."Type of Change"::" " then
                            Error('Please Enter Type of Change');

                        if Rec.Status <> Rec.Status::Pending then
                            Error(DocMustbePending);

                        //Rec.TestField("Charge Transaction Type");
                        //Rec.TestField("Document No");
                        //Rec.TestField(Remarks);
                        //Rec.TestField(Amount);
                        //Rec.TestField("Employer Code");
                        //Rec.TestField("Posting date");

                        if Rec."MPESA Application No" = 'MAN0000002' then begin
                            Error('Kindly confirm MPESA Application No. in use for you to continue.');
                        end;



                        VarVariant := Rec;
                        // if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        //     CustomApprovals.OnSendDocForApproval(VarVariant);
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

                        if Rec.Status <> Rec.Status::Pending then
                            Error(DocMustbePending);

                        VarVariant := Rec;
                        //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;

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

    trigger OnModifyRecord(): Boolean
    begin
        //Rec.TestField(Status,Status::Open);
    end;

    var
        MPESAApp: Record "M-SACCO Applications";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batches,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,"HRTransport Request",HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation","Overdraft ",BLA,"Member Editable","Member Refund",FosaAct,mpesaTrans,"change Pin";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        //CustomApprovals: Codeunit "Custom Approvals Codeunit";
        DocMustbeOpen: Label 'This Application Must Be Open';
        DocMustbePending: Label 'This Application Must Be Pending';
    //PeriodicActivities: Codeunit "Periodic Activities";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

