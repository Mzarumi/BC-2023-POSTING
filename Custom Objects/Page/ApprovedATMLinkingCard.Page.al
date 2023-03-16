page 52186288 "Approved ATM Linking Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "ATM Linking Applications";
    SourceTableView = WHERE(Status = FILTER(Approved));

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
                field("Account No"; Rec."Account No")
                {
                }
                field("ATM Application No."; Rec."ATM Application No.")
                {
                }
                field("Form No"; Rec."Form No")
                {
                    Editable = false;
                }
                field("Request Type"; Rec."Request Type")
                {
                    Editable = false;
                }
                field("Card Type"; Rec."Card Type")
                {
                    Editable = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    Editable = false;
                }
                field("Customer ID"; Rec."Customer ID")
                {
                }
                field("Sales Agent"; Rec."Sales Agent")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Branch Code"; Rec."Branch Code")
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
                Editable = PageEditable;
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Card No"; Rec."Card No")
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
                field("Approval Date"; Rec."Approval Date")
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
                field("ATM Linking Statistics"; Rec."ATM Linking Statistics")
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
            group(Approval)
            {
                Caption = 'Approval';
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
            group(Action62)
            {
                Caption = 'ATM Parameters';
                action("Collect ATM")
                {
                    Caption = 'Confirm Card Collection';
                    Image = PersonInCharge;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        // SaccoTransactions.CollectATM(Rec);
                    end;
                }
                action("Link ATM")
                {
                    Caption = 'Link ATM Card';
                    Image = CreditCard;
                    Promoted = true;
                    PromotedCategory = Process;

                    // trigger OnAction()
                    // var
                    //     [RunOnClient]
                    //     Window: DotNet Interaction;
                    // begin
                    //     SaccoTransactions.LinkATM(Rec);
                    // end;
                }
                action("Issue Pin")
                {
                    Image = IssueFinanceCharge;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Rec.TestField("PIN Issued", false);
                        Rec.TestField("Card Issued", true);
                        Rec.TestField("Card No");
                        Rec.TestField("Card Expiry Date");
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
                action("Delink ATM")
                {
                    Caption = 'DeLink ATM Card';
                    Image = RemoveContacts;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                    // [RunOnClient]
                    // Window: DotNet Interaction;
                    begin
                        //MyComment:=Window.InputBox('Enter reason for changing delinking','account:'+Rec."Account No",'',100,100);
                        //MESSAGE(MyComment);
                        // SaccoTransactions.DeLinkATM(Rec);
                    end;
                }
                action("Reopen Delinked Card")
                {
                    Caption = 'Reopen Delinked Card';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                    // [RunOnClient]
                    // Window: DotNet Interaction;
                    begin

                        Rec.TestField(Status, Rec.Status::Approved);
                        Rec.TestField("ATM Delinked", true);
                        Rec.Status := Rec.Status::Open;
                        Rec."ATM Delinked" := false;
                        Rec."ATM Delinked Date" := 0D;
                        Rec."Card Status" := Rec."Card Status"::Pending;
                        Rec."Card Issued" := false;

                        ;
                        Rec.Collected := false;
                        Rec."PIN Issued" := false;
                        Rec."Delinked By" := '';
                        Rec.Modify;
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
            group("Requests for approval")
            {
                Caption = 'Requests for approval';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        PageEditable := true;
        if Rec.Status <> Rec.Status::Open then
            PageEditable := false;
    end;

    trigger OnOpenPage()
    begin
        PageEditable := true;
        if Rec.Status <> Rec.Status::Open then
            PageEditable := false;
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
        JBatch: Code[20];
        SaccoTransactions: Codeunit "Sacco Transactions";
        PageEditable: Boolean;
}

