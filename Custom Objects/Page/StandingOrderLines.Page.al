page 52185747 "Standing Order Lines"
{
    PageType = ListPart;
    SourceTable = "Standing Order Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Destination Account Type"; Rec."Destination Account Type")
                {
                    ValuesAllowed = Internal, External, Credit;
                }
                field("Destination Account No."; Rec."Destination Account No.")
                {
                }
                field("Destination Account Name"; Rec."Destination Account Name")
                {
                    Editable = true;
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Amount Deducted"; Rec."Amount Deducted")
                {
                    Editable = false;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    Editable = false;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    Editable = true;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        DestinationTypeControl;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Destination Account Type" := Rec."Destination Account Type"::External;
    end;

    var
        BankEdit: Boolean;
        BranchEdit: Boolean;
        BankAccountNo: Boolean;

    //[Scope('Internal')]
    procedure DestinationTypeControl()
    begin
        case Rec."Destination Account Type" of
            Rec."Destination Account Type"::External:
                begin
                    BankEdit := true;
                    BranchEdit := true;
                    BankAccountNo := true;
                end;

            Rec."Destination Account Type"::Internal, Rec."Destination Account Type"::Credit:
                begin
                    BankEdit := false;
                    BranchEdit := false;
                    BankAccountNo := false;
                end;
        end;
    end;
}

