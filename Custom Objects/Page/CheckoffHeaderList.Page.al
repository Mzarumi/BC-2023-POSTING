page 52185844 "Checkoff Header List"
{
    CardPageID = "Checkoff Header";
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Checkoff Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                }
                field("Time Entered"; Rec."Time Entered")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Posting Period"; Rec."Posting Period")
                {
                }
                field("Entered By"; Rec."Entered By")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field("Employer Name"; Rec."Employer Name")
                {
                }
                field("Total Count"; Rec."Total Count")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Posted; Rec.Posted)
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

