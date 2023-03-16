page 52186638 "HR Employee Transfer Effected"
{
    Editable = false;
    PageType = Card;
    SourceTable = "HR Employees";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("First Name"; Rec."First Name")
                {
                }
                field("Middle Name"; Rec."Middle Name")
                {
                }
                field("Last Name"; Rec."Last Name")
                {
                }
                field("Postal Address"; Rec."Postal Address")
                {
                }
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                }
                field("Job ID"; Rec."Job ID")
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                // field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                // {
                // }
                // field("Global Dimension 1 Name"; Rec."Global Dimension 1 Name")
                // {
                // }
                // field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                // {
                // }
                // field("Global Dimension 2 Name"; Rec."Global Dimension 2 Name")
                // {
                // }
            }
            part(Control16; "HR Emp Transfers")
            {
                Editable = false;
                SubPageLink = "Employee No" = FIELD("No.");
            }
        }
    }

    actions
    {
    }
}

