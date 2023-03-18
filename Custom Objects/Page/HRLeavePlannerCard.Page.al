page 52185569 "HR Leave Planner Card"
{
    PageType = Card;
    SourceTable = "HR Leave Planner Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field(Year; Rec.Year)
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
            part(Control1000000002; "Hr Leave Planner Lines")
            {
                SubPageLink = "Global Dimension 1 Code" = FIELD("Global Dimension 1 Code"),
                              "Shortcut Dimension 2 Code" = FIELD("Shortcut Dimension 2 Code"),
                              "Shortcut Dimension 3 Code" = FIELD("Shortcut Dimension 3 Code"),
                              "Shortcut Dimension 4 Code" = FIELD("Shortcut Dimension 4 Code"),
                              Year = FIELD(Year),
                              "Document Number" = FIELD(No);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
            }
            action("&Approvals")
            {
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    /*
                    DocumentType:=DocumentType::LeavePlanner;
                    ApprovalEntries.Setfilters(DATABASE::"HR Leave Planner Header",DocumentType,No);
                    ApprovalEntries.RUN;
                    */

                    approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);

                end;
            }
            action("&Send Approval Request")
            {
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin


                    if Confirm('Send this Leave schedule for Approval?', true) = false then exit;
                    Rec."User ID" := UserId;
                    //ApprovalMgt.SendLeavePlannerAppApprovalReq(Rec);
                    /*
                    IF appvmgt.CheckleavePlannerReqApprovalsWorkflowEnabled(Rec) THEN
                      appvmgt.OnSendleavePlannerReqForApproval(Rec);
                    */
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);

                end;
            }
            action("&Cancel Approval Request")
            {
                Caption = '&Cancel Approval Request';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    /*//ApprovalMgt.CancelLeavePlannerAppRequest(Rec,TRUE,TRUE);
                    appvmgt.OnCancelleavePlannerReqApprovalRequest(Rec);*/
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                end;
            }
            action(Print)
            {
                Caption = 'Print';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Category4;
            }
            action("Get Employees")
            {
                Caption = 'Get Employees';
                Image = GetActionMessages;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    planner.Reset;
                    planner.SetRange(planner."Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                    planner.SetRange(planner."Shortcut Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                    if planner.FindSet then
                        planner.DeleteAll;

                    HREmp.Reset;
                    // HREmp.SetRange(HREmp."Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                    // HREmp.SetRange(HREmp."Global Dimension 2 Code", Rec."Shortcut Dimension 2 Code");
                    //HREmp.SETRANGE(HREmp."Department Code",

                    if HREmp.Find('-') then begin
                        repeat
                            //insert into this Leave Planner
                            planner.Init;
                            planner."Document Number" := Rec.No;
                            planner."Global Dimension 1 Code" := Rec."Global Dimension 1 Code";
                            planner."Shortcut Dimension 2 Code" := Rec."Shortcut Dimension 2 Code";
                            planner."Staff No." := HREmp."No.";
                            planner."Staff Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                            planner.Year := Rec.Year;
                            planner.Insert;
                        //planner
                        until HREmp.Next = 0;
                    end;
                end;
            }
        }
    }

    var
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Disciplinary Approvals","Activity Approval","Exit Approval","Medical Claim Approval",Jv,"BackToOffice ","Training Needs",EmpTransfer,LeavePlanner;
        ApprovalEntries: Page "Approval Entries";
        HREmp: Record "HR Employees";
        planner: Record "HR Leave Planner Lines";
        appvmgt: Codeunit "Approvals Mgmt.";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        approvalsMgmt: Codeunit "Approvals Mgmt.";
}

