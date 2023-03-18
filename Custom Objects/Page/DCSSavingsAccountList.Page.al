page 52186439 "DCS Savings Account List"
{
    PageType = List;
    SourceTable = "Savings Accounts";
    SourceTableView = WHERE("Salary Through FOSA" = FILTER(true),
                            Status = FILTER(Active),
                            "Transactional Mobile No" = FILTER(<> ''));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Loan Disbursement Account"; Rec."Loan Disbursement Account")
                {
                }
            }
        }
    }

    actions
    {
    }
}

