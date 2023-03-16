page 52185762 "Member Collaterals"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Collateral;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Member No"; Rec."Member No")
                {
                }
                field("Date Collateralised"; Rec."Date Collateralised")
                {
                }
                field("Collateral Type"; Rec."Collateral Type")
                {
                }
                field("Collateral Value"; Rec."Collateral Value")
                {
                }
                field("Registration/Certificate No."; Rec."Registration/Certificate No.")
                {
                }
                field("Internal Account(Lien)"; Rec."Internal Account(Lien)")
                {
                }
            }
        }
    }

    actions
    {
    }
}

