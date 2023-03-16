page 52186191 Lease
{
    DeleteAllowed = false;
    Editable = true;
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
                    Editable = false;
                }
                field("Date Registered"; Rec."Date Registered")
                {
                    Caption = 'Document Date';
                }
                field("Tenant No."; Rec."Tenant No.")
                {
                }
                field("Tenant Name"; Rec."Tenant Name")
                {
                    Editable = false;
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
                    Caption = 'Unit Name';
                }
                field("Unit Type"; Rec."Unit Type")
                {
                    Editable = false;
                }
                field("Unit Type Description"; Rec."Unit Type Description")
                {
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
                field(User; Rec.User)
                {
                    Caption = 'User';
                    Editable = false;
                    Visible = true;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Meter No."; Rec."Meter No.")
                {
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
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Lease Type"; Rec."Lease Type")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                    Editable = false;
                }
            }
            group("Lease Billing")
            {
                Caption = 'Lease Billing';
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Department Name"; Rec."Department Name")
                {
                    Editable = false;
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
                }
                field("Billing Frequency"; Rec."Billing Frequency")
                {
                    Caption = 'Billing Mode';
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
            part(Control1102755030; "Lease Line")
            {
                SubPageLink = "Lease No." = FIELD("No.");
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
                field("Lease Agreement Signed"; Rec."Lease Agreement Signed")
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
                        repeat
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
                        until LeaseLine.Next = 0;
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

                        //here//ApprovalEntry."Document Type" := ApprovalEntry."Document Type"::"17";
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
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin

                        //IF LinesCommitted THEN
                        // ERROR('All Lines should be committed');
                        Rec.TestField("Lease Commence Date");
                        Rec.TestField("Billing Frequency");
                        //Rec.TestField("Billing Frequency Value");
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
                            else
                                VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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
                            Rec."Billing Frequency" := Rec."Billing Frequency"::Monthly;
                            Rec."Duration Type" := Rec."Duration Type"::Years;
                            Rec."Duration Value" := 0;
                            Rec.Status := Rec.Status::Open;
                            Rec.Commenced := false;
                            Rec.Select := false;
                            Rec."Renew Lease" := true;
                            LeaseLine.DeleteAll;
                            Rec.Modify;

                        end;
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
        PropertyCharges: Record "Unit Setup Charges";
        ApprovalEntry: Record "Approval Entry";
        Doc_Type: Option LPO,Requisition,Imprest,"Payment Voucher";
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,Lease;
        Status1: Boolean;
        StatusTrue: Option;
        D: Date;
        [InDataSet]
        "Area square ftVisible": Boolean;
        VarVariant: Variant;
}

