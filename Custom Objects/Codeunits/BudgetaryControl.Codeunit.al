#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185483 "Budgetary Control"
{

    trigger OnRun()
    begin
    end;

    var
        BCSetup: Record 52185866;
        // DimMgt: Codeunit DimensionManagement;
        ShortcutDimCode: array[8] of Code[20];
        BudgetGL: Code[20];
        Text0001: label 'You Have exceeded the Budget by ';
        Text0002: label ' Do you want to Continue?';
        Text0003: label 'There is no Budget to Check against do you wish to continue?';
        DimCode1: Code[20];
        DimCode2: Code[20];
        BudgetCheckTxt: label 'Budgetary Checking Completed Successfully';


    procedure CheckBudget(var Variant: Variant)
    var
        RecRef: RecordRef;
        PurchaseHeader: Record "Purchase Header";
        PaymentHeader: Record 52185888;
        StaffClaim: Record 52185912;
        StaffAdvance: Record 52185914;
        StaffAdvanceSurr: Record 52185916;
        ImprestHeader: Record 52185909;
        ImprestHeaderSurr: Record 52185885;
        PaymentsHeaderBoard: Record 52185895;
    begin
        RecRef.GetTable(Variant);

        case RecRef.Number of
            Database::"Purchase Header":
                begin
                    PurchaseHeader := Variant;
                    CheckPurchase(PurchaseHeader);
                end;
            Database::"Payments Header":
                begin
                    PaymentHeader := Variant;
                    CheckPayments(PaymentHeader);
                end;
            Database::"Staff Claims Header":
                begin
                    StaffClaim := Variant;
                    CheckStaffClaim(StaffClaim);
                end;
            Database::"Staff Advance Header":
                begin
                    StaffAdvance := Variant;
                    CheckStaffAdvance(StaffAdvance);
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    StaffAdvanceSurr := Variant;
                    CheckStaffAdvSurr(StaffAdvanceSurr);
                end;
            Database::"Imprest Header":
                begin
                    ImprestHeader := Variant;
                    CheckImprest(ImprestHeader);
                    //ImprestHeaderSurr := Variant;
                end;
            Database::"Payments Header Board":
                begin
                    PaymentsHeaderBoard := Variant;
                    CheckPVBoard(PaymentsHeaderBoard);
                end;
        /*
            DATABASE::"Imprest surrender Header":
            BEGIN
              ImprestHeaderSurr := Variant;
              CheckImprestSurr(ImprestHeaderSurr);
            END;
        */
        end;

    end;


    procedure CancelBudget(var Variant: Variant)
    var
        RecRef: RecordRef;
        DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance;
        PurchaseHeader: Record "Purchase Header";
        PaymentHeader: Record 52185888;
        StaffClaim: Record 52185912;
        StaffAdvance: Record 52185914;
        StaffAdvanceSurr: Record 52185916;
        ImprestHeader: Record 52185909;
        ImprestHeaderSurr: Record 52185885;
    begin
        RecRef.GetTable(Variant);

        case RecRef.Number of
            Database::"Purchase Header":
                begin
                    PurchaseHeader := Variant;
                    if PurchaseHeader."Document Type" = PurchaseHeader."document type"::Quote then
                        DeleteEntries(Documenttype::Requisition, PurchaseHeader."No.")
                    else
                        if PurchaseHeader."Document Type" = PurchaseHeader."document type"::Order then
                            DeleteEntries(Documenttype::LPO, PurchaseHeader."No.")
                        else
                            if PurchaseHeader."Document Type" = PurchaseHeader."document type"::Invoice then
                                DeleteEntries(Documenttype::PurchInvoice, PurchaseHeader."No.");
                end;
            Database::"Payments Header":
                begin
                    PaymentHeader := Variant;
                    if PaymentHeader."Document Type" = PaymentHeader."document type"::"Payment Voucher" then
                        DeleteEntries(Documenttype::"Payment Voucher", PaymentHeader."No.")
                    else
                        DeleteEntries(Documenttype::PettyCash, PaymentHeader."No.");
                end;
            Database::"Staff Claims Header":
                begin
                    StaffClaim := Variant;
                    DeleteEntries(Documenttype::StaffClaim, StaffClaim."No.");
                end;
            Database::"Staff Advance Header":
                begin
                    StaffAdvance := Variant;
                    DeleteEntries(Documenttype::StaffAdvance, StaffAdvance."No.");
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    StaffAdvanceSurr := Variant;
                    DeleteEntries(Documenttype::StaffAdvance, StaffAdvanceSurr.No);
                end;
            Database::"Imprest Header":
                begin
                    ImprestHeader := Variant;
                    DeleteEntries(Documenttype::Imprest, ImprestHeader."No.");
                end;
        /*
            DATABASE::"Imprest surrender Header":
            BEGIN
              ImprestHeaderSurr := Variant;
              DeleteEntries(DocumentType::Imprest,ImprestHeaderSurr.No);
            END;
        */
        end;
        ReverseandUncommitt(Variant);

    end;


    procedure ReverseBudget(var Variant: Variant)
    var
        RecRef: RecordRef;
        DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance;
        PurchaseHeader: Record "Purchase Header";
        PaymentHeader: Record 52185888;
        StaffClaim: Record 52185912;
        StaffAdvance: Record 52185914;
        StaffAdvanceSurr: Record 52185916;
        ImprestHeader: Record 52185909;
        ImprestHeaderSurr: Record 52185885;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Purchase Header":
                begin
                    PurchaseHeader := Variant;
                    if PurchaseHeader."Document Type" = PurchaseHeader."document type"::Quote then
                        ReverseEntries(Documenttype::Requisition, PurchaseHeader."No.")
                    else
                        if PurchaseHeader."Document Type" = PurchaseHeader."document type"::Order then
                            OrderCommittmentReversal(Documenttype::LPO, PurchaseHeader."No.")
                        else
                            if PurchaseHeader."Document Type" = PurchaseHeader."document type"::Invoice then
                                ReverseEntries(Documenttype::PurchInvoice, PurchaseHeader."No.");
                end;
            Database::"Payments Header":
                begin
                    PaymentHeader := Variant;
                    if PaymentHeader."Document Type" = PaymentHeader."document type"::"Payment Voucher" then
                        ReverseEntries(Documenttype::"Payment Voucher", PaymentHeader."No.")
                    else
                        ReverseEntries(Documenttype::PettyCash, PaymentHeader."No.");
                end;
            Database::"Staff Claims Header":
                begin
                    StaffClaim := Variant;
                    ReverseEntries(Documenttype::StaffClaim, StaffClaim."No.");
                end;
            Database::"Staff Advance Header":
                begin
                    StaffAdvance := Variant;
                    ReverseEntries(Documenttype::StaffAdvance, StaffAdvance."No.");
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    StaffAdvanceSurr := Variant;
                    ReverseEntries(Documenttype::StaffAdvance, StaffAdvanceSurr.No);
                end;
            Database::"Imprest Header":
                begin
                    ImprestHeader := Variant;
                    ReverseEntries(Documenttype::Imprest, ImprestHeader."No.");
                end;
            Database::"Imprest Surrender Header":
                begin
                    ImprestHeaderSurr := Variant;
                    ReverseEntries(Documenttype::Imprest, ImprestHeaderSurr.No);
                end;
        end;
        ReverseandUncommitt(Variant);
    end;


    procedure CheckPurchase(var PurchHeader: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
        Commitments: Record 52185867;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "G/L Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "FA Depreciation Book";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
        dimSetEntry: Record "Dimension Set Entry";
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset;
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (PurchHeader."Document Date" < BCSetup."Current Budget Start Date") then begin
                Error('The Current Date %1 In The Order Does Not Fall Within Budget Dates %2 - %3', PurchHeader."Document Date",
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            end
            else
                if (PurchHeader."Document Date" > BCSetup."Current Budget End Date") then begin
                    Error('The Current Date %1 In The Order Does Not Fall Within Budget Dates %2 - %3', PurchHeader."Document Date",
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");

                end;
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");
            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PurchLine.Reset;
            PurchLine.SetRange(PurchLine."Document Type", PurchHeader."Document Type");
            PurchLine.SetRange(PurchLine."Document No.", PurchHeader."No.");
            if PurchLine.FindFirst then begin
                repeat
                    //check the type of account in the payments line
                    //Item
                    if PurchLine.Type = PurchLine.Type::Item then begin
                        Item.Reset;
                        if not Item.Get(PurchLine."No.") then
                            Error('Item Does not Exist');

                        Item.TestField("Item G/L Budget Account");
                        BudgetGL := Item."Item G/L Budget Account";
                    end;
                    //  MESSAGE('FOUND');
                    if PurchLine.Type = PurchLine.Type::"Fixed Asset" then begin
                        FixedAssetsDet.Reset;
                        FixedAssetsDet.SetRange(FixedAssetsDet."FA No.", PurchLine."No.");
                        if FixedAssetsDet.Find('-') then begin
                            FixedAssetsDet.TestField(FixedAssetsDet."FA Posting Group");
                            FAPostingGRP.Reset;
                            FAPostingGRP.SetRange(FAPostingGRP.Code, FixedAssetsDet."FA Posting Group");
                            if FAPostingGRP.Find('-') then
                                if PurchLine."FA Posting Type" = PurchLine."fa posting type"::Maintenance then begin
                                    BudgetGL := FAPostingGRP."Maintenance Expense Account";
                                    if BudgetGL = '' then
                                        Error('Ensure Fixed Asset No %1 has the Maintenance G/L Account', PurchLine."No.");
                                end else begin
                                    BudgetGL := FAPostingGRP."Acquisition Cost Account";
                                    if BudgetGL = '' then
                                        Error('Ensure Fixed Asset No %1 has the Acquisition G/L Account', PurchLine."No.");
                                end;
                        end;
                    end;

                    if PurchLine.Type = PurchLine.Type::"G/L Account" then begin
                        BudgetGL := PurchLine."No.";
                        if GLAcc.Get(PurchLine."No.") then
                            GLAcc.TestField(GLAcc."Budget Controlled", true);
                    end;

                    //End Checking Account in Payment Line
                    /*
                                //For End Total Budgeting
                                IF BCSetup."Use Totaling Account" THEN BEGIN
                                    IF GLAcc.GET(BudgetGL) THEN
                                       BudgetGL:=GLAcc."Budget Control Account"
                                    ELSE
                                          ERROR('G/L Account %1 is not mapped to a budget control account',BudgetGL);
                                END;
                                //End (End Total Budget)
                    */
                    //For End Total Budgeting -TMEA
                    if BCSetup."Use Totaling Account" then begin
                        GLAcc.Get(BudgetGL);
                        if GLAcc."Budget Control Account" <> '' then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    end;
                    //End (End Total Budget)

                    //check the votebook now
                    FirstDay := Dmy2date(1, Date2dmy(PurchHeader."Document Date", 2), Date2dmy(PurchHeader."Document Date", 3));
                    CurrMonth := Date2dmy(PurchHeader."Document Date", 2);
                    if CurrMonth = 12 then begin
                        LastDay := Dmy2date(1, 1, Date2dmy(PurchHeader."Document Date", 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := Dmy2date(1, CurrMonth, Date2dmy(PurchHeader."Document Date", 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset;
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PurchLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset;
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PurchLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;

                    //check if there is any budget
                    if (BudgetAmount <= 0) then begin
                        Error('No Budget To Check Against');
                    end;

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PurchLine."Outstanding Amount (LCY)") > BudgetAmount) and
                    (BCSetup."Allow OverExpenditure" = false) then begin
                        Error('The Amount On Document No %1  %2 %3  Exceeds The Budget By %4',
                        PurchLine."Document No.", PurchLine.Type, PurchLine."No.",
                          Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PurchLine."Outstanding Amount (LCY)"))));
                    end else begin
                        Commitments.Reset;
                        Commitments.Init;
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := PurchHeader."Document Date";
                        if PurchHeader.DocApprovalType = PurchHeader.Docapprovaltype::Purchase then
                            Commitments."Document Type" := Commitments."document type"::LPO
                        else
                            Commitments."Document Type" := Commitments."document type"::Requisition;

                        if PurchHeader."Document Type" = PurchHeader."document type"::Invoice then
                            Commitments."Document Type" := Commitments."document type"::PurchInvoice;

                        Commitments."Document No." := PurchHeader."No.";
                        Commitments.Amount := PurchLine."Outstanding Amount (LCY)";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := PurchHeader."Document Date";
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PurchLine."Shortcut Dimension 2 Code");
                        Commitments.Validate("Shortcut Dimension 3 Code", ShortcutDimCode[3]);
                        Commitments.Validate("Shortcut Dimension 4 Code", ShortcutDimCode[4]);
                        Commitments."Dimension Set ID" := PurchLine."Dimension Set ID";
                        Commitments.Committed := true;
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := Commitments.Type::Vendor;
                        Commitments."Vendor/Cust No." := PurchHeader."Buy-from Vendor No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PurchLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert;

                        //Tag the Purchase Line as Committed
                        PurchLine.Committed := true;
                        PurchLine.Modify;
                        //End Tagging PurchLines as Committed
                    end;

                until PurchLine.Next = 0;
            end;
            Message(BudgetCheckTxt)
        end
        else//budget control not mandatory
          begin

        end;

    end;


    procedure CheckPayments(var PaymentHeader: Record 52185888): Text
    var
        PayLine: Record 52185878;
        Commitments: Record 52185867;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset;
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (PaymentHeader.Date < BCSetup."Current Budget Start Date") then begin
                Error('The Current Date %1 In The Payment Voucher Does Not Fall Within Budget Dates %2 - %3', PaymentHeader.Date,
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            end
            else
                if (PaymentHeader.Date > BCSetup."Current Budget End Date") then begin
                    Error('The Current Date %1 In The Payment Voucher Does Not Fall Within Budget Dates %2 - %3', PaymentHeader.Date,
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
                end;
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");


            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset;
            PayLine.SetRange(PayLine.No, PaymentHeader."No.");
            PayLine.SetRange(PayLine."Account Type", PayLine."account type"::"G/L Account");
            PayLine.SetRange(PayLine."Budgetary Control A/C", true);
            if PayLine.FindFirst then begin
                repeat
                    //check the votebook now
                    FirstDay := Dmy2date(1, Date2dmy(PaymentHeader.Date, 2), Date2dmy(PaymentHeader.Date, 3));
                    CurrMonth := Date2dmy(PaymentHeader.Date, 2);
                    if CurrMonth = 12 then begin
                        LastDay := Dmy2date(1, 1, Date2dmy(PaymentHeader.Date, 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := Dmy2date(1, CurrMonth, Date2dmy(PaymentHeader.Date, 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    BudgetGL := PayLine."Account No.";

                    //For End Total Budgeting -TMEA
                    if BCSetup."Use Totaling Account" then begin
                        GLAcc.Get(BudgetGL);
                        if GLAcc."Budget Control Account" <> '' then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    end;
                    //End (End Total Budget)

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset;
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset;
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;

                    //MyVar := FORMAT(PayLine."Line No.") +'|'+ FORMAT(ActualsAmount)  +'|'+ FORMAT(BudgetAmount)  +'|'+ FORMAT(CommitmentAmount);
                    //IF ShowResults THEN EXIT(MyVar);

                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then begin
                        Error('No Budget To Check Against');
                    end else begin
                        if (BudgetAmount <= 0) then begin
                            if not Confirm(Text0003, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;
                    end;

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."NetAmount LCY" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then begin
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine.No, PayLine.Type, PayLine."Line No.",
                          Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."NetAmount LCY"))));
                    end else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."NetAmount LCY" + ActualsAmount) > BudgetAmount) then begin
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."NetAmount LCY")))
                            + Text0002, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;

                        Commitments.Reset;
                        Commitments.Init;
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := PaymentHeader.Date;
                        if PaymentHeader."Payment Type" = PaymentHeader."payment type"::Normal then
                            Commitments."Document Type" := Commitments."document type"::"Payment Voucher"
                        else
                            Commitments."Document Type" := Commitments."document type"::PettyCash;
                        Commitments."Document No." := PaymentHeader."No.";
                        Commitments.Amount := PayLine."NetAmount LCY";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := PaymentHeader.Date;
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //                        Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Global Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert;
                        // MESSAGE('Done');
                        //Tag the Payment Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify;
                        //End Tagging Payment Lines as Committed
                    end;

                until PayLine.Next = 0;
            end;
            Message(BudgetCheckTxt)
        end
        else//budget control not mandatory
          begin

        end;
    end;


    procedure CheckImprest(var ImprestHeader: Record 52185909)
    var
        PayLine: Record 52185910;
        Commitments: Record 52185867;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset;
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (ImprestHeader.Date < BCSetup."Current Budget Start Date") then begin
                Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            end
            else
                if (ImprestHeader.Date > BCSetup."Current Budget End Date") then begin
                    Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");

                end;
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");

            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset;
            PayLine.SetRange(PayLine.No, ImprestHeader."No.");
            PayLine.SetRange(PayLine."Budgetary Control A/C", true);
            if PayLine.FindFirst then begin
                repeat
                    //check the votebook now
                    FirstDay := Dmy2date(1, Date2dmy(ImprestHeader.Date, 2), Date2dmy(ImprestHeader.Date, 3));
                    CurrMonth := Date2dmy(ImprestHeader.Date, 2);
                    if CurrMonth = 12 then begin
                        LastDay := Dmy2date(1, 1, Date2dmy(ImprestHeader.Date, 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := Dmy2date(1, CurrMonth, Date2dmy(ImprestHeader.Date, 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    //The GL Account
                    BudgetGL := PayLine."Account No:";

                    //For End Total Budgeting -TMEA
                    if BCSetup."Use Totaling Account" then begin
                        GLAcc.Get(BudgetGL);
                        if GLAcc."Budget Control Account" <> '' then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    end;
                    //End (End Total Budget)

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset;
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset;
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;



                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then begin
                        Error('No Budget To Check Against');
                    end else begin
                        if (BudgetAmount <= 0) then begin
                            if not Confirm(Text0003, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;
                    end;

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then begin
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine.No, 'Staff Imprest', PayLine.No,
                          Format(Abs(BudgetAmount - (CommitmentAmount + PayLine."Amount LCY"))));
                    end else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount) then begin
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Amount LCY")))
                            + Text0002, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;

                        Commitments.Reset;
                        Commitments.Init;
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := ImprestHeader.Date;
                        Commitments."Document Type" := Commitments."document type"::Imprest;
                        Commitments."Document No." := ImprestHeader."No.";
                        Commitments.Amount := PayLine."Amount LCY";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := ImprestHeader.Date;
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //                        Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Global Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := ImprestHeader."Account Type";
                        Commitments."Vendor/Cust No." := ImprestHeader."Account No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert;
                        //Tag the Imprest Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify;
                        //End Tagging Imprest Lines as Committed
                    end;

                until PayLine.Next = 0;
            end;
            Message(BudgetCheckTxt)
        end
        else//budget control not mandatory
          begin

        end;
    end;


    procedure ReverseEntries(DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance; DocNo: Code[20])
    var
        Commitments: Record 52185867;
        EntryNo: Integer;
        CommittedLines: Record 52185867;
    begin
        //Get Commitment Lines
        Commitments.Reset;
        if Commitments.Find('+') then
            EntryNo := Commitments."Line No.";



        CommittedLines.Reset;
        CommittedLines.SetRange(CommittedLines."Document Type", DocumentType);
        CommittedLines.SetRange(CommittedLines."Document No.", DocNo);
        CommittedLines.SetRange(CommittedLines.Committed, true);
        if CommittedLines.Find('-') then begin
            repeat
                Commitments.Reset;
                Commitments.Init;
                EntryNo += 1;
                Commitments."Line No." := EntryNo;
                Commitments."Commitment Date" := Today;
                Commitments."Posting Date" := CommittedLines."Posting Date";
                Commitments."Document Type" := CommittedLines."Document Type";
                Commitments."Document No." := CommittedLines."Document No.";
                Commitments.Amount := -CommittedLines.Amount;
                Commitments."Month Budget" := CommittedLines."Month Budget";
                Commitments."Month Actual" := CommittedLines."Month Actual";
                Commitments.Committed := false;
                Commitments."Committed By" := UserId;
                Commitments."Committed Date" := CommittedLines."Committed Date";
                Commitments."G/L Account No." := CommittedLines."G/L Account No.";
                Commitments."Committed Time" := Time;
                //     Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                Commitments."Shortcut Dimension 1 Code" := CommittedLines."Shortcut Dimension 1 Code";
                Commitments."Shortcut Dimension 2 Code" := CommittedLines."Shortcut Dimension 2 Code";
                Commitments."Shortcut Dimension 3 Code" := CommittedLines."Shortcut Dimension 3 Code";
                Commitments."Shortcut Dimension 4 Code" := CommittedLines."Shortcut Dimension 4 Code";
                Commitments."Dimension Set ID" := CommittedLines."Dimension Set ID";
                Commitments.Budget := CommittedLines.Budget;
                Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                Commitments."Actual Source" := BCSetup."Actual Source";
                Commitments."Document Line No." := CommittedLines."Document Line No.";
                //Added for Totalling Accounts
                Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                Commitments.Insert;

            until CommittedLines.Next = 0;
        end;
    end;


    procedure CheckFundsAvailability(Payments: Record 52185888)
    var
        BankAcc: Record "Bank Account";
        "Current Source A/C Bal.": Decimal;
    begin
        //get the source account balance from the database table
        BankAcc.Reset;
        BankAcc.SetRange(BankAcc."No.", Payments."Paying Bank Account");
        BankAcc.SetRange(BankAcc."Bank Type", BankAcc."bank type"::Cash);
        if BankAcc.FindFirst then begin
            BankAcc.CalcFields(BankAcc.Balance);
            "Current Source A/C Bal." := BankAcc.Balance;
            if ("Current Source A/C Bal." - Payments."Total Net Amount") < 0 then begin
                Error('The transaction will result in a negative balance in the BANK ACCOUNT. %1:%2', BankAcc."No.",
                BankAcc.Name);
            end;
        end;
    end;


    procedure UpdateAnalysisView()
    var
        UpdateAnalysisView: Codeunit "Update Analysis View";
        BudgetaryControl: Record 52185866;
        AnalysisView: Record "Analysis View";
    begin
        //Update Budget Lines
        if BudgetaryControl.Get then begin
            if BudgetaryControl."Actual Source" = BudgetaryControl."actual source"::"Analysis View Entry" then begin
                if BudgetaryControl."Analysis View Code" = '' then
                    Error('The Analysis view code can not be blank in the budgetary control setup');
            end;
            if BudgetaryControl."Analysis View Code" <> '' then begin
                AnalysisView.Reset;
                AnalysisView.SetRange(AnalysisView.Code, BudgetaryControl."Analysis View Code");
                // if AnalysisView.Find('-') then
                //     UpdateAnalysisView.UpdateAnalysisView_Budget(AnalysisView);  //analysis not updating budget
                                                                                 //UpdateAnalysisView.RUN(AnalysisView);                      //updated 2015 correct analysis code
            end;
        end;
    end;


    procedure UpdateDim(DimCode: Code[20]; DimValueCode: Code[20])
    var
        GLBudgetDim: Integer;
    begin
        //In 2013 this is not applicable table 361 not supported
        /*IF DimCode = '' THEN
          EXIT;
        WITH GLBudgetDim DO BEGIN
          IF GET(Rec."Entry No.",DimCode) THEN
            DELETE;
          IF DimValueCode <> '' THEN BEGIN
            INIT;
            "Entry No." := Rec."Entry No.";
            "Dimension Code" := DimCode;
            "Dimension Value Code" := DimValueCode;
            INSERT;
          END;
        END; */

    end;


    procedure CheckIfBlocked(BudgetName: Code[20])
    var
        GLBudgetName: Record "G/L Budget Name";
    begin
        GLBudgetName.Get(BudgetName);
        GLBudgetName.TestField(Blocked, false);
    end;


    procedure CheckStaffClaim(var ImprestHeader: Record 52185912)
    var
        PayLine: Record 52185913;
        Commitments: Record 52185867;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset;
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (ImprestHeader.Date < BCSetup."Current Budget Start Date") then begin
                Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            end
            else
                if (ImprestHeader.Date > BCSetup."Current Budget End Date") then begin
                    Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");

                end;
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");

            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset;
            PayLine.SetRange(PayLine.No, ImprestHeader."No.");
            PayLine.SetRange(PayLine."Budgetary Control A/C", true);
            if PayLine.FindFirst then begin
                repeat
                    //check the votebook now
                    FirstDay := Dmy2date(1, Date2dmy(ImprestHeader.Date, 2), Date2dmy(ImprestHeader.Date, 3));
                    CurrMonth := Date2dmy(ImprestHeader.Date, 2);
                    if CurrMonth = 12 then begin
                        LastDay := Dmy2date(1, 1, Date2dmy(ImprestHeader.Date, 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := Dmy2date(1, CurrMonth, Date2dmy(ImprestHeader.Date, 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    //If Budget is annual then change the Last day
                    if BCSetup."Budget Check Criteria" = BCSetup."budget check criteria"::"Whole Year" then
                        LastDay := BCSetup."Current Budget End Date";

                    //The GL Account
                    BudgetGL := PayLine."Account No:";

                    //For End Total Budgeting -TMEA
                    if BCSetup."Use Totaling Account" then begin
                        GLAcc.Get(BudgetGL);
                        if GLAcc."Budget Control Account" <> '' then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    end;
                    //End (End Total Budget)

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset;
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset;
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;

                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then begin
                        Error('No Budget To Check Against');
                    end else begin
                        if (BudgetAmount <= 0) then begin
                            if not Confirm(Text0003, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;
                    end;

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then begin
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine.No, 'Staff Imprest', PayLine.No,
                          Format(Abs(BudgetAmount - (CommitmentAmount + PayLine."Amount LCY"))));
                    end else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount) then begin
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Amount LCY")))
                            + Text0002, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;

                        Commitments.Reset;
                        Commitments.Init;
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := ImprestHeader.Date;
                        Commitments."Document Type" := Commitments."document type"::StaffClaim;
                        Commitments."Document No." := ImprestHeader."No.";
                        Commitments.Amount := PayLine."Amount LCY";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := ImprestHeader.Date;
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        // Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Global Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := ImprestHeader."Account Type";
                        Commitments."Vendor/Cust No." := ImprestHeader."Account No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert;
                        //Tag the Imprest Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify;
                        //End Tagging Imprest Lines as Committed
                    end;

                until PayLine.Next = 0;
            end;
            Message(BudgetCheckTxt)
        end
        else//budget control not mandatory
          begin

        end;
    end;


    procedure CheckStaffAdvance(var ImprestHeader: Record 52185914)
    var
        PayLine: Record 52185915;
        Commitments: Record 52185867;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset;
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (ImprestHeader.Date < BCSetup."Current Budget Start Date") then begin
                Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            end
            else
                if (ImprestHeader.Date > BCSetup."Current Budget End Date") then begin
                    Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader.Date,
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");

                end;
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");

            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset;
            PayLine.SetRange(PayLine.No, ImprestHeader."No.");
            PayLine.SetRange(PayLine."Budgetary Control A/C", true);
            if PayLine.FindFirst then begin
                repeat
                    //check the votebook now
                    FirstDay := Dmy2date(1, Date2dmy(ImprestHeader.Date, 2), Date2dmy(ImprestHeader.Date, 3));
                    CurrMonth := Date2dmy(ImprestHeader.Date, 2);
                    if CurrMonth = 12 then begin
                        LastDay := Dmy2date(1, 1, Date2dmy(ImprestHeader.Date, 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := Dmy2date(1, CurrMonth, Date2dmy(ImprestHeader.Date, 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    //If Budget is annual then change the Last day
                    if BCSetup."Budget Check Criteria" = BCSetup."budget check criteria"::"Whole Year" then
                        LastDay := BCSetup."Current Budget End Date";

                    //The GL Account
                    BudgetGL := PayLine."Account No:";

                    //For End Total Budgeting -TMEA
                    if BCSetup."Use Totaling Account" then begin
                        GLAcc.Get(BudgetGL);
                        if GLAcc."Budget Control Account" <> '' then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    end;
                    //End (End Total Budget)

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset;
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset;
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;



                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then begin
                        Error('No Budget To Check Against');
                    end else begin
                        if (BudgetAmount <= 0) then begin
                            if not Confirm(Text0003, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;
                    end;
                    /*
                    MESSAGE('BudgetAmount'+FORMAT(BudgetAmount));
                    MESSAGE('ActualsAmount'+FORMAT(ActualsAmount));
                    MESSAGE('CommitmentAmount'+FORMAT(CommitmentAmount));
                    MESSAGE('PayLine."Amount LCY"'+FORMAT(PayLine."Amount LCY"));
                     */
                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then begin
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine.No, 'Staff Imprest', PayLine.No,
                          Format(Abs(BudgetAmount - (ActualsAmount + CommitmentAmount + PayLine."Amount LCY"))));
                    end else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount) then begin
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Amount LCY")))
                            + Text0002, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;

                        Commitments.Reset;
                        Commitments.Init;
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := ImprestHeader.Date;
                        Commitments."Document Type" := Commitments."document type"::StaffAdvance;
                        Commitments."Document No." := ImprestHeader."No.";
                        Commitments.Amount := PayLine."Amount LCY";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := ImprestHeader.Date;
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //   Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Global Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := ImprestHeader."Account Type";
                        Commitments."Vendor/Cust No." := ImprestHeader."Account No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert;
                        //Tag the Imprest Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify;
                        //End Tagging Imprest Lines as Committed
                    end;

                until PayLine.Next = 0;
            end;
            Message(BudgetCheckTxt)
        end
        else//budget control not mandatory
          begin

        end;

    end;


    procedure CheckStaffAdvSurr(var ImprestHeader: Record 52185916)
    var
        PayLine: Record 52185917;
        Commitments: Record 52185867;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset;
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (ImprestHeader."Surrender Date" < BCSetup."Current Budget Start Date") then begin
                Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader."Surrender Date",
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            end
            else
                if (ImprestHeader."Surrender Date" > BCSetup."Current Budget End Date") then begin
                    Error('The Current Date %1 for the Imprest Does Not Fall Within Budget Dates %2 - %3', ImprestHeader."Surrender Date",
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");

                end;
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");

            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset;
            PayLine.SetRange(PayLine."Surrender Doc No.", ImprestHeader.No);
            PayLine.SetRange(PayLine."Budgetary Control A/C", true);
            if PayLine.FindFirst then begin
                repeat
                    //check the votebook now
                    FirstDay := Dmy2date(1, Date2dmy(ImprestHeader."Surrender Date", 2), Date2dmy(ImprestHeader."Surrender Date", 3));
                    CurrMonth := Date2dmy(ImprestHeader."Surrender Date", 2);
                    if CurrMonth = 12 then begin
                        LastDay := Dmy2date(1, 1, Date2dmy(ImprestHeader."Surrender Date", 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := Dmy2date(1, CurrMonth, Date2dmy(ImprestHeader."Surrender Date", 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    //The GL Account
                    BudgetGL := PayLine."Account No:";

                    //For End Total Budgeting -TMEA
                    if BCSetup."Use Totaling Account" then begin
                        GLAcc.Get(BudgetGL);
                        if GLAcc."Budget Control Account" <> '' then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    end;
                    //End (End Total Budget)

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset;
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset;
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;



                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then begin
                        Error('No Budget To Check Against');
                    end else begin
                        if (BudgetAmount <= 0) then begin
                            if not Confirm(Text0003, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;
                    end;

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then begin
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine."Surrender Doc No.", 'Staff Imprest', PayLine."Surrender Doc No.",
                          Format(Abs(BudgetAmount - (CommitmentAmount + PayLine."Amount LCY"))));
                    end else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."Amount LCY" + ActualsAmount) > BudgetAmount) then begin
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Amount LCY")))
                            + Text0002, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;

                        Commitments.Reset;
                        Commitments.Init;
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := ImprestHeader."Surrender Date";
                        Commitments."Document Type" := Commitments."document type"::StaffSurrender;
                        Commitments."Document No." := ImprestHeader.No;
                        Commitments.Amount := PayLine."Amount LCY";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := ImprestHeader."Surrender Date";
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //                        Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Shortcut Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := ImprestHeader."Account Type";
                        Commitments."Vendor/Cust No." := ImprestHeader."Account No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert;
                        //Tag the Imprest Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify;
                        //End Tagging Imprest Lines as Committed
                    end;

                until PayLine.Next = 0;
            end;
            Message(BudgetCheckTxt)
        end
        else//budget control not mandatory
          begin

        end;
    end;


    procedure CheckPVBoard(var PaymentHeader: Record 52185895): Text
    var
        PayLine: Record 52185894;
        Commitments: Record 52185867;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset;
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (PaymentHeader."Transaction Date" < BCSetup."Current Budget Start Date") then begin
                Error('The Current Date %1 In The Payment Voucher Does Not Fall Within Budget Dates %2 - %3', PaymentHeader."Transaction Date",
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            end
            else
                if (PaymentHeader."Transaction Date" > BCSetup."Current Budget End Date") then begin
                    Error('The Current Date %1 In The Payment Voucher Does Not Fall Within Budget Dates %2 - %3', PaymentHeader."Transaction Date",
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
                end;
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");


            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset;
            PayLine.SetRange(PayLine."Document No", PaymentHeader."Transaction No.");
            //PayLine.SETRANGE(PayLine."Account Type",PayLine."Account Type"::"G/L Account");
            //PayLine.SETRANGE(PayLine."Budgetary Control A/C",TRUE);
            if PayLine.FindFirst then begin
                repeat
                    //check the votebook now
                    FirstDay := Dmy2date(1, Date2dmy(PaymentHeader."Transaction Date", 2), Date2dmy(PaymentHeader."Transaction Date", 3));
                    CurrMonth := Date2dmy(PaymentHeader."Transaction Date", 2);
                    if CurrMonth = 12 then begin
                        LastDay := Dmy2date(1, 1, Date2dmy(PaymentHeader."Transaction Date", 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := Dmy2date(1, CurrMonth, Date2dmy(PaymentHeader."Transaction Date", 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    BudgetGL := PayLine."G/L Account No.";

                    //For End Total Budgeting -TMEA
                    if BCSetup."Use Totaling Account" then begin
                        GLAcc.Get(BudgetGL);
                        if GLAcc."Budget Control Account" <> '' then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    end;
                    //End (End Total Budget)

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset;
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset;
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;

                    //MyVar := FORMAT(PayLine."Line No.") +'|'+ FORMAT(ActualsAmount)  +'|'+ FORMAT(BudgetAmount)  +'|'+ FORMAT(CommitmentAmount);
                    //IF ShowResults THEN EXIT(MyVar);

                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then begin
                        Error('No Budget To Check Against');
                    end else begin
                        if (BudgetAmount <= 0) then begin
                            if not Confirm(Text0003, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;
                    end;

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."Net Amount" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then begin
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine."Document No", PayLine."Member No.", PayLine."G/L Account No.",
                          Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Net Amount"))));
                    end else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."Net Amount" + ActualsAmount) > BudgetAmount) then begin
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Net Amount")))
                            + Text0002, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;

                        Commitments.Reset;
                        Commitments.Init;
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := PaymentHeader."Transaction Date";
                        Commitments."Document Type" := Commitments."document type"::"Payment Voucher";
                        Commitments."Document No." := PaymentHeader."Transaction No.";
                        Commitments.Amount := PayLine."Net Amount";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := PaymentHeader."Transaction Date";
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //                        Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Shortcut Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        //Commitments."Document Line No.":=PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert;
                        // MESSAGE('Done');
                        //Tag the Payment Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify;
                        //End Tagging Payment Lines as Committed
                    end;

                until PayLine.Next = 0;
            end;
            Message(BudgetCheckTxt)
        end
        else//budget control not mandatory
          begin

        end;
    end;


    procedure CheckPVDelegate(var PaymentHeader: Record 52185897): Text
    var
        PayLine: Record 52185898;
        Commitments: Record 52185867;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset;
        BCSetup.Get();
        if BCSetup.Mandatory then//budgetary control is mandatory
          begin
            //check if the dates are within the specified range in relation to the payment header table
            if (PaymentHeader."Transaction Date" < BCSetup."Current Budget Start Date") then begin
                Error('The Current Date %1 In The Payment Voucher Does Not Fall Within Budget Dates %2 - %3', PaymentHeader."Transaction Date",
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            end
            else
                if (PaymentHeader."Transaction Date" > BCSetup."Current Budget End Date") then begin
                    Error('The Current Date %1 In The Payment Voucher Does Not Fall Within Budget Dates %2 - %3', PaymentHeader."Transaction Date",
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
                end;
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");


            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PayLine.Reset;
            PayLine.SetRange(PayLine."Document No", PaymentHeader."Transaction No.");
            //PayLine.SETRANGE(PayLine."Account Type",PayLine."Account Type"::"G/L Account");
            //PayLine.SETRANGE(PayLine."Budgetary Control A/C",TRUE);
            if PayLine.FindFirst then begin
                repeat
                    //check the votebook now
                    FirstDay := Dmy2date(1, Date2dmy(PaymentHeader."Transaction Date", 2), Date2dmy(PaymentHeader."Transaction Date", 3));
                    CurrMonth := Date2dmy(PaymentHeader."Transaction Date", 2);
                    if CurrMonth = 12 then begin
                        LastDay := Dmy2date(1, 1, Date2dmy(PaymentHeader."Transaction Date", 3) + 1);
                        LastDay := CalcDate('-1D', LastDay);
                    end
                    else begin
                        CurrMonth := CurrMonth + 1;
                        LastDay := Dmy2date(1, CurrMonth, Date2dmy(PaymentHeader."Transaction Date", 3));
                        LastDay := CalcDate('-1D', LastDay);
                    end;

                    BudgetGL := PayLine."G/L Account No.";

                    //For End Total Budgeting -TMEA
                    if BCSetup."Use Totaling Account" then begin
                        GLAcc.Get(BudgetGL);
                        if GLAcc."Budget Control Account" <> '' then
                            BudgetGL := GLAcc."Budget Control Account"
                        else
                            Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                    end;
                    //End (End Total Budget)

                    //check the summation of the budget and actuals in the database
                    ActualsAmount := 0;
                    BudgetAmount := 0;

                    GLAcc.Reset;
                    GLAcc.SetRange("No.", BudgetGL);
                    GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
                    GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
                    GLAcc.SetRange("Dimension Set ID Filter", PayLine."Dimension Set ID");
                    if GLAcc.Find('-') then begin
                        GLAcc.CalcFields("Budgeted Amount", "Net Change");
                        ActualsAmount := GLAcc."Net Change";
                        BudgetAmount := GLAcc."Budgeted Amount";
                    end;

                    //get the committments
                    CommitmentAmount := 0;
                    Commitments.Reset;
                    Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
                    Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
                    Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
                    Commitments.SetRange(Commitments."Dimension Set ID", PayLine."Dimension Set ID");
                    Commitments.CalcSums(Commitments.Amount);
                    CommitmentAmount := Commitments.Amount;

                    //MyVar := FORMAT(PayLine."Line No.") +'|'+ FORMAT(ActualsAmount)  +'|'+ FORMAT(BudgetAmount)  +'|'+ FORMAT(CommitmentAmount);
                    //IF ShowResults THEN EXIT(MyVar);

                    //check if there is any budget
                    if (BudgetAmount <= 0) and not (BCSetup."Allow OverExpenditure") then begin
                        Error('No Budget To Check Against');
                    end else begin
                        if (BudgetAmount <= 0) then begin
                            if not Confirm(Text0003, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;
                    end;

                    //check if the actuals plus the amount is greater then the budget amount
                    if ((CommitmentAmount + PayLine."Net Amount" + ActualsAmount) > BudgetAmount)
                    and not (BCSetup."Allow OverExpenditure") then begin
                        Error('The Amount Voucher No %1  %2 %3  Exceeds The Budget By %4',
                        PayLine."Document No", PayLine."Member No.", PayLine."G/L Account No.",
                          Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Net Amount"))));
                    end else begin
                        //ADD A CONFIRMATION TO ALLOW USER TO DECIDE WHETHER TO CONTINUE
                        if ((CommitmentAmount + PayLine."Net Amount" + ActualsAmount) > BudgetAmount) then begin
                            if not Confirm(Text0001 +
                            Format(Abs(BudgetAmount - (CommitmentAmount + ActualsAmount + PayLine."Net Amount")))
                            + Text0002, true) then begin
                                Error('Budgetary Checking Process Aborted');
                            end;
                        end;

                        Commitments.Reset;
                        Commitments.Init;
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := PaymentHeader."Transaction Date";
                        Commitments."Document Type" := Commitments."document type"::"Payment Voucher";
                        Commitments."Document No." := PaymentHeader."Transaction No.";
                        Commitments.Amount := PayLine."Net Amount";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := PaymentHeader."Transaction Date";
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //                        Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments.Validate("Shortcut Dimension 1 Code", PayLine."Shortcut Dimension 1 Code");
                        Commitments.Validate("Shortcut Dimension 2 Code", PayLine."Shortcut Dimension 2 Code");
                        Commitments."Dimension Set ID" := PayLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        //Commitments."Document Line No.":=PayLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert;
                        // MESSAGE('Done');
                        //Tag the Payment Line as Committed
                        PayLine.Committed := true;
                        PayLine.Modify;
                        //End Tagging Payment Lines as Committed
                    end;

                until PayLine.Next = 0;
            end;
            Message(BudgetCheckTxt)
        end
        else//budget control not mandatory
          begin

        end;
    end;


    procedure GetLineAmountToReverse(DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance,StaffSurrender; DocNo: Code[20]; DocLineNo: Integer) TotalAmount: Decimal
    var
        LPO: Record "Purchase Line";
        QtyToInvoice: Decimal;
    begin
        if DocumentType = Documenttype::LPO then begin
            LPO.Reset;
            LPO.SetRange(LPO."Document Type", LPO."document type"::Order);
            LPO.SetRange(LPO."Document No.", DocNo);
            LPO.SetRange(LPO."Line No.", DocLineNo);
            if LPO.Find('-') then begin
                //Take care of reversal which might not
                if LPO."Qty. to Invoice" <> 0 then
                    QtyToInvoice := LPO."Qty. to Invoice"
                else
                    QtyToInvoice := LPO."Outstanding Quantity";

                if LPO."VAT %" = 0 then
                    TotalAmount := QtyToInvoice * LPO."Direct Unit Cost"
                else
                    TotalAmount := ROUND((QtyToInvoice * LPO."Direct Unit Cost") * ((LPO."VAT %" + 100) / 100), 0.00001)

            end;
        end;
    end;

    // [EventSubscriber(ObjectType::Table, Database::"Purchase Header", 'OnAfterPostPurchaseDoc', '', false, false)]

    // procedure ReverseOrdersFromInv(var Sender: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20])
    // var
    //     DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance;
    //     PurchRecptLines: Record "Purch. Rcpt. Line";
    //     Commitment: Codeunit "Journal Post Successful";
    //     PurchInvLine: Record "Purch. Inv. Line";
    //     PurchInvHeader: Record "Purch. Inv. Header";
    //     PurchLines: Record "Purchase Line";
    //     PurchInvHeader1: Record "Purch. Inv. Header";
    // begin
    //     /*
    //     PurchInvLine.RESET;
    //     PurchInvLine.SETRANGE(PurchInvLine."Document No.",PurchInvHdrNo);
    //     IF PurchInvLine.FINDSET THEN
    //     REPEAT
    //         IF PurchInvLine.Type<>PurchInvLine.Type::" " THEN
    //         BEGIN
    //           DocumentType:=DocumentType::LPO;
    //           PurchInvHeader.GET(PurchInvHdrNo);
    //           ReverseOrderEntriesFromInvoice(DocumentType,PurchInvHeader."Order No.",PurchInvLine."Line No.",
    //           (PurchInvLine."Unit Cost (LCY)"*PurchInvLine.Quantity ));
    //         END;
    //     UNTIL PurchInvLine.NEXT=0;
        
    //     //Post Commitment Reversals Here
    //     IF  Sender."Document Type"=Sender."Document Type"::Order THEN BEGIN
    //       DocumentType:=DocumentType::LPO;
    //       ReverseEntries(DocumentType,Sender."No.");
    //     END
    //     ELSE IF  Sender."Document Type"=Sender."Document Type"::Invoice THEN BEGIN
    //       DocumentType:=DocumentType::PurchInvoice;
    //       ReverseEntries(DocumentType,Sender."No.");
    //     END;
    //     */
    //     if PurchInvHeader.Get(PurchInvHdrNo) then
    //         if PurchInvHeader."Order No." <> '' then begin
    //             //direct invoice from order reverse LPO
    //             PurchInvLine.Reset;
    //             PurchInvLine.SetRange(PurchInvLine."Document No.", PurchInvHdrNo);
    //             if PurchInvLine.FindSet then
    //                 repeat
    //                     DocumentType := Documenttype::LPO;
    //                     ReverseEntriesLines(DocumentType, PurchInvHeader."Order No.", PurchInvLine."Line No.", PurchInvLine."Unit Cost (LCY)" * PurchInvLine.Quantity);
    //                 until PurchInvLine.Next = 0;
    //         end
    //         else begin
    //             PurchInvLine.Reset;
    //             PurchInvLine.SetRange(PurchInvLine."Document No.", PurchInvHdrNo);
    //             PurchInvLine.SetFilter(PurchInvLine."Receipt No.", '<>%1', '');
    //             if PurchInvLine.FindSet then begin
    //                 repeat
    //                     //invoice created from Get receipt Lines, reverse LPO
    //                     PurchRecptLines.Reset;
    //                     PurchRecptLines.SetRange(PurchRecptLines."Document No.", PurchInvLine."Receipt No.");
    //                     PurchRecptLines.SetRange(PurchRecptLines."Line No.", PurchInvLine."Receipt Line No.");
    //                     if PurchRecptLines.FindSet then begin
    //                         DocumentType := Documenttype::LPO;
    //                         ReverseEntriesLines(DocumentType, PurchRecptLines."Order No.", PurchRecptLines."Order Line No.", PurchInvLine."Unit Cost (LCY)" * PurchInvLine.Quantity);
    //                     end
    //                 until PurchInvLine.Next = 0;
    //             end
    //             else begin
    //                 //direct invoice created, reverse Invoice
    //                 DocumentType := Documenttype::PurchInvoice;
    //                 PurchInvHeader1.Get(PurchInvHdrNo);
    //                 ReverseEntries(DocumentType, PurchInvHeader1."Pre-Assigned No.");
    //             end
    //         end;
    //     //End Post Commitment Reversals

    // end;


    procedure ReverseEntriesLines(DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance; DocNo: Code[20]; LineNo: Integer; Amount: Decimal)
    var
        Commitments: Record 52185867;
        EntryNo: Integer;
        CommittedLines: Record 52185867;
    begin
        //Get Commitment Lines
        Commitments.Reset;
        if Commitments.FindLast then
            EntryNo := Commitments."Line No.";

        CommittedLines.Reset;
        CommittedLines.SetRange(CommittedLines."Document Type", DocumentType);
        CommittedLines.SetRange(CommittedLines."Document No.", DocNo);
        CommittedLines.SetRange(CommittedLines."Document Line No.", LineNo);
        CommittedLines.SetRange(CommittedLines.Committed, true);
        if CommittedLines.Find('-') then begin
            Commitments.Reset;
            Commitments.Init;
            EntryNo += 1;
            Commitments."Line No." := EntryNo;
            Commitments."Commitment Date" := Today;
            Commitments."Posting Date" := CommittedLines."Posting Date";
            Commitments."Document Type" := CommittedLines."Document Type";
            Commitments."Document No." := CommittedLines."Document No.";
            Commitments.Amount := -Amount;
            Commitments."Month Budget" := CommittedLines."Month Budget";
            Commitments."Month Actual" := CommittedLines."Month Actual";
            Commitments.Committed := false;
            Commitments."Committed By" := UserId;
            Commitments."Committed Date" := CommittedLines."Committed Date";
            Commitments."G/L Account No." := CommittedLines."G/L Account No.";
            Commitments."Committed Time" := Time;
            //Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
            Commitments."Shortcut Dimension 1 Code" := CommittedLines."Shortcut Dimension 1 Code";
            Commitments."Shortcut Dimension 2 Code" := CommittedLines."Shortcut Dimension 2 Code";
            Commitments."Shortcut Dimension 3 Code" := CommittedLines."Shortcut Dimension 3 Code";
            Commitments."Shortcut Dimension 4 Code" := CommittedLines."Shortcut Dimension 4 Code";
            Commitments."Dimension Set ID" := CommittedLines."Dimension Set ID";
            Commitments.Budget := CommittedLines.Budget;
            Commitments."Document Line No." := CommittedLines."Document Line No.";
            Commitments."Budget Check Criteria" := CommittedLines."Budget Check Criteria";
            Commitments."Actual Source" := CommittedLines."Actual Source";
            //Added for Totalling Accounts
            Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
            Commitments.Insert;
        end;
    end;


    procedure ReverseOrdersReversal("No.": Code[20])
    var
        PurchLines: Record "Purchase Line";
        DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance;
        PurchRecptLines: Record "Purch. Rcpt. Line";
        DeleteCommitment: Record 52185867;
    begin
        PurchLines.Reset;
        PurchLines.SetRange(PurchLines."Document Type", PurchLines."document type"::Invoice);
        PurchLines.SetRange(PurchLines."Document No.", "No.");
        if PurchLines.Find('-') then begin
            repeat
                if PurchLines.Type <> PurchLines.Type::" " then begin
                    //Get Details of Order from Receipt lines
                    PurchRecptLines.Reset;
                    PurchRecptLines.SetRange(PurchRecptLines."Document No.", PurchLines."Receipt No.");
                    PurchRecptLines.SetRange(PurchRecptLines."Line No.", PurchLines."Receipt Line No.");
                    if PurchRecptLines.Find('-') then begin
                        DeleteCommitment.Reset;
                        DeleteCommitment.SetRange(DeleteCommitment."Document Type", DeleteCommitment."document type"::LPO);
                        DeleteCommitment.SetRange(DeleteCommitment."Document No.", PurchRecptLines."Order No.");
                        DeleteCommitment.SetRange(DeleteCommitment."Document Line No.", PurchRecptLines."Order Line No.");
                        DeleteCommitment.SetRange(DeleteCommitment.Committed, false);
                        DeleteCommitment.DeleteAll;

                    end;
                end;
            until PurchLines.Next = 0;
        end;
    end;


    procedure OrderCommittment(var PurchHeader: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
        Commitments: Record 52185867;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
        GLAccount: Record "G/L Account";
    begin
        //get the budget control setup first to determine if it mandatory or not
        BCSetup.Reset;
        BCSetup.Get();

        begin
            //check if the dates are within the specified range in relation to the payment header table
            if (PurchHeader."Document Date" < BCSetup."Current Budget Start Date") then begin
                Error('The Current Date %1 In The Order Does Not Fall Within Budget Dates %2 - %3', PurchHeader."Document Date",
                BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");
            end
            else
                if (PurchHeader."Document Date" > BCSetup."Current Budget End Date") then begin
                    Error('The Current Date %1 In The Order Does Not Fall Within Budget Dates %2 - %3', PurchHeader."Document Date",
                    BCSetup."Current Budget Start Date", BCSetup."Current Budget End Date");

                end;
            //Is budget Available
            CheckIfBlocked(BCSetup."Current Budget Code");
            //Get Commitment Lines
            if Commitments.Find('+') then
                EntryNo := Commitments."Line No.";

            //get the lines related to the payment header
            PurchLine.Reset;
            PurchLine.SetRange(PurchLine."Document Type", PurchHeader."Document Type");
            PurchLine.SetRange(PurchLine."Document No.", PurchHeader."No.");
            if PurchLine.FindFirst then begin
                repeat
                    if PurchLine.Type <> PurchLine.Type::" " then begin

                        //check the type of account in the payments line
                        //Item
                        if PurchLine.Type = PurchLine.Type::Item then begin
                            Item.Reset;
                            if not Item.Get(PurchLine."No.") then
                                Error('Item Does not Exist');

                            Item.TestField("Item G/L Budget Account");
                            BudgetGL := Item."Item G/L Budget Account";
                        end;

                        if PurchLine.Type = PurchLine.Type::"Fixed Asset" then begin
                            FixedAssetsDet.Reset;
                            FixedAssetsDet.SetRange(FixedAssetsDet."No.", PurchLine."No.");
                            if FixedAssetsDet.Find('-') then begin
                                FAPostingGRP.Reset;
                                FAPostingGRP.SetRange(FAPostingGRP.Code, FixedAssetsDet."FA Posting Group");
                                if FAPostingGRP.Find('-') then
                                    if PurchLine."FA Posting Type" = PurchLine."fa posting type"::Maintenance then begin
                                        BudgetGL := FAPostingGRP."Maintenance Expense Account";
                                        if BudgetGL = '' then
                                            Error('Ensure Fixed Asset No %1 has the Maintenance G/L Account', PurchLine."No.");
                                    end else begin
                                        if PurchLine."FA Posting Type" = PurchLine."fa posting type"::"Acquisition Cost" then begin
                                            BudgetGL := FAPostingGRP."Acquisition Cost Account";
                                            if BudgetGL = '' then
                                                Error('Ensure Fixed Asset No %1 has the Acquisition G/L Account', PurchLine."No.");
                                        end;
                                        //To Accomodate any Additional Item under Custom 1 and Custom 2
                                        // if PurchLine."FA Posting Type" = PurchLine."fa posting type"::"3" then begin
                                        //     BudgetGL := FAPostingGRP."Custom 2 Account";
                                        //     if BudgetGL = '' then
                                        //         Error('Ensure Fixed Asset No %1 has the %2 G/L Account', PurchLine."No.",
                                        //         FAPostingGRP."Custom 1 Account");
                                        // end;

                                        // if PurchLine."FA Posting Type" = PurchLine."fa posting type"::"4" then begin
                                        //     BudgetGL := FAPostingGRP."Custom 2 Account";
                                        //     if BudgetGL = '' then
                                        //         Error('Ensure Fixed Asset No %1 has the %2 G/L Account', PurchLine."No.",
                                        //         FAPostingGRP."Custom 1 Account");
                                        // end;
                                        //To Accomodate any Additional Item under Custom 1 and Custom 2

                                    end;
                            end;
                        end;

                        if PurchLine.Type = PurchLine.Type::"G/L Account" then begin
                            BudgetGL := PurchLine."No.";
                            if GLAcc.Get(PurchLine."No.") then
                                GLAcc.TestField("Budget Controlled", true);
                        end;

                        //For End Total Budgeting -TMEA
                        if BCSetup."Use Totaling Account" then begin
                            GLAcc.Get(BudgetGL);
                            if GLAcc."Budget Control Account" <> '' then
                                BudgetGL := GLAcc."Budget Control Account"
                            else
                                Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
                        end;
                        //End (End Total Budget)

                        //End Checking Account in Payment Line

                        //END ADDING CONFIRMATION
                        Commitments.Reset;
                        Commitments.Init;
                        EntryNo += 1;
                        Commitments."Line No." := EntryNo;
                        Commitments."Commitment Date" := Today;
                        Commitments."Posting Date" := PurchHeader."Document Date";
                        if PurchHeader.DocApprovalType = PurchHeader.Docapprovaltype::Purchase then
                            Commitments."Document Type" := Commitments."document type"::LPO
                        else
                            Commitments."Document Type" := Commitments."document type"::Requisition;

                        if PurchHeader."Document Type" = PurchHeader."document type"::Invoice then
                            Commitments."Document Type" := Commitments."document type"::PurchInvoice;

                        Commitments."Document No." := PurchHeader."No.";
                        Commitments.Amount := PurchLine."Outstanding Amount (LCY)";
                        Commitments."Month Budget" := BudgetAmount;
                        Commitments."Month Actual" := ActualsAmount;
                        Commitments.Committed := true;
                        Commitments."Committed By" := UserId;
                        Commitments."Committed Date" := PurchHeader."Document Date";
                        Commitments."G/L Account No." := BudgetGL;
                        Commitments."Committed Time" := Time;
                        //Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                        Commitments."Shortcut Dimension 1 Code" := PurchLine."Shortcut Dimension 1 Code";
                        Commitments."Shortcut Dimension 2 Code" := PurchLine."Shortcut Dimension 2 Code";
                        Commitments."Shortcut Dimension 3 Code" := ShortcutDimCode[3];
                        Commitments."Shortcut Dimension 4 Code" := ShortcutDimCode[4];
                        Commitments."Dimension Set ID" := PurchLine."Dimension Set ID";
                        Commitments.Budget := BCSetup."Current Budget Code";
                        Commitments.Type := Commitments.Type::Vendor;
                        Commitments."Vendor/Cust No." := PurchHeader."Buy-from Vendor No.";
                        Commitments."Budget Check Criteria" := BCSetup."Budget Check Criteria";
                        Commitments."Actual Source" := BCSetup."Actual Source";
                        Commitments."Document Line No." := PurchLine."Line No.";
                        //Added for Totalling Accounts
                        Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                        Commitments.Insert;
                        //Tag the Purchase Line as Committed
                        PurchLine.Committed := true;
                        PurchLine.Modify;
                        //End Tagging PurchLines as Committed
                    end;

                until PurchLine.Next = 0;
            end;
        end
    end;


    procedure OrderCommittmentReversal(DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance; DocNo: Code[20])
    var
        Commitments: Record 52185867;
        EntryNo: Integer;
        CommittedLines: Record 52185867;
        Purchline: Record "Purchase Line";
        PRFLine: Record "Purchase Line";
        PRFHeader: Record "Purchase Header";
    begin
        //Get Commitment Lines
        Commitments.Reset;
        if Commitments.Find('+') then
            EntryNo := Commitments."Line No.";

        Purchline.Reset;
        Purchline.SetRange(Purchline."Document Type", Purchline."document type"::Order);
        Purchline.SetRange(Purchline."Document No.", DocNo);
        if Purchline.FindSet then
            repeat
                CommittedLines.Reset;
                CommittedLines.SetRange(CommittedLines."Document Type", CommittedLines."document type"::Requisition);
                CommittedLines.SetRange(CommittedLines."Document No.", Purchline."Requisition No");
                CommittedLines.SetRange(CommittedLines."Document Line No.", Purchline."Requisition Line No.");
                CommittedLines.SetRange(CommittedLines.Committed, true);
                if CommittedLines.FindSet then begin
                    Commitments.Reset;
                    Commitments.Init;
                    EntryNo += 1;
                    Commitments."Line No." := EntryNo;
                    Commitments."Commitment Date" := Today;
                    Commitments."Posting Date" := CommittedLines."Posting Date";
                    Commitments."Document Type" := CommittedLines."Document Type";
                    Commitments."Document No." := CommittedLines."Document No.";
                    Commitments.Amount := -Purchline."Outstanding Amount (LCY)";
                    Commitments."Month Budget" := CommittedLines."Month Budget";
                    Commitments."Month Actual" := CommittedLines."Month Actual";
                    Commitments.Committed := false;
                    Commitments."Committed By" := UserId;
                    Commitments."Committed Date" := CommittedLines."Committed Date";
                    Commitments."G/L Account No." := CommittedLines."G/L Account No.";
                    Commitments."Committed Time" := Time;
                    //Commitments."Committed Machine":=ENVIRON('COMPUTERNAME');
                    Commitments."Shortcut Dimension 1 Code" := CommittedLines."Shortcut Dimension 1 Code";
                    Commitments."Shortcut Dimension 2 Code" := CommittedLines."Shortcut Dimension 2 Code";
                    Commitments."Shortcut Dimension 3 Code" := CommittedLines."Shortcut Dimension 3 Code";
                    Commitments."Shortcut Dimension 4 Code" := CommittedLines."Shortcut Dimension 4 Code";
                    Commitments."Dimension Set ID" := CommittedLines."Dimension Set ID";
                    Commitments.Budget := CommittedLines.Budget;
                    Commitments."Document Line No." := CommittedLines."Document Line No.";
                    Commitments."Budget Check Criteria" := CommittedLines."Budget Check Criteria";
                    Commitments."Actual Source" := CommittedLines."Actual Source";
                    //Added for Totalling Accounts
                    Commitments."Based on Totaling Account" := BCSetup."Use Totaling Account";
                    Commitments."Order No." := Purchline."Document No.";
                    Commitments.Insert;
                end;
                PRFLine.Reset;
                PRFLine.SetRange(PRFLine."Document Type", PRFLine."document type"::Quote);
                PRFLine.SetRange(PRFLine."Document No.", Purchline."Requisition No");
                PRFLine.SetRange(PRFLine."Line No.", Purchline."Requisition Line No.");
                if PRFLine.FindSet then begin
                    PRFLine."Qty Ordered" += Purchline.Quantity;
                    PRFLine."Qty UnOrdered" -= Purchline.Quantity;
                    PRFLine.Modify;
                end;
                PRFHeader.Reset;
                PRFHeader.SetRange(PRFHeader."Document Type", PRFHeader."document type"::Quote);
                PRFHeader.SetRange(PRFHeader."No.", Purchline."Requisition No");
                if PRFHeader.FindFirst then begin
                    PRFLine.Reset;
                    PRFLine.SetRange(PRFLine."Document Type", PRFLine."document type"::Quote);
                    PRFLine.SetRange(PRFLine."Document No.", PRFHeader."No.");
                    PRFLine.CalcSums(PRFLine.Quantity, PRFLine."Qty Ordered");
                    if PRFLine.Quantity = PRFLine."Qty Ordered" then begin
                        PRFHeader.Copied := true;
                        PRFHeader.Modify;
                    end;
                end;
            until Purchline.Next = 0;
    end;

    local procedure "***"()
    begin
    end;


    procedure CompareTotalReq(FromPurchHeader: Record "Purchase Header")
    var
        PurchLine: Record "Purchase Line";
        OrderReqBuffer: Record 52185933;
        PurchHeader: Record "Purchase Header";
        CompTotalReqErr: label 'Requisition %1 has an outstanding quantity of %2';
    begin
        OrderReqBuffer.Reset;
        OrderReqBuffer.SetRange(OrderReqBuffer.UserID, UserId);
        if OrderReqBuffer.Find('-') then
            OrderReqBuffer.DeleteAll;

        PurchLine.Reset;
        PurchLine.SetRange(PurchLine."Document Type", FromPurchHeader."Document Type");
        PurchLine.SetRange(PurchLine."Document No.", FromPurchHeader."No.");
        if PurchLine.Find('-') then begin
            repeat
                if PurchLine.Type <> PurchLine.Type::" " then begin
                    if not OrderReqBuffer.Get(PurchLine."Requisition No") then begin
                        OrderReqBuffer.Init;
                        OrderReqBuffer.RequisitionNo := PurchLine."Requisition No";
                        OrderReqBuffer."Requisition Line No." := PurchLine."Requisition Line No.";
                        OrderReqBuffer.OrderNo := FromPurchHeader."No.";
                        OrderReqBuffer.UserID := UserId;
                        OrderReqBuffer.Insert;
                    end;
                end;

                //Do Comparisons Here
                OrderReqBuffer.Reset;
                OrderReqBuffer.SetRange(OrderReqBuffer.OrderNo, FromPurchHeader."No.");
                OrderReqBuffer.SetRange(OrderReqBuffer."Requisition Line No.", PurchLine."Requisition Line No.");
                if OrderReqBuffer.Find('-') then begin
                    repeat
                        OrderReqBuffer.CalcFields(OrderReqBuffer.TotalsOnOrder);
                        OrderReqBuffer.CalcFields(OrderReqBuffer.TotalsOnArchiveOrder);
                        OrderReqBuffer.CalcFields(OrderReqBuffer.TotalonReq);
                        if OrderReqBuffer.TotalsOnOrder > OrderReqBuffer.TotalonReq then
                            Error(CompTotalReqErr, OrderReqBuffer.RequisitionNo,
                                  OrderReqBuffer.TotalonReq - (OrderReqBuffer.TotalsOnOrder - PurchLine.Quantity) - OrderReqBuffer.TotalsOnArchiveOrder);
                    /*//use the qty ordered and unordered fields instead undercommittmentreversal
                          //Update the requisition as copied here
                           PurchHeader.RESET;
                           PurchHeader.SETRANGE(PurchHeader."No.",OrderReqBuffer.RequisitionNo);
                           IF PurchHeader.FIND('-') THEN BEGIN
                              PurchHeader.Copied:=TRUE;
                              PurchHeader.MODIFY;
                           END;
                    */
                    until OrderReqBuffer.Next = 0;
                end;
            until PurchLine.Next = 0;
        end;
        //
        /*
         OrderReqBuffer.RESET;
         OrderReqBuffer.SETRANGE(OrderReqBuffer.UserID,USERID);
         IF OrderReqBuffer.FIND('-') THEN
            OrderReqBuffer.DELETEALL;

         PurchLine.RESET;
         PurchLine.SETRANGE(PurchLine."Document Type","Document Type");
         PurchLine.SETRANGE(PurchLine."Document No.","No.");
         IF PurchLine.FIND('-') THEN BEGIN
            REPEAT
             IF PurchLine.Type<>PurchLine.Type::" " THEN BEGIN
                IF NOT OrderReqBuffer.GET(PurchLine."Manual Requisition No") THEN BEGIN
                  OrderReqBuffer.INIT;
                  OrderReqBuffer.RequisitionNo:=PurchLine."Manual Requisition No";
                  OrderReqBuffer.OrderNo:="No.";
                  OrderReqBuffer.UserID:=USERID;
                  OrderReqBuffer.INSERT;
                END;
             END;
           UNTIL PurchLine.NEXT=0;
           //Do Comparisons Here
             OrderReqBuffer.RESET;
             OrderReqBuffer.SETRANGE(OrderReqBuffer.OrderNo,"No.");
             IF OrderReqBuffer.FIND('-') THEN BEGIN
              REPEAT
                 OrderReqBuffer.CALCFIELDS(OrderReqBuffer.TotalsonOrder);
                 OrderReqBuffer.CALCFIELDS(OrderReqBuffer.TotalonReq);
                 IF OrderReqBuffer.TotalsonOrder>OrderReqBuffer.TotalonReq THEN
                    ERROR(Txt001,OrderReqBuffer.OrderNo,OrderReqBuffer.TotalsonOrder,OrderReqBuffer.RequisitionNo,
                    OrderReqBuffer.TotalonReq);
            //Update the requisition as copied here
             PurchHeader.RESET;
             PurchHeader.SETRANGE(PurchHeader."No.",OrderReqBuffer.RequisitionNo);
             IF PurchHeader.FIND('-') THEN BEGIN
                PurchHeader.Copied:=TRUE;
                PurchHeader.MODIFY;
             END;

              UNTIL OrderReqBuffer.NEXT=0;
             END;
         END;
      */

    end;


    procedure DeleteEntries(DocumentType: Option LPO,Requisition,Imprest,"Payment Voucher",PettyCash,PurchInvoice,StaffClaim,StaffAdvance; DocNo: Code[20])
    var
        Commitments: Record 52185867;
        EntryNo: Integer;
        CommittedLines: Record 52185867;
        PurchLines: Record "Purchase Line";
        PrfHeader: Record "Purchase Header";
        PRFLine: Record "Purchase Line";
    begin
        //Get Commitment Lines
        CommittedLines.Reset;
        CommittedLines.SetRange(CommittedLines."Document Type", DocumentType);
        CommittedLines.SetRange(CommittedLines."Document No.", DocNo);
        CommittedLines.SetRange(CommittedLines.Committed, true);
        if CommittedLines.FindSet then
            CommittedLines.DeleteAll;

        if DocumentType = Documenttype::LPO then //delete the requisition reversals created
          begin
            PurchLines.Reset;
            PurchLines.SetRange(PurchLines."Document Type", PurchLines."document type"::Order);
            PurchLines.SetRange(PurchLines."Document No.", DocNo);
            if PurchLines.FindSet then
                repeat
                    CommittedLines.Reset;
                    CommittedLines.SetRange(CommittedLines."Document Type", CommittedLines."document type"::Requisition);
                    CommittedLines.SetRange(CommittedLines."Document No.", PurchLines."Requisition No");
                    CommittedLines.SetRange(CommittedLines."Order No.", PurchLines."Document No.");
                    CommittedLines.SetRange(CommittedLines.Committed, false);
                    if CommittedLines.FindSet then
                        CommittedLines.DeleteAll;

                    PRFLine.Reset;
                    PRFLine.SetRange(PRFLine."Document Type", PRFLine."document type"::Quote);
                    PRFLine.SetRange(PRFLine."Document No.", PurchLines."Requisition No");
                    PRFLine.SetRange(PRFLine."Line No.", PurchLines."Requisition Line No.");
                    if PRFLine.FindSet then begin
                        PRFLine."Qty Ordered" -= PurchLines.Quantity;
                        PRFLine."Qty UnOrdered" += PurchLines.Quantity;
                        PRFLine.Modify;
                    end;

                    PrfHeader.Reset;
                    PrfHeader.SetRange(PrfHeader."Document Type", PrfHeader."document type"::Quote);
                    PrfHeader.SetRange(PrfHeader."No.", PurchLines."Requisition No");
                    if PrfHeader.FindFirst then begin
                        PrfHeader.Copied := false;
                        PrfHeader.Modify;
                    end;
                until PurchLines.Next = 0;
        end;
    end;

    local procedure ReverseandUncommitt(var Variant: Variant)
    var
        RecRef: RecordRef;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLines: Record "Purchase Line";
        PaymentHeader: Record 52185888;
        PaymentLines: Record 52185878;
        ImprestHeader: Record 52185909;
        ImprestLines: Record 52185910;
        AdvanceHeader: Record 52185914;
        AdvanceLines: Record 52185915;
        ImprestSurrenderHeader: Record 52185885;
        ImprestSurrenderLines: Record 52185886;
        AdvanceSurrenderHeader: Record 52185916;
        AdvanceSurrenderLines: Record 52185917;
        StaffClaimHeader: Record 52185912;
        StaffClaimLines: Record 52185913;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Purchase Header":
                begin
                    PurchaseHeader := Variant;
                    PurchaseLines.Reset;
                    PurchaseLines.SetRange(PurchaseLines."Document Type", PurchaseHeader."Document Type");
                    PurchaseLines.SetRange(PurchaseLines."Document No.", PurchaseHeader."No.");
                    PurchaseLines.SetRange(PurchaseLines.Committed, true);
                    if PurchaseLines.FindSet then
                        repeat
                            PurchaseLines.Committed := false;
                            PurchaseLines.Modify;
                        until PurchaseLines.Next = 0;
                end;
            Database::"Payments Header":
                begin
                    PaymentHeader := Variant;
                    PaymentLines.Reset;
                    PaymentLines.SetRange(PaymentLines.No, PaymentHeader."No.");
                    PaymentLines.SetRange(PaymentLines.Committed, true);
                    if PaymentLines.FindSet then
                        repeat
                            PaymentLines.Committed := false;
                            PaymentLines.Modify;
                        until PaymentLines.Next = 0;
                end;
            Database::"Imprest Header":
                begin
                    ImprestHeader := Variant;
                    ImprestLines.Reset;
                    ImprestLines.SetRange(ImprestLines.No, ImprestHeader."No.");
                    ImprestLines.SetRange(ImprestLines.Committed, true);
                    if ImprestLines.FindSet then
                        repeat
                            ImprestLines.Committed := false;
                            ImprestLines.Modify;
                        until ImprestLines.Next = 0;
                end;
            Database::"Staff Advance Header":
                begin
                    AdvanceHeader := Variant;
                    AdvanceLines.Reset;
                    AdvanceLines.SetRange(AdvanceLines.No, AdvanceHeader."No.");
                    AdvanceLines.SetRange(AdvanceLines.Committed, true);
                    if AdvanceLines.FindSet then
                        repeat
                            AdvanceLines.Committed := false;
                            AdvanceLines.Modify;
                        until AdvanceLines.Next = 0;
                end;
            Database::"Staff Claims Header":
                begin
                    StaffClaimHeader := Variant;
                    StaffClaimLines.Reset;
                    StaffClaimLines.SetRange(StaffClaimLines.No, StaffClaimHeader."No.");
                    StaffClaimLines.SetRange(StaffClaimLines.Committed, true);
                    if StaffClaimLines.FindSet then
                        repeat
                            StaffClaimLines.Committed := false;
                            StaffClaimLines.Modify;
                        until StaffClaimLines.Next = 0;
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    AdvanceSurrenderHeader := Variant;
                    AdvanceSurrenderLines.Reset;
                    AdvanceSurrenderLines.SetRange(AdvanceSurrenderLines."Surrender Doc No.", AdvanceSurrenderHeader.No);
                    AdvanceSurrenderLines.SetRange(AdvanceSurrenderLines.Committed, true);
                    if AdvanceSurrenderLines.FindSet then
                        repeat
                            AdvanceSurrenderLines.Committed := false;
                            AdvanceSurrenderLines.Modify;
                        until AdvanceSurrenderLines.Next = 0;
                end;
        end
    end;


    procedure CheckDocumentIsComplete(var Variant: Variant)
    var
        RecRef: RecordRef;
        PurchaseHeader: Record "Purchase Header";
        PurchaseLines: Record "Purchase Line";
        PaymentHeader: Record 52185888;
        PaymentLines: Record 52185878;
        ImprestHeader: Record 52185909;
        ImprestLines: Record 52185910;
        AdvanceHeader: Record 52185914;
        AdvanceLines: Record 52185915;
        ImprestSurrenderHeader: Record 52185885;
        ImprestSurrenderLines: Record 52185886;
        AdvanceSurrenderHeader: Record 52185916;
        AdvanceSurrenderLines: Record 52185917;
        StaffClaimHeader: Record 52185912;
        StaffClaimLines: Record 52185913;
        CheckBudgetErr: label 'Document %1 contains lines that are not committed, ensure check budget is included in the document workflow';
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            /*
            DATABASE::"Purchase Header":
              BEGIN
                PurchaseHeader := Variant;
                PurchaseLines.RESET;
                PurchaseLines.SETRANGE(PurchaseLines."Document No.",PurchaseHeader."No.");
                PurchaseLines.SETFILTER(PurchaseLines.Type,'<>%1',PurchaseLines.Type::" ");
                PurchaseLines.SETRANGE(PurchaseLines.Committed,FALSE);
                IF PurchaseLines.FINDSET THEN
                  ERROR(CheckBudgetErr,PurchaseHeader."No.");
              END;
            */
            Database::"Payments Header":
                begin
                    PaymentHeader := Variant;
                    PaymentLines.Reset;
                    PaymentLines.SetRange(PaymentLines.No, PaymentHeader."No.");
                    PaymentLines.SetRange(PaymentLines.Committed, false);
                    if PaymentLines.FindSet then
                        Error(CheckBudgetErr, PaymentHeader."No.");
                end;
            Database::"Imprest Header":
                begin
                    ImprestHeader := Variant;
                    ImprestLines.Reset;
                    ImprestLines.SetRange(ImprestLines.No, ImprestHeader."No.");
                    ImprestLines.SetRange(ImprestLines.Committed, false);
                    if ImprestLines.FindSet then
                        Error(CheckBudgetErr, ImprestHeader."No.");
                end;
            Database::"Staff Advance Header":
                begin
                    AdvanceHeader := Variant;
                    AdvanceLines.Reset;
                    AdvanceLines.SetRange(AdvanceLines.No, AdvanceHeader."No.");
                    AdvanceLines.SetRange(AdvanceLines.Committed, false);
                    if AdvanceLines.FindSet then
                        Error(CheckBudgetErr, AdvanceHeader."No.");
                end;
            Database::"Staff Claims Header":
                begin
                    StaffClaimHeader := Variant;
                    StaffClaimLines.Reset;
                    StaffClaimLines.SetRange(StaffClaimLines.No, StaffClaimHeader."No.");
                    StaffClaimLines.SetRange(StaffClaimLines.Committed, false);
                    if StaffClaimLines.FindSet then
                        Error(CheckBudgetErr, StaffClaimHeader."No.");
                end;
            Database::"Staff Advance Surrender Header":
                begin
                    AdvanceSurrenderHeader := Variant;
                    AdvanceSurrenderLines.Reset;
                    AdvanceSurrenderLines.SetRange(AdvanceSurrenderLines."Surrender Doc No.", AdvanceSurrenderHeader.No);
                    AdvanceSurrenderLines.SetRange(AdvanceSurrenderLines.Committed, false);
                    if AdvanceSurrenderLines.FindSet then
                        Error(CheckBudgetErr, AdvanceSurrenderHeader.No);
                end;
        end

    end;

    local procedure "****"()
    begin
    end;


    procedure PaneMgt(Variant: Variant; ShowResults: Integer): Decimal
    var
        RecRef: RecordRef;
        PayLine: Record 52185878;
        PurchaseLine: Record "Purchase Line";
        PurchaseHeader: Record "Purchase Header";
        Item: Record Item;
        BudgetGLAccount: Code[20];
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        GLAcc: Record "G/L Account";
        StaffClaimLines: Record 52185913;
        StaffAdvanceLines: Record 52185915;
        StaffAdvancSurrenderDetails: Record 52185917;
        ImprestLines: Record 52185910;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Payment Line":
                begin
                    PayLine := Variant;
                    exit(PaneMgtCalculations(ShowResults, PayLine.Date, PayLine."Dimension Set ID", PayLine."Account No."));
                end;
            Database::"Staff Claim Lines":
                begin
                    StaffClaimLines := Variant;
                    exit(PaneMgtCalculations(ShowResults, StaffClaimLines."Date Taken", StaffClaimLines."Dimension Set ID", StaffClaimLines."Account No:"));
                end;
            Database::"Staff Advance Lines":
                begin
                    StaffAdvanceLines := Variant;
                    exit(PaneMgtCalculations(ShowResults, StaffAdvanceLines."Date Taken", StaffAdvanceLines."Dimension Set ID", StaffAdvanceLines."Account No:"));
                end;
            Database::"Staff Advanc Surrender Details":
                begin
                    StaffAdvancSurrenderDetails := Variant;
                    exit(PaneMgtCalculations(ShowResults, StaffAdvancSurrenderDetails."Date Issued", StaffAdvancSurrenderDetails."Dimension Set ID", StaffAdvancSurrenderDetails."Account No:"));
                end;
            Database::"Imprest Lines":
                begin
                    ImprestLines := Variant;
                    exit(PaneMgtCalculations(ShowResults, ImprestLines."Date Taken", ImprestLines."Dimension Set ID", ImprestLines."Account No:"));
                end;
            Database::"Purchase Line":
                begin
                    PurchaseLine := Variant;
                    PurchaseHeader.Get(PurchaseLine."Document Type", PurchaseLine."Document No.");
                    if PurchaseLine.Type = PurchaseLine.Type::Item then begin
                        Item.Reset;
                        if not Item.Get(PurchaseLine."No.") then
                            Error('Item Does not Exist');
                        Item.TestField("Item G/L Budget Account");
                        BudgetGLAccount := Item."Item G/L Budget Account";
                    end;

                    if PurchaseLine.Type = PurchaseLine.Type::"Fixed Asset" then begin
                        FixedAssetsDet.Reset;
                        FixedAssetsDet.SetRange(FixedAssetsDet."No.", PurchaseLine."No.");
                        if FixedAssetsDet.Find('-') then begin
                            //FixedAssetsDet.CALCFIELDS(FixedAssetsDet."FA Posting Group");
                            FAPostingGRP.Reset;
                            FAPostingGRP.SetRange(FAPostingGRP.Code, FixedAssetsDet."FA Posting Group");
                            if FAPostingGRP.Find('-') then
                                if PurchaseLine."FA Posting Type" = PurchaseLine."fa posting type"::Maintenance then begin
                                    BudgetGLAccount := FAPostingGRP."Maintenance Expense Account";
                                    if BudgetGLAccount = '' then
                                        Error('Ensure Fixed Asset No %1 has the Maintenance G/L Account', PurchaseLine."No.");
                                end else begin
                                    BudgetGLAccount := FAPostingGRP."Acquisition Cost Account";
                                    if BudgetGLAccount = '' then
                                        Error('Ensure Fixed Asset No %1 has the Acquisition G/L Account', PurchaseLine."No.");
                                end;
                        end;
                    end;

                    if PurchaseLine.Type = PurchaseLine.Type::"G/L Account" then begin
                        BudgetGLAccount := PurchaseLine."No.";
                        if GLAcc.Get(PurchaseLine."No.") then
                            GLAcc.TestField(GLAcc."Budget Controlled", true);
                    end;
                    exit(PaneMgtCalculations(ShowResults, PurchaseHeader."Document Date", PurchaseLine."Dimension Set ID", BudgetGLAccount));
                end;
        end;
    end;

    local procedure PaneMgtCalculations(ShowResults: Integer; DocumentDate: Date; DimSetID: Integer; BudgetGLAccount: Code[20]): Decimal
    var
        Commitments: Record 52185867;
        Amount: Decimal;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        FirstDay: Date;
        LastDay: Date;
        CurrMonth: Integer;
        Budget: Record "Analysis View Budget Entry";
        BudgetAmount: Decimal;
        Actuals: Record "Analysis View Entry";
        ActualsAmount: Decimal;
        CommitmentAmount: Decimal;
        FixedAssetsDet: Record "Fixed Asset";
        FAPostingGRP: Record "FA Posting Group";
        EntryNo: Integer;
    begin
        if DocumentDate = 0D then exit;
        BCSetup.Get();
        //check the votebook now
        FirstDay := Dmy2date(1, Date2dmy(DocumentDate, 2), Date2dmy(DocumentDate, 3));
        CurrMonth := Date2dmy(DocumentDate, 2);
        if CurrMonth = 12 then begin
            LastDay := Dmy2date(1, 1, Date2dmy(DocumentDate, 3) + 1);
            LastDay := CalcDate('-1D', LastDay);
        end
        else begin
            CurrMonth := CurrMonth + 1;
            LastDay := Dmy2date(1, CurrMonth, Date2dmy(DocumentDate, 3));
            LastDay := CalcDate('-1D', LastDay);
        end;

        BudgetGL := BudgetGLAccount;

        //For End Total Budgeting -TMEA
        if BCSetup."Use Totaling Account" then begin
            GLAcc.Get(BudgetGL);
            if GLAcc."Budget Control Account" <> '' then
                BudgetGL := GLAcc."Budget Control Account"
            else
                Error('G/L Account %1 is not mapped to a budget control account', BudgetGL);
        end;
        //End (End Total Budget)

        BudgetAmount := 0;
        ActualsAmount := 0;

        GLAcc.Reset;
        GLAcc.SetRange("No.", BudgetGL);
        GLAcc.SetRange("Date Filter", BCSetup."Current Budget Start Date", LastDay);
        GLAcc.SetRange("Budget Filter", BCSetup."Current Budget Code");
        GLAcc.SetRange("Dimension Set ID Filter", DimSetID);
        if GLAcc.Find('-') then begin
            GLAcc.CalcFields("Budgeted Amount", "Net Change");
            BudgetAmount := GLAcc."Budgeted Amount";
            ActualsAmount := GLAcc."Net Change";
        end;
        if ShowResults = 0 then exit(BudgetAmount);

        if ShowResults = 1 then exit(ActualsAmount);

        //get the committments
        CommitmentAmount := 0;
        Commitments.Reset;
        Commitments.SetRange(Commitments.Budget, BCSetup."Current Budget Code");
        Commitments.SetRange(Commitments."G/L Account No.", BudgetGL);
        Commitments.SetRange(Commitments."Posting Date", BCSetup."Current Budget Start Date", LastDay);
        Commitments.SetRange(Commitments."Dimension Set ID", DimSetID);
        Commitments.CalcSums(Commitments.Amount);
        CommitmentAmount := Commitments.Amount;
        if ShowResults = 2 then exit(CommitmentAmount);
    end;
}
