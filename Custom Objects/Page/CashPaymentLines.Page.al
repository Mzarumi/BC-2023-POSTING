page 52185924 "Cash Payment Lines"
{
    Editable = true;
    PageType = ListPart;
    SourceTable = "Payment Line";

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                ShowCaption = false;
                field(Type; Rec.Type)
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                    Caption = 'Description';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field(Amount; Rec.Amount)
                {

                    trigger OnValidate()
                    begin
                        //check if the payment reference is for farmer purchase
                        if Rec."Payment Reference" = Rec."Payment Reference"::"Farmer Purchase" then begin
                            if Rec.Amount <> xRec.Amount then begin
                                Error('Amount cannot be modified');
                            end;
                        end;

                        Rec."Amount With VAT" := Rec.Amount;
                        if Rec."Account Type" in [Rec."Account Type"::Customer, Rec."Account Type"::Vendor,
                        Rec."Account Type"::"G/L Account", Rec."Account Type"::"Bank Account", Rec."Account Type"::"Fixed Asset"] then
                            case Rec."Account Type" of
                                Rec."Account Type"::"G/L Account":
                                    begin

                                        Rec.TestField(Amount);
                                        RecPayTypes.Reset;
                                        RecPayTypes.SetRange(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        if RecPayTypes.Find('-') then begin
                                            if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."VAT Code");
                                                TarriffCodes.Reset;
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."VAT Code");
                                                if TarriffCodes.Find('-') then begin
                                                    Rec."VAT Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                end;
                                            end
                                            else begin
                                                Rec."VAT Amount" := 0;
                                            end;

                                            if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."Withholding Tax Code");
                                                TarriffCodes.Reset;
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."Withholding Tax Code");
                                                if TarriffCodes.Find('-') then begin
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."Withholding Tax Amount" := (Rec.Amount - Rec."VAT Amount") * (TarriffCodes.Percentage / 100);
                                                end;
                                            end
                                            else begin
                                                Rec."Withholding Tax Amount" := 0;
                                            end;
                                        end;
                                    end;
                                Rec."Account Type"::Customer:
                                    begin

                                        Rec.TestField(Amount);
                                        RecPayTypes.Reset;
                                        RecPayTypes.SetRange(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        if RecPayTypes.Find('-') then begin
                                            if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                                                Rec.TestField("VAT Code");
                                                TarriffCodes.Reset;
                                                TarriffCodes.SetRange(TarriffCodes.Code, Rec."VAT Code");
                                                if TarriffCodes.Find('-') then begin
                                                    //"VAT Amount":=(TarriffCodes.Percentage/100)*Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                    //
                                                end;
                                            end
                                            else begin
                                                Rec."VAT Amount" := 0;
                                            end;

                                            if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes then begin
                                                Rec.TestField("Withholding Tax Code");
                                                TarriffCodes.Reset;
                                                TarriffCodes.SetRange(TarriffCodes.Code, Rec."Withholding Tax Code");
                                                if TarriffCodes.Find('-') then begin
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;

                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");

                                                end;
                                            end
                                            else begin
                                                Rec."Withholding Tax Amount" := 0;
                                            end;
                                        end;



                                    end;
                                Rec."Account Type"::Vendor:
                                    begin

                                        Rec.TestField(Amount);
                                        RecPayTypes.Reset;
                                        RecPayTypes.SetRange(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        if RecPayTypes.Find('-') then begin
                                            if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                                                Rec.TestField("VAT Code");
                                                TarriffCodes.Reset;
                                                TarriffCodes.SetRange(TarriffCodes.Code, Rec."VAT Code");
                                                if TarriffCodes.Find('-') then begin
                                                    Rec."VAT Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    //
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                    //
                                                end;
                                            end
                                            else begin
                                                Rec."VAT Amount" := 0;
                                            end;

                                            if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes then begin
                                                Rec.TestField("Withholding Tax Code");
                                                TarriffCodes.Reset;
                                                TarriffCodes.SetRange(TarriffCodes.Code, Rec."Withholding Tax Code");
                                                if TarriffCodes.Find('-') then begin
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    //
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");
                                                    //
                                                end;
                                            end
                                            else begin
                                                Rec."Withholding Tax Amount" := 0;
                                            end;
                                        end;


                                    end;
                                Rec."Account Type"::"Bank Account":
                                    begin

                                        Rec.TestField(Amount);
                                        RecPayTypes.Reset;
                                        RecPayTypes.SetRange(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        if RecPayTypes.Find('-') then begin
                                            if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."VAT Code");
                                                TarriffCodes.Reset;
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."VAT Code");
                                                if TarriffCodes.Find('-') then begin
                                                    //
                                                    Rec."VAT Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                    //
                                                end;
                                            end
                                            else begin
                                                Rec."VAT Amount" := 0;
                                            end;

                                            if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."Withholding Tax Code");
                                                TarriffCodes.Reset;
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."Withholding Tax Code");
                                                if TarriffCodes.Find('-') then begin
                                                    //
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");
                                                    //
                                                end;
                                            end
                                            else begin
                                                Rec."Withholding Tax Amount" := 0;
                                            end;
                                        end;


                                    end;
                                Rec."Account Type"::"Fixed Asset":
                                    begin

                                        Rec.TestField(Amount);
                                        RecPayTypes.Reset;
                                        RecPayTypes.SetRange(RecPayTypes.Code, Rec.Type);
                                        RecPayTypes.SetRange(RecPayTypes.Type, RecPayTypes.Type::Payment);
                                        if RecPayTypes.Find('-') then begin
                                            if RecPayTypes."VAT Chargeable" = RecPayTypes."VAT Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."VAT Code");
                                                TarriffCodes.Reset;
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."VAT Code");
                                                if TarriffCodes.Find('-') then begin
                                                    //"VAT Amount":=(TarriffCodes.Percentage/100)*Amount;
                                                    Rec."VAT Amount" := (Rec.Amount / ((TarriffCodes.Percentage + 100)) * TarriffCodes.Percentage);
                                                end;
                                            end
                                            else begin
                                                Rec."VAT Amount" := 0;
                                            end;

                                            if RecPayTypes."Withholding Tax Chargeable" = RecPayTypes."Withholding Tax Chargeable"::Yes then begin
                                                RecPayTypes.TestField(RecPayTypes."Withholding Tax Code");
                                                TarriffCodes.Reset;
                                                TarriffCodes.SetRange(TarriffCodes.Code, RecPayTypes."Withholding Tax Code");
                                                if TarriffCodes.Find('-') then begin
                                                    //
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * Rec.Amount;
                                                    Rec."Withholding Tax Amount" := (TarriffCodes.Percentage / 100) * (Rec.Amount - Rec."VAT Amount");
                                                    //
                                                end;
                                            end
                                            else begin
                                                Rec."Withholding Tax Amount" := 0;
                                            end;
                                        end;


                                    end;
                            end;


                        Rec."Net Amount" := Rec.Amount - Rec."Withholding Tax Amount";
                        Rec.Validate("Net Amount");
                    end;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    Visible = false;
                }
                field("Vendor Bank Account"; Rec."Vendor Bank Account")
                {
                    Visible = false;
                }
                field("VAT Rate"; Rec."VAT Rate")
                {
                    Visible = false;
                }
                field("Retention Code"; Rec."Retention Code")
                {
                    Visible = false;
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    Editable = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        TarriffCodes.Reset;
                        TarriffCodes.SetRange(TarriffCodes.Code, Rec."Withholding Tax Code");
                        if TarriffCodes.FindFirst then begin
                            //    "Withholding Tax Amount":=(TarriffCodes.Percentage/100)*Amount;
                            Rec."Withholding Tax Amount" := (Rec."Amount With VAT" - Rec."VAT Amount") * (TarriffCodes.Percentage / 100);
                        end
                        else begin
                            Rec."Withholding Tax Amount" := 0;
                        end;
                        Rec."Net Amount" := Rec.Amount - Rec."Withholding Tax Amount";
                    end;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    Editable = false;
                    Visible = false;
                }
                field("VAT Withholding Amount"; Rec."VAT Withholding Amount")
                {
                    Visible = false;
                }
                field("Withholding Tax Amount"; Rec."Withholding Tax Amount")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Retention  Amount"; Rec."Retention  Amount")
                {
                    Visible = false;
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    Editable = false;
                }
                field("Apply to ID"; Rec."Apply to ID")
                {
                    Editable = false;
                    Lookup = true;
                    Visible = false;
                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    Visible = false;
                }
                field("Applies-to Doc. No."; Rec."Applies-to Doc. No.")
                {
                    Visible = false;
                }
                field("Applies-to ID"; Rec."Applies-to ID")
                {
                    Visible = false;
                }
                // field("ShortcutDimCode[3]"; Rec.ShortcutDimCode[3])
                // {
                //     CaptionClass = '1,2,3';
                //     Visible = false;

                //     trigger OnLookup(var Text: Text): Boolean
                //     begin
                //         LookupShortcutDimCode(3, ShortcutDimCode[3]);
                //     end;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                //     end;
                // }
                // field("ShortcutDimCode[4]"; Rec.ShortcutDimCode[4])
                // {
                //     CaptionClass = '1,2,4';
                //     Visible = false;

                //     trigger OnLookup(var Text: Text): Boolean
                //     begin
                //         LookupShortcutDimCode(4, ShortcutDimCode[4]);
                //     end;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(4, ShortcutDimCode[4]);
                //     end;
                // }
                // field("ShortcutDimCode[5]"; Rec.ShortcutDimCode[5])
                // {
                //     CaptionClass = '1,2,5';
                //     Visible = false;

                //     trigger OnLookup(var Text: Text): Boolean
                //     begin
                //         LookupShortcutDimCode(5, ShortcutDimCode[5]);
                //     end;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(5, ShortcutDimCode[5]);
                //     end;
                // }
                // field("ShortcutDimCode[6]"; Rec.ShortcutDimCode[6])
                // {
                //     CaptionClass = '1,2,6';
                //     Visible = false;

                //     trigger OnLookup(var Text: Text): Boolean
                //     begin
                //         LookupShortcutDimCode(6, ShortcutDimCode[6]);
                //     end;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(6, ShortcutDimCode[6]);
                //     end;
                // }
                // field("ShortcutDimCode[7]"; Rec.ShortcutDimCode[7])
                // {
                //     CaptionClass = '1,2,7';
                //     Visible = false;

                //     trigger OnLookup(var Text: Text): Boolean
                //     begin
                //         LookupShortcutDimCode(7, ShortcutDimCode[7]);
                //     end;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(7, ShortcutDimCode[7]);
                //     end;
                // }
                // field("ShortcutDimCode[8]"; Rec.ShortcutDimCode[8])
                // {
                //     CaptionClass = '1,2,8';
                //     Visible = false;

                //     trigger OnLookup(var Text: Text): Boolean
                //     begin
                //         LookupShortcutDimCode(8, ShortcutDimCode[8]);
                //     end;

                //     trigger OnValidate()
                //     begin
                //         ValidateShortcutDimCode(8, ShortcutDimCode[8]);
                //     end;
                // }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    Visible = false;
                }
                field("Job No."; Rec."Job No.")
                {
                    Visible = false;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    var
        RecPayTypes: Record "Receipts and Payment Types";
        TarriffCodes: Record "Tariff Code s";
        GenJnlLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        LineNo: Integer;
        CustLedger: Record "Vendor Ledger Entry";
        CustLedger1: Record "Vendor Ledger Entry";
        Amt: Decimal;
        TotAmt: Decimal;
        ApplyInvoice: Codeunit "Purchase Header Apply";
        AppliedEntries: Record "Workplan Activities";
        VendEntries: Record "Vendor Ledger Entry";
        PInv: Record "Purch. Inv. Header";
        VATPaid: Decimal;
        VATToPay: Decimal;
        PInvLine: Record "Purch. Inv. Line";
        VATBase: Decimal;
        ShortcutDimCode: array[8] of Code[20];
}

