page 52186014 "Posted Cash Receipt Header"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = "Receipts Header";
    SourceTableView = WHERE(Posted = CONST(true));

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
                }
                field("Document Date"; Rec."Document Date")
                {
                    Editable = StatusEditable;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = StatusEditable;
                }
                // field(FunctionName; Rec.FunctionName)
                // {
                //     Caption = 'Description';
                //     Editable = false;
                // }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = StatusEditable;
                }
                // field(BudgetCenterName; Rec.BudgetCenterName)
                // {
                //     Caption = 'Description';
                //     Editable = false;
                // }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = StatusEditable;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Editable = StatusEditable;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    Editable = StatusEditable;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    Editable = false;
                }
                field("Amount Recieved"; Rec."Amount Recieved")
                {
                    Editable = StatusEditable;
                }
                field("Received From"; Rec."Received From")
                {
                    Editable = StatusEditable;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }
                field(Cashier; Rec.Cashier)
                {
                    Editable = false;
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    Editable = false;
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
            }
            part(Control1000000000; "Cash Receipts Line")
            {
                Editable = StatusEditable;
                SubPageLink = No = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.Posted = false then Error('Post the receipt before printing.');
                    Rec.Reset;
                    Rec.SetFilter("No.", Rec."No.");
                    //REPORT.Run(52185781, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //Check Post Dated
                    if CheckPostDated then
                        Error('One of the Receipt Lines is Post Dated');

                    //Post the transaction into the database
                    PerformPost();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin

        UserSetup.Reset;

        if UserSetup.Get(UserId) then begin
            JTemplate := UserSetup."Receipt Journal Template";
            JBatch := UserSetup."Receipt Journal Batch";
        end;
        if (JTemplate = '') or (JBatch = '') then begin
            //ERROR('Please contact the system administrator to be setup as a receipting user');
        end;
        if UserSetup."Default Receipts Bank" = '' then begin
            //ERROR('Please contact the system administrator to be setup as a receipting user');
        end;
        Rec.SetFilter(Rec.Status, ' ');

        //***************************JACK***************************//
        //  SETRANGE("Created By",USERID);
        if UserMgt.GetSalesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetSalesFilter());
            Rec.FilterGroup(0);
        end;

        //***************************END ***************************//
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        ReceiptLine: Record "Receipt Line";
        tAmount: Decimal;
        DefaultBatch: Record "Gen. Journal Batch";
        FunctionName: Text[100];
        BudgetCenterName: Text[100];
        BankName: Text[100];
        Rcpt: Record "Receipts Header";
        RcptNo: Code[20];
        DimVal: Record "Dimension Value";
        BankAcc: Record "Bank Account";
        UserSetup: Record "Cash Office User Template";
        JTemplate: Code[10];
        JBatch: Code[10];
        GLine: Record "Gen. Journal Line";
        LineNo: Integer;
        BAmount: Decimal;
        SRSetup: Record "Sales & Receivables Setup";
        PCheck: Codeunit "Posting Check FP";
        Post: Boolean;
        USetup: Record "Cash Office User Template";
        RegMgt: Codeunit "Register Management";
        RegisterNumber: Integer;
        FromNumber: Integer;
        ToNumber: Integer;
        StrInvoices: Text[250];
        Appl: Record "Workplan Activities";
        UserMgt: Codeunit "User Setup Management BR";
        JournalPosted: Codeunit "Journal Post Successful";
        AdjustGenJnl: Codeunit "Adjust Gen. Journal Balance";
        IsCashAccount: Boolean;
        StatusEditable: Boolean;

    //[Scope('Internal')]
    procedure PerformPost()
    begin
    end;

    //[Scope('Internal')]
    procedure PerformPostLine()
    begin
    end;

    //[Scope('Internal')]
    procedure CheckPostDated() Exists: Boolean
    begin
    end;

    //[Scope('Internal')]
    procedure CheckBnkCurrency(BankAcc: Code[20]; CurrCode: Code[20])
    var
        BankAcct: Record "Bank Account";
    begin
    end;

    local procedure OnAfterGetCurrRecord()
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

