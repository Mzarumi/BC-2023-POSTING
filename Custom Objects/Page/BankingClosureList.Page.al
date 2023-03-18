page 52186349 "Banking Closure List"
{
    CardPageID = "Banking Account Closure";
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Banking Account Closure";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Reason For Account Closure"; Rec."Reason For Account Closure")
                {
                }
                field("Account Balance"; Rec."Account Balance")
                {
                }
                field("Closure Date"; Rec."Closure Date")
                {
                }
                field("User Id"; Rec."User Id")
                {
                }
                field(Closed; Rec.Closed)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

