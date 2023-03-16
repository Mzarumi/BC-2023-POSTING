page 52186275 "Staff Allowance Lines"
{
    PageType = List;
    SourceTable = "Staff Allowance Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Header Code"; Rec."Header Code")
                {
                }
                field("Allowance Code"; Rec."Allowance Code")
                {
                }
                field("Allowance Description"; Rec."Allowance Description")
                {
                }
                field("Allowance Amount"; Rec."Allowance Amount")
                {
                }
                field("Exempt Amount"; Rec."Exempt Amount")
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
                field("Pay to Savings Account"; Rec."Pay to Savings Account")
                {
                }
            }
        }
    }

    actions
    {
    }
}

