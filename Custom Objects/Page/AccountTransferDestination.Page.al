page 52185824 "Account Transfer Destination"
{
    PageType = ListPart;
    SourceTable = "Account Transfer Destination";

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                ShowCaption = false;
                field("Destination Account Type"; Rec."Destination Account Type")
                {
                    Caption = 'Account Type';
                }
                field("Destination Account No."; Rec."Destination Account No.")
                {
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                    Caption = '<Exsternal Document No.>';
                }
                field("Destination Account Name"; Rec."Destination Account Name")
                {
                    Caption = ' Account Name';
                }
                field("Destination Transaction Type"; Rec."Destination Transaction Type")
                {
                    Caption = 'Transaction Type';
                }
                field("Destination Loan No."; Rec."Destination Loan No.")
                {
                    Caption = 'Loan No.';
                }
                field("Destination Amount"; Rec."Destination Amount")
                {
                    Caption = 'Destination Amount';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action1000000002)
            {
                action("Import Bulk Refunds")
                {
                    Image = ImportExcel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ////RunObject = XMLport XMLport39005557;

                    trigger OnAction()
                    begin
                        /////ghhghghghg
                    end;
                }
                action("Print Report")
                {
                    Caption = 'Print';
                    //RunObject = Report Report39006045;
                }
            }
        }
    }

    var
        SavAcc: Record "Savings Accounts";
        CredAcc: Record "Credit Accounts";
        SavAccPage: Page "Savings Account List";
}

