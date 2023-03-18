page 52186038 "RFQ Subform"
{
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "Purchase Quote Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                }
                field("Expense Code"; Rec."Expense Code")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Description 2"; Rec."Description 2")
                {
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Direct Unit Cost"; Rec."Direct Unit Cost")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("PRF No"; Rec."PRF No")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Set Specification")
            {
                Caption = 'Set Specification';

                trigger OnAction()
                var
                    PParams: Record "Purchase Quote Params";
                begin
                    PParams.Reset;
                    PParams.SetRange(PParams."Document Type", Rec."Document Type");
                    PParams.SetRange(PParams."Document No.", Rec."Document No.");
                    PParams.SetRange(PParams."Line No.", Rec."Line No.");
                    PAGE.Run(39006071, PParams);
                end;
            }
        }
    }
}

