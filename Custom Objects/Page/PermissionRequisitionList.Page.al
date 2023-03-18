page 52186269 "Permission Requisition List"
{
    CardPageID = "Permission Requisition Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Permission Requisition";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Staff No"; Rec."Staff No")
                {
                }
                field("Full Name"; Rec."Full Name")
                {
                }
                field("Phone No"; Rec."Phone No")
                {
                }
                field("Employment Type"; Rec."Employment Type")
                {
                }
                field(Department; Rec.Department)
                {
                }
                field("Request Type"; Rec."Request Type")
                {
                }
                field("Date Captured"; Rec."Date Captured")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(User; Rec.User)
                {
                }
            }
        }
    }

    actions
    {
    }
}

