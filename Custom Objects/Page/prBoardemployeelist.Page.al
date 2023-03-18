page 52186631 "prBoard employee list"
{
    CardPageID = "prBoard Employees Card";
    PageType = List;
    SourceTable = "prBoard Employees";

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
                field(Mail; Rec.Mail)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Board Member"; Rec."Board Member")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                }
                field("Bank Branch"; Rec."Bank Branch")
                {
                }
                field("National ID"; Rec."National ID")
                {
                }
                field("Posting Group"; Rec."Posting Group")
                {
                }
                field("P.I.N"; Rec."P.I.N")
                {
                }
            }
        }
    }

    actions
    {
    }
}

