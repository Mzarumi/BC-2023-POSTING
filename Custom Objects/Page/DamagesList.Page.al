page 52186076 "Damages List"
{
    Caption = 'Damages List';
    PageType = List;
    SourceTable = Damages;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Damages; Rec.Damages)
                {
                }
                field("Estimated Cost"; Rec."Estimated Cost")
                {
                }
            }
        }
    }

    actions
    {
    }
}

