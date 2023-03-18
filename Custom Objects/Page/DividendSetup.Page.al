page 52185731 "Dividend Setup"
{
    PageType = Card;
    SourceTable = "Dividend SetUp";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Status; Rec.Status)
                {
                }
            }
            group("Period Filter")
            {
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
            }
            group(Loans)
            {
                field("Dividend Discounting"; Rec."Dividend Discounting")
                {
                }
                field("Defaulter Recovery"; Rec."Defaulter Recovery")
                {
                }
                field("Loan Arrears Recovery"; Rec."Loan Arrears Recovery")
                {
                    Visible = false;
                }
                field("Dividend Instructions"; Rec."Dividend Instructions")
                {
                }
            }
            group(Savings)
            {
                field("Minimum Shares Recovery"; Rec."Minimum Shares Recovery")
                {
                    Visible = false;
                }
                field("Minimum Shares Account"; Rec."Minimum Shares Account")
                {
                    Visible = false;
                }
                field("Minimum Capitalized"; Rec."Minimum Capitalized")
                {
                }
            }
            group(Charges)
            {
                field("Transaction Type"; Rec."Transaction Type")
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
            //Error(ErrorOnRestrictViewTxt, UserId, TableCaption);
        end;
    end;
}

