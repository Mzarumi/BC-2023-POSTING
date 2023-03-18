page 52186283 "Cheque Discounting"
{
    DeleteAllowed = false;
    Editable = true;
    PageType = Card;
    SourceTable = "Cashier Transactions";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                }
                field("Account No"; Rec."Account No")
                {
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    Editable = false;
                }
                field(Cashier; Rec.Cashier)
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Discounting Amount"; Rec."Discounting Amount")
                {
                    Caption = 'Discounting Amount';
                }
                field("Discounted Amount"; Rec."Discounted Amount")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Post Cheque Discounting")
            {
                Image = MakeAgreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    SaccoT: Codeunit "Sacco Transactions";
                begin
                    //here//SaccoT.ChequeDiscounting(Rec);
                end;
            }
        }
    }

    var
        DiscountingAmount: Decimal;
}

