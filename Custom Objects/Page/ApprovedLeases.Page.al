page 52186232 "Approved Leases"
{
    PageType = Card;
    SourceTable = Lease;
    SourceTableView = WHERE(Blocked = CONST(false),
                            Commenced = CONST(false));

    layout
    {
        area(content)
        {
            group("Lease Information")
            {
                Caption = 'Lease Information';
                field("No."; Rec."No.")
                {
                    Caption = 'Lease No.';
                }
                field("Date Registered"; Rec."Date Registered")
                {
                    Caption = 'Document Date';
                }
                field("Property No."; Rec."Property No.")
                {
                }
                field("Property Name"; Rec."Property Name")
                {
                    Editable = false;
                }
                field("L.R. No."; Rec."L.R. No.")
                {
                    Editable = false;
                }
                field("Property Type"; Rec."Property Type")
                {
                    Editable = false;

                    trigger OnValidate()
                    begin
                        if Rec."Property Type" = 'RESIDENTIAL' then
                            "Area square ftVisible" := true;
                    end;
                }
                field("Floor No."; Rec."Floor No.")
                {
                }
                field("Floor Name"; Rec."Floor Name")
                {
                    Editable = false;
                }
                field("Unit Code"; Rec."Unit Code")
                {
                }
                field("Unit Description"; Rec."Unit Description")
                {
                    Editable = false;
                }
                field("Unit Type"; Rec."Unit Type")
                {
                    Editable = false;
                }
                field("Unit Type Description"; Rec."Unit Type Description")
                {
                    Editable = false;
                }
                field("Landlord No."; Rec."Landlord No.")
                {
                    Editable = false;
                }
                field("Landlord Name"; Rec."Landlord Name")
                {
                    Editable = false;
                }
                field("Tenant No."; Rec."Tenant No.")
                {
                }
                field("Tenant Name"; Rec."Tenant Name")
                {
                    Editable = false;
                }
                field(User; Rec.User)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Meter No."; Rec."Meter No.")
                {
                    Editable = false;
                }
                field("Area square ft"; Rec."Area square ft")
                {
                    Editable = false;
                    Visible = "Area square ftVisible";
                }
                field("Total Amount Excl. VAT"; Rec."Total Amount Excl. VAT")
                {
                    Editable = false;
                }
            }
            part(Control1102755030; "Lease Line")
            {
                SubPageLink = "Lease No." = FIELD("No.");
            }
            group("Lease Billing")
            {
                Caption = 'Lease Billing';
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Lease Commence Date"; Rec."Lease Commence Date")
                {
                }
                field("Duration Type"; Rec."Duration Type")
                {
                }
                field("Duration Value"; Rec."Duration Value")
                {
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    Editable = false;
                }
                field("Billing Frequency"; Rec."Billing Frequency")
                {
                }
                field("Billing Frequency Value"; Rec."Billing Frequency Value")
                {
                }
                field("Last Bill Date"; Rec."Last Bill Date")
                {
                    Editable = false;
                }
                field("Next Bill Date"; Rec."Next Bill Date")
                {
                    Editable = false;
                }
            }
            group("Other Details")
            {
                Caption = 'Other Details';
                field("Letter Of Offer"; Rec."Letter Of Offer")
                {
                }
                field("Lease Agreement Ref. No."; Rec."Lease Agreement Ref. No.")
                {
                }
                field("Letting Fee"; Rec."Letting Fee")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&View Lease Review")
            {
                Caption = '&View Lease Review';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    LeaseLine.Reset;
                    LeaseLine.SetRange(LeaseLine."Lease No.", Rec."No.");
                    if LeaseLine.Find('-') then begin
                        if LeaseLine.Review = true then begin
                            LR.Reset;
                            LR.SetRange(LR."Lease No.", Rec."No.");
                            LR.SetRange(LR."Charge No.", LeaseLine."Charge No.");
                            LR.SetRange(LR.Effected, true);
                            if LR.FindFirst then begin
                                Error('Lease already has reviews tied to the Charge and Effected');
                            end
                            else begin
                                LR.Reset;
                                LR.SetRange(LR."Lease No.", LeaseLine."Lease No.");
                                LR.SetRange(LR."Charge No.", LeaseLine."Charge No.");
                                LR.DeleteAll;
                            end;

                            if LeaseLine."Review Frequency" = LeaseLine."Review Frequency"::Days then begin
                                FType := 'D';
                            end
                            else
                                if LeaseLine."Review Frequency" = LeaseLine."Review Frequency"::Weeks then begin
                                    FType := 'W';
                                end
                                else
                                    if LeaseLine."Review Frequency" = LeaseLine."Review Frequency"::Months then begin
                                        FType := 'M';
                                    end
                                    else
                                        if LeaseLine."Review Frequency" = LeaseLine."Review Frequency"::Quarters then begin
                                            FType := 'Q';
                                        end
                                        else
                                            if LeaseLine."Review Frequency" = LeaseLine."Review Frequency"::Years then begin
                                                FType := 'Y';
                                            end;

                            FValue := LeaseLine."Review Frequency Value";
                            EffectDate := LeaseLine."Review Start Date";
                            //OldAmount:=Total;
                            "OldAmount[Rate]" := LeaseLine."Amount Exclusive VAT";
                            "OldAmount[ReviewAmount]" := LeaseLine."Amount Exclusive VAT";
                            repeat
                                EffectDate := CalcDate(Format(FValue) + Format(FType), EffectDate);
                                //check if the review is rate based or a flat figure
                                LeaseLine."Review Is Rate ?" := true;
                                LeaseLine."Review Is Amount" := true;
                                if LeaseLine."Review Is Rate ?" = true then begin
                                    "NewAmount[Rate]" := "OldAmount[Rate]" + (("OldAmount[Rate]" * LeaseLine."Review Rate") / 100);
                                    "NewAmount[ReviewAmount]" := "OldAmount[ReviewAmount]" + LeaseLine."Review Amount";
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
                                LR."Lease No." := LeaseLine."Lease No.";
                                LR."Charge No." := LeaseLine."Charge No.";
                                LR."Charge Name" := LeaseLine."Charge Name";
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
                            until EffectDate >= LeaseLine."Review End Date";
                        end;
                        LR.Reset;
                        LR.SetRange(LR."Lease No.", LeaseLine."Lease No.");
                        LR.SetRange(LR."Charge No.", LeaseLine."Charge No.");
                        PAGE.Run(PAGE::"Lease Charge Review View", LR);
                    end;
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Visible = true;
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    begin

                        // ApprovalEntry."Document Type" := ApprovalEntry."Document Type"::"63";
                        ApprovalEntries.Setfilters(DATABASE::Lease, ApprovalEntry."Document Type", Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF LinesCommitted THEN
                        // ERROR('All Lines should be committed');

                        if Rec.Status = Rec.Status::Approved then begin


                            Error('Lease Approval Request has Already been Approved');
                        end
                        // ELSE
                        //  IF ApprovalMgt.SendLeaseApprovalRequest(Rec) THEN;
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF ApprovalMgt.CancelLeaseApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
            }
        }
    }

    trigger OnInit()
    begin
        "Area square ftVisible" := true;
    end;

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
        Lease: Record Lease;
        PropertyCharges: Record "Property Charges";
        ApprovalEntry: Record "Approval Entry";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,Lease;
        Status1: Boolean;
        StatusTrue: Option;
        [InDataSet]
        "Area square ftVisible": Boolean;
}

