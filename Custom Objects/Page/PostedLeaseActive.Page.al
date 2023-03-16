page 52186233 "Posted Lease-Active"
{
    Editable = false;
    PageType = Card;
    SourceTable = Lease;
    SourceTableView = WHERE(Blocked = CONST(false),
                            Commenced = CONST(true));

    layout
    {
        area(content)
        {
            group(Genera)
            {
                Caption = 'Genera';
                field("No."; Rec."No.")
                {
                }
                field("Date Registered"; Rec."Date Registered")
                {
                }
                field("Property No."; Rec."Property No.")
                {
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
                }
                field("Floor Name"; Rec."Floor Name")
                {
                    Editable = false;
                }
                field("Unit Code"; Rec."Unit Code")
                {
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
                }
                field("Tenant Name"; Rec."Tenant Name")
                {
                    Editable = false;
                }
            }
            part(Control1102755026; "Lease Line")
            {
                SubPageLink = "Lease No." = FIELD("No.");
            }
            group(Billing)
            {
                Caption = 'Billing';
                field("Lease Commence Date"; Rec."Lease Commence Date")
                {
                }
                field("Duration Type"; Rec."Duration Type")
                {
                }
                field("Duration Value"; Rec."Duration Value")
                {
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    Editable = false;
                }
                field("Billing Frequency"; Rec."Billing Frequency")
                {
                }
                field("Billing Frequency Value"; Rec."Billing Frequency Value")
                {
                }
                field("Last Bill Date"; Rec."Last Bill Date")
                {
                }
                field("Next Bill Date"; Rec."Next Bill Date")
                {
                }
            }
            group("Other Details")
            {
                Caption = 'Other Details';
                field("Letter Of Offer"; Rec."Letter Of Offer")
                {
                }
                field("Lease Agreement Ref. No."; Rec."Lease Agreement Ref. No.")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                    Editable = false;
                }
                field(Commenced; Rec.Commenced)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Preview")
            {
                Caption = 'Print Preview';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Lease.Reset;
                    Lease.SetRange(Lease."No.", Rec."No.");
                    //if Lease.Find('-') then
                    //REPORT.Run(52186035, true, true, Lease)
                end;
            }
        }
    }

    var
        Lease: Record Lease;
}

