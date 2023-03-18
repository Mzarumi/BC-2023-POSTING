page 52185911 "Cash Office User Template"
{
    DataCaptionFields = UserID;
    PageType = List;
    SourceTable = "Cash Office User Template";

    layout
    {
        area(content)
        {
            repeater(Control1102758000)
            {
                ShowCaption = false;
                field(UserID; Rec.UserID)
                {
                }
                field("Receipt Journal Template"; Rec."Receipt Journal Template")
                {
                }
                field("Receipt Journal Batch"; Rec."Receipt Journal Batch")
                {
                }
                field("Imprest Template"; Rec."Imprest Template")
                {
                }
                field("Imprest  Batch"; Rec."Imprest  Batch")
                {
                }
                field("Default Receipts Bank"; Rec."Default Receipts Bank")
                {
                }
                field("Default Petty Cash Bank"; Rec."Default Petty Cash Bank")
                {
                }
                field("Default Payment Bank"; Rec."Default Payment Bank")
                {
                }
                field("Payment Journal Template"; Rec."Payment Journal Template")
                {
                }
                field("Payment Journal Batch"; Rec."Payment Journal Batch")
                {
                }
                field("Petty Cash Template"; Rec."Petty Cash Template")
                {
                }
                field("Petty Cash Batch"; Rec."Petty Cash Batch")
                {
                }
                field("Inter Bank Template Name"; Rec."Inter Bank Template Name")
                {
                }
                field("Inter Bank Batch Name"; Rec."Inter Bank Batch Name")
                {
                }
                field("Bank Pay In Journal Template"; Rec."Bank Pay In Journal Template")
                {
                }
                field("Bank Pay In Journal Batch"; Rec."Bank Pay In Journal Batch")
                {
                }
                field("Claim Template"; Rec."Claim Template")
                {
                }
                field("Claim  Batch"; Rec."Claim  Batch")
                {
                }
                field("Advance Template"; Rec."Advance Template")
                {
                }
                field("Advance  Batch"; Rec."Advance  Batch")
                {
                }
                field("Advance Surr Template"; Rec."Advance Surr Template")
                {
                }
                field("Advance Surr Batch"; Rec."Advance Surr Batch")
                {
                }
                field("Dim Change Journal Template"; Rec."Dim Change Journal Template")
                {
                }
                field("Dim Change Journal Batch"; Rec."Dim Change Journal Batch")
                {
                }
                field("Journal Voucher Template"; Rec."Journal Voucher Template")
                {
                }
                field("Journal Voucher Batch"; Rec."Journal Voucher Batch")
                {
                }
                field("Default Cash Sale Customer"; Rec."Default Cash Sale Customer")
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

