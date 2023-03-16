page 52185598 "HR Committees"
{
    PageType = List;
    SourceTable = "HR Committees";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Roles; Rec.Roles)
                {
                }
                field("Monetary Benefit?"; Rec."Monetary Benefit?")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Committee)
            {
                Caption = 'Committee';
                action(Members)
                {
                    Caption = 'Members';
                    RunObject = Page "HR Commitee Members";
                    RunPageLink = Committee = FIELD(Code);
                }
            }
        }
    }
}

