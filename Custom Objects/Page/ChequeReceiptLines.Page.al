page 52185812 "Cheque Receipt Lines"
{
    PageType = List;
    SourceTable = "Cheque Issue Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Cheque Serial No"; Rec."Cheque Serial No")
                {
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    Editable = false;
                }
                field("Un pay Code"; Rec."Un pay Code")
                {
                }
                field(Interpretation; Rec.Interpretation)
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Unpay Date"; Rec."Unpay Date")
                {
                    Editable = false;
                }
                field("Un Pay Charge Amount"; Rec."Un Pay Charge Amount")
                {
                    Editable = false;
                }
                field("Family Account No."; Rec."Family Account No.")
                {
                    Caption = 'Family Account No';
                    Editable = false;
                }
                field("Date _Refference No."; Rec."Date _Refference No.")
                {
                    Editable = false;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    Editable = false;
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

