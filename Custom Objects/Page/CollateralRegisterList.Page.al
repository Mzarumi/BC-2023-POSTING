page 52186413 "Collateral Register - List"
{
    CardPageID = "Collateral Register Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Securities Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Collateral Ref No."; Rec."Collateral Ref No.")
                {
                }
                field(Collateral; Rec.Collateral)
                {
                    Visible = false;
                }
                field("Collateral Value"; Rec."Collateral Value")
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field("Date Captured"; Rec."Date Captured")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control5; Notes)
            {
            }
            systempart(Control6; MyNotes)
            {
            }
            systempart(Control7; Links)
            {
            }
        }
    }

    actions
    {
    }
}

