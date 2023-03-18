page 52186498 "HR Medical Schemes Card"
{
    PageType = Card;
    PromotedActionCategories = 'Manage,Process,Report,Members';
    SourceTable = "HR Medical Schemes";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Scheme No"; Rec."Scheme No")
                {
                }
                field("Medical Insurer"; Rec."Medical Insurer")
                {
                }
                field("Insurer Name"; Rec."Insurer Name")
                {
                    Editable = false;
                }
                field("Scheme Name"; Rec."Scheme Name")
                {
                }
                field("In-patient limit"; Rec."In-patient limit")
                {
                }
                field("Out-patient limit"; Rec."Out-patient limit")
                {
                }
                field("Area Covered"; Rec."Area Covered")
                {
                }
                field("Dependants Included"; Rec."Dependants Included")
                {
                }
                field(Comments; Rec.Comments)
                {
                }
            }
            part(Control5; "HR Medical Scheme Rates")
            {
                SubPageLink = "Medical Scheme No." = FIELD("Scheme No");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Medical Scheme Members")
                {
                    Caption = 'Medical Scheme Members';
                    Image = PersonInCharge;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "HR Medical Scheme Members List";
                    RunPageLink = "Scheme No" = FIELD("Scheme No");
                }
            }
        }
    }
}

