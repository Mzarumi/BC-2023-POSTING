page 52185910 "Cash Office Setup"
{
    PageType = Card;
    SourceTable = "Cash Office Setup";

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Normal Payments No"; Rec."Normal Payments No")
                {
                    Caption = 'Payment Voucher';
                }
                field("Cheque Reject Period"; Rec."Cheque Reject Period")
                {
                }
                field("Minimum Cheque Creation Amount"; Rec."Minimum Cheque Creation Amount")
                {
                }
                field("Petty Cash Payments No"; Rec."Petty Cash Payments No")
                {
                }
                field("Board PVs Nos."; Rec."Board PVs Nos.")
                {
                }
                field("Delegate  PVs Nos."; Rec."Delegate  PVs Nos.")
                {
                    Caption = 'Delegate PVs Nos.';
                }
                field("Current Budget"; Rec."Current Budget")
                {
                }
                field("Current Budget Start Date"; Rec."Current Budget Start Date")
                {
                }
                field("Current Budget End Date"; Rec."Current Budget End Date")
                {
                }
                field("Bank Deposit No."; Rec."Bank Deposit No.")
                {
                }
                field("InterBank Transfer No."; Rec."InterBank Transfer No.")
                {
                }
                field("Surrender Template"; Rec."Surrender Template")
                {
                }
                field("Surrender  Batch"; Rec."Surrender  Batch")
                {
                }
                field("Receipts No"; Rec."Receipts No")
                {
                    Caption = 'Bank Receipts No';
                }
                field("Cash Receipt Nos"; Rec."Cash Receipt Nos")
                {
                }
                field("Cashier Transfer Nos"; Rec."Cashier Transfer Nos")
                {
                }
                field("Default Bank Deposit Slip A/C"; Rec."Default Bank Deposit Slip A/C")
                {
                }
                field("Imprest Req No"; Rec."Imprest Req No")
                {
                    Caption = 'Imprest Req No.';
                }
                field("Imprest Surrender No"; Rec."Imprest Surrender No")
                {
                }
                field("Staff Claim No."; Rec."Staff Claim No.")
                {
                }
                field("Other Staff Advance No."; Rec."Other Staff Advance No.")
                {
                }
                field("Staff Advance Surrender No."; Rec."Staff Advance Surrender No.")
                {
                    Caption = 'Other Staff Adv. Surrender No';
                }
                field("Use Central Payment System"; Rec."Use Central Payment System")
                {
                }
                field("Case Number"; Rec."Case Number")
                {
                }
                field("Damage Number"; Rec."Damage Number")
                {
                }
                field("Surety No"; Rec."Surety No")
                {
                }
                field("Journal Voucher Nos"; Rec."Journal Voucher Nos")
                {
                }
                field("Grant Surrender Nos"; Rec."Grant Surrender Nos")
                {
                }
                field("Cash Purchases"; Rec."Cash Purchases")
                {
                }
                field("Overtime Claim Nos"; Rec."Overtime Claim Nos")
                {
                }
                field("Benevolent Claim Nos"; Rec."Benevolent Claim Nos")
                {
                }
                field("Insurance Receivable Claim"; Rec."Insurance Receivable Claim")
                {
                }
                field("Insurance Claim Received"; Rec."Insurance Claim Received")
                {
                }
                field("Permission Requisition Nos"; Rec."Permission Requisition Nos")
                {
                }
                field("Computer Asset Requisition"; Rec."Computer Asset Requisition")
                {
                }
                field("Sundry Income for Account  Clo"; Rec."Sundry Income for Account  Clo")
                {
                }
            }
            group("Cash Limit")
            {
                Caption = 'Cash Limit';
                field("Apply Cash Expenditure Limit"; Rec."Apply Cash Expenditure Limit")
                {
                }
                field("Expenditure Limit Amount(LCY)"; Rec."Expenditure Limit Amount(LCY)")
                {
                }
                field("Prompt Cash Reimbursement"; Rec."Prompt Cash Reimbursement")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        UserSetup.GetDefaultSalesAmountApprovalLimit();
    end;

    var
        StatusPermissions: Record "Status Change Permissions.";
        Text000: Label 'You do not have permissions to view This page';
        UserSetup: Record "User Setup";
}

