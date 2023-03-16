page 52186228 "Lease-Billed"
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

    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Leases Billed";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = true;
                ShowCaption = false;
                field("Next Bill Date"; Rec."Next Bill Date")
                {
                }
                field(InvoiceNo; Rec.InvoiceNo)
                {
                    Editable = false;
                }
                field(Charged; Rec.Charged)
                {
                    Editable = false;
                }
                field("Batch No"; Rec."Batch No")
                {
                }
                field("Tenant No."; Rec."Tenant No.")
                {
                    Editable = false;
                }
                field("Tenant Name"; Rec."Tenant Name")
                {
                    Editable = false;
                }
                field("Total Incl. VAT"; Rec."Total Incl. VAT")
                {
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Leased VAT Amount"; Rec."Leased VAT Amount")
                {
                }
                field("Leased Amount"; Rec."Leased Amount")
                {
                }
                field("No."; Rec."No.")
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
                field(Posted; Rec.Posted)
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
                field("Currency Code"; Rec."Currency Code")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Function")
            {
                Caption = 'Function';
                Visible = false;
                action("Preview Posted Invoice")
                {
                    Caption = 'Preview Posted Invoice';

                    trigger OnAction()
                    begin
                        Rec.showLease;
                    end;
                }
            }
        }
    }

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
        NoSeries: Record "No. Series Line";
        LastNo: Code[20];
        PostInv: Boolean;
        PrevInv: Boolean;
        SaleSetup: Record "Sales & Receivables Setup";
        SalesPost: Codeunit "Sales-Post";
}

