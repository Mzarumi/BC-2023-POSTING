page 52186627 "HR Head of Departments Card"
{
    PageType = Card;
    SourceTable = "HR Heads of Departments";

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General';
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
            }
            systempart(Control12; Notes)
            {
            }
        }
    }

    actions
    {
    }
}

