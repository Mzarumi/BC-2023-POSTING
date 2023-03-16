page 52185735 "Dividend Progression"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Dividend Progression";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account No"; Rec."Account No")
                {
                }
                field("Processing Date"; Rec."Processing Date")
                {
                }
                field("Dividend Calc. Method"; Rec."Dividend Calc. Method")
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
                field(Shares; Rec.Shares)
                {
                }
                field("Qualifying Shares"; Rec."Qualifying Shares")
                {
                }
                field("Gross Dividends"; Rec."Gross Dividends")
                {
                }
                field("Witholding Tax"; Rec."Witholding Tax")
                {
                }
                field("Net Dividends"; Rec."Net Dividends")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Year; Rec.Year)
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Dividend Process")
            {
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Codeunit "Dividend Process";
            }
        }
    }
}

