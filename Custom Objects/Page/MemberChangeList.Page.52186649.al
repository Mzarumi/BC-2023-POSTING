page 52186649 "+ Member Change List"
{
    CardPageID = "Member Change Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Reactivate/Deactivate Header";
    SourceTableView = WHERE(Status = CONST(Processed));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Application Time"; Rec."Application Time")
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Status Change Reason"; Rec."Status Change Reason")
                {
                }
                field("Member Change Reason"; Rec."Member Change Reason")
                {
                }
                field("Account Status"; Rec."Account Status")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control3; Notes)
            {
            }
            systempart(Control2; MyNotes)
            {
            }
            systempart(Control1; Links)
            {
            }
        }
    }

    actions
    {
    }
}

