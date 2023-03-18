page 52185854 "Member withdrawal Notice"
{
    PageType = Card;
    SourceTable = "Member withdrawal Notice";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Member No."; Rec."Member No.")
                {
                    Editable = MemNoEdit;

                    trigger OnValidate()
                    begin
                        Rec."Date Entered" := Today;
                        Rec."Date Modified" := Today;
                        Rec."Entered By" := UserId;
                        Rec."Time Entered" := Time;
                        Rec."Withdrawal Notice Date" := Today;
                        Rec.Validate("Withdrawal Notice Date");
                        Rec.Modify;
                    end;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Notice Type"; Rec."Notice Type")
                {
                    Editable = NotTypeEdit;
                }
                field("Withdrawal Notice Date"; Rec."Withdrawal Notice Date")
                {
                    Editable = WithNotDate;
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    Editable = false;
                }
                field("Entered By"; Rec."Entered By")
                {
                    Editable = false;
                }
                field("Date Entered"; Rec."Date Entered")
                {
                    Editable = false;
                }
                field("Time Entered"; Rec."Time Entered")
                {
                    Editable = false;
                }
                field("Reason for withdrawal"; Rec."Reason for withdrawal")
                {
                    Editable = ROWEdit;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Loans Outstanding Balance"; Rec."Loans Outstanding Balance")
                {
                }
                field("Loans Outstanding Interest"; Rec."Loans Outstanding Interest")
                {
                }
                field("Member Deposit"; Rec."Member Deposit")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Activity Code';
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Branch Code';
                    Editable = false;
                }
                field(Remarks; Rec.Remarks)
                {
                    Editable = RemarksEdit;
                }
                field("Rejection Remarks"; Rec."Rejection Remarks")
                {
                    Editable = RejStatus;
                }
                field("Early Withdrawal"; Rec."Early Withdrawal")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Rejected) then
                            Error(DocMustbeOpen);

                        Rec.TestField("Reason for withdrawal");
                        Rec.TestField("Withdrawal Notice Date");
                        Rec.TestField("Notice Type");


                        // SavingsAccounts.RESET;
                        // SavingsAccounts.SETRANGE("Member No.","Member No.");
                        // SavingsAccounts.SETRANGE("Product Category",SavingsAccounts."Product Category"::"Deposit Contribution");
                        // IF SavingsAccounts.FIND('-') THEN BEGIN
                        //  LoanGuarantorsandSecurity.RESET;
                        //  LoanGuarantorsandSecurity.SETRANGE("Savings Account No./Member No.",SavingsAccounts."No.");
                        //  LoanGuarantorsandSecurity.SETRANGE(Substituted,FALSE);
                        //  LoanGuarantorsandSecurity.SETRANGE("Self Guarantee",FALSE);
                        //   IF LoanGuarantorsandSecurity.FIND('-') THEN BEGIN
                        //       REPEAT
                        //          IF Loans.GET(LoanGuarantorsandSecurity."Loan No") THEN BEGIN
                        //            IF Loans."Member No."<>"Member No." THEN BEGIN
                        //            Loans.CALCFIELDS("Outstanding Balance");
                        //           IF Loans."Outstanding Balance">0 THEN
                        //            ERROR(Err001,LoanGuarantorsandSecurity."Loan No");
                        //            END;
                        //            END;
                        //         UNTIL LoanGuarantorsandSecurity.NEXT=0;
                        //       END;
                        // END;

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);

                        if Members.Get(Rec."Member No.") then
                            Members."Dividend Action" := Members."Dividend Action"::" ";
                        Members.Modify;

                        //delete Remarks
                        Notice.Reset;
                        Notice.SetRange(Notice."Member No.", Rec."Member No.");
                        Notice.SetFilter(Notice.Status, '<>%1', Notice.Status::Rejected);
                        if Notice.Find('-') then begin
                            Notice.Remarks := '';
                            Notice.Modify;
                        end;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        if Rec.Status <> Rec.Status::Pending then
                            Error(DocMustbePending);

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Stop Advice")
                {
                    Image = StopPayment;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //Advice Stop

                        if Rec.Status = Rec.Status::Approved then begin
                            Loans.Reset;
                            Loans.SetRange("Member No.", Rec."Member No.");
                            Loans.SetRange("Recovery Mode", Loans."Recovery Mode"::Checkoff);
                            Loans.SetFilter("Outstanding Balance", '>0');
                            if Loans.Find('-') then begin
                                repeat
                                    LoansProcess.AdviceLoan(Loans."Loan No.", true);
                                until Loans.Next = 0;
                            end;

                            SavingsAccounts.Reset;
                            SavingsAccounts.SetRange(SavingsAccounts."Member No.", Rec."Member No.");
                            if SavingsAccounts.Find('-') then begin
                                repeat
                                    if SavingsAccounts."Product Category" = SavingsAccounts."Product Category"::"Deposit Contribution" then begin
                                        //PeriodicAcc.EmplyerSavingAdvice(SavingsAccounts, SavingsAccounts."Monthly Contribution", 0);
                                    end else
                                        if SavingsAccounts."Product Category" = SavingsAccounts."Product Category"::Benevolent then begin
                                            //PeriodicAcc.EmplyerSavingAdvice(SavingsAccounts, SavingsAccounts."Monthly Contribution", 0);
                                        end;
                                    if SavingsAccounts."Product Category" <> SavingsAccounts."Product Category"::"Share Capital" then begin
                                        if SavingsAccounts."Loan Disbursement Account" = false then begin
                                            SavingsAccounts.Status := SavingsAccounts.Status::Closed;
                                            SavingsAccounts.Blocked := SavingsAccounts.Blocked::All;
                                            ///  SavingsAccounts.MODIFY;
                                        end;
                                    end;
                                until SavingsAccounts.Next = 0;
                            end;
                        end else
                            Error('Apprication must be approved');
                    end;
                }
                action("Reset Notice Date")
                {
                    Image = ResetStatus;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        StatusChangePermissions: Record "Status Change Permissions.";
                    begin
                        StatusChangePermissions.Reset;
                        StatusChangePermissions.SetRange("User ID", UserId);
                        StatusChangePermissions.SetRange("Reset Notice Date", true);
                        if StatusChangePermissions.Find('-') then begin
                            Notice.Reset;
                            Notice.SetRange(Notice."No.", Rec."No.");
                            Notice.SetRange(Status, Notice.Status::Approved);
                            if Notice.Find('-') then begin
                                Rec."Withdrawal Notice Date" := (Today - 61);
                                Rec."Maturity Date" := Today - 1;
                                Rec."Early Withdrawal" := true;
                                Rec.Modify;
                            end;
                        end;
                    end;
                }
                action("Member Card")
                {
                    Image = CreditCard;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Member Single";
                    RunPageLink = "No." = FIELD("Member No.");
                }
                action("Reject Withdrawal Notice")
                {
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Rec."Notice Type" <> Rec."Notice Type"::"Withdrawal - Normal" then Error('One can only reject a notice when the notice type is a Normal Withdrawal');

                        DatePaid := 0D;
                        AmntRefunded := 0;
                        PaymentStatus := '';
                        Mclosure.Reset;
                        Mclosure.SetRange(Mclosure."Member No.", Rec."Member No.");
                        Mclosure.SetRange(Posted, true);
                        Mclosure.SetRange(Status, Mclosure.Status::Approved);
                        if Mclosure.Find('+') then begin
                            repeat
                                AmntRefunded := Mclosure."Deposit Refundable";
                                PaymentStatus := 'Paid'
                            until Mclosure.Next = 0;
                        end else
                            PaymentStatus := 'Pending';

                        if PaymentStatus <> 'Pending' then
                            Error('This notice cannot be rejected since the member has already been refunded')
                        else begin
                            if Rec."Rejection Remarks" = '' then Error('Kindly fill in the Rejection Reason');
                            if Confirm('Are you sure you want to reject the withdrawal notice?', false) = true then begin
                                Rec.Status := Rec.Status::Rejected;
                                Rec.Modify;
                                Message('Member Withdrawal Notice Successfully Rejected');
                            end;
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //IF (Status=Status::Approved) OR (Status=Status::Pending) THEN
        //CurrPage.EDITABLE:=FALSE;
        EditControls;
        SetControlAppearance;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        MemberwithdrawalNotice.Reset;
        MemberwithdrawalNotice.SetRange(Status, MemberwithdrawalNotice.Status::Open);
        MemberwithdrawalNotice.SetFilter("Notice Type", '%1|%2', MemberwithdrawalNotice."Notice Type"::"Withdrawal - Normal", MemberwithdrawalNotice."Notice Type"::" ");
        if MemberwithdrawalNotice.FindFirst then Error('Kindly make use the open cards');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        MemberwithdrawalNotice.Reset;
        MemberwithdrawalNotice.SetRange(Status, MemberwithdrawalNotice.Status::Open);
        MemberwithdrawalNotice.SetFilter("Notice Type", '%1|%2', MemberwithdrawalNotice."Notice Type"::"Withdrawal - Normal", MemberwithdrawalNotice."Notice Type"::" ");
        if MemberwithdrawalNotice.FindFirst then Error('Kindly make use the open cards');
    end;

    trigger OnOpenPage()
    begin
        //IF (Status=Status::Approved) OR (Status=Status::Pending) THEN
        //CurrPage.EDITABLE:=FALSE;
        EditControls;
    end;

    var
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        Loans: Record Loans;
        PeriodicAcc: Codeunit "Periodic Activities";
        LoansProcess: Codeunit "Loans Process";
        SavingsAccounts: Record "Savings Accounts";
        Notice: Record "Member withdrawal Notice";
        LoanGuarantorsandSecurity: Record "Loan Guarantors and Security";
        Err001: Label 'This member has guranteen loan No %1';
        DatePaid: Date;
        AmntRefunded: Decimal;
        PaymentStatus: Text;
        Mclosure: Record "Membership closure";
        RejStatus: Boolean;
        EditableStatus: Boolean;
        RemarksEdit: Boolean;
        NotTypeEdit: Boolean;
        ROWEdit: Boolean;
        MemNoEdit: Boolean;
        WithNotDate: Boolean;
        Members: Record Members;
        MemberwithdrawalNotice: Record "Member withdrawal Notice";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    local procedure EditControls()
    begin
        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) or (Rec.Status = Rec.Status::Rejected) then begin

            EditableStatus := false;
            RemarksEdit := false;
            if Rec.Status <> Rec.Status::Rejected then RejStatus := true else RejStatus := false;
            ROWEdit := false;
            NotTypeEdit := false;
            WithNotDate := false;
            MemNoEdit := false;
        end else begin
            EditableStatus := true;
            RemarksEdit := true;
            RejStatus := true;
            ROWEdit := true;
            NotTypeEdit := true;
            WithNotDate := true;
            MemNoEdit := true;
        end;
    end;
}

