page 52186001 "Posted Store Requisitions List"
{
    CardPageID = "Posted Store Requisition";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancellation,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Store Requistion Header";
    SourceTableView = WHERE(Status = CONST(Posted));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Request date"; Rec."Request date")
                {
                }
                field("Request Description"; Rec."Request Description")
                {
                }
                field("Requester ID"; Rec."Requester ID")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(TotalAmount; Rec.TotalAmount)
                {
                }
                field("Issuing Store"; Rec."Issuing Store")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755010; Notes)
            {
            }
            systempart(Control1102755011; MyNotes)
            {
            }
            systempart(Control1102755012; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("<Action1102755026>")
            {
                Caption = '&Functions';
                action("<Action1102755036>")
                {
                    Caption = 'Print/Preview';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetFilter("No.", Rec."No.");
                        //REPORT.Run(52185785, true, true, Rec);
                        Rec.Reset;
                        /*
                        RESET;                                //ampath gatepass
                        SETFILTER("No.","No.");
                        //REPORT.Run(52185529,TRUE,TRUE,Rec);
                        RESET;
                         */

                    end;
                }
            }
            group(Navigate)
            {
                Caption = 'Navigate';
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*
                        DocumentType := DocumentType::"Payment Voucher";
                        ApprovalEntries.Setfilters(DATABASE::"Payments Header","Document Type","No.");
                        ApprovalEntries.RUN;
                        */
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);

                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */
        /*IF UserMgt.GetSetDimensions(USERID,2) <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Shortcut Dimension 2 Code",UserMgt.GetSetDimensions(USERID,2));
          FILTERGROUP(0);
        END;*/

    end;

    var
        UserMgt: Codeunit "User Setup Management BR";
        ReqLine: Record "Store Requistion Lines";
        InventorySetup: Record "Inventory Setup";
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit "Journal Post Successful";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;

    //[Scope('Internal')]
    procedure LinesExists(): Boolean
    var
        PayLines: Record "Store Requistion Lines";
    begin
        HasLines := false;
        PayLines.Reset;
        PayLines.SetRange(PayLines."Requistion No", Rec."No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;
}

