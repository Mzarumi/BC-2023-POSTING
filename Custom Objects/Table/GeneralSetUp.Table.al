table 52185689 "General Set-Up"
{

    fields
    {
        field(1; "No."; Code[20])
        {
        }
        field(3; "Max. Member Age"; DateFormula)
        {
        }
        field(4; "Registration Fee"; Decimal)
        {
        }
        field(5; "Min. Member Age"; DateFormula)
        {
        }
        field(6; "Rejoining Fees Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(7; "Days for Checkoff"; DateFormula)
        {
        }
        field(8; "Guarantors Multiplier"; Decimal)
        {
        }
        field(9; "Excise Duty G/L"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(10; "Rejoining Fee"; Decimal)
        {
        }
        field(11; "Excise Duty (%)"; Decimal)
        {
        }
        field(12; "Max Loans To Guarantee"; Integer)
        {
        }
        field(13; "Bill Account"; Code[20])
        {
            TableRelation = "G/L Account"."No." WHERE ("Direct Posting" = CONST (true));
        }
        field(14; "Funeral Expense Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(15; "Funeral Amount"; Decimal)
        {
        }
        field(16; "Unloged Claims Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(17; "Insurance Name"; Text[30])
        {
        }
        field(18; "Withdrawal Notice period"; DateFormula)
        {
        }
        field(19; Reference; Text[30])
        {
            Description = 'Use to define Client Code for Electronic Find transfer';
        }
        field(20; "Withdrawal Fee"; Decimal)
        {
        }
        field(21; "Boosting Maturity"; DateFormula)
        {
        }
        field(22; "Boosting Shares %"; Decimal)
        {
        }
        field(23; "Share Boost GL"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(24; "Charge Type"; Code[10])
        {
        }
        field(29; "Transaction Type [Statement]"; Code[20])
        {
            TableRelation = "Transaction Types" WHERE (Type = FILTER (Statement));
        }
        field(30; "External STO Account No."; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(31; "Withdrawal Fee Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(32; "Self Guarantee %"; Decimal)
        {
        }
        field(33; "Maximum Discounting %"; Decimal)
        {
        }
        field(34; "Special Charge on Loans GL"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(35; "BBF Claim %"; Decimal)
        {
        }
        field(37; "Enforce Picture & Signature"; Option)
        {
            Description = 'Enforce Picture & Signature';
            OptionCaption = ' ,Picture,Signature,Both';
            OptionMembers = " ",Picture,Signature,Both;
        }
        field(38; "Allowed Loan Categories"; Option)
        {
            OptionCaption = 'Perfoming,Watch,Substandard,Doubtful,Loss';
            OptionMembers = Perfoming,Watch,Substandard,Doubtful,Loss;
        }
        field(39; "Benevolent Claim Account"; Code[10])
        {
            TableRelation = Vendor."No." WHERE ("Vendor Type" = CONST (SinkFund));
        }
        field(40; "Maximum Valuation Period"; DateFormula)
        {
        }
        field(41; "Maximum ATM Limit"; Decimal)
        {
        }
        field(42; "Dividend Payable Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(43; "Withholding Tax Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(44; "Min. Delegates deposit"; Decimal)
        {
        }
        field(45; "Min.Delegate Membership Period"; DateFormula)
        {
        }
        field(46; "Min. Delegates Share Capital"; Decimal)
        {
        }
        field(47; "ATM Card No Characters"; Integer)
        {
        }
        field(48; "Self Deposits(As Guarantor)"; Boolean)
        {
        }
        field(49; "Max. Member Age - Disabled"; DateFormula)
        {
        }
        field(50; "BDE Loan Comission"; Decimal)
        {
        }
        field(51; "BDE Loan Above Target"; Decimal)
        {
        }
        field(52; "BDE ATM Comission"; Decimal)
        {
        }
        field(53; "BDE New Member Comission"; Decimal)
        {
        }
        field(54; "BDE Salary Account Commision"; Decimal)
        {
        }
        field(55; "Block Account for Ext.  Loan"; Boolean)
        {
        }
        field(56; "Withdrawal Notice Penalty"; Code[10])
        {
            TableRelation = "Transaction Types".Code WHERE (Type = CONST ("Member Withdrawal"));
        }
        field(57; "Requires Salary Processing"; Boolean)
        {
            Description = 'Delegates';
        }
        field(58; "Salary Period"; DateFormula)
        {
        }
        field(59; "Agency Posting Batch"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE ("Journal Template Name" = FIELD ("Agency Posting Template"));
        }
        field(60; "Agency Posting Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(61; "Sacco Commission Account"; Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(62; "Vendor Commission Account"; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(63; "Max Store Open Documents"; Integer)
        {
        }
        field(64; "EFT Dest Acc Length"; Integer)
        {
        }
        field(65; "Salary SMS Suffix"; Text[100])
        {
        }
        field(66; "Defaulter Notice Period"; DateFormula)
        {
        }
        field(67; "Dormant Account Activation Fee"; Code[20])
        {
            TableRelation = "Transaction Types".Code WHERE (Type = FILTER ("Savings Penalty"));
        }
        field(68; "Statement Limit Period"; Date)
        {
        }
        field(69; "Agency No Series"; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(70; "Birthday Message"; Text[250])
        {
        }
        field(71; "Sink Fund Process Charge"; Code[20])
        {
            TableRelation = "Transaction Types".Code WHERE (Type = CONST ("BBF Payment"));
        }
        field(72; "Membership Anniversary"; Text[250])
        {
        }
        field(73; "Agency Control Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(74; "Agency Expense Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(75; "Disable Salary SMS"; Boolean)
        {
        }
        field(76; "Disable Loan SMS"; Boolean)
        {
        }
        field(77; "Div. Advance Rate"; Decimal)
        {
        }
        field(78; "Junior Birthday Message"; Text[250])
        {
        }
        field(79; "KMRC Rate"; Decimal)
        {
        }
        field(80; "Early Withdrawal %"; Decimal)
        {
        }
        field(81; "Early Withdrawal Account"; Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(82; "Mortgage Loan Vendor A/C"; Code[15])
        {
            TableRelation = Vendor."No.";
        }
        field(83; "Mortgage FOSA Min Balance"; Decimal)
        {
        }
        field(84; "Minimum No of Group Members"; Integer)
        {
        }
        field(85; "POS Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(86; "ATM Settlement Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(87; "VISA Settlement Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(88; "Max. Age Non-Common Bond"; DateFormula)
        {
        }
        field(89; "Control FOSA Posting"; Boolean)
        {
        }
        field(90; "PDF B64 Folder"; Text[50])
        {
        }
        field(91; "Password History Limit"; Integer)
        {
        }
        field(50050; "MBanking Posting Date"; Date)
        {
        }
        field(50051; "Sacco SMS Expense GL"; Code[20])
        {
        }
        field(50052; "Mobile Vendor Account"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50053; "Vendor SMS Split Amount"; Decimal)
        {
        }
        field(50054; "Sacco SMS Income GL"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50055; "Bankers Cheque Limit"; Decimal)
        {
        }
        field(50056; "Shamba Loan Vendor A/C"; Code[20])
        {
        }
        field(50057; "Loan SMS Suffix"; Text[250])
        {
        }
        field(50058; "Minimum Leaf Limit"; Decimal)
        {
        }
        field(50059; "Sky Mobile Next Run Date"; Date)
        {
        }
        field(50060; "Allowed Loan Cat Billing"; Option)
        {
            OptionCaption = 'Perfoming,Watch,Substandard,Doubtful,Loss';
            OptionMembers = Perfoming,Watch,Substandard,Doubtful,Loss;
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
}

