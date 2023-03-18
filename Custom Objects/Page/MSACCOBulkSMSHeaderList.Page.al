page 52185778 "M-SACCO Bulk SMS Header List"
{
    CardPageID = "MSACCO Bulk SMS Header";
    Editable = false;
    PageType = List;
    SourceTable = "M-SACCO Bulk SMS Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field(Message_; Rec.Message_)
                {
                }
                field("SMS Type"; Rec."SMS Type")
                {
                }
                field("Date Entered"; Rec."Date Entered")
                {
                }
                field("Time Entered"; Rec."Time Entered")
                {
                }
                field("SMS Status"; Rec."SMS Status")
                {
                }
            }
        }
    }

    actions
    {
    }
}

