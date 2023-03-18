page 52185806 "Banking User Setup"
{
    PageType = List;
    SourceTable = "Banking User Template";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(UserID; Rec.UserID)
                {
                }
                field("Cashier Journal Template"; Rec."Cashier Journal Template")
                {
                }
                field("Cashier Journal Batch"; Rec."Cashier Journal Batch")
                {
                }
                field("Salary Journal Template"; Rec."Salary Journal Template")
                {
                }
                field("Salary Journal Batch"; Rec."Salary Journal Batch")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Default  Bank"; Rec."Default  Bank")
                {
                }
                field("Bankers Cheque Account"; Rec."Bankers Cheque Account")
                {
                }
                field("Cheque Clearance Account"; Rec."Cheque Clearance Account")
                {
                }
                field("No of Open Transactions"; Rec."No of Open Transactions")
                {
                }
                field("Loans Template"; Rec."Loans Template")
                {
                }
                field("Loans Batch"; Rec."Loans Batch")
                {
                }
                field("Check Off Template"; Rec."Check Off Template")
                {
                }
                field("Check Off Batch"; Rec."Check Off Batch")
                {
                }
                field("Max. Deposit Limit"; Rec."Max. Deposit Limit")
                {
                }
                field("Max. Withdrawal Limit"; Rec."Max. Withdrawal Limit")
                {
                }
                field("Max. Cashier Withholding"; Rec."Max. Cashier Withholding")
                {
                }
                field("Max. Bankers Chequel Limit"; Rec."Max. Bankers Chequel Limit")
                {
                }
                field("Min. Balance"; Rec."Min. Balance")
                {
                }
                field("Excess Account"; Rec."Excess Account")
                {
                }
                field("Shortage Account"; Rec."Shortage Account")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("MPESA Disbursement A/c"; Rec."MPESA Disbursement A/c")
                {
                }
                field("Cheque Disbursement A/c"; Rec."Cheque Disbursement A/c")
                {
                }
                field("Bills Template"; Rec."Bills Template")
                {
                }
                field("Bills Batch"; Rec."Bills Batch")
                {
                }
                field("Interest Account Template"; Rec."Interest Account Template")
                {
                }
                field("Interest Account Batch"; Rec."Interest Account Batch")
                {
                }
                field("Over Draft Template"; Rec."Over Draft Template")
                {
                }
                field("Over Draft Batch"; Rec."Over Draft Batch")
                {
                }
                field("Transfer Journal Template"; Rec."Transfer Journal Template")
                {
                }
                field("Transfer Journal Batch"; Rec."Transfer Journal Batch")
                {
                }
                field("ATM Charges Journal Template"; Rec."ATM Charges Journal Template")
                {
                }
                field("ATM Charges Journal Batch"; Rec."ATM Charges Journal Batch")
                {
                }
                field("Cheque Discounting Template"; Rec."Cheque Discounting Template")
                {
                }
                field("Cheque Discounting Batch"; Rec."Cheque Discounting Batch")
                {
                }
                field("Delegates Pay.Journal Template"; Rec."Delegates Pay.Journal Template")
                {
                }
                field("Delegates Pay. Journal Batch"; Rec."Delegates Pay. Journal Batch")
                {
                }
                field("Accrual. Fee.Journal Template"; Rec."Accrual. Fee.Journal Template")
                {
                }
                field("Accrual. Fee. Journal Batch"; Rec."Accrual. Fee. Journal Batch")
                {
                }
                field("Supervisor Mobile No"; Rec."Supervisor Mobile No")
                {
                }
                field("Supervisor E-Mail"; Rec."Supervisor E-Mail")
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
        FnRestrictAccess
    end;

    var
        StatusPermission: Record "Status Change Permissions.";

    //[Scope('Internal')]
    procedure FnRestrictAccess()
    var
        ChangePermission: Record "Status Change Permissions.";
        ErrorOnRestrictViewTxt: Label 'You do Not have Permission on View,Read,Modify on this Page. Contact system administrator for assistance. %1-%2';
    begin
        StatusPermission.Reset;
        StatusPermission.SetRange("User ID", DATABASE.UserId);
        StatusPermission.SetRange("Edit Setup", true);
        if not StatusPermission.Find('-') then begin
            CurrPage.Editable := false;
        end else begin
            CurrPage.Editable := true;
        end;
    end;
}

