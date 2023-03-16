table 52185824 "Membership closure"
{
    //DrillDownPageID = "Open Closure List";
    //LookupPageID = "Open Closure List";

    fields
    {
        field(1; "No."; Code[10])
        {
        }
        field(2; "Member No."; Code[20])
        {
            TableRelation = Members;

            trigger OnValidate()
            begin
                "Staff No." := '';
                if MembersII.Get("Member No.") then begin
                    //MembersII.TESTFIELD(Retiree,TRUE);
                    //MembersII.TESTFIELD("Employer Code",'99');


                    if "Closure Type" = "Closure Type"::"Withdrawal - Partial" then begin
                        "Loans Option" := "Loans Option"::All;
                        "Close Account" := "Close Account"::All;
                    end;
                    AccountClosureLine.Reset;
                    AccountClosureLine.SetRange("No.", Rec."No.");
                    AccountClosureLine.SetRange("Member No.", Rec."Member No.");
                    if AccountClosureLine.Find('-') then begin
                        AccountClosureLine.DeleteAll;
                    end;
                    //Check Gurantorship

                    Counts := 0;
                    Membershipclosure.Reset;
                    Membershipclosure.SetRange("Member No.", "Member No.");
                    Membershipclosure.SetRange(Posted, false);
                    Membershipclosure.SetFilter("No.", '<>%1', Rec."No.");
                    if Membershipclosure.Find('-') then begin
                        repeat
                            if (Membershipclosure.Status = Membershipclosure.Status::Approved) or
                                (Membershipclosure.Status = Membershipclosure.Status::Open) or
                                (Membershipclosure.Status = Membershipclosure.Status::Pending) then begin
                                Counts += 1;
                            end;
                        until Membershipclosure.Next = 0;
                    end;


                    if Counts > 0 then
                        Error(Err0005);

                    //TESTFIELD("Closure Type");



                    /*

                    //Counts:=0;
                    ReactivateDeactivateHeader.RESET;
                    ReactivateDeactivateHeader.SETRANGE(ReactivateDeactivateHeader."Account No.","Account No.");
                    //ReactivateDeactivateHeader.SETRANGE(ReactivateDeactivateHeader.Status,Status::Open, Status::Pending);
                    IF ReactivateDeactivateHeader.FIND('-') THEN BEGIN
                     REPEAT
                     IF (ReactivateDeactivateHeader.Status=ReactivateDeactivateHeader.Status::Open) OR
                     (ReactivateDeactivateHeader.Status=ReactivateDeactivateHeader.Status::Pending) THEN
                     BEGIN
                     Counts+=1;
                     END;
                     UNTIL ReactivateDeactivateHeader.NEXT=0;
                    END;
                      IF Counts > 1 THEN
                       ERROR(MultipleApplicationsError);
                       */




                    if ("Closure Type" = "Closure Type"::"Withdrawal - Normal") or ("Closure Type" = "Closure Type"::"Withdrawal - Partial") then begin
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange("Member No.", "Member No.");
                        SavingsAccounts.SetRange("Product Category", SavingsAccounts."Product Category"::"Deposit Contribution");
                        if SavingsAccounts.Find('-') then begin
                            LoanGuarantorsandSecurity.Reset;
                            LoanGuarantorsandSecurity.SetRange("Savings Account No./Member No.", SavingsAccounts."No.");
                            LoanGuarantorsandSecurity.SetRange(Substituted, false);
                            LoanGuarantorsandSecurity.SetRange("Self Guarantee", false);
                            if LoanGuarantorsandSecurity.Find('-') then begin
                                repeat
                                    if Loans.Get(LoanGuarantorsandSecurity."Loan No") then begin
                                        Loans.CalcFields("Outstanding Balance");
                                        if Loans."Outstanding Balance" > 0 then
                                            Error(Err001, LoanGuarantorsandSecurity."Loan No");
                                    end;
                                until LoanGuarantorsandSecurity.Next = 0;
                            end;

                        end;
                    end;



                    //Alert MemberwithdrawalNotice
                    case "Closure Type" of
                        "Closure Type"::"Withdrawal - Normal":
                            begin

                                MemberwithdrawalNotice.Reset;
                                MemberwithdrawalNotice.SetRange("Member No.", "Member No.");
                                MemberwithdrawalNotice.SetRange(Status, MemberwithdrawalNotice.Status::Approved);
                                if MemberwithdrawalNotice.Find('+') then begin
                                    if MemberwithdrawalNotice."Maturity Date" > Today then
                                        Error(Txt0001, MemberwithdrawalNotice."Maturity Date");
                                    "Maturity Date" := MemberwithdrawalNotice."Maturity Date";
                                    "Notice Number" := MemberwithdrawalNotice."No.";
                                    "Early Withdrawal" := MemberwithdrawalNotice."Early Withdrawal";
                                end else
                                    Error(Txt0002);

                            end;
                    end;

                    if Members.Get("Member No.") then begin
                        "Member Name" := Members.Name;
                        "ID No." := Members."ID No.";
                        "Staff No." := Members."Payroll/Staff No.";

                        "Application Date" := Today;
                        //"Closure Type":="Closure Type"::" ";
                        "Close Account" := "Close Account"::" ";
                        "Loans Option" := "Loans Option"::" ";
                        if "Closure Type" = "Closure Type"::"Withdrawal - Partial" then begin
                            "Loans Option" := "Loans Option"::All;
                            "Close Account" := "Close Account"::All;
                            Validate("Loans Option");
                            Validate("Close Account");
                        end;
                        "Total Interest" := 0;
                        "Total Loan" := 0;
                        TotalSaving := 0;
                    end;

                    Loans.Reset;
                    Loans.SetRange("Member No.", "Member No.");
                    Loans.SetFilter("Outstanding Balance", '<0');
                    if Loans.Find('-') then begin
                        repeat
                            Loans.CalcFields("Outstanding Balance");
                            Error(Err0002, Loans."Loan No.", Loans."Outstanding Balance");
                        until Loans.Next = 0;
                    end;

                    Loans.Reset;
                    Loans.SetRange("Member No.", "Member No.");
                    Loans.SetFilter("Outstanding Interest", '<0');
                    if Loans.Find('-') then begin
                        repeat
                            Loans.CalcFields("Outstanding Interest");
                            Error(Err0003, Loans."Loan No.", Loans."Outstanding Interest");
                        until Loans.Next = 0;
                    end;

                end;

            end;
        }
        field(3; "Member Name"; Text[50])
        {
        }
        field(4; "Closing Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Closing Date" < Today then
                    Error(Err0004);
            end;
        }
        field(5; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(6; Posted; Boolean)
        {
        }
        field(7; "Total Loan"; Decimal)
        {
        }
        field(8; "Total Interest"; Decimal)
        {
        }
        field(9; "Member Savings"; Decimal)
        {
        }
        field(10; "No. Series"; Code[10])
        {
        }
        field(11; "Closure Type"; Option)
        {
            OptionCaption = ' ,Withdrawal - Normal,Withdrawal - Death,Withdrawal - Partial';
            OptionMembers = " ","Withdrawal - Normal","Withdrawal - Death","Withdrawal - Partial";

            trigger OnValidate()
            var
                RetereeLoanBalance: Decimal;
                RetereeDeposits: Decimal;
            begin
                Counts := 0;
                if "Closure Type" = "Closure Type"::"Withdrawal - Normal" then begin
                    Membershipclosure.Reset;
                    Membershipclosure.SetRange("Member No.", "Member No.");
                    Membershipclosure.SetRange(Membershipclosure."Closure Type", Membershipclosure."Closure Type"::"Withdrawal - Normal");
                    if Membershipclosure.Find('-') then begin
                        repeat
                            if (Membershipclosure.Status = Membershipclosure.Status::Approved) or
                              (Membershipclosure.Status = Membershipclosure.Status::Open) or
                              (Membershipclosure.Status = Membershipclosure.Status::Pending) then begin
                                Counts += 1;
                            end;
                        until Membershipclosure.Next = 0;
                    end;

                    if Membershipclosure.Count > 1 then
                        Error(Err0008);
                end;

                Counts := 0;
                if "Closure Type" = "Closure Type"::"Withdrawal - Partial" then begin
                    Membershipclosure.Reset;
                    Membershipclosure.SetRange("Member No.", "Member No.");
                    Membershipclosure.SetRange(Membershipclosure."Closure Type", Membershipclosure."Closure Type"::"Withdrawal - Normal");
                    if Membershipclosure.Find('-') then begin
                        repeat
                            if (Membershipclosure.Status = Membershipclosure.Status::Approved) or
                              (Membershipclosure.Status = Membershipclosure.Status::Open) or
                              (Membershipclosure.Status = Membershipclosure.Status::Pending) then begin
                                Counts += 1;
                            end;
                        until Membershipclosure.Next = 0;
                    end;
                    if Membershipclosure.Count > 1 then
                        Error(Err0008);
                end;


                GenSetup.Get;
                if "Closure Type" = "Closure Type"::"Withdrawal - Partial" then begin
                    "Loans Option" := "Loans Option"::All;
                    "Close Account" := "Close Account"::All;
                    if MembersII.Get("Member No.") then begin
                        MembersII.TestField(Retiree, true);
                        MembersII.TestField("Employer Code", '99');
                    end;



                    //Check if A reteree Member has guaranteed any member
                    if Members.Get("Member No.") then begin
                        if Members."Employer Code" = '99' then begin
                            Members.TestField(Retiree, true);
                            LoanGuarantors.Reset;
                            LoanGuarantors.SetRange("Member No", Rec."Member No.");
                            LoanGuarantors.SetRange(Substituted, false);
                            LoanGuarantors.SetRange("Self Guarantee", false);
                            LoanGuarantors.SetFilter("Outstanding Balance", '>0');
                            if LoanGuarantors.FindFirst then begin
                                Message(Err001, LoanGuarantors."Loan No");
                            end;

                            //check if Loans are more than Deposits
                            SavingsAccounts.Reset;
                            SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
                            SavingsAccounts.SetRange("Product Category", SavingsAccounts."Product Category"::"Deposit Contribution");
                            if SavingsAccounts.Find('-') then begin
                                SavingsAccounts.CalcFields("Balance (LCY)");
                                RetereeDeposits := SavingsAccounts."Balance (LCY)";
                            end;

                            Loans.Reset;
                            Loans.SetRange("Member No.", Rec."Member No.");
                            Loans.SetFilter("Total Loan Balance", '>%1', 0);
                            if Loans.FindFirst then begin
                                Loans.CalcFields("Total Loan Balance");
                                RetereeLoanBalance += Loans."Total Loan Balance";
                            end;

                            if RetereeLoanBalance > RetereeDeposits then Error(RetereeDepError);
                        end;

                        //check if Unllocated account has a balance
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange("Member No.", Members."No.");
                        SavingsAccounts.SetRange("Product Category", SavingsAccounts."Product Category"::"Unallocated Fund");
                        if SavingsAccounts.Find('-') then begin
                            SavingsAccounts.CalcFields("Balance (LCY)");
                            if SavingsAccounts."Balance (LCY)" > 0 then
                                Error('Kindly clear the balance of %1 in Unllocated account', SavingsAccounts."Balance (LCY)");
                        end;

                    end;
                    //end of Checking Reteree

                end;
                /*AccLine.RESET;
                AccLine.SETRANGE(AccLine."No.","No.");
                IF AccLine.FIND('-') THEN
                AccLine.DELETEALL;
                
                
                GenSetup.GET;
                
                IF  "Close Account"="Close Account"::All THEN BEGIN
                  SavingsAccounts.RESET;
                  SavingsAccounts.SETRANGE(SavingsAccounts."Member No.","Member No.");
                  IF SavingsAccounts.FIND('-') THEN BEGIN
                    REPEAT
                      IF SavingsAccounts."Loan Disbursement Account"=FALSE THEN BEGIN
                      IF ProductFactory.GET(SavingsAccounts."Product Type") THEN BEGIN
                        IF ProductFactory."Product Class Type"=ProductFactory."Product Class Type"::Savings THEN BEGIN
                        SavingsAccounts.CALCFIELDS(SavingsAccounts."Balance (LCY)");
                          IF ProductFactory."Product Category"<>ProductFactory."Product Category"::"Share Capital" THEN BEGIN
                            IF ProductFactory."Product Category"<>ProductFactory."Product Category"::"Registration Fee" THEN BEGIN
                            IF ProductFactory."Product Category"<>ProductFactory."Product Category"::Benevolent THEN BEGIN
                              IF ProductFactory."Product Category"<>ProductFactory."Product Category"::"Investment Account" THEN BEGIN
                
                              AccLine.INIT;
                              AccLine."No.":="No.";
                              AccLine."Account No.":=SavingsAccounts."No.";
                              AccLine.Name:=SavingsAccounts.Name;
                              AccLine."Product Type":=SavingsAccounts."Product Type";
                              AccLine.Balance:=SavingsAccounts."Balance (LCY)";
                              AccLine.Close:=TRUE;
                              AccLine.Blocked:=SavingsAccounts.Blocked;
                              AccLine."Member No.":=SavingsAccounts."Member No.";
                              AccLine.INSERT;
                
                                //CLosure Fee
                                //*Oketch AccountClosureFee:=ProdutFactory."Closure Fee";
                                AccountClosureFee:=0;
                                TransactionCharges.RESET;
                                TransactionCharges.SETRANGE(TransactionCharges."Transaction Type",ProductFactory."Closure Fee");
                                IF TransactionCharges.FIND('-') THEN BEGIN
                                REPEAT
                                Amount[1]:=0;
                                IF TransactionCharges."Charge Type"=TransactionCharges."Charge Type"::"% of Amount" THEN
                                Amount[1]:=("Member Savings"*TransactionCharges."Percentage of Amount")*0.01
                                ELSE
                                Amount[1]:=TransactionCharges."Charge Amount";
                
                                IF TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered THEN BEGIN
                                TransactionCharges.TESTFIELD(TransactionCharges."Staggered Charge Code");
                                TariffDetails.RESET;
                                TariffDetails.SETRANGE(TariffDetails.Code,TransactionCharges."Staggered Charge Code");
                                IF TariffDetails.FIND('-') THEN BEGIN
                                REPEAT
                                IF ("Member Savings" >= TariffDetails."Lower Limit") AND
                                    ("Member Savings"<= TariffDetails."Upper Limit") THEN BEGIN
                                IF TariffDetails."Use Percentage" THEN
                                  Amount[1]:="Member Savings"*TariffDetails.Percentage*0.01
                                ELSE
                                  Amount[1]:= TariffDetails."Charge Amount";
                                END;
                                UNTIL TariffDetails.NEXT =0;
                                END;
                                END;
                                Amount[2]+=Amount[1];
                                UNTIL TransactionCharges.NEXT = 0;
                                END;
                                AccountClosureFee:=Amount[2];
                                //*
                              TotalSaving:=TotalSaving+(SavingsAccounts."Balance (LCY)"-AccountClosureFee);
                              END ELSE BEGIN
                              {AccLine.INIT;
                              AccLine."No.":="No.";
                              AccLine."Account No.":=SavingsAccounts."No.";
                              AccLine.Name:=SavingsAccounts.Name;
                              AccLine."Product Type":=SavingsAccounts."Product Type";
                              AccLine.Balance:=SavingsAccounts."Balance (LCY)";
                              AccLine.Close:=TRUE;
                              AccLine.Blocked:=SavingsAccounts.Blocked;
                              AccLine."Member No.":=SavingsAccounts."Member No.";
                              AccLine.INSERT;
                
                              BBF:=BBF+(SavingsAccounts."Balance (LCY)"*(GenSetup."BBF Claim %"/100));
                              }
                              END;
                           END;
                           END;
                          END;
                         END;
                       END;
                       END;
                    UNTIL SavingsAccounts.NEXT=0;
                  END;
                
                  "Member Savings":=TotalSaving-"Premature Charges";
                
                END ELSE IF "Close Account"="Close Account"::Specific THEN BEGIN
                
                AccLine.RESET;
                AccLine.SETRANGE(AccLine."No.","No.");
                IF AccLine.FIND('-') THEN
                AccLine.DELETEALL;
                
                SavingsAccounts.RESET;
                SavingsAccounts.SETRANGE(SavingsAccounts."Member No.","Member No.");
                IF SavingsAccounts.FIND('-') THEN BEGIN
                    REPEAT
                    IF SavingsAccounts."Loan Disbursement Account"=FALSE THEN BEGIN
                      SavingsAccounts.CALCFIELDS(SavingsAccounts."Balance (LCY)");
                    IF ProductFactory.GET(SavingsAccounts."Product Type") THEN BEGIN
                    IF ProductFactory."Product Class Type"=ProductFactory."Product Class Type"::Savings THEN BEGIN
                      IF ProductFactory."Product Category"<>ProductFactory."Product Category"::"Share Capital" THEN BEGIN
                        IF ProductFactory."Product Category"<>ProductFactory."Product Category"::"Registration Fee" THEN BEGIN
                           IF ProductFactory."Product Category"<>ProductFactory."Product Category"::Benevolent THEN BEGIN
                            IF ProductFactory."Product Category"<>ProductFactory."Product Category"::"Investment Account" THEN BEGIN
                              AccLine.INIT;
                              AccLine."No.":="No.";
                              AccLine."Account No.":=SavingsAccounts."No.";
                              AccLine.Name:=SavingsAccounts.Name;
                              AccLine."Product Type":=SavingsAccounts."Product Type";
                              AccLine.Balance:=SavingsAccounts."Balance (LCY)";
                              AccLine."Member No.":=SavingsAccounts."Member No.";
                              AccLine.Blocked:=SavingsAccounts.Blocked;
                              //AccLine.Close:=TRUE;
                              AccLine.INSERT;
                              TotalSaving:=TotalSaving+SavingsAccounts."Balance (LCY)";
                            END ELSE BEGIN
                            {  AccLine.INIT;
                              AccLine."No.":="No.";
                              AccLine."Account No.":=SavingsAccounts."No.";
                              AccLine.Name:=SavingsAccounts.Name;
                              AccLine."Product Type":=SavingsAccounts."Product Type";
                              AccLine.Balance:=SavingsAccounts."Balance (LCY)";
                              AccLine.Close:=TRUE;
                              AccLine.Blocked:=SavingsAccounts.Blocked;
                              AccLine."Member No.":=SavingsAccounts."Member No.";
                              AccLine.INSERT;
                
                              BBF:=BBF+(SavingsAccounts."Balance (LCY)"*(GenSetup."BBF Claim %"/100));}
                            END;
                        END;
                        END;
                        END;
                      END;
                    END;
                    END;
                    UNTIL SavingsAccounts.NEXT=0;
                END;
                "Member Savings":=0;
                "Deposit Refundable":=0;
                "Premature Charges":=0;
                "WithDrawal Charge":=0;
                
                
                END ELSE BEGIN
                
                "Member Savings":=0;
                "Deposit Refundable":=0;
                "Premature Charges":=0;
                "WithDrawal Charge":=0;
                
                AccLine.RESET;
                AccLine.SETRANGE(AccLine."No.","No.");
                IF AccLine.FIND('-') THEN
                AccLine.DELETEALL;
                
                END;
                //MESSAGE('%1',LoanTotal);
                
                IF "Closure Type"="Closure Type"::"Withdrawal - Death" THEN BEGIN
                  "Deposit Refundable":="Member Savings"-"Premature Charges";
                  "Benevolent Fund":=GenSetup."Funeral Amount";
                  "WithDrawal Charge":="Deposit Refundable"*0.01;
                  "Premature Charges":=0;
                  END ELSE BEGIN
                  "Premature Charges":=GetPrematureCharge;
                  IF ("Member Savings"-(LoanTotal+IntTotal+"Premature Charges"))<0 THEN
                    "Deposit Refundable":=0
                    ELSE
                    "Deposit Refundable":="Member Savings"-(LoanTotal+IntTotal+GenSetup."Withdrawal Fee"+"Premature Charges");
                  "Benevolent Fund":=BBF;
                    "WithDrawal Charge":="Deposit Refundable"*0.01;
                  END;
                
                */
                if "Closure Type" <> "Closure Type"::"Withdrawal - Partial" then begin
                    MemberwithdrawalNotice.Reset;
                    MemberwithdrawalNotice.SetRange("Member No.", Rec."Member No.");
                    MemberwithdrawalNotice.SetRange(MemberwithdrawalNotice.Status, MemberwithdrawalNotice.Status::Approved);
                    if MemberwithdrawalNotice.Find('-') then
                        if Rec."Closure Type" <> MemberwithdrawalNotice."Notice Type" then
                            Error(Err0007);
                end else begin
                    "Loans Option" := "Loans Option"::All;
                    "Close Account" := "Close Account"::All;
                    Validate("Close Account");
                end;
                Validate("Loans Option");


                if "Closure Type" = "Closure Type"::"Withdrawal - Death" then begin
                    NextofKIN.Reset;
                    NextofKIN.SetRange("Account No", "Member No.");
                    if NextofKIN.IsEmpty then
                        Error(Err0006);
                end;
                Validate("Member No.");
                // if "Closure Type" = "Closure Type"::"Withdrawal - Partial" then LOanOpt;

            end;
        }
        field(12; "Application Date"; Date)
        {
        }
        field(13; "Deposit Refundable"; Decimal)
        {
        }
        field(14; Remarks; Text[50])
        {
        }
        field(15; "Close Account"; Option)
        {
            OptionCaption = ' ,All,Specific';
            OptionMembers = " ",All,Specific;

            trigger OnValidate()
            begin
                //VALIDATE("Closure Type");

                "Member Savings" := 0;
                TotalSaving := 0;

                AccLine.Reset;
                AccLine.SetRange(AccLine."No.", "No.");
                if AccLine.Find('-') then
                    AccLine.DeleteAll;


                GenSetup.Get;

                if "Close Account" = "Close Account"::All then begin
                    AccLine.Reset;
                    AccLine.SetRange(AccLine."No.", "No.");
                    if AccLine.Find('-') then
                        AccLine.DeleteAll;
                    if "Closure Type" = "Closure Type"::"Withdrawal - Partial" then begin
                        //Mbogi
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
                        SavingsAccounts.SetRange("Product Category", SavingsAccounts."Product Category"::"Deposit Contribution");
                        if SavingsAccounts.Find('-') then begin
                            repeat

                                if SavingsAccounts."Loan Disbursement Account" = false then begin
                                    if ProductFactory.Get(SavingsAccounts."Product Type") then begin
                                        if ProductFactory."Product Class Type" = ProductFactory."Product Class Type"::Savings then begin
                                            SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                                            if ProductFactory."Product Category" <> ProductFactory."Product Category"::"Share Capital" then begin
                                                if ProductFactory."Product Category" <> ProductFactory."Product Category"::"Registration Fee" then begin
                                                    if ProductFactory."Product Category" <> ProductFactory."Product Category"::Benevolent then begin
                                                        if ProductFactory."Product Category" <> ProductFactory."Product Category"::"Investment Account" then begin

                                                            AccLine.Init;
                                                            AccLine."No." := "No.";
                                                            AccLine."Account No." := SavingsAccounts."No.";
                                                            AccLine.Name := SavingsAccounts.Name;
                                                            AccLine."Product Type" := SavingsAccounts."Product Type";
                                                            AccLine.Balance := SavingsAccounts."Balance (LCY)";
                                                            AccLine.Close := true;
                                                            AccLine.Blocked := SavingsAccounts.Blocked;
                                                            AccLine."Member No." := SavingsAccounts."Member No.";
                                                            AccLine.Insert;

                                                            //CLosure Fee
                                                            //*Oketch AccountClosureFee:=ProdutFactory."Closure Fee";
                                                            AccountClosureFee := 0;
                                                            TransactionCharges.Reset;
                                                            TransactionCharges.SetRange(TransactionCharges."Transaction Type", ProductFactory."Closure Fee");
                                                            if TransactionCharges.Find('-') then begin
                                                                repeat
                                                                    Amount[1] := 0;
                                                                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" then
                                                                        Amount[1] := ("Member Savings" * TransactionCharges."Percentage of Amount") * 0.01
                                                                    else
                                                                        Amount[1] := TransactionCharges."Charge Amount";

                                                                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin
                                                                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                                                        TariffDetails.Reset;
                                                                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                                                        if TariffDetails.Find('-') then begin
                                                                            repeat
                                                                                if ("Member Savings" >= TariffDetails."Lower Limit") and
                                                                                    ("Member Savings" <= TariffDetails."Upper Limit") then begin
                                                                                    if TariffDetails."Use Percentage" then
                                                                                        Amount[1] := "Member Savings" * TariffDetails.Percentage * 0.01
                                                                                    else
                                                                                        Amount[1] := TariffDetails."Charge Amount";
                                                                                end;
                                                                            until TariffDetails.Next = 0;
                                                                        end;
                                                                    end;
                                                                    Amount[2] += Amount[1];
                                                                until TransactionCharges.Next = 0;
                                                            end;
                                                            AccountClosureFee := Amount[2];
                                                            //*
                                                            TotalSaving := TotalSaving + (SavingsAccounts."Balance (LCY)" - AccountClosureFee);
                                                        end else begin
                                                            /*AccLine.INIT;
                                                            AccLine."No.":="No.";
                                                            AccLine."Account No.":=SavingsAccounts."No.";
                                                            AccLine.Name:=SavingsAccounts.Name;
                                                            AccLine."Product Type":=SavingsAccounts."Product Type";
                                                            AccLine.Balance:=SavingsAccounts."Balance (LCY)";
                                                            AccLine.Close:=TRUE;
                                                            AccLine.Blocked:=SavingsAccounts.Blocked;
                                                            AccLine."Member No.":=SavingsAccounts."Member No.";
                                                            AccLine.INSERT;

                                                            BBF:=BBF+(SavingsAccounts."Balance (LCY)"*(GenSetup."BBF Claim %"/100));
                                                            */
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            //END;
                            until SavingsAccounts.Next = 0;
                        end;

                        "Member Savings" := TotalSaving - "Premature Charges";
                    end else begin
                        //Mbogi
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
                        if SavingsAccounts.Find('-') then begin
                            repeat

                                if SavingsAccounts."Loan Disbursement Account" = false then begin
                                    if ProductFactory.Get(SavingsAccounts."Product Type") then begin
                                        if ProductFactory."Product Class Type" = ProductFactory."Product Class Type"::Savings then begin
                                            SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                                            if ProductFactory."Product Category" <> ProductFactory."Product Category"::"Share Capital" then begin
                                                if ProductFactory."Product Category" <> ProductFactory."Product Category"::"Registration Fee" then begin
                                                    if ProductFactory."Product Category" <> ProductFactory."Product Category"::Benevolent then begin
                                                        if ProductFactory."Product Category" <> ProductFactory."Product Category"::"Investment Account" then begin

                                                            AccLine.Init;
                                                            AccLine."No." := "No.";
                                                            AccLine."Account No." := SavingsAccounts."No.";
                                                            AccLine.Name := SavingsAccounts.Name;
                                                            AccLine."Product Type" := SavingsAccounts."Product Type";
                                                            AccLine.Balance := SavingsAccounts."Balance (LCY)";
                                                            AccLine.Close := true;
                                                            AccLine.Blocked := SavingsAccounts.Blocked;
                                                            AccLine."Member No." := SavingsAccounts."Member No.";
                                                            AccLine.Insert;

                                                            //CLosure Fee
                                                            //*Oketch AccountClosureFee:=ProdutFactory."Closure Fee";
                                                            AccountClosureFee := 0;
                                                            TransactionCharges.Reset;
                                                            TransactionCharges.SetRange(TransactionCharges."Transaction Type", ProductFactory."Closure Fee");
                                                            if TransactionCharges.Find('-') then begin
                                                                repeat
                                                                    Amount[1] := 0;
                                                                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" then
                                                                        Amount[1] := ("Member Savings" * TransactionCharges."Percentage of Amount") * 0.01
                                                                    else
                                                                        Amount[1] := TransactionCharges."Charge Amount";

                                                                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin
                                                                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                                                        TariffDetails.Reset;
                                                                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                                                        if TariffDetails.Find('-') then begin
                                                                            repeat
                                                                                if ("Member Savings" >= TariffDetails."Lower Limit") and
                                                                                    ("Member Savings" <= TariffDetails."Upper Limit") then begin
                                                                                    if TariffDetails."Use Percentage" then
                                                                                        Amount[1] := "Member Savings" * TariffDetails.Percentage * 0.01
                                                                                    else
                                                                                        Amount[1] := TariffDetails."Charge Amount";
                                                                                end;
                                                                            until TariffDetails.Next = 0;
                                                                        end;
                                                                    end;
                                                                    Amount[2] += Amount[1];
                                                                until TransactionCharges.Next = 0;
                                                            end;
                                                            AccountClosureFee := Amount[2];
                                                            //*
                                                            TotalSaving := TotalSaving + (SavingsAccounts."Balance (LCY)" - AccountClosureFee);
                                                        end else begin
                                                            /*AccLine.INIT;
                                                            AccLine."No.":="No.";
                                                            AccLine."Account No.":=SavingsAccounts."No.";
                                                            AccLine.Name:=SavingsAccounts.Name;
                                                            AccLine."Product Type":=SavingsAccounts."Product Type";
                                                            AccLine.Balance:=SavingsAccounts."Balance (LCY)";
                                                            AccLine.Close:=TRUE;
                                                            AccLine.Blocked:=SavingsAccounts.Blocked;
                                                            AccLine."Member No.":=SavingsAccounts."Member No.";
                                                            AccLine.INSERT;

                                                            BBF:=BBF+(SavingsAccounts."Balance (LCY)"*(GenSetup."BBF Claim %"/100));
                                                            */
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            //END;
                            until SavingsAccounts.Next = 0;
                        end;

                        "Member Savings" := TotalSaving - "Premature Charges";
                    end;
                    //CurrPage.UPDATE;
                end else
                    if "Close Account" = "Close Account"::Specific then begin


                        AccLine.Reset;
                        AccLine.SetRange(AccLine."No.", "No.");
                        if AccLine.Find('-') then
                            AccLine.DeleteAll;

                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
                        if SavingsAccounts.Find('-') then begin
                            repeat
                                if SavingsAccounts."Loan Disbursement Account" = false then begin
                                    SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                                    if ProductFactory.Get(SavingsAccounts."Product Type") then begin
                                        if ProductFactory."Product Class Type" = ProductFactory."Product Class Type"::Savings then begin
                                            if ProductFactory."Product Category" <> ProductFactory."Product Category"::"Share Capital" then begin
                                                if ProductFactory."Product Category" <> ProductFactory."Product Category"::"Registration Fee" then begin
                                                    if ProductFactory."Product Category" <> ProductFactory."Product Category"::Benevolent then begin
                                                        if ProductFactory."Product Category" <> ProductFactory."Product Category"::"Investment Account" then begin
                                                            AccLine.Init;
                                                            AccLine."No." := "No.";
                                                            AccLine."Account No." := SavingsAccounts."No.";
                                                            AccLine.Name := SavingsAccounts.Name;
                                                            AccLine."Product Type" := SavingsAccounts."Product Type";
                                                            AccLine.Balance := SavingsAccounts."Balance (LCY)";
                                                            AccLine."Member No." := SavingsAccounts."Member No.";
                                                            AccLine.Blocked := SavingsAccounts.Blocked;
                                                            //AccLine.Close:=TRUE;
                                                            AccLine.Insert;
                                                            TotalSaving := TotalSaving + SavingsAccounts."Balance (LCY)";
                                                        end else begin
                                                            /*  AccLine.INIT;
                                                              AccLine."No.":="No.";
                                                              AccLine."Account No.":=SavingsAccounts."No.";
                                                              AccLine.Name:=SavingsAccounts.Name;
                                                              AccLine."Product Type":=SavingsAccounts."Product Type";
                                                              AccLine.Balance:=SavingsAccounts."Balance (LCY)";
                                                              AccLine.Close:=TRUE;
                                                              AccLine.Blocked:=SavingsAccounts.Blocked;
                                                              AccLine."Member No.":=SavingsAccounts."Member No.";
                                                              AccLine.INSERT;

                                                              BBF:=BBF+(SavingsAccounts."Balance (LCY)"*(GenSetup."BBF Claim %"/100));*/
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            until SavingsAccounts.Next = 0;
                        end;
                        "Member Savings" := 0;
                        "Deposit Refundable" := 0;
                        "Partial Deposit Refundable" := 0;
                        "Premature Charges" := 0;
                        "WithDrawal Charge" := 0;
                        //CurrPage.UPDATE;
                    end else begin

                        "Member Savings" := 0;
                        "Deposit Refundable" := 0;
                        "Partial Deposit Refundable" := 0;
                        "Premature Charges" := 0;
                        "WithDrawal Charge" := 0;

                        AccLine.Reset;
                        AccLine.SetRange(AccLine."No.", "No.");
                        if AccLine.Find('-') then
                            AccLine.DeleteAll;

                    end;
                //MESSAGE('%1',LoanTotal);

                if "Closure Type" = "Closure Type"::"Withdrawal - Death" then begin
                    "Deposit Refundable" := "Member Savings" - "Premature Charges";
                    "Partial Deposit Refundable" := "Deposit Refundable";
                    "Benevolent Fund" := GenSetup."Funeral Amount";
                    "WithDrawal Charge" := "Deposit Refundable" * 0.01;
                    "Premature Charges" := 0;
                end else begin
                    //"Premature Charges":=GetPrematureCharge; ****jeff not applicable
                    if ("Member Savings" - (LoanTotal + IntTotal + "Premature Charges")) < 0 then
                        "Deposit Refundable" := 0
                    else
                        "Deposit Refundable" := "Member Savings" - (LoanTotal + IntTotal + GenSetup."Withdrawal Fee" + "Premature Charges");
                    "Partial Deposit Refundable" := "Deposit Refundable";
                    "Benevolent Fund" := BBF;
                    "WithDrawal Charge" := "Deposit Refundable" * 0.01;
                end;
                "Partial Deposit Refundable" := "Deposit Refundable" * 0.5;

            end;
        }
        field(16; "Loans Option"; Option)
        {
            OptionCaption = ' ,Short Term,Long Term,All';
            OptionMembers = " ","Short Term","Long Term",All;

            trigger OnValidate()
            begin
                GenSetup.Get;

                if "Closure Type" = "Closure Type"::"Withdrawal - Partial" then begin
                    "Loans Option" := "Loans Option"::All;
                    "Close Account" := "Close Account"::All;
                end;
                if "Loans Option" = "Loans Option"::"Long Term" then begin
                    LoansG := 0;
                    LoanGuarantors.Reset;
                    LoanGuarantors.SetRange(LoanGuarantors."Member No", "Member No.");
                    if LoanGuarantors.Find('-') then begin

                        repeat
                            if Loans.Get(LoanGuarantors."Loan No") then begin
                                Loans.CalcFields(Loans."Outstanding Balance", "Total Loan Balance");
                                if Loans."Total Loan Balance" > 0 then begin
                                    LoansG += 1;
                                end;
                            end;
                        until LoanGuarantors.Next = 0;
                        /*
                        IF LoansG>0 THEN
                           ERROR('Member is Guaranteeing %1 Active Loans',LoansG);*/
                    end;
                    IntTotal := 0;
                    LoanTotal := 0;

                    Loans.Reset;
                    Loans.SetRange(Loans."Member No.", "Member No.");
                    Loans.SetRange(Loans.Posted, true);
                    Loans.SetFilter(Loans."Total Loan Balance", '>0');
                    Loans.SetRange(Loans."Loan Span", Loans."Loan Span"::"Long Term");
                    if Loans.Find('-') then begin
                        repeat
                            Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", "Total Loan Balance");
                            IntTotal := IntTotal + Loans."Outstanding Interest";
                            LoanTotal := LoanTotal + Loans."Outstanding Balance";
                        until Loans.Next = 0;
                    end;
                    "Total Loan" := LoanTotal;
                    "Total Interest" := IntTotal;
                end else
                    if "Loans Option" = "Loans Option"::"Short Term" then begin
                        LoansG := 0;
                        LoanGuarantors.Reset;
                        LoanGuarantors.SetRange(LoanGuarantors."Member No", "Member No.");
                        if LoanGuarantors.Find('-') then begin

                            repeat
                                if Loans.Get(LoanGuarantors."Loan No") then begin
                                    Loans.CalcFields(Loans."Outstanding Balance", "Total Loan Balance");
                                    if Loans."Outstanding Balance" > 0 then begin
                                        LoansG += 1;
                                    end;
                                end;
                            until LoanGuarantors.Next = 0;

                            /*IF LoansG>0 THEN
                               ERROR('Member is Guaranteeing %1 Active Loans',LoansG);*/
                        end;

                        //VALIDATE("Close Account");
                        IntTotal := 0;
                        LoanTotal := 0;

                        Loans.Reset;
                        Loans.SetRange(Loans."Member No.", "Member No.");
                        Loans.SetRange(Loans.Posted, true);
                        Loans.SetRange(Loans."Loan Span", Loans."Loan Span"::"Short Term");
                        Loans.SetFilter(Loans."Total Loan Balance", '>0');
                        if Loans.Find('-') then begin
                            repeat
                                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", "Total Loan Balance");
                                IntTotal := IntTotal + Loans."Outstanding Interest";
                                LoanTotal := LoanTotal + Loans."Outstanding Balance";
                            until Loans.Next = 0;
                        end;


                        "Total Loan" := LoanTotal;
                        "Total Interest" := IntTotal;

                    end else
                        if "Loans Option" = "Loans Option"::All then begin
                            LoansG := 0;
                            LoanGuarantors.Reset;
                            LoanGuarantors.SetRange(LoanGuarantors."Member No", "Member No.");
                            if LoanGuarantors.Find('-') then begin

                                repeat
                                    if Loans.Get(LoanGuarantors."Loan No") then begin
                                        Loans.CalcFields(Loans."Outstanding Balance", "Total Loan Balance");
                                        if Loans."Total Loan Balance" > 0 then begin
                                            LoansG += 1;
                                        end;
                                    end;
                                until LoanGuarantors.Next = 0;

                                /*IF LoansG>0 THEN
                                   ERROR('Member is Guaranteeing %1 Active Loans',LoansG);*/
                            end;

                            //VALIDATE("Close Account");
                            IntTotal := 0;
                            LoanTotal := 0;

                            Loans.Reset;
                            Loans.SetRange(Loans."Member No.", "Member No.");
                            Loans.SetRange(Loans.Posted, true);
                            Loans.SetFilter(Loans."Total Loan Balance", '>0');
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", "Total Loan Balance");
                                    IntTotal := IntTotal + Loans."Outstanding Interest";
                                    LoanTotal := LoanTotal + Loans."Outstanding Balance";
                                until Loans.Next = 0;
                            end;
                            "Total Loan" := LoanTotal;
                            "Total Interest" := IntTotal;
                        end else begin
                            "Total Loan" := 0;
                            "Total Interest" := 0;
                        end;

                if "Closure Type" = "Closure Type"::"Withdrawal - Death" then begin
                    "Deposit Refundable" := "Member Savings" + GenSetup."Funeral Amount";
                    "Partial Deposit Refundable" := "Deposit Refundable";
                    "WithDrawal Charge" := "Deposit Refundable" * 0.01;
                end else begin
                    if ("Member Savings" - (LoanTotal + IntTotal)) < 0 then
                        "Deposit Refundable" := 0

                    else
                        "Deposit Refundable" := "Member Savings" - (LoanTotal + IntTotal + GenSetup."Withdrawal Fee" + "Premature Charges");
                    "WithDrawal Charge" := "Deposit Refundable" * 0.01;
                end;

                //VALIDATE("Closure Type");
                "Partial Deposit Refundable" := "Deposit Refundable" * 0.5;
                if "Closure Type" = "Closure Type"::"Withdrawal - Partial" then
                    Validate("Partial Deposit Refundable");

            end;
        }
        field(17; "Entered By"; Code[30])
        {
        }
        field(18; Transaction; Option)
        {
            OptionCaption = 'Member Withdrawal';
            OptionMembers = "Member Withdrawal";
        }
        field(19; "ID No."; Code[20])
        {
        }
        field(20; "Benevolent Fund"; Decimal)
        {
        }
        field(21; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(22; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(23; "Notice Number"; Code[20])
        {
        }
        field(24; "Maturity Date"; Date)
        {
        }
        field(25; "Premature Charges"; Decimal)
        {
            Editable = false;
        }
        field(26; "WithDrawal Charge"; Decimal)
        {
        }
        field(27; "% of Refunds"; Decimal)
        {
            Editable = false;
        }
        field(28; "Partial Deposit Refundable"; Decimal)
        {

            trigger OnValidate()
            begin
                if "Closure Type" <> "Closure Type"::"Withdrawal - Partial" then
                    Error('This is only application to partial Withdrawal');
                if "Deposit Refundable" > 0 then
                    "% of Refunds" := "Partial Deposit Refundable" / "Deposit Refundable" * 100 else
                    "% of Refunds" := 0;
                if "% of Refunds" > 50 then begin
                    if not Confirm('this amount would exceed 50 % , do you wish to continue?') then Error('Process Terminated');
                end;
                if "Partial Deposit Refundable" > "Deposit Refundable" then Error('Partial Withdrawal should not exceed %1', "Deposit Refundable");
            end;
        }
        field(29; "Staff No."; Code[15])
        {
            Editable = false;
        }
        field(30; "Early Withdrawal"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Status <> Status::Open then
            Error(Txt0000);
    end;

    trigger OnInsert()
    begin
        NoSetup.Get();
        NoSetup.TestField(NoSetup."Member Closure Nos.");
        //NoSeriesMgtInitSeries(NoSetup."Member Closure Nos.", xRec."No. Series", 0D, "No.", "No. Series");

        //"Date Entered":=TODAY;
        "Entered By" := UserId;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindFirst then begin
            UserSetup.TestField("Global Dimension 1 Code");
            UserSetup.TestField("Global Dimension 2 Code");
            "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
            "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
        end else
            Error('User must exist in user setup table');
        "Closing Date" := Today;
    end;

    var
        NoSetup: Record "Credit Nos. Series";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        Members: Record Members;
        AccLine: Record "Account Closure Line";
        SavingsAccounts: Record "Savings Accounts";
        ProductFactory: Record "Product Factory";
        TotalSaving: Decimal;
        GenSetup: Record "General Set-Up";
        LoanTotal: Decimal;
        IntTotal: Decimal;
        Loans: Record Loans;
        LoansG: Decimal;
        LoanGuarantors: Record "Loan Guarantors and Security";
        Txt0000: Label 'You cannot delete when status is not open';
        BBF: Decimal;
        AccountClosureFee: Decimal;
        Amount: array[2] of Integer;
        TransactionCharges: Record "Transaction Charges";
        TariffDetails: Record "Tiered Charges Lines";
        LoanGuarantorsandSecurity: Record "Loan Guarantors and Security";
        Err001: Label 'This member has guranteed loan No %1';
        MemberwithdrawalNotice: Record "Member withdrawal Notice";
        Txt0001: Label 'Member notice for withdrwal will be on %1';
        Txt0002: Label 'This member has not placed any notice for withdrawal';
        Err0002: Label 'Loan No. %1 has been overpaid by %2 , Kindly reconcile so that you can continue';
        Err0003: Label 'Loan No. %1 interest has been overpaid by %2 , Kindly reconcile so that you can continue';
        Err0004: Label 'Date cannot be infuture ';
        Membershipclosure: Record "Membership closure";
        Err0005: Label 'Application for this member already Exist';
        NextofKIN: Record "Next of KIN";
        Err0006: Label 'Member does not have next of kin details';
        Counts: Integer;
        Err0007: Label 'Closure Type varies from Noitice Placed';
        AccountClosureLine: Record "Account Closure Line";
        MembersII: Record Members;
        RetereeDepError: Label 'Total Loan Balance exceeds Deposits';
        Err0008: Label 'Closure Type Normal wthdrawal already exits for this member';
        UserSetup: Record "User Setup";

    local procedure GetPrematureCharge() TCharges: Decimal
    var
        TransactionTypes: Record "Transaction Types";
        TransactionCharges: Record "Transaction Charges";
        TariffDetails: Record "Tiered Charges Lines";
        ChargeAmount: Decimal;
        GeneralSetUp: Record "General Set-Up";
    begin
        //*********************Premature Withdrawal
        GeneralSetUp.Get;
        TCharges := 0;
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange("Member No.", "Member No.");
        SavingsAccounts.SetRange("Product Category", SavingsAccounts."Product Category"::"Deposit Contribution");
        if SavingsAccounts.Find('-') then begin
            SavingsAccounts.CalcFields("Balance (LCY)");
        end;
        MemberwithdrawalNotice.Reset;
        MemberwithdrawalNotice.SetRange(MemberwithdrawalNotice."Member No.", "Member No.");
        MemberwithdrawalNotice.SetRange(MemberwithdrawalNotice.Status, MemberwithdrawalNotice.Status::Approved);
        if MemberwithdrawalNotice.Find('+') then begin
            if MemberwithdrawalNotice."Maturity Date" > "Closing Date" then begin
                TransactionTypes.Reset;
                TransactionTypes.SetRange(TransactionTypes.Type, TransactionTypes.Type::"Member Withdrawal");
                TransactionTypes.SetRange(Code, GeneralSetUp."Withdrawal Notice Penalty");
                if TransactionTypes.Find('-') then begin

                    //Charges
                    //TCharges:=0;
                    //MESSAGE('%1',TransactionTypes.Code);
                    TransactionCharges.Reset;
                    TransactionCharges.SetRange(TransactionCharges."Transaction Type", TransactionTypes.Code);
                    if TransactionCharges.Find('-') then begin
                        repeat
                            //MESSAGE('i');
                            ChargeAmount := 0;
                            if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" = true then
                                ChargeAmount := (SavingsAccounts."Balance (LCY)" * TransactionCharges."Percentage of Amount") * 0.01
                            else
                                ChargeAmount := TransactionCharges."Charge Amount";

                            if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin

                                TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                TariffDetails.Reset;
                                TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                if TariffDetails.Find('-') then begin
                                    repeat
                                        if (SavingsAccounts."Balance (LCY)" >= TariffDetails."Lower Limit") and (SavingsAccounts."Balance (LCY)" <= TariffDetails."Upper Limit") then begin
                                            if TariffDetails."Use Percentage" = true then begin
                                                ChargeAmount := SavingsAccounts."Balance (LCY)" * TariffDetails.Percentage * 0.01;
                                            end else begin
                                                ChargeAmount := TariffDetails."Charge Amount"
                                            end;
                                        end;
                                    until TariffDetails.Next = 0;
                                end;
                            end;
                            /*
                            LineNo:=LineNo+10000;
                            AcctType:=AcctType::Savings;
                            TransType:=TransType::" ";

                            JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,"No.",
                            TransactionCharges.Description+ClosureAccounts."No.",ChargeAmount,SavingsAccounts."No.","Closing Date",BalAccType,
                            TransactionCharges."G/L Account",'',Dim1,Dim2,TransType,'','','',0,'',0);
                            */

                            //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                            if TransactionCharges."Transaction Charge Category" <> TransactionCharges."Transaction Charge Category"::"Stamp Duty" then begin
                                //Excise Duty

                                /*LineNo:=LineNo+10000;
                                AcctType:=AcctType::Savings;
                                TransType:=TransType::" ";

                                JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,"No.",
                                Txt0001+ClosureAccounts."No.",(ChargeAmount*GeneralSetUp."Excise Duty (%)")*0.01,SavingsAccounts."No.","Closing Date",BalAccType,
                                GeneralSetUp."Excise Duty G/L",'',Dim1,Dim2,TransType,'','','',0,'',0);*/

                                TCharges := (ChargeAmount * GeneralSetUp."Excise Duty (%)" * 0.01) + ChargeAmount + TCharges;

                            end;

                        until TransactionCharges.Next = 0;
                    end;
                end;

            end;
        end else begin
            //Charges

            TransactionTypes.Reset;
            TransactionTypes.SetRange(TransactionTypes.Type, TransactionTypes.Type::"Member Withdrawal");
            TransactionTypes.SetRange(Code, GeneralSetUp."Withdrawal Notice Penalty");
            if TransactionTypes.Find('-') then begin

            end;
            TCharges := 0;
            TransactionCharges.Reset;
            TransactionCharges.SetRange(TransactionCharges."Transaction Type", TransactionTypes.Code);

            if TransactionCharges.Find('-') then begin
                repeat

                    ChargeAmount := 0;
                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" = true then
                        ChargeAmount := (SavingsAccounts."Balance (LCY)" * TransactionCharges."Percentage of Amount") * 0.01
                    else
                        ChargeAmount := TransactionCharges."Charge Amount";

                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin

                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                        TariffDetails.Reset;
                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                        if TariffDetails.Find('-') then begin
                            repeat
                                if (SavingsAccounts."Balance (LCY)" >= TariffDetails."Lower Limit") and (SavingsAccounts."Balance (LCY)" <= TariffDetails."Upper Limit") then begin
                                    if TariffDetails."Use Percentage" = true then begin
                                        ChargeAmount := SavingsAccounts."Balance (LCY)" * TariffDetails.Percentage * 0.01;
                                    end else begin
                                        ChargeAmount := TariffDetails."Charge Amount"
                                    end;
                                end;
                            until TariffDetails.Next = 0;
                        end;
                    end;

                    /*LineNo:=LineNo+10000;
                    AcctType:=AcctType::Savings;
                    TransType:=TransType::" ";

                    JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,"No.",
                    TransactionCharges.Description+ClosureAccounts."No.",ChargeAmount,SavingsAccounts."No.","Closing Date",BalAccType,
                    TransactionCharges."G/L Account",'',Dim1,Dim2,TransType,'','','',0,'',0);*/


                    //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                    if TransactionCharges."Transaction Charge Category" <> TransactionCharges."Transaction Charge Category"::"Stamp Duty" then begin
                        //Excise Duty

                        /*LineNo:=LineNo+10000;
                        AcctType:=AcctType::Savings;
                        TransType:=TransType::" ";

                        JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,"No.",
                        Txt0001+ClosureAccounts."No.",(ChargeAmount*GeneralSetUp."Excise Duty (%)")*0.01,SavingsAccounts."No.","Closing Date",BalAccType,
                        GeneralSetUp."Excise Duty G/L",'',Dim1,Dim2,TransType,'','','',0,'',0);*/

                        TCharges := TCharges + ChargeAmount + (ChargeAmount * GeneralSetUp."Excise Duty (%)" * 0.01);
                    end;
                until TransactionCharges.Next = 0;
            end;
        end;
        //^^
        "Partial Deposit Refundable" := "Deposit Refundable" * 0.5;
        if "Closure Type" = "Closure Type"::"Withdrawal - Partial" then
            Validate("Partial Deposit Refundable");

    end;

    //[Scope('Internal')]
    procedure LOanOpt()
    begin
        GenSetup.Get;

        if "Closure Type" = "Closure Type"::"Withdrawal - Partial" then begin
            LoansG := 0;
            LoanGuarantors.Reset;
            LoanGuarantors.SetRange(LoanGuarantors."Member No", "Member No.");
            if LoanGuarantors.Find('-') then begin

                repeat
                    if Loans.Get(LoanGuarantors."Loan No") then begin
                        Loans.CalcFields(Loans."Outstanding Balance", "Total Loan Balance");
                        if Loans."Total Loan Balance" > 0 then begin
                            LoansG += 1;
                        end;
                    end;
                until LoanGuarantors.Next = 0;

                /*IF LoansG>0 THEN
                   ERROR('Member is Guaranteeing %1 Active Loans',LoansG);*/
            end;

            //VALIDATE("Close Account");
            IntTotal := 0;
            LoanTotal := 0;

            Loans.Reset;
            Loans.SetRange(Loans."Member No.", "Member No.");
            Loans.SetRange(Loans.Posted, true);
            Loans.SetFilter(Loans."Total Loan Balance", '>0');
            if Loans.Find('-') then begin
                repeat
                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", "Total Loan Balance");
                    IntTotal := IntTotal + Loans."Outstanding Interest";
                    LoanTotal := LoanTotal + Loans."Outstanding Balance";
                until Loans.Next = 0;
            end;
            "Total Loan" := LoanTotal;
            "Total Interest" := IntTotal;
        end else begin
            if ("Member Savings" - (LoanTotal + IntTotal)) < 0 then
                "Deposit Refundable" := 0
            else
                "Deposit Refundable" := "Member Savings" - (LoanTotal + IntTotal + GenSetup."Withdrawal Fee" + "Premature Charges");
            "WithDrawal Charge" := "Deposit Refundable" * 0.01;
        end;
        // IF "Total Loan"+"Total Interest">0 THEN ERROR('The member should settle the loans totalling %1 first',("Total Interest"+"Total Loan"));

    end;
}

