page 52185701 "Virtual Registration Fact Box"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = CardPart;
    SourceTable = "Virtual Registrations";

    layout
    {
        area(content)
        {
            field("Full Names"; Rec."Full Names")
            {
            }
            field(MyPicture; Rec.MyPicture)
            {
            }
        }
    }

    actions
    {
    }

    var
        Members: Record Members;
}

