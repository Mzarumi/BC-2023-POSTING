page 52185471 "Created Sky Business Accounts"
{
    PageType = List;
    SourceTable = "Sky Business Accounts";
    SourceTableView = WHERE("Paid Initial Amount" = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Business Name"; Rec."Business Name")
                {
                }
                field("Business Location"; Rec."Business Location")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Activated At"; Rec."Activated At")
                {
                }
                field("Form Submitted"; Rec."Form Submitted")
                {
                }
                field("Paid Initial Amount"; Rec."Paid Initial Amount")
                {
                }
            }
        }
    }

    actions
    {
    }
}

