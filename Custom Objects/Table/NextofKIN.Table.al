table 52185701 "Next of KIN"
{
    //DrillDownPageID = "Next of KIN";
    //LookupPageID = "Next of KIN";

    fields
    {
        field(1; "Entry No."; Integer)
        {
        }
        field(2; "Account No"; Code[20])
        {
            Description = 'LookUp to Member Application Table';
            TableRelation = Members."No.";
        }
        field(3; Name; Text[50])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                Name := UpperCase(Name);
            end;
        }
        field(4; Relationship; Text[30])
        {
            Description = 'LookUp to Relationships Table';
            TableRelation = "Relationship Types";
        }
        field(5; Beneficiary; Boolean)
        {
        }
        field(6; "Date of Birth"; Date)
        {

            trigger OnValidate()
            var
                DateofBirthError: Label 'This date cannot be greater than today.';
            begin
                if "Date of Birth" > Today then
                    Error(DateofBirthError);
            end;
        }
        field(7; Address; Text[30])
        {
        }
        field(8; Telephone; Code[20])
        {
            Caption = 'Mobile No.';
            CharAllowed = '0123456789';
        }
        field(9; Fax; Code[10])
        {
        }
        field(10; Email; Text[30])
        {
        }
        field(11; "ID No."; Code[20])
        {

            trigger OnValidate()
            begin
                "ID No." := DelChr("ID No.", '=', 'A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?|+|-|_');
                // FieldLength("ID No.", 10);
            end;
        }
        field(12; "%Allocation"; Decimal)
        {
            MinValue = 0;

            trigger OnValidate()
            begin
                TotalA := 0;

                NOK.Reset;
                NOK.SetRange(NOK."Account No", "Account No");
                if NOK.Find('-') then begin
                    repeat
                        TotalA := TotalA + NOK."%Allocation"
                    until NOK.Next = 0;
                end;
                TotalA := TotalA + "%Allocation";
                /*IF TotalA > 100 THEN
                ERROR('Total allocation cannot be more than 100%.');
                */

            end;
        }
        field(13; Type; Option)
        {
            OptionCaption = 'Next of Kin,Spouse,Sink Fund Beneficiary,Family Member';
            OptionMembers = "Next of Kin",Spouse,"Benevolent Beneficiary","Family Member";

            trigger OnValidate()
            begin
                Relationship := ' ';
                if Type = Type::Spouse then
                    Relationship := 'Spouse';
            end;
        }
        field(14; Deceased; Boolean)
        {
            Editable = false;
        }
        field(15; "BBF Entitlement Code"; Code[20])
        {
            TableRelation = "BBF Entitlement".Code;

            trigger OnValidate()
            begin
                BEntitlement.Reset;
                BEntitlement.SetRange(Code, "BBF Entitlement Code");
                if BEntitlement.Find('-') then begin
                    "BBF Entitlement" := BEntitlement.Amount;
                end;
            end;
        }
        field(16; "BBF Entitlement"; Decimal)
        {
            Editable = false;
        }
        field(17; "Insured Option"; Option)
        {
            OptionCaption = ' ,Child1,Child2,Child3,Child4,Spouse,Parent1,Parent2';
            OptionMembers = " ",Child1,Child2,Child3,Child4,Spouse,Parent1,Parent2;
        }
        field(18; "Date Modified"; Date)
        {
        }
        field(19; "Date Captured"; Date)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Account No", "Entry No.", Name)
        {
            Clustered = true;
            SumIndexFields = "%Allocation";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Date Modified" := Today;
    end;

    trigger OnModify()
    begin
        "Date Modified" := Today;
    end;

    var
        NOK: Record "Next of KIN";
        TotalA: Decimal;
        NOK1: Record "Next of KIN";
        BEntitlement: Record "BBF Entitlement";

    //[Scope('Internal')]
    procedure FieldLength(VarVariant: Text; FldLength: Integer): Text
    var
        FieldLengthError: Label 'Field cannot be more than %1 Characters.';
    begin
        if StrLen(VarVariant) > FldLength then
            Error(FieldLengthError, FldLength);
    end;
}

