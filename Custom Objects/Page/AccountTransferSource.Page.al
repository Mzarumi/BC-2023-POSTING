page 52185823 "Account Transfer Source"
{
    PageType = ListPart;
    SourceTable = "Account Transfer Source";

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Source Account Type"; Rec."Source Account Type")
                {
                    Caption = 'Account Type';
                }
                field("Source Account No."; Rec."Source Account No.")
                {
                    Caption = 'Account No.';
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                }
                field("Source Account Name"; Rec."Source Account Name")
                {
                    Caption = 'Account Name';
                }
                field(Balance; Rec.Balance)
                {
                }
                field("Available Balance"; Rec."Available Balance")
                {
                }
                field("Source Transaction Type"; Rec."Source Transaction Type")
                {
                    Caption = 'Transaction Type';
                }
                field("Source Loan No."; Rec."Source Loan No.")
                {
                    Caption = 'Loan No.';
                }
                field("Source Amount"; Rec."Source Amount")
                {
                    Caption = 'Source Amount';
                }
            }
        }
    }

    actions
    {
    }
}

