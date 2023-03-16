page 52186547 "HR Appraisal Jnl. Template"
{
    Caption = 'Leave Jnl. Template List';
    Editable = true;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Template';
    SourceTable = "HR Appraisal Journal Template";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Name; Rec.Name)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Source Code"; Rec."Source Code")
                {
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    Visible = true;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Template)
            {
                Caption = 'Template';
                action("&Batches")
                {
                    Caption = '&Batches';
                    Image = ChangeBatch;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "HR Leave Batches";
                    RunPageLink = "Journal Template Name" = FIELD(Name);
                }
            }
        }
    }
}

