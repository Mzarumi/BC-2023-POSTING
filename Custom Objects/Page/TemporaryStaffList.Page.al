page 52185658 "Temporary Staff List"
{
    Caption = 'Terminal Staff List';
    PageType = List;
    SourceTable = "HR Employees";

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field(City; Rec.City)
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field(Gender; Rec.Gender)
                {
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                }
                field("Contract Type"; Rec."Contract Type")
                {
                }
                field("Job ID"; Rec."Job ID")
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                field(DateOfBirth; Rec.DateOfBirth)
                {
                }
                field("Contract Location"; Rec."Contract Location")
                {
                }
                field("PIN No."; Rec."PIN No.")
                {
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                }
                // field("Date Of Join"; Rec."Date Of Join")
                // {
                // }
            }
        }
    }

    actions
    {
    }
}

