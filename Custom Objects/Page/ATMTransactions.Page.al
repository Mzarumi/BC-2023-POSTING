page 52186422 "ATM Transactions"
{
    Editable = false;
    PageType = List;
    SourceTable = "ATM Transactions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Trace ID"; Rec."Trace ID")
                {
                }
                field("Posting Date"; Rec."Posting Date")
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
                field("Posting S"; Rec."Posting S")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Unit ID"; Rec."Unit ID")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Trans Time"; Rec."Trans Time")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field(Source; Rec.Source)
                {
                }
                field(Reversed; Rec.Reversed)
                {
                }
                field("Reversed Posted"; Rec."Reversed Posted")
                {
                }
                field("Reversal Trace ID"; Rec."Reversal Trace ID")
                {
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                }
                field("Withdrawal Location"; Rec."Withdrawal Location")
                {
                }
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Transaction Type Charges"; Rec."Transaction Type Charges")
                {
                }
                field("Card Acceptor Terminal ID"; Rec."Card Acceptor Terminal ID")
                {
                }
                field("ATM Card No"; Rec."ATM Card No")
                {
                }
                field("Customer Names"; Rec."Customer Names")
                {
                }
                field("Process Code"; Rec."Process Code")
                {
                }
                field("Is Coop Bank"; Rec."Is Coop Bank")
                {
                }
                field("POS Vendor"; Rec."POS Vendor")
                {
                }
                field("Reference No"; Rec."Reference No")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Reverse Mobile Transaction")
            {

                trigger OnAction()
                begin

                    SkyPermissions.Reset;
                    SkyPermissions.SetRange("User ID", UserId);
                    SkyPermissions.SetRange("Reverse Sky Transactions", true);
                    if not SkyPermissions.FindFirst then begin
                        Error('You do not have the permission to Reverse Mpesa Transactions');
                    end;


                    if Confirm('Are you sure you want Reverse this transaction?') then begin
                        Rec.TestField(Reversed, false);
                        Rec.TestField(Posted, false);

                        Rec.TestField(Source, Rec.Source::"M-PESA");
                        SkyMbanking.ReverseWithdrawalRequest(Rec."Trace ID");

                    end;
                end;
            }
            action("Undo Reversal")
            {

                trigger OnAction()
                begin

                    SkyPermissions.Reset;
                    SkyPermissions.SetRange("User ID", UserId);
                    SkyPermissions.SetRange("Reverse Sky Transactions", true);
                    if not SkyPermissions.FindFirst then begin
                        Error('You do not have the permission to Reverse Mpesa Transactions');
                    end;


                    if Confirm('Are you sure you want Reverse this transaction?') then begin
                        Rec.TestField(Reversed, true);
                        Rec.TestField(Posted, true);

                        Rec.TestField(Source, Rec.Source::"M-PESA");
                        SkyMbanking.UndoReversal(Rec."Trace ID");

                    end;
                end;
            }
        }
    }

    var
        SkyPermissions: Record "Sky Permissions";
        SkyMbanking: Codeunit "Sky Mbanking";
}

