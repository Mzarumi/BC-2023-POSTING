page 52186249 "Active Lease-List"
{
    //             RecordInvoice."Document Type":=RecordInvoice."Document Type"::Invoice;
    //             RecordInvoice."Document Date":=TODAY;
    //             RecordInvoice."Sell-to Customer No.":=RecordLease."Tenant No.";
    //             RecordInvoice."Posting Description":='Invoice for Lease No.:' + FORMAT(RecordLease."No.");
    //             RecordInvoice."Posting Date":=TODAY;
    //             RecordInvoice."Due Date":=TODAY;
    //             RecordInvoice."Document Date":=TODAY;
    //             RecordInvoice."Shipping No. Series":=RecordInvoiceNos."Posted Shipment Nos.";
    //             RecordInvoice."External Document No.":=RecordLease."No.";
    //             //validate the tenant number
    //             RecordInvoice.VALIDATE(RecordInvoice."Sell-to Customer No.");
    //             RecordInvoice."Shortcut Dimension 1 Code":=RecordLease."Dimension 1 Code";
    //             RecordInvoice.VALIDATE(RecordInvoice."Shortcut Dimension 1 Code");
    //             RecordInvoice."Shortcut Dimension 2 Code":=RecordLease."Dimension 2 Code";
    //             RecordInvoice.VALIDATE(RecordInvoice."Shortcut Dimension 2 Code");
    //             //insert the property and the lease number into the database
    //             RecordInvoice."Property No.":=RecordLease."Property No.";
    //             RecordInvoice."Lease No.":=RecordLease."No.";
    //             RecordInvoice."Source Document Type":=Source;

    CardPageID = "Lease-Active";
    Editable = true;
    PageType = List;
    SourceTable = Lease;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = true;
                ShowCaption = false;
                field("No."; Rec."No.")
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
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Next Bill Date"; Rec."Next Bill Date")
                {
                }
                field("Last Bill Date"; Rec."Last Bill Date")
                {
                }
                field("Area square ft"; Rec."Area square ft")
                {
                }
                field("Total Amount Excl. VAT"; Rec."Total Amount Excl. VAT")
                {
                }
                field("Property Type"; Rec."Property Type")
                {
                }
                field(Blocked; Rec.Blocked)
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
                field("Letter Of Offer"; Rec."Letter Of Offer")
                {
                    Editable = false;
                }
                field("Lease Agreement Ref. No."; Rec."Lease Agreement Ref. No.")
                {
                    Editable = false;
                }
                field("Lease Commence Date"; Rec."Lease Commence Date")
                {
                    Editable = false;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    Editable = false;
                }
                field("Billing Frequency"; Rec."Billing Frequency")
                {
                    Editable = true;
                }
                field("Billing Frequency Value"; Rec."Billing Frequency Value")
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
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LookupMode := true;
    end;

    var
        L: Record Lease;
        LL: Record "Lease Line";
        IntC: Integer;
        BL: Record "Lease Bill Lines";
        SaleHeader: Record "Sales Header";
        SaleLine: Record "Sales Line";
        SRSetup: Record "Sales & Receivables Setup";
        NextNo: Code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        LineNo: Integer;
        FType: Text[30];
        FValue: Integer;
}

