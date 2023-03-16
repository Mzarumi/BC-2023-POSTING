page 52185504 "Coop ATM Transactions"
{
    Editable = true;
    PageType = List;
    SourceTable = "Coop ATM Transaction";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Trace ID"; Rec."Document No.")
                {
                    Editable = false;
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    Editable = false;
                }
                field("Member Account"; Rec."Member Account")
                {
                    Editable = false;
                }
                field(Description; Rec."Posting Description")
                {
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    Editable = true;

                    trigger OnValidate()
                    begin
                        // IF (Reversed) THEN ERROR('Transaction has already been reversed');
                        // IF "Transaction Type" <> '1420' THEN ERROR('Transaction type must be 1420');
                        //
                        // SkyPermissions.RESET;
                        // SkyPermissions.SETRANGE("User ID",USERID);
                        // SkyPermissions.SETRANGE("Release ATM Transactions",TRUE);
                        // IF NOT SkyPermissions.FINDFIRST THEN ERROR('You must have permission Realease ATM Transactions in Sky Permissions');
                    end;
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    Editable = false;
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                    Editable = false;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    Editable = false;
                }
                field(Reversed; Rec.Reversed)
                {
                    Editable = false;
                }
                field("Date Reversed"; Rec."Date Reversed")
                {
                    Editable = false;
                }
                field("Time Reversed"; Rec."Time Reversed")
                {
                    Editable = false;
                }
                field("Reversed By"; Rec."Reversed By")
                {
                    Editable = false;
                }
                field("Reversal ID"; Rec."Reversal ID")
                {
                    Editable = false;
                }
                field("Description 1"; Rec."Description 1")
                {
                    Editable = false;
                }
                field("Description 2"; Rec."Description 2")
                {
                    Editable = false;
                }
                field(Skipped; Rec.Skipped)
                {
                    Editable = false;
                }
                field("Service Name"; Rec."Service Name")
                {
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field("ATM No."; Rec."ATM No.")
                {
                    Editable = false;
                }
                field(Location; Rec.Location)
                {
                    Editable = false;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    Editable = false;
                }
                field(Activity; Rec.Activity)
                {
                    Editable = false;
                }
                field("Original Transaction ID"; Rec."Original Transaction ID")
                {
                    Editable = false;
                }
                field("Channel Code"; Rec."Channel Code")
                {
                    Editable = false;
                }
                field("Terminal Code"; Rec."Terminal Code")
                {
                    Editable = false;
                }
                field("Total Account Debit"; Rec."Total Account Debit")
                {
                    Editable = false;
                }
                field("Total Charges"; Rec."Total Charges")
                {
                    Editable = false;
                }
                field("Coop Fee"; Rec."Coop Fee")
                {
                    Editable = false;
                }
                field("Sacco Fee"; Rec."Sacco Fee")
                {
                    Editable = false;
                }
                field("Sacco Excise Duty"; Rec."Sacco Excise Duty")
                {
                    Editable = false;
                }
                field(Remarks; Rec.Remarks)
                {
                    Editable = false;
                }
                field("Transaction ID"; Rec."Transaction ID")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    var
        CoopProcessing: Codeunit "Coop Processing";
        MobileBanking: Codeunit MobileBanking;
        SkyPermissions: Record "Sky Permissions";
        CoopATMTransaction: Record "Coop ATM Transaction";
}

