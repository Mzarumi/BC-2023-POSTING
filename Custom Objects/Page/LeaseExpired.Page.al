page 52186209 "Lease-Expired"
{
    PageType = Card;
    SourceTable = Lease;
    SourceTableView = WHERE(Blocked = CONST(true));

    layout
    {
        area(content)
        {
            group(Genera)
            {
                Caption = 'Genera';
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Date Registered"; Rec."Date Registered")
                {
                    Editable = false;
                }
                field("Property No."; Rec."Property No.")
                {
                    Editable = false;
                }
                field("L.R. No."; Rec."L.R. No.")
                {
                    Editable = false;
                }
                field("Property Name"; Rec."Property Name")
                {
                    Editable = false;
                }
                field("Floor No."; Rec."Floor No.")
                {
                    Editable = false;
                }
                field("Floor Name"; Rec."Floor Name")
                {
                    Editable = false;
                }
                field("Unit Code"; Rec."Unit Code")
                {
                    Editable = false;
                }
                field("Unit Description"; Rec."Unit Description")
                {
                    Editable = false;
                }
                field("Unit Type"; Rec."Unit Type")
                {
                    Editable = false;
                }
                field("Unit Type Description"; Rec."Unit Type Description")
                {
                    Editable = false;
                }
                field("Unit Sub Type"; Rec."Unit Sub Type")
                {
                    Editable = false;
                }
                field("Unit Sub Type Description"; Rec."Unit Sub Type Description")
                {
                    Editable = false;
                }
                field("Landlord No."; Rec."Landlord No.")
                {
                    Editable = false;
                }
                field("Landlord Name"; Rec."Landlord Name")
                {
                    Editable = false;
                }
                field("Tenant No."; Rec."Tenant No.")
                {
                    Editable = false;
                }
                field("Tenant Name"; Rec."Tenant Name")
                {
                    Editable = false;
                }
                field("End Remarks"; Rec."End Remarks")
                {
                    Editable = false;
                    MultiLine = true;
                }
            }
            group(General)
            {
                Caption = 'General';
                part(Control1102755030; "Lease Line")
                {
                    SubPageLink = "Lease No." = FIELD("No.");
                }
            }
            group(Billing)
            {
                Caption = 'Billing';
                field("Lease Commence Date"; Rec."Lease Commence Date")
                {
                    Editable = false;
                }
                field("Duration Type"; Rec."Duration Type")
                {
                    Editable = false;
                }
                field("Duration Value"; Rec."Duration Value")
                {
                    Editable = false;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    Editable = false;
                }
                field("Billing Frequency"; Rec."Billing Frequency")
                {
                    Editable = false;
                }
                field("Billing Frequency Value"; Rec."Billing Frequency Value")
                {
                    Editable = false;
                }
            }
            group("Other Details")
            {
                Caption = 'Other Details';
                field("Letter Of Offer"; Rec."Letter Of Offer")
                {
                    Editable = false;
                }
                field("Lease Agreement Ref. No."; Rec."Lease Agreement Ref. No.")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Validate("Duration Type");
    end;
}

