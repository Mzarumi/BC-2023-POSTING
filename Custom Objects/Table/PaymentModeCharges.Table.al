table 52185884 "Payment Mode Charges"
{

    fields
    {
        field(1; "Payment Mode Type"; Option)
        {
            OptionMembers = " ",Cash,Cheque,EFT,"Custom 2","Custom 3","Custom 4","Custom 5";
        }
        field(2; "Amount Min."; Decimal)
        {
        }
        field(3; "Amount Max."; Decimal)
        {
        }
        field(4; Charges; Decimal)
        {
        }
        field(5; "Posting Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(Key1; "Payment Mode Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    [BusinessEvent(false)]
    //[Scope('Internal')]
    procedure UpdatePaymentVoucherCharges(PaymentVoucher: Record "Payments Header")
    begin
    end;
}

