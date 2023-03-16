page 52186646 "Member Change List"
{
    CardPageID = "Member Change Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Reactivate/Deactivate Header";
    SourceTableView = WHERE(Status = FILTER(Open | Pending | Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                    Visible = false;
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
    }
}

