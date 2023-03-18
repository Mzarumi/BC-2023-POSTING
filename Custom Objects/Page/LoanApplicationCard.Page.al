page 52185753 "Loan Application Card"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Loan File,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = Loans;
    SourceTableView = WHERE(Posted = CONST(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Loan No."; Rec."Loan No.")
                {
                    Editable = false;
                }
                field("CRM Application No."; Rec."CRM Application No.")
                {
                    Editable = ApplicationDetailsEdit;
                }
                field("Staff No"; Rec."Staff No")
                {
                    Caption = 'Staff No';
                    Editable = ApplicationDetailsEdit;
                }
                field("Member No."; Rec."Member No.")
                {
                    Caption = 'Member';
                    Editable = ApplicationDetailsEdit;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        SADVisible := false;
                        if Members.Get(Rec."Member No.") then
                            if Members."Employer Code" = '05' then
                                SADVisible := true;


                        if ProdFac.Get(Rec."Loan Product Type") then begin
                            if ProdFac."Mortgage Loan" = true then begin
                                Members.Get(Rec."Member No.");
                                if Members."Employer Code" = '99' then
                                    CheckRetirementDate := true
                                else
                                    CheckRetirementDate := false
                            end;
                        end;
                        if Members.Get(Rec."Member No.") then begin
                            if Members."Mobile Phone No" = '' then
                                Error('Member must have phone number in the system');

                            if StrLen(Members."Mobile Phone No") < 10 then
                                Error('Member phone number is not valid');
                        end;
                    end;
                }
                field("Member Name"; Rec."Member Name")
                {
                    Editable = false;
                }
                field("SAD No."; Rec."SAD No.")
                {
                    Editable = SADVisible;
                }
                field("Application Date"; Rec."Application Date")
                {
                    Editable = ApplicationDetailsEdit;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Posted, false);
                    end;
                }
                field("Member Deposits"; Rec."Member Deposits")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                    Editable = ApplicationDetailsEdit;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        ProdFac.Get(Rec."Loan Product Type");
                        //Commented for No salary
                        Members.Get(Rec."Member No.");

                        if ProdFac."Repay Mode" = ProdFac."Repay Mode"::Salary then begin
                            //IF NOT (Members."Member Category"='CONTRACT')AND (Members."Employer Code"='00') THEN BEGIN//To cater for BDE To receive salary advance

                            EndDateSalo := CalcDate('-' + Format(ProdFac."Salary Period"), Today);//+FORMAT(ProdFac."No. of Salary Times")
                            SalProc.Reset;
                            SalProc.SetRange("Account No.", Rec."Disbursement Account No");
                            SalProc.SetRange("Posting Date", EndDateSalo, Today);
                            SalProc.SetRange(Posted, true);
                            if SalProc.Find('-') then begin
                                if SalProc.Count < ProdFac."No. of Salary Times" then
                                    Error(Text010);

                            end else
                                Error(Text010);
                            //END;
                        end;
                        ProdFac.Get(Rec."Loan Product Type");

                        if (ProdFac."Requires Salary Processing" = true) then begin
                            //IF NOT (Members."Member Category"='CONTRACT') AND (Members."Employer Code"='00')THEN BEGIN//To cater for BDE To receive salary advance
                            EndDateSalo := CalcDate('-' + Format(ProdFac."Salary Period"), Today);//+FORMAT(ProdFac."No. of Salary Times")
                            SalProc.Reset;
                            SalProc.SetRange("Account No.", Rec."Disbursement Account No");
                            SalProc.SetRange("Posting Date", EndDateSalo, Today);
                            //SalProc.SETRANGE(Posted,TRUE);
                            if SalProc.Find('-') then begin
                                if SalProc.Count < ProdFac."No. of Salary Times" then
                                    Error(Text010);

                            end else
                                if Rec."Loan Product Type" = '140' then
                                    Rec.Installments := 72
                                else
                                    Error(Text010);
                            //END;
                        end;


                        if ProdFac.Get(Rec."Loan Product Type") then begin
                            if ProdFac."Mortgage Loan" = true then
                                IfMortgage := true
                            else
                                IfMortgage := false;
                        end;

                        if ProdFac.Get(Rec."Loan Product Type") then begin
                            if ProdFac."Mortgage Loan" = true then begin
                                Members.Get(Rec."Member No.");
                                if Members."Employer Code" = '99' then
                                    CheckRetirementDate := true
                                else
                                    CheckRetirementDate := false
                            end;
                        end;

                        if ProdFac.Get(Rec."Loan Product Type") then begin
                            if ProdFac."Mortgage Loan" = true then
                                IsMortgageLoan := true
                            else
                                IsMortgageLoan := false;

                            if Rec."Loan Product Type" = '138' then
                                IfJenga := true
                            else
                                IfJenga := false;

                        end;
                        if ProdFac.Get(Rec."Loan Product Type") then begin
                            if ProdFac."Shamba Loan" = true then
                                IsShambaLoan := true
                            else
                                IsShambaLoan := false;
                        end;

                        CurrPage.Update;
                    end;
                }
                field("Loan Product Type Name"; Rec."Loan Product Type Name")
                {
                }
                field("Interest Calculation Method"; Rec."Interest Calculation Method")
                {
                    Editable = false;
                }
                field("Recovery Mode"; Rec."Recovery Mode")
                {

                    trigger OnValidate()
                    begin
                        Rec.TestField("Member No.");
                        if Rec."Recovery Mode" = Rec."Recovery Mode"::"Internal STO" then begin
                            SavingsAccounts.Reset;
                            SavingsAccounts.SetRange("Product Type", '505');
                            SavingsAccounts.SetRange("Member No.", Rec."Member No.");
                            SavingsAccounts.SetRange("Salary Through FOSA", true);
                            if not SavingsAccounts.FindFirst then Error('Member''s salary does not pass through FOSA');
                        end;

                        Rec.TestField("Loan Product Type");
                        if Rec."Loan Product Type" = '142' then begin
                            if (Rec."Recovery Mode" <> Rec."Recovery Mode"::Checkoff) and (Rec."Recovery Mode" <> Rec."Recovery Mode"::"Internal STO") then
                                Error('Recovery mode must be either Checkoff or internal STO');
                        end;
                    end;
                }
                field("Appraisal Parameter Type"; Rec."Appraisal Parameter Type")
                {
                    Editable = false;
                }
                field("Retirement/Expiry Date"; Rec."Retirement/Expiry Date")
                {
                    Editable = CheckRetirementDate;
                }
                field(Installments; Rec.Installments)
                {
                    Editable = ApplicationDetailsEdit;

                    trigger OnValidate()
                    begin
                        if (ProdFac."Requires Salary Processing" = true) then begin
                            //IF NOT (Members."Member Category"='CONTRACT') AND (Members."Employer Code"='00')THEN BEGIN//To cater for BDE To receive salary advance
                            EndDateSalo := CalcDate('-' + Format(ProdFac."Salary Period"), Today);//+FORMAT(ProdFac."No. of Salary Times")
                            SalProc.Reset;
                            SalProc.SetRange("Account No.", Rec."Disbursement Account No");
                            SalProc.SetRange("Posting Date", EndDateSalo, Today);
                            //SalProc.SETRANGE(Posted,TRUE);
                            if SalProc.Find('-') then begin
                                if SalProc.Count < ProdFac."No. of Salary Times" then
                                    Error(Text010);

                            end else
                                if (Rec."Loan Product Type" = '140') and (Rec.Installments > 72) then begin
                                    Rec.Installments := 72;
                                    Message('Installments must less than or equal to 72');
                                end;
                            //END;
                        end;
                    end;
                }
                field(Interest; Rec.Interest)
                {
                    Editable = ApplicationDetailsEdit;
                }
                field("Cost Value of House"; Rec."Cost Value of House")
                {
                    Editable = IfMortgage;
                }
                field("Property Cost Value"; Rec."Property Cost Value")
                {
                    Caption = 'Property Cost Value';
                    Editable = IsShambaLoan;
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                    Caption = 'Amount Applied';
                    Editable = AppliedAmountEdit;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Posted, false);
                    end;
                }
                field("Recommended Amount"; Rec."Recommended Amount")
                {
                    Caption = 'System Recommended Amount';
                    Editable = false;
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                    Caption = 'Approved Amount';
                    Editable = ApplicationDetailsEdit;
                }
                field("Amount To Disburse"; Rec."Amount To Disburse")
                {
                    Editable = ApplicationDetailsEdit;

                    trigger OnValidate()
                    begin
                        if Rec."Mode of Disbursement" = Rec."Mode of Disbursement"::"Partial Disbursement" then
                            UseBatch := true
                    end;
                }
                field("Comment for Exemptions"; Rec."Comment for Exemptions")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                    Editable = true;
                    Visible = true;
                }
                field("CRB Rating"; Rec."CRB Rating")
                {
                    Editable = ApplicationDetailsEdit;
                }
                field("Purpose of Loan"; Rec."Purpose of Loan")
                {
                    Editable = ApplicationDetailsEdit;
                    Visible = false;
                }
                field("BDE Type"; Rec."BDE Type")
                {
                    Editable = ApplicationDetailsEdit;
                }
                field("Loan BDE"; Rec."Loan BDE")
                {
                    Editable = ApplicationDetailsEdit;
                }
                field("Loan Appraised By"; Rec."Loan Appraised By")
                {
                    Editable = false;
                }
                field("Approved By"; Rec."Approved By")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = ApplicationDetailsEdit;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Loans - Deposit Purchase"; Rec."Loans - Deposit Purchase")
                {
                    Caption = 'Share Boosting- Purchase';
                    Editable = ApplicationDetailsEdit;

                    trigger OnValidate()
                    begin
                        if Members.Get(Rec."Member No.") then begin
                            if Cust.Get(Members."Employer Code") then begin
                                if Cust."Self Employed" then begin
                                    Error(ShareBoostError);
                                    Rec."Share Boosted Amount" := 0.0;
                                    Rec.Modify;
                                end;
                            end;
                        end;
                    end;
                }
                field("Responsibility Centre"; Rec."Responsibility Centre")
                {
                    Editable = ApplicationDetailsEdit;
                }
                field("Self Guarantee"; Rec."Self Guarantee")
                {
                    Editable = ApplicationDetailsEdit;
                }
                field("Loan Account"; Rec."Loan Account")
                {
                }
                field("Disbursement Account No"; Rec."Disbursement Account No")
                {
                }
                field("Batch No."; Rec."Batch No.")
                {
                    Editable = UseBatch;
                }
                field(Repayment; Rec.Repayment)
                {
                    Editable = false;
                }
                field("Loan Principle Repayment"; Rec."Loan Principle Repayment")
                {
                    Editable = false;
                }
                field("Discounted Amount"; Rec."Discounted Amount")
                {
                    Editable = ApprovedEdit;
                }
                field("Mode of Disbursement"; Rec."Mode of Disbursement")
                {
                    Editable = ApplicationDetailsEdit;

                    trigger OnValidate()
                    begin

                        if Rec."Mode of Disbursement" = Rec."Mode of Disbursement"::"Partial Disbursement" then
                            UseBatch := true else
                            UseBatch := false;
                    end;
                }
                field("Disbursement Destination"; Rec."Disbursement Destination")
                {
                    Editable = ApplicationDetailsEdit;
                }
                field("Captured By"; Rec."Captured By")
                {
                    Editable = false;
                }
                field("Details Verified By"; Rec."Details Verified By")
                {
                    Editable = false;
                }
                field("Repayment Frequency"; Rec."Repayment Frequency")
                {
                    Editable = false;
                }
                field("Disbursement Date"; Rec."Disbursement Date")
                {
                    Editable = ApprovedEdit;
                }
                field("Repayment Start Date"; Rec."Repayment Start Date")
                {
                    Editable = false;
                    Visible = true;
                }
                field("Expected Date of Completion"; Rec."Expected Date of Completion")
                {
                    Editable = false;
                    Visible = true;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Loan Rejection Reason"; Rec."Loan Rejection Reason")
                {
                    Editable = DisbursementEdit;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Loan Defferal Reason"; Rec."Loan Defferal Reason")
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                }
                field("Approval Date"; Rec."Approval Date")
                {
                }
                field("Sub Sector Level2"; Rec."Sub Sector Level2")
                {
                    Caption = 'Loan Purpose';
                    Editable = ApplicationDetailsEdit;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        SubSectorLevel2 := Rec."Sub Sector Level2";
                    end;
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
            group("Mortage Loan Mandatory Requirement")
            {
                Caption = 'Mortage Loan Mandatory Requirement';
                Editable = ApplicationDetailsEdit;
                Visible = IsMortgageLoan;
                field("Title/Lease Provided"; Rec."Title/Lease Provided")
                {
                }
                field("Title/Lease No"; Rec."Title/Lease No")
                {
                }
                field("Three Months Payslip"; Rec."Three Months Payslip")
                {
                }
                field("Mortgage Protection Policy"; Rec."Mortgage Protection Policy")
                {
                }
                field("Mortgage Protection Policy No"; Rec."Mortgage Protection Policy No")
                {
                }
                field("Domestic Insurance Cover"; Rec."Domestic Insurance Cover")
                {
                }
                field("Domestic Insurance Cover No"; Rec."Domestic Insurance Cover No")
                {
                }
                field("Employer Introduction Letter"; Rec."Employer Introduction Letter")
                {
                }
                field("Six Months Bank Statement"; Rec."Six Months Bank Statement")
                {
                }
                field("National ID"; Rec."National ID")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("KRA PIN Copy"; Rec."KRA PIN Copy")
                {
                }
                field("KRA PIN"; Rec."KRA PIN")
                {
                }
                field("Vendor Letter/Sale Agreement"; Rec."Vendor Letter/Sale Agreement")
                {
                    Caption = 'Offer Letter/Draft Sale agreement';
                }
                field("Injury Benefit Insurance"; Rec."Injury Benefit Insurance")
                {
                    Editable = IfJenga;
                }
                field("Drawdown Schedule"; Rec."Drawdown Schedule")
                {
                    Editable = IfJenga;
                }
                field("Mortgage Insurance Amount"; Rec."Mortgage Insurance Amount")
                {
                }
            }
            group("Shamba Loan Mandatory Requirements")
            {
                Caption = 'Shamba Loan Mandatory Requirements';
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
            group("External STO Details")
            {
                Caption = 'External STO Details';
                Editable = Rec."Recovery Mode" = Rec."Recovery Mode"::"External STO";
                field("Client Bank Code"; Rec."Client Bank Code")
                {
                    ShowMandatory = true;
                }
                field("Client Bank Name"; Rec."Client Bank Name")
                {
                    ShowMandatory = true;
                }
                field("Client Account No"; Rec."Client Account No")
                {
                    ShowMandatory = true;
                }
                field("External STO  Amount"; Rec."External STO  Amount")
                {
                }
                field("External STO Effective Date"; Rec."External STO Effective Date")
                {
                    ShowMandatory = true;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Loan Payment Schedule")
            {
                Image = ReturnCustomerBill;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Loan Payment Schedule";
                RunPageLink = "Loan No." = FIELD("Loan No.");
            }
            separator(Action18)
            {
            }
            action("Create Loan Account")
            {
                Image = NewCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if ProdFac.Get(Rec."Loan Product Type") then
                        if Credit.Get(ProdFac."Account No. Prefix" + Rec."Member No." + ProdFac."Account No. Suffix") then
                            Rec."Loan Account" := ProdFac."Account No. Prefix" + Rec."Member No." + ProdFac."Account No. Suffix"
                        else begin
                            Rec."Loan Account" := LoanProcess."CreateLoan Account"(Rec."Member No.", Rec."Loan Product Type");

                        end;
                    Rec.Modify;
                end;
            }
            separator(Action44)
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
            separator(Action21)
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
            separator(Action24)
            {
            }
            action("Loan Top Ups")
            {
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Loan Top Up";
                RunPageLink = "Loan No." = FIELD("Loan No."),
                              "Client Code" = FIELD("Member No.");
            }
            separator(Action56)
            {
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

                    if Rec."Appraisal Parameter Type" = Rec."Appraisal Parameter Type"::"Check Off" then begin
                        RepMethods.Reset;
                        RepMethods.SetRange("Loan No.", Rec."Loan No.");
                        if not RepMethods.Find('-') then begin
                            RepMethods."Loan No." := Rec."Loan No.";
                            RepMethods.Amount := Rec.Repayment;
                            RepMethods."Member No." := Rec."Member No.";
                            RepMethods."Payment Method" := RepMethods."Payment Method"::Checkoff;
                            RepMethods.Insert;
                        end;
                    end;
                end;
            }
            separator(Action25)
            {
            }
            action("Other Commitments Clearance")
            {
                Image = Cost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Other Commitments Clearance";
                RunPageLink = "Loan No." = FIELD("Loan No.");
            }
            action("Asset Finance Deduction")
            {
                Image = BarCode;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Asset Finance Loans";
                RunPageLink = "Loan No." = FIELD("Loan No.");
            }
            separator(Action27)
            {
            }
            action("Salary Details")
            {
                Image = StatisticsGroup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Appraisal Salary Details";
                RunPageLink = "Loan No" = FIELD("Loan No."),
                              "Client Code" = FIELD("Member No.");

                trigger OnAction()
                begin
                    //Load defaults
                    AppraisalDetailsSetup.Reset;
                    if AppraisalDetailsSetup.Find('-') then begin
                        repeat
                            AppraisalSalDetails.Reset;
                            AppraisalSalDetails.SetRange(AppraisalSalDetails."Loan No", Rec."Loan No.");
                            AppraisalSalDetails.SetRange(AppraisalSalDetails.Type, AppraisalDetailsSetup.Type);
                            AppraisalSalDetails.SetRange(Code, AppraisalDetailsSetup.Code);

                            if AppraisalSalDetails.Find('-') then
                                exit;
                            AppraisalSalDetails.Init;
                            AppraisalSalDetails."Loan No" := Rec."Loan No.";
                            AppraisalSalDetails."Client Code" := Rec."Member No.";
                            AppraisalSalDetails.Code := AppraisalDetailsSetup.Code;
                            AppraisalSalDetails.Description := AppraisalDetailsSetup.Description;
                            AppraisalSalDetails.Type := AppraisalDetailsSetup.Type;
                            AppraisalSalDetails.Insert;
                        until AppraisalDetailsSetup.Next = 0;
                    end;
                end;
            }
            separator(Action33)
            {
            }
            action("Loan Collateral")
            {
                Image = SocialSecurity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Loan Collaterals1";
                RunPageLink = "Loan No." = FIELD("Loan No."),
                              "Client Code" = FIELD("Member No.");
                Visible = false;
            }
            action("Generate Repayment  Schedule")
            {
                Image = ReceivableBill;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Rec.Posted then
                        Error('The loan is already posted thus cannot generate the schedule');

                    //Delete schedule
                    RSchedule.Reset;
                    RSchedule.SetRange(RSchedule."Loan No.", Rec."Loan No.");
                    RSchedule.DeleteAll;

                    QCounter := 0;
                    QCounter := 3;




                    LoansR.Reset;
                    LoansR.SetRange(LoansR."Loan No.", Rec."Loan No.");
                    if LoansR.Find('-') then begin

                        Rec.TestField("Disbursement Date");
                        Rec.TestField("Repayment Start Date");


                        LoanAmount := LoansR."Approved Amount";
                        InterestRate := LoansR.Interest;
                        RepayPeriod := LoansR.Installments;
                        InitialInstal := LoansR.Installments;
                        LBalance := LoansR."Approved Amount";
                        RunDate := Rec."Repayment Start Date";

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

                            if (Rec."Interest Calculation Method" = Rec."Interest Calculation Method"::"Reducing Balance") or
                              (Rec."Interest Calculation Method" = Rec."Interest Calculation Method"::"Reducing Flat") then begin
                                Rec.TestField(Interest);
                                Rec.TestField(Installments);
                                LPrincipal := LoanAmount / RepayPeriod;
                                LInterest := Round((InterestRate / 12 / 100) * LBalance, 1.0, '>');
                            end;
                            /*
                            IF "Interest Calculation Method"="Interest Calculation Method"::"Straight Line" THEN BEGIN
                            Rec.TestField(Repayment);
                            IF LBalance < Repayment THEN
                            LPrincipal:=LBalance
                            ELSE
                            LPrincipal:=Repayment;
                            LInterest:=Interest;
                            END;
                            */
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

                    Commit;



                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Loan No.", Rec."Loan No.");
                    //if LoanApp.Find('-') then
                    //REPORT.Run(52185817, true, false, LoanApp);

                end;
            }
            separator(Action42)
            {
            }
            action("Mandatory Requirements")
            {
                Image = RegisteredDocs;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Page "Loan Required Documents";
                RunPageLink = "Loan No." = FIELD("Loan No.");
            }
            separator(Action47)
            {
            }
            separator(Action51)
            {
            }
            action("Loan History")
            {
                Image = History;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Loan History";
                RunPageLink = "Loan Application No." = FIELD("Loan No.");
            }
            separator(Action48)
            {
            }
            action("Business Income")
            {
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Page "Business Incomes";
                RunPageLink = "Loan No." = FIELD("Loan No.");

                trigger OnAction()
                begin
                    //here//LoanProcess.BusinessLoan(Rec);
                end;
            }
            separator(Action34)
            {
            }
            separator(Action32)
            {
            }
            action("Financial Business Appraisal")
            {
                Image = BankAccountStatement;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Page "Business Appraisals";
                RunPageLink = "Loan No." = FIELD("Loan No.");
                Visible = true;

                trigger OnAction()
                begin
                    //Load defaults

                    if Rec."Appraisal Parameter Type" = Rec."Appraisal Parameter Type"::"Corporate or Business" then begin
                        BusApprDet.Reset;
                        BusApprDet.SetRange("Loan No.", Rec."Loan No.");
                        BusApprDet.SetRange(Position, BusAppr.Position);
                        if BusApprDet.Find('-') then
                            BusApprDet.DeleteAll;
                        BusAppr.Reset;
                        if BusAppr.Find('-') then begin
                            repeat
                                /*BusApprDet.RESET;
                                BusApprDet.SETRANGE("Loan No.","Loan No.");
                                BusApprDet.SETRANGE(Position,BusAppr.Position);
                                IF BusApprDet.FIND('-') THEN
                                  EXIT;*/
                                TotalLoans := 0;
                                BusApprDet.Init;
                                BusApprDet.Code := BusAppr."Classifiaction Code";
                                BusApprDet.Position := BusAppr.Position;
                                BusApprDet.Description := BusAppr.Description;
                                if BusApprDet.Code = 'LONG TERM LOANS' then begin
                                    LoanApp.Reset;
                                    LoanApp.SetRange("Member No.", Rec."Member No.");
                                    if LoanApp.Find('-') then begin
                                        repeat
                                            LoanApp.CalcFields("Outstanding Balance");
                                            TotalLoans := TotalLoans + LoanApp."Outstanding Balance";
                                        until LoanApp.Next = 0;
                                    end;
                                end;
                                BusApprDet."Loan With Sacco" := TotalLoans;
                                BusApprDet."Financial Classification Code" := BusAppr."Financial Classifiaction";
                                BusApprDet."Loan No." := Rec."Loan No.";
                                BusApprDet.Insert;
                            until BusAppr.Next = 0;
                        end;
                    end;

                end;
            }
            separator(Action35)
            {
            }
            action("Business Evaluation Report")
            {
                Image = "REPORT";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Loan No.", Rec."Loan No.");
                    //if LoanApp.Find('-') then
                    //REPORT.Run(52185726, true, false, LoanApp)
                end;
            }
            action("Loan Appraisal Report")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    ProdFac.Get(Rec."Loan Product Type");
                    Rec.TestField("Recovery Mode");
                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Member No.", Rec."Member No.");
                    LoanApp.SetRange(LoanApp."Loan Product Type", Rec."Loan Product Type");
                    LoanApp.SetFilter(LoanApp."Total Loan Balance", '>0');
                    if LoanApp.Find('-') then begin
                        LoanApp.CalcFields("Total Loan Balance");
                        if LoanApp."Total Loan Balance" > LoanApp.Repayment then begin
                            LoansTopup.Reset;
                            LoansTopup.SetRange(LoansTopup."Loan No.", Rec."Loan No.");
                            LoansTopup.SetRange("Loan Top Up", LoanApp."Loan No.");
                            if not LoansTopup.Find('-') then
                                Error('Member has an existing %1 Loan No. %2, Kindly TopUp', Rec."Loan Product Type Name", LoanApp."Loan No.");
                        end;
                    end;

                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Member No.", Rec."Member No.");
                    LoanApp.SetRange(LoanApp."Loan Product Type", Rec."Loan Product Type");
                    LoanApp.SetFilter(LoanApp."Outstanding Balance", '>0');
                    if LoanApp.Find('-') then begin
                        LoansTopup.Reset;
                        LoansTopup.SetRange(LoansTopup."Loan No.", Rec."Loan No.");
                        LoansTopup.SetRange("Loan Top Up", LoanApp."Loan No.");
                        if not LoansTopup.Find('-') then
                            Error('Member has an existing %1 Loan No. %2, Kindly TopUp', Rec."Loan Product Type", LoanApp."Loan No.");
                    end;

                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Loan No.", Rec."Loan No.");
                    if LoanApp.Find('-') then begin
                        if LoanApp."Appraisal Parameter Type" = LoanApp."Appraisal Parameter Type"::"Check Off" then begin
                            if (ProdFac."Mortgage Loan" = false) then begin
                                //REPORT.Run(52185745, true, false, LoanApp);
                                Rec."Loan Appraised By" := UserId;
                                Rec.Modify;
                                CreateAppraisalBackup(LoanApp."Loan No.", 52185745);
                            end else
                                if ProdFac."Mortgage Loan" = true then begin
                                    //IF "Mortgage Insurance Amount"<=0 THEN ERROR('Kindly specify Mortgage Insurance amount');
                                    //REPORT.Run(52185957, true, false, LoanApp);
                                    Rec."Loan Appraised By" := UserId;
                                    Rec.Modify;
                                    CreateAppraisalBackup(LoanApp."Loan No.", 52185957);

                                end;
                        end;
                        if LoanApp."Appraisal Parameter Type" = LoanApp."Appraisal Parameter Type"::Salary then begin
                            //REPORT.Run(52185640, true, false, LoanApp);
                            Rec."Loan Appraised By" := UserId;
                            Rec.Modify;
                            CreateAppraisalBackup(LoanApp."Loan No.", 52185640);
                        end;
                        if LoanApp."Appraisal Parameter Type" = LoanApp."Appraisal Parameter Type"::"Corporate or Business" then begin
                            //REPORT.Run(/*39004281*/52185747, true, false, LoanApp);
                            Rec."Loan Appraised By" := UserId;
                            Rec.Modify;
                            CreateAppraisalBackup(LoanApp."Loan No.", 52185747);
                            //OLD ONE 39004267
                        end;
                    end;

                end;
            }
            separator(Action53)
            {
            }
            action("Post Advance")
            {
                Image = post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Post?', false) = true then begin
                        if ProdFac.Get(Rec."Loan Product Type") then begin
                            if ProdFac."Does not Require Batching" then
                                LoanProcess.PostSingleLoan(Rec."Loan No.")
                            else
                                Error('This product requires a batch process');
                        end;
                    end;
                end;
            }
            action("Discount Loan")
            {
                Image = Discount;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to discount loan?', false) = true then begin
                        LoanProcess.PostDiscounting(Rec."Loan No.", Rec."Discounted Amount");

                        //Reset
                        Rec."Discounted Amount" := 0;
                        Rec.Modify;
                    end;
                end;
            }
            separator(Action37)
            {
            }
            action(Approve)
            {
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = LoanApprove;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    ProdFac.Get(Rec."Loan Product Type");
                    if ProdFac."Shamba Loan" = true then begin
                        Rec.TestField("Land Valuation Done", true);
                        Rec.TestField("Sale Agreement", true);
                        Rec.TestField("20% Payment Slip", true);
                        Rec.TestField("Title Deed");
                    end;

                    FoundOne := false;
                    Rec.TestField("Recovery Mode");
                    Rec.TestField("Member No.");
                    if Rec."Recovery Mode" = Rec."Recovery Mode"::"Internal STO" then begin
                        StandingOrderHeader.Reset;
                        StandingOrderHeader.SetRange("Member No.", Rec."Member No.");
                        StandingOrderHeader.SetRange(Status, StandingOrderHeader.Status::Approved);
                        if StandingOrderHeader.FindFirst then begin
                            repeat
                                StandingOrderLines.Reset;
                                StandingOrderLines.SetRange("Document No.", StandingOrderHeader."No.");
                                StandingOrderLines.SetRange("Destination Account Type", StandingOrderLines."Destination Account Type"::Credit);
                                StandingOrderLines.SetRange("Loan No.", Rec."Loan No.");
                                if StandingOrderLines.FindFirst then begin
                                    FoundOne := true;
                                end;
                            until StandingOrderHeader.Next = 0;
                        end;
                        if FoundOne = false then Error('There is no standing order associated with this loan');
                    end;




                    if Rec."Captured By" = UserId then Error('You cannot approve  loan you captured!');

                    if (Rec."Loan Product Type" <> '142') then
                        if Rec."Loan Appraised By" <> UserId then Error('Kindly Run the appraisal report');


                    if (Rec."Loan Product Type" <> '123') and (Rec."Loan Product Type" <> '137') and (Rec."Loan Product Type" <> '138') and (Rec."Loan Product Type" <> '142') then
                        if Rec."Details Verified By" <> UserId then
                            Error('Kindly Verify the Guarantor Details and Payslip Details');
                    ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    //MESSAGE('Approved');
                end;
            }
            separator(Action28)
            {
            }
            action(SendApprovalRequest)
            {
                Caption = 'Send A&pproval Request';
                Enabled = NOT OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    MemberCategory: Record "Member Category";
                    SegmentCountyDividendSignat: Record "Segment/County/Dividend/Signat";
                begin
                    //Check minimum requirements
                    Rec.TestField("Recovery Mode");
                    //For DOD Members
                    if Mem.Get(Rec."Member No.") then begin
                        if Mem."Employer Code" = '05' then
                            Rec.TestField("SAD No.");
                    end;
                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Member No.", Rec."Member No.");
                    LoanApp.SetRange(LoanApp."Loan Product Type", Rec."Loan Product Type");
                    LoanApp.SetFilter(LoanApp."Total Loan Balance", '>0');
                    if LoanApp.Find('-') then begin
                        LoanApp.CalcFields("Total Loan Balance");
                        if LoanApp."Total Loan Balance" > LoanApp.Repayment then begin
                            LoansTopup.Reset;
                            LoansTopup.SetRange(LoansTopup."Loan No.", Rec."Loan No.");
                            LoansTopup.SetRange("Loan Top Up", LoanApp."Loan No.");
                            if not LoansTopup.Find('-') then
                                Error('Member has an existing %1 Loan No. %2, Kindly TopUp', Rec."Loan Product Type Name", LoanApp."Loan No.");
                        end;
                    end;

                    ValidateReq;
                    TotalOffset := 0;
                    GenSetup.Get();
                    if Mem.Get(Rec."Member No.") then begin
                        RetirementDate := CalcDate(Format(GenSetup."Max. Member Age"), Mem."Date of Birth");
                        if Mem."Employer Code" <> '99' then begin
                            if Mem."Tax Exempted" = false then begin
                                if Mem.Type <> Mem.Type::"From Other Sacco" then begin
                                    if Mem."Group Account" = false then begin
                                        ClientAge := HRDates.DetermineAge(Mem."Date of Birth", Today);
                                        ClientAgePart := CopyStr(ClientAge, 1, 2);
                                        ClientAgePart := CopyStr(ClientAge, 1, 2);
                                        Evaluate(ClientAgeValue, ClientAgePart);
                                        adj := Round((((RetirementDate - Rec."Repayment Start Date") / 365) * 12), 1, '<');
                                        if adj < Rec.Installments then
                                            Error('This member is ' + ClientAgePart + ' ' + 'yrs' + ',' + 'and will be retiring in' + ' ' + Format(adj) + ' ' + 'Months');
                                    end;
                                end;
                            end;
                        end;
                    end;
                    //Disabled
                    if Mem.Get(Rec."Member No.") then begin
                        RetirementDate := CalcDate(Format(GenSetup."Max. Member Age - Disabled"), Mem."Date of Birth");
                        if Mem."Employer Code" <> '99' then begin
                            if Mem."Tax Exempted" = true then begin
                                if Mem.Type <> Mem.Type::"From Other Sacco" then begin
                                    if Mem."Group Account" = false then begin
                                        ClientAge := HRDates.DetermineAge(Mem."Date of Birth", Today);
                                        ClientAgePart := CopyStr(ClientAge, 1, 2);
                                        ClientAgePart := CopyStr(ClientAge, 1, 2);
                                        Evaluate(ClientAgeValue, ClientAgePart);
                                        adj := Round((((RetirementDate - Rec."Repayment Start Date") / 365) * 12), 1, '<');
                                        if adj < Rec.Installments then
                                            Error('This member is ' + ClientAgePart + ' ' + 'yrs' + ',' + 'and will be retiring in' + ' ' + Format(adj) + ' ' + 'Months');
                                    end;
                                end;
                            end;
                        end;
                    end;






                    //salaried loans
                    //Get if salary based loan and the frequency in that period
                    ProdFac.Get(Rec."Loan Product Type");
                    //Commented for No salary

                    if ProdFac."Repay Mode" = ProdFac."Repay Mode"::Salary then begin
                        EndDateSalo := CalcDate('-' + Format(ProdFac."Salary Period"), Today);//+FORMAT(ProdFac."No. of Salary Times")
                        SalProc.Reset;
                        SalProc.SetRange("Account No.", Rec."Disbursement Account No");
                        SalProc.SetRange("Posting Date", EndDateSalo, Today);
                        SalProc.SetRange(Posted, true);
                        if SalProc.Find('-') then begin
                            if SalProc.Count < ProdFac."No. of Salary Times" then
                                Error(Text010);

                        end; /*ELSE
                       ERROR(Text010);*/
                    end;
                    ProdFac.Get(Rec."Loan Product Type");
                    if ProdFac."Requires Salary Processing" = true then begin
                        EndDateSalo := CalcDate('-' + Format(ProdFac."Salary Period"), Today);//+FORMAT(ProdFac."No. of Salary Times")
                        SalProc.Reset;
                        SalProc.SetRange("Account No.", Rec."Disbursement Account No");
                        SalProc.SetRange("Posting Date", EndDateSalo, Today);
                        SalProc.SetRange(Posted, true);
                        if SalProc.Find('-') then begin
                            if SalProc.Count < ProdFac."No. of Salary Times" then
                                Error(Text010);

                        end;/* ELSE
                       ERROR(Text010);*/
                    end;



                    //Check if checkoff product and ensure salary details captured
                    //Check if company code expects salary
                    //IF Cust.GET(Members."Employer Code") THEN BEGIN
                    Members.Get(Rec."Member No.");
                    Cust.Reset;
                    Cust.SetRange("No.", Members."Employer Code");
                    if Cust.Find('-') then begin
                        if (Cust."Loan Qualification" = Cust."Loan Qualification"::"Basic Pay") or (Cust."Loan Qualification" = Cust."Loan Qualification"::"Gross Pay") then
                            if (Rec."Appraisal Parameter Type" = Rec."Appraisal Parameter Type"::"Check Off") or (Rec."Appraisal Parameter Type" = Rec."Appraisal Parameter Type"::Salary) then begin
                                AppraisalSalDetails.Reset;
                                AppraisalSalDetails.SetRange("Loan No", Rec."Loan No.");
                                if not AppraisalSalDetails.Find('-') then
                                    Error(Text009);
                                if (AppraisalSalDetails.Type = AppraisalSalDetails.Type::"Gross Pay") and (AppraisalSalDetails.Amount = 0) then
                                    Error('Kindly capture Basic Salary information');
                            end else begin
                                RepMethods.Reset;
                                RepMethods.SetRange("Loan No.", Rec."Loan No.");
                                if RepMethods.Find('-') then begin
                                    if (RepMethods."Payment Method" <> RepMethods."Payment Method"::"Standing Order(External)") and
                                      (RepMethods."Payment Method" <> RepMethods."Payment Method"::"Standing Order(Internal)") then
                                        Error(Text013);
                                end;
                            end;
                    end else
                        Error(Text012);



                    //Check costs
                    PartialSched.Reset;
                    PartialSched.SetRange(PartialSched."Loan No.", Rec."Loan No.");
                    if PartialSched.Find('-') then begin
                        PartialSched.CalcSums(PartialSched.Amount);
                        if Rec."Amount To Disburse" + PartialSched.Amount <> Rec."Approved Amount" then
                            Error(AmtErr);
                    end;
                    Rec.TestField("Loan Account");
                    Rec.TestField("Disbursement Account No");
                    Rec.TestField("Disbursement Date");
                    Rec.TestField("Loan Product Type");
                    Rec.TestField("Amount To Disburse");
                    Rec.TestField("Global Dimension 1 Code");
                    Rec.TestField("Loan Account");
                    //Rec.TestField("Global Dimension 2 Code");
                    Rec.TestField("Approved Amount");
                    Rec.TestField("Disbursement Account No");
                    Rec.TestField("Sub Sector Level2");

                    ProdFac.Get(Rec."Loan Product Type");
                    if ProdFac."Mortgage Loan" = true then begin
                        Rec.TestField("Three Months Payslip", true);
                        //Rec.TestField("Mortgage Protection Policy",TRUE);
                        //Rec.TestField("Domestic Insurance Cover",TRUE);
                        Rec.TestField("Employer Introduction Letter", true);
                        Rec.TestField("Six Months Bank Statement", true);
                        Rec.TestField("National ID", true);
                        Rec.TestField("Title/Lease Provided", true);
                        Rec.TestField("Title/Lease No");
                        Rec.TestField("ID No.");
                        Rec.TestField("KRA PIN");
                        Rec.TestField("KRA PIN Copy", true);
                        Rec.TestField("Vendor Letter/Sale Agreement", true);
                        "CheckDisbursementA/CBalance"(Rec."Disbursement Account No");
                        //IF "Mortgage Insurance Amount"<=0 THEN ERROR('Kindly specify Mortgage Insurance amount');
                        if Rec."Loan Product Type" = '138' then begin
                            Rec.TestField("Drawdown Schedule", true);
                            Rec.TestField("Injury Benefit Insurance", true);
                        end;
                    end;


                    if Rec."Loan Product Type" = '142' then begin
                        Rec.TestField("Land Valuation Done", true);
                        Rec.TestField("Sale Agreement", true);
                        Rec.TestField("20% Payment Slip", true);
                        Rec.TestField("Title Deed");
                    end;
                    //Repayment schedule
                    //RSchedule.RESET;
                    //RSchedule.SETRANGE(RSchedule."Loan No.","Loan No.");
                    //IF NOT RSchedule.FIND('-') THEN
                    //ERROR('Loan schedule must be generated first');

                    //
                    //Check if product allows multiple loans and if offset
                    LoanApp.Reset;
                    LoanApp.SetRange("Member No.", Rec."Member No.");
                    LoanApp.SetRange(Posted, true);
                    LoanApp.SetRange("Loan Product Type", Rec."Loan Product Type");
                    LoanApp.SetFilter("Outstanding Balance", '>0');
                    if LoanApp.Find('-') then begin
                        repeat
                            if ProdFac.Get(Rec."Loan Product Type") then begin
                                if ProdFac."Allow Multiple Running Loans" = false then begin
                                    LoansTopup.Reset;
                                    LoansTopup.SetRange("Loan Top Up", LoanApp."Loan No.");
                                    LoansTopup.SetRange("Loan No.", Rec."Loan No.");
                                    if not LoansTopup.Find('-') then
                                        Error('Member already has an existing Loan %1 of same product', LoanApp."Loan No.");
                                end;
                            end;
                        until LoanApp.Next = 0;
                    end;
                    GenSetup.Get;
                    //Confirm amounts
                    LoansTopup.Reset;
                    LoansTopup.SetRange(LoansTopup."Loan No.", Rec."Loan No.");
                    if LoansTopup.Find('-') then begin
                        LoansTopup.CalcSums(LoansTopup."Total Top Up");
                        TotalOffset := LoansTopup."Total Top Up";
                    end;

                    LoanApp.Reset;
                    LoanApp.SetRange("Member No.", Rec."Member No.");
                    LoanApp.SetFilter("Outstanding Balance", '>0');
                    LoanApp.SetFilter("Loans Category-SASRA", '%1..%2', GenSetup."Allowed Loan Categories", LoanApp."Loans Category-SASRA"::Loss);
                    if LoanApp.Find('-') then begin
                        repeat
                            if GenSetup."Allowed Loan Categories" <> LoanApp."Loans Category-SASRA"::Loss then begin
                                LoansTopup.Reset;
                                LoansTopup.SetRange("Loan Top Up", LoanApp."Loan No.");
                                if not LoansTopup.Find('-') then begin
                                    Error('Member has a loan that is not performing %1', LoanApp."Loan No.");
                                end;
                            end;
                        until LoanApp.Next = 0;
                    end;

                    ExternalComm.Reset;
                    ExternalComm.SetRange(ExternalComm."Loan No.", Rec."Loan No.");
                    if ExternalComm.Find('-') then begin
                        ExternalComm.CalcSums(ExternalComm.Amount);
                        TotalOffset := TotalOffset + ExternalComm.Amount;
                    end;

                    if TotalOffset >= Rec."Approved Amount" then
                        Error(Text002, TotalOffset, Rec."Approved Amount");

                    TotalAssetFin := 0;
                    AssetFinanceLoan.Reset;
                    AssetFinanceLoan.SetRange(AssetFinanceLoan."Loan No.", Rec."Loan No.");
                    if AssetFinanceLoan.Find('-') then begin
                        AssetFinanceLoan.CalcSums(AssetFinanceLoan.Amount);
                        TotalAssetFin := TotalAssetFin + AssetFinanceLoan.Amount;
                    end;

                    if TotalAssetFin >= Rec."Approved Amount" then
                        Error(Text014, TotalAssetFin, Rec."Approved Amount");



                    //ConfirmReyments
                    LoanRepay := 0;
                    PaymentMethods.Reset;
                    PaymentMethods.SetRange(PaymentMethods."Loan No.", Rec."Loan No.");
                    PaymentMethods.SetRange(PaymentMethods."Member No.", Rec."Member No.");
                    if PaymentMethods.Find('-') then begin
                        repeat
                            LoanRepay := LoanRepay + PaymentMethods.Amount;
                        until PaymentMethods.Next = 0;
                    end;
                    if LoanRepay <> 0 then begin
                        if LoanRepay <> Rec.Repayment then
                            Error(ErrMssage);
                    end;
                    //

                    Members.Get(Rec."Member No.");
                    if Members.Status <> Members.Status::Active then
                        Error("InactiveErr:");


                    if Rec."Self Guarantee" = false then begin
                        if ProdFac.Get(Rec."Loan Product Type") then begin
                            if (ProdFac."Max Amt on Guarantors" <> 0) or (ProdFac."Minimum Guarantors" <> 0) then begin
                                LoanGua.Reset;
                                LoanGua.SetRange(LoanGua."Loan No", Rec."Loan No.");
                                if LoanGua.Find('-') then begin
                                    repeat
                                        if Members.Get(LoanGua."Member No") then begin
                                            if ProdFac.Get(Rec."Loan Product Type") then begin
                                                if (ProdFac."Max Amt on Guarantors" <> 0) and (ProdFac."Minimum Guarantors on Max Amt" = 0) then
                                                    Error(Text007);
                                                if (ProdFac."Max Amt on Guarantors" = 0) and (ProdFac."Minimum Guarantors on Max Amt" <> 0) then
                                                    Error(Text007);
                                                if (Rec."Approved Amount" > ProdFac."Max Amt on Guarantors") and (LoanGua.Count < (ProdFac."Minimum Guarantors on Max Amt")) then
                                                    Error(Text008, ProdFac."Minimum Guarantors on Max Amt", ProdFac."Max Amt on Guarantors");
                                                if LoanGua.Count < ProdFac."Minimum Guarantors" then
                                                    Error(Text006, ProdFac."Minimum Guarantors");
                                            end;
                                            LoanGua.CalcSums("Amount Guaranteed");
                                            GenSetup.Get;
                                            if GenSetup."Self Deposits(As Guarantor)" = true then begin
                                                SavAcc.Reset;
                                                SavAcc.SetRange(SavAcc."Member No.", Rec."Member No.");
                                                SavAcc.SetRange(SavAcc."Product Category", SavAcc."Product Category"::"Deposit Contribution");
                                                if SavAcc.Find('-') then
                                                    SavAcc.CalcFields(SavAcc."Balance (LCY)");
                                                if LoanGua."Amount Guaranteed" + SavAcc."Balance (LCY)" < Rec."Approved Amount" then
                                                    Error(Text005);

                                            end else
                                                if LoanGua."Total Sum" < Rec."Approved Amount" then
                                                    Error(Text005);

                                            //SendSMS.SendSms(SourceType::"Loan Guarantors",Members."Mobile Phone No",'Your have guaranteed  '+"Member Name"+''+"Loan Product Type Name"+' Loan of ' +FORMAT("Approved Amount")+
                                            //'. If in dispute call'+' '+CompInfo."Phone No.","Loan No.","Disbursement Account No",FALSE);
                                        end;
                                    until LoanGua.Next = 0;
                                end else
                                    Error(Text006, ProdFac."Minimum Guarantors");
                            end;
                        end;
                    end;
                    Members.Get(Rec."Member No.");
                    SegmentCountyDividendSignat.Reset;
                    SegmentCountyDividendSignat.SetRange(Type, SegmentCountyDividendSignat.Type::Segment);
                    SegmentCountyDividendSignat.SetRange(Code, Members."Member Segment");
                    if SegmentCountyDividendSignat.Find('-') then begin
                        //MESSAGE('WACHANA %1',Members."Member Segment");
                        if SegmentCountyDividendSignat.Code = 'UNCHECKOFF' then begin
                            MemberCategory.Reset;
                            MemberCategory.SetRange("No.", Members."Member Category");
                            if MemberCategory.FindFirst then begin
                                //Share Capital
                                SavAcc.Reset;
                                SavAcc.SetRange("Member No.", Rec."Member No.");
                                SavAcc.SetRange("Product Category", SavAcc."Product Category"::"Share Capital");
                                if SavAcc.Find('-') then begin
                                    SavAcc.CalcFields("Balance (LCY)");
                                    if (SavAcc."Balance (LCY)" + Rec."Share Boosted Amount") < MemberCategory."Share Capital" then
                                        Error('Share capital less than Kes %1', MemberCategory."Share Capital");
                                end;
                            end;
                        end;
                    end;

                    if Rec."Recovery Mode" = Rec."Recovery Mode"::"External STO" then begin
                        Rec.TestField("Client Bank Code");
                        Rec.TestField("Client Account No");
                        Rec.TestField("External STO Effective Date");
                    end;
                    CompInfo.Get;
                    VarVariant := Rec;
                    if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovals.OnSendDocForApproval(VarVariant);

                end;
            }
            action(CancelApprovalRequest)
            {
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action("Re-Open Deferred  Loan")
            {

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Deffered);
                    if (Rec.Status = Rec.Status::Deffered) or (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) then begin
                        if Confirm('Are you sure you want to re-open the loan?', false) = true then begin
                            Rec.Status := Rec.Status::Open;
                            Rec.Modify;
                        end;
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
            separator(Action67)
            {
            }
            action(Statement)
            {
                Image = Customer;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    CustMembr.Reset;
                    CustMembr.SetRange(CustMembr."No.", Rec."Member No.");
                    //if CustMembr.Find('-') then
                    //REPORT.Run(52185621, true, false, CustMembr);
                end;
            }
            action(Approves)
            {
                Visible = false;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify;
                end;
            }
            action("Download Appraisal Used")
            {
                Image = Note;
                Promoted = true;
                Visible = AppraisalFile;

                trigger OnAction()
                var
                    FromFile: Text[400];
                    ToFolder: Text[300];
                    Name: Text;
                    EDMS: Record EDMS;
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
            group(Posting)
            {
            }
            action("Post Loan")
            {
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                Visible = PostLoan;

                trigger OnAction()
                begin
                    ProdFac.Get(Rec."Loan Product Type");
                    if ProdFac."Shamba Loan" = true then begin
                        Rec.TestField("Land Valuation Done", true);
                        Rec.TestField("Sale Agreement", true);
                        Rec.TestField("20% Payment Slip", true);
                        Rec.TestField("Title Deed");
                    end;


                    Rec.TestField("Recovery Mode");
                    UserSetup1.Reset;
                    UserSetup1.SetRange("User ID", UserId);
                    UserSetup1.SetRange("Credit FOSA Account", true);
                    if not UserSetup1.Find('-') then Error('Yo do not have permissions to run this process kindly contact your system administrator');
                    Rec.TestField(Posted, false);
                    Rec.TestField(Status, Rec.Status::Approved);
                    if Confirm('Do You want to post this loan of Member No' + '...' + Rec."Member No." + '...' + 'Loan No' + '...' + Rec."Loan No.") then begin
                        //Posting.PostLoanNormal();

                        Posting.PostLoanNormal(Rec."Loan No.");
                        //Send SMS when Topup

                        LoansTopup.Reset;
                        LoansTopup.SetRange(LoansTopup."Loan No.", Rec."Loan No.");
                        if LoansTopup.FindFirst then begin
                            repeat
                                LoanGuar.Reset;
                                LoanGuar.SetRange("Loan No", LoansTopup."Loan Top Up");
                                LoanGuar.SetRange("Self Guarantee", false);
                                if LoanGuar.FindFirst then begin
                                    if Loans2.Get(LoanGuar."Loan No") then begin
                                        ProductType := Loans2."Loan Product Type Name";
                                        AppAmount := Loans2."Approved Amount";
                                    end;
                                    repeat
                                        if Members.Get(LoanGuar."Member No") then
                                            CompInfo.Get;
                                        SendSMS.SendSms(SourceType::"Loan Guarantors", Members."Mobile Phone No",
                                        'Dear ' + LoanGuar.Name + ', The ' + ProductType + ' of Ksh. ' + Format(AppAmount) + ', you had guaranteed ' + LoanGuar."Loanee Name" + ' is now fully repaid.',
                                        Loans2."Loan No.", Loans2."Disbursement Account No", false);

                                    until LoanGuar.Next = 0;
                                end;
                            until LoansTopup.Next = 0;
                        end;



                        //Set FOSA Savings Account to Frozen

                        LoanGuar.Reset;
                        LoanGuar.SetRange(LoanGuar."Loan No", Rec."Loan No.");
                        LoanGuar.SetFilter("Guarantor Type", '%1', LoanGuar."Guarantor Type"::Collateral);
                        if LoanGuar.FindFirst then
                            SavingsAccounts.Reset;
                        SavingsAccounts.SetRange("Member No.", LoanGuar."Savings Account No./Member No.");
                        SavingsAccounts.SetRange("Loan Disbursement Account", true);
                        if SavingsAccounts.FindFirst then begin
                            SavingsAccounts.Status := SavingsAccounts.Status::Frozen;
                            SavingsAccounts."Status Change Reason" := 'FROZEN: Refer to Investment Manager';
                            SavingsAccounts.Modify;
                        end;

                    end;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        StatusControl;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        StatusControl;

        if ProdFac.Get(Rec."Loan Product Type") then begin
            if ProdFac."Mortgage Loan" = true then
                IfMortgage := true
            else
                IfMortgage := false
        end;

        if ProdFac.Get(Rec."Loan Product Type") then begin
            if ProdFac."Mortgage Loan" = true then begin
                Members.Get(Rec."Member No.");
                if Members."Employer Code" = '99' then
                    CheckRetirementDate := true
                else
                    CheckRetirementDate := false
            end;
        end;

        if ProdFac.Get(Rec."Loan Product Type") then begin
            if ProdFac."Mortgage Loan" = true then
                IsMortgageLoan := true
            else
                IsMortgageLoan := false;
            if Rec."Loan Product Type" = '138' then
                IfJenga := true
            else
                IfJenga := false;

        end;
    end;

    trigger OnClosePage()
    begin
        Rec."Discounted Amount" := 0;
        Rec.Modify;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        StatusControl
    end;

    trigger OnOpenPage()
    begin
        StatusControl;
        if UserSetup.Get(Rec."Captured By") then begin
            Rec."Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
            Rec."Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
            Rec."Responsibility Center" := UserSetup."Responsibility Centre";
            Rec.Modify;
        end;

        if ProdFac.Get(Rec."Loan Product Type") then begin
            if ProdFac."Mortgage Loan" = true then
                IfMortgage := true
            else
                IfMortgage := false;
            if Rec."Loan Product Type" = '138' then
                IfJenga := true
            else
                IfJenga := false;
        end;

        if ProdFac.Get(Rec."Loan Product Type") then begin
            if ProdFac."Mortgage Loan" = true then begin
                Members.Get(Rec."Member No.");
                if Members."Employer Code" = '99' then
                    CheckRetirementDate := true
                else
                    CheckRetirementDate := false
            end;
        end;
        if ProdFac.Get(Rec."Loan Product Type") then begin
            if ProdFac."Mortgage Loan" = true then
                IsMortgageLoan := true
            else
                IsMortgageLoan := false;

        end;

        if ProdFac.Get(Rec."Loan Product Type") then begin
            if ProdFac."Shamba Loan" = true then
                IsShambaLoan := true
            else
                IsShambaLoan := false;
        end;
    end;

    var
        Text001: Label 'Status Must Be Open';
        adj: Integer;
        pinst: Integer;
        HRDates: Codeunit "HR Dates 2";
        ClientAgeValue: Integer;
        ClientAgePart: Text;
        ClientAge: Text;
        ProdMinAgeText: Text;
        ProdMinAge: Integer;
        RetirementDate: Date;
        Mem: Record Members;
        UserSetup: Record "User Setup";
        CustMembr: Record Members;
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
        AmtErr: Label 'Total  partial disbursement Amount PLUS current amount to diburse must be equal to approved amount';
        AppraisalDetailsSetup: Record "Appraisal Salary Set-up";
        AppraisalSalDetails: Record "Appraisal Salary Details";
        LReq: Record "Loan Mandatory Requirements";
        LoanGua: Record "Loan Guarantors and Security";
        Coll: Record "Loan Collateral";
        Found: Boolean;
        SecErr: Label 'You have not provided neither collateral nor guarantors';
        SavAcc: Record "Savings Accounts";
        DepErr: Label 'This member does not have a deposit account';
        SalErr: Label 'Salary information is expected';
        ApplDocs: Record "Product Documents";
        LoanReqDocs: Record "Loan Required Documents";
        BusinessIncome: Record "Business Income";
        SendSMS: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        Members: Record Members;
        LoansTopup: Record "Loans Top up";
        ExternalComm: Record "Other Commitements Clearance";
        TotalOffset: Decimal;
        Text002: Label 'Total offset of %1 is more than approved amount of %2';
        ProdFac: Record "Product Factory";
        Text003: Label 'Loan Account is invalid';
        Vend: Record Vendor;
        GLAcc: Record "G/L Account";
        Text004: Label 'The fund is already exhausted';
        PaymentMethods: Record "Payment Methods";
        LoanRepay: Decimal;
        ErrMssage: Label 'Repayment distribution is not equal to the loan repayment amount';
        Text005: Label 'Amount guaranteed is less than approved amount';
        Text006: Label 'Minimum number of guarantors not provided. They should be at least %1';
        Text007: Label 'Both Minimum Guarantors on Max Amt and Max Amt on Guarantors must be defined';
        Text008: Label 'The number of guarantors expected is less than the expected number of %1 where amount is more than %2';
        "InactiveErr:": Label 'This member is not active thus cannot qualify for a loan';
        RepMethods: Record "Payment Methods";
        CompInfo: Record "Company Information";
        Text009: Label 'This product requires salary details';
        EndDateSalo: Date;
        SalProc: Record "Salary Lines";
        Text010: Label 'This member does not receive salary through the sacco';
        Text011: Label 'There are documents to be provided : %1';
        BusAppr: Record "Financial Appraisal setup";
        BusApprDet: Record "Business Loan Appraisal";
        TotalLoans: Decimal;
        GenSetup: Record "General Set-Up";
        Cust: Record Customer;
        Text012: Label 'The employer code is missing';
        Text013: Label 'Standing order must be provided for this loan';
        "******************************************************Controls": Integer;
        ApplicationDetailsEdit: Boolean;
        DisbursementEdit: Boolean;
        ApprovedEdit: Boolean;
        Credit: Record "Credit Accounts";
        AssetFinanceLoan: Record "Asset Finance Loan";
        TotalAssetFin: Decimal;
        Text014: Label 'Total Asset Finance of %1 is more than approved amount of %2';
        SubSectorLevel2: Code[30];
        IfMortgage: Boolean;
        CheckRetirementDate: Boolean;
        IsMortgageLoan: Boolean;
        IfJenga: Boolean;
        ShareBoostingField: Boolean;
        ShareBoostError: Label 'This member is  Self Employed. Therefore cannot apply for share boosting';
        Text0015: Label 'This Member Does not fullfill all the conditions';
        IsShambaLoan: Boolean;
        LoanGuar: Record "Loan Guarantors and Security";
        SavingsAccounts: Record "Savings Accounts";
        Posting: Codeunit "Loans Process";
        Loans2: Record Loans;
        ProductType: Text;
        AppAmount: Decimal;
        UseBatch: Boolean;
        UserSetup1: Record "User Setup";
        AppliedAmountEdit: Boolean;
        SADVisible: Boolean;
        StandingOrderHeader: Record "Standing Order Header";
        StandingOrderLines: Record "Standing Order Lines";
        FoundOne: Boolean;
        LoanApprove: Boolean;
        AppraisalFile: Boolean;
        PostLoan: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    local procedure ValidateReq()
    begin
        if ProdFac.Get(Rec."Loan Product Type") then begin
            if CopyStr(ProdFac."Account No. Prefix", 1, 2) <> CopyStr(Rec."Loan Account", 1, 2) then
                Error(Text003);
        end;


        //Required documents
        LoanReqDocs.Reset;
        LoanReqDocs.SetRange("Loan No.", Rec."Loan No.");
        if LoanReqDocs.Find('-') then begin
            repeat
                if (LoanReqDocs."Provided ?" = LoanReqDocs."Provided ?"::" ") or (LoanReqDocs."Provided ?" = LoanReqDocs."Provided ?"::No) then
                    Error(Text011, LoanReqDocs.Description);
            until LoanReqDocs.Next = 0;
        end;

        //Check if external funds and confirm if funds are available
        if ProdFac."Source of Funds" = ProdFac."Source of Funds"::"External Fund" then begin
            ProdFac.TestField("Source Of Funds No.");
            if Vend.Get(ProdFac."Source Of Funds No.") then begin
                Vend.CalcFields("Balance (LCY)");
                if GLAcc.Get(ProdFac."Loan  Account [G/L]") then begin
                    GLAcc.CalcFields(Balance);
                end;

                if (GLAcc.Balance + Rec."Approved Amount") > Vend."Balance (LCY)" then
                    Error(Text004);

            end;
        end;
        LReq.Reset;
        LReq.SetRange(LReq."Loan No.", Rec."Loan No.");
        if LReq.Find('-') then begin
            case LReq."Mandatory Requirement" of

                LReq."Mandatory Requirement"::"Business Income":
                    begin

                    end;
                LReq."Mandatory Requirement"::"Collateral or Guarantors":
                    begin
                        Found := false;
                        LoanGua.Reset;
                        LoanGua.SetRange(LoanGua."Loan No", Rec."Loan No.");
                        if LoanGua.Find('-') then
                            Found := true;

                        Coll.Reset;
                        Coll.SetRange(Coll."Loan No.", Rec."Loan No.");
                        if Coll.Find('-') then
                            Found := true;

                        if Found = false then
                            Error(SecErr);

                    end;
                LReq."Mandatory Requirement"::"Member Deposits":
                    begin
                        SavAcc.Reset;
                        SavAcc.SetRange(SavAcc."Product Category", SavAcc."Product Category"::"Deposit Contribution");
                        SavAcc.SetRange(SavAcc."Member No.", Rec."Member No.");
                        if not SavAcc.Find('-') then begin
                            Error(DepErr);
                        end;

                    end;
                LReq."Mandatory Requirement"::Salary:
                    begin
                        AppraisalSalDetails.Reset;
                        AppraisalSalDetails.SetRange(AppraisalSalDetails."Client Code", Rec."Member No.");
                        if AppraisalSalDetails.Find('-') then begin
                            AppraisalSalDetails.CalcSums(AppraisalSalDetails.Amount);
                            if AppraisalSalDetails.Amount = 0 then
                                Error(SalErr);
                        end else
                            Error(SalErr);

                    end;
            end;
        end;
    end;

    //[Scope('Internal')]
    procedure StatusControl()
    begin
        if Rec.Posted then AppraisalFile := true;
        case Rec.Status of
            Rec.Status::Open:
                begin
                    ApplicationDetailsEdit := true;
                    DisbursementEdit := true;
                    ApprovedEdit := false;
                    AppliedAmountEdit := true;
                end;

            Rec.Status::Pending:
                begin
                    ApplicationDetailsEdit := false;
                    DisbursementEdit := false;
                    AppliedAmountEdit := false;
                    LoanApprove := true;

                end;
            Rec.Status::Rejected:
                begin
                    ApplicationDetailsEdit := false;
                    DisbursementEdit := false;
                    AppliedAmountEdit := false;
                end;
            Rec.Status::Approved:
                begin
                    ApprovedEdit := true;
                    ApplicationDetailsEdit := false;
                    DisbursementEdit := false;
                    AppliedAmountEdit := false;
                    PostLoan := true;
                end;
        end;
        if Rec."Mode of Disbursement" = Rec."Mode of Disbursement"::"Partial Disbursement" then
            UseBatch := true else
            UseBatch := false;

        if Rec."Member No." <> '' then begin
            if Members.Get(Rec."Member No.") then
                if Members."Employer Code" = '05' then
                    SADVisible := true;
        end;
    end;

    local procedure "CheckDisbursementA/CBalance"(Account: Code[30])
    var
        cashierTransactions: Record "Cashier Transactions";
        lienAmount: Decimal;
        saccoAccount: Record "Savings Accounts";
        Accounttypes: Record "Product Factory";
        MiniBalance: Decimal;
        AccountBal: Decimal;
    begin
        GenSetup.Get;
        saccoAccount.Reset;
        saccoAccount.SetRange(saccoAccount."No.", Account);
        saccoAccount.SetRange(saccoAccount."Product Type", '505');
        if saccoAccount.Find('-') then begin
            Accounttypes.Reset;
            Accounttypes.SetRange(Accounttypes."Product ID", saccoAccount."Product Type");
            if Accounttypes.Find('-') then begin
                MiniBalance := Accounttypes."Minimum Balance";
            end;
            saccoAccount.CalcFields(saccoAccount."Balance (LCY)");
            saccoAccount.CalcFields(saccoAccount."ATM Transactions");
            saccoAccount.CalcFields(saccoAccount."Uncleared Cheques");


            cashierTransactions.Reset;
            cashierTransactions.SetRange("Account No", saccoAccount."No.");
            cashierTransactions.SetRange(Posted, true);
            cashierTransactions.SetRange(Type, cashierTransactions.Type::Lien);
            cashierTransactions.SetRange("Cheque Status", cashierTransactions."Cheque Status"::Pending);
            if cashierTransactions.Find('-') then begin
                repeat
                    lienAmount += cashierTransactions.Amount;
                until cashierTransactions.Next = 0;
            end;





            AccountBal := saccoAccount."Balance (LCY)" - (saccoAccount."ATM Transactions" + saccoAccount."Uncleared Cheques" + MiniBalance + lienAmount);

            if AccountBal < GenSetup."Mortgage FOSA Min Balance" then Error('Account No %1 balance must be over %2', Rec."Disbursement Account No", GenSetup."Mortgage FOSA Min Balance");
        end
    end;

    local procedure CreateAppraisalBackup(LoanNumber: Code[40]; ReportNumber: Integer)
    var
        Loans: Record Loans;
        EDMS: Record EDMS;
        url: Text;
        FilePath: Text;
    begin
        Loans.Reset;
        Loans.SetRange("Loan No.", LoanNumber);
        if Loans.FindFirst then begin
            EDMS.Reset;
            EDMS.SetRange(Key, EDMS.Key::"Appraisal File");
            if EDMS.FindFirst then begin
                url := EDMS."url path";
                FilePath := url + 'appraisal' + Loans."Member No." + Loans."Loan No." + '.pdf';
                if (Loans.Status = Loans.Status::Open) or (Loans.Status = Loans.Status::Pending) then begin
                    // if Exists(FilePath) then Erase(FilePath);
                    // REPORT.SaveAsPdf(ReportNumber, FilePath, Loans);
                end;
            end;
        end;
    end;
}

