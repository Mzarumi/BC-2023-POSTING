page 52185693 "Agent Application Card"
{
    PageType = Card;
    //Permissions = TableData TableData39006049 = rimd;
    SourceTable = "Agent Applications";
    SourceTableView = WHERE("Approval Status" = FILTER(Open | Pending | Rejected));

    layout
    {
        area(content)
        {
            group(General)
            {
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
                field("Document Serial No"; Rec."Document Serial No")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field(Account; Rec.Account)
                {
                }
                field("Comm Account"; Rec."Comm Account")
                {
                    Caption = 'Commission Account';
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field("Customer ID No"; Rec."Customer ID No")
                {
                    Editable = false;
                }
                field("Mobile No"; Rec."Mobile No")
                {
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    Editable = false;
                }
                field(Role; Rec.Role)
                {
                    Editable = false;
                }
                field("Internal Agent"; Rec."Internal Agent")
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
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                }
                field("No. Series"; Rec."No. Series")
                {
                }
            }
            group("Device and Auth")
            {
                Caption = 'Device and Auth';
                field("Device IMEI"; Rec."Device IMEI")
                {

                    trigger OnValidate()
                    begin
                        AgentApplications.Reset;
                        AgentApplications.SetFilter("Agent Code", '<>%1', Rec."Agent Code");
                        AgentApplications.SetRange("Device IMEI", Rec."Device IMEI");
                        if AgentApplications.FindFirst then Error('The Device IMEI Already Exists');
                    end;
                }
                field("Device Serial No"; Rec."Device Serial No")
                {

                    trigger OnValidate()
                    begin
                        AgentApplications.Reset;
                        AgentApplications.SetFilter("Agent Code", '<>%1', Rec."Agent Code");
                        AgentApplications.SetRange("Device Serial No", Rec."Device Serial No");
                        if AgentApplications.FindFirst then Error('The Device Serial Number Already Exists');
                    end;
                }
                field("Software ID"; Rec."Software ID")
                {
                }
                field("Processor ID"; Rec."Processor ID")
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
                        EnsureRequiredFieldsHaveValues;
                        Rec.TestField("Name of the Proposed Agent");
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant)
                          then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
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
                        //ApprovalMgt.CancelAgencyAppr(Rec,TRUE,TRUE);
                        if Rec."Approval Status" <> Rec."Approval Status"::Pending then
                            Error(DocMustbePending);

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
    }

    var
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batches,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,"HRTransport Request",HRTraining,"HREmp Requsition",MicroTrans,Agency,"Agent Code";
        DocMustbePending: Label 'Application must be pending approval';
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        AgentApplications: Record "Agent Applications";
        SavingsAccounts: Record "Savings Accounts";

    local procedure EnsureRequiredFieldsHaveValues()
    begin
        Rec.TestField("Name of the Proposed Agent");
        Rec.TestField(Name);
        Rec.TestField("Place of Business");
        Rec.TestField("Mobile No");
        Rec.TestField("Device IMEI");
        Rec.TestField("Device Serial No");
        //Rec.TestField("Device ID");

    end;
}

