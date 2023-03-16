page 52186256 "Terminate Lease-Active"
{
    Editable = true;
    PageType = Card;
    SourceTable = Lease;
    SourceTableView = WHERE(Blocked = CONST(false),
                            Commenced = CONST(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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
                field("Unit Type"; Rec."Unit Type")
                {
                    Editable = false;
                }
                field("Unit Type Description"; Rec."Unit Type Description")
                {
                    Editable = false;
                }
                field("Landlord No."; Rec."Landlord No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Landlord Name"; Rec."Landlord Name")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Tenant No."; Rec."Tenant No.")
                {
                    Editable = false;
                }
                field("Tenant Name"; Rec."Tenant Name")
                {
                    Editable = false;
                }
                field("Total Amount Excl. VAT"; Rec."Total Amount Excl. VAT")
                {
                    Editable = false;
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    Editable = false;
                }
                field("Meter No."; Rec."Meter No.")
                {
                }
                field("Previous Reading"; Rec."Previous Reading")
                {
                    Editable = true;
                }
                field("Current Reading"; Rec."Current Reading")
                {
                    Editable = true;
                    Enabled = true;
                }
                field("Nairobi Pr Reading"; Rec."Nairobi Pr Reading")
                {
                    Editable = false;
                }
                field("Nairobi Cur Reading"; Rec."Nairobi Cur Reading")
                {
                    Editable = false;
                }
                field(User; Rec.User)
                {
                    Editable = false;
                }
                field("Lease Balance"; Rec."Lease Balance")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Area square ft"; Rec."Area square ft")
                {
                }
                field(FirstBilling; Rec.FirstBilling)
                {
                }
                field(Prepayment; Rec.Prepayment)
                {
                }
            }
            part(Control1102755026; "Lease Line")
            {
                SubPageLink = "Lease No." = FIELD("No.");
            }
            group("Termination Details")
            {
                Caption = 'Termination Details';
                field("Termination Notice Date"; Rec."Termination Notice Date")
                {
                }
                field("Termination Reason"; Rec."Termination Reason")
                {
                }
                field("Termination Date"; Rec."Termination Date")
                {
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
                field("Last Bill Date"; Rec."Last Bill Date")
                {
                    Editable = false;
                }
                field("Next Bill Date"; Rec."Next Bill Date")
                {
                    Editable = true;
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
                field(Blocked; Rec.Blocked)
                {
                    Editable = false;
                }
                field(Commenced; Rec.Commenced)
                {
                    Editable = false;
                }
                field("Lease Agreement Signed"; Rec."Lease Agreement Signed")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action7)
            {
                action("Terminate Lease")
                {
                    Caption = 'Terminate Lease';
                    Image = ClosePeriod;

                    trigger OnAction()
                    begin
                        if not Confirm(ConfirmLeaseTerm, true, false) then
                            exit else
                            if Rec."Termination Date" <= Today then begin

                                Rec.TestField("Termination Notice Date");
                                Rec.TestField("Termination Date");
                                Rec.TestField("Termination Reason");
                                Rec."Next Bill Date" := 0D;
                                Rec.Blocked := true;
                                Rec.Modify;
                            end else
                                Error('Termination Date is Not Due');
                    end;
                }
            }
        }
    }

    var
        LeaseLine: Record "Lease Line";
        LR: Record "Lease Charge Review";
        IntC: Integer;
        EffectDate: Date;
        "NewAmount[Rate]": Decimal;
        FType: Text[30];
        FValue: Integer;
        "OldAmount[Rate]": Decimal;
        "NewAmount[ReviewAmount]": Decimal;
        "OldAmount[ReviewAmount]": Decimal;
        Lease: Record Lease;
        PropertyCharges: Record "Unit Setup Charges";
        ApprovalEntry: Record "Approval Entry";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,Lease;
        Status1: Boolean;
        StatusTrue: Option;
        FrmCalendar: Page "Units Meter Rating";
        D: Date;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CreatePrepaymentText: Label 'Sales Prepayment No %1 has been created Successfully';
        ConfirmPrepText: Label 'Are you sure you want to create deferement Invoice';
        PrepaymentErr: Label 'You CANNOT create Deferement Invoice if Prepayment is not selected';
        DoceumentErr: Label 'Prepayment Invoice for %1 was already created.';
        ConfirmLeaseTerm: Label 'Are you sure you want to Terminate Lease';
}

