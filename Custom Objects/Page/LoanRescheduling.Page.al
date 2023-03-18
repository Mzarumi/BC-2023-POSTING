page 52185849 "Loan Rescheduling"
{
    CardPageID = "Loan Rescheduling List";
    DeleteAllowed = false;
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = "Loan Rescheduling";

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
                field("Schedule Type"; Rec."Schedule Type")
                {

                    trigger OnValidate()
                    begin
                        if Rec."Schedule Type" = Rec."Schedule Type"::"Interest Change" then begin
                            InterestParams := true;
                            RescheduleParams := false;
                        end else
                            if Rec."Schedule Type" = Rec."Schedule Type"::Reschedule then begin
                                InterestParams := false;
                                RescheduleParams := true;
                            end;
                    end;
                }
                field("Rescheduling Date"; Rec."Rescheduling Date")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                }
                field("Outstanding Interest"; Rec."Outstanding Interest")
                {
                }
                field("Remaining Installments"; Rec."Remaining Installments")
                {
                }
                field("New Installments"; Rec."New Installments")
                {
                    Editable = RescheduleParams;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Interest Limits"; Rec."Interest Limits")
                {
                    Caption = 'Interest Limits %';
                }
                field("Current Interest Rate"; Rec."Current Interest Rate")
                {
                }
                field("New Interest Rate"; Rec."New Interest Rate")
                {
                    Editable = InterestParams;
                }
                field("Old Amortised"; Rec."Old Amortised")
                {
                }
                field("New Amortised"; Rec."New Amortised")
                {
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Original Installments"; Rec."Original Installments")
                {
                }
                field("Maximun Installments"; Rec."Maximun Installments")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Rescheduled; Rec.Rescheduled)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Reschedule Loan")
            {
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //IF "Rescheduled By"<>USERID THEN ERROR('This transaction can only be commited by the person who initiated it');
                    if Rec.Rescheduled then Error('This Loan Has already been rescheduled');
                    //IF Status<>Status::Approved THEN ERROR(Txt0000);

                    //here//PeriodicActivities.LoanReschedule(Rec);

                    Commit;

                    //Run the Generated Schedule
                    LoanSch.Reset;
                    LoanSch.SetRange(LoanSch."Loan No.", Rec."Loan No.");
                    //if LoanSch.Find('-') then 
                    //REPORT.Run(52185817, true, false, LoanSch);
                end;
            }
            action("Preview Schedule")
            {
                Image = ReceivableBill;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                var
                    LoanApp: Record Loans;
                begin
                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Loan No.", Rec."Loan No.");
                    //if LoanApp.Find('-') then 
                    //REPORT.Run(52185817, true, true, LoanApp);
                end;
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
                    PromotedCategory = Category4;
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
                        /*
                        Cust.GET("Member No.");
                        SendSMS.SendSms(SourceType::"Loan Reschedule" ,Cust."Phone No.",'Dear Member your loan reschedule request of KES: '+
                                        FORMAT("New Amortised") +' from KES: ' + FORMAT("Old Amortised") +' has been received.',"Member No.","Member No.",
                                        FALSE,No."); //*
                        
                        LoanGua.RESET;
                        LoanGua.SETRANGE(LoanGua."Loan No","Loan No.");
                        IF LoanGua.FIND('-') THEN BEGIN
                          REPEAT
                          Cust.GET(LoanGua."Member No");
                          IF Cust."Phone No." <>'' THEN
                          SendSMS.SendSms(SourceType::"Loan Reschedule Guar",Cust."Phone No.",'The Loan No.: ' + "Loan No." + ' you had guaranteed for ' + "Member Name"  + ' has been rescheduled from KES: ' + FORMAT("Old Amortised") + ', ' +
                                          ' to KES: ' +FORMAT("New Amortised"),Cust."No.",Cust."No.",FALSE,Cust."No.");
                          UNTIL LoanGua.NEXT=0;
                          END;
                          */

                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
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
                    PromotedCategory = Category4;
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
            action("Loan Payment Method")
            {
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Payment Methods Application";
                RunPageLink = "Loan No." = FIELD("Loan No.");
                Visible = false;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec."Schedule Type" = Rec."Schedule Type"::"Interest Change" then begin
            InterestParams := true;
            RescheduleParams := false;
        end else
            if Rec."Schedule Type" = Rec."Schedule Type"::Reschedule then begin
                InterestParams := false;
                RescheduleParams := true;
            end;
    end;

    trigger OnAfterGetRecord()
    begin
        if (Rec.Status = Rec.Status::Pending) or (Rec.Status = Rec.Status::Approved) then CurrPage.Editable := false;

        if Rec."Schedule Type" = Rec."Schedule Type"::"Interest Change" then begin
            InterestParams := true;
            RescheduleParams := false;
        end else
            if Rec."Schedule Type" = Rec."Schedule Type"::Reschedule then begin
                InterestParams := false;
                RescheduleParams := true;
            end;

        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Schedule Type" := Rec."Schedule Type"::Reschedule;
    end;

    trigger OnOpenPage()
    begin
        if (Rec.Status = Rec.Status::Pending) or (Rec.Status = Rec.Status::Approved) then CurrPage.Editable := false;

        if Rec."Schedule Type" = Rec."Schedule Type"::"Interest Change" then begin
            InterestParams := true;
            RescheduleParams := false;
        end else
            if Rec."Schedule Type" = Rec."Schedule Type"::Reschedule then begin
                InterestParams := false;
                RescheduleParams := true;
            end;
    end;

    var
        Txt0000: Label 'Status must be approved before rescheduling';
        PeriodicActivities: Codeunit "Periodic Activities";
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        LoanSch: Record Loans;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book",Birthday,"Defaulter - Notice 1","Defaulter - Notice 2","Defaulter - Notice 3",Statement,"Loan Cleared I","Loan Cleared II","Loan Reschedule","Loan Reschedule Guar";
        Cust: Record Members;
        SendSMS: Codeunit SendSms;
        LoanGua: Record "Loan Guarantors and Security";
        InterestParams: Boolean;
        RescheduleParams: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

