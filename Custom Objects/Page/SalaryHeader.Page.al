page 52185808 "Salary Header"
{
    DeleteAllowed = false;
    Editable = true;
    PageType = Card;
    SourceTable = "Salary Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Editable = TransType;
                }
                field("Account Type"; Rec."Account Type")
                {
                    Editable = AccType;
                }
                field("Account No"; Rec."Account No")
                {
                    Editable = AccNo;
                }
                field("Document No"; Rec."Document No")
                {
                    Editable = DocNo;
                }
                field(Remarks; Rec.Remarks)
                {
                    Editable = Rmarks;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = Amnt;
                }
                field("Scheduled Amount"; Rec."Scheduled Amount")
                {
                }
                field("Total Count"; Rec."Total Count")
                {
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    Editable = EmployerC;
                }
                field("Last Loan Issue Date"; Rec."Last Loan Issue Date")
                {
                    Editable = LastloanDate;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Income Type"; Rec."Income Type")
                {
                    Editable = IncType;
                }
                field("Posting date"; Rec."Posting date")
                {
                    Editable = Pdate;
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Donnot Recover"; Rec."Donnot Recover")
                {
                    Editable = true;
                }
            }
            part(Control17; "Salary Lines")
            {
                SubPageLink = "Salary Header No." = FIELD(No);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Import Salaries")
            {
                Caption = 'Import Salaries';
                Image = Import;
                Promoted = true;
                ////RunObject = XMLport "Import Salaries";

                trigger OnAction()
                begin



                    /*
                    RcptBufLines.RESET;
                    RcptBufLines.SETRANGE(RcptBufLines."Receipt Header No",No);
                    IF RcptBufLines.FIND('-') THEN
                    RcptBufLines.DELETEALL;
                    */

                end;
            }
            group(Process)
            {
                Caption = 'Process';
                action(Print)
                {
                    Image = ConfirmAndPrint;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetFilter(No, Rec.No);
                        //REPORT.Run(52185686, true, true, Rec);
                    end;
                }
                action("Net Salary")
                {
                    Image = ReverseRegister;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField(Posted, true);
                        Rec.Reset;
                        Rec.SetFilter(No, Rec.No);
                        //REPORT.Run(52185910, true, true, Rec);
                    end;
                }
                action(Validate)
                {
                    Image = Translation;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        SalaryLines: Record "Salary Lines";
                        SavingsAccounts: Record "Savings Accounts";
                        StrMenuTxt: Label '&Staff No.,&Account No.,&ID No';
                        Selection: Integer;
                    begin
                        if Rec."Donnot Recover" = false then
                            Rec.TestField("Employer Code");

                        Selection := StrMenu(StrMenuTxt, 3);

                        if Selection = 0 then
                            exit;

                        if Selection = 1 then begin
                            SalaryLines.Reset;
                            SalaryLines.SetRange(SalaryLines."Salary Header No.", Rec.No);
                            if SalaryLines.Find('-') then begin
                                repeat
                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetFilter(SavingsAccounts."Employer Code", Rec."Employer Code");
                                    SavingsAccounts.SetRange(SavingsAccounts."Payroll/Staff No.", SalaryLines."Staff No.");
                                    SavingsAccounts.SetFilter(SavingsAccounts."Loan Disbursement Account", '%1', true);
                                    if SavingsAccounts.Find('-') then begin

                                        SalaryLines."Account Not Found" := false;
                                        SalaryLines.Modify;

                                        if SavingsAccounts."Payroll/Staff No." <> '' then begin
                                            SalaryLines."Account No." := SavingsAccounts."No.";
                                            if SavingsAccounts.Blocked <> SavingsAccounts.Blocked::" " then
                                                SalaryLines."Blocked Accounts" := true
                                            else
                                                SalaryLines."Blocked Accounts" := false;

                                            SalaryLines."ID No." := SavingsAccounts."ID No.";
                                            SalaryLines."Account No." := SavingsAccounts."No.";
                                            SalaryLines.Status := SavingsAccounts.Status;
                                            SalaryLines."Member No." := SavingsAccounts."Member No.";
                                            SalaryLines.Name := SavingsAccounts.Name;
                                            SalaryLines."Employer Code" := SavingsAccounts."Employer Code";
                                            SalaryLines."Global Dimension 1 Code" := SavingsAccounts."Global Dimension 1 Code";
                                            SalaryLines."Global Dimension 2 Code" := SavingsAccounts."Global Dimension 2 Code";
                                        end else
                                            SalaryLines."Account Not Found" := true;
                                        SalaryLines.Modify;
                                    end else
                                        SalaryLines."Account Not Found" := true;
                                    SalaryLines.Modify;
                                    SavingsAccounts."Salary Through FOSA" := true;
                                    SavingsAccounts.Modify;

                                until SalaryLines.Next = 0;
                            end;
                        end;

                        if Selection = 2 then begin
                            SalaryLines.Reset;
                            SalaryLines.SetRange(SalaryLines."Salary Header No.", Rec.No);
                            if SalaryLines.Find('-') then begin

                                repeat
                                    SavingsAccounts.Reset;
                                    if Rec."Donnot Recover" = false then
                                        SavingsAccounts.SetFilter(SavingsAccounts."Employer Code", Rec."Employer Code");
                                    SavingsAccounts.SetRange(SavingsAccounts."No.", SalaryLines."Account No.");
                                    SavingsAccounts.SetFilter(SavingsAccounts."Loan Disbursement Account", '%1', true);
                                    if SavingsAccounts.Find('-') then begin


                                        SalaryLines."Account Not Found" := false;
                                        SalaryLines.Modify;
                                        SavingsAccounts."Salary Through FOSA" := true;
                                        SavingsAccounts.Modify;

                                        if SavingsAccounts.Blocked <> SavingsAccounts.Blocked::" " then
                                            SalaryLines."Blocked Accounts" := true
                                        else
                                            SalaryLines."Blocked Accounts" := false;


                                        SalaryLines."ID No." := SavingsAccounts."ID No.";
                                        SalaryLines."Staff No." := SavingsAccounts."Payroll/Staff No.";
                                        SalaryLines.Status := SavingsAccounts.Status;
                                        SalaryLines."Employer Code" := SavingsAccounts."Employer Code";
                                        SalaryLines."Global Dimension 1 Code" := SavingsAccounts."Global Dimension 1 Code";
                                        SalaryLines."Global Dimension 2 Code" := SavingsAccounts."Global Dimension 2 Code";

                                    end else
                                        SalaryLines."Account Not Found" := true;
                                    SalaryLines.Modify;
                                until SalaryLines.Next = 0;
                            end;
                        end;

                        if Selection = 3 then begin
                            SalaryLines.Reset;
                            SalaryLines.SetRange(SalaryLines."Salary Header No.", Rec.No);
                            if SalaryLines.Find('-') then begin
                                repeat


                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetFilter(SavingsAccounts."Employer Code", Rec."Employer Code");
                                    SavingsAccounts.SetRange(SavingsAccounts."ID No.", SalaryLines."ID No.");
                                    SavingsAccounts.SetFilter(SavingsAccounts."Loan Disbursement Account", '%1', true);
                                    if SavingsAccounts.Find('-') then begin

                                        SalaryLines."Account Not Found" := false;
                                        SalaryLines.Modify;


                                        if SavingsAccounts."ID No." <> '' then begin

                                            if SavingsAccounts.Blocked <> SavingsAccounts.Blocked::" " then
                                                SalaryLines."Blocked Accounts" := true
                                            else
                                                SalaryLines."Blocked Accounts" := false;

                                            SalaryLines."Account No." := SavingsAccounts."No.";
                                            SalaryLines."Staff No." := SavingsAccounts."Payroll/Staff No.";
                                            SalaryLines.Status := SavingsAccounts.Status;
                                            SalaryLines."Employer Code" := SavingsAccounts."Employer Code";
                                            SalaryLines."Global Dimension 1 Code" := SavingsAccounts."Global Dimension 1 Code";
                                            SalaryLines."Global Dimension 2 Code" := SavingsAccounts."Global Dimension 2 Code";
                                        end else
                                            SalaryLines."Account Not Found" := true;
                                        SalaryLines.Modify;
                                    end else
                                        SalaryLines."Account Not Found" := true;
                                    SalaryLines.Modify;

                                    SavingsAccounts."Salary Through FOSA" := true;
                                    SavingsAccounts.Modify;

                                until SalaryLines.Next = 0;
                            end;
                        end;


                        Rec.Validated := true;
                        Rec.Modify;
                        Message('Salary Lines Validated sucessfully');
                    end;
                }
                action("Check for Mutiple Salaries")
                {
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    var
                        SalaryLines: Record "Salary Lines";
                    begin

                        SalaryLines.Reset;
                        SalaryLines.SetRange(SalaryLines."Salary Header No.", Rec.No);
                        //if SalaryLines.Find('-') then
                        //REPORT.Run(52185646, true, false, SalaryLines);
                    end;
                }
                action("Unblock Accounts")
                {
                }
            }
            group(Action22)
            {
                Caption = 'Post';
                action(Post)
                {
                    Image = Post;
                    Promoted = true;

                    trigger OnAction()
                    var
                    //SaccoT: Codeunit "Sacco Transactions";
                    begin
                        SalaryLines.Reset;
                        SalaryLines.SetRange(SalaryLines."Salary Header No.", Rec.No);
                        if SalaryLines.Find('-') then begin
                            repeat
                                if SalaryLines."Multiple Salary" = true then begin
                                    Error('Kinldy reconcile all the Multiple accounts for this employer before proceeding');
                                end;
                            until
                            SalaryLines.Next = 0;
                        end;




                        if Rec.Status <> Rec.Status::Approved then
                            Error('The salary batch has not been approved');
                        //here//SaccoT.PostSalary(Rec);
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

                        Rec.TestField("Transaction Type");
                        Rec.TestField("Document No");
                        Rec.TestField(Remarks);
                        Rec.TestField(Amount);
                        if Rec."Donnot Recover" = false then begin
                            Rec.TestField("Employer Code");
                            Rec.TestField("Last Loan Issue Date");
                        end;
                        Rec.TestField("Posting date");
                        Rec.TestField("Account No");
                        Rec.TestField("Account Name");

                        Rec.CalcFields("Scheduled Amount");

                        if Rec.Validated = false then
                            Error('Kinldy validate the salary batch before proceeding');

                        if Rec."Mutiple Salaries Checked" = false then
                            Error('Kindly check for multiple salaries before proceeding');

                        if Rec."Scheduled Amount" <> Rec.Amount then
                            Error('Scheduled amount and Amount must be the same');


                        SalaryLines.Reset;
                        SalaryLines.SetRange(SalaryLines."Salary Header No.", Rec.No);
                        if SalaryLines.Find('-') then begin
                            repeat
                                if SalaryLines."Account Not Found" = true then begin
                                    Error('Kinldy reconcile all the unfound accounts for this employer before proceeding');
                                end;
                            until
                            SalaryLines.Next = 0;
                        end;



                        SalaryLines.Reset;
                        SalaryLines.SetRange(SalaryLines."Salary Header No.", Rec.No);
                        if SalaryLines.Find('-') then begin
                            repeat
                                if SalaryLines."Multiple Salary" = true then begin
                                    Error('Kinldy reconcile all the Multiple accounts for this employer before proceeding');
                                end;
                            until
                            SalaryLines.Next = 0;
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

                        if Rec.Status <> Rec.Status::Pending then
                            Error(DocMustbePending);

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

        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        UpdateControl;

        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    trigger OnInit()
    begin
        UpdateControl;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin

        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        // CustomApprovals: Codeunit "Custom Approvals Codeunit";
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        TransType: Boolean;
        AccType: Boolean;
        AccNo: Boolean;
        DocNo: Boolean;
        Rmarks: Boolean;
        Amnt: Boolean;
        EmployerC: Boolean;
        IncType: Boolean;
        Pdate: Boolean;
        SalaryLines: Record "Salary Lines";
        LastloanDate: Boolean;

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
            AccNo := true;
            TransType := true;
            AccType := true;
            DocNo := true;
            Rmarks := true;
            Amnt := true;
            EmployerC := true;
            Pdate := true;
            IncType := true;
            LastloanDate := true;

        end;


        if Rec.Status = Rec.Status::Pending then begin
            AccNo := false;
            TransType := false;
            AccType := false;
            DocNo := false;
            Rmarks := false;
            Amnt := false;
            EmployerC := false;
            Pdate := false;
            IncType := false;
            LastloanDate := false;

        end;


        if Rec.Status = Rec.Status::Rejected then begin
            AccNo := false;
            TransType := false;
            AccType := false;
            DocNo := false;
            Rmarks := false;
            Amnt := false;
            EmployerC := false;
            Pdate := false;
            IncType := false;
            LastloanDate := false;
        end;

        if Rec.Status = Rec.Status::Approved then begin
            AccNo := false;
            TransType := false;
            AccType := false;
            DocNo := false;
            Rmarks := false;
            Amnt := false;
            EmployerC := false;
            Pdate := false;
            IncType := false;
            LastloanDate := false;

        end;
    end;
}

