page 52185754 "Savings Ledger Entries"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Savings Ledger Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Customer No."; Rec."Customer No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Currency Code."; Rec."Currency Code.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                }
                field("Original Amt. (LCY)"; Rec."Original Amt. (LCY)")
                {
                }
                field("Remaining Amt. (LCY)"; Rec."Remaining Amt. (LCY)")
                {
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                }
                field("Sales (LCY)"; Rec."Sales (LCY)")
                {
                }
                field("Profit (LCY)"; Rec."Profit (LCY)")
                {
                }
                field("Inv. Discount (LCY)"; Rec."Inv. Discount (LCY)")
                {
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Source Code"; Rec."Source Code")
                {
                }
                field("On Hold"; Rec."On Hold")
                {
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                }
                field(Open; Rec.Open)
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                }
                field("Original Pmt. Disc. Possible"; Rec."Original Pmt. Disc. Possible")
                {
                }
                field("Pmt. Disc. Given (LCY)"; Rec."Pmt. Disc. Given (LCY)")
                {
                }
                field(Positive; Rec.Positive)
                {
                }
                field("Closed by Entry No."; Rec."Closed by Entry No.")
                {
                }
                field("Closed at Date"; Rec."Closed at Date")
                {
                }
                field("Closed by Amount"; Rec."Closed by Amount")
                {
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                }
                field("Reason Code"; Rec."Reason Code")
                {
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field("Transaction No."; Rec."Transaction No.")
                {
                }
                field("Closed by Amount (LCY)"; Rec."Closed by Amount (LCY)")
                {
                }
                field("Debit Amount"; Rec."Debit Amount")
                {
                }
                field("Credit Amount"; Rec."Credit Amount")
                {
                }
                field("Debit Amount (LCY)"; Rec."Debit Amount (LCY)")
                {
                }
                field("Credit Amount (LCY)"; Rec."Credit Amount (LCY)")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field("External Document No."; Rec."External Document No.")
                {
                }
                field("Calculate Interest"; Rec."Calculate Interest")
                {
                }
                field("Closing Interest Calculated"; Rec."Closing Interest Calculated")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Closed by Currency Code"; Rec."Closed by Currency Code")
                {
                }
                field("Closed by Currency Amount"; Rec."Closed by Currency Amount")
                {
                }
                field("Adjusted Currency Factor"; Rec."Adjusted Currency Factor")
                {
                }
                field("Original Currency Factor"; Rec."Original Currency Factor")
                {
                }
                field("Original Amount"; Rec."Original Amount")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field("Remaining Pmt. Disc. Possible"; Rec."Remaining Pmt. Disc. Possible")
                {
                }
                field("Pmt. Disc. Tolerance Date"; Rec."Pmt. Disc. Tolerance Date")
                {
                }
                field("Max. Payment Tolerance"; Rec."Max. Payment Tolerance")
                {
                }
                field("Last Issued Reminder Level"; Rec."Last Issued Reminder Level")
                {
                }
                field("Accepted Payment Tolerance"; Rec."Accepted Payment Tolerance")
                {
                }
                field("Accepted Pmt. Disc. Tolerance"; Rec."Accepted Pmt. Disc. Tolerance")
                {
                }
                field("Pmt. Tolerance (LCY)"; Rec."Pmt. Tolerance (LCY)")
                {
                }
                field("Amount to Apply"; Rec."Amount to Apply")
                {
                }
                field("IC Partner Code"; Rec."IC Partner Code")
                {
                }
                field("Applying Entry"; Rec."Applying Entry")
                {
                }
                field(Reversed; Rec.Reversed)
                {
                }
                field("Reversed by Entry No."; Rec."Reversed by Entry No.")
                {
                }
                field("Reversed Entry No."; Rec."Reversed Entry No.")
                {
                }
                field(Prepayment; Rec.Prepayment)
                {
                }
                field("Group Code"; Rec."Group Code")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Bulk Process"; Rec."Bulk Process")
                {
                }
                field("Posting Time"; Rec."Posting Time")
                {
                }
                field("Approver ID"; Rec."Approver ID")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
                field("Creation Time"; Rec."Creation Time")
                {
                }
                field("PC Posting Name"; Rec."PC Posting Name")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Reverse Transaction")
            {
                Caption = 'Reverse Transaction';
                Ellipsis = true;
                Image = ReverseRegister;

                trigger OnAction()
                var
                    ReversalEntry: Record "Reversal Entry";
                begin
                    Clear(ReversalEntry);
                    if Rec.Reversed then
                        ReversalEntry.AlreadyReversedEntry(Rec.TableCaption, Rec."Entry No.");
                    if Rec."Journal Batch Name" = '' then
                        ReversalEntry.TestFieldError;
                    Rec.TestField("Transaction No.");
                    ReversalEntry.ReverseTransaction(Rec."Transaction No.");
                end;
            }
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Navigate.SetDoc(Rec."Posting Date", Rec."Document No.");
                    Navigate.Run;
                end;
            }
        }
    }

    var
        Navigate: Page Navigate;
}

