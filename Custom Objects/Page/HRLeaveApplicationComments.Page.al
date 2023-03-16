page 52185560 "HR Leave Application Comments"
{
    PageType = Card;
    SourceTable = "Approval Comment Line";

    layout
    {
        area(content)
        {
            // field(DocType; Rec.DocType)
            // {
            //     Editable = false;
            //     OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Payment Voucher,Petty Cash,Imprest,Requisition,ImprestSurrender,Interbank,Receipt,Staff Claim,Staff Advance,AdvanceSurrender,Bank Slip,Grant,Grant Surrender,Employee Requisition,Leave Application,Training Application,Transport Requisition';
            // }
            // field(DocNo; Rec.DocNo)
            // {
            //     Editable = false;
            // }
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("User ID"; Rec."User ID")
                {
                }
                field("Date and Time"; Rec."Date and Time")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Approved Days"; Rec."Approved Days")
                {
                }
                field("Approved Start Date"; Rec."Approved Start Date")
                {
                }
                field("Approved Return Date"; Rec."Approved Return Date")
                {
                }
                field(Reason; Rec.Reason)
                {
                }
                field("Leave Allowance Granted"; Rec."Leave Allowance Granted")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        NewTableId: Integer;
        NewDocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application";
        NewDocumentNo: Code[20];
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application";
        DocNo: Code[20];

    //[Scope('Internal')]
    procedure SetUpLine(TableId: Integer; DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application"; DocumentNo: Code[20])
    begin
        NewTableId := TableId;
        NewDocumentType := DocumentType;
        NewDocumentNo := DocumentNo;
    end;

    //[Scope('Internal')]
    procedure Setfilters(TableId: Integer; DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application"; DocumentNo: Code[20])
    begin
        if TableId <> 0 then begin
            Rec.FilterGroup(2);
            Rec.SetCurrentKey("Table ID", "Document Type", "Document No.");
            Rec.SetRange("Table ID", TableId);
            Rec.SetRange("Document Type", DocumentType);
            if DocumentNo <> '' then
                Rec.SetRange("Document No.", DocumentNo);
            Rec.FilterGroup(0);
        end;

        DocType := DocumentType;
        DocNo := DocumentNo;
    end;
}

