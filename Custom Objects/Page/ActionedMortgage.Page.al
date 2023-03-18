page 52185487 "Actioned Mortgage"
{
    CardPageID = "Mortgage Card";
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Sky Mortgage";
    SourceTableView = WHERE(Actioned = CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Session ID"; Rec."Session ID")
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Member Number"; Rec."Member Number")
                {
                }
                field("Full Name"; Rec."Full Name")
                {
                }
                field("Age Group"; Rec."Age Group")
                {
                }
                field("Source Of Income"; Rec."Source Of Income")
                {
                }
                field("Gross Monthly Income"; Rec."Gross Monthly Income")
                {
                }
                field("County Of Residence"; Rec."County Of Residence")
                {
                }
                field(Email; Rec.Email)
                {
                }
                field(Actioned; Rec.Actioned)
                {
                }
                field("Entry Time"; Rec."Entry Time")
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Phone Number"; Rec."Phone Number")
                {
                }
                field("Actioned By"; Rec."Actioned By")
                {
                }
                field("Date Actioned"; Rec."Date Actioned")
                {
                }
                field("Time Actioned"; Rec."Time Actioned")
                {
                }
            }
        }
    }

    actions
    {
    }
}

