page 52185803 "Banking No Setup"
{
    SourceTable = "Banking No Setup";

    layout
    {
        area(content)
        {
            group("Banking No Setup")
            {
                Caption = 'Banking No Setup';
                field("Cashier Transaction Nos."; Rec."Cashier Transaction Nos.")
                {
                }
                field("Treasury & Teller Trans Nos."; Rec."Treasury & Teller Trans Nos.")
                {
                }
                field("Standing Order Nos."; Rec."Standing Order Nos.")
                {
                }
                field("Standing Order Reg. Nos."; Rec."Standing Order Reg. Nos.")
                {
                }
                field("Standing Order Control Nos."; Rec."Standing Order Control Nos.")
                {
                }
                field("EFT Nos."; Rec."EFT Nos.")
                {
                }
                field("EFT Line Nos"; Rec."EFT Line Nos")
                {
                }
                field("Salary Nos."; Rec."Salary Nos.")
                {
                }
                field("Cheque Receipts Nos"; Rec."Cheque Receipts Nos")
                {
                }
                field("Cheque Application Nos"; Rec."Cheque Application Nos")
                {
                }
                field("Bankers Cheque Application Nos"; Rec."Bankers Cheque Application Nos")
                {
                }
                field("Overdraft Nos"; Rec."Overdraft Nos")
                {
                }
                field("Account Transfer Nos"; Rec."Account Transfer Nos")
                {
                }
                field("ATM Application Nos"; Rec."ATM Application Nos")
                {
                }
                field("ATM Linking Application Nos"; Rec."ATM Linking Application Nos")
                {
                }
                field("FOSA Interest Nos"; Rec."FOSA Interest Nos")
                {
                }
                field("Document Apprvls."; Rec."Document Apprvls.")
                {
                }
                field("Delegate Nos."; Rec."Delegate Nos.")
                {
                }
                field("Delegate Sub Nos."; Rec."Delegate Sub Nos.")
                {
                }
                field("Delegate Application Nos."; Rec."Delegate Application Nos.")
                {
                }
                field("Delegate Payment Nos."; Rec."Delegate Payment Nos.")
                {
                }
                field("Delegate Minutes Nos."; Rec."Delegate Minutes Nos.")
                {
                }
                field("Delega Change"; Rec."Delega Change")
                {
                }
                field("Change M-SACCO PIN Nos"; Rec."Change M-SACCO PIN Nos")
                {
                }
                field("M-SACCO Change Nos"; Rec."M-SACCO Change Nos")
                {
                }
                field("BULK SMS Nos"; Rec."BULK SMS Nos")
                {
                }
                field("Account Closure"; Rec."Account Closure")
                {
                }
                field("M-SACCO Application Nos"; Rec."M-SACCO Application Nos")
                {
                }
                field("Agency Update Nos."; Rec."Agency Update Nos.")
                {
                }
            }
            group("Treasury No Setup")
            {
                Caption = 'Treasury No Setup';
                field("Investment Nos"; Rec."Investment Nos")
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
        OnAccesRestrictView();
    end;

    //[Scope('Internal')]
    procedure OnAccesRestrictView()
    var
        ChangePermission: Record "Status Change Permissions.";
        ErrorOnRestrictViewTxt: Label 'You do Not have Permission on View,Read,Modify on this Page. Contact system administrator for assistance. %1-%2';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("Edit Setup", true);
        ChangePermission.SetRange("Function Extended", ChangePermission."Function Extended"::Administrator);
        if not ChangePermission.Find('-') then begin
            Error(ErrorOnRestrictViewTxt, UserId, Rec.TableCaption);
        end;
    end;
}

