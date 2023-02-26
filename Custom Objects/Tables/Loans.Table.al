table 52185729 Loans
{
    // DrillDownPageID = "Loans List";
    // LookupPageID = "Loans List";

    fields
    {
        field(1; "Loan No."; Code[50])
        {

            trigger OnValidate()
            begin
                if "Loan No." <> xRec."Loan No." then begin
                    MembNoSeries.Get;
                    NoSeriesMgt.TestManual(MembNoSeries."Loan Nos.");
                    "No. Series" := '';

                    //Check dimensions and responsibility centre


                    "Application Date" := Today;
                    Advice := true;
                    "All Posting through Savings Ac" := true;
                    if (CalcDate('-CM+15D', Today)) > Today then
                        "Disbursement Date" := (CalcDate('-CM+15D', Today)) else
                        "Disbursement Date" := (CalcDate('CM', Today));

                    "Captured By" := UpperCase(UserId);

                    if UserSetup.Get(UpperCase(UserId)) then begin
                        "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                        "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                        "Responsibility Centre" := UserSetup."Responsibility Centre";

                    end;
                end;
            end;
        }
        field(2; "Application Date"; Date)
        {
            Editable = false;

            trigger OnValidate()
            begin

                if "Application Date" > Today then
                    Error('Application date can not be in the future.');
            end;
        }
        field(3; "Loan Product Type"; Code[20])
        {
        }
        field(4; "Member No."; Code[20])
        {
            TableRelation = Members."No.";
        }
        field(5; "Requested Amount"; Decimal)
        {
        }
        field(6; "Approved Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                //IF ProdFac.GET("Loan Product Type") THEN BEGIN
                ProdFac.Reset;
                ProdFac.SetRange("Product ID", Rec."Loan Product Type");
                if ProdFac.FindFirst then begin
                    //  IF "Picked Mobile Loan"=FALSE THEN BEGIN
                    if (ProdFac."Nature of Loan Type" = ProdFac."Nature of Loan Type"::Normal) or (ProdFac."Nature of Loan Type" = ProdFac."Nature of Loan Type"::" ") then begin
                        if ("Requested Amount" > ProdFac."Maximum Loan Amount") or ("Requested Amount" < ProdFac."Minimum Loan Amount") then begin
                            if "Dummy Appraisal" = false then Error(LoanAmountErr, ProdFac."Minimum Loan Amount", ProdFac."Maximum Loan Amount") else Message(LoanAmountErr, ProdFac."Minimum Loan Amount", ProdFac."Maximum Loan Amount");
                            //  END;
                        end;
                    end;
                end;

                if Installments <= 0 then
                    Error(InstallmentsErr);

                if "Approved Amount" > "Requested Amount" then
                    Error(ApprovedAmtErr);

                "Amount To Disburse" := "Approved Amount";

                //
                TotalMRepay := 0;
                LPrincipal := 0;
                LInterest := 0;
                InterestRate := Interest;
                LoanAmount := "Approved Amount";
                RepayPeriod := Installments;
                LBalance := "Approved Amount";

                if InterestRate <> 0 then begin
                    if "Interest Calculation Method" = "Interest Calculation Method"::Amortised then begin
                        //TESTFIELD(Interest);
                        //TESTFIELD(Installments);

                        TotalMRepay := Round((InterestRate / 12 / 100) / (1 - Power((1 + (InterestRate / 12 / 100)), -RepayPeriod)) * LoanAmount, 1, '>');
                        LInterest := Round(LBalance / 100 / 12 * InterestRate, 0.05, '>');

                        Repayment := TotalMRepay;
                        LPrincipal := TotalMRepay - LInterest;
                        "Loan Principle Repayment" := LPrincipal;
                        "Loan Interest Repayment" := LInterest;
                        "Loan Principle Repayment" := TotalMRepay;
                        //"Qualifying Repayment" :=TotalMRepay;

                    end;


                    if "Interest Calculation Method" = "Interest Calculation Method"::"Straight Line" then begin
                        TestField(Interest);
                        TestField(Installments);
                        LPrincipal := Round(LoanAmount / RepayPeriod, 1, '>');
                        LInterest := Round((InterestRate / 12 / 100) * LoanAmount, 1, '>');
                        Repayment := LPrincipal + LInterest;
                        "Loan Principle Repayment" := LPrincipal;
                        "Loan Interest Repayment" := LInterest;
                    end;

                    if "Interest Calculation Method" = "Interest Calculation Method"::"Reducing Balance" then begin
                        TestField(Interest);
                        TestField(Installments);
                        LPrincipal := Round(LoanAmount / RepayPeriod, 1, '>');
                        //LPrincipal:=LoanAmount/RepayPeriod;
                        LInterest := (InterestRate / 12 / 100) * LBalance;
                        Repayment := LPrincipal;
                        "Loan Principle Repayment" := LPrincipal;
                        "Loan Interest Repayment" := LInterest;

                    end;

                    if "Interest Calculation Method" = "Interest Calculation Method"::"Reducing Flat" then begin
                        TestField(Interest);
                        TestField(Installments);
                        //TotalMRepay:=ROUND((InterestRate/12/100) / (1 - POWER((1 + (InterestRate/12/100)),- RepayPeriod)) * LoanAmount,1,'>');
                        LPrincipal := Round(LoanAmount / RepayPeriod, 1, '>');
                        //AmortisedInt:=TotalMRepay*Installments-"Approved Amount";
                        LInterest := Round(((LoanAmount * Interest / 12 / 100) + (LPrincipal * Interest / 12 / 100)) / 2, 1, '>');
                        //LInterest:=AmortisedInt/Installments;
                        Repayment := LPrincipal + LInterest;
                        "Loan Principle Repayment" := LPrincipal;
                        "Loan Interest Repayment" := LInterest;

                    end;
                end else begin
                    LPrincipal := LoanAmount / RepayPeriod;
                    Repayment := LPrincipal;
                end;
            end;
        }
        field(7; Interest; Decimal)
        {

            trigger OnValidate()
            begin
                TestField("Loan Product Type");
                if ProdFac.Get("Loan Product Type") then begin
                    if ProdFac."Mortgage Loan" = false then
                        if (Interest < ProdFac."Interest Rate (Min.)") or (Interest > ProdFac."Interest Rate (Max.)") then
                            Error(InterestErrorTxt);
                end;

                if "Approved Amount" > 0 then
                    Validate("Approved Amount");


                //compute expected end date based on application date
                if ProdFac.Get("Loan Product Type") then begin
                    if Format(ProdFac."Grace Period - Principle") <> '' then begin
                        "Repayment Start Date" := CalcDate(ProdFac."Grace Period - Principle", "Application Date");
                        "Repayment Start Date" := CalcDate('CM', "Repayment Start Date");
                        IntstallMentPeriodText := Format(Installments) + 'M';
                        Evaluate(InstalmentPeriods, IntstallMentPeriodText);
                        "Expected Date of Completion" := CalcDate(InstalmentPeriods, "Repayment Start Date");
                    end else begin
                        "Repayment Start Date" := CalcDate('CM', "Application Date");
                        IntstallMentPeriodText := Format(Installments) + 'M';
                        Evaluate(InstalmentPeriods, IntstallMentPeriodText);
                        "Expected Date of Completion" := CalcDate(InstalmentPeriods, "Repayment Start Date");
                    end;
                end;

                GenSetup.Get;
                ProdFac.Get("Loan Product Type");
                if ProdFac."Mortgage Loan" = true then begin
                    if Installments <= 120 then
                        Interest := ProdFac."Interest Rate (Min.)" + GenSetup."KMRC Rate"
                    else
                        Interest := ProdFac."Interest Rate (Max.)" + GenSetup."KMRC Rate"
                end;
            end;
        }
        field(8; "Member Name"; Text[50])
        {
        }
        field(9; "Approval Date"; Date)
        {
        }
        field(10; Installments; Integer)
        {

            trigger OnValidate()
            var
                adj: Integer;
                RetirementDate: Date;
            begin
                //Control
                if ProdFac.Get("Loan Product Type") then begin
                    if ProdFac."Mortgage Loan" = true then begin
                        if "Member No." = '' then Error('Kindly Select Member applying for this loan');
                        GenSetup.Get();
                        if Mem.Get("Member No.") then begin
                            RetirementDate := CalcDate(Format(GenSetup."Max. Member Age"), Mem."Date of Birth");
                            if Mem."Employer Code" <> '99' then begin
                                if Mem.Type <> Mem.Type::"From Other Sacco" then begin
                                    if Mem."Group Account" = false then begin
                                        // ClientAge := HRDates.DetermineAge(Mem."Date of Birth", Today);
                                        ClientAgePart := CopyStr(ClientAge, 1, 2);
                                        ClientAgePart := CopyStr(ClientAge, 1, 2);
                                        Evaluate(ClientAgeValue, ClientAgePart);
                                        adj := Round((((RetirementDate - "Repayment Start Date") / 365) * 12), 1, '<');
                                        if Installments > adj then
                                            Installments := adj
                                        else
                                            Installments := Installments;
                                    end;
                                end;
                            end else begin
                                if Mem."Group Account" = false then begin
                                    /*ClientAge:=HRDates.DetermineAge("Retirement/Expiry Date",TODAY);
                                    ClientAgePart:=COPYSTR(ClientAge,1,2);
                                    ClientAgePart:=COPYSTR(ClientAge,1,2);
                                    EVALUATE(ClientAgeValue,ClientAgePart);*/
                                    RetirementDate := "Retirement/Expiry Date";
                                    adj := Round((((RetirementDate - "Repayment Start Date") / 365) * 12), 1, '<');
                                    if Installments > adj then
                                        Installments := adj
                                    else
                                        Installments := Installments;
                                end;
                            end;
                        end;

                        Validate(Interest);
                    end;
                end;

                if ProdFac.Get("Loan Product Type") then begin
                    if Installments > ProdFac."Ordinary Default Intallments" then
                        Error(Text006);
                end;



                if "Approved Amount" > 0 then
                    Validate("Approved Amount");

            end;
        }
        field(11; "Disbursement Date"; Date)
        {

            trigger OnValidate()
            begin

                //IF "Disbursement Date"<TODAY THEN
                // ERROR(DateErr);

                if ProdFac.Get("Loan Product Type") then begin
                    if Format(ProdFac."Grace Period - Principle") <> '' then begin
                        "Repayment Start Date" := CalcDate(ProdFac."Grace Period - Principle", "Disbursement Date");
                        "Repayment Start Date" := CalcDate('CM', "Repayment Start Date");
                        IntstallMentPeriodText := Format(Installments) + 'M';
                        Evaluate(InstalmentPeriods, IntstallMentPeriodText);
                        "Expected Date of Completion" := CalcDate(InstalmentPeriods, "Repayment Start Date");
                    end else begin
                        "Repayment Start Date" := CalcDate('CM', "Disbursement Date");
                        IntstallMentPeriodText := Format(Installments) + 'M';
                        Evaluate(InstalmentPeriods, IntstallMentPeriodText);
                        "Expected Date of Completion" := CalcDate(InstalmentPeriods, "Repayment Start Date");
                    end;
                end;
            end;
        }
        field(12; "Mode of Disbursement"; Option)
        {
            OptionCaption = 'Full Disbursement,Partial Disbursement';
            OptionMembers = "Full Disbursement","Partial Disbursement";

            trigger OnValidate()
            begin
                if "Mode of Disbursement" = "Mode of Disbursement"::"Partial Disbursement" then begin
                    if "Amount To Disburse" >= "Approved Amount" then
                        Error(DisbErr);
                end else begin
                    if "Approved Amount" <> "Amount To Disburse" then
                        Error(Text002);                
                end;
            end;
        }
        field(13; "Grace Period"; DateFormula)
        {
        }
        field(14; "Installment Period"; DateFormula)
        {
        }
        field(15; Repayment; Decimal)
        {

            trigger OnValidate()
            begin
                //GetPreviosRec(xRec.Repayment);
                // if ("Recovery Mode" = "Recovery Mode"::Checkoff) or ("Loan Product Type" = '133') then
                //     CheckoffAdvice.LoanCheckoffAdvice(LoanRec, Repayment, xRec.Repayment);
            end;
        }
        field(16; "Loan Product Type Name"; Text[50])
        {
            Editable = false;
        }
        field(17; Posted; Boolean)
        {
        }
        field(18; "Amount To Disburse"; Decimal)
        {
            FieldClass = Normal;

            trigger OnValidate()
            var
                // MngExemptionsDocApprvls: Codeunit "Mngt. Routine Processes";
                // VarVariant: Variant;
                // CustomApprovals: Codeunit "Custom Approvals Codeunit";
                // CompInfo: Record "Company Information";
                // DocExemptionsApprvls: Record "Document Exemptions Auth.";
            begin
                /*
                IF "Amount To Disburse" > "Recommended Amount" THEN BEGIN
                TESTFIELD("Comment for Exemptions");
                MngExemptionsDocApprvls.PerformExemptionsOnLoanApplic(Rec);
                AvailableCreditLimit();
                PassDocumentNo();
                EXIT;
                END;*/

                if ("Amount To Disburse" <> "Approved Amount") then begin
                    "Mode of Disbursement" := "Mode of Disbursement"::"Partial Disbursement";
                    Modify;
                end;
                Rec.Validate("Mode of Disbursement");

            end;
        }
        field(19; "Fully Disbursed"; Boolean)
        {
        }
        field(20; "New Interest Rate"; Decimal)
        {
        }
        field(21; "New No. of Installment"; Integer)
        {
        }
        field(22; "New Grace Period"; DateFormula)
        {
        }
        field(23; "New Installment Period"; DateFormula)
        {
        }
        field(24; "Loan Balance at Rescheduling"; Decimal)
        {
        }
        field(25; "Loan Rescheduled"; Boolean)
        {
        }
        field(26; "Date Rescheduled"; Date)
        {
        }
        field(27; "Reschedule by"; Code[50])
        {
        }
        field(28; "Interest Calculation Method"; Option)
        {
            OptionCaption = 'Amortised,Reducing Balance,Straight Line,Reducing Flat,Zero Interest';
            OptionMembers = Amortised,"Reducing Balance","Straight Line","Reducing Flat","Zero Interest";
        }
        field(29; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(30; "Max. Installments"; Integer)
        {
        }
        field(31; "Max. Loan Amount"; Decimal)
        {
        }
        field(32; "Loan Cycle"; Integer)
        {
        }
        // field(33; "Total Disbursed"; Decimal)
        // {
        //     CalcFormula = Sum("Credit Ledger Entry"."Amount (LCY)" WHERE("Loan No" = FIELD("Loan No.")));
        //     FieldClass = FlowField;
        // }
        field(34; "Repayment Start Date"; Date)
        {
        }
        field(35; "Disbursement Account No"; Code[20])
        {
            Editable = false;
        }
        field(36; "Staff No"; Code[20])
        {
        }
        field(37; Source; Option)
        {
            OptionCaption = 'CREDIT,BANKING,MICRO';
            OptionMembers = CREDIT,BANKING,MICRO;
        }
        field(38; Remarks; Text[50])
        {
        }
        field(39; Advice; Boolean)
        {
        }
        field(40; Defaulted; Boolean)
        {
        }
        field(41; "Captured By"; Code[50])
        {
        }
        field(42; "Last Advice Date"; Date)
        {
        }
        field(43; "Advice Type"; Option)
        {
            OptionCaption = ' ,Fresh Loan,Adjustment,Reintroduction,Stoppage';
            OptionMembers = " ","Fresh Loan",Adjustment,Reintroduction,Stoppage;
        }
        // field(44; "Loans Category-SASRA"; Option)
        // {
        //     CalcFormula = Lookup("SASRA Categorization"."Loans Category-SASRA" WHERE("Loan No." = FIELD("Loan No.")));
        //     FieldClass = FlowField;
        //     OptionCaption = 'Perfoming,Watch,Substandard,Doubtful,Loss';
        //     OptionMembers = Perfoming,Watch,Substandard,Doubtful,Loss;
        // }
        field(45; "Currency Code"; Code[20])
        {
        }
        field(46; "Currency Filter"; Code[10])
        {
        }
        field(47; "Appln. between Currencies"; Option)
        {
            OptionCaption = 'None,EMU,All';
            OptionMembers = "None",EMU,All;
        }
        field(48; "Expected Date of Completion"; Date)
        {
        }
        field(49; "Recovery Mode"; Option)
        {
            OptionCaption = ' ,Checkoff,Salary,Dividend,Fixed Deposit,Internal STO,External STO,D Allowance,Board Allowance';
            OptionMembers = " ",Checkoff,Salary,Dividend,"Fixed Deposit","Internal STO","External STO","D Allowance","Board Allowance";
        }
        field(50; "Repayment Frequency"; Option)
        {
            OptionCaption = 'Daily,Weekly,Monthly,Quarterly,Bi-Annual,Yearly';
            OptionMembers = Daily,Weekly,Monthly,Quarterly,"Bi-Annual",Yearly;
        }
        field(51; Status; Option)
        {
            OptionCaption = 'Application,Appraisal,Approved,Rejected,Deffered';
            OptionMembers = Open,Pending,Approved,Rejected,Deffered;
        }
        field(52; "Loan Rejection Reason"; Code[100])
        {
            // TableRelation = "Rejection Reason"."Rejection Reason";

            trigger OnValidate()
            begin
                if UserSetup.Get(UpperCase(UserId)) then begin
                    "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                    "Responsibility Centre" := UserSetup."Responsibility Centre";
                end;
                CellNo := '';

                DimensionValue.Reset;
                DimensionValue.SetRange(Code, "Global Dimension 2 Code");
                if DimensionValue.Find('-') then begin
                    CellNo := DimensionValue."Phone No.";
                end;


              
            end;
        }
        field(53; "Recommended Amount"; Decimal)
        {
        }
        field(54; "Responsibility Center"; Code[20])
        {
        }
        field(55; "Loan Account"; Code[20])
        {
            Editable = true;
        }
        field(56; "Loan Span"; Option)
        {
            OptionCaption = ' ,Short Term,Long Term';
            OptionMembers = " ","Short Term","Long Term";
        }
        field(57; "No. Series"; Code[20])
        {
        }
        field(58; "Outstanding Balance"; Decimal)
         {
        //     CalcFormula = Sum("Credit Ledger Entry".Amount WHERE("Loan No" = FIELD("Loan No."),
        //                                                           "Transaction Type" = FILTER(Loan | Repayment),
        //                                                           "Posting Date" = FIELD("Date Filter"),
        //                                                           "Document No." = FIELD("Document No. Filter")));
        //     Editable = false;
        //     FieldClass = FlowField;

        //     trigger OnValidate()
        //     begin
        //         //GetPreviosRec(xRec."Outstanding Balance");
        //     end;
        // }
        // field(59; "Outstanding Interest"; Decimal)
        // {
        //     CalcFormula = Sum("Credit Ledger Entry".Amount WHERE("Loan No" = FIELD("Loan No."),
        //                                                           "Transaction Type" = FILTER("Interest Due" | "Interest Paid"),
        //                                                           "Posting Date" = FIELD("Date Filter")));
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        // field(60; "Outstanding Bills"; Decimal)
        // {
        //     CalcFormula = Sum("Credit Ledger Entry".Amount WHERE("Loan No" = FIELD("Loan No."),
        //                                                           "Transaction Type" = FILTER(Bills),
        //                                                           "Posting Date" = FIELD("Date Filter")));
        //     Editable = false;
        //     FieldClass = FlowField;
        }
        field(61; "All Posting through Savings Ac"; Boolean)
        {
        }
        field(62; "Loan Principle Repayment"; Decimal)
        {
        }
        field(63; "Loan Interest Repayment"; Decimal)
        {
        }
        field(64; "Employer Code"; Code[20])
        {
            TableRelation = Customer WHERE("Account Type" = CONST(Employer));
        }
        field(65; "Compute Interest Due on Postin"; Option)
        {
            OptionCaption = ' ,Full Interest,Pro-rata';
            OptionMembers = " ","Full Interest","Pro-rata";
        }
        field(66; "Discounted Loan No."; Code[50])
        {
        }
        field(67; "Discounted Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                //IF xRec."Discounted Amount">0 THEN
                //  ERROR("DiscErr:" ,xRec."Discounted Amount");

                GenSetup.Get;
                TotalDisc := 0;
                NetAmt := 0;
                ProdFac.Reset;
                ProdFac.SetRange(ProdFac."Type of Discounting", ProdFac."Type of Discounting"::"Loan Discounting");
                if ProdFac.Find('-') then begin
                    LoanApp.Reset;
                    LoanApp.SetRange(LoanApp."Member No.", "Member No.");
                    LoanApp.SetRange(LoanApp."Loan Product Type", ProdFac."Product ID");
                    LoanApp.SetFilter(LoanApp."Outstanding Balance", '>0');
                    if LoanApp.Find('-') then begin
                        repeat
                            LoanApp.CalcFields("Outstanding Balance");
                            TotalDisc := TotalDisc + LoanApp."Outstanding Balance";
                        until LoanApp.Next = 0;
                    end;
                end;

                if GenSetup."Maximum Discounting %" <= 0 then
                    Error(Text016);
                // NetAmt := LoansProcess.ComputeCharges("Approved Amount", "Loan Product Type", "Loan No.", 0);
                //MESSAGE('Appr %1 Dis Amt %2 NetAmt %3 Total Disc %4',"Approved Amount","Discounted Amount",NetAmt,TotalDisc);
                if TotalDisc + "Discounted Amount" > NetAmt * GenSetup."Maximum Discounting %" * 0.01 then
                    Error(Text008, GenSetup."Maximum Discounting %");
            end;
        }
        field(68; "Share Boosted Amount"; Decimal)
        {
        }
        field(69; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin

            end;
        }
        field(70; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin

            end;
        }
        field(71; "Disbursement Destination"; Option)
        {
            OptionCaption = 'FOSA Account,Other Channels';
            OptionMembers = "FOSA Account","Other Channels";

            trigger OnLookup()
            begin
                if "Disbursement Destination" = "Disbursement Destination"::"Other Channels" then
                    "All Posting through Savings Ac" := false;
            end;
        }
        field(72; "Already Suggested"; Boolean)
        {
        }
        field(73; "Responsibility Centre"; Code[20])
        {
            Description = 'LookUp to Responsibility Center BR';
            TableRelation = "Responsibility Center";
        }
        field(74; "Recovered Loan"; Code[20])
        {
            Description = 'To link loan recovered from Guarantors';
        }
        field(75; "Batch No."; Code[20])
        {
            // TableRelation = "Loan Disbursement Header"."No." WHERE(Status = FILTER(Open),
            //                                                         Posted = CONST(false),
            //                                                         "Loan Product Type" = FIELD("Loan Product Type"));

            trigger OnValidate()
            begin
                if Status <> Status::Approved then
                    Error(Text017);

               
                "Disbursement Date" := Today;
            end;
        }
        field(76; "Self Guarantee"; Boolean)
        {

            trigger OnValidate()
            begin
               


                //Check own balance
                SelfGuaBal := 0;
                Loan.Reset;
                Loan.SetRange(Loan."Member No.", "Member No.");
                //Loan.SETRANGE(Loan."Self Guarantee",TRUE);
                //Loan.SETRANGE("Loan Span",Loan."Loan Span"::"Long Term");
                Loan.SetFilter(Loan."Outstanding Balance", '>0');
                if Loan.Find('-') then begin
                    repeat
                        Loan.CalcFields("Outstanding Balance");
                        SelfGuaBal := SelfGuaBal + Loan."Outstanding Balance" - OffsetBalance;
                    until Loan.Next = 0;
                end;
            end;
        }
        field(77; "Appraisal Fee"; Decimal)
        {
        }
        field(78; "Recovery Priority"; Integer)
        {
        }
        field(79; "Member Deposits"; Decimal)
        {
            Editable = false;
        }
        field(80; "Cost Value of House"; Decimal)
        {

            trigger OnValidate()
            begin
                "Amount To Disburse" := 0;
                "Requested Amount" := 0;
                "Approved Amount" := 0;
            end;
        }
        field(81; "Retirement/Expiry Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Retirement/Expiry Date" <> 0D then
                    if "Retirement/Expiry Date" < Today then Error('This date cannot be less than today');

                Validate(Installments);
            end;
        }
        field(82; "Three Months Payslip"; Boolean)
        {
        }
        field(83; "Mortgage Protection Policy"; Boolean)
        {
        }
        field(84; "Mortgage Protection Policy No"; Code[10])
        {
        }
        field(85; "Domestic Insurance Cover"; Boolean)
        {
        }
        field(86; "Domestic Insurance Cover No"; Code[10])
        {
        }
        field(87; "Employer Introduction Letter"; Boolean)
        {
        }
        field(88; "Six Months Bank Statement"; Boolean)
        {
        }
        field(89; "National ID"; Boolean)
        {
        }
        field(90; "KRA PIN Copy"; Boolean)
        {
        }
        field(91; "KRA PIN"; Code[12])
        {
        }
        field(92; "Vendor Letter/Sale Agreement"; Boolean)
        {
        }
        field(93; "ID No."; Code[10])
        {

            trigger OnValidate()
            begin
                TestField("Member No.");
                "ID No." := DelChr("ID No.", '=', 'A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?|+|-|_');

                //check if ID is same of the member
                Mem.Reset;
                Mem.SetRange("No.", "Member No.");
                if Mem.Find('-') then
                    if Mem."ID No." <> "ID No." then Error('ID No does not match record for member %1', "Member No.");
            end;
        }
        field(94; "Mortgage Loan"; Boolean)
        {
        }
        field(95; "Title/Lease Provided"; Boolean)
        {
        }
        field(96; "Title/Lease No"; Code[50])
        {
        }
        field(97; "Injury Benefit Insurance"; Boolean)
        {
        }
        field(98; "Drawdown Schedule"; Boolean)
        {
        }
        field(100; "Mortgage Insurance Amount"; Decimal)
        {
        }
        field(101; "Title Lease Provide SL"; Boolean)
        {
        }
        field(102; "Lease No SL"; Code[20])
        {
        }
        field(103; "Sale Agreement"; Boolean)
        {
        }
        field(104; "ID No.SL"; Code[10])
        {
        }
        field(105; "20% Payment Slip"; Boolean)
        {
        }
        field(106; "KRA PIN No.SL"; Code[12])
        {
        }
        field(107; "Property Cost Value"; Decimal)
        {
        }
        field(108; "Land Valuation Done"; Boolean)
        {
        }
        field(109; "Title Deed"; Boolean)
        {
        }
        field(50004; "Relationship Manager"; Code[10])
        {
            TableRelation = "HR Employees" WHERE(Status = FILTER(Active));
        }
        field(50005; "Appraisal Parameter Type"; Option)
        {
            OptionMembers = "Check Off",Salary,"Corporate or Business";
        }
        field(50006; "Employer Loan No."; Code[20])
        {
        }
        field(50007; "Client Bank Code"; Code[10])
        {

            trigger OnValidate()
            begin
                "Client Bank Name" := '';
                "Client Account No" := '';

               
            end;
        }
        field(50008; "Client Bank Name"; Text[50])
        {
            Editable = false;
        }
        field(50009; "Client Account No"; Code[20])
        {
        }
        // field(50010; "External STO  Amount"; Decimal)
        // {
        //     CalcFormula = Sum("Appraisal Salary Details".Amount WHERE("Client Code" = FIELD("Member No."),
        //                                                                Type = FILTER("Other Allowances"),
        //                                                                Code = FILTER('7.1EXTERNAL BANK STO'),
        //                                                                "Loan No" = FIELD("Loan No.")));
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        field(50011; "External STO Effective Date"; Option)
        {
            OptionCaption = ' ,03rd,05th,10th,15th,20th,25th,28th';
            OptionMembers = " ","03rd","05th","10th","15th","20th","25th","28th";
        }
        field(50012; "Member Category"; Code[10])
        {
            CalcFormula = Lookup(Members."Member Category" WHERE("No." = FIELD("Member No.")));
            FieldClass = FlowField;
            TableRelation = "Member Category";
        }
        field(50050; "Mobile Loan"; Boolean)
        {
        }
        field(50051; "Last Mobile Loan Rem. Date"; Date)
        {
        }
        field(50055; "Mobile Loan Reminder"; Option)
        {
            OptionMembers = " ","1","2","3","4","5","6","7","8","9","10";
        }
        // field(50056; "Last Repayment Date"; Date)
        // {
        //     CalcFormula = Max("Credit Ledger Entry"."Posting Date" WHERE("Loan No" = FIELD("Loan No."),
        //                                                                   "Posting Date" = FIELD("Date Filter"),
        //                                                                   "Transaction Type" = FILTER(Repayment | "Interest Paid"),
        //                                                                   Reversed = FILTER(false),
        //                                                                   Amount = FILTER(< 0)));
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        field(50057; "Maximum Limit"; Decimal)
        {
        }
        field(50058; "Fosa Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - Sum("Savings Ledger Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("Disbursement Account No"),
                                                                            "Posting Date" = FIELD("Date Filter")));
            Caption = 'Balance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50059; "Next Penalty Date"; Date)
        {
        }
        field(39004241; "Bank Transfer Mode"; Code[20])
        {
        }
        field(39004242; "Sales Agent"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(39004243; "Loan Linking No."; Code[20])
        {
        }
        field(39004244; "Sent Online"; Boolean)
        {
        }
        field(39004245; "CRB Rating"; Integer)
        {
        }
        field(39004246; "Purpose of Loan"; Code[20])
        {
        }
        field(39004247; "Loan Appraised By"; Code[50])
        {
        }
        field(39004248; "Loan Recovery No."; Code[20])
        {
        }
        field(39004249; "SMS Sent"; Boolean)
        {
        }
        field(39004250; "Available Credit Limit"; Decimal)
        {
        }
        field(39004251; "Loan Appl.form No."; Code[50])
        {
            Editable = false;
        }
        field(39004252; "CRM Application No."; Code[50])
        {
            TableRelation = "CRM Application"."No." WHERE("Application Type" = CONST("Loan Application"),
                                                           Created = CONST(false),
                                                           Case360_Docs = CONST(1),
                                                           "Approval Status" = FILTER(Open | Deffered));

            trigger OnValidate()
            begin
                LoansApp.Reset;
                LoansApp.SetRange(LoansApp."CRM Application No.", "CRM Application No.");
                //LoansApp.SETRANGE(LoansApp.Posted,FALSE);
                if LoansApp.Find('-') then begin
                    if "CRM Application No." <> '' then
                        Error(Err002, LoansApp."Loan No.");
                end;

                CRMLoanApplication.Reset;
                CRMLoanApplication.SetRange(CRMLoanApplication."No.", "CRM Application No.");
                if CRMLoanApplication.Find('-') then begin
                    "Loan Appl.form No." := CRMLoanApplication."Application Form No.";
                    "CRM Captured by" := CRMLoanApplication."Captured By";
                    //"CRM Date":=CRMLoanApplication.Date;
                    "CRM Captured Time" := CRMLoanApplication.Date;
                    "Member No." := CRMLoanApplication."Member No.";
                    "Requested Amount" := CRMLoanApplication."Requested Amount";
                    "Loan Product Type" := CRMLoanApplication."Product Factory";
                    Validate("Member No.");
                    Validate("Loan Product Type");
                end;
            end;
        }
        field(39004253; "CRM Captured by"; Code[100])
        {
            Editable = false;
        }
        field(39004254; "CRM Date"; Date)
        {
            Editable = false;
        }
        field(39004255; "CRM Created"; Boolean)
        {
            Editable = false;
        }
        field(39004256; "Comment for Exemptions"; Text[250])
        {
        }
        field(39004257; "Total Charges and Commissions"; Decimal)
        {
        }
        field(39004258; "Document No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(39004259; "Loans - Deposit Purchase"; Decimal)
        {
            Caption = '<Share Boosting- Purchase>';

            trigger OnValidate()
            begin
                if "Loan Product Type" <> '114' then begin
                    if "Loans - Deposit Purchase" >= "Member Deposits" * 0.5 then Error(Txt001, "Loans - Deposit Purchase", "Member Deposits");
                end;
            end;
        }
        field(39004260; "CRM Captured Time"; DateTime)
        {
        }
        field(39004261; "Member Segment"; Text[50])
        {
        }
        field(39004262; "Loan BDE"; Code[50])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = IF ("BDE Type" = FILTER(BDE)) "HR Employees"."No."
            ELSE
            "Salesperson/Purchaser".Code;
        }
        field(39004263; "Loan BDE Paid"; Boolean)
        {
        }
        field(39004264; "BDE Type"; Option)
        {
            OptionCaption = 'BDE,Others';
            OptionMembers = BDE,Others;
        }
        field(39004265; "Dummy Appraisal"; Boolean)
        {
        }
        field(39004266; "Net Amount"; Decimal)
        {
        }
        field(39004267; "Picked Mobile Loan"; Boolean)
        {
            Editable = false;
        }
        field(39004268; "Repayment Method Alert"; Boolean)
        {
            Editable = false;
        }
        field(39004269; "Repayment Alert"; Boolean)
        {
            Editable = false;
        }
        field(39004270; "Non Performance Alert"; Boolean)
        {
        }
        field(39004271; "Penalty Charge"; Boolean)
        {
        }
        field(39004272; "Employer Balance"; Decimal)
        {
        }
        field(39004274; "Penalty Frequency"; Integer)
        {
        }
        field(39004275; "Total Balance"; Decimal)
        {
        //     CalcFormula = Sum("Credit Ledger Entry".Amount WHERE("Loan No" = FIELD("Loan No."),
        //                                                           "Transaction Type" = FILTER(Loan | Repayment | "Interest Due" | "Interest Paid"),
        //                                                           "Posting Date" = FIELD("Date Filter"),
        //                                                           "Document No." = FIELD("Document No. Filter")));
        //     Editable = false;
        //     FieldClass = FlowField;

        //     trigger OnValidate()
        //     begin
        //         //GetPreviosRec(xRec."Outstanding Balance");
        //     end;
        // }
        // field(39004276; "Total TopUp"; Decimal)
        // {
        //     CalcFormula = Sum("Loans Top up"."Principle Top Up" WHERE("Loan No." = FIELD("Loan No."),
        //                                                                "Client Code" = FIELD("Member No.")));
        //     FieldClass = FlowField;
        }
        field(39004277; "Demand Letter Status"; Option)
        {
            OptionCaption = ' ,Notice 1,Notice 2,Notice 3';
            OptionMembers = " ","Notice 1","Notice 2","Notice 3";
        }
        field(39004278; "Demand Letter Date"; Date)
        {
        }
        // field(39004279; "Total Loan Balance"; Decimal)
        // {
        //     CalcFormula = Sum("Credit Ledger Entry".Amount WHERE("Loan No" = FIELD("Loan No."),
        //                                                           "Transaction Type" = FILTER("Interest Due" | "Interest Paid" | Loan | Repayment),
        //                                                           "Posting Date" = FIELD("Date Filter")));
        //     FieldClass = FlowField;
        // }
        // field(39004280; "Last Pay Date"; Date)
        // {
        //     CalcFormula = Max("Credit Ledger Entry"."Posting Date" WHERE("Loan No" = FIELD("Loan No."),
        //                                                                   "Posting Date" = FIELD("Date Filter")));
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        field(39004281; "Mark For Listing"; Boolean)
        {
        }
        field(39004282; "Loan Amount"; Decimal)
         {
        //     CalcFormula = Sum("Credit Ledger Entry".Amount WHERE("Loan No" = FIELD("Loan No."),
        //                                                           "Transaction Type" = FILTER(Loan),
        //                                                           "Posting Date" = FIELD("Date Filter"),
        //                                                           "Document No." = FIELD("Document No. Filter")));
        //     Editable = false;
        //     FieldClass = FlowField;

        //     trigger OnValidate()
        //     begin
        //         //GetPreviosRec(xRec."Outstanding Balance");
        //     end;
        // }
        // field(39004283; "Interest Paid"; Decimal)
        // {
        //     CalcFormula = Sum("Credit Ledger Entry".Amount WHERE("Loan No" = FIELD("Loan No."),
        //                                                           "Transaction Type" = FILTER("Interest Paid"),
        //                                                           "Posting Date" = FIELD("Date Filter"),
        //                                                           "Document No." = FIELD("Document No. Filter")));
        //     Editable = false;
        //     FieldClass = FlowField;

        //     trigger OnValidate()
        //     begin
        //         //GetPreviosRec(xRec."Outstanding Balance");
        //     end;
        // }
        // field(39004284; "Principle Paid"; Decimal)
        // {
        //     CalcFormula = Sum("Credit Ledger Entry".Amount WHERE("Loan No" = FIELD("Loan No."),
        //                                                           "Transaction Type" = FILTER(Repayment),
        //                                                           "Posting Date" = FIELD("Date Filter"),
        //                                                           "Document No." = FIELD("Document No. Filter")));
        //     Editable = false;
        //     FieldClass = FlowField;

        //     trigger OnValidate()
        //     begin
        //         //GetPreviosRec(xRec."Outstanding Balance");
        //     end;
        }
        field(39004285; "Approved By"; Code[50])
        {
            Editable = false;
        }
        field(39004286; "Main Sector"; Code[20])
        {
        }
        field(39004287; "Main Sector Description"; Text[100])
        {
        }
        field(39004288; "Sub Sector Level1"; Code[20])
        {
        }
        field(39004289; "Sub Sector Level1 Description"; Text[100])
        {
        }
        field(39004290; "Sub Sector Level2"; Code[20])
        {

           
        }
        field(39004291; "Sub Sector Level2 Description"; Text[100])
        {
        }
        field(39004292; "Posted By"; Code[50])
        {
        }
        field(39004293; "Details Verified By"; Code[50])
        {
        }
        field(39004294; "Loan Defferal Reason"; Code[100])
        {

            trigger OnValidate()
            begin
                if UserSetup.Get(UpperCase(UserId)) then begin
                    "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                    "Responsibility Centre" := UserSetup."Responsibility Centre";
                end;
                CellNo := '';

                DimensionValue.Reset;
                DimensionValue.SetRange(Code, "Global Dimension 2 Code");
                if DimensionValue.Find('-') then begin
                    CellNo := DimensionValue."Phone No.";
                end;

              
            end;
        }
        field(39004295; "SAD No."; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Loan No.")
        {
            Clustered = true;
        }
        key(Key2; "CRM Application No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

        if Status = Status::Approved then
            Error('A loan cannot be deleted once it has been approved');
    end;

    trigger OnInsert()
    begin

        if "Mobile Loan" then begin
            if ProdFac.Get("Loan Product Type") then begin
                if ProdFac."Loan Nos" <> '' then begin

                    if "Loan No." = '' then begin
                        MembNoSeries.Get;
                        NoSeriesMgt.InitSeries(ProdFac."Loan Nos", xRec."No. Series", 0D, "Loan No.", "No. Series");
                    end;
                end
                else begin

                    if "Loan No." = '' then begin
                        MembNoSeries.Get;
                        MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                        NoSeriesMgt.InitSeries(MembNoSeries."Loan Nos.", xRec."No. Series", 0D, "Loan No.", "No. Series");
                    end;
                end;
            end;
        end
        else begin

            if "Loan No." = '' then begin
                MembNoSeries.Get;
                MembNoSeries.TestField(MembNoSeries."Loan Nos.");
                NoSeriesMgt.InitSeries(MembNoSeries."Loan Nos.", xRec."No. Series", 0D, "Loan No.", "No. Series");

                if (CalcDate('-CM+15D', Today)) > Today then
                    "Disbursement Date" := (CalcDate('-CM+15D', Today)) else
                    "Disbursement Date" := (CalcDate('CM', Today));


            end;


            if UserSetup.Get(UpperCase(UserId)) then begin
                "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                "Responsibility Centre" := UserSetup."Responsibility Centre";
            end;
        end;



        "Application Date" := Today;
        Advice := true;
        "All Posting through Savings Ac" := true;
        "Captured By" := UpperCase(UserId);
    end;

    trigger OnModify()
    begin
        /*
        IF ("Discounted Amount"=xRec."Discounted Amount") AND ("Employer Loan No."=xRec."Employer Loan No.")AND ("Batch No."=xRec."Batch No.")THEN BEGIN
        IF Posted THEN BEGIN
           ERROR('A loan cannot be modified once it has been posted');
        END;
        
        IF "Employer Loan No."=xRec."Employer Loan No." THEN BEGIN
        IF (Status=Status::Approved) OR (Status=Status::Pending) THEN
          ERROR('Loan is not open for modification');
         END;
        END;  //
        */
        if "Loan No." = UserId then
            "Dummy Appraisal" := true;

    end;

    trigger OnRename()
    begin
        if Status = Status::Approved then
            Error('A loan cannot be renamed once it has been approved');
    end;

    var
       
        MembNoSeries: Record "Credit Nos. Series";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ProdFac: Record "Product Factory";
        SavAcc: Record "Savings Accounts";
        LoanApp: Record Loans;
        Mem: Record Members;
        Credit: Record "Credit Accounts";
        TotalMRepay: Decimal;
        LPrincipal: Decimal;
        LInterest: Decimal;
        InterestRate: Decimal;
        LoanAmount: Decimal;
        RepayPeriod: Integer;
        LBalance: Decimal;
      
        "DiscErr:": Label 'Loan is already discounted by %1';
        ShareBoostComm: Decimal;
        "Shares Boosted": Boolean;
        DimMgt: Codeunit DimensionManagement;
        "InactiveErr:": Label 'This member account is not active';
        LoanAmountErr: Label 'Amount applied for this product is not within allowed margins Min %1 Max %2';
        InstallmentsErr: Label 'Number of installments must be greater than Zero.';
        DateErr: Label 'The date is invalid. It should not be in the past';
        DisbErr: Label 'The amount to disburse cannot be greater than or equal to approved amount';
        ApprovedAmtErr: Label 'The approved amount cannot be greater than requested amount';
        AmountToDisb: Label 'Amount to disburse cannot be greater than approved amount';
        Text002: Label 'Amount to disburse must be equal to amount approved';
      
        Text003: Label 'This member has a loan which has not be repaid %1';
        Text004: Label 'This member has a loan in arrears %1';
        ClientAge: Text;
      
        Text005: Label 'This Member age is less than the limit of %1';
        ClientAgeValue: Integer;
        ClientAgePart: Text;
        ProdMinAgeText: Text;
        ProdMinAge: Integer;
        UserSetup: Record "User Setup";
        SavLedger: Record "Savings Ledger Entry";
        GenSetup: Record "General Set-Up";
        NoOfDays: Integer;
        NoOfMonths: Decimal;
        Text006: Label 'You cannot exceed the maximum installments';
        InstalmentPeriods: DateFormula;
        IntstallMentPeriodText: Text;
       
        PeriodStartDate: array[6] of Date;
        StartDate: Date;
       
        BusDateFilter: Text;
        LowerDateLimit: Date;
        UpperDateLimit: Date;
        LastMonthDate: Date;
       
        SavingsAccounts: Record "Savings Accounts";
        Text007: Label 'You cannot apply this product without an active Fixed Deposit';
        Err008: Label 'You cannot apply more than Amount Fixed';
      
        ErrGua: Label 'You cannot self guarantee where you have guaranteed running loans';
        TotalDisc: Decimal;
        Text008: Label 'You cannot discount above %1 Percent of the approved amount';
       
        EndDateSalo: Date;
        Text009: Label 'Salary Must be through the SACCO to get this loan';
        Text010: Label 'This member is from another sacco excempted from minimum membership limit';
        Text011: Label 'This member has lower deposits of %1 than expected of deposits of %2 ';
        InterestErrorTxt: Label 'Interest Rate is not within allowed range.';
       
        NetAmt: Decimal;
        Text012: Label 'The applicant is a defaulter - Loan No. %1';
       
        Text013: Label 'The member has a loan recocered from guarantors refference %1';
       
        Text014: Label 'The member must be remmitting checkoff to the organization to qualify';
        Loan: Record Loans;
        BalGuara: Decimal;
        SelfGuaBal: Decimal;
        Text015: Label 'The requested amount is more than availabe deposit balance for self guarantee';
        MaxSelfGuar: Decimal;
        Text016: Label 'Maximum discounting percentage allowable must be defined';
        Text017: Label 'The loan must be approved before assigning a batch';
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        LoansApp: Record Loans;
        CRMLoanApplication: Record "CRM Application";
        Err002: Label 'CRM application is already in use by Loan No. %1';
        AmortisedInt: Decimal;
       
        Err005: Label 'You cannot change batch no, the batch has alreay been approved';
        DimensionValue: Record "Dimension Value";
        CellNo: Code[20];
        OffsetBalance: Decimal;
        
        Txt001: Label 'Share Boosted Amount:%1  is greater than 50% of  member deposit %2.';
        BatchEditable: Boolean;

    local procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::Loans, "Loan No.", FieldNumber, ShortcutDimCode);
        Modify;
    end;

    local procedure AvailableCreditLimit()
    begin
        "Amount To Disburse" := xRec."Amount To Disburse";
    end;

  
 

    local procedure ClearMortgageDate()
    begin
        "Three Months Payslip" := false;
        "Mortgage Protection Policy" := false;
        "Mortgage Protection Policy No" := '';
        "Domestic Insurance Cover" := false;
        "Domestic Insurance Cover No" := '';
        "Employer Introduction Letter" := false;
        "Six Months Bank Statement" := false;
        "National ID" := false;
        "ID No." := '';
        "KRA PIN" := '';
        "KRA PIN Copy" := false;
        "Vendor Letter/Sale Agreement" := false;
        "Mortgage Insurance Amount" := 0;
        "Title/Lease Provided" := false;
        "Injury Benefit Insurance" := false;
        "Drawdown Schedule" := false;
        "Title/Lease No" := '';
    end;
}

