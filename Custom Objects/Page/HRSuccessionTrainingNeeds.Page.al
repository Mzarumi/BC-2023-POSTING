page 52186471 "HR Succession Training Needs"
{
    PageType = ListPart;
    SourceTable = "HR Succession Training Needs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Need Code"; Rec."Need Code")
                {
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Acquired Qualification Type"; Rec."Acquired Qualification Type")
                {
                    Caption = 'Qualification Type to be acquired';
                    Editable = false;
                }
                field("Acquired Qualification Code"; Rec."Acquired Qualification Code")
                {
                    Caption = 'Qualification Code to be acquired';
                    Editable = false;
                }
                field("Qualification Description"; Rec."Qualification Description")
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

