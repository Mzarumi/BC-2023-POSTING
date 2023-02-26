page 52186182 "General Setup"
{
    PageType = Card;
    SourceTable = "General Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Landlord Dues G/L"; Rec."Landlord Dues G/L")
                {
                }
                field("Commission Template"; Rec."Commission Template")
                {
                }
                field("Commission Batch"; Rec."Commission Batch")
                {
                }
                field("Management Account"; Rec."Management Account")
                {
                    Caption = 'Management Fee Account';
                }
                field("Prepayment Account"; Rec."Prepayment Account")
                {
                }
            }
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Property Nos."; Rec."Property Nos.")
                {
                }
                field("Lease Nos."; Rec."Lease Nos.")
                {
                }
                field("Charge Code"; Rec."Charge Code")
                {
                }
                field("Water billing No."; Rec."Water billing No.")
                {
                }
                field("B/Hole W/B Nos."; Rec."B/Hole W/B Nos.")
                {
                }
                field("Bill Batch No."; Rec."Bill Batch No.")
                {
                }
                field(NairobiInv; Rec.NairobiInv)
                {
                }
                field(BHoleInv; Rec.BHoleInv)
                {
                }
                field("Landlord Nos."; Rec."Landlord Nos.")
                {
                }
                field("Tenant Nos."; Rec."Tenant Nos.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

