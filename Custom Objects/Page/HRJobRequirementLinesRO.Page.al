page 52185521 "HR Job Requirement Lines(RO)"
{
    Caption = '<HR Job Requirements';
    CardPageID = "HR Job Requirements";
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "HR Job Requirements";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Qualification Type"; Rec."Qualification Type")
                {
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    Editable = false;
                }
                field(Priority; Rec.Priority)
                {
                }
                field("Minimum Score"; Rec."Minimum Score")
                {
                }
                field(Mandatory; Rec.Mandatory)
                {
                }
            }
        }
    }

    actions
    {
    }
}

