page 52185624 "prMembership Groups"
{
    PageType = List;
    SourceTable = "prMembership Groups";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Group No"; Rec."Group No")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Comments; Rec.Comments)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Member Details")
            {
                Caption = 'Member Details';
                action("Institutional Listing")
                {
                    Caption = 'Institutional Listing';
                    Image = IndustryGroups;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "prInstitutional Membership";
                    RunPageLink = "Group No" = FIELD("Group No");
                }
            }
        }
    }
}

