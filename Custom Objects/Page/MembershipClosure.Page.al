page 52185851 "Membership Closure"
{
    DeleteAllowed = false;
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = "Membership closure";

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Application Date"; Rec."Application Date")
                {
                    Editable = false;
                }
                field("Member No."; Rec."Member No.")
                {

                    trigger OnValidate()
                    begin
                        Rec."Closure Type" := Rec."Closure Type"::" ";
                        Rec."Close Account" := Rec."Close Account"::" ";
                        Rec."Loans Option" := Rec."Loans Option"::" ";
                    end;
                }
                field("Staff No."; Rec."Staff No.")
                {
                    Editable = false;
                }
                field("Member Name"; Rec."Member Name")
                {
                    Editable = false;
                }
                field("Closure Type"; Rec."Closure Type")
                {

                    trigger OnValidate()
                    begin
                        SetControlAppearance;
                    end;
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Activity Code';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Branch Code';
                }
                field("Close Account"; Rec."Close Account")
                {

                    trigger OnValidate()
                    begin
                        /*IF "Close Account"="Close Account"::All THEN BEGIN
                        AccLine.RESET;
                        AccLine.SETRANGE(AccLine."No.","No.");
                        IF AccLine.FIND('-') THEN
                        AccLine.DELETEALL;
                        
                          MESSAGE('Kindly Click Fill Accounts to generate the Lines');
                        CurrPage.UPDATE;
                        END;
                        
                        
                        IF "Close Account"="Close Account"::Specific THEN BEGIN
                        AccLine.RESET;
                        AccLine.SETRANGE(AccLine."No.","No.");
                        IF AccLine.FIND('-') THEN
                        AccLine.DELETEALL;
                           MESSAGE('Kindly Click Fill Accounts to generate the Lines');
                        CurrPage.UPDATE;
                        END;*/

                        /*"Member Savings":=0;
                        TotalSaving:=0;
                        
                        AccLine.RESET;
                        AccLine.SETRANGE(AccLine."No.","No.");
                        IF AccLine.FIND('-') THEN
                        AccLine.DELETEALL;
                        
                        
                        GenSetup.GET;
                        
                        IF  "Close Account"="Close Account"::All THEN BEGIN
                        AccLine.RESET;
                        AccLine.SETRANGE(AccLine."No.","No.");
                        IF AccLine.FIND('-') THEN
                        AccLine.DELETEALL;
                        
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
                                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
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
                        CurrPage.UPDATE;
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
                        
                        CurrPage.UPDATE;
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

                    end;
                }
                field("Loans Option"; Rec."Loans Option")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Total Loan"; Rec."Total Loan")
                {
                    Editable = false;
                }
                field("Total Interest"; Rec."Total Interest")
                {
                    Editable = false;
                }
                field("Member Savings"; Rec."Member Savings")
                {
                    Editable = false;
                }
                field("Premature Charges"; Rec."Premature Charges")
                {
                }
                field("Deposit Refundable"; Rec."Deposit Refundable")
                {
                    Editable = false;
                }
                field("Entered By"; Rec."Entered By")
                {
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    Enabled = false;
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Notice Number"; Rec."Notice Number")
                {
                    Editable = false;
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    Editable = false;
                }
                field("Benevolent Fund"; Rec."Benevolent Fund")
                {
                    Editable = false;
                }
                field("Early Withdrawal"; Rec."Early Withdrawal")
                {
                    Editable = false;
                }
                group(Control35)
                {
                    ShowCaption = false;
                    Visible = VisiblePArt;
                    field("% of Refunds"; Rec."% of Refunds")
                    {
                    }
                    field("Partial Deposit Refundable"; Rec."Partial Deposit Refundable")
                    {
                    }
                }
            }
            part(Control18; "Account Closure Line")
            {
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Resignation Slip")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                Visible = Rec."Closure Type" <> Rec."Closure Type"::"Withdrawal - Partial";

                trigger OnAction()
                begin
                    Membershipclosure.Reset;
                    Membershipclosure.SetRange(Membershipclosure."Member No.", Rec."Member No.");
                    Membershipclosure.SetRange("No.", Rec."No.");
                    if Membershipclosure.Find('-') then begin
                        //REPORT.Run(52185726, true, false, Membershipclosure);
                    end;
                end;
            }
            action("Partial Resignation Slip")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                Visible = Rec."Closure Type" = Rec."Closure Type"::"Withdrawal - Partial";

                trigger OnAction()
                begin
                    Membershipclosure.Reset;
                    Membershipclosure.SetRange(Membershipclosure."Member No.", Rec."Member No.");
                    Membershipclosure.SetRange("No.", Rec."No.");
                    if Membershipclosure.Find('-') then begin
                        //REPORT.Run(52185841, true, false, Membershipclosure);
                    end;
                end;
            }
            action(Post)
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    MCAcc: Record Vendor;
                    Text0005: Label 'Dear member, Your shares refund of Kes ';
                    Text0006: Label ' has been credited to your FOSA account. Access via MSACCO or ATM. Harambee SACCO.';
                    TotaLoan: Decimal;
                    EarlyWithrawalFee: Decimal;
                    Text000010: Label 'Early Wtihdrawal Fee';
                begin
                    if Rec."Closure Type" = Rec."Closure Type"::"Withdrawal - Partial" then begin
                        PostPartialWithdrawals(Rec);
                    end else begin
                        Membershipclosure.Reset;
                        Membershipclosure.SetRange("No.", Rec."No.");
                        if Membershipclosure.FindFirst then
                            if Rec.Posted = true then Error('Already Posted');

                        SavingsLedgerEntry.Reset;
                        SavingsLedgerEntry.SetRange("Document No.", Rec."No.");
                        SavingsLedgerEntry.SetRange("Posting Date", Rec."Closing Date");
                        if SavingsLedgerEntry.Find('-') then begin
                            Rec.Posted := true;
                            Rec.Modify;
                        end else begin

                            if Rec.Posted = true then
                                Error(ErrTxt0000);


                            if Rec."Deposit Refundable" <= 0 then
                                Error(ErrTxt0001);

                            Rec.TestField("Closing Date");

                            if Rec.Status <> Rec.Status::Approved then
                                Error(ErrTxt0002);
                            ClosureAccountsII.Reset;
                            ClosureAccountsII.SetRange(ClosureAccountsII."No.", Rec."No.");
                            ClosureAccountsII.SetRange(ClosureAccountsII.Close, true);
                            if ClosureAccountsII.Find('-') then begin
                                repeat
                                    ClosureAccountsII.Validate("Account No.");
                                until ClosureAccountsII.Next = 0;
                            end;

                            if Members.Get(Rec."Member No.") then begin
                                if Confirm(ConfmTxt0003) = false then
                                    exit;

                                TotaLoan := 0;
                                //send SMS to guarantors since loan is cleared
                                //IF ("Closure Type"="Closure Type"::"Withdrawal - Death") OR ("Closure Type"="Closure Type"::"Withdrawal - Normal") THEN BEGIN
                                Loans2.CalcFields("Total Loan Balance");
                                Loans2.Reset;
                                Loans2.SetRange("Member No.", Rec."Member No.");
                                Loans2.SetRange(Posted, true);
                                Loans2.SetFilter("Total Loan Balance", '>0');
                                if Loans2.FindFirst then begin
                                    repeat
                                        Loans2.CalcFields("Total Loan Balance");
                                        LoanGuar.Reset;
                                        LoanGuar.SetRange("Loan No", Loans2."Loan No.");
                                        LoanGuar.SetRange(Substituted, false);
                                        LoanGuar.SetRange("Self Guarantee", false);
                                        if LoanGuar.FindFirst then begin
                                            if Loans2.Get(LoanGuar."Loan No") then begin
                                                ProductType := Loans2."Loan Product Type Name";
                                                AppAmount := Loans2."Approved Amount";
                                            end;
                                            repeat
                                                if Members.Get(LoanGuar."Member No") then
                                                    CompInfo.Get;
                                                SendSms.SendSms(SourceType::"Loan Guarantors", Members."Mobile Phone No",
                                                'Dear ' + LoanGuar.Name + ', The ' + ProductType + ' of Ksh. ' + Format(AppAmount) + ', you had guaranteed ' + LoanGuar."Loanee Name" + ' is now fully repaid.',
                                                Loans2."Loan No.", Loans2."Disbursement Account No", false);

                                            until LoanGuar.Next = 0;
                                        end;
                                        TotaLoan += Loans2."Total Loan Balance";
                                    until Loans2.Next = 0;
                                end;
                                //MESSAGE(FORMAT(TotaLoan));
                                //end of send SMS


                                GeneralSetUp.Get();
                                BankingUserTemplate.Get(UserId);
                                if UserSetup.Get(UserId) then begin
                                    Dim1 := UserSetup."Global Dimension 1 Code";
                                    Dim2 := UserSetup."Global Dimension 2 Code";
                                end;

                                Jtemplate := BankingUserTemplate."Check Off Template";
                                JBatch := BankingUserTemplate."Check Off Batch";


                                //delete journal line
                                Gnljnline.Reset;
                                Gnljnline.SetRange("Journal Template Name", Jtemplate);
                                Gnljnline.SetRange("Journal Batch Name", JBatch);
                                Gnljnline.DeleteAll;
                                //end of deletion

                                Totalrecovered := 0;
                                TotalSaving := 0;
                                AvailableShares := Rec."Member Savings";
                                Funeral := 0;
                                ClearBills := 0;
                                //Members."Withdrawal Posted":=TRUE;
                                //Advice:=TRUE;
                                //Members.MODIFY;


                                //Close Accounts
                                ClosureAccounts.Reset;
                                ClosureAccounts.SetRange(ClosureAccounts."No.", Rec."No.");
                                ClosureAccounts.SetRange(ClosureAccounts.Close, true);
                                if ClosureAccounts.Find('-') then begin
                                    repeat
                                        // ClosureAccounts.VALIDATE("Account No.");
                                        if ProdutFactory.Get(ClosureAccounts."Product Type") then begin
                                            if ProdutFactory."Product Category" = ProdutFactory."Product Category"::"Deposit Contribution" then begin

                                                LineNo := LineNo + 10000;
                                                AcctType := AcctType::Savings;
                                                TransType := TransType::" ";
                                                BalAccNo := '';
                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                Txt0004, ClosureAccounts.Balance - Rec."Premature Charges", ClosureAccounts."Account No.", Rec."Closing Date", BalAccType,
                                                BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                            end else begin


                                                LineNo := LineNo + 10000;
                                                AcctType := AcctType::Savings;
                                                TransType := TransType::" ";
                                                BalAccNo := '';

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                Txt0004, ClosureAccounts.Balance, ClosureAccounts."Account No.", Rec."Closing Date", BalAccType,
                                                BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                            end;
                                            //LoanAmount:=LoanAmount-ABS(Amt);
                                            /*
                                                  //CLosure Fee
                                                  //*Oketch AccountClosureFee:=ProdutFactory."Closure Fee";
                                                  AccountClosureFee:=0;
                                                  TransactionCharges.RESET;
                                                  TransactionCharges.SETRANGE(TransactionCharges."Transaction Type",ProdutFactory."Closure Fee");
                                                  IF TransactionCharges.FIND('-') THEN BEGIN
                                                  REPEAT
                                                  Amount[1]:=0;
                                                  IF TransactionCharges."Charge Type"=TransactionCharges."Charge Type"::"% of Amount" THEN
                                                  Amount[1]:=("Member Savings"*TransactionCharges."Percentage of Amount")*0.01
                                                  ELSE
                                                  Amount[1]:=TransactionCharges."Charge Amount";

                                                  IF TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered THEN BEGIN
                                                  TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
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

                                                  LineNo:=LineNo+10000;
                                                  AcctType:=AcctType::Savings;
                                                  TransType:=TransType::" ";

                                                  JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,"No.",
                                                  Txt0010,AccountClosureFee,ClosureAccounts."Account No.","Closing Date",BalAccType,
                                                  GeneralSetUp."Withdrawal Fee Account",'',Dim1,Dim2,TransType,'','','',0,'',0);
                                                  */

                                            TotalSaving := TotalSaving + (ClosureAccounts.Balance);//-AccountClosureFee)
                                                                                                   //END;
                                        end;

                                        if Rec."Closure Type" = Rec."Closure Type"::"Withdrawal - Normal" then begin
                                            if SavingsAccounts.Get(ClosureAccounts."Account No.") then begin
                                                SavingsAccounts.Status := SavingsAccounts.Status::Closed;
                                                SavingsAccounts.Modify;
                                            end;
                                        end else begin
                                            if SavingsAccounts.Get(ClosureAccounts."Account No.") then begin
                                                if SavingsAccounts."Product Category" <> SavingsAccounts."Product Category"::"Junior Savings" then
                                                    SavingsAccounts.Status := SavingsAccounts.Status::Deceased
                                                else
                                                    SavingsAccounts.Status := SavingsAccounts.Status::Closed;
                                                SavingsAccounts.Modify;
                                            end;
                                        end;
                                    until ClosureAccounts.Next = 0;
                                    if Rec."Closure Type" = Rec."Closure Type"::"Withdrawal - Death" then begin
                                        if GeneralSetUp."Funeral Amount" > 0 then
                                            Funeral := GeneralSetUp."Funeral Amount";

                                    end;
                                    TotalSaving := TotalSaving - Rec."Premature Charges";

                                end;
                                //End of Close Accounts


                                if Rec."Closure Type" = Rec."Closure Type"::"Withdrawal - Normal" then begin


                                    //Early Withdrawal Fee //Denis
                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", Rec."Member No.");
                                    SavingsAccounts.SetRange("Loan Disbursement Account", true);
                                    if SavingsAccounts.Find('-') then begin
                                        EarlyWithrawalFee := 0;
                                        SavingsAccounts2.Reset;
                                        SavingsAccounts2.SetRange(SavingsAccounts2."Member No.", Rec."Member No.");
                                        SavingsAccounts2.SetRange("Product Category", SavingsAccounts2."Product Category"::"Deposit Contribution");
                                        if SavingsAccounts2.Find('-') then begin
                                            SavingsAccounts2.CalcFields("Balance (LCY)");
                                            MemberwithdrawalNotice.Reset;
                                            MemberwithdrawalNotice.SetRange(MemberwithdrawalNotice."No.", Rec."Notice Number");
                                            if MemberwithdrawalNotice.Find('-') then begin
                                                if MemberwithdrawalNotice."Early Withdrawal" = true then begin
                                                    EarlyWithrawalFee := (GeneralSetUp."Early Withdrawal %" / 100) * (SavingsAccounts2."Balance (LCY)");
                                                    LineNo := LineNo + 10000;
                                                    AcctType := AcctType::Savings;
                                                    TransType := TransType::" ";
                                                    BalAccType := BalAccType::"G/L Account";
                                                    BalAccNo := GeneralSetUp."Early Withdrawal Account";
                                                    GeneralSetUp.TestField(GeneralSetUp."Early Withdrawal Account");

                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                    Text000010 + Rec."No.", EarlyWithrawalFee, SavingsAccounts."No.", Rec."Closing Date", BalAccType,
                                                    BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                                    AvailableShares := AvailableShares - EarlyWithrawalFee;

                                                    //excise duty for Early withdrawal
                                                    LineNo := LineNo + 10000;
                                                    AcctType := AcctType::Savings;
                                                    TransType := TransType::" ";
                                                    BalAccType := BalAccType::"G/L Account";
                                                    BalAccNo := GeneralSetUp."Excise Duty G/L";
                                                    GeneralSetUp.TestField(GeneralSetUp."Excise Duty G/L");
                                                    Amt := 0;
                                                    Amt := (GeneralSetUp."Excise Duty (%)" / 100) * EarlyWithrawalFee;

                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                    'Early With Fee Excise Duty ' + Rec."No.", Amt, SavingsAccounts."No.", Rec."Closing Date", BalAccType,
                                                    BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                                    AvailableShares := AvailableShares - Amt;
                                                end;
                                            end;
                                        end;
                                    end;
                                    //end of early withdrawal Fee


                                    Loans.Reset;
                                    Loans.SetRange(Loans."Member No.", Rec."Member No.");
                                    if Loans.Find('-') then begin
                                        repeat
                                            RecoverLoan := true;
                                            if (Rec."Loans Option" = Rec."Loans Option"::"Long Term") and (Loans."Loan Span" = Loans."Loan Span"::"Short Term") then
                                                RecoverLoan := false;

                                            if (Rec."Loans Option" = Rec."Loans Option"::"Short Term") and (Loans."Loan Span" = Loans."Loan Span"::"Long Term") then
                                                RecoverLoan := false;

                                            if (Rec."Loans Option" = Rec."Loans Option"::" ") then
                                                RecoverLoan := false;
                                            if RecoverLoan = true then begin

                                                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", "Outstanding Bills");

                                                //Recover Interest
                                                if Loans."Outstanding Interest" > 0 then begin
                                                    //**Interest:=0;



                                                    Interest := Loans."Outstanding Interest";
                                                    LRepayment := Loans."Outstanding Balance";
                                                    if (AvailableShares > 0) and (Interest > 0) then begin

                                                        //Interest Recovery
                                                        LineNo := LineNo + 10000;
                                                        AcctType := AcctType::Credit;
                                                        TransType := TransType::"Interest Paid";
                                                        if AvailableShares < Interest then
                                                            Amt := -1 * AvailableShares
                                                        else
                                                            Amt := -1 * Interest;
                                                        BalAccNo := '';
                                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                        Txt0005, Amt, Loans."Loan Account", Rec."Closing Date", BalAccType,
                                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                                        //LoanAmount:=LoanAmount-ABS(Amt);


                                                        AvailableShares := AvailableShares - (Amt * -1);
                                                        Totalrecovered := Totalrecovered + (Amt * -1);
                                                        TotalSaving := TotalSaving + (Amt);
                                                        Amt := 0;

                                                    end;
                                                end;
                                                //Recover Repayment
                                                //**LRepayment:=0;
                                                if Loans."Outstanding Balance" > 0 then
                                                    LRepayment := Loans."Outstanding Balance"
                                                else
                                                    LRepayment := 0;

                                                if (AvailableShares > 0) and (LRepayment > 0) then begin
                                                    LineNo := LineNo + 10000;
                                                    AcctType := AcctType::Credit;
                                                    TransType := TransType::Repayment;
                                                    BalAccNo := '';
                                                    if AvailableShares < LRepayment then
                                                        Amt := -1 * AvailableShares
                                                    else
                                                        Amt := -1 * LRepayment;

                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                    Txt0006, Amt, Loans."Loan Account", Rec."Closing Date", BalAccType,
                                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                                    AvailableShares := AvailableShares - (Amt * -1);
                                                    Totalrecovered := Totalrecovered + (Amt * -1);
                                                    TotalSaving := TotalSaving + (Amt);
                                                    Amt := 0;


                                                    //Loans."Recovered Balance":=Loans."Outstanding Balance";
                                                    //Loans.MODIFY;
                                                end;
                                                //bills
                                                if Loans."Outstanding Bills" <> 0 then begin
                                                    ClearBills := Loans."Outstanding Bills";

                                                    ProdutFactory.Reset;
                                                    ProdutFactory.SetRange("Product ID", Loans."Loan Product Type");
                                                    if ProdutFactory.Find('-') then begin
                                                        BalAccNo := ProdutFactory."Billed Account";
                                                    end;
                                                    LineNo := LineNo + 10000;
                                                    AcctType := AcctType::Credit;
                                                    TransType := TransType::Bills;
                                                    BalAccType := BalAccType::"G/L Account";
                                                    Amt := -1 * ClearBills;

                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                    Txt0014, Amt, Loans."Loan Account", Rec."Closing Date", BalAccType,
                                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                                    Amt := 0;
                                                end;

                                            end;


                                        until Loans.Next = 0;
                                    end;



                                    //Withdrawal Fee
                                    if GeneralSetUp."Withdrawal Fee" > 0 then begin
                                        LineNo := LineNo + 10000;
                                        AcctType := AcctType::"G/L Account";
                                        TransType := TransType::" ";
                                        BalAccNo := '';
                                        GeneralSetUp.TestField(GeneralSetUp."Withdrawal Fee Account");

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                        Txt0009 + ClosureAccounts."No.", -GeneralSetUp."Withdrawal Fee", GeneralSetUp."Withdrawal Fee Account", Rec."Closing Date", BalAccType,
                                        BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                        TotalSaving := TotalSaving - (GeneralSetUp."Withdrawal Fee");

                                    end;

                                    //Start Recover Unpaid Dues

                                    ShareCapAmount := 0;
                                    RegistrationFee := 0;
                                    SinkFund := 0;
                                    SavingsAccounts2.Reset;
                                    SavingsAccounts2.SetRange("Member No.", Rec."Member No.");
                                    SavingsAccounts2.SetRange("Product Category", SavingsAccounts2."Product Category"::"Share Capital");
                                    if SavingsAccounts2.Find('-') then begin
                                        if ProdutFactory.Get(SavingsAccounts2."Product Type") then begin
                                            SavingsAccounts2.CalcFields("Balance (LCY)");
                                            if SavingsAccounts2."Balance (LCY)" < ProdutFactory."Minimum Balance" then begin
                                                ShareCapAmount := ProdutFactory."Minimum Balance" - SavingsAccounts2."Balance (LCY)";
                                                LineNo := LineNo + 10000;
                                                AcctType := AcctType::Savings;
                                                TransType := TransType::" ";
                                                BalAccNo := '';
                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                Txt0011 + ClosureAccounts."No.", -(ShareCapAmount), SavingsAccounts2."No.", Rec."Closing Date", BalAccType,
                                                BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                            end;
                                        end;
                                    end;


                                    SavingsAccounts2.Reset;
                                    SavingsAccounts2.SetRange("Member No.", Rec."Member No.");
                                    SavingsAccounts2.SetRange("Product Category", SavingsAccounts2."Product Category"::"Registration Fee");
                                    if SavingsAccounts2.Find('-') then begin
                                        if ProdutFactory.Get(SavingsAccounts2."Product Type") then begin
                                            SavingsAccounts2.CalcFields("Balance (LCY)");
                                            if SavingsAccounts2."Balance (LCY)" < 0 then begin
                                                RegistrationFee := SavingsAccounts2."Balance (LCY)" * -1;
                                                LineNo := LineNo + 10000;
                                                AcctType := AcctType::Savings;
                                                TransType := TransType::" ";
                                                BalAccNo := '';

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                Txt0012 + ClosureAccounts."No.", -RegistrationFee, SavingsAccounts2."No.", Rec."Closing Date", BalAccType,
                                                BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                            end;
                                        end;
                                    end;

                                    SavingsAccounts2.Reset;
                                    SavingsAccounts2.SetRange("Member No.", Rec."Member No.");
                                    SavingsAccounts2.SetRange("Product Category", SavingsAccounts2."Product Category"::Benevolent);
                                    if SavingsAccounts2.Find('-') then begin
                                        if ProdutFactory.Get(SavingsAccounts2."Product Type") then begin
                                            SavingsAccounts2.CalcFields("Balance (LCY)");
                                            if SavingsAccounts2."Balance (LCY)" < 0 then begin
                                                SinkFund := SavingsAccounts2."Balance (LCY)" * -1;
                                                LineNo := LineNo + 10000;
                                                AcctType := AcctType::Savings;
                                                TransType := TransType::" ";
                                                BalAccNo := '';

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                Txt0012 + ClosureAccounts."No.", -SinkFund, SavingsAccounts2."No.", Rec."Closing Date", BalAccType,
                                                BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                            end;
                                        end;
                                    end;
                                    //End Recover Unpaid Dues

                                    NetAmount := 0;
                                    //Recover Through Saving the Balance
                                    //TotalSaving:=0;//TotalSaving-TCharges;
                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetRange(SavingsAccounts."Loan Disbursement Account", true);
                                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", Rec."Member No.");
                                    if SavingsAccounts.Find('-') then begin
                                        LineNo := LineNo + 10000;
                                        AcctType := AcctType::Savings;
                                        TransType := TransType::" ";
                                        BalAccNo := '';

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                        Txt0007 + ClosureAccounts."No.", -(TotalSaving - RegistrationFee - ShareCapAmount - SinkFund), SavingsAccounts."No.", Rec."Closing Date", BalAccType,
                                        BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);




                                    end;
                                    NetAmount := (TotalSaving - RegistrationFee - ShareCapAmount - SinkFund);
                                    //*********************Premature Withdrawal

                                    SavingsAccounts2.Reset;
                                    SavingsAccounts2.SetRange("Member No.", Rec."Member No.");
                                    SavingsAccounts2.SetRange("Product Category", SavingsAccounts2."Product Category"::"Deposit Contribution");
                                    if SavingsAccounts2.Find('-') then begin
                                        if ProdutFactory.Get(SavingsAccounts2."Product Type") then begin
                                            SavingsAccounts2.CalcFields("Balance (LCY)");
                                        end;
                                    end;

                                    MemberwithdrawalNotice.Reset;
                                    MemberwithdrawalNotice.SetRange(MemberwithdrawalNotice."Member No.", Rec."Member No.");
                                    MemberwithdrawalNotice.SetRange(MemberwithdrawalNotice.Status, MemberwithdrawalNotice.Status::Approved);
                                    if MemberwithdrawalNotice.Find('+') then begin
                                        if MemberwithdrawalNotice."Maturity Date" > Rec."Closing Date" then begin

                                            TransactionTypes.Reset;
                                            TransactionTypes.SetRange(TransactionTypes.Type, TransactionTypes.Type::"Member Withdrawal");
                                            TransactionTypes.SetRange(Code, GeneralSetUp."Withdrawal Notice Penalty");
                                            if TransactionTypes.Find('-') then begin
                                            end;

                                            //Charges
                                            TCharges := 0;

                                            TransactionCharges.Reset;
                                            TransactionCharges.SetRange(TransactionCharges."Transaction Type", TransactionTypes.Code);
                                            if TransactionCharges.Find('-') then begin
                                                repeat
                                                    LineNo := LineNo + 10000;

                                                    ChargeAmount := 0;
                                                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" = true then
                                                        ChargeAmount := (SavingsAccounts2."Balance (LCY)" * TransactionCharges."Percentage of Amount") * 0.01
                                                    else
                                                        ChargeAmount := TransactionCharges."Charge Amount";

                                                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin

                                                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                                        TariffDetails.Reset;
                                                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                                        if TariffDetails.Find('-') then begin
                                                            repeat
                                                                if (SavingsAccounts2."Balance (LCY)" >= TariffDetails."Lower Limit") and (SavingsAccounts2."Balance (LCY)" <= TariffDetails."Upper Limit") then begin
                                                                    if TariffDetails."Use Percentage" = true then begin
                                                                        ChargeAmount := TotalSaving * TariffDetails.Percentage * 0.01;
                                                                    end else begin
                                                                        ChargeAmount := TariffDetails."Charge Amount"
                                                                    end;
                                                                end;
                                                            until TariffDetails.Next = 0;
                                                        end;
                                                    end;

                                                    LineNo := LineNo + 10000;
                                                    AcctType := AcctType::Savings;
                                                    TransType := TransType::" ";

                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                    TransactionCharges.Description + ClosureAccounts."No.", ChargeAmount, SavingsAccounts2."No.", Rec."Closing Date", BalAccType,
                                                    TransactionCharges."G/L Account", '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);


                                                    //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                                                    if TransactionCharges."Transaction Charge Category" <> TransactionCharges."Transaction Charge Category"::"Stamp Duty" then begin
                                                        //Excise Duty

                                                        LineNo := LineNo + 10000;
                                                        AcctType := AcctType::Savings;
                                                        TransType := TransType::" ";

                                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                        Txt0001 + ClosureAccounts."No.", (ChargeAmount * GeneralSetUp."Excise Duty (%)") * 0.01, SavingsAccounts2."No.", Rec."Closing Date", BalAccType,
                                                        GeneralSetUp."Excise Duty G/L", '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                                        //TCharges:=TCharges+ChargeAmount;
                                                    end;
                                                until TransactionCharges.Next = 0;
                                            end;

                                        end;
                                        NetAmount := NetAmount - (((ChargeAmount * GeneralSetUp."Excise Duty (%)") * 0.01) + ChargeAmount);
                                    end else begin
                                        //Charges

                                        TransactionTypes.Reset;
                                        TransactionTypes.SetRange(TransactionTypes.Type, TransactionTypes.Type::"Member Withdrawal");
                                        TransactionTypes.SetRange(Code, GeneralSetUp."Withdrawal Notice Penalty");
                                        if TransactionTypes.Find('-') then begin
                                            // MESSAGE('%1 and %2 and %3',TransactionTypes.Code,Transaction,TransactionTypes.Type);

                                        end;
                                        TCharges := 0;
                                        TransactionCharges.Reset;
                                        TransactionCharges.SetRange(TransactionCharges."Transaction Type", TransactionTypes.Code);

                                        if TransactionCharges.Find('-') then begin
                                            repeat
                                                LineNo := LineNo + 10000;

                                                ChargeAmount := 0;
                                                if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" = true then
                                                    ChargeAmount := (SavingsAccounts2."Balance (LCY)" * TransactionCharges."Percentage of Amount") * 0.01
                                                else
                                                    ChargeAmount := TransactionCharges."Charge Amount";

                                                if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin

                                                    TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");

                                                    TariffDetails.Reset;
                                                    TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                                    if TariffDetails.Find('-') then begin
                                                        repeat
                                                            if (SavingsAccounts2."Balance (LCY)" >= TariffDetails."Lower Limit") and (SavingsAccounts2."Balance (LCY)" <= TariffDetails."Upper Limit") then begin
                                                                if TariffDetails."Use Percentage" = true then begin
                                                                    ChargeAmount := TotalSaving * TariffDetails.Percentage * 0.01;
                                                                end else begin
                                                                    ChargeAmount := TariffDetails."Charge Amount"
                                                                end;
                                                            end;
                                                        until TariffDetails.Next = 0;
                                                    end;
                                                end;

                                                LineNo := LineNo + 10000;
                                                AcctType := AcctType::Savings;
                                                TransType := TransType::" ";

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                TransactionCharges.Description + ClosureAccounts."No.", ChargeAmount, SavingsAccounts2."No.", Rec."Closing Date", BalAccType,
                                                TransactionCharges."G/L Account", '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);


                                                //IF NOT TransactionCharges."Transaction Charge Category" THEN  BEGIN

                                                if TransactionCharges."Transaction Charge Category" <> TransactionCharges."Transaction Charge Category"::"Stamp Duty" then begin
                                                    //Excise Duty

                                                    LineNo := LineNo + 10000;
                                                    AcctType := AcctType::Savings;
                                                    TransType := TransType::" ";

                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                    Txt0001 + ClosureAccounts."No.", (ChargeAmount * GeneralSetUp."Excise Duty (%)") * 0.01, SavingsAccounts2."No.", Rec."Closing Date", BalAccType,
                                                    GeneralSetUp."Excise Duty G/L", '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                                    TCharges := TCharges + ChargeAmount;
                                                end;
                                            until TransactionCharges.Next = 0;
                                        end;
                                        NetAmount := NetAmount - (((ChargeAmount * GeneralSetUp."Excise Duty (%)") * 0.01) + ChargeAmount);
                                    end;
                                    //^^

                                    //Changes
                                    //CLosure Fee
                                    //*Oketch AccountClosureFee:=ProdutFactory."Closure Fee"

                                    AccountClosureFee := 0;
                                    Amount[2] := 0;

                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetRange(SavingsAccounts."Loan Disbursement Account", true);
                                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", Rec."Member No.");
                                    if SavingsAccounts.Find('-') then begin
                                        if ProdutFactory.Get(SavingsAccounts."Product Type") then begin
                                            AccountClosureFee := 0;
                                            TransactionCharges.Reset;
                                            TransactionCharges.SetRange(TransactionCharges."Transaction Type", ProdutFactory."Closure Fee");
                                            if TransactionCharges.Find('-') then begin
                                                repeat
                                                    Amount[1] := 0;
                                                    // Amount[2]:=0;
                                                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" then
                                                        Amount[1] := ((TotalSaving - RegistrationFee - ShareCapAmount - SinkFund) * TransactionCharges."Percentage of Amount") * 0.01
                                                    else
                                                        Amount[1] := TransactionCharges."Charge Amount";

                                                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin
                                                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                                        TariffDetails.Reset;
                                                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                                        if TariffDetails.Find('-') then begin
                                                            repeat
                                                                if ((TotalSaving - RegistrationFee - ShareCapAmount) >= TariffDetails."Lower Limit") and
                                                                    ((TotalSaving - RegistrationFee - ShareCapAmount) <= TariffDetails."Upper Limit") then begin
                                                                    if TariffDetails."Use Percentage" then
                                                                        Amount[1] := (TotalSaving - RegistrationFee - ShareCapAmount - SinkFund) * TariffDetails.Percentage * 0.01
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

                                            //MESSAGE(FORMAT(AccountClosureFee));

                                            LineNo := LineNo + 10000;
                                            AcctType := AcctType::Savings;
                                            TransType := TransType::" ";

                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                            TransactionCharges.Description + ClosureAccounts."No.", (AccountClosureFee), SavingsAccounts."No.", Rec."Closing Date", BalAccType,
                                            TransactionCharges."G/L Account", '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                            //Excise Duty

                                            LineNo := LineNo + 10000;
                                            AcctType := AcctType::Savings;
                                            TransType := TransType::" ";

                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                            Txt0001 + ClosureAccounts."No.", ((AccountClosureFee) * GeneralSetUp."Excise Duty (%)") * 0.01, SavingsAccounts."No.", Rec."Closing Date", BalAccType,
                                            GeneralSetUp."Excise Duty G/L", '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                            NetAmount := NetAmount - (((AccountClosureFee * GeneralSetUp."Excise Duty (%)") * 0.01) + AccountClosureFee);
                                        end;


                                        //SMS- Alert
                                        SendSms.SendSms(SourceType::"Member Withdrawal", SavingsAccounts."Transactional Mobile No", Text0005 + Format(Round(NetAmount, 1, '=')) + Text0006
                                        , SavingsAccounts."No.", SavingsAccounts."No.", false);
                                    end;

                                    //Changes
                                    //*


                                end else begin

                                    //Death Withdrawal loan Recovery
                                    Loans.Reset;
                                    Loans.SetRange(Loans."Member No.", Rec."Member No.");
                                    if Loans.Find('-') then begin
                                        repeat
                                            Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", "Outstanding Bills");

                                            //Recover Interest
                                            if Loans."Outstanding Interest" > 0 then begin
                                                //**Interest:=0;
                                                Interest := Loans."Outstanding Interest";
                                                LRepayment := Loans."Outstanding Balance";
                                                if Interest > 0 then begin
                                                    //Interest Recovery
                                                    LineNo := LineNo + 10000;
                                                    AcctType := AcctType::Credit;
                                                    TransType := TransType::"Interest Due";
                                                    BalAccNo := '';

                                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                    Txt0005, Interest * -1, Loans."Loan Account", Rec."Closing Date", BalAccType,
                                                    BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                                    Totalrecovered := Totalrecovered + (Interest);

                                                end;
                                            end;
                                            //Recover Repayment
                                            //**LRepayment:=0;
                                            LRepayment := Loans."Outstanding Balance";

                                            //IF (AvailableShares > 0) AND (LRepayment > 0) THEN BEGIN
                                            if LRepayment > 0 then begin
                                                LineNo := LineNo + 10000;
                                                AcctType := AcctType::Credit;
                                                TransType := TransType::Repayment;
                                                BalAccNo := '';

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                Txt0006, LRepayment * -1, Loans."Loan Account", Rec."Closing Date", BalAccType,
                                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);

                                                Totalrecovered := Totalrecovered + (LRepayment);

                                            end;

                                            //bills
                                            if Loans."Outstanding Bills" <> 0 then begin
                                                ClearBills := Loans."Outstanding Bills";

                                                ProdutFactory.Reset;
                                                ProdutFactory.SetRange("Product ID", Loans."Loan Product Type");
                                                if ProdutFactory.Find('-') then begin
                                                    BalAccNo := ProdutFactory."Billed Account";
                                                end;
                                                LineNo := LineNo + 10000;
                                                AcctType := AcctType::Credit;
                                                TransType := TransType::Bills;
                                                BalAccType := BalAccType::"G/L Account";
                                                Amt := -1 * ClearBills;

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                Txt0014, Amt, Loans."Loan Account", Rec."Closing Date", BalAccType,
                                                BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                                Amt := 0;
                                            end;
                                        until Loans.Next = 0;
                                    end;

                                    //Funeral Fee
                                    if GeneralSetUp."Funeral Amount" > 0 then begin

                                        LineNo := LineNo + 10000;
                                        AcctType := AcctType::"G/L Account";
                                        TransType := TransType::" ";
                                        BalAccNo := '';
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                        Txt0008 + ClosureAccounts."No.", GeneralSetUp."Funeral Amount", GeneralSetUp."Unloged Claims Account", Rec."Closing Date", BalAccType,
                                        BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                        TotalSaving := TotalSaving - (GeneralSetUp."Funeral Amount");
                                    end;

                                    //Unlogge Claims

                                    LineNo := LineNo + 10000;
                                    AcctType := AcctType::"G/L Account";
                                    TransType := TransType::" ";
                                    GeneralSetUp.TestField("Unloged Claims Account");
                                    GeneralSetUp.TestField("Insurance Name");
                                    BalAccNo := '';
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                    GeneralSetUp."Insurance Name" + Rec."No.", Totalrecovered, GeneralSetUp."Unloged Claims Account", Rec."Closing Date", BalAccType,
                                    BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                    //Withdrawal Fee
                                    if GeneralSetUp."Withdrawal Fee" > 0 then begin
                                        LineNo := LineNo + 10000;
                                        AcctType := AcctType::"G/L Account";
                                        TransType := TransType::" ";
                                        BalAccNo := '';
                                        GeneralSetUp.TestField(GeneralSetUp."Withdrawal Fee Account");

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                        Txt0009 + ClosureAccounts."No.", -GeneralSetUp."Withdrawal Fee", GeneralSetUp."Withdrawal Fee Account", Rec."Closing Date", BalAccType,
                                        BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                        TotalSaving := TotalSaving - (GeneralSetUp."Withdrawal Fee");

                                    end;

                                    //Start Recover Unpaid Dues
                                    ShareCapAmount := 0;
                                    RegistrationFee := 0;
                                    SinkFund := 0;
                                    SavingsAccounts2.Reset;
                                    SavingsAccounts2.SetRange("Member No.", Rec."Member No.");
                                    SavingsAccounts2.SetRange("Product Category", SavingsAccounts2."Product Category"::"Share Capital");
                                    if SavingsAccounts2.Find('-') then begin
                                        if ProdutFactory.Get(SavingsAccounts2."Product Type") then begin
                                            SavingsAccounts2.CalcFields("Balance (LCY)");
                                            if SavingsAccounts2."Balance (LCY)" < ProdutFactory."Minimum Balance" then begin
                                                ShareCapAmount := ProdutFactory."Minimum Balance" - SavingsAccounts2."Balance (LCY)";

                                                LineNo := LineNo + 10000;
                                                AcctType := AcctType::Savings;
                                                TransType := TransType::" ";
                                                BalAccNo := '';
                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                Txt0011 + ClosureAccounts."No.", -(ShareCapAmount), SavingsAccounts2."No.", Rec."Closing Date", BalAccType,
                                                BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                            end;
                                        end;
                                    end;


                                    SavingsAccounts2.Reset;
                                    SavingsAccounts2.SetRange("Member No.", Rec."Member No.");
                                    SavingsAccounts2.SetRange("Product Category", SavingsAccounts2."Product Category"::"Registration Fee");
                                    if SavingsAccounts2.Find('-') then begin
                                        if ProdutFactory.Get(SavingsAccounts2."Product Type") then begin
                                            SavingsAccounts2.CalcFields("Balance (LCY)");
                                            if SavingsAccounts2."Balance (LCY)" < 0 then begin
                                                RegistrationFee := SavingsAccounts2."Balance (LCY)" * -1;

                                                LineNo := LineNo + 10000;
                                                AcctType := AcctType::Savings;
                                                TransType := TransType::" ";
                                                BalAccNo := '';

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                Txt0012 + ClosureAccounts."No.", -RegistrationFee, SavingsAccounts2."No.", Rec."Closing Date", BalAccType,
                                                BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                            end;
                                        end;
                                    end;

                                    SavingsAccounts2.Reset;
                                    SavingsAccounts2.SetRange("Member No.", Rec."Member No.");
                                    SavingsAccounts2.SetRange("Product Category", SavingsAccounts2."Product Category"::Benevolent);
                                    if SavingsAccounts2.Find('-') then begin
                                        if ProdutFactory.Get(SavingsAccounts2."Product Type") then begin
                                            SavingsAccounts2.CalcFields("Balance (LCY)");
                                            if SavingsAccounts2."Balance (LCY)" < 0 then begin
                                                SinkFund := SavingsAccounts2."Balance (LCY)" * -1;
                                                LineNo := LineNo + 10000;
                                                AcctType := AcctType::Savings;
                                                TransType := TransType::" ";
                                                BalAccNo := '';

                                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                                Txt0012 + ClosureAccounts."No.", -SinkFund, SavingsAccounts2."No.", Rec."Closing Date", BalAccType,
                                                BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);

                                            end;
                                        end;
                                    end;
                                    //End Recover Unpaid Dues


                                    //Recover Through MC Account


                                    MCAcc.Reset;
                                    MCAcc.SetRange("No.", 'MC-' + SavingsAccounts."Member No.");
                                    if not MCAcc.Find('-') then begin
                                        MCAcc."No." := 'MC-' + SavingsAccounts."Member No.";
                                        MCAcc.Name := SavingsAccounts.Name;
                                        MCAcc."Post Code" := SavingsAccounts."Post Code";
                                        MCAcc.Address := SavingsAccounts."Post Code";
                                        MCAcc."Vendor Posting Group" := 'EXMEMBER';
                                        MCAcc.Blocked := MCAcc.Blocked::" ";
                                        MCAcc.Insert;//(TRUE);
                                    end;


                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetRange(SavingsAccounts."Loan Disbursement Account", true);
                                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", Rec."Member No.");
                                    if SavingsAccounts.Find('-') then begin
                                        SavingsAccounts.Status := SavingsAccounts.Status::Deceased;
                                    end;

                                    LineNo := LineNo + 10000;
                                    AcctType := AcctType::Vendor;
                                    TransType := TransType::" ";
                                    BalAccNo := '';

                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                    Txt0007 + ClosureAccounts."No.", -(TotalSaving - ChargeAmount), 'MC-' + SavingsAccounts."Member No.", Rec."Closing Date", BalAccType,
                                    BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);


                                    //Changes^^^^^^
                                    //CLosure Fee
                                    //*Oketch AccountClosureFee:=ProdutFactory."Closure Fee";
                                    AccountClosureFee := 0;
                                    Amount[2] := 0;
                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetRange(SavingsAccounts."Loan Disbursement Account", true);
                                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", Rec."Member No.");
                                    if SavingsAccounts.Find('-') then begin
                                        if ProdutFactory.Get(SavingsAccounts."Product Type") then begin
                                            AccountClosureFee := 0;
                                            TransactionCharges.Reset;
                                            TransactionCharges.SetRange(TransactionCharges."Transaction Type", ProdutFactory."Closure Fee");
                                            if TransactionCharges.Find('-') then begin
                                                repeat
                                                    Amount[1] := 0;
                                                    //Amount[2]:=0;
                                                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" then
                                                        Amount[1] := ((TotalSaving - ChargeAmount) * TransactionCharges."Percentage of Amount") * 0.01
                                                    else
                                                        Amount[1] := TransactionCharges."Charge Amount";

                                                    if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin
                                                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                                        TariffDetails.Reset;
                                                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                                        if TariffDetails.Find('-') then begin
                                                            repeat
                                                                if ((TotalSaving - ChargeAmount) >= TariffDetails."Lower Limit") and
                                                                    ((TotalSaving - ChargeAmount) <= TariffDetails."Upper Limit") then begin
                                                                    if TariffDetails."Use Percentage" then
                                                                        Amount[1] := (TotalSaving - ChargeAmount) * TariffDetails.Percentage * 0.01
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


                                            LineNo := LineNo + 10000;
                                            AcctType := AcctType::Vendor;
                                            TransType := TransType::" ";

                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                            TransactionCharges.Description + ClosureAccounts."No.", AccountClosureFee, 'MC-' + SavingsAccounts."Member No.", Rec."Closing Date", BalAccType,
                                            TransactionCharges."G/L Account", '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);


                                            //Excise Duty

                                            LineNo := LineNo + 10000;
                                            AcctType := AcctType::Vendor;
                                            TransType := TransType::" ";

                                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, Rec."No.",
                                            Txt0001 + ClosureAccounts."No.", (AccountClosureFee * GeneralSetUp."Excise Duty (%)") * 0.01, 'MC-' + SavingsAccounts."Member No.", Rec."Closing Date", BalAccType,
                                            GeneralSetUp."Excise Duty G/L", '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                        end;
                                    end;

                                    //Change^^^^


                                end;

                                /*//Advice Stop
                                    Loans.RESET;
                                    Loans.SETRANGE("Member No.","Member No.");
                                    Loans.SETRANGE("Recovery Mode",Loans."Recovery Mode"::Checkoff);
                                    Loans.SETFILTER("Outstanding Balance",'>0');
                                    IF Loans.FIND('-') THEN BEGIN
                                    REPEAT
                                    LoansProcess.AdviceLoan(Loans."Loan No.",TRUE);
                                    UNTIL Loans.NEXT=0;
                                    END;*/

                                //Post New
                                JournalPosting.CompletePosting(Jtemplate, JBatch);
                                //Post New

                                SavingsAccounts.Reset;
                                SavingsAccounts.SetRange(SavingsAccounts."Member No.", Rec."Member No.");
                                if SavingsAccounts.Find('-') then begin
                                    repeat
                                        /* IF SavingsAccounts."Product Category"=SavingsAccounts."Product Category"::"Deposit Contribution" THEN BEGIN
                                         PeriodicAcc.EmplyerSavingAdvice(SavingsAccounts,SavingsAccounts."Monthly Contribution",0);
                                         END ELSE IF SavingsAccounts."Product Category"=SavingsAccounts."Product Category"::Benevolent THEN BEGIN
                                         PeriodicAcc.EmplyerSavingAdvice(SavingsAccounts,SavingsAccounts."Monthly Contribution",0);
                                         END;*/
                                        if SavingsAccounts."Product Category" <> SavingsAccounts."Product Category"::"Share Capital" then begin
                                            if SavingsAccounts."Loan Disbursement Account" = false then begin
                                                SavingsAccounts.Status := SavingsAccounts.Status::Closed;
                                                SavingsAccounts.Blocked := SavingsAccounts.Blocked::All;
                                                SavingsAccounts.Modify;
                                            end;
                                        end;
                                    until SavingsAccounts.Next = 0;
                                end;


                                //--------
                                if Members.Get(Rec."Member No.") then begin

                                    if Members.Status = Members.Status::"Withdrawal Applicant" then begin
                                        Members.Blocked := Members.Blocked::All;
                                    end;
                                    Rec.Posted := true;
                                    SavingsAccounts.Reset;
                                    SavingsAccounts.SetRange("Member No.", Rec."Member No.");
                                    SavingsAccounts.SetRange("Product Category", SavingsAccounts."Product Category"::"Share Capital");
                                    SavingsAccounts.SetFilter("Balance (LCY)", '>0');
                                    if SavingsAccounts.Find('-') then
                                        Members.Status := Members.Status::"Withdrawn Shareholder"
                                    else
                                        Members.Status := Members.Status::Withdrawn;
                                    if Rec."Closure Type" = Rec."Closure Type"::"Withdrawal - Death" then Members.Status := Members.Status::Deceased;

                                    Members.Blocked := Members.Blocked::All;
                                    Members.Modify;
                                end;
                                Rec.Modify;

                            end;
                        end;


                        /*//send SMS to guarantors since loan is cleared
                        Loans2.CALCFIELDS("Total Loan Balance");
                        Loans2.RESET;
                        Loans2.SETRANGE("Member No.",Rec."Member No.");
                        Loans2.SETRANGE(Posted,TRUE);
                        Loans2.SETFILTER("Total Loan Balance",'>0');
                        IF Loans.FINDFIRST THEN BEGIN
                        REPEAT
                              LoanGuar.RESET;
                              LoanGuar.SETRANGE("Loan No",Loans2."Loan No.");
                              LoanGuar.SETRANGE("Self Guarantee",FALSE);
                              IF LoanGuar.FINDFIRST THEN BEGIN
                                IF Loans.GET(LoanGuar."Loan No") THEN BEGIN
                                  ProductType:=Loans."Loan Product Type Name";
                                  AppAmount:=Loans2."Approved Amount";
                                  END;
                                REPEAT
                                  IF Members.GET(LoanGuar."Member No") THEN
                                    CompInfo.GET;
                                      SendSms.SendSms(SourceType::"Loan Guarantors",Members."Mobile Phone No",
                                      'Dear '+LoanGuar.Name+', The '+ProductType+' of Ksh. '+FORMAT(AppAmount)+', you had guaranteed '+LoanGuar."Loanee Name"+' is now fully repaid.',
                                      Loans2."Loan No.",Loans2."Disbursement Account No",FALSE);

                                    UNTIL LoanGuar.NEXT=0;
                                    END;


                        UNTIL Loans.NEXT=0;
                        END;
                        //end of send SMS*/

                        Message('Closure posted successfully.');
                    end;

                end;
            }
            action("Reset Transaction Date")
            {
                Image = ChangeStatus;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;

                trigger OnAction()
                begin

                    Trans.Reset;
                    Trans.SetRange(Trans.Posted, false);
                    Trans.SetRange(Trans."No.", Rec."No.");
                    if Trans.Find('-') then begin

                        Rec."Closing Date" := Today;
                        Rec.Modify;

                        Message('Transaction date updated');

                    end else
                        Error('Transaction already posted');
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = Job;
                action(SendApprovalRequest)
                {
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange("Member No.", Rec."Member No.");
                        SavingsAccounts.SetRange("Loan Disbursement Account", true);
                        if not SavingsAccounts.Find('-') then
                            Error('Member does not have a savings account, Kindly create before proceeding');

                        if Rec."Closure Type" = Rec."Closure Type"::"Withdrawal - Normal" then
                            if (Rec."Total Interest" + Rec."Total Loan") > Rec."Member Savings" then
                                Error(Txt0002);

                        //IF (AccLine."Account No."='') AND (AccLine."No."<>'') THEN ERROR('Kindly Click Fill Accounts to Generate the Lines');
                        //CurrPage.UPDATE;

                        Rec.TestField(Remarks);
                        Rec.TestField("Closure Type");

                        //IF AccLine."Account No."='' THEN ERROR('Kindly Fill the Accounts');

                        if Rec.Status <> Rec.Status::Open then
                            Error(DocMustbeOpen);

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
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        if Rec.Status <> Rec.Status::Pending then
                            Error(DocMustbePending);

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Re-Open Document")
                {
                    Image = ReOpen;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        if Rec.Posted then Error('Document Already Posted');
                        if (Rec.Status = Rec.Status::Rejected) or (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) then begin
                            if Confirm('Are you sure you want to re-open the loan?', false) = true then begin
                                Rec.Status := Rec.Status::Open;
                                Rec.Modify;
                                CurrPage.Update(true);
                            end;
                        end;
                    end;
                }
                action(z)
                {

                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::Approved;
                        Rec.Modify;
                        Message('hhh');
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec.Posted = true then
            CurrPage.Editable := false;
        SetControlAppearance;
    end;

    trigger OnOpenPage()
    begin
        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Pending) then
            CurrPage.Editable := false;
        SetControlAppearance;
    end;

    var
        ErrTxt0000: Label 'Account already Posted';
        ErrTxt0001: Label 'Account cannot be colsed, insufficient funds';
        ErrTxt0002: Label 'The request must be approved';
        Trans: Record "Membership closure";
        Members: Record Members;
        ConfmTxt0003: Label 'Are you sure you want to recover the loans from the members shares?';
        GeneralSetUp: Record "General Set-Up";
        BankingUserTemplate: Record "Banking User Template";
        Jtemplate: Code[20];
        JBatch: Code[20];
        Totalrecovered: Decimal;
        TotalSaving: Decimal;
        AvailableSharesd: Decimal;
        Funeral: Decimal;
        Gnljnline: Record "Gen. Journal Line";
        ClosureAccounts: Record "Account Closure Line";
        ClosureAccountsII: Record "Account Closure Line";
        AvailableShares: Decimal;
        JournalPosting: Codeunit "Journal Posting";
        ProdutFactory: Record "Product Factory";
        AcctType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        TransType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills;
        AccNo: Code[10];
        BalAccNo: Code[10];
        Amt: Decimal;
        LineNo: Integer;
        Txt0004: Label 'Member closure';
        SavingsAccounts: Record "Savings Accounts";
        Loans: Record Loans;
        RecoverLoan: Boolean;
        Interest: Decimal;
        LRepayment: Decimal;
        Txt0005: Label 'Interest Recovery from deposits';
        Txt0006: Label 'Principle Recovery from deposits';
        Txt0007: Label 'Member Withdrawal Account No';
        Txt0008: Label 'Funeral Expenses';
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        Txt0000: Label 'Checkoff has been posted';
        MemberwithdrawalNotice: Record "Member withdrawal Notice";
        TCharges: Decimal;
        ChargeAmount: Decimal;
        TransactionTypes: Record "Transaction Types";
        Txt0001: Label 'Excise Duty';
        Membershipclosure: Record "Membership closure";
        Txt0002: Label 'Member cannot close the account before clearing the loans';
        UserSetup: Record "User Setup";
        Dim1: Code[10];
        Dim2: Code[10];
        Txt0009: Label 'Withdrawal Fee';
        AccountClosureFee: Decimal;
        Txt0010: Label 'Account Closure Fee';
        "-": Integer;
        TransactionCharges: Record "Transaction Charges";
        TariffDetails: Record "Tiered Charges Lines";
        Amount: array[2] of Decimal;
        SavingsAccounts2: Record "Savings Accounts";
        ShareCapAmount: Decimal;
        Txt0011: Label 'Share Capital Reovery';
        RegistrationFee: Decimal;
        Txt0012: Label 'Registration Fee Recovery';
        PeriodicAcc: Codeunit "Periodic Activities";
        LoansProcess: Codeunit "Loans Process";
        SinkFund: Decimal;
        SavingsLedgerEntry: Record "Savings Ledger Entry";
        Txt0013: Label 'Closure Line does not belong to this member';
        EOFAccountClosure: Boolean;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book",Internetbanking,CRM,"Member Withdrawal";
        SendSms: Codeunit SendSms;
        NetAmount: Decimal;
        ClearBills: Decimal;
        Txt0014: Label 'Bills Cleared on Accounts Closure';
        AccLine: Record "Account Closure Line";
        GenSetup: Record "General Set-Up";
        ProductFactory: Record "Product Factory";
        LoanTotal: Decimal;
        IntTotal: Decimal;
        BBF: Decimal;
        Loans2: Record Loans;
        LoanGuar: Record "Loan Guarantors and Security";
        ProductType: Text;
        AppAmount: Decimal;
        CompInfo: Record "Company Information";
        VisiblePArt: Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        if Rec."Closure Type" = Rec."Closure Type"::"Withdrawal - Partial" then
            VisiblePArt := true else
            VisiblePArt := false;
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

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
        SavingsAccounts.SetRange("Member No.", Rec."Member No.");
        SavingsAccounts.SetRange("Product Category", SavingsAccounts."Product Category"::"Deposit Contribution");
        if SavingsAccounts.Find('-') then begin
            SavingsAccounts.CalcFields("Balance (LCY)");
        end;
        MemberwithdrawalNotice.Reset;
        MemberwithdrawalNotice.SetRange(MemberwithdrawalNotice."Member No.", Rec."Member No.");
        MemberwithdrawalNotice.SetRange(MemberwithdrawalNotice.Status, MemberwithdrawalNotice.Status::Approved);
        if MemberwithdrawalNotice.Find('+') then begin
            if MemberwithdrawalNotice."Maturity Date" > Rec."Closing Date" then begin
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

    end;

    //[Scope('Internal')]
    procedure PostPartialWithdrawals(MembershipclosureOO: Record "Membership closure")
    var
        Text0005: Label 'Dear member, Your shares refund of Kes ';
        Text0006: Label ' has been credited to your FOSA account. Access via MSACCO or ATM. Harambee SACCO.';
        MCAcc: Record Vendor;
        TotalDebits: Decimal;
        TotaLoan: Decimal;
        LoanBalTota: Decimal;
        FosaAccount: Code[20];
    begin
        with MembershipclosureOO do begin

            Membershipclosure.Reset;
            Membershipclosure.SetRange("No.", Rec."No.");
            if Membershipclosure.FindFirst then
                if Rec.Posted = true then Error('Already Posted');

            SavingsLedgerEntry.Reset;
            SavingsLedgerEntry.SetRange("Document No.", "No.");
            SavingsLedgerEntry.SetRange("Posting Date", "Closing Date");
            if SavingsLedgerEntry.Find('-') then begin
                Posted := true;
                Modify;
            end else begin

                if Posted = true then
                    Error(ErrTxt0000);


                if "Partial Deposit Refundable" <= 0 then
                    Error(ErrTxt0001);

                Rec.TestField("Closing Date");

                if Status <> Status::Approved then
                    Error(ErrTxt0002);
                ClosureAccountsII.Reset;
                ClosureAccountsII.SetRange(ClosureAccountsII."No.", "No.");
                ClosureAccountsII.SetRange(ClosureAccountsII.Close, true);
                if ClosureAccountsII.Find('-') then begin
                    repeat
                        ClosureAccountsII.Validate("Account No.");
                    until ClosureAccountsII.Next = 0;
                end;

                if Members.Get("Member No.") then begin
                    if Confirm(ConfmTxt0003) = false then
                        exit;

                    TotaLoan := 0;
                    //send SMS to guarantors since loan is cleared
                    //IF ("Closure Type"="Closure Type"::"Withdrawal - Death") OR ("Closure Type"="Closure Type"::"Withdrawal - Normal") THEN BEGIN
                    Loans2.CalcFields("Total Loan Balance");
                    Loans2.Reset;
                    Loans2.SetRange("Member No.", Rec."Member No.");
                    Loans2.SetRange(Posted, true);
                    Loans2.SetFilter("Total Loan Balance", '>0');
                    if Loans2.FindFirst then begin
                        repeat

                            Loans2.CalcFields("Total Loan Balance");
                            //MESSAGE(FORMAT(Loans2."Total Loan Balance"));;
                            TotaLoan += Loans2."Total Loan Balance";
                            //MESSAGE(FORMAT(TotaLoan));
                            LoanGuar.Reset;
                            LoanGuar.SetRange("Loan No", Loans2."Loan No.");
                            LoanGuar.SetRange(Substituted, false);
                            LoanGuar.SetRange("Self Guarantee", false);
                            if LoanGuar.FindFirst then begin
                                if Loans2.Get(LoanGuar."Loan No") then begin
                                    ProductType := Loans2."Loan Product Type Name";
                                    AppAmount := Loans2."Approved Amount";
                                end;
                                repeat
                                    if Members.Get(LoanGuar."Member No") then
                                        CompInfo.Get;
                                    SendSms.SendSms(SourceType::"Loan Guarantors", Members."Mobile Phone No",
                                    'Dear ' + LoanGuar.Name + ', The ' + ProductType + ' of Ksh. ' + Format(AppAmount) + ', you had guaranteed ' + LoanGuar."Loanee Name" + ' is now fully repaid.',
                                    Loans2."Loan No.", Loans2."Disbursement Account No", false);

                                until LoanGuar.Next = 0;
                            end;

                        until Loans2.Next = 0;
                    end;

                    //end of send SMS


                    GeneralSetUp.Get();
                    BankingUserTemplate.Get(UserId);
                    if UserSetup.Get(UserId) then begin
                        Dim1 := UserSetup."Global Dimension 1 Code";
                        Dim2 := UserSetup."Global Dimension 2 Code";
                    end;

                    Jtemplate := BankingUserTemplate."Check Off Template";
                    JBatch := BankingUserTemplate."Check Off Batch";


                    //delete journal line
                    Gnljnline.Reset;
                    Gnljnline.SetRange("Journal Template Name", Jtemplate);
                    Gnljnline.SetRange("Journal Batch Name", JBatch);
                    Gnljnline.DeleteAll;
                    //end of deletion

                    Totalrecovered := 0;
                    TotalSaving := 0;
                    TotalDebits := 0;
                    //    IF GeneralSetUp."Withdrawal Fee">0 THEN BEGIN
                    //      TotalDebits:=GeneralSetUp."Withdrawal Fee";
                    //      END;
                    AvailableShares := "Partial Deposit Refundable";//"Member Savings"-((100-"% of Refunds")*"Deposit Refundable"/100);
                                                                    //ERROR(FORMAT(AvailableShares));
                    Funeral := 0;
                    ClearBills := 0;
                    //Members."Withdrawal Posted":=TRUE;
                    //Advice:=TRUE;
                    //Members.MODIFY;

                    //Dep was here


                    if "Closure Type" = "Closure Type"::"Withdrawal - Partial" then begin
                        Loans.Reset;



                        NetAmount := 0;
                        //Recover Through Saving the Balance
                        //TotalSaving:=0;//TotalSaving-TCharges;
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange(SavingsAccounts."Loan Disbursement Account", true);
                        SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
                        if SavingsAccounts.Find('-') then begin
                            /*LineNo:=LineNo+10000;
                            AcctType:=AcctType::Savings;
                            TransType:=TransType::" ";
                             BalAccNo:='';

                            JournalPosting.PostJournal(Jtemplate,JBatch,LineNo,AcctType,"No.",
                            Txt0007+ClosureAccounts."No.",-("Partial Deposit Refundable"),SavingsAccounts."No.","Closing Date",BalAccType,
                            BalAccNo,'',Dim1,Dim2,TransType,'','','',0,'',0);*/
                            TotalDebits += Abs("Partial Deposit Refundable");
                        end;
                        NetAmount := (TotalSaving - RegistrationFee - ShareCapAmount - SinkFund);
                        //CLosure Fee
                        //*Oketch AccountClosureFee:=ProdutFactory."Closure Fee"

                        AccountClosureFee := 0;

                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange(SavingsAccounts."Loan Disbursement Account", true);
                        SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
                        if SavingsAccounts.Find('-') then begin
                            if ProdutFactory.Get(SavingsAccounts."Product Type") then begin
                                GeneralSetUp.Get();

                                //Withdrawal Fee
                                if GeneralSetUp."Withdrawal Fee" > 0 then begin
                                    LineNo := LineNo + 10000;
                                    AcctType := AcctType::Savings;
                                    TransType := TransType::" ";
                                    BalAccNo := GeneralSetUp."Withdrawal Fee Account";
                                    GeneralSetUp.TestField(GeneralSetUp."Withdrawal Fee Account");

                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, "No.",
                                    Txt0009 + ClosureAccounts."No.", GeneralSetUp."Withdrawal Fee", SavingsAccounts."No.", "Closing Date", BalAccType,
                                    BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                    TotalDebits += Abs(GeneralSetUp."Withdrawal Fee");
                                    TotalSaving := TotalSaving - (GeneralSetUp."Withdrawal Fee");

                                end;



                                AccountClosureFee := 0;
                                Amount[2] := 0;
                                TransactionCharges.Reset;
                                TransactionCharges.SetRange(TransactionCharges."Transaction Type", ProdutFactory."Closure Fee");
                                if TransactionCharges.Find('-') then begin
                                    repeat
                                        Amount[1] := 0;

                                        if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" then
                                            Amount[1] := (("Partial Deposit Refundable") * TransactionCharges."Percentage of Amount") * 0.01
                                        else
                                            Amount[1] := TransactionCharges."Charge Amount";

                                        if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin
                                            TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                            TariffDetails.Reset;
                                            TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                            if TariffDetails.Find('-') then begin
                                                repeat
                                                    if (("Partial Deposit Refundable") >= TariffDetails."Lower Limit") and
                                                        (("Partial Deposit Refundable") <= TariffDetails."Upper Limit") then begin
                                                        if TariffDetails."Use Percentage" then
                                                            Amount[1] := ("Partial Deposit Refundable") * TariffDetails.Percentage * 0.01
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


                                LineNo := LineNo + 10000;
                                AcctType := AcctType::Savings;
                                TransType := TransType::" ";

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, "No.",
                                TransactionCharges.Description + ClosureAccounts."No.", (AccountClosureFee), SavingsAccounts."No.", "Closing Date", BalAccType,
                                TransactionCharges."G/L Account", '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                TotalDebits += Abs(AccountClosureFee);

                                //Excise Duty

                                LineNo := LineNo + 10000;
                                AcctType := AcctType::Savings;
                                TransType := TransType::" ";

                                JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, "No.",
                                Txt0001 + ClosureAccounts."No.", ((AccountClosureFee) * GeneralSetUp."Excise Duty (%)") * 0.01, SavingsAccounts."No.", "Closing Date", BalAccType,
                                GeneralSetUp."Excise Duty G/L", '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                TotalDebits += Abs(AccountClosureFee * GeneralSetUp."Excise Duty (%)" * 0.01);
                                NetAmount := AvailableShares;//-(((AccountClosureFee*GeneralSetUp."Excise Duty (%)")*0.01)+AccountClosureFee);
                            end;

                            //SMS- Alert
                            SendSms.SendSms(SourceType::"Member Withdrawal", SavingsAccounts."Transactional Mobile No", Text0005 + Format(Round(NetAmount, 1, '=')) + Text0006
                            , SavingsAccounts."No.", SavingsAccounts."No.", false);
                        end;


                        //TotalDebits+=;

                        //Changes
                        //*
                        //Added Debit deposits
                        //Close Accounts
                        ClosureAccounts.Reset;
                        ClosureAccounts.SetRange(ClosureAccounts."No.", "No.");
                        ClosureAccounts.SetRange(ClosureAccounts.Close, true);
                        if ClosureAccounts.Find('-') then begin
                            repeat
                                // ClosureAccounts.VALIDATE("Account No.");
                                if ProdutFactory.Get(ClosureAccounts."Product Type") then begin
                                    if ProdutFactory."Product Category" = ProdutFactory."Product Category"::"Deposit Contribution" then begin
                                        Amt := 0;
                                        LineNo := LineNo + 10000;
                                        AcctType := AcctType::Savings;
                                        TransType := TransType::" ";
                                        BalAccNo := '';
                                        Amt := (TotalDebits + TotaLoan);
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, "No.",
                                        CopyStr(('Partial Withrawal-' + Remarks), 1, 50),/*ClosureAccounts.Balance-"Premature Charges"*/Amt * 1, ClosureAccounts."Account No.", "Closing Date", BalAccType,
                                        BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                    end else begin


                                        LineNo := LineNo + 10000;
                                        AcctType := AcctType::Savings;
                                        TransType := TransType::" ";
                                        BalAccNo := '';

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, "No.",
                                        Txt0004, ClosureAccounts.Balance, ClosureAccounts."Account No.", "Closing Date", BalAccType,
                                        BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                                    end;
                                    TotalSaving := TotalSaving + (ClosureAccounts.Balance);//-AccountClosureFee)
                                                                                           //END;
                                end;
                                TotalSaving := AvailableShares;

                            until ClosureAccounts.Next = 0;
                            TotalSaving := TotalSaving;//-"Premature Charges";
                        end;


                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange(SavingsAccounts."Loan Disbursement Account", true);
                        SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
                        if SavingsAccounts.Find('-') then begin
                            LineNo := LineNo + 10000;
                            Amt := 0;
                            AcctType := AcctType::Savings;
                            TransType := TransType::" ";
                            BalAccNo := '';
                            Amt := TotalDebits + TotaLoan;
                            FosaAccount := SavingsAccounts."No.";
                            JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, "No.",
                            CopyStr((('Partial Withrawal- ' + Remarks) + ClosureAccounts."No."), 1, 50), -(Amt), SavingsAccounts."No.", "Closing Date", BalAccType,
                            BalAccNo, '', Dim1, Dim2, TransType, '', '', '', 0, '', 0);
                            //TotalDebits+=ABS("Partial Deposit Refundable");
                            //Pay Loans

                            LoanBalTota := 0;
                            Loans.Reset;
                            Loans.SetRange(Loans."Member No.", "Member No.");
                            Loans.SetFilter("Total Loan Balance", '>%1', 0);
                            if Loans.Find('-') then begin
                                repeat
                                    LoanBalTota := 0;
                                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", "Outstanding Bills");
                                    Amt := 0;
                                    Interest := 0;
                                    //Recover Interest
                                    if Loans."Outstanding Interest" > 0 then begin
                                        //**Interest:=0;
                                        Interest := Loans."Outstanding Interest";
                                        //Interest Recovery
                                        LineNo := LineNo + 10000;
                                        AcctType := AcctType::Credit;
                                        TransType := TransType::"Interest Paid";
                                        Amt := -1 * Interest;
                                        BalAccNo := '';
                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, "No.",
                                        Txt0005, Amt, Loans."Loan Account", "Closing Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                        LoanBalTota += Abs(Amt);

                                    end;
                                    //Recover Repayment
                                    //**LRepayment:=0;
                                    Amt := 0;
                                    if Loans."Outstanding Balance" > 0 then begin
                                        Amt := 0;
                                        LineNo := LineNo + 10000;
                                        AcctType := AcctType::Credit;
                                        TransType := TransType::Repayment;
                                        BalAccNo := '';
                                        Amt := -1 * Loans."Outstanding Balance";

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, "No.",
                                        Txt0006, Amt, Loans."Loan Account", "Closing Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                        LoanBalTota += Abs(Amt);
                                    end;

                                    //Debit Fosa Account with Loan Amount

                                    //error(FORMAT(LoanBalTota));
                                    LineNo := LineNo + 10000;
                                    JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType::Savings, "No.",
                                              Loans."Loan Product Type Name", LoanBalTota * 1, FosaAccount, "Closing Date", BalAccType,
                                              '', '', Dim1, Dim2, TransType::" ", '', '', '', 0, '', 0);


                                    //bills
                                    if Loans."Outstanding Bills" <> 0 then begin
                                        ClearBills := Loans."Outstanding Bills";

                                        ProdutFactory.Reset;
                                        ProdutFactory.SetRange("Product ID", Loans."Loan Product Type");
                                        if ProdutFactory.Find('-') then begin
                                            BalAccNo := ProdutFactory."Billed Account";
                                        end;
                                        LineNo := LineNo + 10000;
                                        AcctType := AcctType::Credit;
                                        TransType := TransType::Bills;
                                        BalAccType := BalAccType::"G/L Account";
                                        Amt := -1 * ClearBills;

                                        JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AcctType, "No.",
                                        Txt0014, Amt, Loans."Loan Account", "Closing Date", BalAccType,
                                        BalAccNo, Loans."Loan No.", Dim1, Dim2, TransType, Loans."Loan No.", '', '', 0, '', 0);
                                        Amt := 0;

                                    end;


                                until Loans.Next = 0;
                            end;

                            //End of loan payments
                        end;
                        //End of Close Accounts

                    end;

                    //Post New
                    JournalPosting.CompletePosting(Jtemplate, JBatch);
                    //Post New

                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
                    if SavingsAccounts.Find('-') then begin
                        repeat
                            /* IF SavingsAccounts."Product Category"=SavingsAccounts."Product Category"::"Deposit Contribution" THEN BEGIN
                             PeriodicAcc.EmplyerSavingAdvice(SavingsAccounts,SavingsAccounts."Monthly Contribution",0);
                             END ELSE IF SavingsAccounts."Product Category"=SavingsAccounts."Product Category"::Benevolent THEN BEGIN
                             PeriodicAcc.EmplyerSavingAdvice(SavingsAccounts,SavingsAccounts."Monthly Contribution",0);
                             END;*/
                            if SavingsAccounts."Product Category" <> SavingsAccounts."Product Category"::"Share Capital" then begin
                                if SavingsAccounts."Loan Disbursement Account" = false then begin
                                    //SavingsAccounts.Status:=SavingsAccounts.Status::Closed;
                                    //SavingsAccounts.Blocked:=SavingsAccounts.Blocked::All;
                                    //SavingsAccounts.MODIFY;
                                end;
                            end;
                        until SavingsAccounts.Next = 0;
                    end;


                    //--------
                    if Members.Get("Member No.") then begin

                        if Members.Status = Members.Status::"Withdrawal Applicant" then begin
                            Members.Blocked := Members.Blocked::All;
                        end;
                        Posted := true;
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange("Member No.", "Member No.");
                        SavingsAccounts.SetRange("Product Category", SavingsAccounts."Product Category"::"Share Capital");
                        SavingsAccounts.SetFilter("Balance (LCY)", '>0');
                        if SavingsAccounts.Find('-') then
                            Members.Status := Members.Status::"Withdrawn Shareholder"
                        else
                            Members.Status := Members.Status::Withdrawn;

                        Members.Blocked := Members.Blocked::All;
                        //Members.MODIFY;
                    end;
                    Modify;

                end;
            end;


            /*//send SMS to guarantors since loan is cleared
            Loans2.CALCFIELDS("Total Loan Balance");
            Loans2.RESET;
            Loans2.SETRANGE("Member No.",Rec."Member No.");
            Loans2.SETRANGE(Posted,TRUE);
            Loans2.SETFILTER("Total Loan Balance",'>0');
            IF Loans.FINDFIRST THEN BEGIN
            REPEAT
                  LoanGuar.RESET;
                  LoanGuar.SETRANGE("Loan No",Loans2."Loan No.");
                  LoanGuar.SETRANGE("Self Guarantee",FALSE);
                  IF LoanGuar.FINDFIRST THEN BEGIN
                    IF Loans.GET(LoanGuar."Loan No") THEN BEGIN
                      ProductType:=Loans."Loan Product Type Name";
                      AppAmount:=Loans2."Approved Amount";
                      END;
                    REPEAT
                      IF Members.GET(LoanGuar."Member No") THEN
                        CompInfo.GET;
                          SendSms.SendSms(SourceType::"Loan Guarantors",Members."Mobile Phone No",
                          'Dear '+LoanGuar.Name+', The '+ProductType+' of Ksh. '+FORMAT(AppAmount)+', you had guaranteed '+LoanGuar."Loanee Name"+' is now fully repaid.',
                          Loans2."Loan No.",Loans2."Disbursement Account No",FALSE);

                        UNTIL LoanGuar.NEXT=0;
                        END;


            UNTIL Loans.NEXT=0;
            END;
            //end of send SMS*/

            Message('Closure posted successfully.');
        end;

    end;
}

