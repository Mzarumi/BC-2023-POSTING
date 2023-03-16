page 52186120 "Surety Management Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Surety Management";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Surety No"; Rec."Surety No")
                {
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                }
                field("Type Of Account"; Rec."Type Of Account")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                    Editable = false;
                }
                field(Accused; Rec.Accused)
                {
                }
                field("Refference No"; Rec."Refference No")
                {
                }
                field("Refference Details"; Rec."Refference Details")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                }
                field(Court; Rec.Court)
                {
                }
                field("Court Name"; Rec."Court Name")
                {
                }
                field("Case No"; Rec."Case No")
                {
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                    Editable = false;
                }
                field(Control35; Rec.Comment)
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Approved then begin
                    end else
                        Error('You can only Print approved Document');

                    Rec.Reset;
                    Rec.SetFilter("Surety No", Rec."Surety No");
                    //REPORT.Run(39006073, true, true, Rec);
                    Rec.Reset;
                end;
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
                        Rec.TestField("Member No");
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
                        VarVariant := Rec;
                        // CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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
                action("Surety Letter Issue")
                {
                    Caption = 'Surety Letter Issue';
                    Image = AddToHome;
                    Promoted = true;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Member.Reset;
                        Member.SetRange(Member."No.", Rec."Member Account No");
                        if Member.Find('-') then
                            Member."Surety Letter Issued" := true;
                        Member.Modify
                    end;
                }
                action("Deattach Surety Letter Issue")
                {
                    Caption = 'Deattach Surety Letter Issue';
                    Image = Accounts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Comment);
                        Member.Reset;
                        Member.SetRange(Member."No.", Rec."Member Account No");
                        if Member.Find('-') then
                            Member."Surety Letter Issued" := false;
                        Member.Modify;
                        Rec."Stopped USER ID" := UserId;
                        Rec."Stopped Date" := Today;
                        Rec."Stopped Time" := Time;
                    end;
                }
            }
        }
    }

    var
        // CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        Member: Record Members;
}

