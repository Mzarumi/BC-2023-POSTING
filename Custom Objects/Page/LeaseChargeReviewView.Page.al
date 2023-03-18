page 52186197 "Lease Charge Review View"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Lease Charge Review";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Line No."; Rec."Line No.")
                {
                }
                field("Lease No."; Rec."Lease No.")
                {
                }
                field("Charge No."; Rec."Charge No.")
                {
                }
                field("Charge Name"; Rec."Charge Name")
                {
                }
                field("Effect Date"; Rec."Effect Date")
                {
                }
                field("Old Amount[Rate]"; Rec."Old Amount[Rate]")
                {
                }
                field("Old Amount[Review Amount]"; Rec."Old Amount[Review Amount]")
                {
                }
                field("New [Rate Amount]"; Rec."New [Rate Amount]")
                {
                }
                field("New [Review Amount]"; Rec."New [Review Amount]")
                {
                }
            }
        }
    }

    actions
    {
    }
}

