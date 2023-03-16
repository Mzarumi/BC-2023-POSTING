page 52186273 "Staff Member List"
{
    PageType = List;
    SourceTable = "Staff Members";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Allowance Grade"; Rec."Allowance Grade")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Status Change Date"; Rec."Status Change Date")
                {
                }
                field("Status Changed By"; Rec."Status Changed By")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Savings Account"; Rec."Savings Account")
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
        UserSetup.GetDefaultSalesAmountApprovalLimit();
    end;

    var
        UserSetup: Record "User Setup";
}

