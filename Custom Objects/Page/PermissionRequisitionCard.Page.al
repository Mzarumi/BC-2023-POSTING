page 52186267 "Permission Requisition Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Permission Requisition";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                }
                field("Staff No"; Rec."Staff No")
                {
                }
                field("Full Name"; Rec."Full Name")
                {
                }
                field("Phone No"; Rec."Phone No")
                {
                }
                field("Employment Type"; Rec."Employment Type")
                {
                }
                field(Department; Rec.Department)
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                    Editable = RequestType;

                    trigger OnValidate()
                    begin
                        if Rec.Status <> Rec.Status::Open then Error('You can only edit an open document');
                    end;
                }
                field("Date Captured"; Rec."Date Captured")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(User; Rec.User)
                {
                }
                field("Date Approved"; Rec."Date Approved")
                {
                    Editable = false;
                }
                field("Time Approved"; Rec."Time Approved")
                {
                    Editable = false;
                }
            }
            part("Permission Requisition Lines"; "Permission Requisition Lines")
            {
                Editable = true;
                SubPageLink = "Header No" = FIELD(No);
            }
        }
    }

    actions
    {
        area(processing)
        {
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
                    NextofKinError: Label 'You must specify next of Kin for this application.';
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    PermissionRequisitionLines.Reset;
                    PermissionRequisitionLines.SetRange("Header No", Rec.No);
                    if PermissionRequisitionLines.FindFirst then begin
                        repeat
                            if (PermissionRequisitionLines."Systems Affected" = '') or
                                (PermissionRequisitionLines.Category = '') or
                                (PermissionRequisitionLines."Reason For Request" = '') or
                                (PermissionRequisitionLines."Employee No" = '') or
                                (PermissionRequisitionLines.Category = '')
                                then
                                Error('Kindly fill all the fields in the lines');
                        until PermissionRequisitionLines.Next = 0;
                    end else
                        Error('You must have at leat one line');
                    if Rec."Request Type" = Rec."Request Type"::" " then Error('Request type must have a value');
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                end;
            }
            action(CancelApprovalRequest)
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action("Approvals.")
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
    }

    trigger OnOpenPage()
    begin
        RequestType := true;
        LinesEditable := true;
        if Rec.Status <> Rec.Status::Open then begin
            RequestType := false;
            LinesEditable := false;
        end;
    end;

    var
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        PermissionRequisitionLines: Record "Permission Requisition Lines";
        RequestType: Boolean;
        LinesEditable: Boolean;
}

