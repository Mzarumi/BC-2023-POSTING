page 52186712 "Delegate Commitee"
{
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Salutation Tittles";
    SourceTableView = WHERE(Type = CONST("Delegate Committee"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Type; Rec.Type)
                {
                }
            }
        }
    }

    actions
    {
    }
}

