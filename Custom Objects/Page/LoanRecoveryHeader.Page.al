page 52185859 "Loan Recovery Header"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Loan Recovery Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field("Recovery Type"; Rec."Recovery Type")
                {

                    trigger OnValidate()
                    begin
                        if Rec."Recovery Type" = Rec."Recovery Type"::Detachement then begin
                            DetachNoEnabled := true;
                            DetachReasonEnabled := true;
                        end else begin
                            DetachNoEnabled := false;
                            DetachReasonEnabled := false;
                        end;
                    end;
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                    Editable = false;
                }
                field("Entered By"; Rec."Entered By")
                {
                    Editable = false;
                }
                field("Detach Recovery No"; Rec."Detach Recovery No")
                {
                    Editable = detachnoenabled;
                }
                field("Detachment Reason"; Rec."Detachment Reason")
                {
                    Editable = DetachReasonEnabled;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                    Editable = false;
                }
                field("Outsatnding Interest"; Rec."Outsatnding Interest")
                {
                    Editable = false;
                }
                field("Member Deposits"; Rec."Member Deposits")
                {
                    Editable = false;
                }
                field(Recovered; Rec.Recovered)
                {
                    Editable = false;
                }
            }
            part(Control13; "Loan Recovery Lines")
            {
                SubPageLink = "Loan Recovery No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Guarantors)
            {
                Caption = 'Guarantors';
                Image = ItemGroup;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Loan Guarantors and Security";
                RunPageLink = "Loan No" = FIELD("Loan No.");
            }
            separator(Action18)
            {
            }
            action("Recover Defaulted Loan")
            {
                Image = ReceiveLoaner;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Member No.");
                    if Rec.Status <> Rec.Status::Approved then
                        Error(ErrMessage);
                    if Rec.Recovered = true then
                        Error(ErrMessage2);
                    //here//PeriodicActivities.GuarantorRecovery(Rec);
                    if Members.Get(Rec."Member No.") then
                        Members."Dividend Action" := Members."Dividend Action"::" ";
                    Members.Modify;
                    Message('Process completed Successfully');
                end;
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
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec."Posting Date" := Today;
                        Rec."Entered By" := UserId;
                        Rec."Date Entered" := Today;
                        Rec.Modify;
                        if Rec.Status <> Rec.Status::Open then
                            Error(DocMustbeOpen);
                        if Rec."Recovery Type" = Rec."Recovery Type"::Detachement then begin
                            Rec.TestField("Detach Recovery No");
                            Rec.TestField("Detachment Reason");
                        end;

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
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        if Rec.Status <> Rec.Status::Pending then
                            Error(DocMustbePending);

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Re-Open Document")
                {
                    Image = ReOpen;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        if (Rec.Status = Rec.Status::Rejected) or (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) then begin
                            if Confirm('Are you sure you want to re-open the loan?', false) = true then begin
                                Rec.Status := Rec.Status::Open;
                                Rec.Modify;
                            end;
                        end;
                    end;
                }
                action("Reset Date")
                {
                    Image = ReOpen;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if (Rec.Status = Rec.Status::Open) and (Rec.Recovered = false) then begin
                            if Confirm('Are you sure you want to reset the date?', false) = true then begin
                                Rec."Date Entered" := Today;
                                Rec."Entered By" := UserId;
                                Rec.Modify;
                            end;
                        end else
                            Error('The Date cannot be reset if Recovered is true or the document status is not open');
                    end;
                }
                action("Deactivate Recovered")
                {
                    Image = Reconcile;

                    trigger OnAction()
                    begin
                        UserSetup.Reset;
                        UserSetup.SetRange("User ID", UserId);
                        if UserSetup.Find('-') then begin
                            if UserSetup."Deactivate Recovered" = false then Error('You do not have permissions to Deactivate recovered button');
                            Rec.Recovered := false;
                            Rec."Modify Recovered" := true;
                            Rec."Modified By" := UserId;
                            Rec."Date Modified" := Today;
                            Rec.Modify;
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if (Rec.Status = Rec.Status::Pending) or (Rec.Status = Rec.Status::Approved) then
            CurrPage.Editable := false;
        SetControlAppearance;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Recovered = true then
            CurrPage.Editable := false;
        if (Rec.Status = Rec.Status::Pending) or (Rec.Status = Rec.Status::Approved) then
            CurrPage.Editable := false;
        DetachNoEnabled := false;
        DetachReasonEnabled := false;

        if Rec."Recovery Type" = Rec."Recovery Type"::Detachement then begin
            DetachNoEnabled := true;
            DetachReasonEnabled := true;
        end;
    end;

    var
        PeriodicActivities: Codeunit "Periodic Activities";
        ErrMessage: Label 'Application must be approved before recovering';
        ErrMessage2: Label 'Recovery has already been done for this application.';
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        DocMustbeApproved: Label 'This document must be approved before updating';
        LoansProcess: Codeunit "Loans Process";
        DetachNoEnabled: Boolean;
        DetachReasonEnabled: Boolean;
        UserSetup: Record "User Setup";
        Members: Record Members;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

