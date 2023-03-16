page 52185872 "ATM Application Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "ATM Applications";
    SourceTableView = WHERE(Status = FILTER(<> Approved));

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = PageEditable;
                field("No."; Rec."No.")
                {
                }
                field("Auto Applied"; Rec."Auto Applied")
                {
                }
                field("Form No"; Rec."Form No")
                {
                    ShowMandatory = true;
                }
                field("Card Type"; Rec."Card Type")
                {
                    ShowMandatory = true;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ShowMandatory = true;
                }
                field("Account No"; Rec."Account No")
                {
                    ShowMandatory = true;
                }
                field("Request Type"; Rec."Request Type")
                {
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        CardReplacement;
                    end;
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Customer ID"; Rec."Customer ID")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field("Sales Agent Type"; Rec."Sales Agent Type")
                {
                }
                field("Sales Agent"; Rec."Sales Agent")
                {
                    Visible = SalesAgentVisible;
                }
                field("Capture Date"; Rec."Capture Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Approved  By"; Rec."Approved  By")
                {
                }
                field("Approval Date"; Rec."Approval Date")
                {
                }
            }
            group(Communication)
            {
                Editable = PageEditable;
                field(Address; Rec.Address)
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                }
            }
            group("ATM Parameters")
            {
                Editable = PageEditable;
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Date Issued"; Rec."Date Issued")
                {
                }
                field(Limit; Rec.Limit)
                {
                }
                field("Terms Read and Understood"; Rec."Terms Read and Understood")
                {
                }
                field("Replacement For Card No"; Rec."Replacement For Card No")
                {
                    Editable = ReplaceEditable;
                }
            }
            group("ATM Linking")
            {
                Editable = false;
                Visible = false;
                field("Card Issued"; Rec."Card Issued")
                {
                }
                field("Linked Date"; Rec."Linked Date")
                {
                }
                field("ATM Linked"; Rec."ATM Linked")
                {
                }
                field("Card Status"; Rec."Card Status")
                {
                }
                field("Date Activated"; Rec."Date Activated")
                {
                }
                field("Date Frozen"; Rec."Date Frozen")
                {
                }
                field(Collected; Rec.Collected)
                {
                }
                field("Card Issued By"; Rec."Card Issued By")
                {
                }
                field("PIN Issued Date"; Rec."PIN Issued Date")
                {
                }
                field("PIN Issued By"; Rec."PIN Issued By")
                {
                }
                field("Date Collected"; Rec."Date Collected")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Pesa Point ATM Card")
            {
                Caption = 'Pesa Point ATM Card';
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Comments";
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
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
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField("Account No");
                        Rec.TestField("Form No");
                        Rec.TestField("Card Type");

                        //TESTFIELD("Customer ID");

                        //Rec.TestField("Customer ID");

                        Rec.TestField("Terms Read and Understood");
                        Rec.TestField("Shortcut Dimension 1 Code");
                        Rec.TestField("Shortcut Dimension 2 Code");
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
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        CardReplacement;
        UpdateControls;
    end;

    trigger OnInit()
    begin
        CompanyInformation.Get();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        CardReplacement
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        //CardReplacement;
    end;

    trigger OnOpenPage()
    begin
        CompanyInformation.Get();
        CardReplacement;
        UpdateControls;
    end;

    var
        CompanyInformation: Record "Company Information";
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        SavingsAccounts: Record "Savings Accounts";
        PeriodicActivities: Codeunit "Periodic Activities";
        BankingUserTemplate: Record "Banking User Template";
        JTemp: Code[20];
        JBatch: Code[20];
        ReplaceEditable: Boolean;
        PageEditable: Boolean;
        SalesAgentVisible: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    local procedure CardReplacement()
    begin
        if Rec."Request Type" = Rec."Request Type"::New then
            ReplaceEditable := false else
            ReplaceEditable := true;
    end;

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        if Rec.Status <> Rec.Status::Open then begin
            PageEditable := false;
        end else
            PageEditable := true;
        CompanyInformation.Get();
        if CompanyInformation."Use Sales Agents" then
            SalesAgentVisible := true else
            SalesAgentVisible := false;
    end;
}

