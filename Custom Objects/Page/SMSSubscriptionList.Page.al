page 52185678 "SMS Subscription List"
{
    CardPageID = "SMS Account Subscription";
    Editable = false;
    PageType = List;
    SourceTable = "SMS Account Subscription";

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
                field("Member No"; Rec."Member No")
                {
                }
                field(SMS; Rec.SMS)
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
            }
        }
    }

    actions
    {
    }
}

