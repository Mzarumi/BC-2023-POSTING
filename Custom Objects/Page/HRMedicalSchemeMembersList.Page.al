page 52186501 "HR Medical Scheme Members List"
{
    CardPageID = "HR Medical Scheme Members Card";
    PageType = List;
    SourceTable = "HR Medical Scheme Members";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Scheme No"; Rec."Scheme No")
                {
                    Editable = false;
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("First Name"; Rec."First Name")
                {
                }
                field("Last Name"; Rec."Last Name")
                {
                }
                field(Designation; Rec.Designation)
                {
                }
                field(Department; Rec.Department)
                {
                }
                field("Scheme Join Date"; Rec."Scheme Join Date")
                {
                }
                field("Cumm.Amount Spent"; Rec."Cumm.Amount Spent")
                {
                }
            }
        }
    }

    actions
    {
    }
}

