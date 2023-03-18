page 52186303 "Posted Payment Voucher Board"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Payments Header Board";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transaction No."; Rec."Transaction No.")
                {
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                }
                field("Bank No."; Rec."Bank No.")
                {
                }
                field("Allocated Amount"; Rec."Allocated Amount")
                {
                }
                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    Editable = false;
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    Editable = false;
                }
                field("File Location"; Rec."File Location")
                {
                    Visible = false;
                }
                field(Remarks; Rec.Remarks)
                {
                }
            }
            part(Control1000000013; "Payment Sub Form Board")
            {
                SubPageLink = "Document No" = FIELD("Transaction No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print/Preview")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin

                    Rec.Reset;
                    Rec.SetFilter("Transaction No.", Rec."Transaction No.");
                    //REPORT.Run(52185723, true, true, Rec);
                    Rec.Reset;
                end;
            }
            group(Navigate)
            {
                Caption = 'Navigate';
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*
                        DocumentType := DocumentType::"Payment Voucher";
                        ApprovalEntries.Setfilters(DATABASE::"Payments Header","Document Type","No.");
                        ApprovalEntries.RUN;
                        */
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId)

                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.Posted = true then begin
            CurrPage.Editable := false;
        end;
    end;

    var
        Approval: Record "Signatory Application";
        ApprovalUsers: Record "Next of KIN";
        DActivity: Code[10];
        dbranch: Code[10];
        UsersID: Record User;
        TillNo: Code[20];
        TellerTill: Record "Bank Account";
        CurrentTellerAmount: Decimal;
        GenJournalLine: Record "Gen. Journal Line";
        BOSAPAY: Record "Payment Line Board";
        BosaPaymentH: Record "Payments Header Board";
        Payee: Decimal;
        TariffCodes: Record "Tariff Code s";
        ReceiptsandPaymentTypes: Record "Receipts and Payment Types";
        UserSetup: Record "User Setup";
        CashOfficeUserTemplate: Record "Cash Office User Template";
        "NOT OpenApprovalEntriesExist": Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        [InDataSet]
        StatusEditableApproved: Boolean;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        Commitments: Record Committment;
        CheckBudgetAvail: Codeunit "Budgetary Control";
        PayLine: Record "Payment Line Board";

    //[Scope('Internal')]
    procedure LinesExists(): Boolean
    var
        PayLines: Record "Payment Line Board";
    begin
        HasLines := false;
        PayLines.Reset;
        PayLines.SetRange(PayLines."Document No", Rec."Transaction No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;

    //[Scope('Internal')]
    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "Payment Line Board";
    begin
        AllKeyFieldsEntered := true;
        PayLines.Reset;
        PayLines.SetRange(PayLines."Document No", Rec."Transaction No.");
        if PayLines.Find('-') then begin
            repeat
                if (PayLines."G/L Account No." = '') or (PayLines.Amount <= 0) then
                    AllKeyFieldsEntered := false;
            until PayLines.Next = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;

    //[Scope('Internal')]
    procedure LinesCommitmentStatus() Exists: Boolean
    var
        BCSetup: Record "Budgetary Control Setup";
    begin
        if BCSetup.Get() then begin
            if not BCSetup.Mandatory then begin
                Exists := false;
                exit;
            end;
        end else begin
            Exists := false;
            exit;
        end;
        Exists := false;
        PayLine.Reset;
        PayLine.SetRange(PayLine."Document No", Rec."Transaction No.");
        PayLine.SetRange(PayLine.Committed, false);
        PayLine.SetRange(PayLine."Budgetary Control A/C", true);
        if PayLine.Find('-') then
            Exists := true;
    end;
}

