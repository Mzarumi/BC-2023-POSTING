page 52186612 "HR Emp. Login Management Card"
{
    Caption = 'HR Employee Login Management Card';
    PageType = Card;
    SourceTable = "HR Employee Login Management";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    Enabled = false;
                }
                field("Fingerprint ID"; Rec."Fingerprint ID")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field(Username; Rec.Username)
                {
                }
                field(Password; Rec.Password)
                {
                }
                field("Rate Per Shift"; Rec."Rate Per Shift")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
            }
            systempart(Control10; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("HR Shift Assignment")
                {
                    Caption = 'HR Shift Assignment';
                    Image = ReopenPeriod;
                    RunObject = Page "HR Shift Assignment List";
                    RunPageLink = "Staff No." = FIELD("Staff No.");
                }
            }
        }
    }
}

