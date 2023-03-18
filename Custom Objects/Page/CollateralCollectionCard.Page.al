page 52186427 "Collateral Collection Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Securities Collection Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("Collateral Register No."; Rec."Collateral Register No.")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Collateral Type"; Rec."Collateral Type")
                {
                }
                field(Collateral; Rec.Collateral)
                {
                }
                field("Collateral Name"; Rec."Collateral Name")
                {
                }
                field("Collateral Multiplier"; Rec."Collateral Multiplier")
                {
                }
                field("Collateral Value"; Rec."Collateral Value")
                {
                }
                field("Collateral Limit"; Rec."Collateral Limit")
                {
                }
                field("Inward/Outward"; Rec."Inward/Outward")
                {
                }
                field("Last Valuation Date"; Rec."Last Valuation Date")
                {
                }
                field("Forced Sale Value"; Rec."Forced Sale Value")
                {
                }
                field("Collateral Perfected"; Rec."Collateral Perfected")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Next Valuation Date"; Rec."Next Valuation Date")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    Visible = true;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Notes)
            {
            }
            systempart(Control9; MyNotes)
            {
            }
            systempart(Control8; Links)
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

                    Rec.TestField(Remarks);

                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);
                    //Members.GET("Member No.");
                    //SendSMS.SendSms(SourceType::"Loan Application",Members."Mobile Phone No",'Your security '+FORMAT("Collateral Value")+' '+'has been perfected'
                    //,"No.","Account No.",FALSE);
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
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
}

