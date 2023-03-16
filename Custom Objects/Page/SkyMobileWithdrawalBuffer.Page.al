page 52185444 "Sky Mobile Withdrawal Buffer"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Mobile Withdrawals Buffer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Trace ID"; Rec."Trace ID")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Withdrawal Type"; Rec."Withdrawal Type")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field(Reversed; Rec.Reversed)
                {
                }
                field("Date Reversed"; Rec."Date Reversed")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Session ID"; Rec."Session ID")
                {
                }
                field("Reversed By"; Rec."Reversed By")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Reverse Transaction")
            {

                trigger OnAction()
                begin
                    StatusPermissions.Reset;
                    StatusPermissions.SetRange("Reverse Sky Transactions", true);
                    StatusPermissions.SetRange("User ID", UserId);
                    if not StatusPermissions.FindFirst then
                        Error('You do not have the following permission: "Reverse Sky Transactions"');

                    Rec.TestField(Posted, false);
                    Rec.TestField(Reversed, false);

                    //if SkyMbanking.ReverseWithdrawalRequest("Trace ID") then
                    //     Message('Reversed Successfully')
                    // else
                    //     Message('Not Reversed');
                end;
            }
            action("Insert MPESA Withdrawal")
            {

                trigger OnAction()
                begin

                    Withdrawals.Reset;
                    Withdrawals.SetRange("Trace ID", Rec."Trace ID");
                    //if Withdrawals.FindFirst then
                    //REPORT.Run(50060, true, false, Withdrawals);
                end;
            }
        }
    }

    var
        // SkyMbanking: Codeunit "Sky Mbanking";
        StatusPermissions: Record "Sky Permissions";
        Withdrawals: Record "Mobile Withdrawals Buffer";
}

