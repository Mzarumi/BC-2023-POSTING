page 52185994 "Posted Cash Payment Header"
{
    Caption = 'Petty Cash Payments';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Payments Header";
    SourceTableView = WHERE("Payment Type" = CONST("Petty Cash"),
                            Posted = CONST(true));

    layout
    {
        area(content)
        {
            group(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field(Date; Rec.Date)
                {
                    Editable = DateEditable;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = GlobalDimension1CodeEditable;
                }
                field("Function Name"; Rec."Function Name")
                {
                    Caption = 'Description';
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = ShortcutDimension2CodeEditable;
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    Caption = 'Description';
                    Editable = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    Editable = ShortcutDimension3CodeEditable;
                }
                field(Dim3; Rec.Dim3)
                {
                    Caption = 'Description';
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Editable = "Currency CodeEditable";
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    Editable = false;
                }
                field(Payee; Rec.Payee)
                {
                    Caption = 'Payment to';
                    Editable = PayeeEditable;
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    Editable = "Payment NarrationEditable";
                }
                field(Cashier; Rec.Cashier)
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Total Payment Amount"; Rec."Total Payment Amount")
                {
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                }
                field("""Total Payment Amount"" - (""Total Witholding Tax Amount""+""Total VAT Amount""+""Total Retention Amount"")"; Rec."Total Payment Amount" - (Rec."Total Witholding Tax Amount" + Rec."Total VAT Amount" + Rec."Total Retention Amount"))
                {
                    Caption = 'Total Net Amount';
                }
                field("Total Payment Amount LCY"; Rec."Total Payment Amount LCY")
                {
                    Caption = 'Total Net Amount LCY';
                    Editable = false;
                }
                field("Payment Release Date"; Rec."Payment Release Date")
                {
                    Editable = "Payment Release DateEditable";
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    Editable = false;
                }
            }
            part(PVLines; "Cash Payment Lines")
            {
                Editable = PVLinesEditable;
                SubPageLink = No = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Print/Preview")
                {
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetFilter("No.", Rec."No.");
                        //REPORT.Run(52185782, true, true, Rec);
                        Rec.Reset;
                    end;
                }
                separator(Action1102756004)
                {
                }
                action("Cancel Document")
                {
                    Caption = 'Cancel Document';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        Text000: Label 'Are you sure you want to cancel this document?';
                        Text001: Label 'You have Selected not to cancle this document';
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);
                        if Confirm(Text000, true) then begin
                            //Post Reversal Entries for Commitments
                            Doc_Type := Doc_Type::PettyCash;
                            CheckBudgetAvail.ReverseEntries(Doc_Type, Rec."No.");
                            Rec.Status := Rec.Status::Cancelled;
                            Rec.Modify;
                        end else
                            Error(Text001);
                    end;
                }
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

    var
        PayLine: Record "Payment Line";
        PVUsers: Record "W/P Budget Buffer";
        strFilter: Text[250];
        IntC: Integer;
        IntCount: Integer;
        Payments: Record "Payments Header";
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tariff Code s";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        CashierLinks: Record "Cash Office User Template";
        LineNo: Integer;
        Temp: Record "Cash Office User Template";
        JTemplate: Code[10];
        JBatch: Code[10];
        PCheck: Codeunit "Posting Check FP";
        Post: Boolean;
        strText: Text[100];
        PVHead: Record "Payments Header";
        BankAcc: Record "Bank Account";
        CheckBudgetAvail: Codeunit "Budgetary Control";
        Commitments: Record Committment;
        UserMgt: Codeunit "User Setup Management BR";
        JournlPosted: Codeunit "Journal Post Successful";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";
        [InDataSet]
        "Payment Release DateEditable": Boolean;
        [InDataSet]
        "Currency CodeEditable": Boolean;
        [InDataSet]
        GlobalDimension1CodeEditable: Boolean;
        [InDataSet]
        ShortcutDimension2CodeEditable: Boolean;
        [InDataSet]
        "Payment NarrationEditable": Boolean;
        [InDataSet]
        PayeeEditable: Boolean;
        [InDataSet]
        ShortcutDimension3CodeEditable: Boolean;
        [InDataSet]
        ShortcutDimension4CodeEditable: Boolean;
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        PVLinesEditable: Boolean;
        StatusEditable: Boolean;

    //[Scope('Internal')]
    procedure UpdatePageControl()
    var
        PvUser: Record "W/P Budget Buffer";
    begin
    end;

    //[Scope('Internal')]
    procedure PostPaymentVoucher(Rec: Record "Payments Header")
    begin
    end;

    //[Scope('Internal')]
    procedure PostHeader(var Payment: Record "Payments Header")
    begin
    end;

    //[Scope('Internal')]
    procedure GetAppliedEntries(var LineNo: Integer) InvText: Text[100]
    var
        Appl: Record "Workplan Activities";
    begin
    end;

    //[Scope('Internal')]
    procedure InsertApproval()
    begin
    end;

    //[Scope('Internal')]
    procedure LinesCommitmentStatus() Exists: Boolean
    var
        BCsetup: Record "Budgetary Control Setup";
    begin
    end;

    //[Scope('Internal')]
    procedure CheckPVRequiredItems(Rec: Record "Payments Header")
    begin
    end;

    //[Scope('Internal')]
    procedure PostPV(var Payment: Record "Payments Header")
    begin
    end;

    //[Scope('Internal')]
    procedure LinesExists(): Boolean
    var
        PayLines: Record "Payment Line";
    begin
    end;

    //[Scope('Internal')]
    procedure AllFieldsEntered(): Boolean
    var
        PayLines: Record "Payment Line";
    begin
    end;

    //[Scope('Internal')]
    procedure CustomerPayLinesExist(): Boolean
    var
        PayLine: Record "Payment Line";
    begin
    end;

    local procedure OnCurrRecord()
    begin
    end;

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
    end;

    //[Scope('Internal')]
    procedure CurrPageUpdate()
    begin
    end;
}

