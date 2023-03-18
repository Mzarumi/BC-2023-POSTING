page 52185996 "Posted Bank & Cash Transfer"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Cancel,Category6_caption,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "InterBank Transfers";
    SourceTableView = WHERE(Posted = CONST(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; Rec.No)
                {
                    Editable = false;
                    Enabled = true;
                }
                field(Date; Rec.Date)
                {
                    Editable = DateEditable;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                label(Control1102758030)
                {
                    CaptionClass = Text19025618;
                    ShowCaption = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field("Receiving Transfer Type"; Rec."Receiving Transfer Type")
                {
                    Editable = ReceivingTransferTypeEditable;
                }
                field("Reciept Responsibility Center"; Rec."Reciept Responsibility Center")
                {
                    Editable = RecieptResponsibilityCenterEdi;
                }
                field("Receipt Resp Centre"; Rec."Receipt Resp Centre")
                {
                }
                field("Receiving Account"; Rec."Receiving Account")
                {
                    Editable = "Receiving AccountEditable";

                    trigger OnValidate()
                    begin
                        ReceivingAccountOnAfterValidat;
                    end;
                }
                field("Receiving Bank Account Name"; Rec."Receiving Bank Account Name")
                {
                    Editable = false;
                }
                field("Currency Code Destination"; Rec."Currency Code Destination")
                {
                }
                field("Amount 2"; Rec."Amount 2")
                {
                    Caption = 'Amount';
                    Editable = "Amount 2Editable";
                }
                field("Exch. Rate Destination"; Rec."Exch. Rate Destination")
                {
                    Editable = false;
                    Visible = "Exch. Rate DestinationVisible";
                }
                field("Request Amt LCY"; Rec."Request Amt LCY")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                    Editable = RemarksEditable;
                }
                label(Control1102758029)
                {
                    CaptionClass = Text19044997;
                    ShowCaption = false;
                    Style = Standard;
                    StyleExpr = TRUE;
                }
                field("Source Transfer Type"; Rec."Source Transfer Type")
                {
                    Editable = "Source Transfer TypeEditable";
                }
                field("Sending Responsibility Center"; Rec."Sending Responsibility Center")
                {
                    Editable = SendingResponsibilityCenterEdi;
                }
                field("Sending Resp Centre"; Rec."Sending Resp Centre")
                {
                }
                field("Paying Account"; Rec."Paying Account")
                {
                    Editable = "Paying AccountEditable";

                    trigger OnValidate()
                    begin
                        PayingAccountOnAfterValidate;
                    end;
                }
                field("Paying  Bank Account Name"; Rec."Paying  Bank Account Name")
                {
                    Editable = false;
                }
                field("Currency Code Source"; Rec."Currency Code Source")
                {
                }
                field(Amount; Rec.Amount)
                {
                    Editable = AmountEditable;
                }
                field("Pay Amt LCY"; Rec."Pay Amt LCY")
                {
                }
                field("Exch. Rate Source"; Rec."Exch. Rate Source")
                {
                    Editable = false;
                    Visible = "Exch. Rate sourceVisible";
                }
                field("External Doc No."; Rec."External Doc No.")
                {
                    Editable = "External Doc No.Editable";
                }
                field("Transfer Release Date"; Rec."Transfer Release Date")
                {
                    Editable = "Transfer Release DateEditable";
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action(Print)
                {
                    Caption = 'Print';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(No, Rec.No);
                        //REPORT.Run(52185786, true, true, Rec);
                        Rec.Reset;
                    end;
                }
                action("Cancel Document")
                {
                    Caption = 'Cancel Document';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        Text000: Label 'Are you sure you want to Cancel this Document?';
                        Text001: Label 'You have selected not to Cancel this Document';
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);
                        if Confirm(Text000, true) then begin
                            Rec.Status := Rec.Status::Cancelled;
                            Rec."Cancelled By" := UserId;
                            Rec."Date Cancelled" := Today;
                            Rec."Time Cancelled" := Time;
                            Rec.Modify;
                        end else
                            Error(Text001);
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

    trigger OnAfterGetCurrRecord()
    begin

        if Rec."Currency Code Source" <> '' then begin

            "Exch. Rate SourceVisible" := true;
        end
        else begin
            "Exch. Rate SourceVisible" := false;
        end;

        if Rec."Currency Code Destination" <> '' then begin
            "Exch. Rate DestinationVisible" := true;
        end
        else begin
            "Exch. Rate DestinationVisible" := false;
        end;

        UpdateControl;
    end;

    trigger OnInit()
    begin
        "Transfer Release DateEditable" := true;
        "External Doc No.Editable" := true;
        "Exch. Rate SourceEditable" := true;
        AmountEditable := true;
        "Paying AccountEditable" := true;
        SendingResponsibilityCenterEdi := true;
        "Source Transfer TypeEditable" := true;
        "Exch. Rate DestinationEditable" := true;
        RemarksEditable := true;
        "Amount 2Editable" := true;
        "Receiving AccountEditable" := true;
        RecieptResponsibilityCenterEdi := true;
        ReceivingTransferTypeEditable := true;
        DateEditable := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Date := Today;
        Rec."Inter Bank Template Name" := JTemplate;
        Rec."Inter Bank Journal Batch" := JBatch;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Reciept Responsibility Center" := UserMgt.GetPurchasesFilter();
        //VALIDATE( "Reciept Responsibility Center");
        Rec.Status := Rec.Status::Pending;
        Rec."Created By" := UserId;

        UpdateControl;
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetPurchasesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Reciept Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FilterGroup(0);
        end;


        TempBatch.Reset;

        TempBatch.SetRange(TempBatch.UserID, UserId);
        if TempBatch.Find('-') then begin
            JTemplate := TempBatch."Inter Bank Template Name";
            JBatch := TempBatch."Inter Bank Batch Name";
        end;
    end;

    var
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
        TempBatch: Record "Cash Office User Template";
        JTemplate: Code[20];
        JBatch: Code[20];
        PCheck: Codeunit "Posting Check FP";
        Post: Boolean;
        BankAcc: Record "Bank Account";
        RegNo: Integer;
        FromNo: Integer;
        ToNo: Integer;
        RegMgt: Codeunit "Register Management";
        JournalPostedSuccessfully: Codeunit "Journal Post Successful";
        RespCenter: Record "Responsibility CenterBR";
        UserMgt: Codeunit "User Setup Management BR";
        [InDataSet]
        "Exch. Rate DestinationVisible": Boolean;
        [InDataSet]
        "Exch. Rate SourceVisible": Boolean;
        [InDataSet]
        DateEditable: Boolean;
        [InDataSet]
        ReceivingTransferTypeEditable: Boolean;
        [InDataSet]
        RecieptResponsibilityCenterEdi: Boolean;
        [InDataSet]
        "Receiving AccountEditable": Boolean;
        [InDataSet]
        "Amount 2Editable": Boolean;
        [InDataSet]
        RemarksEditable: Boolean;
        [InDataSet]
        "Exch. Rate DestinationEditable": Boolean;
        [InDataSet]
        "Source Transfer TypeEditable": Boolean;
        [InDataSet]
        SendingResponsibilityCenterEdi: Boolean;
        [InDataSet]
        "Paying AccountEditable": Boolean;
        [InDataSet]
        AmountEditable: Boolean;
        [InDataSet]
        "Exch. Rate SourceEditable": Boolean;
        [InDataSet]
        "External Doc No.Editable": Boolean;
        [InDataSet]
        "Transfer Release DateEditable": Boolean;
        Text19025618: Label 'Requesting Details';
        Text19044997: Label 'Source Details';
        ApprovalEntries: Page "Approval Entries";

    //[Scope('Internal')]
    procedure GetDimensionName(var "Code": Code[20]; DimNo: Integer) Name: Text[60]
    var
        GLSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
        Text000: Label 'Are you sure you want to Cancel this Document?';
        Text001: Label 'You have selected not to Cancel this Document';
    begin
        /*Get the global dimension 1 and 2 from the database*/
        Name := '';

        GLSetup.Reset;
        GLSetup.Get();

        DimVal.Reset;
        DimVal.SetRange(DimVal.Code, Code);

        if DimNo = 1 then begin
            DimVal.SetRange(DimVal."Dimension Code", GLSetup."Global Dimension 1 Code");
        end
        else
            if DimNo = 2 then begin
                DimVal.SetRange(DimVal."Dimension Code", GLSetup."Global Dimension 2 Code");
            end;
        if DimVal.Find('-') then begin
            Name := DimVal.Name;
        end;

    end;

    //[Scope('Internal')]
    procedure UpdateControl()
    begin
        if Rec.Status <> Rec.Status::Pending then begin
            DateEditable := false;
            ReceivingTransferTypeEditable := false;
            RecieptResponsibilityCenterEdi := false;
            "Receiving AccountEditable" := false;
            "Amount 2Editable" := false;
            RemarksEditable := false;
            "Exch. Rate DestinationEditable" := false;

        end else begin
            DateEditable := true;
            ReceivingTransferTypeEditable := true;
            RecieptResponsibilityCenterEdi := true;
            "Receiving AccountEditable" := true;
            "Amount 2Editable" := true;
            RemarksEditable := true;
            "Exch. Rate DestinationEditable" := true;


        end;

        if Rec.Status = Rec.Status::Approved then begin
            "Source Transfer TypeEditable" := true;
            SendingResponsibilityCenterEdi := true;
            "Paying AccountEditable" := true;
            AmountEditable := true;
            "Paying AccountEditable" := true;
            "Exch. Rate SourceEditable" := true;
            "External Doc No.Editable" := true;
            "Transfer Release DateEditable" := true;
        end else begin
            "Source Transfer TypeEditable" := false;
            SendingResponsibilityCenterEdi := false;
            AmountEditable := false;
            "Paying AccountEditable" := false;
            "Exch. Rate SourceEditable" := false;
            "External Doc No.Editable" := false;
            "Transfer Release DateEditable" := false;
        end;
    end;

    local procedure ReceivingAccountOnAfterValidat()
    begin
        //check if the currency code field has been filled in
        "Exch. Rate DestinationVisible" := false;
        if Rec."Currency Code Destination" <> '' then begin
            "Exch. Rate DestinationVisible" := true;
        end;
    end;

    local procedure PayingAccountOnAfterValidate()
    begin
        //check if the currency code field has been filled in
        "Exch. Rate SourceVisible" := false;
        if Rec."Currency Code Source" <> '' then begin
            "Exch. Rate SourceVisible" := true;
        end;
    end;
}

