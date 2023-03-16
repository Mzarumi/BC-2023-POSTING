page 52186044 "Closed RFQ Header"
{
    PageType = Document;
    SourceTable = "Purchase Quote Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("Posting Description"; Rec."Posting Description")
                {
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                }
                field("Expected Opening Date"; Rec."Expected Opening Date")
                {
                }
                field("Expected Closing Date"; Rec."Expected Closing Date")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field(Control1102755012; Rec.Status)
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
            }
            part(Control1102755015; "RFQ Subform")
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action1102755017)
            {
                action("Assign Vendor(s)")
                {
                    Caption = 'Assign Vendor(s)';
                    Image = Vendor;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        Vends: Record "Quotation Request Vendors";
                    begin

                        Vends.Reset;
                        Vends.SetRange(Vends."Document Type", Rec."Document Type");
                        Vends.SetRange(Vends."Requisition Document No.", Rec."No.");

                        PAGE.Run(PAGE::"Quotation Request Vendors", Vends);
                    end;
                }
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
                        PQH.SetFilter("No.", Rec."No.");
                        // repvend.SetTableView(PQH);
                        // repvend.Run;
                    end;
                }
            }
            group(Status)
            {
                Caption = 'Status';
                action(Cancel)
                {
                    Caption = 'Cancel';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        /*
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE(PurchHeader."Document Type",PurchHeader."Document Type"::Quote);
                        PurchHeader.SETRANGE(PurchHeader."Request for Quote No.","No.");
                        IF PurchHeader.FINDFIRST THEN
                          BEGIN
                            ERROR('The Quotation for request is already tied to a Quotation. Cannot be Reopened');
                          END;
                        */
                        if Confirm('Cancel Document?', false) = false then begin exit end;
                        Rec.Status := Rec.Status::Cancelled;
                        Rec.Modify;

                    end;
                }
                action(Stop)
                {
                    Caption = 'Stop';
                    Image = Stop;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        /*
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE(PurchHeader."Document Type",PurchHeader."Document Type"::Quote);
                        PurchHeader.SETRANGE(PurchHeader."Request for Quote No.","No.");
                        IF PurchHeader.FINDFIRST THEN
                          BEGIN
                            ERROR('The Quotation for request is already tied to a Quotation. Cannot be Reopened');
                          END;
                        */
                        if Confirm('Close Document?', false) = false then begin exit end;
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify;

                    end;
                }
                action(Close)
                {
                    Caption = 'Close';
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        /*
                        PurchHeader.RESET;
                        PurchHeader.SETRANGE(PurchHeader."Document Type",PurchHeader."Document Type"::Quote);
                        PurchHeader.SETRANGE(PurchHeader."Request for Quote No.","No.");
                        IF PurchHeader.FINDFIRST THEN
                          BEGIN
                            ERROR('The Quotation for request is already tied to a Quotation. Cannot be Reopened');
                          END;
                        */
                        if Confirm('Close Document?', false) = false then begin exit end;
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify;

                    end;
                }
                action(Release)
                {
                    Caption = 'Release';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin

                        if Confirm('Release document?', false) = false then begin exit end;
                        //check if the document has any lines
                        Lines.Reset;
                        Lines.SetRange(Lines."Document Type", Rec."Document Type");
                        Lines.SetRange(Lines."Document No.", Rec."No.");
                        if Lines.FindFirst then begin
                            repeat
                                Lines.TestField(Lines.Quantity);
                                //Lines.TestField(Lines."Direct Unit Cost");
                                Lines.TestField("No.");
                            until Lines.Next = 0;
                        end
                        else begin
                            Error('Document has no lines');
                        end;
                        Rec.Status := Rec.Status::Released;
                        Rec.Modify;
                    end;
                }
                action(Reopen)
                {
                    Caption = 'Reopen';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        //check if the quotation for request number has already been used
                        PurchHeader.Reset;
                        PurchHeader.SetRange(PurchHeader."Document Type", PurchHeader."Document Type"::Quote);
                        //PurchHeader.SETRANGE(purchheader."request for quote no","No.");
                        if PurchHeader.FindFirst then begin
                            Error('The Quotation for request is already tied to a Quotation. Cannot be Reopened');
                        end;

                        if Confirm('Reopen Document?', false) = false then begin exit end;
                        Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                    end;
                }
            }
        }
    }

    var
        PurchHeader: Record "Purchase Header";
        PParams: Record "Purchase Quote Params";
        Lines: Record "Purchase Quote Line";
        PQH: Record "Purchase Quote Header";
    //repvend: Report "Purchase Quote Request Report";
}

