table 52185700 Members
{
    // DrillDownPageID = "Member List";
    // LookupPageID = "Member List";

    fields
    {
        field(1; "No."; Code[50])
        {
            Caption = 'No.';
            SQLDataType = Varchar;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SeriesSetup.Get;
                    NoSeriesMgt.TestManual(SeriesSetup."Member Nos.");
                    "No. Series" := '';
                end;

                //Prevent Changing once entries exist
                // //TestNoEntriesExist(FieldCaption("No."), "No.");
            end;
        }
        field(2; Name; Text[80])
        {
            Caption = 'Name';

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or ("Search Name" = '') then
                    "Search Name" := Name;

                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts.Name, Name);
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts.Name, Name);
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
                // Loans.Reset;
                // // Loans.SetRange("Member No.", "No.");
                // if Loans.Find('-') then begin
                //     repeat
                //         Loans."Member Name" := Name;
                //         Loans.Modify;
                //     until Loans.Next = 0;
                // end;
            end;
        }
        field(3; "Search Name"; Code[80])
        {
            Caption = 'Search Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Name 2", "Name 2");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Name 2", "Name 2");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(5; "Current Address"; Text[50])
        {
            Caption = 'Current Address';

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Current Address", "Current Address");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Current Address", "Current Address");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(6; "Home Address"; Text[50])
        {
            Caption = 'Home Address';

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Home Address", "Home Address");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Home Address", "Home Address");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(7; City; Text[30])
        {
            Caption = 'City';

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts.City, City);
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts.City, City);
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;

                PostCode.ValidateCity(City, "Post Code", County, Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(8; Contact; Text[50])
        {
            Caption = 'Contact';
        }
        field(9; "Phone No."; Text[80])
        {
            Caption = 'Phone No.';
            CharAllowed = '0123456789';
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Phone No.", "Phone No.");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Phone No.", "Phone No.");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(10; "Telex No."; Text[20])
        {
            Caption = 'Telex No.';
        }
        field(11; "Our Account No."; Text[20])
        {
            Caption = 'Our Account No.';
        }
        field(12; "Territory Code"; Code[10])
        {
            Caption = 'Territory Code';
            TableRelation = Territory;
        }
        field(13; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Global Dimension 1 Code", "Global Dimension 1 Code");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Global Dimension 1 Code", "Global Dimension 1 Code");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;

                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Global Dimension 2 Code", "Global Dimension 2 Code");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Global Dimension 2 Code", "Global Dimension 2 Code");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;

                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(15; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(16; "Recruited By"; Code[10])
        {
            Caption = 'Salesperson Code';
            TableRelation = "Salesperson/Purchaser".Code;

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    SavingAccounts.Validate(SavingAccounts."Recruited By", "Recruited By");
                    SavingAccounts.Modify;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Recruited By", "Recruited By");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(17; Nationality; Code[10])
        {
            Caption = 'Nationality';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                /*IF CountryRegion.GET(Nationality) THEN
                  "Mobile Phone No":=CountryRegion.Code + DELCHR(xRec."Mobile Phone No",'=',xRec.Nationality);*/

            end;
        }
        field(18; Comment; Boolean)
        {
            CalcFormula = Exist("Comment Line" WHERE("No." = FIELD("No.")));
            Caption = 'Comment';
            Description = 'LookUp to Comment Line';
            Editable = false;
            FieldClass = FlowField;
        }
        field(19; Blocked; Option)
        {
            Caption = 'Blocked';
            OptionCaption = ' ,Credit,Debit,All';
            OptionMembers = " ",Credit,Debit,All;
        }
        field(20; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(21; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(22; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(23; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(24; "Fax No."; Text[30])
        {
            Caption = 'Fax No.';
        }
        field(25; "VAT Registration No."; Text[20])
        {
            Caption = 'VAT Registration No.';

            trigger OnValidate()
            var
                VATRegNoFormat: Record "VAT Registration No. Format";
            begin
                //VATRegNoFormat.Test("VAT Registration No.",Nationality,"No.",DATABASE::Customer);
            end;
        }
        field(26; Picture; BLOB)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(27; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF (Nationality = CONST('')) "Post Code"
            ELSE
            IF (Nationality = FILTER(<> '')) "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Post Code", "Post Code");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Post Code", "Post Code");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;

                PostCode.ValidatePostCode(City, "Post Code", County, Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(28; County; Text[30])
        {
            Caption = 'County';
            Description = 'LookUp to Member Segment Table where Type = County';
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST(County));

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    SavingAccounts.Validate(SavingAccounts.County, County);
                    SavingAccounts.Modify;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts.County, County);
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(29; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."E-Mail", "E-Mail");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."E-Mail", "E-Mail");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(30; "Current Location"; Text[80])
        {
            Caption = 'Home Page';
            ExtendedDatatype = URL;
        }
        field(31; "No. Series"; Code[50])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(32; "Currency Filter"; Code[10])
        {
            Caption = 'Currency Filter';
            FieldClass = FlowFilter;
            TableRelation = Currency;
        }
        field(33; "Primary Contact No."; Code[20])
        {
            Caption = 'Primary Contact No.';
            TableRelation = Contact;

            trigger OnLookup()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin
            end;

            trigger OnValidate()
            var
                Cont: Record Contact;
                ContBusRel: Record "Contact Business Relation";
            begin
            end;
        }
        field(34; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            Description = 'LookUp to Responsibility Center BR Table';
            TableRelation = "Responsibility CenterBR";
        }
        field(35; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
            TableRelation = "Base Calendar";
        }
        field(36; "Customer Type"; Option)
        {
            OptionCaption = ' ,Welfare,Micro finance, Partnership';
            OptionMembers = " ",Welfare,"Micro finance"," Partnership";
        }
        field(37; "Registration Date"; Date)
        {
        }
        field(38; Status; Option)
        {
            OptionCaption = ' ,New,Active,Dormant,Frozen,Withdrawal Applicant,Withdrawn,Deceased,Defaulter,Closed,Withdrawn Shareholder';
            OptionMembers = " ",New,Active,Dormant,Frozen,"Withdrawal Applicant",Withdrawn,Deceased,Defaulter,Closed,"Withdrawn Shareholder";
        }
        field(39; "Employer Code"; Code[100])
        {
            Description = 'LookUp to Customer Table';
            TableRelation = Customer WHERE("Account Type" = CONST(Employer));

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Employer Code", "Employer Code");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Employer Code", "Employer Code");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;

                // CheckoffAdviceLine.Reset;
                // // CheckoffAdviceLine.SetRange("Member No.", "No.");
                // if CheckoffAdviceLine.Find('-') then begin
                //     repeat
                //         CheckoffAdviceLine.Validate("Employer Code", "Employer Code");
                //         CheckoffAdviceLine.Modify;
                //     until CheckoffAdviceLine.Next = 0;
                // end;

                // LoanApps.Reset;
                // // LoanApps.SetRange("Member No.", "No.");
                // if LoanApps.Find('-') then begin
                //     repeat
                //         LoanApps.Validate("Employer Code", "Employer Code");
                //         LoanApps.Modify;
                //     until LoanApps.Next = 0;
                // end;

                if Customer.Get("Employer Code") then
                    "Employer Name" := Customer.Name
                else
                    "Employer Name" := '';
            end;
        }
        field(40; "Date of Birth"; Date)
        {

            trigger OnValidate()
            var
                DateofBirthError: Label 'This date cannot be greater than today.';
            begin
                if "Date of Birth" > Today then
                    Error(DateofBirthError);

                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Date of Birth", "Date of Birth");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Date of Birth", "Date of Birth");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(43; Location; Text[50])
        {
        }
        field(44; "Resons for Status Change"; Text[80])
        {
        }
        field(45; "Payroll/Staff No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "Payroll/Staff No." <> '' then begin

                    /*Cust.RESET;
                    Cust.SETRANGE(Cust."Payroll/Staff No.","Payroll/Staff No.");
                    Cust.SETFILTER(Cust.Status,'<>%1',Cust.Status::Defaulter);
                    Cust.SETFILTER("Employer Code","Employer Code");
                    IF Cust.FINDFIRST THEN
                     ERROR(MemberExistError,Cust."No.",Cust.Name);*/

                    SavingAccounts.Reset;
                    SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                    SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                    SavingAccounts.SetFilter(SavingAccounts."Employer Code", "Employer Code");
                    if SavingAccounts.Find('-') then begin
                        repeat
                            SavingAccounts.Validate(SavingAccounts."Payroll/Staff No.", "Payroll/Staff No.");
                            SavingAccounts.Modify;
                        until SavingAccounts.Next = 0;
                    end;

                end;

                /*CreditAccounts.RESET;
                CreditAccounts.SETFILTER(CreditAccounts."Member No.",'<>%1','');
                CreditAccounts.SETRANGE(CreditAccounts."Member No.","No.");
                IF CreditAccounts.FIND('-') THEN BEGIN
                 REPEAT
                 CreditAccounts.VALIDATE(CreditAccounts."Payroll/Staff No.","Payroll/Staff No.");
                  CreditAccounts.MODIFY;
                  UNTIL CreditAccounts.NEXT=0;
                END;*/

            end;
        }
        field(46; "ID No."; Code[50])
        {

            trigger OnValidate()
            begin
                "ID No." := DelChr("ID No.", '=', 'A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?|+|-|_');

                if "ID No." <> '' then begin
                    /*Cust.RESET;
                    Cust.SETRANGE(Cust."ID No.","ID No.");
                    Cust.SETFILTER(Cust.Status,'<>%1',Cust.Status::Defaulter);
                    IF Cust.FINDFIRST THEN
                     ERROR(MemberExistError,Cust."No.",Cust.Name);*/
                end;

                // FieldLength("ID No.", 10);

                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."ID No.", "ID No.");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."ID No.", "ID No.");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;

            end;
        }
        field(47; "Mobile Phone No"; Code[50])
        {
            CharAllowed = '0123456789';
            Editable = true;

            trigger OnValidate()
            begin
                /*IF "Mobile Phone No" <>'' THEN BEGIN
                Cust.RESET;
                Cust.SETRANGE(Cust."Mobile Phone No","Mobile Phone No");
                Cust.SETFILTER(Cust.Status,'<>%1',Cust.Status::Defaulter);
                IF Cust.FINDFIRST THEN
                 ERROR(MemberExistError,Cust."No.",Cust.Name);
                END;*/

                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Mobile Phone No", "Mobile Phone No");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Mobile Phone No", "Mobile Phone No");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;

            end;
        }
        field(48; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Divorced,Widower,Widow;

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Marital Status", "Marital Status");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Marital Status", "Marital Status");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(49; "Passport No."; Code[50])
        {

            trigger OnValidate()
            begin
                if "Passport No." <> '' then begin
                    /*Cust.RESET;
                    Cust.SETRANGE(Cust."Passport No.","Passport No.");
                    Cust.SETFILTER(Cust.Status,'<>%1',Cust.Status::Defaulter);
                    IF Cust.FINDFIRST THEN
                     ERROR(MemberExistError,Cust."No.",Cust.Name);*/
                end;

                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Passport No.", "Passport No.");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Passport No.", "Passport No.");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;

            end;
        }
        field(50; Gender; Option)
        {
            OptionCaption = '  ,Male,Female';
            OptionMembers = "  ",Male,Female;

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts.Gender, Gender);
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts.Gender, Gender);
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(51; "First Name"; Text[50])
        {

            trigger OnValidate()
            begin
                Name := "First Name" + ' ' + "Second Name" + ' ' + "Last Name";

                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts.Name, Name);
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts.Name, Name);
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(52; "Office Telephone No."; Code[50])
        {
        }
        field(53; "Account Category"; Option)
        {
            Enabled = true;
            OptionCaption = ' ,Member,Staff Members,Board Members,Delegates,Self-Employed,SMEs,Diaspora,Spouse,Child';
            OptionMembers = " ",Member,"Staff Members","Board Members",Delegates,"Self-Employed",SMEs,Diaspora,Spouse,Child;
        }
        field(54; "MPESA Mobile No"; Code[20])
        {
            CharAllowed = '0123456789';
            Editable = true;

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Mobile No.", "MPESA Mobile No");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."MPESA Mobile No", "MPESA Mobile No");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(55; "Group Account No."; Code[20])
        {
            Description = 'LookUp to Member.No. WHERE Group Account=Yes';

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Group Account No", "Group Account No.");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Group Account No", "Group Account No.");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(57; "Group Account"; Boolean)
        {

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Group Account", "Group Account");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Group Account", "Group Account");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(58; "Second Name"; Text[50])
        {
            Description = 'Maintain names separately';

            trigger OnValidate()
            begin
                Name := "First Name" + ' ' + "Second Name" + ' ' + "Last Name";

                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts.Name, Name);
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts.Name, Name);
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(59; "Last Name"; Text[50])
        {
            Description = 'Names separately';

            trigger OnValidate()
            begin
                Name := "First Name" + ' ' + "Second Name" + ' ' + "Last Name";

                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts.Name, Name);
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts.Name, Name);
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(60; "Employment / Occupation Detail"; Text[50])
        {
        }
        field(61; "Employer's Postal Address"; Text[150])
        {
        }
        field(62; "Member Segment"; Code[20])
        {
            Description = 'LookUp to Member Segment Table where Type = Segment';
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST(Segment));
        }
        field(63; "Membership Type"; Option)
        {
            OptionCaption = ' ,Ordinary,Preferential';
            OptionMembers = " ",Ordinary,Preferential;
        }
        field(64; "Account Type"; Option)
        {
            OptionCaption = ' ,Savings Account,Personal Savings,Microfinance Savings,Salary Account,Share Deposit Account,Fixed Deposit Account,Others(Specify)';
            OptionMembers = " ","Savings Account","Personal Savings","Microfinance Savings","Salary Account","Share Deposit Account","Fixed Deposit Account","Others(Specify)";
        }
        field(65; "Relates to Business/Group"; Boolean)
        {

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Relates to Business/Group", "Relates to Business/Group");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Relates to Business/Group", "Relates to Business/Group");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(66; "Type of Business"; Option)
        {
            OptionCaption = ' ,Sole Proprietor,Paerneship,Limited Liability Company,Informal Body,Registered Group,Other(Specify)';
            OptionMembers = " ","Sole Proprietor",Paerneship,"Limited Liability Company","Informal Body","Registered Group","Other(Specify)";
        }
        field(67; "Other Business Type"; Text[15])
        {
        }
        field(68; "Ownership Type"; Option)
        {
            OptionCaption = ' ,Personal Account,Joint Account,Group/Business,FOSA Shares';
            OptionMembers = " ","Personal Account","Joint Account","Group/Business","FOSA Shares";
        }
        field(69; "Other Account Type"; Text[15])
        {
        }
        field(70; "Nature of Business"; Text[30])
        {
        }
        field(71; "Company Registration No."; Code[20])
        {

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Company Registration No.", "Company Registration No.");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Company Registration No.", "Company Registration No.");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(72; "Date of Business Reg."; Date)
        {
        }
        field(73; "Business/Group Location"; Text[50])
        {
        }
        field(74; "Plot/Bldg/Street/Road"; Text[50])
        {
        }
        field(75; "Group Type"; Option)
        {
            OptionCaption = ' ,Welfare,Microfinance';
            OptionMembers = " ",Welfare,Microfinance;
        }
        field(76; "Single Party/Multiple"; Option)
        {
            OptionCaption = 'Single,Multiple,Business';
            OptionMembers = Single,Multiple,Business;

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Single Party/Multiple/Business", "Single Party/Multiple");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;
            end;
        }
        field(77; "Birth Certificate No."; Code[20])
        {
        }
        field(78; "Current Residence"; Text[30])
        {
        }
        field(79; "Protected Account"; Boolean)
        {
        }
        field(80; "User ID"; Code[50])
        {
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(81; "Created By"; Code[50])
        {
        }
        field(82; "Bank Code"; Code[20])
        {
            Description = 'LookUp to Banks Code Structure Table';
            // TableRelation = "Bank Code Structure";
        }
        field(83; "Branch Code"; Code[20])
        {
            Description = 'LookUp to Banks Code Structure Table';
            // TableRelation = "Bank Code Structure"."Branch Code" WHERE("Bank Code" = FIELD("Bank Code"));
        }
        field(84; "Bank Account No."; Code[20])
        {
        }
        field(85; "P.I.N Number"; Code[20])
        {

            trigger OnValidate()
            begin
                // FieldLength("ID No.", 15);
            end;
        }
        field(86; Source; Option)
        {
            Description = 'Used to identify origin of Member Application [CRM, Navision, Web]';
            OptionCaption = ' ,Navision,CRM,Web';
            OptionMembers = " ",Navision,CRM,Web;
        }
        field(87; "Application No."; Code[10])
        {
        }
        field(88; "Member Type"; Option)
        {
            OptionCaption = 'Ordinary,Preferential';
            OptionMembers = Ordinary,Preferential;
        }
        field(89; "Member Category"; Code[10])
        {
            TableRelation = "Member Category";
        }
        field(90; "Recruited by Type"; Option)
        {
            OptionCaption = 'Staff,Others,Self,Delegates';
            OptionMembers = Staff,Others,Self,Delegates;

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Member No.", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Member No.", "No.");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Recruited by Type", "Recruited by Type");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Member No.", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Member No.", "No.");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Recruited by Type", "Recruited by Type");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;
            end;
        }
        field(91; "Rejoinig Date"; Date)
        {
        }
        field(92; "Principle Member"; Code[20])
        {
            TableRelation = Members;
        }
        field(50001; "FingerPrint Verified"; Boolean)
        {
            Editable = false;
        }
        field(50002; SystemGeneratedGuid; Guid)
        {
        }
        // field(50003; "Status Change Statistics"; Integer)
        // {
        //     // CalcFormula = Count("Reactivate/Deactivate Header" WHERE("Account Type" = CONST(Member),
        //     //                                                           "Account No." = FIELD("No."),
        //     //                                                           Status = CONST(Processed)));
        //     Editable = false;
        //     FieldClass = FlowField;
        // }
        field(50004; "Relationship Manager"; Code[10])
        {
            TableRelation = "HR Employees" WHERE(Status = FILTER(Active));

            trigger OnValidate()
            begin
                SavingAccounts.Reset;
                SavingAccounts.SetFilter(SavingAccounts."Relationship Manager", '<>%1', '');
                SavingAccounts.SetRange(SavingAccounts."Relationship Manager", "Relationship Manager");
                if SavingAccounts.Find('-') then begin
                    repeat
                        SavingAccounts.Validate(SavingAccounts."Relationship Manager", "Relationship Manager");
                        SavingAccounts.Modify;
                    until SavingAccounts.Next = 0;
                end;

                CreditAccounts.Reset;
                CreditAccounts.SetFilter(CreditAccounts."Relationship Manager", '<>%1', '');
                CreditAccounts.SetRange(CreditAccounts."Relationship Manager", "Relationship Manager");
                if CreditAccounts.Find('-') then begin
                    repeat
                        CreditAccounts.Validate(CreditAccounts."Relationship Manager", "Relationship Manager");
                        CreditAccounts.Modify;
                    until CreditAccounts.Next = 0;
                end;

                // LoanApps.Reset;
                // LoanApps.SetRange(LoanApps."Member No.", '<>%1', '');
                // LoanApps.SetRange(LoanApps."Member No.", "No.");
                // if LoanApps.Find('-') then begin
                //     repeat
                //         LoanApps."Relationship Manager" := "Relationship Manager";
                //         LoanApps.Modify;
                //     until LoanApps.Next = 0;
                // end;
            end;
        }
        field(50005; "Statement E-Mail Freq."; DateFormula)
        {
        }
        field(50006; "Dividend Action"; Option)
        {
            OptionCaption = ' ,Pay,Hold';
            OptionMembers = " ",Pay,Hold;
        }
        field(50007; Retiree; Boolean)
        {
        }
        field(50008; "Retirement Date"; Date)
        {
        }
        field(50009; "Constitution Provided"; Boolean)
        {
        }
        field(50010; "Group Minutes Provided"; Boolean)
        {
        }
        field(50011; "Country Of Operation"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(50012; "Membership Option"; Option)
        {
            Editable = false;
            OptionCaption = 'Member,Agent';
            OptionMembers = Member,Agent;
        }
        // field(39004241; "Last Transaction Date"; Date)
        // {
        //     CalcFormula = Max("Savings Ledger Entry"."Posting Date" WHERE("Member No." = FIELD("No.")));
        //     FieldClass = FlowField;
        // }
        field(39004242; Classification; Option)
        {
            OptionCaption = ' ,Good Standing,Bad Standing';
            OptionMembers = " ","Good Standing","Bad Standing";
        }
        // field(39004243; "Region Code"; Code[20])
        // {
        //     TableRelation = "Delegate Region".Code;

        //     trigger OnValidate()
        //     var
        //         DelegateRegion: Record "Delegate Region";
        //     begin
        //         if DelegateRegion.Get("Region Code") then
        //             "Region Code Name" := DelegateRegion."Delegate Region Description";
        //     end;
        // }
        field(39004244; "Area Service Center"; Code[20])
        {
            TableRelation = "Electrol Zones/Area Svr Center".Code WHERE(Type = CONST("Area Service Centers"));
        }
        field(39004245; Type; Option)
        {
            OptionCaption = ' ,From Other Sacco,Re-joining';
            OptionMembers = " ","From Other Sacco","Re-joining";
        }
        field(39004246; "Dividend Payment Method"; Code[20])
        {
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST("Dividend Payment Type"));
        }
        field(39004247; "Old Member No."; Code[20])
        {
        }
        field(39004248; "Associated Member No."; Code[20])
        {
        }
        field(39004249; Hide; Boolean)
        {
        }
        field(39004250; "Virtual Members"; Boolean)
        {
        }
        field(39004251; "Tax Exempted"; Boolean)
        {
            Caption = 'Disabled';
        }
        field(39004252; "Document No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(39004253; "Recruited By Name"; Text[100])
        {
            Editable = false;
        }
        field(39004254; Salutation; Code[50])
        {
            Description = '39004358';
            TableRelation = "Salutation Tittles".Code WHERE(Type = CONST(Tittle));
        }
        // field(39004255; "Region Code Name"; Text[100])
        // {
        //     Editable = false;
        //     TableRelation = "Delegate Region"."Delegate Region Description" WHERE(Code = FIELD("Region Code"));
        // }
        field(39004256; "Vote Code"; Code[20])
        {
        }
        field(39004257; "Surety Letter Issued"; Boolean)
        {
        }
        field(39004258; "Employer Name"; Text[50])
        {
        }
        field(39004259; "MBoosta Special"; Boolean)
        {
        }
        field(39004260; "MBoosta Limit"; Decimal)
        {
        }
        field(39004261; "Statement Email Dates"; Date)
        {
        }
        field(39004262; "ID Card"; BLOB)
        {
        }
        field(39004263; "ID Card Back"; BLOB)
        {
        }
        field(39004264; "BSS Registered"; Boolean)
        {
        }
        field(39004265; "Allow MBoosta Defaulter"; Boolean)
        {
        }
        field(39004266; "Allow DAdvace Defaulter"; Boolean)
        {
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

    trigger OnDelete()
    begin
        if Status = Status::Active then
            Error('Dear' + UserId + 'You are not Allowed to Delete this Member');

        if Status = Status::Closed then
            Error('Dear' + UserId + 'You are not Allowed to Delete this Member');

        if Status = Status::Defaulter then
            Error('Dear' + UserId + 'You are not Allowed to Delete this Member');

        if Status = Status::Deceased then
            Error('Dear' + UserId + 'You are not Allowed to Delete this Member');

        if Status = Status::Dormant then
            Error('Dear' + UserId + 'You are not Allowed to Delete this Member');

        if Status = Status::Frozen then
            Error('Dear' + UserId + 'You are not Allowed to Delete this Member');

        if Status = Status::New then
            Error('Dear' + UserId + 'You are not Allowed to Delete this Member');

        if Status = Status::"Withdrawal Applicant" then
            Error('Dear' + UserId + 'You are not Allowed to Delete this Member');
        if Status = Status::" " then
            Error('Dear' + UserId + 'You are not Allowed to Delete this Member');
    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            SeriesSetup.Get;
            SeriesSetup.TestField(SeriesSetup."Member Nos.");
            NoSeriesMgt.InitSeries(SeriesSetup."Member Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Created By" := UserId;
        "Last Date Modified" := Today;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    var
        SeriesSetup: Record "Credit Nos. Series";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SavingAccounts: Record "Savings Accounts";
        CreditAccounts: Record "Credit Accounts";
        CountryRegion: Record "Country/Region";
        // LoanApps: Record Loans;
        Cust: Record Members;
        MemberExistError: Label 'Already exists with member %1 Name: %2';
        PostCode: Record "Post Code";
        // CheckoffAdviceLine: Record "Checkoff Advice Line";
        Customer: Record Customer;
        // Loans: Record Loans;

    procedure TestNoEntriesExist(CurrentFieldName: Text[100]; GLNO: Code[20])
    var
        MemberLedgEntry: Record "Cust. Ledger Entry";
    // Text000: ;
    begin
        //To prevent change of field
        MemberLedgEntry.SetCurrentKey(MemberLedgEntry."Customer No.");
        MemberLedgEntry.SetRange(MemberLedgEntry."Customer No.", "No.");
        // if MemberLedgEntry.Find('-') then
        //     Error(Text000,
        //           CurrentFieldName);
    end;

    procedure FieldLength(VarVariant: Text; FldLength: Integer): Text
    var
        FieldLengthError: Label 'Field cannot be more than %1 Characters.';
    begin
        if StrLen(VarVariant) > FldLength then
            Error(FieldLengthError, FldLength);
    end;

    procedure SendRecords()
    var
        DocumentSendingProfile: Record "Document Sending Profile";
        TempDocumentSendingProfile: Record "Document Sending Profile" temporary;
        ReportDistributionManagement: Codeunit "Report Distribution Management";
    begin
        DocumentSendingProfile.GetDefaultForCustomer("No.", DocumentSendingProfile);
        Commit;

        TempDocumentSendingProfile.Init;
        TempDocumentSendingProfile.Code := DocumentSendingProfile.Code;
        TempDocumentSendingProfile.Validate("One Related Party Selected", IsSingleCustomerSelected);
        TempDocumentSendingProfile.SetDocumentUsage(Rec);
        TempDocumentSendingProfile.Insert;

        if PAGE.RunModal(PAGE::"Select Sending Options", TempDocumentSendingProfile) = ACTION::LookupOK then begin
            CheckDocumentSendingProfileIsSupported(TempDocumentSendingProfile);
            // ReportDistributionManagement.SendDocumentReport(TempDocumentSendingProfile, Rec);
        end;
    end;

    procedure PrintRecords(ShowRequestForm: Boolean)
    var
        TempDocumentSendingProfile: Record "Document Sending Profile" temporary;
        ReportDistributionManagement: Codeunit "Report Distribution Management";
    begin
        TempDocumentSendingProfile.Init;

        if ShowRequestForm then
            TempDocumentSendingProfile.Printer := TempDocumentSendingProfile.Printer::"Yes (Prompt for Settings)"
        else
            TempDocumentSendingProfile.Printer := TempDocumentSendingProfile.Printer::"Yes (Use Default Settings)";

        TempDocumentSendingProfile.Insert;

        // ReportDistributionManagement.dSendDocumentReport(TempDocumentSendingProfile, Rec);
    end;

    procedure EmailRecords(ShowRequestForm: Boolean)
    var
        TempDocumentSendingProfile: Record "Document Sending Profile" temporary;
        ReportDistributionManagement: Codeunit "Report Distribution Management";
    begin
        TempDocumentSendingProfile.Init;

        if ShowRequestForm then
            TempDocumentSendingProfile."E-Mail" := TempDocumentSendingProfile."E-Mail"::"Yes (Prompt for Settings)"
        else
            TempDocumentSendingProfile."E-Mail" := TempDocumentSendingProfile."E-Mail"::"Yes (Use Default Settings)";

        TempDocumentSendingProfile."E-Mail Attachment" := TempDocumentSendingProfile."E-Mail Attachment"::PDF;

        TempDocumentSendingProfile.Insert;

        // ReportDistributionManagement.SendDocumentReport(TempDocumentSendingProfile, Rec);
    end;

    local procedure IsSingleCustomerSelected(): Boolean
    var
        SelectedCount: Integer;
        CustomerCount: Integer;
        BillToCustomerNoFilter: Text;
    begin
        SelectedCount := Count;

        if SelectedCount < 1 then
            exit(false);

        if SelectedCount = 1 then
            exit(true);

        BillToCustomerNoFilter := GetFilter("No.");
        SetRange("No.", "No.");
        CustomerCount := Count;
        SetFilter("No.", BillToCustomerNoFilter);

        exit(SelectedCount = CustomerCount);
    end;

    local procedure CheckDocumentSendingProfileIsSupported(var TempDocumentSendingProfile: Record "Document Sending Profile" temporary)
    var
        CannotSendMultipleStatementsElectronicallyErr: Label 'You can only send one electronic statements at a time.';
    begin
        if (Count > 1) and
           (TempDocumentSendingProfile."Electronic Document" <> TempDocumentSendingProfile."Electronic Document"::No)
        then
            Error(CannotSendMultipleStatementsElectronicallyErr);
    end;
}

