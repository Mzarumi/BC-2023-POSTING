table 52185690 "Product Factory"
{

    fields
    {
        field(1; "Product ID"; Code[10])
        {
        }
        field(2; "Product Description"; Text[100])
        {
        }
        field(3; "Product Class Type"; Option)
        {
            Description = 'Whether Loan Accounts or Operational accounts';
            OptionCaption = ' ,Loan,Savings';
            OptionMembers = " ",Loan,Savings;
        }
        field(4; "Interest Rate (Min.)"; Decimal)
        {
        }
        field(5; "Interest Rate (Max.)"; Decimal)
        {
        }
        field(6; "Installment Repayment Interval"; DateFormula)
        {
        }
        field(7; Status; Option)
        {
            OptionCaption = 'Open,Active,Blocked';
            OptionMembers = Open,Active,Blocked;

            trigger OnValidate()
            begin
                case Status of
                    Status::Active:
                        begin

                            case "Product Class Type" of
                                "Product Class Type"::Savings:
                                    begin
                                        TestField("Product ID");
                                        TestField("Product Description");
                                        TestField("Interest Rate (Min.)");
                                        TestField("Account No. Prefix");
                                        TestField("Product Posting Group");
                                    end;

                                "Product Class Type"::Loan:
                                    begin
                                        TestField("Product ID");
                                        TestField("Product Description");
                                        TestField("Interest Rate (Min.)");
                                        TestField("Account No. Prefix");

                                        TestField("Loan  Account [G/L]");
                                        TestField("Loan Interest Account [G/L]");
                                        TestField("Loan Receivable Account[G/L]");
                                        TestField("Bill Account");
                                        TestField("Product Posting Group");

                                        /*TESTFIELD(); TESTFIELD(); TESTFIELD(); TESTFIELD(); TESTFIELD(); TESTFIELD();*/
                                    end;
                            end;


                        end;
                end;

            end;
        }
        field(8; Currency; Code[10])
        {
            TableRelation = Currency.Code;
        }
        field(9; "Fixed Loan Term"; Boolean)
        {
        }
        field(10; "Withdrawal Interval"; DateFormula)
        {
            Description = 'Daily,Weekly,Monthly,Quoterly,Yearly';
        }
        field(11; "Maximum No. of Withdrawal"; Integer)
        {
        }
        field(12; "Product Ownership"; Option)
        {
            OptionCaption = 'Individual,Joint,Group/Business,Corporate';
            OptionMembers = Individual,Joint,"Group/Business",Corporate;
        }
        field(13; "Min. Customer Age"; DateFormula)
        {
        }
        field(14; "Max.Customer Age"; DateFormula)
        {
        }
        field(15; "Credit Limit(Overdraft)"; Decimal)
        {
        }
        field(16; "Minimum Balance"; Decimal)
        {
            Description = 'Operational deposit and withdrawable accounts- formely FOSA';

            trigger OnValidate()
            begin
                if "Minimum Balance" < 0 then
                    Error('Minimum balance cannot be less than zero');
            end;
        }
        field(17; "Automatic Overdraft"; Boolean)
        {
            Description = 'Current & Savings account';
        }
        field(18; "Customer Segment"; Code[30])
        {
            Description = 'Lookup to the Customer Segmentation';
        }
        field(19; "Minimum Contribution"; Decimal)
        {
            Description = 'FDR Account';
        }
        field(20; "Product Insured"; Boolean)
        {
        }
        field(21; "Account Minimum Balance[%]"; Decimal)
        {
        }
        field(22; "Loan  Account [G/L]"; Code[15])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(23; "Loan Interest Account [G/L]"; Code[15])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(24; "Loan Receivable Account[G/L]"; Code[15])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(25; "Use Cycle"; Boolean)
        {
        }
        field(26; "Grace Period - Interest"; DateFormula)
        {
        }
        field(27; "Product Posting Group"; Code[10])
        {
            Description = 'LookUp to Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(28; "Closure Fee"; Code[10])
        {
            Description = 'Savings products';
            TableRelation = "Transaction Types".Code WHERE(Type = CONST("Member Withdrawal"));
        }
        field(29; "Dormancy Period"; DateFormula)
        {
            Description = 'Account no transactions';
        }
        field(30; "Account No. Prefix"; Code[4])
        {
        }
        field(31; "Maximum Guarantors"; Integer)
        {
        }
        field(32; "Minimum Guarantors"; Integer)
        {
        }
        field(33; "Min. Re-application Period"; DateFormula)
        {
        }
        field(34; "Minimum Loan Amount"; Decimal)
        {
        }
        field(35; "Maximum Loan Amount"; Decimal)
        {
        }
        field(36; "Product Category"; Option)
        {
            Description = 'Option to help identify type of savings accounts';
            OptionCaption = ' ,Share Capital,Deposit Contribution,Fixed Deposit,Junior Savings,Registration Fee,Benevolent,Unallocated Fund,Premier Club Reg Fee,Premier Club Account,Investment Account,Holiday Account,Agent Account,Business Account';
            OptionMembers = " ","Share Capital","Deposit Contribution","Fixed Deposit","Junior Savings","Registration Fee",Benevolent,"Unallocated Fund","Premier Club Reg Fee","Premier Club Account","Investment Account","Holiday Account","Agent Account","Business Account";
        }
        field(37; "Interest Calculation Method"; Option)
        {
            OptionCaption = 'Amortised,Reducing Balance,Straight Line,Reducing Flat';
            OptionMembers = Amortised,"Reducing Balance","Straight Line","Reducing Flat";
        }
        field(38; "Prefferential Default installm"; Integer)
        {
        }
        field(39; "Ordinary Default Intallments"; Integer)
        {
        }
        field(40; "Can Guarantee Loan"; Boolean)
        {
        }
        field(41; "Loan Disbursement Account"; Boolean)
        {
        }
        field(42; "Charge Closure Before Maturity"; Decimal)
        {
        }
        field(43; "Earns Interest"; Boolean)
        {
        }
        field(44; "Interest Expense Account"; Code[15])
        {
            TableRelation = "G/L Account";
        }
        field(45; "Interest Payable Account"; Code[15])
        {
            TableRelation = "G/L Account";
        }
        field(46; "External EFT Charges"; Decimal)
        {
        }
        field(47; "Interest Calc Min Balance"; Decimal)
        {
        }
        field(48; "Penalty Calculation Days"; DateFormula)
        {
        }
        field(49; "Penalty Percentage"; Decimal)
        {
        }
        field(50; "Penalty Calculation Method"; Option)
        {
            OptionMembers = "No Penalty","Principal in Arrears","Principal in Arrears+Interest in Arrears","Principal in Arrears+Interest in Arrears+Penalty in Arrears";
        }
        field(51; "Penalty Paid Account"; Code[15])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(52; "Ordinary Deposits Multiplier"; Integer)
        {
        }
        field(53; "Preferential Dep. Multiplier"; Integer)
        {
        }
        field(54; "Allow Multiple Running Loans"; Boolean)
        {
        }
        field(55; "Loan Security Inclination"; Option)
        {
            OptionCaption = ' ,Short Loan Security,Long Term Loan Security';
            OptionMembers = " ","Short Term Loan Security","Long Term Loan Security";
        }
        field(56; "Loan Span"; Option)
        {
            OptionCaption = ' ,Short Term,Long Term';
            OptionMembers = " ","Short Term","Long Term";
        }
        field(57; "Recovery Priority"; Integer)
        {

            // trigger OnValidate()
            // var
            //     SavingsAccounts: Record Savings Accoounts
            // begin
            //     SavingsAccounts.Reset;
            //     SavingsAccounts.SetRange(SavingsAccounts."Product Type", "Product ID");
            //     if SavingsAccounts.Find('-') then begin
            //         repeat
            //             SavingsAccounts."Recovery Priority" := "Recovery Priority";
            //             SavingsAccounts.Modify;
            //         until SavingsAccounts.Next = 0;
            //     end;

            //     Loans.Reset;
            //     Loans.SetRange(Loans."Loan Product Type", "Product ID");
            //     if Loans.Find('-') then begin
            //         repeat
            //             Loans."Recovery Priority" := "Recovery Priority";
            //             Loans.Modify;
            //         until Loans.Next = 0;
            //     end;
            // end;
        }
        field(58; "Membership Type"; Option)
        {
            OptionCaption = ',Ordinary,Preferential';
            OptionMembers = ,Ordinary,Preferential;
        }
        field(59; "Repay Mode"; Option)
        {
            OptionCaption = ' ,Checkoff,Salary,Dividend,Fixed Deposit,Internal STO, External STO,D Allowance';
            OptionMembers = " ",Checkoff,Salary,Dividend,"Fixed Deposit","Internal STO"," External STO","D Allowance";
        }
        field(60; "Compute Interest Due on Postin"; Option)
        {
            OptionCaption = ' ,Full Interest,Pro-rata';
            OptionMembers = " ","Full Interest","Pro-rata";
        }
        field(61; "Withholding Tax Account"; Code[15])
        {
            TableRelation = "G/L Account";
        }
        field(62; "WithHolding Tax"; Decimal)
        {
        }
        field(63; "Bill Account"; Code[20])
        {
            TableRelation = "G/L Account"."No." WHERE("Direct Posting" = CONST(false));
        }
        field(64; "Billed Account"; Code[20])
        {
            TableRelation = "G/L Account"."No." WHERE("Direct Posting" = CONST(true));
        }
        field(65; "Auto Open Account"; Boolean)
        {
        }
        field(66; "Dividend Calc. Method"; Option)
        {
            OptionCaption = ' ,Flat Rate,Prorated';
            OptionMembers = " ","Flat Rate",Prorated;
        }
        field(67; "Allow Over Draft"; Boolean)
        {
        }
        field(68; "Over Draft Interest %"; Decimal)
        {
        }
        field(69; "Over Draft Interest Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(70; "Allow Multiple Over Draft"; Boolean)
        {
        }
        field(71; "Search Code"; Code[20])
        {
        }
        field(72; "Allow Multiple Accounts"; Boolean)
        {
        }
        field(73; "Maximum Deposit Contribution"; Decimal)
        {
        }
        field(74; "Minimum Deposit Balance"; Decimal)
        {
        }
        field(75; "Type of Discounting"; Option)
        {
            OptionCaption = ' ,Loan Discounting,Invoice Discounting,Cheque Discounting';
            OptionMembers = " ","Loan Discounting","Invoice Discounting","Cheque Discounting";
        }
        field(76; "Suspend Interest Account [G/L]"; Code[15])
        {
            TableRelation = "G/L Account"."No." WHERE("Direct Posting" = FILTER(true));
        }
        field(77; "Repayment Frequency"; Option)
        {
            OptionCaption = 'Daily,Weekly,Monthly,Quarterly,Yearly';
            OptionMembers = Daily,Weekly,Monthly,Quarterly,Yearly;
        }
        field(78; "Grace Period - Principle"; DateFormula)
        {
        }
        field(79; "Nature of Loan Type"; Option)
        {
            OptionCaption = ' ,Normal,Defaulter,Bridging Loan';
            OptionMembers = " ",Normal,Defaulter,"Bridging Loan";
        }
        field(80; "Account No. Suffix"; Code[4])
        {
        }
        field(81; "No. Of Months for Appr. Saving"; Integer)
        {
        }
        field(82; "Loan Appraisal Income Acc."; Code[20])
        {
            TableRelation = "G/L Account"."No." WHERE("Direct Posting" = FILTER(true));
        }
        field(83; "Minimum Deposit Contribution"; Decimal)
        {
        }
        field(84; "Savings Duration"; DateFormula)
        {
        }
        field(85; "Savings Withdrawal penalty"; Decimal)
        {
        }
        field(86; "Savings Penalty Account"; Code[20])
        {
            TableRelation = "G/L Account";

            trigger OnValidate()
            begin
                //TestNoEntriesExist(FIELDCAPTION("Savings Penalty Account"),"Savings Penalty Account")
            end;
        }
        field(89; "Member Category"; Code[10])
        {
            //TableRelation = Table39004278;
        }
        field(90; "Mortgage Loan"; Boolean)
        {
        }
        field(91; "Agency Charge Acc"; Boolean)
        {
        }
        field(50004; "Maximum Loan Amount(Mobile)"; Decimal)
        {
        }
        field(50005; "Statement E-Mail Freq."; DateFormula)
        {
        }
        field(50006; "Discounting %"; Decimal)
        {
        }
        field(50007; "Computation %"; Decimal)
        {
        }
        field(50008; "Statement Charge"; Code[10])
        {
            TableRelation = "Transaction Types".Code WHERE(Type = CONST(Statement));
        }
        field(50050; "Mobile Transaction"; Option)
        {
            OptionMembers = " ","Deposits Only","Withdrawals Only","Deposits & Withdrawals";
        }
        field(50051; "Mobile Loan Net %"; Decimal)
        {
        }
        field(50052; "USSD Product Name"; Text[50])
        {
            Description = ' ,Loan,Repayment,Interest Due,Interest Paid,Bills,Appraisal,Penalty Due,Penalty Paid';
        }
        field(50053; "Savings Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Withdrawable,"Non-Withdrawable","Retained Shares",Term;
        }
        field(50054; "Restrict to Emp. Code"; Code[20])
        {
            TableRelation = Customer;
        }
        field(50055; "Interest Recovered Upfront"; Boolean)
        {
        }
        field(50056; "Auto Send SMS Alerts"; Boolean)
        {
        }
        field(50086; "Available To Member"; Code[20])
        {
            //TableRelation = Table39004255;
        }
        field(50087; "Salary Loans"; Boolean)
        {
        }
        field(50088; "Mobile Loan Req. Guar."; Boolean)
        {
        }
        field(50089; "Mobile Installments Type"; Option)
        {
            OptionMembers = "None",Input,Preset;
        }
        field(50090; "Min. Mobile Installments"; Integer)
        {
        }
        field(50091; "Max. Mobile Installments"; Integer)
        {
        }
        field(50092; "Minimum Guarantor Deposits"; Decimal)
        {
        }
        field(50093; "Requires TnC"; Boolean)
        {
        }
        field(50094; "Shows Mobile Qualification"; Boolean)
        {
        }
        field(50095; "MLoan Appraisal Start Point"; Decimal)
        {
        }
        field(50096; "MLoan Appraisal Increment"; Decimal)
        {
        }
        field(50097; "Requires Payslip PIN"; Boolean)
        {
        }
        field(50098; Category; Option)
        {
            OptionCaption = 'FOSA Account,BOSA Account,Investment Account,FOSA Loan,BOSA Loan';
            OptionMembers = "FOSA Account","BOSA Account","Investment Account","FOSA Loan","BOSA Loan";
        }
        field(50099; "Sort Order"; Integer)
        {
        }
        field(50100; "Requires Branch"; Boolean)
        {
        }
        field(50101; "Requires Purpose"; Boolean)
        {
        }
        field(50102; "Loan Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(50103; "Min. Net after Topup"; Decimal)
        {
        }
        field(50104; "Sky Income From Sacco Interest"; Option)
        {
            OptionMembers = No,Yes;
        }
        field(50105; "Mobile Min. Loan Amount"; Decimal)
        {
        }
        field(50106; "Mobile Max. Loan Amount"; Decimal)
        {
        }
        field(50107; "Mobile Min. Guarantors"; Integer)
        {
        }
        field(50108; "Mobile Max. Guarantors"; Integer)
        {
        }
        field(39004241; Notice; DateFormula)
        {
        }
        field(39004242; "Allow Mobile Applications"; Boolean)
        {
        }
        field(39004243; "Allow Self Guarantee"; Boolean)
        {
        }
        field(39004244; "No. of Salary Times"; Integer)
        {
        }
        field(39004245; "Salary Period"; DateFormula)
        {
        }
        field(39004248; "Minimum Dep. Contribution %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(39004249; "Source of Funds"; Option)
        {
            OptionMembers = "Internal Fund","External Fund";
        }
        field(39004250; "Source Of Funds No."; Code[20])
        {
            TableRelation = Vendor."No." WHERE("Vendor Type" = CONST("Source of Funds"));
        }
        field(39004251; "Max. Member Age"; DateFormula)
        {
        }
        field(39004252; "Net Salary Multiplier %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 1;
        }
        field(39004253; "Appraisal Parameter Type"; Option)
        {
            OptionMembers = "Check Off",Salary,"Corporate or Business";
        }
        field(39004254; "Minimum Guarantors on Max Amt"; Integer)
        {
        }
        field(39004255; "Max Amt on Guarantors"; Decimal)
        {
        }
        field(39004256; "View Online"; Boolean)
        {
        }
        field(39004257; "Requires Salary Processing"; Boolean)
        {
        }
        field(39004258; "Mobile Loan"; Boolean)
        {
        }
        field(39004259; "Does not Require Batching"; Boolean)
        {
        }
        field(39004260; "Minimum Deposit Tiered"; Boolean)
        {
        }
        field(39004261; "Minimum Deposit Tiered Code"; Code[20])
        {
            //TableRelation = Table39004355.Field1;

            trigger OnValidate()
            begin
                if "Minimum Deposit Tiered" = false then
                    Error('Code must not be specified')
            end;
        }
        field(39004262; Target; Decimal)
        {
        }
        field(39004263; "Accrual Fee Acc. (Income)"; Code[20])
        {
            TableRelation = "G/L Account"."No." WHERE("Direct Posting" = FILTER(true),
                                                       "Income/Balance" = CONST("Income Statement"));
        }
        field(39004264; "Accrue Monthly"; Boolean)
        {
        }
        field(39004265; "Monthly Charges"; Decimal)
        {
        }
        field(39004266; "Service Tarrif Percentage"; Decimal)
        {
        }
        field(39004267; "No. of Gura. Salary Times"; Integer)
        {
        }
        field(39004268; "No Interest Bills"; Boolean)
        {
        }
        field(39004269; "No Principle Bills"; Boolean)
        {
        }
        field(39004270; "Compute Bills on Posting"; Option)
        {
            OptionCaption = ' No Bill,Full Amount,One Installment';
            OptionMembers = " No Bill","Full Amount","One Installment";

            trigger OnValidate()
            begin
                if "Compute Bills on Posting" = "Compute Bills on Posting"::"Full Amount" then
                    "No Principle Bills" := true;
            end;
        }
        field(39004271; AvailableOnMobile; Boolean)
        {
        }
        field(39004272; "Allowed Transaction"; Option)
        {
            OptionCaption = 'Withdraw Only,Deposit Only,Withdraw & Deposit,No Transactions';
            OptionMembers = "Withdraw Only","Deposit Only","Withdraw & Deposit","No Transactions";
        }
        field(39004273; "Allow Send Email"; Boolean)
        {
        }
        field(39004274; "Shamba Loan"; Boolean)
        {
        }
        field(39004275; "DAdvance Limit Period"; Date)
        {
        }
        field(39004276; "Portal Viewable"; Boolean)
        {
        }
        field(39004277; "Portal Order"; Integer)
        {
        }
        field(39004278; "Dividend Advance Year"; Integer)
        {
        }
        field(39004279; "Bussiness Acc Prefix"; Code[1])
        {
        }
        field(39004280; "Business Acc Surfix"; Code[1])
        {
        }
        field(39004281; "Minimum Amt B/s Accnt"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Product ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Product ID", "Product Description")
        {
        }
    }

    // var
    //     SavingsAccounts: Record "Savings Accounts";
    //     Loans: Record Loans;

    
    // procedure GetReceivablesAccount(ProductCode: Code[20]; TransactionType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal): Code[20]
    // var
    //     LoanProductCharges: Record "Loan Product Charges";
    // begin
    //     Get(ProductCode);
    //     if (TransactionType = TransactionType::Loan) or (TransactionType = TransactionType::Repayment) then begin
    //         exit("Loan  Account [G/L]");
    //     end
    //     else
    //         if (TransactionType = TransactionType::"Interest Due") or (TransactionType = TransactionType::"Interest Paid") then begin
    //             exit("Loan Receivable Account[G/L]");
    //         end
    //         else
    //             if TransactionType = TransactionType::Bills then begin
    //                 exit("Bill Account");
    //             end
    //             else
    //                 if TransactionType = TransactionType::Appraisal then begin
    //                     LoanProductCharges.Reset;
    //                     LoanProductCharges.SetRange(LoanProductCharges."Product Code", "Product ID");
    //                     LoanProductCharges.SetRange(LoanProductCharges.Prorate, LoanProductCharges.Prorate::Appraisal);
    //                     if LoanProductCharges.Find('-') then begin
    //                         exit(LoanProductCharges."Charges G_L Account");
    //                     end;
    //                 end;
    // end;
}

