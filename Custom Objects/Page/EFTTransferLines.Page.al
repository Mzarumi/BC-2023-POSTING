page 52185751 "EFT Transfer Lines"
{
    PageType = ListPart;
    SourceTable = "EFT Transfer Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Source Account Type"; Rec."Account Type")
                {
                    ValuesAllowed = Savings;
                }
                field("Source Account No."; Rec."Account No.")
                {
                }
                field("Source Account Name"; Rec."Account Name")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Charge Amount"; Rec."Charge Amount")
                {
                }
                field("Don't Charge"; Rec."Don't Charge")
                {
                }
                field("Amount Text"; Rec."Amount Text")
                {
                    Visible = false;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                }
                field("Bank Name"; Rec."Bank Name")
                {
                }
                field("External Account No."; Rec."External Account No.")
                {
                    Caption = 'Destination Account No.';
                }
                field("External Account Name"; Rec."External Account Name")
                {
                    Caption = 'Destination Account Name';
                }
                field("Over Drawn"; Rec."Over Drawn")
                {
                }
                field("Standing Order No"; Rec."Standing Order No")
                {
                }
                field("Standing Order Register No"; Rec."Standing Order Register No")
                {
                }
                field("Multiple Accounts"; Rec."Multiple Accounts")
                {
                }
                field("Excise Duty"; Rec."Excise Duty")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Account Type" := "Account Type"::Savings;
    end;
}

