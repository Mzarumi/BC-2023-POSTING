page 52185817 "Bankers Application List"
{
    CardPageID = "Bankers Cheque Application";
    Editable = false;
    PageType = List;
    SourceTable = "Bankers Cheque Application";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Bank Account"; Rec."Bank Account")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

