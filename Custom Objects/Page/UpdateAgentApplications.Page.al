page 52186171 "Update Agent Applications"
{
    PageType = Card;
    SourceTable = "Update Agent Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Update No"; Rec."Update No")
                {
                }
                field("Agent Code"; Rec."Agent Code")
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                }
                field("Time Entered"; Rec."Time Entered")
                {
                }
                field("Entered By"; Rec."Entered By")
                {
                    Editable = false;
                }
                field("Mobile No"; Rec."Mobile No")
                {
                }
                field("Name of the Proposed Agent"; Rec."Name of the Proposed Agent")
                {
                }
                field("Type of Business"; Rec."Type of Business")
                {
                }
                field("Place of Business"; Rec."Place of Business")
                {
                }
                field("Business/Work Experience"; Rec."Business/Work Experience")
                {
                }
                field("Name of Banker"; Rec."Name of Banker")
                {
                }
                field("Approval Status"; Rec."Approval Status")
                {
                }
                field("PIN(KRA)"; Rec."PIN(KRA)")
                {
                }
                field("Withdrawal Limit Code"; Rec."Withdrawal Limit Code")
                {
                }
                field("Withdrawal Limit Amount"; Rec."Withdrawal Limit Amount")
                {
                    Editable = false;
                }
                field(Comments; Rec.Comments)
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
                field("Approved By"; Rec."Approved By")
                {
                    Editable = false;
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Device ID"; Rec."Device ID")
                {
                }
                field("Last Updated On"; Rec."Last Updated On")
                {
                }
                field("Last Updated By"; Rec."Last Updated By")
                {
                }
                field(Updated; Rec.Updated)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action1000000043)
            {
                Caption = 'Approvals';
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Send Approval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        Text001: Label 'This transaction is already pending approval';
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField("Mobile No");
                        Rec.TestField("Device ID");
                        Rec.TestField(Comments);
                        VarVariant := Rec;
                        // if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        //     CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action("Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        if Rec."Approval Status" <> Rec."Approval Status"::Pending then
                            Error(DocMustbePending);

                        VarVariant := Rec;
                        // CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
            }
            group(Tasks)
            {
                Caption = 'Tasks';
                action(Update)
                {
                    Image = UpdateDescription;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("Approval Status", "Approval Status"::Approved);
                        Rec.TestField(Updated, false);
                        Rec.FinalizeChanges();
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        CurrPage.Editable := false;
        if Rec."Approval Status" = "Approval Status"::Open then
            CurrPage.Editable := true;
    end;

    var
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batches,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,"HRTransport Request",HRTraining,"HREmp Requsition",MicroTrans,Agency;
        DocMustbePending: Label 'Application must be pending approval';
        VarVariant: Variant;
    // CustomApprovals: Codeunit "Custom Approvals Codeunit";
}

