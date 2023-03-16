table 52185691 "Member Application"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                // if "No." <> xRec."No." then begin
                //     SeriesSetup.Get;
                //     //NoSeriesMgtTestManual(SeriesSetup."Member Application Nos.");
                //     "No. Series" := '';
                // end;
            end;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or ("Search Name" = '') then
                    "Search Name" := Name;
                Name := UpperCase(Name);
            end;
        }
        field(3; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
        }
        field(5; "Current Address"; Text[50])
        {
            Caption = 'Address';
        }
        field(6; "Home Address"; Text[50])
        {
            Caption = 'Home Address';
            Enabled = false;
        }
        field(7; "Phone No."; Text[20])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
            begin
                "Phone No." := DelChr("Phone No.", '=', 'A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?|-|_');
                TestField(Nationality);
                CountryRegion.Get(Nationality);
                NewMob := '';
                NewMob := CopyStr("Phone No.", 1, 4);
                if (CopyStr("Phone No.", 1, 4)) <> (CountryRegion."County Phone Code") then
                    Error('The Mobile phone No. should take the format of ' + CountryRegion."County Phone Code");
                if StrLen("Phone No.") <> 13 then
                    Error('Phone No. should be equal to 13 characters');
            end;
        }
        field(8; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(9; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(10; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(11; "Second Name"; Text[30])
        {

            trigger OnValidate()
            begin
                // "Second Name":=DELCHR("Second Name",'=','0|1|2|3|4|5|6|7|8|9');
                // "Second Name":=UPPERCASE("Second Name");
                // Name:=DELCHR("First Name",'=','0|1|2|3|4|5|6|7|8|9')+' '+DELCHR("Second Name",'=','0|1|2|3|4|5|6|7|8|9')+' '+DELCHR("Last Name",'=','0|1|2|3|4|5|6|7|8|9');


                "Second Name" := UpperCase("Second Name");
                Name := "First Name" + ' ' + "Second Name" + ' ' + "Last Name";
            end;
        }
        field(12; "Last Name"; Text[30])
        {

            trigger OnValidate()
            begin
                // "Last Name":=DELCHR("Last Name",'=','0|1|2|3|4|5|6|7|8|9');
                // "Last Name":=UPPERCASE("Last Name");
                // Name:=DELCHR("First Name",'=','0|1|2|3|4|5|6|7|8|9')+' '+DELCHR("Second Name",'=','0|1|2|3|4|5|6|7|8|9')+' '+DELCHR("Last Name",'=','0|1|2|3|4|5|6|7|8|9');


                "Last Name" := UpperCase("Last Name");
                Name := "First Name" + ' ' + "Second Name" + ' ' + "Last Name";
            end;
        }
        field(13; "Customer Type"; Option)
        {
            OptionCaption = ' ,Member,Account,MicroFinance';
            OptionMembers = " ",Member,Account,MicroFinance;
        }
        field(14; "Application Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Application Date" > Today then
                    Error(DateofBirthError);
            end;
        }
        field(15; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending,Approved,Rejected,Created';
            OptionMembers = Open,Pending,Approved,Rejected,Created;
        }
        field(16; "Employer Code"; Code[20])
        {
            TableRelation = Customer WHERE("Account Type" = CONST(Employer));

            trigger OnValidate()
            begin
                if "Virtual Member" = false then
                    "Date of Birth" := 0D;
                if Customer.Get("Employer Code") then begin
                    "Employer Name" := Customer.Name;
                    "Self Employed" := Customer."Self Employed";
                end;
                if "Self Employed" then "Member Segment" := 'UNCHECKOFF' else "Member Segment" := 'CHECKOFF';
            end;
        }
        field(17; "Date of Birth"; Date)
        {

            trigger OnValidate()
            var
                DateofBirthError: Label 'This date cannot be greater than today.';
            begin
                if "Virtual Member" = false then
                    TestField("Employer Code");
                if "Date of Birth" > Today then
                    Error(DateofBirthError);
                if "Virtual Member" = false then
                    Customer.Get("Employer Code");

                GeneralSetUp.Get;
                if "Date of Birth" > CalcDate(GeneralSetUp."Min. Member Age", Today) then
                    Error(MinimumAgeError, CalcDate(GeneralSetUp."Min. Member Age", Today));

                if Customer."Non-Common Board Employer" = false then begin
                    if "Tax Exempted" = true then begin
                        if (CalcDate(GeneralSetUp."Max. Member Age - Disabled", "Date of Birth")) < Today
                          then
                            Error('The member age of %1 is exceeded', GeneralSetUp."Max. Member Age - Disabled");
                    end else begin
                        if (CalcDate(GeneralSetUp."Max. Member Age", "Date of Birth")) < Today
                        then
                            Error('The member age of %1 is exceeded', GeneralSetUp."Max. Member Age");
                    end;
                end else begin
                    if "Tax Exempted" = true then begin
                        if (CalcDate(GeneralSetUp."Max. Member Age - Disabled", "Date of Birth")) < Today
                          then
                            Error('The member age of %1 is exceeded', GeneralSetUp."Max. Member Age - Disabled");
                    end else begin
                        if (CalcDate(GeneralSetUp."Max. Age Non-Common Bond", "Date of Birth")) < Today
                        then
                            Error('The Non-Common Board age of %1 is exceeded', GeneralSetUp."Max. Age Non-Common Bond");
                    end;
                end;
            end;
        }
        field(18; "E-Mail"; Text[50])
        {

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
            end;
        }
        field(19; "Station/Department"; Code[20])
        {
            TableRelation = Customer;
        }
        field(23; Nationality; Code[20])
        {
            TableRelation = "Country/Region";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if "Virtual Member" = false then begin
                    if CountryRegion.Get(Nationality) then
                        "Mobile Phone No" := CountryRegion."County Phone Code";
                    "Phone No." := CountryRegion."County Phone Code";
                end;
            end;
        }
        field(24; "Payroll/Staff No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "Payroll/Staff No." <> '' then begin

                    MemberApplication.Reset;
                    MemberApplication.SetFilter("Employer Code", "Employer Code");
                    MemberApplication.SetFilter("Payroll/Staff No.", "Payroll/Staff No.");
                    if MemberApplication.FindFirst then
                        if (MemberApplication.Status in [MemberApplication.Status::Open, MemberApplication.Status::Pending, MemberApplication.Status::Approved]) then
                            Error(MemberExistError, MemberApplication."No.", MemberApplication.Name);


                    Cust.Reset;
                    Cust.SetRange(Cust."Employer Code", "Employer Code");
                    Cust.SetRange(Cust."Payroll/Staff No.", "Payroll/Staff No.");
                    if Cust.FindFirst then
                        Error(MemberExistError, Cust."No.", Cust.Name);
                end;
            end;
        }
        field(25; "ID No."; Code[20])
        {

            trigger OnValidate()
            begin
                "ID No." := DelChr("ID No.", '=', 'A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?|+|-|_');

                // FieldLength("ID No.", 10);

                if "ID No." <> '' then begin

                    MemberApplication.Reset;
                    MemberApplication.SetRange(MemberApplication."ID No.", "ID No.");
                    MemberApplication.SetFilter(MemberApplication.Status, '%1', MemberApplication.Status::Open);
                    if MemberApplication.Find('-') then begin
                        repeat
                            if (MemberApplication.Status in [MemberApplication.Status::Open, MemberApplication.Status::Pending,
                                                             MemberApplication.Status::Approved]) then
                                Error(MemberExistError, MemberApplication."No.", MemberApplication.Name);
                        until MemberApplication.Next = 0;
                    end;

                    MemberApplication.Reset;
                    MemberApplication.SetRange(MemberApplication."ID No.", "ID No.");
                    if MemberApplication.Find('-') then begin
                        repeat
                            if MemberApplication.Status = MemberApplication.Status::Rejected then
                                Error(MemberExistError, MemberApplication."No.", MemberApplication.Name);
                        until MemberApplication.Next = 0;
                    end;

                    Cust.Reset;
                    Cust.SetRange(Cust."ID No.", "ID No.");
                    Cust.SetFilter(Cust.Status, '<>%1', Cust.Status::Closed);
                    if Cust.FindFirst then begin
                        Error(MemberExistError, Cust."No.", Cust.Name);
                        /*
                        IF Cust.Status<>Cust.Status::Closed THEN
                            ERROR(MemberExistError,Cust."No.",Cust.Name) ELSE
                          BEGIN
                            SavingsAccounts.RESET;
                            SavingsAccounts.SETRANGE("Member No.",Cust."No.");
                            SavingsAccounts.SETRANGE(SavingsAccounts."Product Category",SavingsAccounts."Product Category"::"Share Capital");
                            IF SavingsAccounts.FIND('-') THEN
                              BEGIN
                                SavingsAccounts.CALCFIELDS("Balance (LCY)");
                                IF SavingsAccounts."Balance (LCY)">0 THEN
                                  ERROR ('The Member No.: %1 has Share Capital at account %2 of %3',Cust."No.",SavingsAccounts."No.",SavingsAccounts."Balance (LCY)");
                                END;
                            END;
                            */
                    end;
                end;

            end;
        }
        field(26; "Mobile Phone No"; Code[13])
        {

            trigger OnValidate()
            begin
                "Mobile Phone No" := DelChr("Mobile Phone No", '=', 'A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?|-|_');

                if "Mobile Phone No" <> '' then begin

                    MemberApplication.Reset;
                    MemberApplication.SetRange(MemberApplication."Mobile Phone No", "Mobile Phone No");
                    MemberApplication.SetFilter(MemberApplication.Status, '%1', MemberApplication.Status::Open);
                    if MemberApplication.Find('-') then begin
                        repeat
                            if (MemberApplication.Status in [MemberApplication.Status::Open, MemberApplication.Status::Pending,
                                                             MemberApplication.Status::Approved]) then
                                Error(MemberExistError, MemberApplication."No.", MemberApplication.Name);
                        until MemberApplication.Next = 0;
                    end;

                    Cust.Reset;
                    Cust.SetRange(Cust."Mobile Phone No", "Mobile Phone No");
                    Cust.SetFilter(Cust.Status, '<>%1', Cust.Status::Closed);
                    if Cust.FindFirst then
                        Error(MemberExistError, Cust."No.", Cust.Name);
                end;



                CountryRegion.Get(Nationality);
                NewMob := '';
                NewMob := CopyStr("Mobile Phone No", 1, 4);
                if (CopyStr("Mobile Phone No", 1, 4)) <> (CountryRegion."County Phone Code") then
                    Error('The Mobile phone No. should take the format of ' + CountryRegion."County Phone Code");
                if StrLen("Mobile Phone No") <> 13 then
                    Error('Phone No. should be equal to 13 characters');
            end;
        }
        field(27; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Devorced,Widower,Widow;
        }
        field(28; "Passport No."; Code[10])
        {

            trigger OnValidate()
            begin
                if "Passport No." <> '' then begin

                    MemberApplication.Reset;
                    MemberApplication.SetRange(MemberApplication."Passport No.", "Passport No.");
                    MemberApplication.SetFilter(MemberApplication.Status, '%1', MemberApplication.Status::Open);
                    if MemberApplication.Find('-') then begin
                        repeat
                            if (MemberApplication.Status in [MemberApplication.Status::Open, MemberApplication.Status::Pending,
                                                             MemberApplication.Status::Approved]) then
                                Error(MemberExistError, MemberApplication."No.", MemberApplication.Name);
                        until MemberApplication.Next = 0;
                    end;

                    Cust.Reset;
                    Cust.SetRange(Cust."Passport No.", "Passport No.");
                    Cust.SetFilter(Cust.Status, '<>%1', Cust.Status::Closed);
                    if Cust.FindFirst then
                        Error(MemberExistError, Cust."No.", Cust.Name);
                end;
            end;
        }
        field(29; Gender; Option)
        {
            OptionCaption = '  ,Male,Female';
            OptionMembers = "  ",Male,Female;
        }
        field(30; "First Name"; Text[50])
        {

            trigger OnValidate()
            begin
                // "First Name":=DELCHR("First Name",'=','0|1|2|3|4|5|6|7|8|9');
                // "First Name":=UPPERCASE("First Name");
                // Name:=DELCHR("First Name",'=','0|1|2|3|4|5|6|7|8|9')+' '+DELCHR("Second Name",'=','0|1|2|3|4|5|6|7|8|9')+' '+DELCHR("Last Name",'=','0|1|2|3|4|5|6|7|8|9');


                "First Name" := UpperCase("First Name");
                Name := "First Name" + ' ' + "Second Name" + ' ' + "Last Name";
            end;
        }
        field(33; "No. Series"; Code[10])
        {
        }
        field(34; Occupation; Text[30])
        {
        }
        field(35; Designation; Text[30])
        {
        }
        field(36; "Terms of Employment"; Option)
        {
            OptionMembers = " ",Permanent,Contract,Casual;
        }
        field(37; "Post Code"; Code[20])
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
                //PostCode.ValidatePostCode(City,"Post Code",FORMAT(County),Nationality,(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(38; City; Text[30])
        {
            Caption = 'City';
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnValidate()
            begin
                //PostCode.ValidateCity(City,"Post Code",County,Nationality,(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(39; "Responsibility Center"; Code[20])
        {
            Description = 'LookUp to Responsibility Center BR';
            TableRelation = "Responsibility CenterBR";
        }
        field(41; County; Code[30])
        {
            Caption = 'County';
            Description = 'LookUp to Member Segment Table where Type = County';
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST(County));
        }
        field(42; "Bank Code"; Code[20])
        {
            Description = 'LookUp to Banks Table';
            TableRelation = "Bank Code Structure";
        }
        field(43; "Branch Code"; Code[20])
        {
            Description = 'LookUp to Banks Table';
            TableRelation = "Bank Code Structure"."Branch Code" WHERE("Bank Code" = FIELD("Bank Code"));
        }
        field(44; "Recruited By"; Code[10])
        {
            Caption = 'Salesperson Code';
            TableRelation = IF ("Recruited by Type" = FILTER(Staff)) "HR Employees"."No."
            ELSE
            IF ("Recruited by Type" = CONST(Others)) Members."No." WHERE(Status = FILTER(<> Deceased & <> Withdrawn & <> Closed))
            ELSE
            IF ("Recruited by Type" = CONST(Delegates)) "Delegate Memberss"."Delegate MNO." WHERE(Status = CONST(Approved),
                                                                                                                      Retired = CONST(false));

            trigger OnValidate()
            begin
                if "Recruited by Type" = "Recruited by Type"::Others then begin
                    SalespersonPurchaser.Reset;
                    SalespersonPurchaser.SetRange(Code, "Recruited By");
                    if SalespersonPurchaser.Find('-') then begin
                        "Recruited By Name" := SalespersonPurchaser.Name;
                    end;
                end else begin
                    HREmployees.Reset;
                    HREmployees.SetRange("No.", "Recruited By");
                    if HREmployees.Find('-') then begin
                        "Recruited By Name" := HREmployees."First Name" + ' ' + HREmployees."Last Name";
                    end;
                end;
            end;
        }
        field(46; "Member Segment"; Code[20])
        {
            Description = 'LookUp to Member Segment Table where Type = Segment';
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST(Segment));
        }
        field(47; "Type of Business"; Option)
        {
            OptionCaption = ' ,Sole Proprietor,Partnership,Limited Liability Company,Informal Body,Registered Group,Other(Specify)';
            OptionMembers = " ","Sole Proprietor",Partnership,"Limited Liability Company","Informal Body","Registered Group","Other(Specify)";
        }
        field(48; "Other Business Type"; Text[15])
        {
        }
        field(49; "Ownership Type"; Option)
        {
            OptionCaption = ' ,Personal Account,Joint Account,Group/Business,FOSA Shares';
            OptionMembers = " ","Personal Account","Joint Account","Group/Business","FOSA Shares";
        }
        field(50; "Other Account Type"; Text[15])
        {
        }
        field(51; "Nature of Business"; Text[30])
        {
        }
        field(52; "Bank Account No."; Code[20])
        {

            trigger OnValidate()
            begin
                if StrLen("Bank Account No.") > 14 then
                    Error(BankAccountErr);
            end;
        }
        field(53; "Company Registration No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "Company Registration No." <> '' then begin
                    Cust.Reset;
                    Cust.SetRange(Cust."Company Registration No.", "Company Registration No.");
                    if Cust.FindFirst then
                        Error(MemberExistError, Cust."No.", Cust.Name);
                end;
            end;
        }
        field(54; "Date of Business Reg."; Date)
        {

            trigger OnValidate()
            begin
                if "Date of Business Reg." > Today then
                    Error(DateofBirthError);
            end;
        }
        field(55; "Business/Group Location"; Text[50])
        {
        }
        field(56; "P.I.N Number"; Code[20])
        {
            Caption = 'KRA Pin No.';

            trigger OnValidate()
            begin
                // FieldLength("ID No.", 15);
                MemberApplication.Reset;
                MemberApplication.SetRange(MemberApplication."P.I.N Number", "P.I.N Number");
                MemberApplication.SetFilter(MemberApplication.Status, '%1', MemberApplication.Status::Open);
                if MemberApplication.Find('-') then begin
                    repeat
                        if (MemberApplication.Status in [MemberApplication.Status::Open, MemberApplication.Status::Pending,
                                                         MemberApplication.Status::Approved]) then
                            Error(MemberExistError, MemberApplication."No.", MemberApplication.Name);
                    until MemberApplication.Next = 0;
                end;

                if "P.I.N Number" <> '' then begin
                    Cust.Reset;
                    Cust.SetRange(Cust."P.I.N Number", "P.I.N Number");
                    if Cust.FindFirst then
                        Error(MemberExistError, Cust."No.", Cust.Name);
                end;
            end;
        }
        field(57; "Plot/Bldg/Street/Road"; Text[50])
        {
        }
        field(58; "Group Type"; Option)
        {
            OptionCaption = ' ,Welfare,Microfinance';
            OptionMembers = " ",Welfare,Microfinance;
        }
        field(59; "Single Party/Multiple/Business"; Option)
        {
            OptionCaption = 'Single,Multiple,Business';
            OptionMembers = Single,Multiple,Business;
        }
        field(60; "Birth Certificate No."; Code[15])
        {
        }
        field(61; "Group Account No."; Code[20])
        {
            Description = 'LookUp to Member where Group Account = Yes';
            TableRelation = Members WHERE("Group Account" = FILTER(true));
        }
        field(62; "Created By"; Code[50])
        {
        }
        field(63; Source; Option)
        {
            Description = 'Used to identify origin of Member Application [CRM, Navision, Web,Agency]';
            OptionCaption = ' ,Navision,CRM,Web,Agency';
            OptionMembers = " ",Navision,CRM,Web,Agency;
        }
        field(64; Picture; BLOB)
        {
            Caption = 'Picture';
            Description = 'Used to capture applicant Photos and should be deleted on account creation.';
            SubType = Bitmap;
        }
        field(65; Signature; BLOB)
        {
            Caption = 'Signature';
            Description = 'Used to capture applicant Signature and should be deleted on account creation.';
            SubType = Bitmap;
        }
        field(66; "Transaction Mobile No"; Code[13])
        {
            CharAllowed = '0123456789';

            trigger OnValidate()
            begin
                if StrLen("Transaction Mobile No") > 13 then begin
                    "Transaction Mobile No" := '';
                    Modify;
                end;
            end;
        }
        field(67; "Group Account"; Boolean)
        {
        }
        field(68; "Recruited by Type"; Option)
        {
            OptionCaption = 'Staff,Others,Self,Delegates';
            OptionMembers = Staff,Others,Self,Delegates;
        }
        field(69; "Employer Name"; Text[50])
        {
        }
        field(70; "Member Category"; Code[10])
        {
            TableRelation = "Member Category"."No." WHERE("Premier Club Min.Deposits" = FILTER(0));

            trigger OnValidate()
            begin
                MemberCategory.Reset;
                MemberCategory.SetRange("No.", "Member Category");
                if MemberCategory.Find('-') then begin
                    MemberCategory.TestField("Default Share Deposit");
                    MemberCategory.TestField("Default Share Capital");
                    MemberCategory.TestField("Registration Fee");
                    AutoOpenSavingAccs.Reset;
                    AutoOpenSavingAccs.SetRange("No.", "No.");
                    if AutoOpenSavingAccs.Find('-') then begin
                        repeat
                            if AutoOpenSavingAccs."Product Category" = AutoOpenSavingAccs."Product Category"::"Deposit Contribution" then
                                AutoOpenSavingAccs."Monthly Contribution" := MemberCategory."Default Share Deposit"
                            else
                                if AutoOpenSavingAccs."Product Category" = AutoOpenSavingAccs."Product Category"::"Share Capital" then
                                    AutoOpenSavingAccs."Monthly Contribution" := MemberCategory."Default Share Capital"
                                else
                                    if AutoOpenSavingAccs."Product Category" = AutoOpenSavingAccs."Product Category"::"Registration Fee" then
                                        AutoOpenSavingAccs."Monthly Contribution" := MemberCategory."Registration Fee";
                            AutoOpenSavingAccs.Modify;
                        until AutoOpenSavingAccs.Next = 0;
                    end;
                end;
            end;
        }
        field(71; "Relationship Manager"; Code[10])
        {
            TableRelation = "HR Employees" WHERE(Status = FILTER(Active));
        }
        field(72; "Account Category"; Option)
        {
            OptionCaption = ' ,Member,Staff Members,Board Members,Delegates,Self-Employed,SMEs,Diaspora,Spouse,Child';
            OptionMembers = " ",Member,"Staff Members","Board Members",Delegates,"Self-Employed",SMEs,Diaspora,Spouse,Child;

            trigger OnValidate()
            begin
                "Country Of Operation" := '';
                if ("Account Category" <> "Account Category"::Spouse) or ("Account Category" <> "Account Category"::Child) then
                    "Principle Member" := '';
            end;
        }
        field(73; "Principle Member"; Code[20])
        {
            TableRelation = Members WHERE(Status = FILTER(Active | Dormant));
        }
        field(50005; "Statement E-Mail Freq."; DateFormula)
        {
        }
        field(50006; "Meeting Days"; Text[30])
        {
        }
        field(50007; "Meeting Time"; Text[30])
        {
        }
        field(50008; "Meeting Venue"; Text[30])
        {
        }
        field(50009; "Constitution Provided"; Boolean)
        {
        }
        field(50010; "Group Minutes Provided"; Boolean)
        {
        }
        field(50011; "Self Employed"; Boolean)
        {
        }
        field(50012; "Country Of Operation"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(50013; "Membership Option"; Option)
        {
            Editable = false;
            OptionCaption = 'Member,Agent';
            OptionMembers = Member,Agent;
        }
        field(39004242; Classification; Option)
        {
            OptionCaption = ' ,Good Standing,Bad Standing';
            OptionMembers = " ","Good Standing","Bad Standing";
        }
        field(39004243; "Electrol Zone"; Code[20])
        {
            TableRelation = "Electrol Zones/Area Svr Center".Code WHERE(Type = CONST("Electral Zone"));

            trigger OnValidate()
            begin
                ElectrolZonesAreaSvrCenter.Reset;
                ElectrolZonesAreaSvrCenter.SetRange(ElectrolZonesAreaSvrCenter.Code, "Electrol Zone");
                if ElectrolZonesAreaSvrCenter.Find('-') then begin
                    "Electrol Zone Descr." := ElectrolZonesAreaSvrCenter.Description;
                end;
            end;
        }
        field(39004244; "Area Service Center"; Code[20])
        {
            TableRelation = "Electrol Zones/Area Svr Center".Code WHERE(Type = CONST("Area Service Centers"));
        }
        field(39004245; Type; Option)
        {
            OptionCaption = ' ,From Other Sacco';
            OptionMembers = " ","From Other Sacco";
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
        field(39004249; "Virtual Member"; Boolean)
        {
        }
        field(39004250; "Tax Exempted"; Boolean)
        {
            Caption = 'Disabled';
        }
        field(39004251; "CRM Application No."; Code[50])
        {
            Description = '//Look up 39004410';
            TableRelation = "CRM Application"."No." WHERE("Application Type" = CONST(Membership),
                                                           "Approval Status" = FILTER(Deffered | Open),
                                                           Created = CONST(false),
                                                           Case360_Docs = CONST(1));

            trigger OnValidate()
            begin
                if CRMApplication.Get("CRM Application No.") then begin
                    //"Home Address":=CRMApplication."Home Address";
                    //"Phone No.":=CRMApplication."Phone No.";
                    "Global Dimension 1 Code" := CRMApplication."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := CRMApplication."Global Dimension 2 Code";
                    //"Currency Code":=CRMApplication."Currency Code";
                    "Second Name" := CRMApplication."Second Name";
                    "Last Name" := CRMApplication."Last Name";
                    "Customer Type" := CRMApplication."Customer Type";
                    //"Application Date":=CRMApplication."Application Date";
                    //"Status":=CRMApplication."Status";
                    "Employer Code" := CRMApplication."Employer Code";
                    "Date of Birth" := CRMApplication."Date of Birth";
                    "E-Mail" := CRMApplication."E-Mail";
                    "Station/Department" := CRMApplication."Station/Department";
                    Nationality := CRMApplication.Nationality;
                    "Payroll/Staff No." := CRMApplication."Payroll No.";
                    "ID No." := CRMApplication."ID No.";
                    //"Mobile Phone No":=CRMApplication."Mobile Phone No";
                    //"Marital Status":=CRMApplication."Marital Status";
                    //"Passport No.":=CRMApplication."Passport No.";
                    Gender := CRMApplication.Gender;
                    "First Name" := CRMApplication."First Name";
                    Occupation := CRMApplication.Occupation;
                    Designation := CRMApplication.Designation;
                    "Terms of Employment" := CRMApplication."Terms of Employment";
                    "Post Code" := CRMApplication."Post Code";
                    City := CRMApplication.City;
                    //"Responsibility Center":=CRMApplication."Responsibility Cente"";
                    County := CRMApplication.County;
                    "Bank Code" := CRMApplication."Bank Code";
                    "Branch Code" := CRMApplication."Branch Code";
                    "Recruited By" := CRMApplication."Recruited By";
                    "Member Segment" := CRMApplication."Member Segment";
                    "Type of Business" := CRMApplication."Type of Business";
                    "Other Business Type" := CRMApplication."Other Business Type";
                    "Ownership Type" := CRMApplication."Ownership Type";
                    "Other Account Type" := CRMApplication."Other Account Type";
                    "Nature of Business" := CRMApplication."Nature of Business";
                    "Bank Account No." := CRMApplication."Bank Account No.";
                    "Company Registration No." := CRMApplication."Company Registration No.";
                    "Date of Business Reg." := CRMApplication."Date of Business Reg.";
                    "Business/Group Location" := CRMApplication."Business/Group Location";
                    "P.I.N Number" := CRMApplication."P.I.N Number";
                    "Plot/Bldg/Street/Road" := CRMApplication."Plot/Bldg/Street/Road";
                    "Group Type" := CRMApplication."Group Type";
                    "Single Party/Multiple/Business" := CRMApplication."Single Party/Multiple/Business";
                    "Birth Certificate No." := CRMApplication."Birth Certificate No.";
                    "Group Account No." := CRMApplication."Group Account No.";
                    //"Created By":=CRMApplication."Created By";
                    Source := CRMApplication.Source;
                    //"Picture":=CRMApplication."Picture";
                    //"Signature":=CRMApplication."Signature";
                    //"Transaction Mobile No":=CRMApplication."Transaction Mobile No";
                    //"Group Account":=CRMApplication."Group Account";
                    //"Recruited by Type":=CRMApplication."Recruited by Type";
                    "Employer Name" := CRMApplication."Employer Name";
                    //"Member Category":=CRMApplication."Member Category";
                    //"Relationship Manager":=CRMApplication."Relationship Manager";
                    //"Statement E-Mail Freq.":=CRMApplication."Statement E-Mail Freq.";
                    //"Classification":=CRMApplication."Classification";
                    "Electrol Zone" := CRMApplication."Electrol Zone";
                    "Area Service Center" := CRMApplication."Area Service Center";
                    Type := CRMApplication.Type;
                    "Dividend Payment Method" := CRMApplication."Dividend Payment Method";
                    "Old Member No." := CRMApplication."Old Member No.";
                    //"Associated Member No.":=CRMApplication."Associated Member No.";
                    //"Virtual Member":=CRMApplication."Virtual Member";
                    //"Tax Exempted":=CRMApplication."Tax Exempted";
                    //"CRM Application No.":=CRMApplication."CRM Application No.";
                end;
            end;
        }
        field(39004252; "Recruited By Name"; Text[100])
        {
            Editable = false;
        }
        field(39004254; Salutation; Code[50])
        {
            Description = '39004358';
            TableRelation = "Salutation Tittles".Code WHERE(Type = CONST(Tittle));
        }
        field(39004255; "Electrol Zone Descr."; Text[100])
        {
            Editable = false;
        }
        field(39004256; "Auto Apply ATM"; Boolean)
        {
        }
        field(39004257; "Auto Apply Mobile Banking"; Boolean)
        {
        }
        field(39004258; "ID Card"; BLOB)
        {
        }
        field(39004259; "ID Card Back"; BLOB)
        {
        }
        field(39004260; "Agent Code"; Code[20])
        {
        }
        field(39004261; "Agent Doc No"; Code[30])
        {
        }
        field(39004262; "Agent Account"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "CRM Application No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        UserSetup: Record "User Setup";
    begin
        if "No." = '' then begin
            SeriesSetup.Get;
            SeriesSetup.TestField(SeriesSetup."Member Application Nos.");
            //NoSeriesMgtInitSeries(SeriesSetup."Member Application Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        if UserSet.Get(UserId) then begin
            "Responsibility Center" := UserSet."Shortcut Dimension 3 Code";
        end;


        ProductFactory.SetFilter(ProductFactory.Status, '%1', ProductFactory.Status::Active);
        ProductFactory.SetFilter(ProductFactory."Auto Open Account", '%1', true);
        ProductFactory.SetFilter(ProductFactory."Product Category", '<>%1 & <>%2', ProductFactory."Product Category"::"Fixed Deposit",
                                 ProductFactory."Product Category"::"Junior Savings");
        if ProductFactory.Find('-') then begin
            repeat
                AutoOpenSavingAccs.Init;
                AutoOpenSavingAccs."No." := "No.";
                AutoOpenSavingAccs.Validate(AutoOpenSavingAccs."Product Type", ProductFactory."Product ID");
                AutoOpenSavingAccs."Monthly Contribution" := ProductFactory."Minimum Contribution";
                AutoOpenSavingAccs.Insert;
            until ProductFactory.Next = 0;
        end;


        "Application Date" := Today;
        "Current Address" := Addr;
        "Created By" := UserId;

        if UserSetup.Get(UserId) then begin
            UserSetup.TestField(UserSetup."Global Dimension 1 Code");
            UserSetup.TestField(UserSetup."Global Dimension 2 Code");
            "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
            "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
            "Responsibility Center" := UserSetup."Responsibility Centre";
        end;


        // MemberApplication2.RESET;
        // MemberApplication2.SETRANGE("Created By",USERID);
        // MemberApplication2.SETRANGE(Status,MemberApplication2.Status::Open);
        // IF MemberApplication2.FIND('-') THEN BEGIN
        //  IF MemberApplication2.COUNT>1 THEN
        //    ERROR('There are applications that have been opened and are not in use, Kindly use them first');
        //  END;
    end;

    var
        SeriesSetup: Record "Credit Nos. Series";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSet: Record "User Setup";
        Cust: Record Members;
        StrTel: Text[30];
        PostCode: Record "Post Code";
        ProductFactory: Record "Product Factory";
        AutoOpenSavingAccs: Record "Savings Account Registration";
        Text018: Label 'This applicant is below the mininmum membership age of %1. Is the applicant applying for a junior account';
        GeneralSetUp: Record "General Set-Up";
        DateofBirthError: Label 'Date cannot be greater than today.';
        MinimumAgeError: Label 'Date of birth must be less than %1';
        MemberExistError: Label 'Already exists with member %1 Name: %2';
        CountryRegion: Record "Country/Region";
        // SMTPMail: Codeunit "SMTP Mail";
        Customer: Record Customer;
        MemberApplication: Record "Member Application";
        Addr: Label 'P.O. BOX - ';
        BankAccountErr: Label 'Bank Account No cannot be more then 14 characters.';
        MemberCategory: Record "Member Category";
        ApplicationDocuments: Record "Application Documents";
        CRMApplication: Record "CRM Application";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        ElectrolZonesAreaSvrCenter: Record "Electrol Zones/Area Svr Center";
        SavingsAccounts: Record "Savings Accounts";
        HREmployees: Record "HR Employees";
        MemberApplication2: Record "Member Application";
        NewMob: Code[20];
        MemberRejError: Label 'Status is Rejected For member %1 Name: %2';

    //[Scope('Internal')]
    procedure FieldLength(VarVariant: Text; FldLength: Integer): Text
    var
        FieldLengthError: Label 'Field cannot be more than %1 Characters.';
    begin
        if StrLen(VarVariant) > FldLength then
            Error(FieldLengthError, FldLength);
    end;
}

