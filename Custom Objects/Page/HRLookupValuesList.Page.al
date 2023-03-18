page 52185593 "HR Lookup Values List"
{
    CardPageID = "HR Lookup Values Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Lookup Values";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = true;
                ShowCaption = false;
                field(Type; Rec.Type)
                {
                    Enabled = false;
                }
                field("Code"; Rec.Code)
                {
                    Enabled = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

