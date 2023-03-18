page 52185607 "HR OSSafety Rules"
{
    CardPageID = "HR OSSafety Rules Card";
    PageType = List;
    SourceTable = "HR OSSafety Rules";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Safety No"; Rec."Safety No")
                {
                }
                field("Safety Rules"; Rec."Safety Rules")
                {
                }
            }
        }
    }

    actions
    {
    }
}

