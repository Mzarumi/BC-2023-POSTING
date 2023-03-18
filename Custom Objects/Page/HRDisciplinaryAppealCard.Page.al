page 52185543 "HR Disciplinary Appeal Card"
{
    SourceTable = "HRDisciplinary Appeal";

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
            }
            field("Employee No."; Rec."Employee No.")
            {
            }
            field("Employee Name"; Rec."Employee Name")
            {
            }
            field("Disciplinary Case No"; Rec."Disciplinary Case No")
            {
            }
            field("Employee Reason"; Rec."Employee Reason")
            {
                MultiLine = true;
            }
            field("HR Reasons"; Rec."HR Reasons")
            {
                MultiLine = true;
            }
            field(Region; Rec.Region)
            {
            }
            field(Department; Rec.Department)
            {
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
            }
            field(Status; Rec.Status)
            {
            }
            field("User ID"; Rec."User ID")
            {
            }
        }
    }

    actions
    {
        area(creation)
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
                begin

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
        }
    }

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
}

