page 52185855 "Guarantor Substitution"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Guarantors Substitution";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Loan Account No."; Rec."Loan Account No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Account Status"; Rec."Account Status")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Current Savings"; Rec."Current Savings")
                {
                }
                field("FOSA Account"; Rec."FOSA Account")
                {
                }
                field("Business Loan No."; Rec."Business Loan No.")
                {
                }
                field("Business Loan Shares"; Rec."Business Loan Shares")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field("Responsibility Centre"; Rec."Responsibility Centre")
                {
                }
                field("Activity Code"; Rec."Activity Code")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
            }
            part("Loan Guarantors Substitution"; "Loan Guarantors List")
            {
                Caption = 'Loan Guarantors Substitution';
                Editable = LinesEdit;
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action1000000021)
            {
                action("Update Changes")
                {
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        if Rec.Status <> Rec.Status::Approved then
                            Error(DocMustbeApproved);
                        if Rec.Posted = true then
                            Error(Err);

                        Lguarant.Reset;
                        Lguarant.SetRange(Lguarant."No.", Rec."No.");
                        Lguarant.SetRange(Lguarant."Loan No", Rec."Loan No.");
                        //Lguarant.SETRANGE("Savings Account No.",'020006851');
                        if Lguarant.Find('-') then begin
                            repeat

                                Lguarantx.Reset;
                                Lguarantx.SetRange(Lguarantx."Loan No", Lguarant."Loan No");
                                //Lguarantx.SETRANGE(Lguarantx."Member No",Lguarant."Member No");
                                Lguarantx.SetRange(Lguarantx."Savings Account No./Member No.", Lguarant."Savings Account No.");
                                if Lguarantx.Find('-') then begin
                                    //REPEAT
                                    Lguarantx.Substituted := Lguarant.Substituted;
                                    Lguarantx.Modify;
                                    //UNTIL Lguarantx.NEXT=0;
                                end;

                                Lguarantors.Reset;
                                Lguarantors.SetRange(Lguarantors."Loan No", Lguarant."Loan No");
                                Lguarantors.SetRange(Lguarantors."Savings Account No./Member No.", Lguarant."Savings Account No.");
                                if not Lguarantors.Find('-') then begin
                                    Lguarantors.Init;
                                    Lguarantors."Loan No" := Lguarant."Loan No";
                                    Lguarantors."Staff/Payroll No." := Lguarant."Staff/Payroll No.";
                                    Lguarantors."Member No" := Lguarant."Member No";
                                    Lguarantors."Savings Account No./Member No." := Lguarant."Savings Account No.";
                                    Lguarantors.Name := Lguarant.Name;
                                    Lguarantors."Amount Guaranteed" := Lguarant."Amount Guaranteed";
                                    Lguarantors."Loan Balance" := Lguarant."Loan Balance";
                                    Lguarantors."Deposits/Shares" := Lguarant.Shares;
                                    Lguarantors."Account No." := Lguarant."Member No";
                                    Lguarantors."ID No." := Lguarant."ID No.";
                                    Lguarantors."Member Guaranteed" := Lguarant."Member Guaranteed";
                                    Lguarantors."Member Substituted" := Lguarant."Member Substituted";
                                    Lguarantors."Loanee Name" := Rec.Name;

                                    //^^SMS
                                    if Members.Get(Lguarant."Member No") then begin
                                        if Loan.Get(Loan."Loan No.") then
                                            Loan.CalcFields("Outstanding Balance");
                                        CompInfo.Get;
                                        SendSMS.SendSms(SourceType::"Loan Guarantors", Members."Mobile Phone No", 'Dear Member, You have guaranteed  ' + Rec.Name + ' ' + Loan."Loan Product Type Name" + ' Loan of ' + Format(Loan."Outstanding Balance") +
                                       '. If in dispute call' + ' ' + CompInfo."Phone No.", Loan."Loan No.", Loan."Disbursement Account No", false);

                                    end;
                                    //SMS
                                    Lguarantors."SMS Sent" := true;
                                    ;

                                    Lguarantors.Insert;
                                end;

                            until Lguarant.Next = 0;
                        end;
                        Rec."Posted By" := UserId;
                        Rec.Posted := true;

                        Rec.Modify();
                        Message('Changes successfully updated');
                    end;
                }
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

                        if Rec.Status <> Rec.Status::Open then
                            Error(DocMustbeOpen);


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
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if (Rec.Status = Rec.Status::Pending) or (Rec.Status = Rec.Status::Approved) then
            CurrPage.Editable := false;
        SetControlAppearance;
        LInesEditable;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        LInesEditable;
    end;

    trigger OnOpenPage()
    begin
        LInesEditable;
    end;

    var
        Lguarant: Record "Loan Guarantors Sub";
        Lguarantx: Record "Loan Guarantors and Security";
        Lguarantors: Record "Loan Guarantors and Security";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        DocMustbeApproved: Label 'This document must be approved before updating';
        Err: Label 'Changes have been Done';
        LinesEdit: Boolean;
        Members: Record Members;
        CompInfo: Record "Company Information";
        SendSMS: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        Loan: Record Loans;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);

        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) then
            LinesEdit := false
        else
            LinesEdit := true;
    end;

    //[Scope('Internal')]
    procedure LInesEditable()
    begin
        if (Rec.Status = Rec.Status::Pending) or (Rec.Status = Rec.Status::Approved) then begin
            CurrPage.Editable := false;
            LinesEdit := false;
        end;

        if Rec.Status = Rec.Status::Open then
            LinesEdit := true;
    end;
}

