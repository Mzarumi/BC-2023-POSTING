page 52186278 "Sectoral Classification"
{
    DataCaptionFields = "Sub Sector Level2 Description";
    PageType = List;
    SourceTable = "Sectoral Classification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Main Sector"; Rec."Main Sector")
                {
                }
                field("Main Sector Description"; Rec."Main Sector Description")
                {
                }
                field("Sub Sector Level1"; Rec."Sub Sector Level1")
                {
                }
                field("Sub Sector Level1 Description"; Rec."Sub Sector Level1 Description")
                {
                }
                field("Sub Sector Level2"; Rec."Sub Sector Level2")
                {
                }
                field("Sub Sector Level2 Description"; Rec."Sub Sector Level2 Description")
                {
                }
            }
        }
    }

    actions
    {
    }
}

