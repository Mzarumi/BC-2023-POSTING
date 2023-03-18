page 52185836 "Posted EFT Transfer List"
{
    // CardPageID = "EFT Transfer Header";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "EFT Transfer Header";
    SourceTableView = WHERE(Status = FILTER(Transferred));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Record Total"; Rec."Record Total")
                {
                }
                field("Record Count"; Rec."Record Count")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
            {
            }
            systempart(Control13; MyNotes)
            {
            }
            systempart(Control14; Links)
            {
            }
        }
    }

    actions
    {
    }
}

