page 52185810 "Cheque Application"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Cheque Book Application";

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
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Editable = TransType;
                }
                field("Account No."; Rec."Account No.")
                {
                    Editable = accNo;
                }
                field("Member No."; Rec."Member No.")
                {
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field("ID No."; Rec."ID No.")
                {
                    Editable = false;
                }
                field("Cheque Book Type"; Rec."Cheque Book Type")
                {
                    Editable = chbktype;
                }
                field("Begining Cheque No."; Rec."Begining Cheque No.")
                {
                    Editable = beginCh;
                }
                field("End Cheque No."; Rec."End Cheque No.")
                {
                    Editable = endCh;
                }
                field("Responsibility Centre"; Rec."Responsibility Centre")
                {
                    Editable = false;
                }
                field("Last check"; Rec."Last check")
                {
                    Editable = false;
                }
                field("Application Date"; Rec."Application Date")
                {
                    Editable = false;
                }
                field("Cheque Account No."; Rec."Cheque Account No.")
                {
                    Editable = false;
                }
                field("Translation Code"; Rec."Translation Code")
                {
                    Editable = false;
                }
                field("Cheque Register Generated"; Rec."Cheque Register Generated")
                {
                    Editable = false;
                }
                field("Cheque Book charges Posted"; Rec."Cheque Book charges Posted")
                {
                    Editable = false;
                }
                field("Application Exported"; Rec."Application Exported")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Issue/Generate Cheque Register")
            {
                Image = Interaction;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    if Rec.Status <> Rec.Status::Approved then
                        Error('The document must be fully approved');

                    if Rec."Application Exported" <> true then
                        Error('You cannot generate the cheque book before the application is exported');

                    if Rec."Cheque Register Generated" then
                        Error('Cheque generation already done');
                    Rec.TestField("Begining Cheque No.");
                    Rec.TestField("End Cheque No.");
                    IncrNo := Rec."Begining Cheque No.";

                    if Rec."End Cheque No." < Rec."Begining Cheque No." then
                        Error('Beginning number is more than ending number');


                    while IncrNo <= Rec."End Cheque No." do begin
                        CheqReg.Init;
                        CheqReg."Account No." := Rec."Cheque Account No.";
                        CheqReg."Cheque No." := IncrNo;
                        CheqReg."Application No." := Rec."No.";
                        CheqReg.Insert;

                        IncrNo := IncStr(IncrNo);
                    end;
                    Rec."Cheque Register Generated" := true;
                    Rec.Modify;

                    // if Vend.Get("Account No.") then begin
                    //     MobNo := Vend."Transactional Mobile No";
                    // end;


                    // SendSMS.SendSms(SourceType::"Chq Book", MobNo, Text0001 + Format(Today) + ' ' + Format(Time)
                    // + ' ' + CompanyName, "No.", "No.", false);

                    Message('Register generated successfully');
                end;
            }
            action("Cheque Register")
            {
                Image = GetLines;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Cheque Register List";
                RunPageLink = "Application No." = FIELD("No.");
            }
            action("Post Cheque Book Charges")
            {
                Image = Post;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Do you want post the charges', false) = true then begin


                        if Rec.Status = Rec.Status::"Pending Approval" then
                            Error('The transaction must be fully approved before proceeding');

                        //here//SaccoT.PostBankChequeCharges(Rec);

                    end;
                end;
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
                        if Rec.Status <> Rec.Status::Open then
                            Error(DocMustbeOpen);


                        Rec.TestField("Account No.");
                        Rec.TestField("Cheque Book Type");
                        //Rec.TestField("Begining Cheque No.");
                        //Rec.TestField("End Cheque No.");
                        Rec.TestField("Transaction Type");


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
                        if Rec.Status <> Rec.Status::"Pending Approval" then
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

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        UpdateControl;
    end;

    trigger OnInit()
    begin
        UpdateControl;
    end;

    var
        CheqReg: Record "Cheques Register";
        IncrNo: Code[10];
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        Vend: Record "Savings Accounts";
        AccountTypeS: Record "Product Factory";
        AvailableBal: Decimal;
        Charges: Record "Transaction Charges";
        GenSetup: Record "General Set-Up";
        ChequeSetUp: Record "Cheque Set Up";
        "TOTAL CHARGES": Decimal;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        chbktype: Boolean;
        beginCh: Boolean;
        endCh: Boolean;
        accNo: Boolean;
        SaccoT: Codeunit "Sacco Transactions";
        TransType: Boolean;
        SendSMS: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book";
        Text0001: Label 'Your cheque book is ready for collection ';

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    //[Scope('Internal')]
    procedure UpdateControl()
    begin

        if Rec.Status = Rec.Status::Open then begin
            accNo := true;
            endCh := false;
            beginCh := false;
            chbktype := true;
            TransType := true;
        end;



        if Rec.Status = Rec.Status::"Pending Approval" then begin
            accNo := false;
            endCh := false;
            beginCh := false;
            chbktype := false;
            TransType := false;
        end;


        if Rec.Status = Rec.Status::Rejected then begin
            accNo := false;
            endCh := false;
            beginCh := false;
            chbktype := false;
            TransType := false;

        end;

        if Rec.Status = Rec.Status::Approved then begin
            accNo := false;
            endCh := true;
            beginCh := true;
            chbktype := false;
            TransType := false;

        end;


        if Rec."Cheque Register Generated" = true then begin
            accNo := false;
            endCh := false;
            beginCh := false;
            chbktype := false;
            TransType := false;

        end;
    end;
}

