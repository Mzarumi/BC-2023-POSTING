page 52186566 "HR Medical Claims Card"
{
    PageType = Card;
    SourceTable = "HR Medical Claims";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Claim No"; Rec."Claim No")
                {
                    Editable = false;
                }
                field("Member No"; Rec."Member No")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                    Editable = false;
                }
                field("Claim Type"; Rec."Claim Type")
                {
                }
                field("Claim Date"; Rec."Claim Date")
                {
                }
                field("Patient Name"; Rec."Patient Name")
                {
                }
                field("Document Ref"; Rec."Document Ref")
                {
                }
                field("Date of Service"; Rec."Date of Service")
                {
                }
                field("Attended By"; Rec."Attended By")
                {
                }
                field("Amount Charged"; Rec."Amount Charged")
                {
                }
                field(Comments; Rec.Comments)
                {
                }
            }
        }
    }

    actions
    {
    }
}

