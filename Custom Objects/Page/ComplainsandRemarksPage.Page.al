page 52186678 "Complains and Remarks Page"
{
    PageType = Card;
    SourceTable = "Complain and Remarks";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Complaint Catagory"; Rec."Complaint Catagory")
                {
                }
                field(Complain; Rec.Complain)
                {
                    MultiLine = true;
                }
                field(Suggestion; Rec.Suggestion)
                {
                    MultiLine = true;
                }
                field("Proposed Resolutions"; Rec."Proposed Resolutions")
                {
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
    }
}

