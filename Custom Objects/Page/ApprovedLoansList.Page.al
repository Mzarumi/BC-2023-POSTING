page 52185507 "Approved Loans List"
{
    CardPageID = "Loan Application Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Loans;
    SourceTableView = WHERE(Posted = CONST(false),
                            "Picked Mobile Loan" = FILTER(false),
                            "Sent Online" = FILTER(false),
                            Status = FILTER(Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Staff No"; Rec."Staff No")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                }
                field(Interest; Rec.Interest)
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Approval Date"; Rec."Approval Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Loan Rejection Reason"; Rec."Loan Rejection Reason")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                Image = Post;

                trigger OnAction()
                begin
                    Rec.TestField(Posted, false);

                    Rec.TestField(Status, Rec.Status::Approved);

                    //Posting.PostLoanNormal();

                    Posting.PostLoanNormal(Rec."Loan No.");
                    //Send SMS when Topup

                    LoansTopUp.Reset;
                    LoansTopUp.SetRange(LoansTopUp."Loan No.", Rec."Loan No.");
                    if LoansTopUp.FindFirst then begin
                        repeat
                            LoanGuar.Reset;
                            LoanGuar.SetRange("Loan No", LoansTopUp."Loan Top Up");
                            LoanGuar.SetRange("Self Guarantee", false);
                            if LoanGuar.FindFirst then begin
                                if Loans2.Get(LoanGuar."Loan No") then begin
                                    ProductType := Loans2."Loan Product Type Name";
                                    AppAmount := Loans2."Approved Amount";
                                end;
                                repeat
                                    if Members.Get(LoanGuar."Member No") then
                                        CompInfo.Get;
                                    SendSms.SendSms(SourceType::"Loan Guarantors", Members."Mobile Phone No",
                                    'Dear ' + LoanGuar.Name + ', The ' + ProductType + ' of Ksh. ' + Format(AppAmount) + ', you had guaranteed ' + LoanGuar."Loanee Name" + ' is now fully repaid.',
                                    Loans2."Loan No.", Loans2."Disbursement Account No", false);

                                until LoanGuar.Next = 0;
                            end;
                        until LoansTopUp.Next = 0;
                    end;



                    //Set FOSA Savings Account to Frozen

                    LoanGuar.Reset;
                    LoanGuar.SetRange(LoanGuar."Loan No", Rec."Loan No.");
                    LoanGuar.SetFilter("Guarantor Type", '%1', LoanGuar."Guarantor Type"::Collateral);
                    if LoanGuar.FindFirst then
                        SavingsAccounts.Reset;
                    SavingsAccounts.SetRange("Member No.", LoanGuar."Savings Account No./Member No.");
                    SavingsAccounts.SetRange("Loan Disbursement Account", true);
                    if SavingsAccounts.FindFirst then begin
                        SavingsAccounts.Status := SavingsAccounts.Status::Frozen;
                        SavingsAccounts."Status Change Reason" := 'FROZEN: Refer to Investment Manager';
                        SavingsAccounts.Modify;
                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if (Rec.Status = Rec.Status::Open) and (Rec."Application Date" <> 0D) then begin

            if CalcDate('60D', Rec."Application Date") >= Today then
                Rec.Status := Rec.Status::Rejected;
            Rec.Modify;
        end;
        Rec.FilterGroup(2);
        Rec.SetFilter("Application Date", '%1..%2', CalcDate('-3M', Today), Today);
        Rec.FilterGroup(0);
    end;

    var
        LoansR: Record Loans;
        Posting: Codeunit "Loans Process";
        Batches: Record "Loan Disbursement Header";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        GetScore: Codeunit "DCS Integration Base";
        EntryNo: Integer;
        Loans: Record Loans;
        DisbLines: Record "Loan Disbursement Lines";
        PartDisb: Record "Partial Disbursement Schedule";
        LoanApp: Record Loans;
        SubseqDisb: Boolean;
        ApprovedEdit: Boolean;
        UserSetup: Record "User Setup";
        LoansTopUp: Record "Loans Top up";
        DSLines: Record "Loan Disbursement Lines";
        LoanGuar: Record "Loan Guarantors and Security";
        Members: Record Members;
        SendSms: Codeunit SendSms;
        CompInfo: Record "Company Information";
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        Loans2: Record Loans;
        ProductType: Text;
        AppAmount: Decimal;
        Message: Text;
        SavingsAccounts: Record "Savings Accounts";
}

