page 52186055 "All Users Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Finance Cue";

    layout
    {
        area(content)
        {
            cuegroup("My Approved Docs")
            {
                Caption = 'My Approved Docs';
                field("My Payment Vouchers"; Rec."My Payment Vouchers")
                {
                    Caption = 'Payment Vouchers';
                }
                field("My Petty Cash Vouchers"; Rec."My Petty Cash Vouchers")
                {
                    Caption = 'Petty Cash Vouchers';
                }
                field("My Staff Advance"; Rec."My Staff Advance")
                {
                    Caption = 'Staff Advance';
                }
                field("My Imprest Request"; Rec."My Imprest Request")
                {
                    Caption = 'Travel Advance Requisition';
                }

                actions
                {
                    action("Edit Cash Receipt Journal")
                    {
                        Caption = 'Edit Cash Receipt Journal';
                        RunObject = Page "Cash Receipt Journal";
                    }
                    action("New Sales Credit Memo")
                    {
                        Caption = 'New Sales Credit Memo';
                        RunObject = Page "Sales Credit Memo";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup(Control11)
            {
                Caption = 'My Approved Docs';
                field("My Staff Advance Surrender"; Rec."My Staff Advance Surrender")
                {
                    Caption = 'Staff Advance Liquidation';
                }
                field("My Imprest Surrender"; Rec."My Imprest Surrender")
                {
                    Caption = 'Travel Liquidation';
                }
                field("My Staff Claims"; Rec."My Staff Claims")
                {
                    Caption = 'Staff Claims';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetFilter("Overdue Date Filter", '<%1', WorkDate);
    end;
}

