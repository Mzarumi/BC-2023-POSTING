table 52185702 "Image Data"
{

    fields
    {
        field(1; "ID Number"; Code[20])
        {
        }
        field(2; Picture; BLOB)
        {
            SubType = Bitmap;
        }
        field(3; Signature; BLOB)
        {
            SubType = Bitmap;
        }
        field(4; "Member No"; Code[20])
        {
            Description = 'LookUp to Member Table';
            TableRelation = Members;
        }
        field(5; FingerOne; BLOB)
        {
            SubType = Memo;
        }
        field(6; FingerTwo; BLOB)
        {
            SubType = Memo;
        }
        field(7; FingerThree; BLOB)
        {
            SubType = Memo;
        }
        field(8; FingerFour; BLOB)
        {
            SubType = Memo;
        }
    }

    keys
    {
        key(Key1; "Member No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

