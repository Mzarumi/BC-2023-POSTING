page 52186277 "HR Fleet List"
{
    Caption = '';
    CardPageID = "Fleet Card";
    PageType = List;
    SourceTable = "Fixed Asset";

    layout
    {
        area(content)
        {
            repeater(Control14)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field("Maintenance Vendor No."; Rec."Maintenance Vendor No.")
                {
                    Visible = true;
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                    Visible = true;
                }
                field("FA Class Code"; Rec."FA Class Code")
                {
                    Visible = false;
                }
                field("FA Subclass Code"; Rec."FA Subclass Code")
                {
                    Visible = false;
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    Visible = false;
                }
                field("Budgeted Asset"; Rec."Budgeted Asset")
                {
                    Visible = false;
                }
                field("Search Description"; Rec."Search Description")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control2; Links)
            {
                Visible = false;
            }
            systempart(Control1; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
    }
}

