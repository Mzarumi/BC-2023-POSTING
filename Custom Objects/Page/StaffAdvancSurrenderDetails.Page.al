page 52185952 "Staff Advanc Surrender Details"
{
    Caption = 'Staff Imprest Surrender Details';
    PageType = ListPart;
    SourceTable = "Staff Advanc Surrender Details";

    layout
    {
        area(content)
        {
            repeater(Control1102758000)
            {
                ShowCaption = false;
                field("Line No."; Rec."Line No.")
                {
                    Importance = Additional;
                }
                field("Imprest Type"; Rec."Imprest Type")
                {
                }
                field("Account No:"; Rec."Account No:")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                    Caption = 'Description';
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                }
                field("Actual Spent"; Rec."Actual Spent")
                {
                }
                field("Cash Receipt No"; Rec."Cash Receipt No")
                {
                    Caption = 'Deposit No.';
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                }
                field("Apply to"; Rec."Apply to")
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec."Apply to" := '';
                        Rec."Apply to ID" := '';

                        //Amt:=0;

                        Custledger.Reset;
                        Custledger.SetCurrentKey(Custledger."Customer No.", Open, "Document No.");
                        Custledger.SetRange(Custledger."Customer No.", Rec."Advance Holder");
                        Custledger.SetRange(Open, true);
                        //CustLedger.SETRANGE(CustLedger."Transaction Type",CustLedger."Transaction Type"::"Down Payment");
                        Custledger.CalcFields(Custledger.Amount);
                        if PAGE.RunModal(25, Custledger) = ACTION::LookupOK then begin

                            if Custledger."Applies-to ID" <> '' then begin
                                Custledger1.Reset;
                                Custledger1.SetCurrentKey(Custledger1."Customer No.", Open, "Applies-to ID");
                                Custledger1.SetRange(Custledger1."Customer No.", Rec."Advance Holder");
                                Custledger1.SetRange(Open, true);
                                //CustLedger1.SETRANGE("Transaction Type",CustLedger1."Transaction Type"::"Down Payment");
                                Custledger1.SetRange("Applies-to ID", Custledger."Applies-to ID");
                                if Custledger1.Find('-') then begin
                                    repeat
                                        Custledger1.CalcFields(Custledger1.Amount);
                                        Amt := Amt + Abs(Custledger1.Amount);
                                    until Custledger1.Next = 0;
                                end;

                                if Amt <> Amt then
                                    //ERROR('Amount is not equal to the amount applied on the application form');
                                    /*Amount:=Amt;
                                    VALIDATE(Amount);*/
                           Rec."Apply to" := Custledger."Document No.";
                                Rec."Apply to ID" := Custledger."Applies-to ID";
                            end else begin
                                if Rec.Amount <> Abs(Custledger.Amount) then
                                    Custledger.CalcFields(Custledger."Remaining Amount");

                                /*Amount:=ABS(CustLedger."Remaining Amount");
                                 VALIDATE(Amount);*/
                                //ERROR('Amount is not equal to the amount applied on the application form');

                                Rec."Apply to" := Custledger."Document No.";
                                Rec."Apply to ID" := Custledger."Applies-to ID";

                            end;
                        end;

                        if Rec."Apply to ID" <> '' then
                            Rec."Apply to" := '';

                        Rec.Validate(Amount);

                    end;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = true;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = true;
                }
                //here
                // field("ShortcutDimCode[3]"; Rec.ShortcutDimCode[3])
                // {
                //     CaptionClass = '1,2,3';

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
        Custledger: Record "Cust. Ledger Entry";
        Custledger1: Record "Cust. Ledger Entry";
        Amt: Decimal;
        ShortcutDimCode: array[8] of Code[20];
}

