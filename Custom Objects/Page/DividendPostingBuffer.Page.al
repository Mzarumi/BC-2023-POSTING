page 52185736 "Dividend Posting Buffer"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Dividend Posting Buffer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Product Type Name"; Rec."Product Type Name")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Loan No"; Rec."Loan No")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                }
                field("Bal. Account No."; Rec."Bal. Account No.")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
            }
        }
    }

    // actions
    // {
    //     area(creation)
    //     {
    //     }
    //     action("Generate Dividends")
    //     {
    //         Image = AgreementQuote;
    //         Promoted = true;
    //         PromotedCategory = Process;
    //     }
    //     separator(Action9)
    //     {
    //     }
    // }
}

