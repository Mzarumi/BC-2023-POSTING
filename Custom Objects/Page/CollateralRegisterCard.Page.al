page 52186412 "Collateral Register Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Securities Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
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
                field("Collateral Ref No."; Rec."Collateral Ref No.")
                {
                }
                field(Collateral; Rec.Collateral)
                {
                }
                field("Collateral Name"; Rec."Collateral Name")
                {
                    Visible = false;
                }
                field("Collateral Multiplier"; Rec."Collateral Multiplier")
                {
                    Editable = false;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Collateral Value"; Rec."Collateral Value")
                {
                }
                field("Collateral Limit"; Rec."Collateral Limit")
                {
                }
                field("Inward/Outward"; Rec."Inward/Outward")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Last Valuation Date"; Rec."Last Valuation Date")
                {
                }
                field("Forced Sale Value"; Rec."Forced Sale Value")
                {
                }
                field("Collateral Perfected"; Rec."Collateral Perfected")
                {
                    Visible = false;
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Next Valuation Date"; Rec."Next Valuation Date")
                {
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    Visible = true;
                }
                field("Captured By"; Rec."Captured By")
                {
                    Editable = false;
                }
                field("Date Captured"; Rec."Date Captured")
                {
                    Editable = false;
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

                    //Rec.TestField("Last Valuation Date");
                    Rec.TestField("Account No.");
                    //Rec.TestField(Collateral);
                    Rec.TestField("Collateral Limit");
                    Rec.TestField("Collateral Multiplier");
                    //Rec.TestField("Collateral Perfected");
                    Rec.TestField("Collateral Type");
                    Rec.TestField("Collateral Value");
                    Rec.TestField("Forced Sale Value");
                    Rec.TestField(Status, Rec.Status::Open);
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
                    Rec.TestField(Status, Rec.Status::Pending);
                    if Confirm('Are you sure you want to cancel Approval Request?', false) = true then
                        VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action("Re-Open Rejected Loan")
            {
                Visible = false;

                trigger OnAction()
                begin
                    if (Rec.Status = Rec.Status::Rejected) or (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) then begin
                        if Confirm('Are you sure you want to re-open the loan?', false) = true then begin
                            Rec.Status := Rec.Status::Open;
                            CurrPage.Editable := true;
                            Rec.Modify;
                        end;
                    end;
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

    trigger OnOpenPage()
    begin
        //CurrPage.UPDATE;
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        [InDataSet]
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        DocMustbePending: Label 'Document status Must be Pending';

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

