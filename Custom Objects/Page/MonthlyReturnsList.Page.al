page 52186674 "Monthly Returns List"
{
    Editable = false;
    PageType = List;
    SourceTable = "Delegates Monthly Returns";
    SourceTableView = WHERE("Caption Type" = FILTER(<> 'TOTAL_BRANCH_MEMBERS'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Caption Type"; Rec."Caption Type")
                {
                }
                field(Caption; Rec.Caption)
                {
                }
                field("Records Submitted"; Rec."Records Submitted")
                {
                }
            }
        }
    }

    actions
    {
    }
}

