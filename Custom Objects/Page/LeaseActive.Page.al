page 52186198 "Lease-Active"
{
    Editable = true;
    PageType = Card;
    SourceTable = Lease;
    SourceTableView = WHERE(Blocked = CONST(false),
                            Commenced = CONST(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Date Registered"; Rec."Date Registered")
                {
                    Editable = false;
                }
                field("Property No."; Rec."Property No.")
                {
                    Editable = false;
                }
                field("L.R. No."; Rec."L.R. No.")
                {
                    Editable = false;
                }
                field("Property Name"; Rec."Property Name")
                {
                    Editable = false;
                }
                field("Floor No."; Rec."Floor No.")
                {
                    Editable = false;
                }
                field("Floor Name"; Rec."Floor Name")
                {
                    Editable = false;
                }
                field("Unit Code"; Rec."Unit Code")
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
                    Visible = false;
                }
                field("Landlord Name"; Rec."Landlord Name")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Tenant No."; Rec."Tenant No.")
                {
                    Editable = false;
                }
                field("Tenant Name"; Rec."Tenant Name")
                {
                    Editable = false;
                }
                field("Total Amount Excl. VAT"; Rec."Total Amount Excl. VAT")
                {
                    Editable = false;
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    Editable = false;
                }
                field("Meter No."; Rec."Meter No.")
                {
                }
                field("Previous Reading"; Rec."Previous Reading")
                {
                    Editable = true;
                }
                field("Current Reading"; Rec."Current Reading")
                {
                    Editable = true;
                    Enabled = true;
                }
                field("Nairobi Pr Reading"; Rec."Nairobi Pr Reading")
                {
                    Editable = false;
                }
                field("Nairobi Cur Reading"; Rec."Nairobi Cur Reading")
                {
                    Editable = false;
                }
                field(User; Rec.User)
                {
                    Editable = false;
                }
                field("Lease Balance"; Rec."Lease Balance")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Area square ft"; Rec."Area square ft")
                {
                }
                field(FirstBilling; Rec.FirstBilling)
                {
                }
                field(Prepayment; Rec.Prepayment)
                {
                }
            }
            part(Control1102755026; "Lease Line")
            {
                SubPageLink = "Lease No." = FIELD("No.");
            }
            group(Billing)
            {
                Caption = 'Billing';
                field("Lease Commence Date"; Rec."Lease Commence Date")
                {
                    Editable = false;
                }
                field("Duration Type"; Rec."Duration Type")
                {
                    Editable = false;
                }
                field("Duration Value"; Rec."Duration Value")
                {
                    Editable = false;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    Editable = false;
                }
                field("Billing Frequency"; Rec."Billing Frequency")
                {
                    Editable = false;
                }
                field("Billing Frequency Value"; Rec."Billing Frequency Value")
                {
                    Editable = false;
                }
                field("Last Bill Date"; Rec."Last Bill Date")
                {
                    Editable = false;
                }
                field("Next Bill Date"; Rec."Next Bill Date")
                {
                    Editable = true;
                }
            }
            group("Other Details")
            {
                Caption = 'Other Details';
                field("Letter Of Offer"; Rec."Letter Of Offer")
                {
                    Editable = false;
                }
                field("Lease Agreement Ref. No."; Rec."Lease Agreement Ref. No.")
                {
                    Editable = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    Editable = false;
                }
                field(Commenced; Rec.Commenced)
                {
                    Editable = false;
                }
                field("Lease Agreement Signed"; Rec."Lease Agreement Signed")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Activate Lease Review")
            {
                Caption = '&Activate Lease Review';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    LeaseLine.Reset;
                    LeaseLine.SetRange(LeaseLine."Lease No.", Rec."No.");
                    if LeaseLine.Find('-') then begin
                        repeat
                            if LeaseLine.Review = true then begin
                                LR.Reset;
                                LR.SetRange(LR."Lease No.", Rec."No.");
                                LR.SetRange(LR."Charge No.", LeaseLine."Charge No.");
                                LR.SetRange(LR.Effected, true);
                                if LR.FindFirst then
                                    repeat
                                    begin
                                        Error('Lease already has reviews tied to the Charge and Effected');
                                    end
                                    until LR.Next = 0
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
                        until LeaseLine.Next = 0;
                    end;
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Visible = true;
                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF LinesCommitted THEN
                        // ERROR('All Lines should be committed');
                        Rec.TestField("Lease Commence Date");
                        Rec.TestField("Billing Frequency");
                        Rec.TestField("Billing Frequency Value");
                        Rec.TestField("Duration Type");
                        Rec.TestField("Duration Value");
                        Rec.TestField("Letter Of Offer");
                        Rec.TestField(User);

                        if Rec.Status = Rec.Status::Approved then begin
                            Error('Lease Approval Request has Already been Approved');
                        end
                        else
                            if Rec.Status = Rec.Status::"Pending Approval" then begin
                                Error('Lease Approval Request is Already at the Pending Level');
                            end
                        /* ELSE
                          IF ApprovalMgt.SendLeaseApprovalRequest(Rec) THEN;*/

                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';
                    Visible = false;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        //IF ApprovalMgt.CancelLeaseApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                action("Renew Lease")
                {
                    Caption = 'Renew Lease';

                    trigger OnAction()
                    begin
                        if Confirm('Are You sure You want to Re-New the Lease Document?', false) = false then begin exit end;

                        LeaseLine.Reset;
                        LeaseLine.SetRange(LeaseLine."Lease No.", Rec."No.");
                        if LeaseLine.Find('-') then begin
                            Rec."Lease Commence Date" := Today;
                            Rec."Expiry Date" := Today;
                            Rec.Status := Rec.Status::Open;
                            Rec."Billing Frequency" := Rec."Billing Frequency"::Monthly;
                            Rec."Duration Type" := Rec."Duration Type"::Years;
                            Rec."Duration Value" := 0;
                            Rec.Commenced := false;
                            Rec.Select := false;
                            Rec."Renew Lease" := true;
                            LeaseLine.DeleteAll;
                            Rec.Modify;
                        end else
                            Rec."Lease Commence Date" := Today;
                        Rec."Expiry Date" := Today;
                        Rec.Status := Rec.Status::Open;
                        Rec."Billing Frequency" := Rec."Billing Frequency"::Monthly;
                        Rec."Duration Type" := Rec."Duration Type"::Years;
                        Rec."Duration Value" := 0;
                        Rec.Commenced := false;
                        Rec.Select := false;
                        Rec."Renew Lease" := true;
                        Rec.Modify;
                    end;
                }
                action("Reset Meter Readings")
                {
                    Caption = 'Reset Meter Readings';

                    trigger OnAction()
                    begin
                        if Confirm('Are You sure You want to Reset the Water Meter Readings?', false) = false then begin exit end;

                        LeaseLine.Reset;
                        LeaseLine.SetRange(LeaseLine."Lease No.", Rec."No.");
                        if LeaseLine.Find('-') then begin
                            Rec."Previous Reading" := 0;
                            Rec."Current Reading" := 0;
                            Rec."Nairobi Pr Reading" := 0;
                            Rec."Nairobi Cur Reading" := 0;
                            Rec.Modify;

                        end;
                        Message('The Water Meter Reading for Lease%1'' has been Reset', Format(Rec."No."));
                    end;
                }
                action("Create Prepayment")
                {
                    Caption = 'Create Prepayment';

                    trigger OnAction()
                    begin
                        //check if the lease prepayment has already been created
                        SalesHeader.Reset;
                        SalesHeader.SetRange(SalesHeader."Lease No", Rec."No.");
                        if SalesHeader.Find('-') then begin
                            Error(DoceumentErr, Rec."No.");
                        end;
                        if Confirm(ConfirmPrepText, false) then begin
                            if Rec.Prepayment = false then begin
                                Error(PrepaymentErr);
                            end;
                            //check if contract amount has been entered
                            LeaseLine.Reset;
                            LeaseLine.SetRange(LeaseLine."Lease No.", Rec."No.");
                            if LeaseLine.Find('-') then begin
                                LeaseLine.TestField(LeaseLine."Contract Amount");
                            end;
                            //raise new sales order both heade and lines
                            SalesHeader.Init;
                            SalesHeader."No." := '';
                            SalesHeader."Document Type" := SalesHeader."Document Type"::Order;
                            SalesHeader.Insert(true);
                            SalesHeader."Sell-to Customer No." := Rec."Tenant No.";
                            SalesHeader.Validate(SalesHeader."Sell-to Customer No.");
                            SalesHeader."Lease No" := Rec."No.";
                            SalesHeader."Prepayment %" := 100;
                            SalesHeader."Currency Code" := Rec."Currency Code";
                            SalesHeader.Validate(SalesHeader."Currency Code");

                            SalesHeader.Modify;

                            //insert lines
                            LeaseLine.Reset;
                            LeaseLine.SetRange(LeaseLine."Lease No.", Rec."No.");
                            if LeaseLine.Find('-') then begin
                                repeat
                                    SalesLine.Init;
                                    SalesLine."Document Type" := SalesLine."Document Type"::Order;
                                    SalesLine."Document No." := SalesHeader."No.";
                                    SalesLine.Type := SalesLine.Type::"G/L Account";
                                    SalesLine."Sell-to Customer No." := Rec."Tenant No.";
                                    LeaseLine.CalcFields(LeaseLine."No.");
                                    SalesLine."No." := LeaseLine."No.";
                                    SalesLine.Validate(SalesLine."No.");
                                    SalesLine.Quantity := 1;
                                    SalesLine.Validate(SalesLine.Quantity);
                                    SalesLine."Unit Price" := LeaseLine."Contract Amount";
                                    SalesLine.Validate(SalesLine."Unit Price");
                                    SalesLine."Line No." := SalesLine."Line No." + 100;
                                    SalesLine.Insert(true);
                                until LeaseLine.Next = 0;
                            end;
                            Message(CreatePrepaymentText, SalesHeader."No.");
                        end;
                    end;
                }
                action("Payment Schedule")
                {
                    Caption = 'Payment Schedule';
                    Image = Statistics;
                    RunObject = Page "Payment Schedule";
                    RunPageLink = "Lease No" = FIELD("No.");
                }
            }
        }
    }

    var
        LeaseLine: Record "Lease Line";
        LR: Record "Lease Charge Review";
        IntC: Integer;
        EffectDate: Date;
        "NewAmount[Rate]": Decimal;
        FType: Text[30];
        FValue: Integer;
        "OldAmount[Rate]": Decimal;
        "NewAmount[ReviewAmount]": Decimal;
        "OldAmount[ReviewAmount]": Decimal;
        Lease: Record Lease;
        PropertyCharges: Record "Unit Setup Charges";
        ApprovalEntry: Record "Approval Entry";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,Lease;
        Status1: Boolean;
        StatusTrue: Option;
        FrmCalendar: Page "Units Meter Rating";
        D: Date;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CreatePrepaymentText: Label 'Sales Prepayment No %1 has been created Successfully';
        ConfirmPrepText: Label 'Are you sure you want to create deferement Invoice';
        PrepaymentErr: Label 'You CANNOT create Deferement Invoice if Prepayment is not selected';
        DoceumentErr: Label 'Prepayment Invoice for %1 was already created.';
        ConfirmLeaseTerm: Label 'Are you sure you want to Terminate Lease';
}

