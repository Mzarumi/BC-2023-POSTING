page 52185430 "Sky Paybill Transactions"
{
    CardPageID = "Sky Update Paybill ID";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Sky Transactions";
    SourceTableView = WHERE("Transaction Type" = CONST(Paybill));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Ledger Entries"; Rec."Ledger Entries")
                {
                }
                field("Transaction ID"; Rec."Transaction ID")
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Member Account"; Rec."Member Account")
                {
                }
                field("Paybill Member ID"; Rec."Paybill Member ID")
                {
                }
                field("Vendor Commission"; Rec."Vendor Commission")
                {
                }
                field("Sacco Fee"; Rec."Sacco Fee")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Control31; Rec."Needs Change")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Old Transaction Date"; Rec."Old Transaction Date")
                {
                }
                field(Reversed; Rec.Reversed)
                {
                }
                field("Date Reversed"; Rec."Date Reversed")
                {
                }
                field("Time Reversed"; Rec."Time Reversed")
                {
                }
                field("Reversed By"; Rec."Reversed By")
                {
                }
                field("Reversal ID"; Rec."Reversal ID")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                }
                field("Session ID"; Rec."Session ID")
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field(Keyword; Rec.Keyword)
                {
                }
                field("Mobile No."; Rec."Mobile No.")
                {
                }
                field("Statement Max Rows"; Rec."Statement Max Rows")
                {
                }
                field("Statement Start Date"; Rec."Statement Start Date")
                {
                }
                field("Statement End Date"; Rec."Statement End Date")
                {
                }
                field("Account to Check"; Rec."Account to Check")
                {
                }
                field("Changed By"; Rec."Changed By")
                {
                }
                field("Date Changed"; Rec."Date Changed")
                {
                }
                field("Entry No."; Rec."Entry No.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Paybill")
            {
                RunObject = Page "Sky Update Paybill ID";
                RunPageLink = "Entry No." = FIELD("Entry No.");
            }
            action("Needs Change")
            {
                Visible = false;

                trigger OnAction()
                var
                    StatusChangePermissions: Record "Sky Permissions";
                begin
                    StatusChangePermissions.Reset;
                    StatusChangePermissions.SetRange("User ID", UserId);
                    StatusChangePermissions.SetRange("Update Paybill Transaction", true);
                    if not StatusChangePermissions.FindFirst then
                        Error('You do not have the following permission: "Update Paybill Transaction"');

                    Rec.TestField(Posted, false);
                    if Confirm('Are you sure you want to mark this transaction as needs change?') then begin
                        Rec."Needs Change" := true;
                        Rec.Modify;
                    end;
                end;
            }
        }
    }
}

