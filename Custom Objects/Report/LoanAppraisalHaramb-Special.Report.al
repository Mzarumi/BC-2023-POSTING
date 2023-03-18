// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185747 "Loan Appraisal Haramb-Special"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Loan Appraisal Haramb-Special.rdlc';

//     dataset
//     {
//         dataitem(Loans; Loans)
//         {
//             RequestFilterFields = "Loan No.";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(CName; Company.Name)
//             {
//             }
//             column(CAdress; Company.Address)
//             {
//             }
//             column(CPicture; Company.Picture)
//             {
//             }
//             column(LoanNo; Loans."Loan No.")
//             {
//             }
//             column(MemberNo; Loans."Member No.")
//             {
//             }
//             column(MemberName; Loans."Member Name")
//             {
//             }
//             column(LoanProduct; Loans."Loan Product Type")
//             {
//             }
//             column(LoanProductName; Loans."Loan Product Type Name")
//             {
//             }
//             column(ApplicationDate; Loans."Application Date")
//             {
//             }
//             column(LoanRequestedAmount; Loans."Requested Amount")
//             {
//             }
//             column(TotalProcessingAmt; TotalProcessingAmt)
//             {
//             }
//             column(Installment; Loans.Installments)
//             {
//             }
//             column(LoanRepayment; Loans.Repayment)
//             {
//             }
//             column(CapturedBy_Loans; Loans."Captured By")
//             {
//             }
//             column(ApplicationDate_Loans; Loans."Application Date")
//             {
//             }
//             column(ApprovalDate_Loans; Loans."Approval Date")
//             {
//             }
//             column(LoanAppraisedBy_Loans; Loans."Loan Appraised By")
//             {
//             }
//             column(DisbursementDate_Loans; Loans."Disbursement Date")
//             {
//             }
//             column(RepReq; RepBasedOnRequested)
//             {
//             }
//             column(IntReq; IntBasedOnRequested)
//             {
//             }
//             column(AverageInt; AvInterest)
//             {
//             }
//             column(RecommendedAmt; Loans."Recommended Amount")
//             {
//             }
//             column(StaffNo; Loans."Staff No")
//             {
//             }
//             column(MemberDeposits; MemberDeposits)
//             {
//             }
//             column(DepPurchaseCommExc; DepPurchaseCommExc)
//             {
//             }
//             column(DepPurchaseComm; DepPurchaseComm)
//             {
//             }
//             column(DepositPurchase; Loans."Loans - Deposit Purchase")
//             {
//             }
//             column(TotalLoanBal; TotalLoanBal)
//             {
//             }
//             column(CountNo; CountNo)
//             {
//             }
//             column(LoanRecoverd; LoanRecoverd)
//             {
//             }
//             column(MemberDueRetire; MemberDueRetire)
//             {
//             }
//             column(GuarantorMax; GuarantorMax)
//             {
//             }
//             column(SecurityRisk; SecurityRisk)
//             {
//             }
//             column(ReapplicationPeriod; ReapplicationPeriod)
//             {
//             }
//             column(LoanDepositRation; LoanDepositRation)
//             {
//             }
//             column(TotalBasic; TBasic)
//             {
//             }
//             column(TotalEarning; TEarning)
//             {
//             }
//             column(TotalAllowance; TAllowance)
//             {
//             }
//             column(TotalDeductions; TDeductions)
//             {
//             }
//             column(NetSalary; NetSalary)
//             {
//             }
//             column(AdjNet; AdjustedNet)
//             {
//             }
//             column(NetOnSalary; NetOnSalary)
//             {
//             }
//             column(NetOnDeposits; NetOnDeposits)
//             {
//             }
//             column(ExternalRecovered; TotalExteralRec)
//             {
//             }
//             column(ExternalCharges2; ExternalCharges2)
//             {
//             }
//             column(ExerciseDuty; ExerciseDuty)
//             {
//             }
//             column(TopupRepayments; TopupRepayments)
//             {
//             }
//             column(NewRep; NewRepayment)
//             {
//             }
//             column(Dim1; Dimension1)
//             {
//             }
//             column(Dim2; Dimension2)
//             {
//             }
//             column(Mult; Mult)
//             {
//             }
//             column(DepositMult; Deposit_Multiplier)
//             {
//             }
//             column(SalProcessed; SalProcessed)
//             {
//             }
//             column(SelfGua; Loans."Self Guarantee")
//             {
//             }
//             column(CurrBal; CurrLoanBal)
//             {
//             }
//             column(RelatedBal; RelatedBal)
//             {
//             }
//             column(TakeHome; NetTakeHome)
//             {
//             }
//             column(OffsetTotal; OffsetBalance)
//             {
//             }
//             column(MaxDeposit; ProductFactory."Maximum Deposit Contribution")
//             {
//             }
//             column(MonthlyContr; SavAcc."Monthly Contribution")
//             {
//             }
//             column(DirectorWarning; DirectorWarning)
//             {
//             }
//             column(TwoThird; Twothird)
//             {
//             }
//             column(TopUpComms; TopUpComms)
//             {
//             }
//             column(Discmt; DiscAmt)
//             {
//             }
//             column(TExternalEffects; TExternalEffects)
//             {
//             }
//             column(Inactive; Inactive)
//             {
//             }
//             column(ShareBoost; Loans."Share Boosted Amount")
//             {
//             }
//             column(DiffSec; DifferenceSec)
//             {
//             }
//             column(ExternalCharges; ExternalCharges)
//             {
//             }
//             column(OtherCharges; Loans."Total Charges and Commissions")
//             {
//             }
//             column(AthirdDisplay; AthirdDisplay)
//             {
//             }
//             column(AthirdAmt; AthirdAmt)
//             {
//             }
//             column(SalNotThroughSacco; SalNotThroughSacco)
//             {
//             }
//             column(PossibleBoost; PossibleBoost)
//             {
//             }
//             column(GrossAmount; GrossAmount)
//             {
//             }
//             dataitem(AllLoans; Loans)
//             {
//                 DataItemLink = "Member No." = field("Member No.");
//                 DataItemTableView = where(Posted = const(Yes), "Outstanding Balance" = filter(> 0));
//                 column(ReportForNavId_18; 18)
//                 {
//                 }
//                 column(LoansLoanNo; AllLoans."Loan No.")
//                 {
//                 }
//                 column(LoansProductType; AllLoans."Loan Product Type")
//                 {
//                 }
//                 column(LoansProductName; AllLoans."Loan Product Type Name")
//                 {
//                 }
//                 column(ApprovedAmount; AllLoans."Approved Amount")
//                 {
//                 }
//                 column(PrincipalRepayment; AllLoans."Loan Principle Repayment")
//                 {
//                 }
//                 column(OutstandingInterest; AllLoans."Outstanding Interest")
//                 {
//                 }
//                 column(OutStandingBalance; AllLoans."Outstanding Balance")
//                 {
//                 }
//                 column(Defaulted; AllLoans.Defaulted)
//                 {
//                 }
//                 column(RemPeriod; RemPeriod)
//                 {
//                 }
//                 column(Repayment; AllLoans.Repayment)
//                 {
//                 }
//                 column(LoansProductTyp; LoansProductTyp)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin

//                     CredLedEntry.Reset;
//                     CredLedEntry.SetRange("Loan No", Loans."Loan No.");
//                     CredLedEntry.SetFilter("Transaction Type", '%1|%2', CredLedEntry."transaction type"::"Interest Paid", CredLedEntry."transaction type"::Repayment);
//                     if CredLedEntry.Find('-') then begin
//                         CredLedEntry.CalcSums(Amount);
//                         RemPeriod := ROUND((((AllLoans.Repayment * AllLoans.Installments) - CredLedEntry.Amount) / AllLoans.Repayment), 0.0, '>');
//                     end else
//                         RemPeriod := AllLoans.Installments;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     if LoansTopup.Get(AllLoans."Loan No.") then
//                         CurrReport.Skip;
//                     LoansProductTyp := '';
//                     LoansProductTyp := AllLoans."Loan Product Type" + ' : ' + AllLoans."Loan Product Type Name";
//                 end;
//             }
//             dataitem(52185739;52185739)
//             {
//                 DataItemLink = "Loan No" = field("Loan No.");
//                 column(ReportForNavId_14; 14)
//                 {
//                 }
//                 column(AccountNo; "Loan Guarantors and Security"."Savings Account No./Member No.")
//                 {
//                 }
//                 column(GuarantorName; "Loan Guarantors and Security".Name)
//                 {
//                 }
//                 column(PayrollNo; "Loan Guarantors and Security"."Staff/Payroll No.")
//                 {
//                 }
//                 column(LoanBalance; "Loan Guarantors and Security"."Loan Balance")
//                 {
//                 }
//                 column(Deposits; "Loan Guarantors and Security"."Deposits/Shares")
//                 {
//                 }
//                 column(NoOfLoanGuranteed; "Loan Guarantors and Security"."No Of Loans Guaranteed")
//                 {
//                 }
//                 column(GuarantorType; "Loan Guarantors and Security"."Guarantor Type")
//                 {
//                 }
//                 column(GuarantBal; GuarLoanBal)
//                 {
//                 }
//                 column(AmtGuaranteed; "Loan Guarantors and Security"."Amount Guaranteed")
//                 {
//                 }
//                 column(CollateralValue; "Loan Guarantors and Security"."Collateral Value")
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 var
//                     LoanGua: Record 52185739;
//                     LoanApp: Record 52185729;
//                 begin

//                     LoanGua.Reset;
//                     LoanGua.SetRange("Loan No", "Loan No");
//                     LoanGua.SetRange("Guarantor Type", LoanGua."guarantor type"::Guarantor);
//                     if LoanGua.Find('-') then
//                         CountNo := LoanGua.Count;



//                     /*DifferenceSec:=0;
//                     "Loan Guarantors and Security".CALCSUMS("Loan Guarantors and Security"."Amount Guaranteed");
//                     SavAcc.RESET;
//                     SavAcc.SETRANGE(SavAcc."Member No.",Loans."Member No.");
//                     SavAcc.SETRANGE(SavAcc."Product Category",SavAcc."Product Category"::"Deposit Contribution");
//                     IF SavAcc.FIND('-') THEN
//                       SavAcc.CALCFIELDS(SavAcc."Balance (LCY)");
                    
//                     SecurityTotal:="Loan Guarantors and Security"."Amount Guaranteed"+SavAcc."Balance (LCY)";
//                     */
//                     if ProductFactory.Get(Loans."Loan Product Type") then
//                         if CountNo < ProductFactory."Minimum Guarantors" then
//                             GuarantorMax := true;

//                     if (Loans."Approved Amount" > ProductFactory."Max Amt on Guarantors") and (CountNo < (ProductFactory."Minimum Guarantors on Max Amt")) then
//                         GuarantorMax := true;


//                     //MESSAGE('GuaMax %1 Guar %2 Setup Guar %3',GuarantorMax,CountNo,ProductFactory."Minimum Guarantors");
//                     //SecurityTotal:=SecurityTotal+"Loan Guarantors and Security"."Amount Guaranteed";
//                     /*IF SecurityTotal<Loans."Requested Amount" THEN BEGIN
//                       SecurityRisk:=TRUE;
//                       DifferenceSec:=Loans."Requested Amount"-SecurityTotal;
//                       MESSAGE(FORMAT(DifferenceSec));
//                     END;*/
//                     GuarLoanBal := 0;

//                     LoanApp.Reset;
//                     LoanApp.SetRange("Member No.", "Member No");
//                     LoanApp.SetFilter("Outstanding Balance", '>0');
//                     if LoanApp.Find('-') then begin
//                         repeat
//                             LoanApp.CalcFields("Outstanding Balance");
//                             GuarLoanBal := GuarLoanBal + LoanApp."Outstanding Balance";
//                         until LoanApp.Next = 0;
//                     end;
//                     CountAll := CountAll + 1;

//                 end;
//             }
//             dataitem(52185728;52185728)
//             {
//                 DataItemLink = "Loan No." = field("Loan No.");
//                 column(ReportForNavId_36; 36)
//                 {
//                 }
//                 column(DocumentType; "Loan Required Documents"."Document Type")
//                 {
//                 }
//                 column(DocumentNo; "Loan Required Documents"."Document No.")
//                 {
//                 }
//                 column(Description; "Loan Required Documents".Description)
//                 {
//                 }
//                 column(SingleMultiple; "Loan Required Documents"."Single Party/Multiple")
//                 {
//                 }
//                 column(Provided; "Loan Required Documents"."Provided ?")
//                 {
//                 }
//                 column(LicenseExpiryDate; "Loan Required Documents"."License Expiry Date")
//                 {
//                 }
//             }
//             dataitem(52185742;52185742)
//             {
//                 DataItemLink = "Loan No." = field("Loan No."), "Client Code" = field("Member No.");
//                 column(ReportForNavId_97; 97)
//                 {
//                 }
//                 column(LoanNo_LoansTopup; "Loans Top up"."Loan No.")
//                 {
//                 }
//                 column(LoanTopUp_LoansTopup; "Loans Top up"."Loan Top Up")
//                 {
//                 }
//                 column(ClientCode_LoansTopup; "Loans Top up"."Client Code")
//                 {
//                 }
//                 column(LoanType_LoansTopup; "Loans Top up"."Loan Type")
//                 {
//                 }
//                 column(PrincipleTopUp_LoansTopup; "Loans Top up"."Principle Top Up")
//                 {
//                 }
//                 column(InterestTopUp_LoansTopup; "Loans Top up"."Interest Top Up")
//                 {
//                 }
//                 column(TotalTopUp_LoansTopup; "Loans Top up"."Total Top Up")
//                 {
//                 }
//                 column(MonthlyRepayment_LoansTopup; "Loans Top up"."Monthly Repayment")
//                 {
//                 }
//                 column(InterestPaid_LoansTopup; "Loans Top up"."Interest Paid")
//                 {
//                 }
//                 column(OutstandingBalance_LoansTopup; "Loans Top up"."Outstanding Balance")
//                 {
//                 }
//                 column(IDNO_LoansTopup; "Loans Top up"."ID. NO")
//                 {
//                 }
//             }
//             dataitem(52185743;52185743)
//             {
//                 DataItemLink = "Loan No." = field("Loan No.");
//                 column(ReportForNavId_109; 109)
//                 {
//                 }
//                 column(Description_OtherCommitementsClearance; "Other Commitements Clearance".Description)
//                 {
//                 }
//                 column(Payee_OtherCommitementsClearance; "Other Commitements Clearance".Payee)
//                 {
//                 }
//                 column(Amount_OtherCommitementsClearance; "Other Commitements Clearance".Amount)
//                 {
//                 }
//                 column(BatchNo_OtherCommitementsClearance; "Other Commitements Clearance"."Batch No.")
//                 {
//                 }
//                 column(VendorNo_OtherCommitementsClearance; "Other Commitements Clearance"."Vendor No.")
//                 {
//                 }
//                 column(VendorName_OtherCommitementsClearance; "Other Commitements Clearance"."Vendor Name")
//                 {
//                 }
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 DepPurchaseComm := 0;
//                 CountNo := 0;
//                 DifferenceSec := 0;
//                 SecurityTotal := 0;
//                 SecurityRisk := false;
//                 MemberDueRetire := false;
//                 GuarantorMax := false;
//                 LoanRecoverd := false;
//                 LoanDepositRation := false;
//                 Twothird := false;
//                 Deposit_Multiplier := 0;
//                 RelatedBal := 0;
//                 NetOnDeposits := 0;
//                 TopupRepayments := 0;
//                 AdjustedNet := 0;
//                 NetSalary := 0;
//                 TotalExteralRec := 0;
//                 NetOnSalary := 0;
//                 QualifyingAmount := 0;
//                 TDeductions := 0;
//                 TAllowance := 0;
//                 TBasic := 0;
//                 GrossAmount := 0;
//                 CountAll := 0;
//                 DiscAmt := 0;
//                 MultP := 0;
//                 AvInterest := 0;
//                 NewRepayment := 0;
//                 CurrLoanBal := 0;
//                 ChargeExtraComms := false;
//                 Dimension1 := '';
//                 Dimension2 := '';
//                 Mult := 0;
//                 NetTakeHome := 0;
//                 TExternalEffects := 0;
//                 Inactive := false;
//                 GuarLoanBal := 0;
//                 GuarantorMax := false;
//                 RepBasedOnRequested := 0;
//                 IntBasedOnRequested := 0;
//                 SelfGuaranteedBal := 0;
//                 AthirdDisplay := '';
//                 AthirdAmt := 0;
//                 ExerciseDuty := 0;
//                 DepPurchaseComm := 0;
//                 DepPurchaseCommExc := 0;
//                 PossibleBoost := 0;
//                 if Loans."Loans - Deposit Purchase" > 0 then begin
//                     PCharges.Reset;
//                     PCharges.SetRange(PCharges."Product Code", Loans."Loan Product Type");
//                     PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::Boosting);
//                     if PCharges.Find('-') then begin
//                         repeat

//                             if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") then
//                                 DepPurchaseComm := (Loans."Loans - Deposit Purchase" * (PCharges.Percentage / 100))
//                             else
//                                 if PCharges."Charge Method" = PCharges."charge method"::"Flat Amount" then
//                                     DepPurchaseComm := PCharges."Charge Amount"
//                                 else
//                                     if PCharges."Charge Method" = PCharges."charge method"::Staggered then begin

//                                         PCharges.TestField(PCharges."Staggered Charge Code");

//                                         TariffDetails.Reset;
//                                         TariffDetails.SetRange(TariffDetails.Code, PCharges."Staggered Charge Code");
//                                         if TariffDetails.Find('-') then begin
//                                             repeat
//                                                 if (Loans."Loans - Deposit Purchase" >= TariffDetails."Lower Limit") and (Loans."Loans - Deposit Purchase" <= TariffDetails."Upper Limit") then begin
//                                                     if TariffDetails."Use Percentage" = true then begin
//                                                         DepPurchaseComm := Loans."Loans - Deposit Purchase" * TariffDetails.Percentage * 0.01;
//                                                     end else begin
//                                                         DepPurchaseComm := TariffDetails."Charge Amount";
//                                                     end;
//                                                 end;
//                                             until TariffDetails.Next = 0;
//                                         end;
//                                     end;


//                             if DepPurchaseComm < PCharges.Minimum then
//                                 DepPurchaseComm := PCharges.Minimum;
//                             if DepPurchaseComm > PCharges.Maximum then
//                                 DepPurchaseComm := PCharges.Maximum;

//                             DepPurchaseComm := DepPurchaseComm * -1;

//                             if ExcemptCharges = true then
//                                 DepPurchaseComm := 0;

//                             //If excise duty involved
//                             if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
//                                 GenSetup.Get();//TESTFIELD("Excise Duty G/L");
//                                 DepPurchaseCommExc := DepPurchaseComm * GenSetup."Excise Duty (%)" * 0.01;
//                             end;
//                         until PCharges.Next = 0;

//                     end;
//                 end;
//                 SalProcessed := false;
//                 OffsetBalance := 0;
//                 if Loans."Interest Calculation Method" = Loans."interest calculation method"::Amortised then
//                     AvInterest := ((Loans.Repayment * Loans.Installments) - Loans."Requested Amount") / Loans.Installments
//                 //ELSE IF Loans."Interest Calculation Method"=Loans."Interest Calculation Method"::"Reducing Flat" THEN
//                 //  AvInterest:=ROUND(((Loans."Requested Amount"*Interest/12/100)+(LPrincipal*Interest/12/100))/2,1.0,'>')
//                 else
//                     AvInterest := Loans."Loan Interest Repayment";

//                 RepBasedOnRequested := ROUND((Loans."Interest Calculation Method" / 12 / 100) / (1 - Power((1 + (Loans.Interest / 12 / 100)), -Loans.Installments)) * Loans."Requested Amount", 1, '>');


//                 SalProc.Reset;
//                 SalProc.SetRange("Member No.", Loans."Member No.");
//                 if SalProc.Find('-') then
//                     SalProcessed := true;
//                 ProductFactory.Get(Loans."Loan Product Type");

//                 Mult := ProductFactory."Ordinary Deposits Multiplier";

//                 //Qualification on deposits
//                 MemberDeposits := 0;
//                 SavingsAccounts.Reset;
//                 SavingsAccounts.SetRange(SavingsAccounts."Member No.", Loans."Member No.");
//                 SavingsAccounts.SetRange(SavingsAccounts."Product Category", SavingsAccounts."product category"::"Deposit Contribution");
//                 if SavingsAccounts.Find('-') then begin
//                     SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
//                     MemberDeposits := SavingsAccounts."Balance (LCY)";//+Loans."Loans - Deposit Purchase";
//                 end;



//                 Loan.Reset;
//                 Loan.SetRange(Loan."Member No.", Loans."Member No.");
//                 Loan.SetRange(Loan.Posted, true);
//                 Loan.SetFilter("Outstanding Balance", '>0');
//                 Loan.SetRange("Self Guarantee", true);
//                 if Loan.Find('-') then begin
//                     repeat
//                         Loans.CalcFields("Outstanding Balance");
//                         SelfGuaranteedBal := SelfGuaranteedBal + Loans."Outstanding Balance";
//                     until Loan.Next = 0;
//                 end;
//                 //IF ProductFactory.GET(Loans."Loan Product Type") THEN
//                 //  Deposit_Multiplier:=(MemberDeposits+Loans."Loans - Deposit Purchase")*ProductFactory."Ordinary Deposits Multiplier";

//                 //  NetOnDeposits:=Deposit_Multiplier;
//                 //MESSAGE('Dep %1 Deposits Mult %2 ',Deposit_Multiplier,Loans."Loans - Deposit Purchase");

//                 //Less balances from related loans
//                 RelatedProduct.Reset;
//                 RelatedProduct.SetRange("Product Code", ProductFactory."Product ID");
//                 if RelatedProduct.Find('-') then begin
//                     repeat
//                         Loan.Reset;
//                         Loan.SetRange(Loan."Member No.", Loans."Member No.");
//                         Loan.SetRange(Loan.Posted, true);
//                         Loan.SetRange(Loan."Loan Product Type", RelatedProduct."Related Product Code");
//                         Loan.SetFilter("Outstanding Balance", '>0');
//                         if Loan.Find('-') then begin
//                             repeat
//                                 if ProductFactory.Get(Loan."Loan Product Type") then
//                                     Loan.CalcFields("Outstanding Balance");
//                                 RelatedBal := RelatedBal + Loan."Outstanding Balance";
//                             until Loan.Next = 0;
//                         end;

//                     until RelatedProduct.Next = 0;

//                     //Added Outside The loOP


//                     //Topped up loans related product
//                     LoansTopup.Reset;
//                     LoansTopup.SetRange("Loan No.", "Loan No.");
//                     if LoansTopup.Find('-') then begin
//                         repeat
//                             /* Loan.RESET;
//                              Loan.SETRANGE("Loan No.",LoansTopup."Loan Top Up");
//                              Loan.SETRANGE("Loan Product Type",RelatedProduct."Related Product Code");
//                              Loan.SETFILTER("Outstanding Balance",'>0');
//                              IF Loan.FIND('-') THEN BEGIN
//                                REPEAT*/
//                             CurrLoanBal := CurrLoanBal + LoansTopup."Monthly Repayment";
//                             TopupRepayments := TopupRepayments + Loan.Repayment;
//                             OffsetBalance := OffsetBalance + LoansTopup."Total Top Up";
//                         /* UNTIL Loan.NEXT=0;
//                        END;*/
//                         until LoansTopup.Next = 0;
//                     end;

//                 end;

//                 if ProductFactory.Get(Loans."Loan Product Type") then
//                     Deposit_Multiplier := (MemberDeposits + Loans."Loans - Deposit Purchase") * ProductFactory."Ordinary Deposits Multiplier";


//                 NetOnDeposits := Deposit_Multiplier;

//                 RelatedBal := RelatedBal - OffsetBalance;
//                 if RelatedBal < 0 then
//                     RelatedBal := 0;



//                 NetOnDeposits := NetOnDeposits - (RelatedBal + SelfGuaranteedBal);
//                 //NetOnDeposits:=RelatedBal;//-SelfGuaranteedBal;

//                 if Members.Get(Loans."Member No.") then begin
//                     Dimension1 := Members."Global Dimension 1 Code";
//                     Dimension2 := Members."Global Dimension 2 Code";
//                     if Members.Status <> Members.Status::Active then
//                         Inactive := true;
//                 end;

//                 //Business
//                 BusinessIncome.Reset;
//                 BusinessIncome.SetRange("Loan No.", Loans."Loan No.");
//                 if BusinessIncome.Find('-') then begin
//                     BusinessIncome.CalcSums("Average Amount (Internal)");
//                     NetOnSalary := BusinessIncome."Average Amount (Internal)";

//                 end;

//                 //contractual shares
//                 SavAcc.Reset;
//                 SavAcc.SetRange("Member No.", Loans."Member No.");
//                 SavAcc.SetRange("Product Category", SavAcc."product category"::"Deposit Contribution");
//                 if SavAcc.Find('-') then begin
//                     if ProductFactory."Minimum Dep. Contribution %" > 0 then begin
//                         if ProductFactory."Minimum Dep. Contribution %" * Loans."Approved Amount" * 0.01 > ProductFactory."Maximum Deposit Contribution" then
//                             NewContr := ProductFactory."Maximum Deposit Contribution"
//                         else
//                             NewContr := ProductFactory."Minimum Dep. Contribution %" * Loans."Approved Amount" * 0.01;
//                     end;
//                 end;

//                 //MESSAGE('Curr Contr %1 New Contr %2 Prod fact %3',SavAcc."Monthly Contribution",NewContr,ProductFactory."Minimum Dep. Contribution %");
//                 //Difference
//                 if NewContr < ProductFactory."Minimum Deposit Contribution" then
//                     NewContr := ProductFactory."Minimum Deposit Contribution";

//                 NewContr := NewContr - SavAcc."Monthly Contribution";



//                 //IF NewContr<0 THEN
//                 // NewContr:=0;

//                 //end of contribution


//                 //Qualification on salary
//                 AppraisalSal.Reset;
//                 AppraisalSal.SetRange("Loan No", "Loan No.");
//                 if AppraisalSal.Find('-') then begin
//                     repeat
//                         if AppraisalSal.Type = AppraisalSal.Type::Basic then
//                             TBasic := TBasic + AppraisalSal.Amount
//                         else
//                             if AppraisalSal.Type = AppraisalSal.Type::Earnings then
//                                 TEarning := AppraisalSal.Amount
//                             else
//                                 if AppraisalSal.Type = AppraisalSal.Type::"Other Allowances" then
//                                     TAllowance := TAllowance + AppraisalSal.Amount
//                                 else
//                                     if AppraisalSal.Type = AppraisalSal.Type::Deductions then
//                                         TDeductions := TDeductions + AppraisalSal.Amount
//                                     else
//                                         if AppraisalSal.Type = AppraisalSal.Type::"Gross Pay" then
//                                             GrossAmount := GrossAmount + AppraisalSal.Amount;

//                     until AppraisalSal.Next = 0;
//                 end;

//                 //Cleared external effects affecting qualification
//                 ExternalEff.Reset;
//                 ExternalEff.SetRange("Loan No.", "Loan No.");
//                 ExternalEff.SetRange("Affects 2/3 Rule", true);
//                 if ExternalEff.Find('-') then begin
//                     ExternalEff.CalcSums("Monthly Deduction");
//                     TotalExteralRec := ExternalEff."Monthly Deduction";
//                 end;

//                 //Total cleared effects
//                 ExternalEff.Reset;
//                 ExternalEff.SetRange("Loan No.", "Loan No.");
//                 if ExternalEff.Find('-') then begin
//                     ExternalEff.CalcSums(ExternalEff.Amount);
//                     TExternalEffects := ExternalEff.Amount;
//                 end;

//                 NetSalary := (TBasic + TEarning + TAllowance - TDeductions);
//                 /*
//                 //Get customer/employer
//                 IF Cust.GET(Members."Employer Code") THEN BEGIN
//                   IF Cust."Loan Qualification"=Cust."Loan Qualification"::"Basic Pay" THEN BEGIN
//                     NetOnSalary:=(NetSalary-TBasic*1/3);
//                     AthirdDisplay:='1/3 Third of Basic';
//                     AthirdAmt:=({NetSalary-}TBasic)*1/3
//                   END ELSE IF Cust."Loan Qualification"=Cust."Loan Qualification"::"Gross Pay" THEN BEGIN
//                     NetOnSalary:=(NetSalary-((TBasic+TEarning+TAllowance)*1/3));
//                     AthirdDisplay:='1/3 Third of Gross';
//                     AthirdAmt:=(TBasic+TEarning+TAllowance)*1/3;
//                   END ELSE IF Cust."Loan Qualification"=Cust."Loan Qualification"::"Standing Order" THEN BEGIN
//                     NetOnSalary:=NetOnDeposits;
//                     AthirdDisplay:='Standing Order';
//                     AthirdAmt:=NetOnDeposits;
//                   END ELSE
//                   ERROR('Employer not found');
//                 END ELSE
//                 BEGIN
//                       NetOnSalary:=(NetSalary-TBasic*1/3);
//                     AthirdDisplay:='1/3 Third of Basic';
//                     AthirdAmt:=({NetSalary-}TBasic)*1/3
//                   END;
//                   */
//                 //TotalMRepay:=

//                 // TotalLoan:=NetOnSalary/(Loans.Interest/12/100) / (1 - POWER((1 + (Loans.Interest/12/100)),- Loans.Installments));

//                 TotalLoan := NetOnSalary * (1 - Power((1 + (Loans.Interest / 12 / 100)), -Loans.Installments)) / (Loans.Interest / 12 / 100);
//                 NetOnSalary := TotalLoan;

//                 //Take care of wafanisi
//                 if NetOnDeposits >= NetOnSalary then begin
//                     if Loans."Requested Amount" > NetOnSalary then begin
//                         QualifyingAmount := NetOnSalary;
//                         Loans."Recommended Amount" := ROUND(QualifyingAmount, 1000, '<');
//                         ;
//                     end else begin
//                         QualifyingAmount := Loans."Requested Amount";
//                         Loans."Recommended Amount" := ROUND(QualifyingAmount, 1000, '<');
//                         ;
//                     end;
//                 end else begin
//                     if Loans."Requested Amount" > NetOnDeposits then begin
//                         QualifyingAmount := NetOnDeposits;
//                         Loans."Recommended Amount" := ROUND(QualifyingAmount, 1000, '<');
//                         ;
//                     end else begin
//                         QualifyingAmount := Loans."Requested Amount";
//                         Loans."Recommended Amount" := ROUND(QualifyingAmount, 1000, '<');
//                         ;
//                     end;

//                 end;

//                 //If any has not finished expected reapplication period
//                 TopUp.Reset;
//                 TopUp.SetRange("Loan No.", "Loan No.");
//                 if TopUp.Find('-') then begin
//                     repeat
//                         if TopUp."Additional Top Up Commission" = true then
//                             ChargeExtraComms := true;
//                     until TopUp.Next = 0;
//                 end;

//                 //Toatl top ups
//                 TopUp.Reset;
//                 TopUp.SetRange("Loan No.", "Loan No.");
//                 if TopUp.Find('-') then begin
//                     TopUpComms := 0;
//                     repeat
//                         PCharges.Reset;
//                         PCharges.SetRange(PCharges."Product Code", Loans."Loan Product Type");
//                         PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"Top up");
//                         if PCharges.Find('-') then begin
//                             repeat
//                                 if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") and (PCharges."Charging Option" = PCharges."charging option"::"On Approved Amount") then begin
//                                     if ChargeExtraComms = true then
//                                         Amt := (Loans."Approved Amount" * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
//                                     else
//                                         Amt := (Loans."Approved Amount" * (PCharges.Percentage / 100));
//                                 end else
//                                     if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount") and (PCharges."Charging Option" = PCharges."charging option"::"On Net Amount") then begin
//                                         if ChargeExtraComms = true then
//                                             Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage + PCharges."Additional Charge %") / 100)
//                                         else
//                                             Amt := ((TopUp."Principle Top Up" + TopUp."Interest Top Up") * (PCharges.Percentage / 100))
//                                     end else
//                                         Amt := PCharges."Charge Amount";


//                                 if Amt < PCharges.Minimum then
//                                     Amt := PCharges.Minimum;

//                                 if Amt > PCharges.Maximum then
//                                     Amt := PCharges.Maximum;



//                                 TopUpComms := TopUpComms + Amt;

//                             until PCharges.Next = 0;
//                         end;


//                     until TopUp.Next = 0;
//                 end;

//                 //exteral commitments
//                 ExternalCharges := 0;
//                 OtherComms := 0;
//                 //Clearing external debts
//                 OtherCommitments.Reset;
//                 OtherCommitments.SetRange(OtherCommitments."Loan No.", Loans."Loan No.");
//                 if OtherCommitments.Find('-') then begin
//                     repeat
//                         OtherCommitments.CalcSums(OtherCommitments.Amount);
//                         OtherComms := OtherCommitments.Amount;

//                         ExternalCharges := 0;
//                         PCharges.Reset;
//                         PCharges.SetRange(PCharges."Product Code", Loans."Loan Product Type");
//                         PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::"External Loan");
//                         if PCharges.Find('-') then begin
//                             repeat
//                                 //MESSAGE('Here1 %1',ExternalCharges);
//                                 if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount" = true) then begin
//                                     if ChargeExtraComms = true then
//                                         ExternalCharges := ExternalCharges + (OtherCommitments.Amount * ((PCharges.Percentage + PCharges."Additional Charge %") / 100))
//                                     else
//                                         ExternalCharges := ExternalCharges + (OtherCommitments.Amount * (PCharges.Percentage / 100))
//                                 end else begin
//                                     ExternalCharges := ExternalCharges + OtherCommitments.Amount;
//                                 end;
//                             //MESSAGE('Running Charge  other comms%1',ExternalCharges);
//                             until PCharges.Next = 0;

//                             if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
//                                 GeneralSetUp.Get();
//                                 ExerciseDuty := ExternalCharges * GeneralSetUp."Excise Duty (%)" * 0.01;
//                             end;
//                         end;
//                     until OtherCommitments.Next = 0;
//                     ExternalCharges2 := ExternalCharges;
//                     ExternalCharges := ExternalCharges + ExerciseDuty;

//                     //MESSAGE('Here %1',ExternalCharges);
//                 end;

//                 //Balancing entry if disbursed via Savings
//                 //IF LoanApps."All Posting through Savings Ac"=TRUE THEN BEGIN

//                 //Loan Processing Fee Charge
//                 PCharges.Reset;
//                 PCharges.SetRange(PCharges."Product Code", Loans."Loan Product Type");
//                 PCharges.SetRange(PCharges."Charge Type", PCharges."charge type"::General);
//                 PCharges.SetRange(PCharges."Charge Description", 'Loan Processing  Charge');
//                 if PCharges.Find('-') then begin
//                     repeat

//                         if (PCharges."Charge Method" = PCharges."charge method"::"% of Amount" = true) then
//                             LoanProcessingAmt := Loans."Approved Amount" * (PCharges.Percentage / 100)
//                         else
//                             if PCharges."Charge Method" = PCharges."charge method"::"Flat Amount" then
//                                 LoanProcessingAmt := PCharges."Charge Amount"
//                             else
//                                 if PCharges."Charge Method" = PCharges."charge method"::Staggered then begin

//                                     PCharges.TestField(PCharges."Staggered Charge Code");

//                                     TariffDetails.Reset;
//                                     TariffDetails.SetRange(TariffDetails.Code, PCharges."Staggered Charge Code");
//                                     if TariffDetails.Find('-') then begin
//                                         repeat
//                                             if (Loans."Approved Amount" >= TariffDetails."Lower Limit") and (Loans."Approved Amount" <= TariffDetails."Upper Limit") then begin
//                                                 if TariffDetails."Use Percentage" = true then begin
//                                                     LoanProcessingAmt := Loans."Approved Amount" * TariffDetails.Percentage * 0.01;
//                                                 end else begin
//                                                     LoanProcessingAmt := TariffDetails."Charge Amount";
//                                                 end;
//                                             end;
//                                         until TariffDetails.Next = 0;
//                                     end;
//                                 end;


//                         if LoanProcessingAmt < PCharges.Minimum then
//                             LoanProcessingAmt := PCharges.Minimum;
//                         if LoanProcessingAmt > PCharges.Maximum then
//                             LoanProcessingAmt := PCharges.Maximum;

//                         //If excise duty involved
//                         if PCharges."Effect Excise Duty" = PCharges."effect excise duty"::Yes then begin
//                             GenSetup.Get();//TESTFIELD("Excise Duty G/L");
//                             LoanProcessingAmtEx := LoanProcessingAmt * GenSetup."Excise Duty (%)" * 0.01;
//                         end;
//                     until PCharges.Next = 0;

//                 end;
//                 //END;

//                 TotalProcessingAmt := LoanProcessingAmt + LoanProcessingAmtEx;
//                 //


//                 // Twothird rule
//                 if NewRepayment < Loans.Repayment then
//                     Twothird := true;


//                 //Total Loans
//                 Loan.Reset;
//                 Loan.SetRange(Loan."Member No.", Loans."Member No.");
//                 Loan.SetRange(Loan.Posted, true);
//                 if Loan.Find('-') then begin
//                     repeat
//                         Loan.CalcFields(Loan."Outstanding Balance");
//                         TotalLoanBal := TotalLoanBal + Loan."Outstanding Balance";
//                         if Loan."Recovered Loan" <> '' then
//                             LoanRecoverd := true;
//                     until Loan.Next = 0;
//                 end;



//                 if NetOnDeposits < Loans."Requested Amount" then
//                     LoanDepositRation := true;

//                 GeneralSetUp.Get;

//                 if Members.Get(Loans."Member No.") then begin
//                     if Members."Group Account" = false then begin
//                         if Members."Tax Exempted" = true then begin
//                             if Loans."Expected Date of Completion" > CalcDate(Format(GeneralSetUp."Max. Member Age - Disabled"), Members."Date of Birth") then
//                                 MemberDueRetire := true;
//                         end else begin
//                             if Loans."Expected Date of Completion" > CalcDate(Format(GeneralSetUp."Max. Member Age"), Members."Date of Birth") then
//                                 MemberDueRetire := true;
//                         end;

//                         //MESSAGE('Retires %1 Expect Comp%2 Setup %3 DOB %4',MemberDueRetire,Loans."Expected Date of Completion",GeneralSetUp."Max. Member Age",Members."Date of Birth");
//                     end;
//                 end;

//                 if ProductFactory.Get(Loans."Loan Product Type") then begin
//                     Loan.Reset;
//                     Loan.SetRange(Loan."Member No.", Loans."Member No.");
//                     Loan.SetRange(Loan."Loan Product Type", Loans."Loan Product Type");
//                     Loan.SetRange(Loan.Posted, true);
//                     if Loan.Find('-') then begin
//                         if Loan."Disbursement Date" = 0D then Loan."Disbursement Date" := Today;
//                         if ProductFactory."Min. Re-application Period" <> emptydateformula then
//                             if Today < CalcDate(Format(ProductFactory."Min. Re-application Period"), Loan."Disbursement Date") then
//                                 ReapplicationPeriod := true;
//                     end;

//                 end;
//                 if Loans."Recommended Amount" < 0 then
//                     Loans."Recommended Amount" := 0;

//                 Loans."Approved Amount" := Loans."Recommended Amount";
//                 Loans."Amount To Disburse" := Loans."Recommended Amount";
//                 Loans.Validate(Loans."Approved Amount");

//                 NetTakeHome := LoanProcess.ComputeCharges(Loans."Approved Amount", Loans."Loan Product Type", Loans."Loan No.", 0);


//                 //MESSAGE('%1',NetTakeHome);

//                 //Net take Hone
//                 NetTakeHome := NetTakeHome - ExerciseDuty;
//                 Loans."Net Amount" := NetTakeHome;
//                 //Net take Home
//                 Loans.Modify;
//                 //Discuting
//                 Loans2.Reset;
//                 Loans2.SetRange(Loans2."Discounted Loan No.", Loans."Loan No.");
//                 if Loans2.Find('-') then begin
//                     Loans2.CalcSums(Loans2."Approved Amount");
//                     DiscAmt := Loans2."Approved Amount";
//                 end;



//                 //Insert Warnings---Directors
//                 DirectorWarning := false;
//                 if Members.Get(Loans."Member No.") then begin
//                     AccountSignatories.Reset;
//                     AccountSignatories.SetRange("ID Number", Members."ID No.");
//                     if AccountSignatories.Find('-') then begin
//                         repeat
//                             Loan.Reset;
//                             Loan.SetFilter("Outstanding Bills", '>0');
//                             Loan.SetRange("Member No.", AccountSignatories."Account No");
//                             if Loan.Find('-') then begin
//                                 repeat
//                                     Loan.CalcFields("Outstanding Bills");
//                                     if (Loan."Outstanding Bills" - Loan.Repayment) > 0 then
//                                         DirectorWarning := true;
//                                 until Loan.Next = 0;
//                             end;
//                         until AccountSignatories.Next = 0;
//                     end;
//                 end;


//                 if ProductFactory."Requires Salary Processing" = true then begin
//                     EndDateSalo := CalcDate('-' + Format(ProductFactory."Salary Period"), Today);//+FORMAT(ProdFac."No. of Salary Times")
//                     SalProc.Reset;
//                     SalProc.SetRange("Account No.", "Disbursement Account No");
//                     SalProc.SetRange("Posting Date", EndDateSalo, Today);
//                     SalProc.SetRange(Posted, true);
//                     if SalProc.Find('-') then begin
//                         if SalProc.Count < ProductFactory."No. of Salary Times" then
//                             SalNotThroughSacco := true;

//                     end else
//                         SalNotThroughSacco := true;
//                 end;
//                 LoanGua.Reset;
//                 LoanGua.SetRange("Loan No", Loans."Loan No.");
//                 if LoanGua.Find('-') then
//                     LoanGua.CalcSums(LoanGua."Amount Guaranteed");
//                 SavAcc.Reset;
//                 SavAcc.SetRange(SavAcc."Member No.", Loans."Member No.");
//                 SavAcc.SetRange(SavAcc."Product Category", SavAcc."product category"::"Deposit Contribution");
//                 if SavAcc.Find('-') then
//                     SavAcc.CalcFields(SavAcc."Balance (LCY)");

//                 SecurityTotal := LoanGua."Amount Guaranteed" + SavAcc."Balance (LCY)" - (RelatedBal);//-OffsetBalance);
//                                                                                                      //MESSAGE('Guar %1 Dep %2 Related %3 OffsetBal %4 ',LoanGua."Amount Guaranteed",SavAcc."Balance (LCY)",RelatedBal,OffsetBalance);

//                 if SecurityTotal < Loans."Approved Amount" then begin
//                     SecurityRisk := true;
//                     DifferenceSec := Loans."Approved Amount" - SecurityTotal;

//                 end;

//                 //Get Possible boosting Amount
//                 //(NetOnSalary-NetOnDeposits)/Mult
//                 if (NetOnSalary > NetOnDeposits) and (NetOnDeposits < Loans."Requested Amount") then begin
//                     //IF
//                     if NetOnSalary > Loans."Requested Amount"
//                       then
//                         PossibleBoost := (NetOnSalary - Loans."Requested Amount") / Mult else
//                         PossibleBoost := (NetOnSalary - Loans."Recommended Amount") / Mult;
//                 end;

//                 if MultP >= 4 then
//                     Mult := 4;

//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     trigger OnPreReport()
//     begin
//         Company.Get;
//         Company.CalcFields(Company.Picture);
//     end;

//     var
//         DCSParameterMatrix: Record 52186091;
//         ParameterBold: Boolean;
//         ParamContribution: Option "Formula Factor","Flat Rate",Range,Ceiling,Multiplier,Divisor,Frequency,"Sum",Difference,"Graduated Range",Exponential,Terminate,Probability,Floor;
//         ParamFormula: Text;
//         SavingsAccounts: Record 52185730;
//         MemberDeposits: Decimal;
//         Loan: Record 52185729;
//         TotalLoanBal: Decimal;
//         Company: Record "Company Information";
//         LoansTopup: Record 52185742;
//         CountNo: Integer;
//         GuarantorMax: Boolean;
//         ProductFactory: Record 52185690;
//         LoanRecoverd: Boolean;
//         GeneralSetUp: Record 52185689;
//         Members: Record "Members";
//         MemberDueRetire: Boolean;
//         SecurityTotal: Decimal;
//         SecurityRisk: Boolean;
//         LoanDepositRation: Boolean;
//         ReapplicationPeriod: Boolean;
//         Deposit_Multiplier: Decimal;
//         RelatedProduct: Record 52185750;
//         RelatedBal: Decimal;
//         NetOnDeposits: Decimal;
//         AppraisalSal: Record 52185744;
//         TBasic: Decimal;
//         TEarning: Decimal;
//         TAllowance: Decimal;
//         TDeductions: Decimal;
//         LoanTopup: Record 52185742;
//         TopupRepayments: Decimal;
//         AdjustedNet: Decimal;
//         NetSalary: Decimal;
//         ExternalEff: Record 52185743;
//         TotalExteralRec: Decimal;
//         NetOnSalary: Decimal;
//         QualifyingAmount: Decimal;
//         AvInterest: Decimal;
//         NewContr: Decimal;
//         SavAcc: Record 52185730;
//         NewRepayment: Decimal;
//         CurrLoanBal: Decimal;
//         Dimension1: Code[20];
//         Dimension2: Code[20];
//         Mult: Decimal;
//         NetTakeHome: Decimal;
//         LoanProcess: Codeunit 52185457;
//         SalProc: Record 52185784;
//         SalProcessed: Boolean;
//         OffsetBalance: Decimal;
//         LoanGuarantorsandSecurity: Record 52185739;
//         AccountSignatories: Record 52185703;
//         DirectorWarning: Boolean;
//         MssgDefault: label 'This member has defaulted Loan-:';
//         Twothird: Boolean;
//         TopUp: Record 52185742;
//         PCharges: Record 52185734;
//         Amt: Decimal;
//         TopUpComms: Decimal;
//         Loans2: Record 52185729;
//         DiscAmt: Decimal;
//         DifferenceSec: Decimal;
//         TExternalEffects: Decimal;
//         Inactive: Boolean;
//         GuarLoanBal: Decimal;
//         CountAll: Integer;
//         LoanGua: Record 52185739;
//         OtherComms: Decimal;
//         OtherCommitments: Record 52185743;
//         ChargeExtraComms: Boolean;
//         ExternalCharges: Decimal;
//         RemPeriod: Decimal;
//         CredLedEntry: Record 52185733;
//         SalNotThroughSacco: Boolean;
//         EndDateSalo: Date;
//         RepBasedOnRequested: Decimal;
//         IntBasedOnRequested: Decimal;
//         Cust: Record Customer;
//         SelfGuaranteedBal: Decimal;
//         TotalLoan: Decimal;
//         Denominator: Decimal;
//         AthirdDisplay: Text[50];
//         AthirdAmt: Decimal;
//         emptydateformula: DateFormula;
//         ExerciseDuty: Decimal;
//         DepPurchaseComm: Decimal;
//         DepPurchaseCommExc: Decimal;
//         TariffDetails: Record 52185777;
//         ExcemptCharges: Boolean;
//         GenSetup: Record 52185689;
//         PossibleBoost: Decimal;
//         ExternalCharges2: Decimal;
//         GrossAmount: Decimal;
//         LoansProductTyp: Text;
//         MultP: Integer;
//         BusinessIncome: Record 52186097;
//         LoanProcessingAmt: Decimal;
//         LoanProcessingAmtEx: Decimal;
//         TotalProcessingAmt: Decimal;
// }
