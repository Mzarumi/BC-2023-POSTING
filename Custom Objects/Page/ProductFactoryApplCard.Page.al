page 52186407 "Product Factory Appl. Card"
{
    PageType = Card;
    SourceTable = "Product Factory Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = DocumentEdit;
                field("No."; Rec."No.")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("Product ID"; Rec."Product ID")
                {
                }
                field("Product Description"; Rec."Product Description")
                {
                }
                field("Product Class Type"; Rec."Product Class Type")
                {

                    trigger OnValidate()
                    begin
                        DocumentControl;
                    end;
                }
                field("Min. Customer Age"; Rec."Min. Customer Age")
                {
                }
                field("Max.Customer Age"; Rec."Max.Customer Age")
                {
                }
                field("Interest Rate (Min.)"; Rec."Interest Rate (Min.)")
                {
                }
                field("Interest Rate (Max.)"; Rec."Interest Rate (Max.)")
                {
                    Editable = InterestEdit;
                }
                field("Dormancy Period"; Rec."Dormancy Period")
                {
                }
                field("Customer Segment"; Rec."Customer Segment")
                {
                    Visible = false;
                }
                field("Account No. Prefix"; Rec."Account No. Prefix")
                {
                }
                field("Account No. Suffix"; Rec."Account No. Suffix")
                {
                }
                field("Statement Charge"; Rec."Statement Charge")
                {
                }
                field("Closure Fee"; Rec."Closure Fee")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Member Category"; Rec."Member Category")
                {
                    Caption = 'Applicable To member category';
                }
            }
            group(Financials)
            {
                Editable = DocumentEdit;
                Visible = FinancialsVisible;
                field(Currency; Rec.Currency)
                {
                }
                field("Product Posting Group"; Rec."Product Posting Group")
                {
                }
                field("Loan  Account [G/L]"; Rec."Loan  Account [G/L]")
                {
                }
                field("Loan Interest Account [G/L]"; Rec."Loan Interest Account [G/L]")
                {
                }
                field("Loan Receivable Account[G/L]"; Rec."Loan Receivable Account[G/L]")
                {
                }
                field("Bill Account"; Rec."Bill Account")
                {
                }
                field("Billed Account"; Rec."Billed Account")
                {
                }
                field("Penalty Paid Account"; Rec."Penalty Paid Account")
                {
                }
            }
            group("Savings Product")
            {
                Editable = DocumentEdit;
                Visible = SavingsProductVisible;
                field("Loan Disbursement Account"; Rec."Loan Disbursement Account")
                {
                }
                field("Product Category"; Rec."Product Category")
                {
                }
                field("Auto Open Account"; Rec."Auto Open Account")
                {
                }
                field("Loan Security Inclination"; Rec."Loan Security Inclination")
                {
                }
                field("Allow Multiple Accounts"; Rec."Allow Multiple Accounts")
                {
                }
                field("Minimum Contribution"; Rec."Minimum Contribution")
                {
                }
                field("Minimum Balance"; Rec."Minimum Balance")
                {
                }
                field(Notice; Rec.Notice)
                {
                }
                field("Withdrawal Interval"; Rec."Withdrawal Interval")
                {
                }
                field("Maximum No. of Withdrawal"; Rec."Maximum No. of Withdrawal")
                {
                }
                field("Earns Interest"; Rec."Earns Interest")
                {
                }
                field("Interest Calc Min Balance"; Rec."Interest Calc Min Balance")
                {
                }
                field("Interest Expense Account"; Rec."Interest Expense Account")
                {
                }
                field("Interest Payable Account"; Rec."Interest Payable Account")
                {
                }
                field("Suspend Interest Account [G/L]"; Rec."Suspend Interest Account [G/L]")
                {
                }
                field("Dividend Calc. Method"; Rec."Dividend Calc. Method")
                {
                }
                field("Withholding Tax Account"; Rec."Withholding Tax Account")
                {
                }
                field("WithHolding Tax"; Rec."WithHolding Tax")
                {
                }
                field("Allow Over Draft"; Rec."Allow Over Draft")
                {
                }
                field("Credit Limit(Overdraft)"; Rec."Credit Limit(Overdraft)")
                {
                }
                field("Automatic Overdraft"; Rec."Automatic Overdraft")
                {
                }
                field("Over Draft Interest %"; Rec."Over Draft Interest %")
                {
                }
                field("Over Draft Interest Account"; Rec."Over Draft Interest Account")
                {
                }
                field("Allow Multiple Over Draft"; Rec."Allow Multiple Over Draft")
                {
                }
            }
            group("Credit Product")
            {
                Editable = DocumentEdit;
                Visible = CreditProductVisible;
                field("Maximum Guarantors"; Rec."Maximum Guarantors")
                {
                }
                field("Minimum Guarantors"; Rec."Minimum Guarantors")
                {
                }
                field("Interest Calculation Method"; Rec."Interest Calculation Method")
                {
                }
                field("Min. Re-application Period"; Rec."Min. Re-application Period")
                {
                }
                field("Minimum Loan Amount"; Rec."Minimum Loan Amount")
                {
                }
                field("Maximum Loan Amount"; Rec."Maximum Loan Amount")
                {
                }
                field("Prefferential Default installm"; Rec."Prefferential Default installm")
                {
                }
                field("Ordinary Default Intallments"; Rec."Ordinary Default Intallments")
                {
                }
                field("Repay Mode"; Rec."Repay Mode")
                {
                }
                field("Use Cycle"; Rec."Use Cycle")
                {
                }
                field("Grace Period - Interest"; Rec."Grace Period - Interest")
                {
                }
                field("Grace Period - Principle"; Rec."Grace Period - Principle")
                {
                }
                field("Installment Repayment Interval"; Rec."Installment Repayment Interval")
                {
                }
                field("Compute Interest Due on Postin"; Rec."Compute Interest Due on Postin")
                {
                }
                field("Fixed Loan Term"; Rec."Fixed Loan Term")
                {
                }
                field("Ordinary Share Multiplier"; Rec."Ordinary Share Multiplier")
                {
                }
                field("Preferential Share Multiplier"; Rec."Preferential Share Multiplier")
                {
                }
                field("Repayment Frequency"; Rec."Repayment Frequency")
                {
                }
                field("Loan Span"; Rec."Loan Span")
                {
                }
                field("Recovery Priority"; Rec."Recovery Priority")
                {
                }
                field("Search Code"; Rec."Search Code")
                {
                }
                field("Nature of Loan Type"; Rec."Nature of Loan Type")
                {
                }
                field("Type of Discounting"; Rec."Type of Discounting")
                {
                }
                field("Discounting %"; Rec."Discounting %")
                {
                }
                field("Computation %"; Rec."Computation %")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control81; Notes)
            {
            }
            systempart(Control82; MyNotes)
            {
            }
            systempart(Control83; Links)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(Action96)
            {
                action("Product Charges")
                {
                    Image = SetupPayment;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Loan Product Charge Appl.";
                    RunPageLink = "Document No." = FIELD("No.");
                }
                action("Appraisal Parameters")
                {
                    Image = Evaluate;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "DCS Parameter Matrix Appl.";
                    RunPageLink = "Document No." = FIELD("No.");
                }
                action("Related Product")
                {
                    Image = Relatives;
                    Promoted = true;
                    RunObject = Page "Related Product Appl. List";
                    RunPageLink = "Document No." = FIELD("No.");
                }
            }
        }
        area(navigation)
        {
            action("Product Application Document")
            {
                Image = Documents;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Product Application Document";
                RunPageLink = "Document No." = FIELD("No.");
            }
        }
        area(processing)
        {
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
                        Rec.TestField(Status, Rec.Status::Pending);
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
                        Rec.TestField(Status, Rec.Status::Pending);
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
                        Rec.TestField(Status, Rec.Status::Pending);
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
                        JuniorError: Label 'You must specify either %1 %2 for %3';
                        IDJunior: Code[20];
                        ProductDocuments: Record "Product Application Documents";
                        RelatedProduct: Record "Related Product Application";
                        DCSParameter: Record "DCS Parameter Matrix Appl.";
                        DCSMatrixTxt: Label 'Ensure Appraisal parameters are defines for this product.';
                    begin
                        Rec.TestField(Status, Rec.Status::Open);

                        Rec.TestField("Product ID");
                        Rec.TestField("Product Description");
                        Rec.TestField("Account No. Prefix");
                        Rec.TestField("Product Posting Group");

                        case Rec."Product Class Type" of
                            Rec."Product Class Type"::Savings:
                                begin
                                    Rec.TestField("Interest Rate (Min.)");
                                end;

                            Rec."Product Class Type"::Loan:
                                begin
                                    Rec.TestField("Interest Rate (Min.)");
                                    Rec.TestField("Loan  Account [G/L]");
                                    Rec.TestField("Loan Interest Account [G/L]");
                                    Rec.TestField("Loan Receivable Account[G/L]");
                                    Rec.TestField("Bill Account");

                                    DCSParameter.Reset;
                                    DCSParameter.SetRange(DCSParameter."Document No.", Rec."No.");
                                    if not DCSParameter.FindFirst then begin
                                        Error(DCSMatrixTxt);
                                    end;
                                    /*Rec.TestField(); TESTFIELD(); TESTFIELD(); TESTFIELD(); TESTFIELD(); Rec.TESTFIELD();*/
                                end;
                        end;

                        VarVariant := Rec;
                        //if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        //CustomApprovals.OnSendDocForApproval(VarVariant);

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
                        Rec.TestField(Status, Rec.Status::Pending);
                        VarVariant := Rec;
                        //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;

        DocumentControl;
    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        //CustomApprovals: Codeunit "Custom Approvals Codeunit";
        FinancialsVisible: Boolean;
        SavingsProductVisible: Boolean;
        CreditProductVisible: Boolean;
        DocumentEdit: Boolean;
        InterestEdit: Boolean;

    //[Scope('Internal')]
    procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    //[Scope('Internal')]
    procedure DocumentControl()
    begin
        FinancialsVisible := true;

        if Rec."Product Class Type" = Rec."Product Class Type"::" " then begin
            FinancialsVisible := false;
            SavingsProductVisible := false;
            CreditProductVisible := false;
        end;

        if Rec."Product Class Type" = Rec."Product Class Type"::Loan then begin
            InterestEdit := true;
            CreditProductVisible := true;
        end else begin
            InterestEdit := false;
            CreditProductVisible := false;
        end;

        if Rec."Product Class Type" = Rec."Product Class Type"::Savings then
            SavingsProductVisible := true
        else
            SavingsProductVisible := false;

        case Rec.Status of
            Rec.Status::Open:
                begin
                    DocumentEdit := true;
                end;
            Rec.Status::Pending, Rec.Status::Approved, Rec.Status::Rejected, Rec.Status::Converted:
                begin
                    DocumentEdit := false;
                end;
        end;
    end;
}

