page 52186428 "Financilal Appraisal"
{
    PageType = List;
    SourceTable = "Financial Appraisal setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Classifiaction Code"; Rec."Classifiaction Code")
                {
                }
                field("Financial Classifiaction"; Rec."Financial Classifiaction")
                {
                }
            }
        }
    }

    actions
    {
    }
}

