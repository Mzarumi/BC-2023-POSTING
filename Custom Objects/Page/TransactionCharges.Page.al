page 52185796 "Transaction Charges"
{
    DeleteAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Transaction Charges";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Visible = true;
                }
                field("Charge Code"; Rec."Charge Code")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Charge Type"; Rec."Charge Type")
                {
                }
                field("Charge Amount"; Rec."Charge Amount")
                {
                }
                field("Percentage of Amount"; Rec."Percentage of Amount")
                {
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    Editable = true;
                }
                field("Minimum Amount"; Rec."Minimum Amount")
                {
                }
                field("Maximum Amount"; Rec."Maximum Amount")
                {
                }
                field("Staggered Charge Code"; Rec."Staggered Charge Code")
                {
                }
                field("Transaction Charge Category"; Rec."Transaction Charge Category")
                {
                }
                field("Recover Excise Duty"; Rec."Recover Excise Duty")
                {
                }
            }
        }
    }

    actions
    {
    }
}

