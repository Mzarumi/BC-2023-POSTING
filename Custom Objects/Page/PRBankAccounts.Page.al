page 52185611 "PR Bank Accounts"
{
    PageType = List;
    SourceTable = "PR Bank Accounts";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Bank Code"; Rec."Bank Code")
                {
                }
                field("Bank Name"; Rec."Bank Name")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Branches)
            {
                Image = BankAccount;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "PR Bank Branches";
                RunPageLink = "Bank Code" = FIELD("Bank Code");
            }
            action(Import)
            {
                Caption = 'Import';
                Promoted = true;
                PromotedCategory = Category4;
                ////RunObject = XMLport XMLport50076;
            }
        }
    }
}

