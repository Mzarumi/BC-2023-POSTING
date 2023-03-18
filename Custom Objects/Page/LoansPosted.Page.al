page 52185769 "Loans Posted"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    UsageCategory = Lists;
    SourceTable = Loans;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Loan No."; Rec."Loan No.")
                {
                    Editable = false;
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                    Editable = false;
                }
                field("Member No."; Rec."Member No.")
                {
                    Editable = false;
                }
                field("Repayment Frequency"; Rec."Repayment Frequency")
                {
                    Enabled = false;
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                    Editable = false;
                }
                field(Interest; Rec.Interest)
                {
                    Editable = false;
                }
                field("Member Name"; Rec."Member Name")
                {
                    Editable = false;
                }
                field("Approval Date"; Rec."Approval Date")
                {
                    Editable = false;
                }
                field("Loan Span"; Rec."Loan Span")
                {
                }
                field(Installments; Rec.Installments)
                {
                    Editable = false;
                }
                field("Disbursement Date"; Rec."Disbursement Date")
                {
                    Editable = false;
                }
                field("Loan Principle Repayment"; Rec."Loan Principle Repayment")
                {
                    Editable = false;
                }
                field(Repayment; Rec.Repayment)
                {
                    Editable = false;
                }
                field("Recovery Mode"; Rec."Recovery Mode")
                {
                    Editable = false;
                }
                field("New Interest Rate"; Rec."New Interest Rate")
                {
                    Editable = false;
                }
                field("New No. of Installment"; Rec."New No. of Installment")
                {
                    Editable = false;
                }
                field("Loan Rescheduled"; Rec."Loan Rescheduled")
                {
                    Editable = false;
                }
                field("Amount To Disburse"; Rec."Amount To Disburse")
                {
                    Editable = false;
                }
                field("Interest Calculation Method"; Rec."Interest Calculation Method")
                {
                    Editable = false;
                }
                field("Disbursement Account No"; Rec."Disbursement Account No")
                {
                    Editable = false;
                }
                field("Staff No"; Rec."Staff No")
                {
                    Editable = false;
                }
                field("Captured By"; Rec."Captured By")
                {
                    Editable = false;
                }
                field("Loan Appraised By"; Rec."Loan Appraised By")
                {
                    Editable = false;
                }
                field("Approved By"; Rec."Approved By")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Branch';
                    Editable = false;
                }
                field("Batch No."; Rec."Batch No.")
                {
                    Editable = false;
                }
                field("Loans Category-SASRA"; Rec."Loans Category-SASRA")
                {
                    Editable = false;
                }
                field("Expected Date of Completion"; Rec."Expected Date of Completion")
                {
                    Editable = false;
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                }
                field("Outstanding Interest"; Rec."Outstanding Interest")
                {
                }
                field("Outstanding Bills"; Rec."Outstanding Bills")
                {
                }
                field("Employer Loan No."; Rec."Employer Loan No.")
                {
                }
                field("Employer Balance"; Rec."Employer Balance")
                {
                    Editable = false;
                }
                field("Sub Sector Level2"; Rec."Sub Sector Level2")
                {
                    Caption = 'Loan Purpose';
                    Editable = false;
                    ShowMandatory = true;
                }
            }
            group("Sectoral Classification")
            {
                Caption = 'Sectoral Classification';
                Editable = false;
                field("Main Sector"; Rec."Main Sector")
                {
                }
                field("Sub Sector Level1"; Rec."Sub Sector Level1")
                {
                }
                // field(SubSectorLevel2; Rec.SubSectorLevel2)
                // {
                //     Caption = 'Sub Sector Level2';

                //     trigger OnValidate()
                //     begin
                //         SubSectorLevel2 := "Sub Sector Level2";
                //     end;
                // }
                field("Main Sector Description"; Rec."Main Sector Description")
                {
                }
                field("Sub Sector Level1 Description"; Rec."Sub Sector Level1 Description")
                {
                }
                field("Sub Sector Level2 Description"; Rec."Sub Sector Level2 Description")
                {
                }
            }
            group("External STO Details")
            {
                Caption = 'External STO Details';
                Editable = false;
                field("Client Bank Code"; Rec."Client Bank Code")
                {
                    Editable = true;
                    ShowMandatory = true;
                }
                field("Client Bank Name"; Rec."Client Bank Name")
                {
                    ShowMandatory = true;
                }
                field("Client Account No"; Rec."Client Account No")
                {
                    Editable = true;
                    ShowMandatory = true;
                }
                field("External STO  Amount"; Rec."External STO  Amount")
                {
                }
                field("External STO Effective Date"; Rec."External STO Effective Date")
                {
                    Editable = true;
                    ShowMandatory = true;
                }
            }
            group("Shamba Loan Mandatory Requirements")
            {
                Caption = 'Shamba Loan Mandatory Requirements';
                Editable = false;
                Visible = IsShambaLoan;
                field("Sale Agreement"; Rec."Sale Agreement")
                {
                }
                field("20% Payment Slip"; Rec."20% Payment Slip")
                {
                }
                field("Land Valuation Done"; Rec."Land Valuation Done")
                {
                }
                field("Title Deed"; Rec."Title Deed")
                {
                }
            }
            part(Control38; "Loans Approval Entries")
            {
                SubPageLink = "Primary Rec" = FIELD("Loan No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Generate Repayment  Schedule")
            {
                Image = ReceivableBill;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    LoanApp: Record Loans;
                begin
                    //Delete schedule



                    LoanRescheduling.Reset;
                    LoanRescheduling.SetRange(LoanRescheduling."Loan No.", Rec."Loan No.");
                    LoanRescheduling.SetRange(LoanRescheduling.Rescheduled, true);
                    if not LoanRescheduling.Find('-') then begin
                        LRepaymentSchedule.Reset;
                        LRepaymentSchedule.SetRange(LRepaymentSchedule."Loan No.", Rec."Loan No.");
                        if LRepaymentSchedule.Find('-') then LRepaymentSchedule.DeleteAll;
                        GenerateSchedule();
                    end;
                    //Check if Ever Rescheduled.
                    LoanRescheduling.Reset;
                    LoanRescheduling.SetRange(LoanRescheduling."Loan No.", Rec."Loan No.");
                    LoanRescheduling.SetRange(LoanRescheduling.Rescheduled, true);
                    if LoanRescheduling.Find('-') then begin
                        LRepaymentSchedule.Reset;
                        LRepaymentSchedule.SetRange(LRepaymentSchedule."Loan No.", LoanRescheduling."Loan No.");
                        LRepaymentSchedule.SetRange("Repayment Date", CalcDate('<CM-1M+1D>', LoanRescheduling."Rescheduling Date"), 99991230D);
                        if LRepaymentSchedule.Find('-') then LRepaymentSchedule.DeleteAll;
                        repeat
                            GetNewRepayment(LoanRescheduling."No.");
                        until LoanRescheduling.Next = 0;
                    end;

                    Commit;

                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Loan No.", Rec."Loan No.");
                    //if LoanApp.Find('-') then
                    //REPORT.Run(52185725, true, true, LoanApp);
                end;
            }
            action("Repayment Method")
            {
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Loan Payment Method";
                RunPageLink = "Loan No." = FIELD("Loan No."),
                              "Member No." = FIELD("Member No.");

                trigger OnAction()
                begin
                    /*
                    IF "Appraisal Parameter Type"="Appraisal Parameter Type"::"Check Off" THEN BEGIN
                      RepMethods.RESET;
                      RepMethods.SETRANGE("Loan No.","Loan No.");
                        IF NOT RepMethods.FIND('-') THEN BEGIN
                           RepMethods."Loan No.":="Loan No.";
                           RepMethods.Amount:=Repayment;
                           RepMethods."Member No.":="Member No.";
                           RepMethods."Payment Method":=RepMethods."Payment Method"::Checkoff;
                           RepMethods.INSERT;
                        END;
                    END;
                    */

                end;
            }
            separator(Action29)
            {
            }
            action("Guarantors & Security")
            {
                Caption = 'Guarantors& Security';
                Image = ItemGroup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Loan Guarantors and Security";
                RunPageLink = "Loan No" = FIELD("Loan No.");
            }
            action("Loan [File]")
            {
                Image = Document;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    DMS: Record EDMS;
                begin
                    DMS.Reset;
                    DMS.SetRange(DMS.Key, DMS.Key::"Loan File");
                    if DMS.Find('-') then begin
                        HyperLink(DMS."url path" + Rec."Loan No.");
                    end;
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                    approvalsMgmt: Codeunit "Approvals Mgmt.";
                begin

                    approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Loans Topped Up")
            {
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    LoanApp: Record Loans;
                begin
                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Loan No.", Rec."Loan No.");
                    //if LoanApp.Find('-') then
                    //REPORT.Run(52185995, true, true, LoanApp);
                end;
            }
            action("External Loans Creared")
            {
                Image = Archive;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    LoanApp: Record Loans;
                begin
                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Loan No.", Rec."Loan No.");
                    //if LoanApp.Find('-') then
                    //REPORT.Run(52185996, true, true, LoanApp);
                end;
            }
            action("Salary Details")
            {
                Image = StatisticsGroup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Appraisal Salary Details.";
                RunPageLink = "Loan No" = FIELD("Loan No."),
                              "Client Code" = FIELD("Member No.");
                RunPageMode = View;

                trigger OnAction()
                begin
                    /*//Load defaults
                    AppraisalDetailsSetup.RESET;
                    IF AppraisalDetailsSetup.FIND('-') THEN BEGIN
                      REPEAT
                        AppraisalSalDetails.RESET;
                        AppraisalSalDetails.SETRANGE(AppraisalSalDetails."Loan No","Loan No.");
                        AppraisalSalDetails.SETRANGE(AppraisalSalDetails.Type,AppraisalDetailsSetup.Type);
                        AppraisalSalDetails.SETRANGE(Code,AppraisalDetailsSetup.Code);
                    
                        IF AppraisalSalDetails.FIND('-') THEN
                          EXIT;
                        AppraisalSalDetails.INIT;
                        AppraisalSalDetails."Loan No":="Loan No.";
                        AppraisalSalDetails."Client Code":="Member No.";
                        AppraisalSalDetails.Code:=AppraisalDetailsSetup.Code;
                        AppraisalSalDetails.Description:=AppraisalDetailsSetup.Description;
                        AppraisalSalDetails.Type:=AppraisalDetailsSetup.Type;
                        AppraisalSalDetails.INSERT;
                      UNTIL AppraisalDetailsSetup.NEXT=0;
                    END;
                    */

                end;
            }
            separator(Action56)
            {
            }
            action("Partial Loan Disbursement Schedule")
            {
                Caption = 'Partial Loan Disbursement Schedule';
                Image = PutAwayWorksheet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Partial Disbursement Schedule";
                RunPageLink = "Loan No." = FIELD("Loan No.");
            }
            action("Download Appraisal Used")
            {
                Image = Note;
                Promoted = true;

                trigger OnAction()
                var
                    EDMS: Record EDMS;
                    FromFile: Text;
                    Name: Text;
                    url: Text;
                begin
                    EDMS.Reset;
                    EDMS.SetRange(Key, EDMS.Key::"Appraisal File");
                    if EDMS.FindFirst then url := EDMS."url path";
                    FromFile := url + 'appraisal' + Rec."Member No." + Rec."Loan No." + '.pdf';
                    Name := 'appraisal' + Format(Rec."Member No.") + Format(Rec."Loan No.");
                    //Download(FromFile, 'Appraisal report', '', 'Text file(*.pdf)|*.pdf', Name);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SubSectorLevel2 := Rec."Sub Sector Level2";
    end;

    trigger OnOpenPage()
    begin
        /*IF Posted=TRUE THEN
        CurrPage.EDITABLE:=FALSE;
        */
        if ProdFac.Get(Rec."Loan Product Type") then begin
            if ProdFac."Shamba Loan" = true then
                IsShambaLoan := true
            else
                IsShambaLoan := false;
        end;

    end;

    var
        LRepaymentSchedule: Record "Loan Repayment Schedule";
        LoanRescheduling: Record "Loan Rescheduling";
        LoanProcess: Codeunit "Loans Process";
        UpdateMember: Codeunit "DCS Management";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        GetScore: Codeunit "DCS Management";
        LoansR: Record Loans;
        LoanAmount: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Integer;
        LBalance: Decimal;
        RunDate: Date;
        InstalNo: Decimal;
        RepayInterval: DateFormula;
        TotalMRepay: Decimal;
        LInterest: Decimal;
        LPrincipal: Decimal;
        RepayCode: Code[40];
        GrPrinciple: Integer;
        GrInterest: Integer;
        QPrinciple: Decimal;
        QCounter: Integer;
        InPeriod: DateFormula;
        InitialInstal: Integer;
        InitialGraceInt: Integer;
        RSchedule: Record "Loan Repayment Schedule";
        LoanApp: Record Loans;
        PartialSched: Record "Partial Disbursement Schedule";
        AppraisalDetailsSetup: Record "Appraisal Salary Set-up";
        AppraisalSalDetails: Record "Appraisal Salary Details";
        LReq: Record "Loan Mandatory Requirements";
        LoanGua: Record "Loan Guarantors and Security";
        Coll: Record "Loan Collateral";
        Found: Boolean;
        SavAcc: Record "Savings Accounts";
        ApplDocs: Record "Product Documents";
        LoanReqDocs: Record "Loan Required Documents";
        BusinessIncome: Record "Business Income";
        SendSMS: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        Members: Record Members;
        LoansTopup: Record "Loans Top up";
        ExternalComm: Record "Other Commitements Clearance";
        TotalOffset: Decimal;
        ProdFac: Record "Product Factory";
        Vend: Record Vendor;
        GLAcc: Record "G/L Account";
        PaymentMethods: Record "Payment Methods";
        LoanRepay: Decimal;
        RepMethods: Record "Payment Methods";
        CompInfo: Record "Company Information";
        EndDateSalo: Date;
        SalProc: Record "Salary Lines";
        SubSectorLevel2: Code[10];
        GenSetup: Record "General Set-Up";
        IsShambaLoan: Boolean;

    local procedure GenerateSchedule()
    var
        RSchedule: Record "Loan Repayment Schedule";
        LoanAmount: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Integer;
        LBalance: Decimal;
        RunDate: Date;
        RepaymentDate: Date;
        InstalNo: Decimal;
        RepayInterval: DateFormula;
        TotalMRepay: Decimal;
        LInterest: Decimal;
        LPrincipal: Decimal;
        RepayCode: Code[40];
        GrPrinciple: Integer;
        GrInterest: Integer;
        QPrinciple: Decimal;
        QCounter: Integer;
        InPeriod: DateFormula;
        InitialInstal: Integer;
        InitialGraceInt: Integer;
        GeneralSetUp: Record "General Set-Up";
    begin
        QCounter := 0;
        QCounter := 3;

        GenSetup.Get;

        LoansR.Reset;
        LoansR.SetRange(LoansR."Loan No.", Rec."Loan No.");
        if LoansR.Find('-') then begin

            Rec.TestField("Disbursement Date");

            LoanAmount := LoansR."Approved Amount";
            if LoansR."Loan Rescheduled" then begin

                InterestRate := LoansR.Interest;
            end else
                InterestRate := LoansR.Interest;
            RepayPeriod := LoansR.Installments;
            InitialInstal := LoansR.Installments;
            LBalance := LoansR."Approved Amount";
            //RunDate:="Repayment Start Date";
            RunDate := CalcDate('1M', CalcDate('<CM>', Rec."Disbursement Date"));

            InstalNo := 0;

            //Repayment Frequency
            repeat
                InstalNo := InstalNo + 1;

                //kma
                if Rec."Interest Calculation Method" = Rec."Interest Calculation Method"::Amortised then begin
                    Rec.TestField(Interest);
                    Rec.TestField(Installments);
                    TotalMRepay := Round((InterestRate / 12 / 100) / (1 - Power((1 + (InterestRate / 12 / 100)), -(RepayPeriod))) * (LoanAmount), 0.0001, '>');
                    LInterest := Round(LBalance / 100 / 12 * InterestRate, 0.0001, '>');
                    LPrincipal := TotalMRepay - LInterest;
                end;

                if Rec."Interest Calculation Method" = Rec."Interest Calculation Method"::"Straight Line" then begin
                    Rec.TestField(Interest);
                    Rec.TestField(Installments);
                    LPrincipal := LoanAmount / RepayPeriod;
                    LInterest := (InterestRate / 12 / 100) * LoanAmount;
                    //Grace Period Interest
                    //LInterest:=(LInterest*InitialInstal)/(InitialInstal-InitialGraceInt);
                end;

                if Rec."Interest Calculation Method" = Rec."Interest Calculation Method"::"Reducing Balance" then begin
                    Rec.TestField(Interest);
                    Rec.TestField(Installments);
                    LPrincipal := LoanAmount / RepayPeriod;
                    LInterest := (InterestRate / 12 / 100) * LBalance;
                end;

                if Rec."Interest Calculation Method" = Rec."Interest Calculation Method"::"Reducing Flat" then begin
                    Rec.TestField(Interest);
                    Rec.TestField(Installments);
                    LPrincipal := Round(LoanAmount / RepayPeriod, 1.0, '>');
                    LInterest := Round(((LoanAmount * InterestRate / 12 / 100) + (LPrincipal * InterestRate / 12 / 100)) / 2, 1.0, '>');
                    Rec.Repayment := LPrincipal + LInterest;
                end;
                //kma



                //Grace Period
                if GrPrinciple > 0 then begin
                    LPrincipal := 0
                end else begin
                    //IF "Instalment Period" <> InPeriod THEN
                    LBalance := LBalance - LPrincipal;

                end;

                if GrInterest > 0 then
                    LInterest := 0;

                GrPrinciple := GrPrinciple - 1;
                GrInterest := GrInterest - 1;

                Evaluate(RepayCode, Format(InstalNo));

                RSchedule.Init;
                RSchedule."Repayment Code" := RepayCode;
                RSchedule."Loan No." := Rec."Loan No.";
                RSchedule."Loan Amount" := LoanAmount;
                RSchedule."Instalment No" := InstalNo;
                RSchedule."Repayment Date" := RunDate;
                RSchedule."Member No." := Rec."Member No.";
                RSchedule."Loan Category" := Rec."Loan Product Type";
                RSchedule."Monthly Repayment" := LInterest + LPrincipal;
                ;
                RSchedule."Monthly Interest" := LInterest;
                RSchedule."Principal Repayment" := LPrincipal;
                RSchedule.Insert;


                //Repayment Frequency
                if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Daily then
                    RunDate := CalcDate('1D', RunDate)
                else
                    if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Weekly then
                        RunDate := CalcDate('1W', RunDate)
                    else
                        if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Monthly then
                            RunDate := CalcDate('1M', RunDate)
                        else
                            if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Quarterly then
                                RunDate := CalcDate('1Q', RunDate)
                            else
                                if Rec."Repayment Frequency" = Rec."Repayment Frequency"::"Bi-Annual" then
                                    RunDate := CalcDate('6M', RunDate)
                                else
                                    if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Yearly then
                                        RunDate := CalcDate('1Y', RunDate);

            until LBalance < 1
        end;
    end;

    local procedure GetNewRepayment(ReScheduleNo: Text)
    var
        ReschedulingList: Record "Loan Rescheduling";
        Loans: Record Loans;
        GeneralSetUp: Record "General Set-Up";
        LoanRepaymentSchedule: Record "Loan Repayment Schedule";
        CreditAccounts: Record "Credit Accounts";
        ProdF: Record "Product Factory";
        Text0003: Label 'You can not reschedule more than the initial insatllment';
        LoanAmount: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Integer;
        LBalance: Decimal;
        RunDate: Date;
        InstalNo: Decimal;
        TotalMRepay: Decimal;
        LInterest: Decimal;
        LPrincipal: Decimal;
        RepayCode: Code[40];
    begin
        //Check if Ever Rescheduled.
        ReschedulingList.Reset;
        ReschedulingList.SetRange(ReschedulingList."No.", ReScheduleNo);
        ReschedulingList.SetRange(ReschedulingList.Rescheduled, true);
        if ReschedulingList.Find('-') then begin
            Loans.Reset;
            Loans.SetRange(Loans."Loan No.", ReschedulingList."Loan No.");
            if Loans.Find('-') then begin
                GeneralSetUp.Get;

                LoanRepaymentSchedule.Reset;
                LoanRepaymentSchedule.SetRange("Loan No.", Loans."Loan No.");
                LoanRepaymentSchedule.SetRange("Repayment Date", CalcDate('<CM-1M+1D>', ReschedulingList."Rescheduling Date"), 99991230D);
                if LoanRepaymentSchedule.Find('-') then LoanRepaymentSchedule.DeleteAll;

                //Loans.CALCFIELDS("Outstanding Balance","Outstanding Interest");

                InterestRate := Loans.Interest;

                RepayPeriod := ReschedulingList."New Installments";
                LoanAmount := ReschedulingList."Outstanding Balance";
                LBalance := ReschedulingList."Outstanding Balance";
                RunDate := CalcDate('<CM>', ReschedulingList."Rescheduling Date");

                repeat
                    InstalNo := InstalNo + 1;

                    if Loans."Interest Calculation Method" = Loans."Interest Calculation Method"::Amortised then begin
                        TotalMRepay := Round((InterestRate / 1200) / (1 - Power((1 + (InterestRate / 1200)), -(RepayPeriod))) * (LoanAmount), 0.0001, '>');
                        LInterest := Round(LBalance / 1200 * InterestRate, 0.0001, '>');
                        LPrincipal := TotalMRepay - LInterest;
                        Loans.Repayment := LInterest + LPrincipal;
                    end;

                    if Loans."Interest Calculation Method" = Loans."Interest Calculation Method"::"Straight Line" then begin
                        LPrincipal := LoanAmount / RepayPeriod;
                        LInterest := (InterestRate / 1200) * LoanAmount;
                        Loans.Repayment := LPrincipal;
                    end;

                    if Loans."Interest Calculation Method" = Loans."Interest Calculation Method"::"Reducing Balance" then begin
                        LPrincipal := LoanAmount / RepayPeriod;
                        LInterest := (InterestRate / 1200) * LBalance;
                        Loans.Repayment := LPrincipal;
                    end;

                    if Loans."Interest Calculation Method" = Loans."Interest Calculation Method"::"Reducing Flat" then begin
                        LPrincipal := Round(LoanAmount / RepayPeriod, 1.0, '>');
                        LInterest := Round(((LoanAmount * InterestRate / 12 / 100) + (LPrincipal * InterestRate / 12 / 100)) / 2, 1.0, '>');
                        Loans.Repayment := LPrincipal + LInterest;
                        

                    end;
                    //Decrement the Balance
                    LBalance := LBalance - LPrincipal;

                    Evaluate(RepayCode, Format(InstalNo));

                    LoanRepaymentSchedule.Init;
                    LoanRepaymentSchedule."Repayment Code" := RepayCode;
                    LoanRepaymentSchedule."Loan No." := Loans."Loan No.";
                    LoanRepaymentSchedule."Loan Amount" := ReschedulingList."Outstanding Balance";
                    LoanRepaymentSchedule."Instalment No" := InstalNo;
                    LoanRepaymentSchedule."Repayment Date" := RunDate;
                    LoanRepaymentSchedule."Member No." := Rec."Member No.";
                    LoanRepaymentSchedule."Loan Category" := Loans."Loan Product Type";
                    LoanRepaymentSchedule."Monthly Repayment" := LInterest + LPrincipal;
                    ;
                    LoanRepaymentSchedule."Monthly Interest" := LInterest;
                    LoanRepaymentSchedule."Principal Repayment" := LPrincipal;
                    LoanRepaymentSchedule."Reset Doc No." := ReschedulingList."No.";
                    LoanRepaymentSchedule."Reset Schedule" := true;
                    LoanRepaymentSchedule.Insert;

                    //Repayment Frequency
                    if Loans."Repayment Frequency" = Loans."Repayment Frequency"::Daily then
                        RunDate := CalcDate('1D', RunDate)
                    else
                        if Loans."Repayment Frequency" = Loans."Repayment Frequency"::Weekly then
                            RunDate := CalcDate('1W', RunDate)
                        else
                            if Loans."Repayment Frequency" = Loans."Repayment Frequency"::Monthly then
                                RunDate := CalcDate('1M', RunDate)
                            else
                                if Loans."Repayment Frequency" = Loans."Repayment Frequency"::Quarterly then
                                    RunDate := CalcDate('1Q', RunDate);
                //Repayment Frequency

                until InstalNo = ReschedulingList."New Installments";

                if CreditAccounts.Get(Loans."Loan Account") then begin
                    if ProdF.Get(CreditAccounts."Product Type") then begin
                        if (ProdF."Nature of Loan Type" <> ProdF."Nature of Loan Type"::Defaulter) and
                           (ReschedulingList."Original Installments" < InstalNo) then
                            Error(Text0003);
                    end;
                end;
            end;
        end;
    end;
}

