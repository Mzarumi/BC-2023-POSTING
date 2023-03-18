page 52186040 "Quotation Request Vendors"
{
    PageType = List;
    SourceTable = "Quotation Request Vendors";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition Document No."; Rec."Requisition Document No.")
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print/Preview")
            {
                Caption = 'Print/Preview';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    PQH.SetRecFilter;
                    PQH.SetFilter(PQH."Document Type", '%1', Rec."Document Type");
                    PQH.SetFilter("No.", Rec."Requisition Document No.");

                    // repvend.SetTableView(PQH);
                    // repvend.Run;
                end;
            }
        }
    }

    var
        PQH: Record "Purchase Quote Header";
        ////here//repvend: Report "RFQ Report";
        QuotationRequestVendors: Record "Quotation Request Vendors";
}

