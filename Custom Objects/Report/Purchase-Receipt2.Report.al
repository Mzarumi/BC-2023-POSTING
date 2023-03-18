#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185670 "Purchase - Receipt2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Purchase - Receipt2.rdlc';
    Caption = 'Purchase - Receipt';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Posted Purchase Receipt';
            column(ReportForNavId_2822; 2822)
            {
            }
            column(CName; CompanyInfo.Name)
            {
            }
            column(CAddress; CompanyInfo.Address)
            {
            }
            column(CPicture; CompanyInfo.Picture)
            {
            }
            column(No_PurchRcptHeader; "Purch. Rcpt. Header"."No.")
            {
            }
            column(DocDateCaption; DocDateCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(DescCaption; DescCaptionLbl)
            {
            }
            column(QtyCaption; QtyCaptionLbl)
            {
            }
            column(UOMCaption; UOMCaptionLbl)
            {
            }
            column(PaytoVenNoCaption; PaytoVenNoCaptionLbl)
            {
            }
            column(EmailCaption; EmailCaptionLbl)
            {
            }
            column(Vendor; "Purch. Rcpt. Header"."Buy-from Vendor Name")
            {
            }
            column(DocumentDate; "Purch. Rcpt. Header"."Document Date")
            {
            }
            column(NoPrintd; "Purch. Rcpt. Header"."No. Printed")
            {
            }
            column(OrderNo_PurchRcptHeader; "Purch. Rcpt. Header"."Order No.")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(ReportForNavId_5701; 5701)
                {
                }
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = sorting(Number) where(Number = const(1));
                    column(ReportForNavId_6455; 6455)
                    {
                    }
                    column(PurchRcptCopyText; StrSubstNo(Text002, CopyText))
                    {
                    }
                    column(CurrentReportPageNo; StrSubstNo(Text003, Format(CurrReport.PageNo)))
                    {
                    }
                    column(ShipToAddr1; ShipToAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(ShipToAddr2; ShipToAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(ShipToAddr3; ShipToAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(ShipToAddr4; ShipToAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(ShipToAddr5; ShipToAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(ShipToAddr6; ShipToAddr[6])
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(DocDate_PurchRcptHeader; Format("Purch. Rcpt. Header"."Document Date", 0, 4))
                    {
                    }
                    column(PurchaserText; PurchaserText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(No1_PurchRcptHeader; "Purch. Rcpt. Header"."No.")
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourRef_PurchRcptHeader; "Purch. Rcpt. Header"."Your Reference")
                    {
                    }
                    column(ShipToAddr7; ShipToAddr[7])
                    {
                    }
                    column(ShipToAddr8; ShipToAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(AccNoCaption; AccNoCaptionLbl)
                    {
                    }
                    column(ShipmentNoCaption; ShipmentNoCaptionLbl)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Purch. Rcpt. Header";
                        DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                        column(ReportForNavId_7574; 7574)
                        {
                        }
                        column(DimText; DimText)
                        {
                        }
                        column(HeaderDimCaption; HeaderDimCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if DimensionLoop1.Number = 1 then begin
                                if not DimSetEntry1.FindSet then
                                    CurrReport.Break;
                            end else
                                if not Continue then
                                    CurrReport.Break;

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 - %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1; %2 - %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break;
                        end;
                    }
                    dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
                    {
                        DataItemLink = "Document No." = field("No.");
                        DataItemLinkReference = "Purch. Rcpt. Header";
                        DataItemTableView = sorting("Document No.", "Line No.");
                        column(ReportForNavId_3042; 3042)
                        {
                        }
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(QuantityOnOrder; "Purch. Rcpt. Line"."Quatity on Order")
                        {
                        }
                        column(Type_PurchRcptLine; Format("Purch. Rcpt. Line".Type, 0, 2))
                        {
                        }
                        column(Desc_PurchRcptLine; "Purch. Rcpt. Line".Description)
                        {
                            IncludeCaption = false;
                        }
                        column(Qty_PurchRcptLine; "Purch. Rcpt. Line".Quantity)
                        {
                            IncludeCaption = false;
                        }
                        column(UOM_PurchRcptLine; "Purch. Rcpt. Line"."Unit of Measure")
                        {
                            IncludeCaption = false;
                        }
                        column(No_PurchRcptLine; "Purch. Rcpt. Line"."No.")
                        {
                        }
                        column(DocNo_PurchRcptLine; "Purch. Rcpt. Line"."Document No.")
                        {
                        }
                        column(LineNo_PurchRcptLine; "Purch. Rcpt. Line"."Line No.")
                        {
                            IncludeCaption = false;
                        }
                        column(No_PurchRcptLineCaption; "Purch. Rcpt. Line".FieldCaption("Purch. Rcpt. Line"."No."))
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = sorting(Number) where(Number = filter(1 ..));
                            column(ReportForNavId_3591; 3591)
                            {
                            }
                            column(DimText1; DimText)
                            {
                            }
                            column(LineDimCaption; LineDimCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if DimensionLoop2.Number = 1 then begin
                                    if not DimSetEntry2.FindSet then
                                        CurrReport.Break;
                                end else
                                    if not Continue then
                                        CurrReport.Break;

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 - %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1; %2 - %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then
                                    CurrReport.Break;
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if (not ShowCorrectionLines) and "Purch. Rcpt. Line".Correction then
                                CurrReport.Skip;

                            DimSetEntry2.SetRange("Dimension Set ID", "Purch. Rcpt. Line"."Dimension Set ID");
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := "Purch. Rcpt. Line".Find('+');
                            while MoreLines and ("Purch. Rcpt. Line".Description = '') and ("Purch. Rcpt. Line"."No." = '') and ("Purch. Rcpt. Line".Quantity = 0) do
                                MoreLines := "Purch. Rcpt. Line".Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break;
                            "Purch. Rcpt. Line".SetRange("Purch. Rcpt. Line"."Line No.", 0, "Purch. Rcpt. Line"."Line No.");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                        column(ReportForNavId_3476; 3476)
                        {
                        }
                        column(BuyfromVenNo_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Vendor No.")
                        {
                        }
                        column(BuyfromVenNo_PurchRcptHeaderCaption; "Purch. Rcpt. Header".FieldCaption("Buy-from Vendor No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if "Purch. Rcpt. Header"."Buy-from Vendor No." = "Purch. Rcpt. Header"."Pay-to Vendor No." then
                                CurrReport.Break;
                        end;
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = sorting(Number) where(Number = const(1));
                        column(ReportForNavId_3363; 3363)
                        {
                        }
                        column(PaytoVenNo_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Vendor No.")
                        {
                        }
                        column(VendAddr1; VendAddr[1])
                        {
                        }
                        column(VendAddr2; VendAddr[2])
                        {
                        }
                        column(VendAddr3; VendAddr[3])
                        {
                        }
                        column(VendAddr4; VendAddr[4])
                        {
                        }
                        column(VendAddr5; VendAddr[5])
                        {
                        }
                        column(VendAddr6; VendAddr[6])
                        {
                        }
                        column(VendAddr7; VendAddr[7])
                        {
                        }
                        column(VendAddr8; VendAddr[8])
                        {
                        }
                        column(PaytoAddrCaption; PaytoAddrCaptionLbl)
                        {
                        }
                        column(PaytoVenNo_PurchRcptHeaderCaption; "Purch. Rcpt. Header".FieldCaption("Pay-to Vendor No."))
                        {
                        }
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if CopyLoop.Number > 1 then begin
                        CopyText := Text001;
                        OutputNo += 1;
                    end;
                    CurrReport.PageNo := 1;
                end;

                trigger OnPostDataItem()
                begin
                    if not CurrReport.Preview then
                        RcptCountPrinted.Run("Purch. Rcpt. Header");
                end;

                trigger OnPreDataItem()
                begin
                    OutputNo := 1;

                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    CopyLoop.SetRange(CopyLoop.Number, 1, NoOfLoops);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                // CurrReport.Language := Language.GetLanguageID("Purch. Rcpt. Header"."Language Code");

                // CompanyInfo.Get;

                // if RespCenter.Get("Purch. Rcpt. Header"."Responsibility Center") then begin
                //     FormatAddr.RespCenter(CompanyAddr, RespCenter);
                //     CompanyInfo."Phone No." := RespCenter."Phone No.";
                //     CompanyInfo."Fax No." := RespCenter."Fax No.";
                // end else
                //     FormatAddr.Company(CompanyAddr, CompanyInfo);

                // DimSetEntry1.SetRange("Dimension Set ID", "Purch. Rcpt. Header"."Dimension Set ID");

                if "Purch. Rcpt. Header"."Purchaser Code" = '' then begin
                    SalesPurchPerson.Init;
                    PurchaserText := '';
                end else begin
                    SalesPurchPerson.Get("Purch. Rcpt. Header"."Purchaser Code");
                    PurchaserText := Text000
                end;
                if "Purch. Rcpt. Header"."Your Reference" = '' then
                    ReferenceText := ''
                else
                    ReferenceText := "Purch. Rcpt. Header".FieldCaption("Purch. Rcpt. Header"."Your Reference");
                FormatAddr.PurchRcptShipTo(ShipToAddr, "Purch. Rcpt. Header");

                FormatAddr.PurchRcptPayTo(VendAddr, "Purch. Rcpt. Header");

                if LogInteraction then
                    if not CurrReport.Preview then
                        SegManagement.LogDocument(
                          15, "Purch. Rcpt. Header"."No.", 0, 0, Database::Vendor, "Purch. Rcpt. Header"."Buy-from Vendor No.", "Purch. Rcpt. Header"."Purchaser Code", '', "Purch. Rcpt. Header"."Posting Description", '');
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Basic;
                        Caption = 'No. of Copies';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Show Internal Information';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                    }
                    field(ShowCorrectionLines; ShowCorrectionLines)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Show Correction Lines';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            LogInteraction := SegManagement.FindInteractTmplCode(15) <> '';
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Reset;
        if CompanyInfo.Get() then
            CompanyInfo.CalcFields(Picture);
    end;

    var
        Text000: label 'Purchaser';
        Text001: label 'COPY';
        Text002: label 'Purchase - Receipt %1';
        Text003: label 'Page %1';
        CompanyInfo: Record "Company Information";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        Language: Record Language;
        RespCenter: Record 52185905;
        RcptCountPrinted: Codeunit "Purch.Rcpt.-Printed";
        SegManagement: Codeunit SegManagement;
        VendAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        PurchaserText: Text[30];
        ReferenceText: Text[80];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        FormatAddr: Codeunit "Format Address";
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        ShowCorrectionLines: Boolean;
        OutputNo: Integer;
        [InDataSet]
        LogInteractionEnable: Boolean;
        PhoneNoCaptionLbl: label 'Phone No.';
        HomePageCaptionLbl: label 'Home Page';
        VATRegNoCaptionLbl: label 'VAT Registration No.';
        GiroNoCaptionLbl: label 'Giro No.';
        BankNameCaptionLbl: label 'Bank';
        AccNoCaptionLbl: label 'Account No.';
        ShipmentNoCaptionLbl: label 'Shipment No.';
        HeaderDimCaptionLbl: label 'Header Dimensions';
        LineDimCaptionLbl: label 'Line Dimensions';
        PaytoAddrCaptionLbl: label 'Pay-to Address';
        DocDateCaptionLbl: label 'Document Date';
        PageCaptionLbl: label 'Page';
        DescCaptionLbl: label 'Description';
        QtyCaptionLbl: label 'Quantity';
        UOMCaptionLbl: label 'Unit Of Measure';
        PaytoVenNoCaptionLbl: label 'Pay-to Vendor No.';
        EmailCaptionLbl: label 'E-Mail';
        CI: Record "Company Information";


    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; NewShowCorrectionLines: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        ShowCorrectionLines := NewShowCorrectionLines;
    end;
}
