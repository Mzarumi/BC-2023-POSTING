page 52185834 "Cheque Clearance"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Cashier Transactions";
    SourceTableView = WHERE(Posted = CONST(true),
                            Type = FILTER("Credit Cheque" | "Cheque Deposit"),
                            "Cheque Status" = FILTER(Pending));

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                ShowCaption = false;
                field(No; Rec.No)
                {
                    Editable = false;
                }
                field("Account No"; Rec."Account No")
                {
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    Editable = false;
                }
                field("Product Type"; Rec."Product Type")
                {
                    Editable = false;
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                    Caption = 'Transaction';
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    Editable = false;
                }
                field("Bank Account"; Rec."Bank Account")
                {
                    Editable = false;
                }
                field(Cashier; Rec.Cashier)
                {
                    Editable = false;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    Caption = 'Date';
                    Editable = false;
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                    Caption = 'Time';
                    Editable = false;
                }
                field("Expected Maturity Date"; Rec."Expected Maturity Date")
                {
                    Editable = true;
                }
                field(Select; Rec.Select)
                {
                }
                field("Date Cleared"; Rec."Date Cleared")
                {
                    Editable = false;
                }
                field("Cleared By"; Rec."Cleared By")
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
        area(navigation)
        {
            group(View)
            {
                Caption = 'View';
                action("Account Card")
                {
                    Caption = 'Account Card';
                }
            }
        }
        area(processing)
        {
            action(Process)
            {
                Caption = 'Process';
                Image = PutawayLines;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SaccoT: Codeunit "Sacco Transactions";
                    CreditLedger: Record "Credit Ledger Entry";
                begin
                    if Confirm('Are you sure you want to process the selected transactions?', false) = true then begin

                        Transactions.Reset;
                        Transactions.SetRange(Transactions.Select, true);
                        if Transactions.Find('-') then
                            repeat
                                CreditLedger.Reset;
                                CreditLedger.SetRange("Document No.", Transactions.No);
                                CreditLedger.SetRange("Member No.", Transactions."Member No.");
                                if not CreditLedger.Find('-') then begin

                                    SaccoT.ClearCheques;
                                end;
                                Transactions."Cheque Status" := Transactions."Cheque Status"::Honoured;
                                Transactions."Date Cleared" := Today;
                                Transactions.Modify;




                            until Transactions.Next = 0;

                        //SENDMAIL;
                        Message('The selected transactions have been processed.');

                    end;
                end;
            }
        }
    }

    var
        Transactions: Record "Cashier Transactions";
}

