page 52186073 "Project Donors"
{
    PageType = Card;
    SourceTable = "Project Donors";

    layout
    {
        area(content)
        {
            repeater(Control10)
            {
                ShowCaption = false;
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Caption = 'Donor code';
                }
                field("Donor Name"; Rec."Donor Name")
                {
                }
                field(Percentage; Rec.Percentage)
                {
                }
                field("Allowed Indirect Cost"; Rec."Allowed Indirect Cost")
                {
                }
                field("Indirect Cost"; Rec."Indirect Cost")
                {
                    Caption = 'Allow Indirect Cost';
                }
                field("Expected Donation"; Rec."Expected Donation")
                {
                }
                field("Donated Amount"; Rec."Donated Amount")
                {
                }
                field(Balance; Rec.Balance)
                {
                }
                field("Grant No"; Rec."Grant No")
                {
                }
            }
        }
    }

    actions
    {
    }
}

