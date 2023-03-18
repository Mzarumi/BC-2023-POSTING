page 52185742 "Fixed Deposit Notification Lis"
{
    PageType = List;
    SourceTable = "Fixed Deposit Notification Lis";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User Type"; Rec."User Type")
                {
                }
                field("User Id"; Rec."User Id")
                {
                }
                field("Fixed Deposit Type"; Rec."Fixed Deposit Type")
                {
                }
                field("Notification Type"; Rec."Notification Type")
                {
                }
                field("Notification Period"; Rec."Notification Period")
                {
                }
            }
        }
    }

    actions
    {
    }
}

