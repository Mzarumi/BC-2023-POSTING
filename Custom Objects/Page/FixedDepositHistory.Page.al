page 52186291 "Fixed Deposit History"
{
    Editable = false;
    PageType = List;
    SourceTable = "Fixed Deposit History";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account No."; Rec."Account No.")
                {
                }
                field("Registration Date"; Rec."Registration Date")
                {
                }
                field("Fixed Deposit Type"; Rec."Fixed Deposit Type")
                {
                }
                field("FD Maturity Date"; Rec."FD Maturity Date")
                {
                }
                field("Neg. Interest Rate"; Rec."Neg. Interest Rate")
                {
                }
                field("FD Duration"; Rec."FD Duration")
                {
                }
                field("FD Maturity Instructions"; Rec."FD Maturity Instructions")
                {
                }
                field("Interest Earned"; Rec."Interest Earned")
                {
                }
                field("Fixed Amount"; Rec."Fixed Amount")
                {
                }
            }
        }
    }

    actions
    {
    }
}

