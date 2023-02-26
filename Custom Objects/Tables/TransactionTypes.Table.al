table 52185773 "Transaction Types"
{
    //LookupPageID = "Transaction Types SetUp";

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; Type; Option)
        {
            OptionCaption = 'Cash Deposit,Cash Withdrawal,Credit Receipt,Credit Cheque,Bankers Cheque,Cheque Deposit,Cheque Withdrawal,Salary Processing,EFT,RTGS,Overdraft,Standing Order,Dividend,Msacco Balance Enquiry,Msacco Deposit,Msacco Ministatement,Msacco Transfer,Msacco Withdrawal,Msacco Registration,Msacco Charge,Transfers,ATM Applications,Member Withdrawal,ATM Replacement,Statement,Bounced Cheque,Lien,Cheque Application,Bank Transfer Mode,Sacco_Bank Cheques,Savings Penalty,Delegates Payment,Delegates Special,BBF Payment,Cancel Bankers Cheque,Sky Mobile';
            OptionMembers = "Cash Deposit","Cash Withdrawal","Credit Receipt","Credit Cheque","Bankers Cheque","Cheque Deposit","Cheque Withdrawal","Salary Processing",EFT,RTGS,Overdraft,"Standing Order",Dividend,"Msacco Balance Enquiry","Msacco Deposit","Msacco Ministatement","Msacco Transfer","Msacco Withdrawal","Msacco Registration","Msacco Charge",Transfers,"ATM Applications","Member Withdrawal","ATM Replacement",Statement,"Bounced Cheque",Lien,"Cheque Application","Bank Transfer Mode","Sacco_Bank Cheques","Savings Penalty","Delegates Payment","Delegates Special","BBF Payment","Cancel Bankers Cheque","Sky Mobile";
        }
        field(4; "Product Type"; Code[20])
        {
            TableRelation = "Product Factory"."Product ID" WHERE ("Product Class Type" = CONST (Savings));

            trigger OnValidate()
            var
                ProductFactory: Record "Product Factory";
            begin
                if ProductFactory.Get("Product Type") then
                    "Product Name" := ProductFactory."Product Description";
            end;
        }
        field(5; "Default Mode"; Option)
        {
            OptionCaption = 'Cash,Cheque';
            OptionMembers = Cash,Cheque;
        }
        field(12; "Requires Finger Verification"; Boolean)
        {
        }
        field(13; "Product Name"; Text[50])
        {
            Editable = false;
        }
        field(14; "Upper Limit"; Decimal)
        {
        }
        field(15; Category; Option)
        {
            OptionCaption = ' ,Cashier';
            OptionMembers = " ",Cashier;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

