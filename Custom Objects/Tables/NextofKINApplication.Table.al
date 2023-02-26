table 52185692 "Next of KIN Application"
{
    LookupPageID = "Next of KIN Application";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Account No"; Code[20])
        {
            Description = 'LookUp to Member Application Table';
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

            trigger OnValidate()
            begin
                RelationshipTypes.Reset;
                RelationshipTypes.SetRange(Description, Relationship);
                if RelationshipTypes.Find('-') then begin
                    NOK.Reset;
                    NOK.SetRange(NOK."Account No", "Account No");
                    if NOK.Find('-') then begin
                        repeat
                            TotRel += 1;
                        until NOK.Next = 0;
                    end;
                    //IF (TotRel-1)>RelationshipTypes."Max. Allowed" THEN
                    //ERROR('The maximum allowed for relationship:%1 is %2',RelationshipTypes.Description,RelationshipTypes."Max. Allowed");
                end;
            end;
        }
        field(5; Beneficiary; Boolean)
        {

            trigger OnValidate()
            begin
                Rec.TestField(Relationship);
                if Type <> Type::"Benevolent Beneficiary" then Error('Only Type: Benevolent Beneficiary can be marked as beneficiary');
                if Type <> Type::"Benevolent Beneficiary" then
                    Beneficiary := false;
                Validate(Type);
            end;
        }
        field(6; "Date of Birth"; Date)
        {

            trigger OnValidate()
            var
                DateofBirthError: Label 'This date cannot be greater than today.';
            begin
                TestField(Relationship);
                if "Date of Birth" > Today then
                    Error(DateofBirthError);
                RelationshipTypes.Reset;
                RelationshipTypes.SetRange(Description, Relationship);
                if RelationshipTypes.Find('-') then begin
                    Age := Round(((Today - "Date of Birth") / 365), 1, '=');
                    Message('age %1', Age);
                    if (Age < RelationshipTypes."Min. Age") or (Age > RelationshipTypes."Max. Age") then
                        Error('This relationship %1 is of range min. Age:%2 and Max. Age:%3', RelationshipTypes.Description, RelationshipTypes."Min. Age", RelationshipTypes."Max. Age");


                    MemberApplication.Reset;
                    MemberApplication.SetRange("No.", "Account No");
                    if MemberApplication.Find('-') then begin
                        MemberApplication.TestField("Date of Birth");
                        if RelationshipTypes."Principal Child" = true then begin
                            if MemberApplication."Date of Birth" >= "Date of Birth" then
                                Error(Err0001);
                        end;
                    end;

                end;
            end;
        }
        field(7; Address; Text[30])
        {

            trigger OnValidate()
            begin
                Address := UpperCase(Address);
            end;
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

            trigger OnValidate()
            begin
            end;
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
                if TotalA > 100 then
                    Error('Total allocation cannot be more than 100%.');
            end;
        }
        field(13; Type; Option)
        {
            OptionCaption = 'Next of Kin,Spouse,Sink Fund Beneficiary,Family Member';
            OptionMembers = "Next of Kin",Spouse,"Benevolent Beneficiary","Family Member";

            trigger OnValidate()
            var
                BBFEntitlement: Record "BBF Entitlement";
            begin
                //   Name:=' ';
                if Type = Type::Spouse then
                    Name := 'Spouse';

                case Type of
                    Type::"Benevolent Beneficiary":
                        begin
                            BBFEntitlement.Reset;
                            BBFEntitlement.SetRange(BBFEntitlement.Entitlement, Relationship);
                            if BBFEntitlement.Find('-') /*GET(Relationship)*/ then begin
                                "BBF Entitlement Code" := BBFEntitlement.Code;
                                "BBF Entitlement" := BBFEntitlement."New Amount";
                            end;
                        end else begin
                                    "BBF Entitlement Code" := '';
                                    "BBF Entitlement" := 0;
                                end;
                end;

                if Type = Type::"Benevolent Beneficiary" then
                    Beneficiary := true
                else
                    Beneficiary := false;

            end;
        }
        field(14; Deceased; Boolean)
        {
            Editable = false;
        }
        field(15; "BBF Entitlement Code"; Code[10])
        {
            TableRelation = "BBF Entitlement".Code;

            trigger OnValidate()
            var
                BBFEntitlement: Record "BBF Entitlement";
            begin
                /*BEntitlement.RESET;
                BEntitlement.SETRANGE(Code,"BBF Entitlement Code");
                IF BEntitlement.FIND('-')  THEN
                  BEGIN
                  "BBF Entitlement":=BEntitlement.Amount;
                  END;
                  */
                BEntitlement.Reset;
                BEntitlement.SetRange(Self, true);
                if BEntitlement.Find('-') then begin
                    if BBFRequisationHeader."Date of Death" < 20170731D then
                        "BBF Entitlement" := BEntitlement.Amount
                    else
                        "BBF Entitlement" := BEntitlement."New Amount";
                end;


                BBFEntitlement.Reset;
                BBFEntitlement.SetRange(Code, "BBF Entitlement Code");
                if BBFEntitlement.Find('-') then begin
                    NOK.Reset;
                    NOK.SetRange(NOK."Account No", "Account No");
                    NOK.SetRange(NOK."BBF Entitlement Code", "BBF Entitlement Code");
                    if NOK.Find('-') then begin
                        repeat
                            TotRel += 1;
                        until NOK.Next = 0;
                        Message('%1', TotRel);
                    end;
                    if (TotRel + 1) > BBFEntitlement."Max No." then
                        Error('The maximum allowed for relationship:%1 allowed is %2', BBFEntitlement.Entitlement, BBFEntitlement."Max No.");
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
        field(18; "Date Captured"; Date)
        {
            Editable = false;
        }
        field(19; "Portal Application"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Account No", "Entry No.")
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
        "Date Captured" := Today;
    end;

    var
        NOK: Record "Next of KIN Application";
        TotalA: Decimal;
        NOK1: Record "Next of KIN Application";
        // dSMTPMail: Codeunit "SMTP Mail";
        BEntitlement: Record "BBF Entitlement";
        RelationshipTypes: Record "Relationship Types";
        Age: Integer;
        TotRel: Integer;
        MemberApplication: Record "Member Application";
        Err0001: Label 'Age of a child cannot be greater than the principal member';
        BBFRequisationHeader: Record "BBF Requisation Header";
        CountBen: Integer;
        BBFEntitlement: Record "BBF Entitlement";

    procedure FieldLength(VarVariant: Text; FldLength: Integer): Text
    var
        FieldLengthError: Label 'Field cannot be more than %1 Characters.';
    begin
        if StrLen(VarVariant) > FldLength then
            Error(FieldLengthError, FldLength);
    end;
}

