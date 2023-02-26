#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 52186411 tableextension52186411 extends "Gen. Journal Line" 
{
    fields
    {
        field(50000;"Transaction Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Loan,Repayment,Interest Due,Interest Paid,Bills,Appraisal';
            OptionMembers = " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;

            trigger OnValidate()
            begin
                 /*IF "Transaction Type"="Transaction Type"::"Registration Fee" THEN
                   Description:='Registration Fee';
                 IF "Transaction Type"="Transaction Type"::Loan THEN
                   Description:='Loan';
                 IF "Transaction Type"="Transaction Type"::Repayment THEN
                   Description:='Loan Repayment';
                 IF "Transaction Type"="Transaction Type"::Withdrawal THEN
                   Description:='Withdrawal';
                 IF "Transaction Type"="Transaction Type"::"Interest Due" THEN
                   Description:='Interest Due';
                 IF "Transaction Type"="Transaction Type"::"Interest Paid" THEN
                   Description:='Interest Paid';
                 IF "Transaction Type"="Transaction Type"::"Benevolent Fund" THEN
                   Description:='ABF Fund';
                 IF "Transaction Type"="Transaction Type"::"Deposit Contribution" THEN
                   Description:='Shares Contribution';
                 IF "Transaction Type"="Transaction Type"::"Appraisal Fee" THEN
                   Description:='Appraisal Fee';
                 IF "Transaction Type"="Transaction Type"::"Application` Fee" THEN
                   Description:='Application Fee';
                 IF "Transaction Type"="Transaction Type"::"Unallocated Funds" THEN
                   Description:='Unallocated Funds';
                          */
                
                
                //GenSet.GET;
                /*
                IF "Account Type"="Account Type"::Member THEN BEGIN
                CustMember.RESET;
                CustMember.SETRANGE(CustMember."No.","Account No.");
                IF CustMember.FIND('-') THEN BEGIN
                IF "Transaction Type"="Transaction Type"::Bills THEN
                "Bal. Account No.":=GenSet."Bill Account"
                ELSE
                "Bal. Account No.":='';
                END;
                END;
                
                
                
                PartOfAcc:='';
                
                PartOfAcc:=COPYSTR("Account No.",1,3);
                
                IF ((PartOfAcc='S01') OR (PartOfAcc='S02') OR (PartOfAcc='S06') OR (PartOfAcc='S09')  ) AND ("Transaction Type"<>"Transaction Type"::"Deposit Contribution") THEN
                ERROR('The chosen transaction type should be deposit contribution');
                
                IF ((PartOfAcc='S03') OR (PartOfAcc='S04')) AND ("Transaction Type"<>"Transaction Type"::"Share Capital") THEN
                ERROR('The chosen transaction type should be share Capital');
                
                IF ((PartOfAcc='L01') OR (PartOfAcc='L04') OR (PartOfAcc='L05')) AND ("Transaction Type"<>"Transaction Type"::" ") THEN
                ERROR('The transaction type should be blank');
                */

              

            end;
        }
        field(50001;"Loan No";Code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = Loans."Loan No." where ("Loan Account"=field("Account No."),
            //                                         Posted=const(Yes));

            trigger OnValidate()
            begin
                //PKK
                /*
                IF Loans.GET("Loan No") THEN BEGIN
                  Loans.CALCFIELDS(Loans."Outstanding Balance");
                  IF Loans."Outstanding Balance"+Amount=0 THEN BEGIN
                     Loans."Last Advice Date":=TODAY;
                     Loans."Advice Type":=Loans."Advice Type"::Stoppage;
                     Loans.MODIFY;
                   END;
                
                  IF Loans."Outstanding Balance"+Amount<0 THEN
                    ERROR('Cannot post an overpaid loan');
                END;
                 */

            end;
        }
        field(50002;"Loan Product Type";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50003;"Group Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50004;"Member No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50005;"Loan Span";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Short Term,Long Term';
            OptionMembers = " ","Short Term","Long Term";
        }
        field(39005600;"Grant No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39005601;"Purch. Order No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39005602;"Close Year Entry";Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(39005603;"Debit Amount (LCY)";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Debit Amount';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Rec.GetCurrency;
                Rec."Debit Amount" := ROUND(Rec."Debit Amount",Currency."Amount Rounding Precision");
                Rec.Correction := Rec."Debit Amount" < 0;
                Rec.Amount := Rec."Debit Amount";
                Rec.Validate(Rec.Amount);
            end;
        }
        field(39005604;"Credit Amount (LCY)";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            Caption = 'Credit Amount';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Rec.GetCurrency;
                Rec."Credit Amount" := ROUND(Rec."Credit Amount",Currency."Amount Rounding Precision");
                Rec.Correction := Rec."Credit Amount" < 0;
                Rec.Amount := -Rec."Credit Amount";
                Rec.Validate(Rec.Amount);
            end;
        }
        field(39005605;"Lease No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39005606;"Property Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39005607;"Transaction Code 2";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39005608;"Tenant No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39005609;Posted;Boolean)
        {
            TableRelation = IF ("Account Type" = CONST("G/L Account")) "G/L Account" WHERE("Account Type" = CONST(Posting),
                                                                                          Blocked = CONST(false))
            ELSE
            IF ("Account Type" = CONST(Customer)) Customer
            ELSE
            IF ("Account Type" = CONST(Vendor)) Vendor
            ELSE
            IF ("Account Type" = CONST("Bank Account")) "Bank Account"
            ELSE
            IF ("Account Type" = CONST("Fixed Asset")) "Fixed Asset"
            ELSE
            IF ("Account Type" = CONST("IC Partner")) "IC Partner"
            ELSE
            IF ("Account Type" = CONST(Employee)) Employee;
        }
    }
}
