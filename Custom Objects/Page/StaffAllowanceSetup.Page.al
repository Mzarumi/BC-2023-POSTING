page 52186272 "Staff Allowance Setup"
{
    PageType = List;
    Permissions = TableData "Staff Allowance Setup" = rimd;
    SourceTable = "Staff Allowance Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Tax %"; Rec."Tax %")
                {
                }
                field("Tax GL"; Rec."Tax GL")
                {
                }
                field("Allowance GL"; Rec."Allowance GL")
                {
                }
                field("Exempt Amount"; Rec."Exempt Amount")
                {
                }
                field("Allowance Amount"; Rec."Allowance Amount")
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

