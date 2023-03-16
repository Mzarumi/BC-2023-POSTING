page 52186703 "Electoral Zones Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Electoral Zones";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = TheGeneral;
                field("Code"; Rec.Code)
                {
                    Editable = false;
                }
                field("Electoral Zone Name"; Rec."Electoral Zone Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
                field(County; Rec.County)
                {
                }
                field("Sub-County"; Rec."Sub-County")
                {
                }
                field("Sub-County Name"; Rec."Sub-County Name")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Mileage; Rec.Mileage)
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                }
            }
            part(Control25; "Officials List Part")
            {
                Editable = Officials;
                SubPageLink = "Electoral Zone" = FIELD(Code);
            }
            part(Control14; "Retired Officials List Part")
            {
                Editable = false;
                SubPageLink = "Electoral Zone" = FIELD(Code);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Approve)
            {
                Caption = 'Approve';
                Enabled = ApprovalButton;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    // ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                end;
            }
            separator(Action23)
            {
            }
            action(SendApprovalRequest)
            {
                Caption = 'Send A&pproval Request';
                Enabled = SendApprovalButton;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    // TestField("Global Dimension 1 Code");
                    // TestField("Global Dimension 2 Code");
                    // TestField("Electoral Zone Name");
                    // TestField(County);

                    DelegateOfficials.Reset;
                    DelegateOfficials.SetRange("Electoral Zone", Rec.Code);
                    if DelegateOfficials.FindFirst then begin
                        repeat
                            if DelegateOfficials."Member Number" = '' then
                                Error('Member number cannot be empty');
                            if DelegateOfficials.Position = '' then
                                Error('Position cannot be empty');
                        until DelegateOfficials.Next = 0;
                    end;

                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                end;
            }
            action(CancelApprovalRequest)
            {
                Caption = 'Cancel Approval Re&quest';
                Enabled = CancelApprovalButton;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;

                trigger OnAction()
                var
                    // ApprovalEntries: Page "Approval Entries";
                    // approvalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    // approvalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Controls;
    end;

    var
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        ApprovalButton: Boolean;
        SendApprovalButton: Boolean;
        CancelApprovalButton: Boolean;
        Officials: Boolean;
        TheGeneral: Boolean;
        DelegateOfficials: Record "Delegate Officials";

    local procedure Controls()
    begin
        //if Status = Rec.Status::Open then begin
            ApprovalButton := false;
            SendApprovalButton := true;
            CancelApprovalButton := false;
            TheGeneral := true;
            Officials := true;
        //end;

        //if Status = Rec.Status::Pending then begin
            ApprovalButton := true;
            SendApprovalButton := false;
            CancelApprovalButton := true;
            TheGeneral := false;
            Officials := false;
        //end;

        //if Status = Rec.Status::Approved then begin
            ApprovalButton := false;
            SendApprovalButton := false;
            CancelApprovalButton := false;
            TheGeneral := false;
            Officials := false;
        //end;

        //if Status = Rec.Status::Rejected then begin
            ApprovalButton := false;
            SendApprovalButton := false;
            CancelApprovalButton := false;
            TheGeneral := false;
            Officials := false;
        end;
    //end;
}

