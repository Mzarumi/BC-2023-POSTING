page 52186163 "Bank Acc. Recon List 2015"
{
    Caption = 'Bank Acc. Reconciliation List';
    CardPageID = "Bank Acc. Recon Card 2015";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Bank Acc. Reconciliation";
    SourceTableView = WHERE("Reconciliation Type" = CONST(Manual));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field(BankAccountNo; Rec."Bank Account No.")
                {
                    Caption = 'Bank Account No.';
                }
                field(StatementNo; Rec."Statement No.")
                {
                    Caption = 'Statement No.';
                }
                field(StatementDate; Rec."Statement Date")
                {
                    Caption = 'Statement Date';
                }
                field(BalanceLastStatement; Rec."Balance Last Statement")
                {
                    Caption = 'Balance Last Statement';
                }
                field(StatementEndingBalance; Rec."Statement Ending Balance")
                {
                    Caption = 'Statement Ending Balance';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control2; Links)
            {
                Visible = false;
            }
            systempart(Control1; Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Codeunit "Bank Acc. Recon. Post (Yes/No)";
                    ShortCutKey = 'F9';
                }
                action("Post and &Print")
                {
                    Caption = 'Post and &Print';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Codeunit "Bank Acc. Recon. Post+Print";
                    ShortCutKey = 'Shift+F9';
                }
            }
        }
    }
}

