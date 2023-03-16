page 52185874 "Approved ATM Application Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "ATM Applications";
    SourceTableView = WHERE(Status = FILTER(Approved | "Pending Approval"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                }
                field("Form No"; Rec."Form No")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Customer ID"; Rec."Customer ID")
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                }
                field("Card Type"; Rec."Card Type")
                {
                }
                field("Sales Agent"; Rec."Sales Agent")
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
                field("Capture Date"; Rec."Capture Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
            group(Communication)
            {
                Editable = false;
                field(Address; Rec.Address)
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                }
            }
            group("ATM Parameters")
            {
                Editable = false;
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Card No"; Rec."Card No")
                {
                }
                field("Date Issued"; Rec."Date Issued")
                {
                }
                field(Limit; Rec.Limit)
                {
                    Editable = false;
                }
                field("Terms Read and Understood"; Rec."Terms Read and Understood")
                {
                    Editable = false;
                }
                field("Card Expiry Date"; Rec."Card Expiry Date")
                {
                    Editable = true;
                }
            }
            group("ATM Linking")
            {
                Editable = false;
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
                field("Replacement For Card No"; Rec."Replacement For Card No")
                {
                }
                field(Collected; Rec.Collected)
                {
                }
                field("Card Issued By"; Rec."Card Issued By")
                {
                }
                field("Date Collected"; Rec."Date Collected")
                {
                }
                field("Delinked By"; Rec."Delinked By")
                {
                }
                field("ATM Delinked"; Rec."ATM Delinked")
                {
                }
                field("ATM Delinked Date"; Rec."ATM Delinked Date")
                {
                }
            }
            group("PIN Details")
            {
                Editable = false;
                field("PIN Issued"; Rec."PIN Issued")
                {
                }
                field("PIN Issued Date"; Rec."PIN Issued Date")
                {
                }
                field("PIN Issued By"; Rec."PIN Issued By")
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
                action("Charge Card Fee")
                {
                    Image = AdjustEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        // PeriodicActivities.PostATMApplicationCharges(Rec);
                    end;
                }
                action("Confirm Card Collection")
                {
                    Caption = 'Confirm Card Collection';
                    Image = PersonInCharge;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //SaccoTransactions.CollectATM(Rec);
                    end;
                }
                action("Issue Pin")
                {
                    Image = IssueFinanceCharge;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.TestField("PIN Issued", false);
                        Rec.TestField("Card Issued", true);
                        if Confirm('Are you sure you want to issue this pin?') then begin
                            if Rec."Card Issued By" = UserId then
                                Error('You cannot Issue Pin since you Issued Card') else begin
                                Rec."PIN Issued" := true;
                                Rec."PIN Issued By" := UserId;
                                Rec."PIN Issued Date" := Today;
                                Rec.Modify;
                            end;
                        end;
                    end;
                }
                action("Link ATM Card")
                {
                    Caption = 'Link ATM Card';
                    Image = CreditCard;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //SaccoTransactions.LinkATM(Rec);
                    end;
                }
                action("DeLink ATM Card")
                {
                    Caption = 'DeLink ATM Card';
                    Image = RemoveContacts;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //SaccoTransactions.DeLinkATM(Rec);
                    end;
                }
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
    end;

    var
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
        JBatch: Code[20];//
        SaccoTransactions: Codeunit "Sacco Transactions";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

