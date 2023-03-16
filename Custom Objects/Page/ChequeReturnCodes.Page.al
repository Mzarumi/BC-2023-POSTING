page 52186289 "Cheque Return Codes"
{
    PageType = List;
    SourceTable = "Cheque Return Codes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Return Code"; Rec."Return Code")
                {
                }
                field("Code Interpretation"; Rec."Code Interpretation")
                {
                }
                field(Charges; Rec.Charges)
                {
                }
            }
        }
    }

    actions
    {
    }
}

