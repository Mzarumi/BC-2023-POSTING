#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 52185710 "General Set-Up"
{
    PageType = Card;
    SourceTable = "General Set-Up";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Min. Member Age";Rec."Min. Member Age")
                {
                    ApplicationArea = Basic;
                }
                field("Max. Member Age";Rec."Max. Member Age")
                {
                    ApplicationArea = Basic;
                }
                field("EFT Dest Acc Length";Rec."EFT Dest Acc Length")
                {
                    ApplicationArea = Basic;
                }
                field("Max. Member Age - Disabled";Rec."Max. Member Age - Disabled")
                {
                    ApplicationArea = Basic;
                }
                field("Max. Age Non-Common Bond";Rec."Max. Age Non-Common Bond")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Finance Set-Up")
            {
                field("Excise Duty (%)";Rec."Excise Duty (%)")
                {
                    ApplicationArea = Basic;
                }
                field("Excise Duty G/L";Rec."Excise Duty G/L")
                {
                    ApplicationArea = Basic;
                }
                field("External STO Account No.";Rec."External STO Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Dividend Payable Account";Rec."Dividend Payable Account")
                {
                    ApplicationArea = Basic;
                }
                field("Withholding Tax Account";Rec."Withholding Tax Account")
                {
                    ApplicationArea = Basic;
                }
                field("Div. Advance Rate";Rec."Div. Advance Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Bankers Cheque Limit";Rec."Bankers Cheque Limit")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Savings Set-Up")
            {
                field("Registration Fee";Rec."Registration Fee")
                {
                    ApplicationArea = Basic;
                }
                field("Rejoining Fee";Rec."Rejoining Fee")
                {
                    ApplicationArea = Basic;
                }
                field("Rejoining Fees Account";Rec."Rejoining Fees Account")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum ATM Limit";Rec."Maximum ATM Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Salary SMS Suffix";Rec."Salary SMS Suffix")
                {
                    ApplicationArea = Basic;
                }
                field("Birthday Message";Rec."Birthday Message")
                {
                    ApplicationArea = Basic;
                }
                field("Membership Anniversary";Rec."Membership Anniversary")
                {
                    ApplicationArea = Basic;
                }
                field("Junior Birthday Message";Rec."Junior Birthday Message")
                {
                    ApplicationArea = Basic;
                }
                field("Loan SMS Suffix";Rec."Loan SMS Suffix")
                {
                    ApplicationArea = Basic;
                }
                field("Disable Salary SMS";Rec."Disable Salary SMS")
                {
                    ApplicationArea = Basic;
                }
                field("Disable Loan SMS";Rec."Disable Loan SMS")
                {
                    ApplicationArea = Basic;
                }
                field("Control FOSA Posting";Rec."Control FOSA Posting")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Credit Set-Up")
            {
                field("Days for Checkoff";Rec."Days for Checkoff")
                {
                    ApplicationArea = Basic;
                }
                field("Dormant Account Activation Fee";Rec."Dormant Account Activation Fee")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Defaulter Notice Period";Rec."Defaulter Notice Period")
                {
                    ApplicationArea = Basic;
                }
                field("Guarantors Multiplier";Rec."Guarantors Multiplier")
                {
                    ApplicationArea = Basic;
                }
                field("Max Loans To Guarantee";Rec."Max Loans To Guarantee")
                {
                    ApplicationArea = Basic;
                }
                field("Self Deposits(As Guarantor)";Rec."Self Deposits(As Guarantor)")
                {
                    ApplicationArea = Basic;
                }
                field("Bill Account";Rec."Bill Account")
                {
                    ApplicationArea = Basic;
                }
                field("Block Account for Ext.  Loan";Rec."Block Account for Ext.  Loan")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Name";Rec."Insurance Name")
                {
                    ApplicationArea = Basic;
                }
                field("Sink Fund Process Charge";Rec."Sink Fund Process Charge")
                {
                    ApplicationArea = Basic;
                }
                field("Withdrawal Notice period";Rec."Withdrawal Notice period")
                {
                    ApplicationArea = Basic;
                }
                field("Withdrawal Notice Penalty";Rec."Withdrawal Notice Penalty")
                {
                    ApplicationArea = Basic;
                }
                field("Withdrawal Fee";Rec."Withdrawal Fee")
                {
                    ApplicationArea = Basic;
                }
                field("Withdrawal Fee Account";Rec."Withdrawal Fee Account")
                {
                    ApplicationArea = Basic;
                }
                field("Early Withdrawal %";Rec."Early Withdrawal %")
                {
                    ApplicationArea = Basic;
                }
                field("Early Withdrawal Account";Rec."Early Withdrawal Account")
                {
                    ApplicationArea = Basic;
                }
                field("Boosting Maturity";Rec."Boosting Maturity")
                {
                    ApplicationArea = Basic;
                }
                field("Boosting Shares %";Rec."Boosting Shares %")
                {
                    ApplicationArea = Basic;
                }
                field("Share Boost GL";Rec."Share Boost GL")
                {
                    ApplicationArea = Basic;
                }
                field("Self Guarantee %";Rec."Self Guarantee %")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Discounting %";Rec."Maximum Discounting %")
                {
                    ApplicationArea = Basic;
                }
                field("Special Charge on Loans GL";Rec."Special Charge on Loans GL")
                {
                    ApplicationArea = Basic;
                }
                field("Enforce Picture & Signature";Rec."Enforce Picture & Signature")
                {
                    ApplicationArea = Basic;
                }
                field("Unloged Claims Account";Rec."Unloged Claims Account")
                {
                    ApplicationArea = Basic;
                }
                field("BBF Claim %";Rec."BBF Claim %")
                {
                    ApplicationArea = Basic;
                }
                field("Benevolent Claim Account";Rec."Benevolent Claim Account")
                {
                    ApplicationArea = Basic;
                }
                field("Allowed Loan Categories";Rec."Allowed Loan Categories")
                {
                    ApplicationArea = Basic;
                }
                field("Allowed Loan Cat Billing";Rec."Allowed Loan Cat Billing")
                {
                    ApplicationArea = Basic;
                    Caption = 'Allowed Loan Billing Category';
                }
                field("Statement Limit Period";Rec."Statement Limit Period")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Valuation Period";Rec."Maximum Valuation Period")
                {
                    ApplicationArea = Basic;
                }
                field("KMRC Rate";Rec."KMRC Rate")
                {
                    ApplicationArea = Basic;
                }
                field("Mortgage Loan Vendor A/C";Rec."Mortgage Loan Vendor A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Shamba Loan Vendor A/C";Rec."Shamba Loan Vendor A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Mortgage FOSA Min Balance";Rec."Mortgage FOSA Min Balance")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum No of Group Members";Rec."Minimum No of Group Members")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Delegates Management")
            {
                field("Min. Delegates deposit";Rec."Min. Delegates deposit")
                {
                    ApplicationArea = Basic;
                }
                field("Min. Delegate Membership Period";Rec."Min.Delegate Membership Period")
                {
                    ApplicationArea = Basic;
                }
                field("Min. Delegates Share Capital";Rec."Min. Delegates Share Capital")
                {
                    ApplicationArea = Basic;
                }
                field("Requires Salary Processing";Rec."Requires Salary Processing")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Period";Rec."Salary Period")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Bank Transfer")
            {
                Caption = 'Bank Transfer and ATM Management';
                field(Reference;Rec.Reference)
                {
                    ApplicationArea = Basic;
                }
                field("ATM Card No Characters";Rec."ATM Card No Characters")
                {
                    ApplicationArea = Basic;
                }
                field("POS Bank Account";Rec."POS Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field("ATM Settlement Account";Rec."ATM Settlement Account")
                {
                    ApplicationArea = Basic;
                }
                field("VISA Settlement Account";Rec."VISA Settlement Account")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Leaf Limit";Rec."Minimum Leaf Limit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Minimum Leaf Limit Bankers Cheque';
                }
            }
            group("BDE Setup")
            {
                Caption = 'BDE Setup';
                field("BDE Loan Comission";Rec."BDE Loan Comission")
                {
                    ApplicationArea = Basic;
                }
                field("BDE Loan Above Target";Rec."BDE Loan Above Target")
                {
                    ApplicationArea = Basic;
                }
                field("BDE ATM Comission";Rec."BDE ATM Comission")
                {
                    ApplicationArea = Basic;
                }
                field("BDE New Member Comission";Rec."BDE New Member Comission")
                {
                    ApplicationArea = Basic;
                }
                field("BDE Salary Account Commision";Rec."BDE Salary Account Commision")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Ageny Banking")
            {
                Caption = 'Ageny Banking';
                field("Agency No Series";Rec."Agency No Series")
                {
                    ApplicationArea = Basic;
                }
                field("Agency Control Account";Rec."Agency Control Account")
                {
                    ApplicationArea = Basic;
                }
                field("Agency Expense Account";Rec."Agency Expense Account")
                {
                    ApplicationArea = Basic;
                }
                field("Agency Posting Template";Rec."Agency Posting Template")
                {
                    ApplicationArea = Basic;
                }
                field("Agency Posting Batch";Rec."Agency Posting Batch")
                {
                    ApplicationArea = Basic;
                }
                field("Sacco Commission Account";Rec."Sacco Commission Account")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Commission Account";Rec."Vendor Commission Account")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Store Requisition")
            {
                Caption = 'Store Requisition';
                field("Max Store Open Documents";Rec."Max Store Open Documents")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Sky Web Portal")
            {
                field("PDF B64 Folder";Rec."PDF B64 Folder")
                {
                    ApplicationArea = Basic;
                }
                field("Password History Limit";Rec."Password History Limit")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Sky Mobile Setup")
            {
                field("Sky Mobile Next Run Date";Rec."Sky Mobile Next Run Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //OnAccesRestrictView();
    end;


    // procedure OnAccesRestrictView()
    // var
    //     ChangePermission: Record UnknownRecord52185687;
    //     ErrorOnRestrictViewTxt: label 'You do Not have Permission on View,Read,Modify on this Page. Contact system administrator for assistance. %1-%2';
    // begin
    //     ChangePermission.Reset;
    //     ChangePermission.SetRange("User ID",UserId);
    //     ChangePermission.SetRange("Edit Setup",true);
    //     ChangePermission.SetRange("Function Extended",ChangePermission."function extended"::Administrator);
    //     if not ChangePermission.Find('-') then begin
    //       Error(ErrorOnRestrictViewTxt,UserId,Rec.TableCaption);
    //       end;
    // end;
}
