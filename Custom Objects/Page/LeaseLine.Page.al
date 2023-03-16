page 52186196 "Lease Line"
{
    Editable = true;
    PageType = ListPart;
    SourceTable = "Lease Line";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Charge No."; Rec."Charge No.")
                {
                }
                field("Charge Name"; Rec."Charge Name")
                {
                    Editable = false;
                }
                field("Rent/S.Charge Rate"; Rec."Rent/S.Charge Rate")
                {
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    Visible = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Amount Exclusive VAT"; Rec."Amount Exclusive VAT")
                {
                }
                field("Charge Letting Fee"; Rec."Charge Letting Fee")
                {
                    Visible = false;
                }
                field("Charge Reletting Fee"; Rec."Charge Reletting Fee")
                {
                    Visible = false;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    Editable = false;
                }
                field("Area Square ft"; Rec."Area Square ft")
                {
                    Editable = false;
                }
                field("Total Amount Inclusive VAT"; Rec."Total Amount Inclusive VAT")
                {
                    Editable = false;
                }
                field(Review; Rec.Review)
                {
                }
                field("Review Start Date"; Rec."Review Start Date")
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                        //obsolete in 2015
                        FrmCalendar.SetDate("Review Start Date");
                        FrmCalendar.RUNMODAL;
                        D := FrmCalendar.GetDate;
                        CLEAR(FrmCalendar);
                        IF D <> 0D THEN
                        "Review Start Date" := D;
                        VALIDATE("Review Start Date");
                        */

                    end;
                }
                field("Review Frequency"; Rec."Review Frequency")
                {
                }
                field("Review Frequency Value"; Rec."Review Frequency Value")
                {
                }
                field("Review End Date"; Rec."Review End Date")
                {
                }
                field("Review Amount"; Rec."Review Amount")
                {
                }
                field("Review Rate"; Rec."Review Rate")
                {
                }
                field("Contract Amount"; Rec."Contract Amount")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&View Review Table")
            {
                Caption = '&View Review Table';
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin


                    if Rec.Review = true then begin
                        LR.Reset;
                        LR.SetRange(LR."Lease No.", Rec."Lease No.");
                        LR.SetRange(LR."Charge No.", Rec."Charge No.");
                        LR.SetRange(LR.Effected, true);
                        if LR.FindFirst then begin
                            Error('Lease already has reviews tied to the Charge and Effected');
                        end
                        else begin
                            LR.Reset;
                            LR.SetRange(LR."Lease No.", Rec."Lease No.");
                            LR.SetRange(LR."Charge No.", Rec."Charge No.");
                            LR.DeleteAll;
                        end;

                        if Rec."Review Frequency" = Rec."Review Frequency"::Days then begin
                            FType := 'D';
                        end
                        else
                            if Rec."Review Frequency" = Rec."Review Frequency"::Weeks then begin
                                FType := 'W';
                            end
                            else
                                if Rec."Review Frequency" = Rec."Review Frequency"::Months then begin
                                    FType := 'M';
                                end
                                else
                                    if Rec."Review Frequency" = Rec."Review Frequency"::Quarters then begin
                                        FType := 'Q';
                                    end
                                    else
                                        if Rec."Review Frequency" = Rec."Review Frequency"::Years then begin
                                            FType := 'Y';
                                        end;

                        FValue := Rec."Review Frequency Value";
                        EffectDate := Rec."Review Start Date";
                        //OldAmount:=Total;
                        "OldAmount[Rate]" := Rec."Amount Exclusive VAT";
                        "OldAmount[ReviewAmount]" := Rec."Amount Exclusive VAT";
                        repeat
                            EffectDate := CalcDate(Format(FValue) + Format(FType), EffectDate);
                            //check if the review is rate based or a flat figure
                            Rec."Review Is Rate ?" := true;
                            Rec."Review Is Amount" := true;
                            if Rec."Review Is Rate ?" = true then begin
                                "NewAmount[Rate]" := "OldAmount[Rate]" + (("OldAmount[Rate]" * Rec."Review Rate") / 100);
                                "NewAmount[ReviewAmount]" := "OldAmount[ReviewAmount]" + Rec."Review Amount";
                            end;
                            LR.Reset;
                            if LR.FindLast then begin
                                IntC := LR."Line No.";
                            end
                            else begin
                                IntC := 0;
                            end;
                            IntC := IntC + 1;

                            //insert the values and display the same
                            LR.Init;
                            LR."Line No." := IntC;
                            LR."Lease No." := Rec."Lease No.";
                            LR."Charge No." := Rec."Charge No.";
                            LR."Charge Name" := Rec."Charge Name";
                            LR."Old Amount[Rate]" := "OldAmount[Rate]";
                            LR."Old Amount[Review Amount]" := "OldAmount[ReviewAmount]";
                            LR."Effect Date" := EffectDate;
                            LR."New [Review Amount]" := "NewAmount[ReviewAmount]";
                            LR."New [Rate Amount]" := "NewAmount[Rate]";
                            LR.Insert;
                            //set the old amount to be the same as the new amount
                            // OldAmount:=NewAmount;
                            "OldAmount[Rate]" := "NewAmount[Rate]";
                            "OldAmount[ReviewAmount]" := "NewAmount[ReviewAmount]";
                        until EffectDate >= Rec."Review End Date";
                    end;
                    LR.Reset;
                    LR.SetRange(LR."Lease No.", Rec."Lease No.");
                    LR.SetRange(LR."Charge No.", Rec."Charge No.");
                    PAGE.Run(PAGE::"Lease Charge Review View", LR);
                end;
            }
        }
    }

    var
        LR: Record "Lease Charge Review";
        IntC: Integer;
        EffectDate: Date;
        "NewAmount[Rate]": Decimal;
        FType: Text[30];
        FValue: Integer;
        "OldAmount[Rate]": Decimal;
        LeaseLine: Record "Lease Line";
        "NewAmount[ReviewAmount]": Decimal;
        "OldAmount[ReviewAmount]": Decimal;
        PropertyCharges: Record "Property Charges";
        ApprovalEntry: Record "Approval Entry";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,Lease;
        Lease: Record Lease;
        FrmCalendar: Page "Units Meter Rating";
        D: Date;
}

