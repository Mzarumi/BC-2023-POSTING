page 52185709 "Member Nos. Series"
{
    PageType = Card;
    SourceTable = "Credit Nos. Series";

    layout
    {
        area(content)
        {
            group(General)
            {
                Visible = false;
                field("No."; Rec."No.")
                {
                }
            }
            group("Member Management")
            {
                field("Member Application Nos."; Rec."Member Application Nos.")
                {
                }
                field("Member Nos."; Rec."Member Nos.")
                {
                }
                field("Accounts Application"; Rec."Accounts Application")
                {
                }
                field("Virtual Member App. No"; Rec."Virtual Member App. No")
                {
                }
                field("Dividend Rate No."; Rec."Dividend Rate No.")
                {
                }
                field("SMS Subscription"; Rec."SMS Subscription")
                {
                }
                field("SMS Code"; Rec."SMS Code")
                {
                }
                field("BBF Claims"; Rec."BBF Claims")
                {
                }
                field("BBF Report"; Rec."BBF Report")
                {
                }
                field("BDE Application"; Rec."BDE Application")
                {
                }
            }
            group(Securities)
            {
                field("Member Closure Nos."; Rec."Member Closure Nos.")
                {
                }
                field("Member Reactivation Nos."; Rec."Member Reactivation Nos.")
                {
                }
            }
            group("Credit Management ")
            {
                field("Loan Nos."; Rec."Loan Nos.")
                {
                }
                field("Loan Batch Nos"; Rec."Loan Batch Nos")
                {
                }
                field("Billing Nos."; Rec."Billing Nos.")
                {
                    Caption = 'Billing Nos.';
                }
                field("Checkoff No."; Rec."Checkoff No.")
                {
                }
                field("Advice No."; Rec."Advice No.")
                {
                }
                field("Loan Reschedule"; Rec."Loan Reschedule")
                {
                }
                field("Loan Batch Posting Series"; Rec."Loan Batch Posting Series")
                {
                }
                field("Withdrawal Notice"; Rec."Withdrawal Notice")
                {
                }
                field("Guarantors Substitution"; Rec."Guarantors Substitution")
                {
                }
                field("Loan Recovery"; Rec."Loan Recovery")
                {
                }
                field("Product Factory"; Rec."Product Factory")
                {
                }
                field("Loan Security Nos."; Rec."Loan Security Nos.")
                {
                }
                field("Loan Security Collection Nos"; Rec."Loan Security Collection Nos")
                {
                }
                field("Loan No EM"; Rec."Loan No EM")
                {
                }
                field("Loan No SF"; Rec."Loan No SF")
                {
                }
                field("Loan No DEV"; Rec."Loan No DEV")
                {
                }
                field("Loan No JS"; Rec."Loan No JS")
                {
                }
                field("Loan No Jsort"; Rec."Loan No Jsort")
                {
                }
                field("Loan No Finje"; Rec."Loan No Finje")
                {
                }
                field("Loan No Inuka"; Rec."Loan No Inuka")
                {
                }
                field("Mortage Doc Release"; Rec."Mortage Doc Release")
                {
                }
                field("Loan No Web DEV"; Rec."Loan No Web DEV")
                {
                }
                field("Loan No Web SF"; Rec."Loan No Web SF")
                {
                }
                field("Loan No Web EM"; Rec."Loan No Web EM")
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

