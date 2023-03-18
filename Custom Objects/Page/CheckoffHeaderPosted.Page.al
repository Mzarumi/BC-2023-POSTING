page 52185689 "Checkoff Header Posted"
{
    PageType = Card;
    SourceTable = "Checkoff Header";
    SourceTableView = WHERE(Posted = FILTER(true));

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
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = EditCheckoff;
                }
                field("Account Type"; Rec."Account Type")
                {
                    Editable = EditCheckoff;
                }
                field("Account No."; Rec."Account No.")
                {
                    Editable = EditCheckoff;
                }
                field("Account Name"; Rec."Account Name")
                {
                    Editable = EditCheckoff;
                }
                field("Document No."; Rec."Document No.")
                {
                    Editable = EditCheckoff;
                }
                field(Description; Rec.Description)
                {
                    Editable = EditCheckoff;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    Editable = EditCheckoff;
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    Editable = EditCheckoff;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = EditCheckoff;
                }
                field("Scheduled Amount"; Rec."Scheduled Amount")
                {
                    Editable = EditCheckoff;
                }
                field("Total Count"; Rec."Total Count")
                {
                }
                field("Posted Records"; Rec."Posted Records")
                {
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
            }
            part(Control22; "Checkoff Lines")
            {
                Editable = EditCheckoff;
                SubPageLink = "Checkoff Header" = FIELD("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control19; Outlook)
            {
            }
            systempart(Control20; Notes)
            {
            }
            systempart(Control21; MyNotes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Genearate Lines")
            {
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Txt0000: Label 'Checkoff Successfully Generated';
                begin
                    //here//PeriodicActy.GenerateCheckoff(Rec);

                    Message(Txt0000);
                end;
            }
            action(Post)
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Rec.Posted = false then
                        //here//PeriodicActy.PostCheckoff(Rec)//here
                        //else
                        Error(Txt0000);
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

                        if Rec.Status <> Rec.Status::Open then
                            Error(DocMustbeOpen);

                        Rec.TestField("Document No.");
                        Rec.TestField(Description);
                        Rec.TestField(Amount);
                        Rec.TestField("Employer Code");
                        Rec.TestField("Posting Date");



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
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        SetUpdateControl;
    end;

    var
        PeriodicActy: Codeunit "Periodic Activities";
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        DateCaption: Boolean;
        EditCheckoff: Boolean;
        EditCheckoffLine: Boolean;
        Txt0000: Label 'Checkoff has been posted';
        Percentage: Decimal;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    local procedure SetUpdateControl()
    begin
        if Rec.Status = Rec.Status::Open then begin
            EditCheckoff := true;
        end else begin
            EditCheckoff := false;
        end;
    end;
}

