page 52185793 "MSACCO SMS Subscriptions"
{
    PageType = List;
    SourceTable = "Notification Subscription";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field(AccountNo; Rec.AccountNo)
                {
                }
                field(Source; Rec.Source)
                {
                }
                field("SMS Subscription"; Rec."SMS Subscription")
                {
                }
                field("Email Subscription"; Rec."Email Subscription")
                {
                }
            }
        }
    }

    actions
    {
    }
}

