page 52186502 "HR Medical Claims List"
{
    CardPageID = "HR Medical Claims Card";
    PageType = List;
    SourceTable = "HR Medical Claims";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Member No"; Rec."Member No")
                {
                }
                field("Claim No"; Rec."Claim No")
                {
                }
                field("Claim Type"; Rec."Claim Type")
                {
                }
                field("Claim Date"; Rec."Claim Date")
                {
                }
                field("Patient Name"; Rec."Patient Name")
                {
                }
                field("Date of Service"; Rec."Date of Service")
                {
                }
                field("Amount Charged"; Rec."Amount Charged")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        Dependants: Record "HR Employee Kin";
}

