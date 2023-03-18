page 52186451 "DCS Vendor"
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
                field("MPESA Mobile No"; Rec."Transactional Mobile No")
                {
                    Caption = 'MPESA Mobile No';
                }
                field("BOSA Account No"; Rec."Member No.")
                {
                    Caption = 'BOSA Account No';
                }
                field("ID No."; Rec."ID No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

