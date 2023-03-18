page 52185670 "Test Page"
{
    PageType = List;
    SourceTable = TestTable;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff No."; Rec."Staff No.")
                {
                }
                field("Full Name"; Rec."Full Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

