table 52185483 "Sky Mobile Loans"
{

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Account No"; Text[30])
        {
            Editable = false;
        }
        field(3; Date; DateTime)
        {
        }
        field(4; "Requested Amount"; Decimal)
        {
            Editable = false;
        }
        field(5; Posted; Boolean)
        {
            Editable = true;
        }
        field(6; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Pending,Successful,Failed,Pending Guarantors,Appraisal,Approved';
            OptionMembers = Pending,Successful,Failed,"Pending Guarantors",Appraisal,Approved;
        }
        field(7; "Date Posted"; DateTime)
        {
        }
        field(8; Remarks; Text[200])
        {
            Editable = false;
        }
        field(9; DocumentNo; Text[30])
        {
            Editable = false;
        }
        field(10; "Latest Salary Amount"; Decimal)
        {
            Editable = false;
        }
        field(11; "STO Amount"; Decimal)
        {
        }
        field(12; "Net Salary"; Decimal)
        {
        }
        field(13; "Total loans"; Decimal)
        {
        }
        field(14; "Approved Amount"; Decimal)
        {
        }
        field(15; "Commision Amount"; Decimal)
        {
        }
        field(16; "Loan Product Type"; Code[20])
        {
            TableRelation = "Product Factory"."Product ID";
        }
        field(17; Amount; Decimal)
        {
        }
        field(18; "Session ID"; Code[20])
        {
        }
        field(19; "Date Entered"; Date)
        {
        }
        field(20; "Time Entered"; Time)
        {
        }
        field(21; "Telephone No"; Text[20])
        {
        }
        field(22; "Message Text"; Text[250])
        {
        }
        field(23; "Member No."; Code[20])
        {
        }
        field(24; "Entry Code"; Text[20])
        {
        }
        field(50050; Deactivated; Boolean)
        {
        }
        field(50051; "Deactivated By"; Code[50])
        {
        }
        field(50052; "Date Deactivated"; Date)
        {
        }
        field(50053; "Micro Loan Category"; Code[20])
        {
        }
        field(50054; "Needs Guarantors"; Boolean)
        {
        }
        field(50055; "Micro Loan"; Boolean)
        {
        }
        field(50056; Blocked; Boolean)
        {
        }
        field(50057; "Salary Loan"; Boolean)
        {
        }
        field(50058; "Account Name"; Text[200])
        {
        }
        field(50059; "Loan Name"; Text[200])
        {
        }
        field(50060; "Expected Guarantors"; Integer)
        {
        }
        field(50061; Password; Text[200])
        {
        }
        field(50062; "Loan Period"; Integer)
        {
        }
        field(50063; "Loan Purpose"; Code[20])
        {
        }
        field(50064; Source; Code[20])
        {
        }
        field(50065; "Loan No."; Code[20])
        {
        }
        field(50066; Branch; Code[20])
        {
        }
        field(50067; Category; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Error('Deletion not allowed');
    end;
}

