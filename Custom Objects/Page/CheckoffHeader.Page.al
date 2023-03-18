page 52185840 "Checkoff Header"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Checkoff Header";

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
                field("Posting Period"; Rec."Posting Period")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Vendor No"; Rec."Vendor No")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    Editable = false;
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    Editable = false;
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
                    Rec.CalcFields("Posted Records");
                    if Rec."Posted Records" > 0 then
                        Error(Err002);

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
                    if Rec.Status = Rec.Status::Approved then begin
                        //here//if Posted = false then
                        //here//PeriodicActy.PostCheckoff(Rec)
                        //else
                        Error(Txt0000);
                    end else
                        Error(Error001);
                end;
            }
            separator(Action37)
            {
            }
            action("CheckOff Report")
            {
                Image = Report2;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    CheckoffHeader.Reset;
                    CheckoffHeader.SetRange(CheckoffHeader."No.", Rec."No.");
                    //if CheckoffHeader.Find('-') then
                    //REPORT.Run(52186378, true, false, CheckoffHeader);
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
                        Rec.TestField(Type);



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
                action("Open Document")
                {
                    Image = OpenJournal;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to open the document?', false) = false then
                            exit;
                        Rec.Status := Rec.Status::Open;
                        //Rec.MRecodify;
                        Message('Document open Successfuly');
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

    trigger OnInit()
    begin
        //SetUpdateControl;
    end;

    trigger OnOpenPage()
    begin
        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) then
            CurrPage.Editable := false;
        CurrPage.Update;
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
        Error001: Label 'Document must be Approved';
        Err002: Label 'There are entries that have been posted you cannot generate lines';
        CheckoffHeader: Record "Checkoff Header";

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

        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) then
            CurrPage.Editable := false;

        //CurrPage.UPDATE;
    end;
}

