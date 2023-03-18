page 52186246 "Lease line Invoice"
{
    PageType = List;
    SourceTable = "Lease Line Invoices";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Line No"; Rec."Line No")
                {
                }
                field("Batch No"; Rec."Batch No")
                {
                }
                field("Lease No."; Rec."Lease No.")
                {
                }
                field("Charge No."; Rec."Charge No.")
                {
                }
                field("Charge Name"; Rec."Charge Name")
                {
                }
                field(Once; Rec.Once)
                {
                }
                field("Charge Once"; Rec."Charge Once")
                {
                }
                field("Amount Exclusive VAT"; Rec."Amount Exclusive VAT")
                {
                }
                field("Property No"; Rec."Property No")
                {
                }
                field("Tenant No."; Rec."Tenant No.")
                {
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                }
                field("Total Amount Inclusive VAT"; Rec."Total Amount Inclusive VAT")
                {
                }
            }
        }
    }

    actions
    {
    }
}

