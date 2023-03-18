page 52186707 "Delegate Officials Card"
{
    DeleteAllowed = false;
    InsertAllowed = true;
    PageType = Card;
    SourceTable = "Delegate Officials";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = GeneralTab;
                field("Electoral Zone"; Rec."Electoral Zone")
                {
                }
                field("Electoral Zone Name"; Rec."Electoral Zone Name")
                {
                }
                field("Member Number"; Rec."Member Number")
                {
                }
                field("Delegate Official Name"; Rec."Delegate Official Name")
                {
                }
                field(Position; Rec.Position)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Retired; Rec.Retired)
                {
                }
                field("Appointment Date"; Rec."Appointment Date")
                {
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Registered By"; Rec."Registered By")
                {
                }
            }
            group(Retirement)
            {
                field("Retirement Date"; Rec."Retirement Date")
                {
                    Editable = RetirementDateField;
                }
                field("Reason for retirement"; Rec."Reason for retirement")
                {
                    Editable = ReasonForRetirementField;
                }
                field("Retired By"; Rec."Retired By")
                {
                }
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
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);

                end;
            }
            separator(Action27)
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
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    // CALCFIELDS("Delegate Count");
                    // IF "Delegate Count"=0 THEN
                    //  ERROR('The delegates must be captured');
                    // //Rec.TestField("Delegate Region Description");
                    // //Rec.TestField("Electoral Zone");
                    // Rec.TestField("Global Dimension 1 Code");
                    // Rec.TestField("Global Dimension 2 Code");
                    // VarVariant := Rec;
                    // IF CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                    //  CustomApprovals.OnSendDocForApproval(VarVariant);

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

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                    approvalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    //approvalsMgmt.OpenApprovalEntriesPage(RecordId);
                end;
            }
            action("Retire Delegate Official")
            {
                Enabled = RetireDelegateButton;
                Image = CreateLinesFromTimesheet;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    // if "Retirement Date" = 0D then Error('Retire date must have a value');

                    // if "Retirement Date" < "Appointment Date" then Error('Retirement date cannot be earlier than appointment date');
                    // if "Retirement Date" > Today then Error('Retirement date cannot be later than today');

                    // "Retired By" := UserId;
                    // Retired := true;

                    // Modify;
                    Message('Delegate retired successfully');
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
        GeneralTab: Boolean;
        ApprovalButton: Boolean;
        SendApprovalButton: Boolean;
        CancelApprovalButton: Boolean;
        RetireDelegateButton: Boolean;
        RetirementDateField: Boolean;
        ReasonForRetirementField: Boolean;

    local procedure Controls()
    begin
        //if Status = Rec.Status::Open then begin
            GeneralTab := true;
            ApprovalButton := false;
            SendApprovalButton := true;
            CancelApprovalButton := false;
            RetireDelegateButton := false;
            RetirementDateField := false;
            ReasonForRetirementField := false;
        //end;

        //if Status = Status::Pending then begin
            GeneralTab := false;
            ApprovalButton := true;
            SendApprovalButton := false;
            CancelApprovalButton := true;
            RetireDelegateButton := false;
            RetirementDateField := false;
            ReasonForRetirementField := false;
        //end;

        //if Status = Status::Approved then begin
            GeneralTab := false;
            ApprovalButton := false;
            SendApprovalButton := false;
            CancelApprovalButton := false;
            RetireDelegateButton := true;
            RetirementDateField := true;
            ReasonForRetirementField := true;

        //end;

        //if Status = Status::Rejected then begin
            GeneralTab := false;
            ApprovalButton := false;
            SendApprovalButton := false;
            CancelApprovalButton := false;
            RetireDelegateButton := false;
            RetirementDateField := false;
            ReasonForRetirementField := false;

        //end;

        //if Retired then begin
            GeneralTab := false;
            ApprovalButton := false;
            SendApprovalButton := false;
            CancelApprovalButton := false;
            RetireDelegateButton := false;
            RetirementDateField := false;
            ReasonForRetirementField := false;

        //end;
    end;
}

