page 52185749 "EFT Transfer List"
{
    //CardPageID = "EFT Transfer Header";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "EFT Transfer Header";
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
    }

    actions
    {
    }
}

