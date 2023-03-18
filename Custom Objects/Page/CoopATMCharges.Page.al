page 52185506 "Coop ATM Charges"
{
    PageType = List;
    SourceTable = "Coop ATM Charges";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Minimum; Rec.Minimum)
                {
                }
                field(Maximum; Rec.Maximum)
                {
                }
                field("Bank Commission"; Rec."Bank Commission")
                {
                }
                field("Sacco Commission"; Rec."Sacco Commission")
                {
                }
            }
        }
    }

    actions
    {
    }
}

