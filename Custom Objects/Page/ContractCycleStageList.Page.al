page 52186033 "Contract Cycle Stage List"
{
    PageType = List;
    SourceTable = "Contract Cycle Stage";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sales Cycle Code"; Rec."Sales Cycle Code")
                {
                    Visible = false;
                }
                field("Contract Line Type"; Rec."Contract Line Type")
                {
                }
                field(Stage; Rec.Stage)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Completed %"; Rec."Completed %")
                {
                }
                field("Activity Code"; Rec."Activity Code")
                {
                }
                field("Quote Required"; Rec."Quote Required")
                {
                }
                field("Allow Skip"; Rec."Allow Skip")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("No. of Opportunities"; Rec."No. of Opportunities")
                {
                }
                field("Estimated Value (LCY)"; Rec."Estimated Value (LCY)")
                {
                }
                field("Calcd. Current Value (LCY)"; Rec."Calcd. Current Value (LCY)")
                {
                }
                field("Average No. of Days"; Rec."Average No. of Days")
                {
                }
                field("Date Filter"; Rec."Date Filter")
                {
                }
                field("Date Formula"; Rec."Date Formula")
                {
                }
                field("Payment Expected"; Rec."Payment Expected")
                {
                }
                field("%age of Payment"; Rec."%age of Payment")
                {
                }
            }
        }
    }

    actions
    {
    }
}

