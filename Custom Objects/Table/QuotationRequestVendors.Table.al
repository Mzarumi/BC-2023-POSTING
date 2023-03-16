table 52185930 "Quotation Request Vendors"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionMembers = "Quotation Request","Open Tender","Restricted Tender";
        }
        field(2; "Requisition Document No."; Code[20])
        {
        }
        field(3; "Vendor No."; Code[20])
        {
            TableRelation = Vendor WHERE ("Vendor Posting Group" = FILTER ('TRADE'));

            trigger OnValidate()
            begin
                PurchaseQuoteHeader.Reset;
                PurchaseQuoteHeader.SetRange("No.", "Requisition Document No.");
                PurchaseQuoteHeader.SetRange(Status, PurchaseQuoteHeader.Status::Released);
                if PurchaseQuoteHeader.Find('-') then begin
                    Error('This document has been released');
                end;
            end;
        }
        field(4; "Vendor Name"; Text[100])
        {
            CalcFormula = Lookup (Vendor.Name WHERE ("No." = FIELD ("Vendor No.")));
            FieldClass = FlowField;
        }
        field(5; Address; Text[100])
        {
            CalcFormula = Lookup (Vendor."Address 2" WHERE ("No." = FIELD ("Vendor No.")));
            FieldClass = FlowField;
        }
        field(6; "Postal Code"; Code[50])
        {
            CalcFormula = Lookup (Vendor."Post Code" WHERE ("No." = FIELD ("Vendor No.")));
            FieldClass = FlowField;
        }
        field(7; City; Text[30])
        {
            CalcFormula = Lookup (Vendor.City WHERE ("No." = FIELD ("Vendor No.")));
            FieldClass = FlowField;
        }
        field(8; "Phone number"; Text[50])
        {
            CalcFormula = Lookup (Vendor."Phone No." WHERE ("No." = FIELD ("Vendor No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Requisition Document No.", "Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        PurchaseQuoteHeader.Reset;
        PurchaseQuoteHeader.SetRange("No.", "Requisition Document No.");
        PurchaseQuoteHeader.SetRange(Status, PurchaseQuoteHeader.Status::Released);
        if PurchaseQuoteHeader.Find('-') then begin
            Error('You cannot delete vendors from a released document');
        end;
    end;

    var
        PurchaseQuoteHeader: Record "Purchase Quote Header";
}

