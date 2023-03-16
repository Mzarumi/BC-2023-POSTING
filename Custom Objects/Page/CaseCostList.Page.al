page 52186084 "Case Cost List"
{
    Caption = 'Case Cost List';
    PageType = List;
    SourceTable = "Case Cost List";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case Item"; Rec."Case Item")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Cost; Rec.Cost)
                {
                }
            }
        }
    }

    actions
    {
    }
}

