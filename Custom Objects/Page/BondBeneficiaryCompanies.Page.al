page 52185687 "Bond Beneficiary Companies"
{
    PageType = List;
    SourceTable = "Bond Company";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Company Code"; Rec."Company Code")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                }
                field(City; Rec.City)
                {
                }
                field("Cash Cover Required"; Rec."Cash Cover Required")
                {
                }
                field("Max. Perf. Bond without Securi"; Rec."Max. Perf. Bond without Securi")
                {
                }
            }
        }
    }

    actions
    {
    }
}

