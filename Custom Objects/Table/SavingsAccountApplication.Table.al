table 52185704 "Savings Account Application"
{

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            SQLDataType = Varchar;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SeriesSetup.Get;
                    //NoSeriesMgtTestManual(SeriesSetup."Accounts Application");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';

            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(3; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
        }
        field(4; "Name 2"; Text[50])
        {
            Caption = 'Name 2';
        }
        field(5; "Current Address"; Text[50])
        {
            Caption = 'Address';
        }
        field(6; City; Text[30])
        {
            Caption = 'City';

            trigger OnLookup()
            begin
                //PostCode.LookUpCity(City,"Post Code",TRUE);
            end;

            trigger OnValidate()
            begin
                //PostCode.ValidateCity(City,"Post Code");
            end;
        }
        field(7; Contact; Text[50])
        {
            Caption = 'Contact';
        }
        field(8; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            CharAllowed = '0123456789';
            ExtendedDatatype = PhoneNo;
        }
        field(9; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,Blocked);
            end;
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Last Date Modified");
            end;
        }
        field(11; "Customer Posting Group"; Code[10])
        {
            Caption = 'Customer Posting Group';
            TableRelation = "Customer Posting Group";
        }
        field(12; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(13; "Recruited By"; Code[10])
        {
            Caption = 'Salesperson Code';
            Description = 'LookUp to Salesperson/Purchaser Table';
            TableRelation = "Salesperson/Purchaser";
        }
        field(14; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                if CountryRegion.Get("Country/Region Code") then
                    "Mobile Phone No" := CountryRegion.Code;
            end;
        }
        field(15; Comment; Boolean)
        {
            CalcFormula = Exist("Comment Line" WHERE("Table Name" = CONST(Customer),
                                                      "No." = FIELD("No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16; Blocked; Option)
        {
            Caption = 'Blocked';
            OptionCaption = ' ,Credit,Debit,All';
            OptionMembers = " ",Credit,Debit,All;
        }
        field(17; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(18; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(19; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(20; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(21; Membership; Option)
        {
            OptionCaption = ' ,Ordinary,Preferential';
            OptionMembers = " ",Ordinary,Preferential;
        }
        field(22; "Account Category"; Option)
        {
            OptionCaption = 'Member, Staff Account,Board Members,Delegates';
            OptionMembers = Member," Staff Account","Board Members",Delegates;
        }
        field(23; "Member No."; Code[20])
        {
            TableRelation = Members;

            trigger OnValidate()
            begin
                // MultipleAccountCreation;
                "Application Date" := Today;

                if Cust.Get("Member No.") then begin
                    //     case "Product Category" of
                    //         "Product Category"::"Junior Savings":
                    //             begin
                    //                 Name := '';
                    //                 "Search Name" := '';
                    //                 Gender := Gender::" ";
                    //             end;
                    //         "Product Category"::"0", "Product Category"::"Deposit Contribution", "Product Category"::"Fixed Deposit",
                    //         "Product Category"::"Share Capital":
                    //             begin
                    //                 Name := Cust."First Name" + ' ' + Cust."Second Name" + ' ' + Cust."Last Name";
                    //                 "Search Name" := Cust."Search Name";
                    //                 Gender := Cust.Gender;
                    //             end;
                    //     end;

                    "Current Address" := Cust."Current Address";
                    "Payroll/Staff No." := Cust."Payroll/Staff No.";
                    "Employer Code" := Cust."Employer Code";
                    "Phone No." := Cust."Phone No.";
                    "Post Code" := Cust."Post Code";
                    "Country/Region Code" := Cust.Nationality;
                    County := Cust.County;
                    "Passport No." := Cust."Passport No.";
                    "E-Mail" := Cust."E-Mail";
                    "Mobile Phone No" := Cust."Mobile Phone No";
                    "ID No." := Cust."ID No.";
                    "Group Account" := Cust."Group Account";
                    "Group Code" := Cust."Group Account No.";
                    "Date of Birth" := Cust."Date of Birth";
                    "Marital Status" := Cust."Marital Status";
                    "Account Type" := Cust."Account Type";
                    "Relates to Business/Group" := Cust."Relates to Business/Group";
                    "Global Dimension 1 Code" := Cust."Global Dimension 1 Code";
                    "Global Dimension 2 Code" := Cust."Global Dimension 2 Code";
                    "Type of Business" := Cust."Type of Business";
                    "Other Business Type" := Cust."Other Business Type";
                    "Member Category" := Cust."Member Category";
                    Validate("Member Category");
                    "Transaction Mobile No" := Cust."Mobile Phone No";

                    MemberCategory.Reset;
                    MemberCategory.SetRange("No.", "Member Category");
                    if MemberCategory.Find('-') then begin
                        if "Product Category" = "Product Category"::"Registration Fee" then
                            "Monthly Contribution" := MemberCategory."Registration Fee"
                        else
                            if "Product Category" = "Product Category"::"Share Capital" then
                                "Monthly Contribution" := MemberCategory."Default Share Capital"
                            else
                                if "Product Category" = "Product Category"::"Deposit Contribution" then
                                    "Monthly Contribution" := MemberCategory."Default Share Deposit";
                    end;
                end;
            end;
        }
        field(24; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code"
            ELSE
            IF ("Country/Region Code" = FILTER(<> '')) "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(25; County; Text[30])
        {
            Caption = 'County';
        }
        field(26; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;
        }
        field(27; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(29; "Currency Filter"; Code[10])
        {
            Caption = 'Currency Filter';
            FieldClass = FlowFilter;
            TableRelation = Currency;
        }
        field(30; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility CenterBR";
        }
        field(31; "Base Calendar Code"; Code[10])
        {
            Caption = 'Base Calendar Code';
            TableRelation = "Base Calendar";
        }
        field(32; "Transaction Mobile No"; Code[20])
        {
            CharAllowed = '0123456789';
            Description = 'MPESA Mobile No';

            trigger OnValidate()
            begin
                /*IF STRLEN("Transaction Mobile No") > 13 THEN BEGIN
                "Transaction Mobile No":='';
                END;*/

            end;
        }
        field(33; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending,Approved,Rejected,Created';
            OptionMembers = Open,Pending,Approved,Rejected,Created;
        }
        field(34; "Employer Code"; Code[50])
        {
        }
        field(35; "Date of Birth"; Date)
        {

            trigger OnValidate()
            begin
                if "Date of Birth" > Today then
                    Error(DateofBirthError);
            end;
        }
        field(36; "Home Address"; Text[50])
        {
        }
        field(37; "Payroll/Staff No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "Payroll/Staff No." <> '' then begin
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange(SavingsAccounts."Employer Code", "Employer Code");
                    SavingsAccounts.SetRange(SavingsAccounts."Payroll/Staff No.", "Payroll/Staff No.");
                    if SavingsAccounts.FindFirst then
                        Error(AccountExistsError, SavingsAccounts."No.", SavingsAccounts.Name);
                end;
            end;
        }
        field(38; "ID No."; Code[11])
        {

            trigger OnValidate()
            begin
                "ID No." := DelChr("ID No.", '=', 'A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?');
                // FieldLength("ID No.", 10);

                if "ID No." <> '' then begin
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange(SavingsAccounts."ID No.", "ID No.");
                    if SavingsAccounts.FindFirst then
                        Error(AccountExistsError, SavingsAccounts."No.", SavingsAccounts.Name);
                end;
            end;
        }
        field(39; "Mobile Phone No"; Code[50])
        {
            CharAllowed = '0123456789';

            trigger OnValidate()
            begin
                //TESTFIELD("Country/Region Code");
            end;
        }
        field(40; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Divorced,Widower,Widow;
        }
        field(41; "Passport No."; Code[50])
        {

            trigger OnValidate()
            begin
                if "Passport No." <> '' then begin
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange(SavingsAccounts."Passport No.", "Passport No.");
                    if SavingsAccounts.FindFirst then
                        Error(AccountExistsError, SavingsAccounts."No.", SavingsAccounts.Name);
                end;
            end;
        }
        field(42; Gender; Option)
        {
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(44; "Type Of Organisation"; Option)
        {
            OptionCaption = ' ,Club,Association,Partnership,Investment,Merry go round,Other,Group';
            OptionMembers = " ",Club,Association,Partnership,Investment,"Merry go round",Other,Group;
        }
        field(45; "Group Account No"; Code[20])
        {
            Description = 'Check Relation';
        }
        field(46; "Group Account"; Boolean)
        {
        }
        field(47; "Product Type"; Code[20])
        {
            Description = 'LookUp into Product Factory Table';
            TableRelation = "Product Factory" WHERE("Product Class Type" = CONST(Savings),
                                                     Status = CONST(Active));

            trigger OnValidate()
            var
                ProductApplicationDocuments: Record "Product Documents";
                ApplicationDocuments: Record "Application Documents";
            begin
                // MultipleAccountCreation;
                "Application Date" := Today;

                if ProductFactory.Get("Product Type") then begin
                    MemberCategory.Reset;
                    MemberCategory.SetRange(MemberCategory."No.", ProductFactory."Member Category");
                    if MemberCategory.Find('-') then begin
                        Cust.SetRange("No.", "Member No.");
                        if Cust.Find('-') then begin
                            Sav.Reset;
                            Sav.SetRange(Sav."Member No.", Cust."No.");
                            Sav.SetRange(Sav."Product Category", Sav."Product Category"::"Deposit Contribution");
                            if Sav.Find('-') then begin
                                Sav.CalcFields(Balance, "Balance (LCY)");
                                if Sav."Balance (LCY)" < MemberCategory."Premier Club Min.Deposits" then
                                    Error('This member has deposits of %1 less than %2 required to Join %3', Sav.Balance, MemberCategory."Premier Club Min.Deposits", MemberCategory."No.");
                            end;
                        end;
                    end;

                    "Product Name" := ProductFactory."Product Description";
                    //**"Monthly Contribution":=ProductFactory."Minimum Contribution";
                    "Customer Posting Group" := ProductFactory."Product Posting Group";
                    "Product Category" := ProductFactory."Product Category";

                    ApplicationDocuments.Reset;
                    ApplicationDocuments.SetFilter(ApplicationDocuments."Reference No.", '%1', "No.");
                    if ApplicationDocuments.Find('-') then
                        ApplicationDocuments.DeleteAll;

                    ProductApplicationDocuments.Reset;
                    ProductApplicationDocuments.SetRange(ProductApplicationDocuments."Product ID", ProductFactory."Product ID");
                    if ProductApplicationDocuments.Find('-') then begin
                        repeat
                            ApplicationDocuments.Init;
                            ApplicationDocuments."Reference No." := "No.";
                            ApplicationDocuments.Validate(ApplicationDocuments."Document No.", ProductApplicationDocuments."Document No.");
                            ApplicationDocuments.Validate(ApplicationDocuments."Product ID", "Product Type");
                            ApplicationDocuments."Product Name" := ProductFactory."Product Description";
                            ApplicationDocuments.Insert;
                        until ProductApplicationDocuments.Next = 0;
                    end;

                    if "Product Category" = "Product Category"::"Junior Savings" then begin
                        SavingsAccount.Reset;
                        SavingsAccount.SetRange("Member No.", "Member No.");
                        SavingsAccount.SetRange("Loan Disbursement Account", true);
                        if SavingsAccount.Find('-') then
                            "Parent Account No." := SavingsAccount."No.";
                        Name := '';
                        "Date of Birth" := 0D;
                    end else begin
                        if Cust.Get("Member No.") then begin
                            "Parent Account No." := '';
                            Name := Cust.Name;
                            "Date of Birth" := Cust."Date of Birth";
                        end;
                    end;
                end;
            end;
        }
        field(48; "Product Name"; Text[50])
        {
            Editable = false;
        }
        field(49; "Can Guarantee Loan"; Boolean)
        {
        }
        field(50; "Loan Disbursement Account"; Boolean)
        {
        }
        field(51; "Loan Security Inclination"; Option)
        {
            OptionCaption = ' ,Short Loan Security,Long Term Loan Security,Share Capital';
            OptionMembers = " ","Short Term Loan Security","Long Term Loan Security","Share Capital";
        }
        field(52; "Fixed Deposit Status"; Option)
        {
            OptionCaption = ' ,Active,Matured,Closed,Not Matured';
            OptionMembers = " ",Active,Matured,Closed,"Not Matured";
        }
        field(53; "Relates to Business/Group"; Boolean)
        {
        }
        field(54; "Company Registration No."; Code[20])
        {
        }
        field(55; "Birth Certificate No."; Code[20])
        {

            trigger OnValidate()
            begin
                if "Birth Certificate No." <> '' then begin
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange(SavingsAccounts."Birth Certificate No.", "Birth Certificate No.");
                    if SavingsAccounts.FindFirst then
                        Error(AccountExistsError, SavingsAccounts."No.", SavingsAccounts.Name);
                end;
            end;
        }
        field(56; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(57; "Group Code"; Code[10])
        {
        }
        field(58; "Registration Date"; Date)
        {
        }
        field(59; "FD Marked for Closure"; Boolean)
        {
        }
        field(60; "Expected Maturity Date"; Date)
        {
        }
        field(61; "Savings Account No."; Code[20])
        {
            Description = 'LookUp to Savings Account Table';
            TableRelation = "Savings Accounts" WHERE("Member No." = FIELD("Member No."),
                                                      "Product Category" = FILTER(" "));
        }
        field(62; "Parent Account No."; Code[20])
        {
            Description = 'LookUp to Member Table';
            TableRelation = "Savings Accounts" WHERE("Member No." = FIELD("Member No."),
                                                      "Product Category" = FILTER(" "));
        }
        field(64; "Fixed Deposit Type"; Code[20])
        {
            Description = 'LookUp to Fixed Deposit Type Table';
            TableRelation = "Fixed Deposit Type" WHERE(Blocked = CONST(false));

            trigger OnValidate()
            begin
                TestField("Application Date");
                if FixedDepositType.Get("Fixed Deposit Type") then begin
                    "FD Maturity Date" := CalcDate(FixedDepositType.Duration, "Application Date");
                    //"FD Duration" := FixedDepositType."No. of Months";
                    "Product Category" := "Product Category"::"Fixed Deposit";
                end
            end;
        }
        field(65; "FD Maturity Date"; Date)
        {
        }
        field(66; "Monthly Contribution"; Decimal)
        {
        }
        field(67; "Force No."; Code[20])
        {
        }
        field(69; "Product Category"; Option)
        {
            OptionCaption = ',Share Capital,Deposit Contribution,Fixed Deposit,Junior Savings,Registration Fee,Benevolent,Unallocated Fund,Premier Club Reg Fee,Premier Club Account,Investment Account,Holiday Account';
            OptionMembers = ,"Share Capital","Deposit Contribution","Fixed Deposit","Junior Savings","Registration Fee",Benevolent,"Unallocated Fund","Premier Club Reg Fee","Premier Club Account","Investment Account","Holiday Account";
        }
        field(70; "Neg. Interest Rate"; Decimal)
        {

            trigger OnValidate()
            begin
                FDCalcRules.Reset;
                FDCalcRules.SetRange(Code, "Fixed Deposit Type");
                if FDCalcRules.Find('-') then begin
                    repeat
                        if FDCalcRules."Allowed Margin" <> 0 then begin
                            if ("Fixed Deposit Amount" >= FDCalcRules."Minimum Amount") and ("Fixed Deposit Amount" <= FDCalcRules."Maximum Amount") then
                                if ("Neg. Interest Rate" > (FDCalcRules."Interest Rate" + FDCalcRules."Allowed Margin")) or
                                   ("Neg. Interest Rate" < (FDCalcRules."Interest Rate" - FDCalcRules."Allowed Margin")) then
                                    Error('The negotiated rate must be within the allowed margin of %1', FDCalcRules."Allowed Margin");
                        end;
                    until
                    FDCalcRules.Next = 0;
                end;
            end;
        }
        field(71; "FD Duration"; DateFormula)
        {

            trigger OnValidate()
            begin
                "FD Maturity Date" := CalcDate("FD Duration", "Application Date");
            end;
        }
        field(72; "FD Maturity Instructions"; Option)
        {
            OptionCaption = ' ,Transfer all to Savings,Renew Principal,Renew Principal & Interest';
            OptionMembers = " ","Transfer all to Savings","Renew Principal","Renew Principal & Interest";
        }
        field(73; "Fixed Deposit cert. no"; Code[30])
        {
            Description = 'Capture FxD certificate Number';
        }
        field(75; "Group Type"; Option)
        {
            OptionCaption = ' ,Welfare,Microfinance';
            OptionMembers = " ",Welfare,Microfinance;
        }
        field(76; "Application Date"; Date)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "Application Date" > Today then
                    Error(DateofBirthError);
            end;
        }
        field(77; "Account Type"; Option)
        {
            OptionCaption = ' ,Savings Account,Personal Savings,Microfinance Savings,Salary Account,Share Deposit Account,Fixed Deposit Account,Others(Specify)';
            OptionMembers = " ","Savings Account","Personal Savings","Microfinance Savings","Salary Account","Share Deposit Account","Fixed Deposit Account","Others(Specify)";
        }
        field(78; "Other Business Type"; Text[15])
        {
        }
        field(80; "Type of Business"; Option)
        {
            OptionCaption = ' ,Sole Proprietor,Paerneship,Limited Liability Company,Informal Body,Registered Group,Other(Specify)';
            OptionMembers = " ","Sole Proprietor",Paerneship,"Limited Liability Company","Informal Body","Registered Group","Other(Specify)";
        }
        field(81; "P.I.N Number"; Code[20])
        {

            trigger OnValidate()
            begin
                // FieldLength("P.I.N Number", 15);

                if "P.I.N Number" <> '' then begin
                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange(SavingsAccounts."ID No.", "ID No.");
                    if SavingsAccounts.FindFirst then
                        Error(AccountExistsError, SavingsAccounts."No.", SavingsAccounts.Name);
                end;
            end;
        }
        field(82; Source; Option)
        {
            Description = 'Used to identify origin of Member Application [CRM, Navision, Web]';
            OptionCaption = ' ,Navision,CRM,Web';
            OptionMembers = " ",Navision,CRM,Web;
        }
        field(83; "Fixed Deposit Amount"; Decimal)
        {
        }
        field(84; Picture; BLOB)
        {
            Caption = 'Picture';
            Description = 'Used to capture applicant Photos and should be deleted on account creation.';
            SubType = Bitmap;
        }
        field(85; Signature; BLOB)
        {
            Caption = 'Signature';
            Description = 'Used to capture applicant Signature and should be deleted on account creation.';
            SubType = Bitmap;
        }
        field(86; "Member Category"; Code[10])
        {
            TableRelation = "Member Category";

            trigger OnValidate()
            var
                Sav: Record "Savings Accounts";
                Cust: Record Members;
                Product: Record "Product Factory";
                MemberCategory: Record "Member Category";
            begin
                MemberCategory.Reset;
                MemberCategory.SetRange("No.", "Member Category");
                if MemberCategory.Find('-') then begin
                    //IF "Account Type"="Account Type"::"Savings Account" THEN
                    //  BEGIN
                    // MESSAGE(MemberCategory."No.");

                    Cust.SetRange("No.", "Member No.");
                    if Cust.Find('-') then begin
                        Sav.Reset;
                        Sav.SetRange(Sav."Member No.", Cust."No.");
                        Sav.SetRange(Sav."Product Category", Sav."Product Category"::"Deposit Contribution");
                        if Sav.Find('-') then begin
                            Sav.CalcFields(Balance, "Balance (LCY)");
                            if Sav."Balance (LCY)" < MemberCategory."Premier Club Min.Deposits" then begin
                                if MemberCategory."Premier Club Min.Deposits" <> 0 then
                                    Error('This member has deposits of %1 less than %2 required to Join %3', Sav.Balance, MemberCategory."Premier Club Min.Deposits", MemberCategory."No.");
                            end;
                        end;
                        //   END;
                    end;
                end;
            end;
        }
        field(90; "Recruited by Type"; Option)
        {
            OptionCaption = 'Marketer,Others';
            OptionMembers = Marketer,Others;
        }
        field(50004; "Relationship Manager"; Code[10])
        {
            TableRelation = "HR Employees" WHERE(Status = FILTER(Active));
        }
        field(50005; "Statement E-Mail Freq."; DateFormula)
        {
        }
        field(50006; "Signing Instructions"; Text[30])
        {
        }
        field(39004242; Classification; Option)
        {
            OptionCaption = ' ,Good Standing,Bad Standing';
            OptionMembers = " ","Good Standing","Bad Standing";
        }
        field(39004247; "Old Member No."; Code[20])
        {
        }
        field(39004248; "Associated Member No."; Code[20])
        {
        }
        field(39004249; "CRM Application No."; Code[50])
        {
            TableRelation = "CRM Application"."No." WHERE("Application Type" = CONST("Savings Account"),
                                                           "Approval Status" = FILTER(Deffered | Open),
                                                           Created = CONST(false),
                                                           Case360_Docs = CONST(1));

            trigger OnValidate()
            begin
                if CRMApplication.Get("CRM Application No.") then begin
                    "Product Type" := CRMApplication."Product Factory";
                    Validate("Product Type");
                    "Member No." := CRMApplication."Member No.";
                    Validate("Member No.");
                end;
            end;
        }
        field(39004250; "Agent Code"; Code[20])
        {
        }
        field(39004251; "Agent Document No"; Code[20])
        {
        }
        field(39004252; "Created By Agent"; Boolean)
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
    begin

        AccountApplication.Reset;
        AccountApplication.SetFilter(Status, '%1', AccountApplication.Status::Open);
        AccountApplication.SetRange("Created By", UserId);
        if AccountApplication.Find('-') then begin
            if AccountApplication.Count > 2 then
                Error('Kindly use the open document first for you to create a new one');
        end;



        if "No." = '' then begin
            SeriesSetup.Get;
            SeriesSetup.TestField(SeriesSetup."Accounts Application");
            //NoSeriesMgtInitSeries(SeriesSetup."Accounts Application", xRec."No. Series", 0D, "No.", "No. Series");
        end;

        "Application Date" := Today;
        "Created By" := UserId;

        if UserSetup.Get(UserId) then begin
            UserSetup.TestField(UserSetup."Global Dimension 1 Code");
            UserSetup.TestField(UserSetup."Global Dimension 2 Code");
            "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
            "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
            "Responsibility Center" := UserSetup."Responsibility Centre";
        end;
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
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        Cust: Record Members;
        ProductFactory: Record "Product Factory";
        ImageData: Record "Image Data";
        ParentEdit: Boolean;
        TypeHide: Boolean;
        FXDDetailsVisible: Boolean;
        JuniourAccVisible: Boolean;
        FixedDepositType: Record "Fixed Deposit Type";
        GeneralSetUp: Record "General Set-Up";
        UserSetup: Record "User Setup";
        SavingsAccounts: Record "Savings Accounts";
        DateofBirthError: Label 'Date cannot be greater than today.';
        AccountExistsError: Label 'Applicant already has a similar Account No.%1 Name %2 .';
        CountryRegion: Record "Country/Region";
        PostCode: Record "Post Code";
        FDCalcRules: Record "FD Interest Calculation Rules";
        MemberCategory: Record "Member Category";
        SavingsAccount: Record "Savings Accounts";
        CRMApplication: Record "CRM Application";
        Sav: Record "Savings Accounts";
        AccountApplication: Record "Savings Account Application";

    //[Scope('Internal')]
    procedure MultipleAccountCreation()
    var
        AllowMultipleAcntError: Label 'Applicant already has %1, Kindly ensure this product allows multiple account creations to proceed.';
    begin
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
        SavingsAccounts.SetRange(SavingsAccounts."Product Type", "Product Type");
        if SavingsAccounts.Find('-') then begin
            if ProductFactory.Get("Product Type") then begin
                if not ProductFactory."Allow Multiple Accounts" then
                    if SavingsAccounts.Count >= 1 then
                        Error(AllowMultipleAcntError, SavingsAccounts."Product Name");
                //MESSAGE(FORMAT(SavingsAccounts.COUNT));
            end;
        end;
    end;

    //[Scope('Internal')]
    procedure FieldLength(VarVariant: Text; FldLength: Integer): Text
    var
        FieldLengthError: Label 'Field cannot be more than %1 Characters.';
    begin
        if StrLen(VarVariant) > FldLength then
            Error(FieldLengthError, FldLength);
    end;
}

