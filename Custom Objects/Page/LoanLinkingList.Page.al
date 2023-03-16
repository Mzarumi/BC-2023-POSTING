page 52186418 "Loan Linking List"
{
    PageType = ListPart;
    SourceTable = "Loan Linking Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No"; Rec."Loan No")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Loan Linking No."; Rec."Loan Linking No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

