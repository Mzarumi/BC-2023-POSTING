table 52185753 "Reactivate/Deactivate Header"
{
    //DrillDownPageID = "+ Member Change List";
    //LookupPageID = "Member Change List";

    fields
    {
        field(1; "No."; Code[10])
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SeriesSetup.Get();
                    //NoSeriesMgtTestManual(SeriesSetup."Member Reactivation Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Application Date"; Date)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "Application Date" > Today then
                    Error(DateofBirthError);
            end;
        }
        field(3; "Application Time"; Time)
        {
            Editable = false;
        }
        field(4; Comment; Boolean)
        {
            CalcFormula = Exist("Comment Line" WHERE("No." = FIELD("No.")));
            Caption = 'Comment';
            Description = 'LookUp to Comment Line';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "No. Series"; Code[20])
        {
            Editable = false;
        }
        field(6; "Account Type"; Option)
        {
            OptionCaption = ' ,Member,Savings';
            OptionMembers = " ",Member,Savings;
        }
        field(7; "Account No."; Code[20])
        {
            TableRelation = IF ("Account Type" = CONST(Member)) Members
            ELSE
            IF ("Account Type" = CONST(Savings)) "Savings Accounts";

            trigger OnValidate()
            var
                BankAccount: Record "Bank Account";
            begin
                /*ClearFields;*/

                /*CASE "Account Type" OF
                 "Account Type"::Member :
                   BEGIN
                   */

                if "Account Type" = "Account Type"::Member then begin
                    if CustMembr.Get("Account No.") then
                        Validate("Member No.", CustMembr."No.");
                    Validate("Single Party/Multiple/Business", CustMembr."Single Party/Multiple");
                    Validate("First Name", CustMembr."First Name");
                    Validate("Second Name", CustMembr."Second Name");
                    Validate("Last Name", CustMembr."Last Name");
                    Validate(Name, CustMembr.Name);
                    Validate("Recruited by Type", CustMembr."Recruited by Type");
                    Validate("P.I.N Number", CustMembr."P.I.N Number");
                    if CustMembr.Status = CustMembr.Status::Closed then
                        "Account Status" := CustMembr.Status
                    else
                        Validate("Account Status", CustMembr.Status);

                    Validate(Blocked, CustMembr.Blocked);
                    Validate("Member Segment", CustMembr."Member Segment");
                    if CustMembr."Member Category" <> 'PREMIER' then
                        Validate("Member Category", CustMembr."Member Category")
                    else
                        Rec."Member Category" := CustMembr."Member Category";
                    Validate("Relationship Manager", CustMembr."Relationship Manager");
                    "Mobile Phone No" := CustMembr."Mobile Phone No";
                    //VALIDATE("Mobile Phone No", CustMembr."Mobile Phone No");
                    Validate("E-Mail", CustMembr."E-Mail");
                    Validate(Salutation, CustMembr.Salutation);
                    Validate("Payroll/Staff No.", CustMembr."Payroll/Staff No.");
                    Validate("Allow Mboosta Defaulter", CustMembr."Allow MBoosta Defaulter");
                    Validate("ID No.", CustMembr."ID No.");
                    Validate("Passport No.", CustMembr."Passport No.");
                    "Date of Birth" := CustMembr."Date of Birth";
                    // VALIDATE("Date of Birth", CustMembr."Date of Birth");
                    Validate("Marital Status", CustMembr."Marital Status");
                    Validate(Gender, CustMembr.Gender);
                    Validate("Tax Exempted", CustMembr."Tax Exempted");
                    Validate("Rejoining Date", CustMembr."Rejoinig Date");
                    Validate(Type, CustMembr.Type);

                    Validate("Group Account No.", CustMembr."Group Account No.");
                    Validate("Group Type", CustMembr."Group Type");
                    Validate("Nature of Business", CustMembr."Nature of Business");
                    Validate("Company Registration No.", CustMembr."Company Registration No.");
                    Validate("Date of Business Reg.", CustMembr."Date of Business Reg.");
                    Validate("Business/Group Location", CustMembr."Business/Group Location");
                    Validate("Plot/Bldg/Street/Road", CustMembr."Plot/Bldg/Street/Road");
                    Validate("Type of Business", CustMembr."Type of Business");
                    Validate("Ownership Type", CustMembr."Ownership Type");
                    Validate("Other Business Type", CustMembr."Other Business Type");
                    Validate(Retiree, CustMembr.Retiree);
                    Validate("Post Code", CustMembr."Post Code");
                    Validate(City, CustMembr.City);
                    Validate(Nationality, CustMembr.Nationality);
                    //VALIDATE(County, CustMembr.County);
                    Validate("Phone No.", CustMembr."Phone No.");
                    "Mobile Phone No" := CustMembr."Mobile Phone No";
                    //VALIDATE("Mobile Phone No", CustMembr."Mobile Phone No");
                    Validate("E-Mail", CustMembr."E-Mail");
                    Validate(Salutation, CustMembr.Salutation);
                    Validate("Current Address", CustMembr."Current Address");

                    Validate("Employer Code", CustMembr."Employer Code");
                    Validate("Global Dimension 1 Code", CustMembr."Global Dimension 1 Code");
                    Validate("Global Dimension 2 Code", CustMembr."Global Dimension 2 Code");
                    Validate("Recruited by Type", CustMembr."Recruited by Type");
                    //VALIDATE("Recruited By", CustMembr."Recruited By");
                    Validate("Electrol Zone", CustMembr."Region Code");
                    Validate("Area Service Center", CustMembr."Area Service Center");

                    Validate("Bank Code", CustMembr."Bank Code");
                    Validate("Branch Code", CustMembr."Branch Code");
                    Validate("Bank Account No.", CustMembr."Bank Account No.");
                    /* END;*/

                    //GetPicSig;


                    /*"Account Type"::Savings :
                     BEGIN*/
                end else
                    if "Account Type" = "Account Type"::Savings then begin
                        if SAccounts.Get("Account No.") then begin
                            if "Account Type" = "Account Type"::Savings then begin
                                if SAccounts.Get("Account No.") then begin
                                    if (SAccounts.Status = SAccounts.Status::Dormant) and (SAccounts."Product Type" = '505') then begin
                                        "Charge Transaction Type" := 'ACTIVATION';
                                    end else
                                        "Charge Transaction Type" := '';
                                end;
                            end;
                            if "Account Type" = "Account Type"::Savings then begin
                                if SAccounts.Get("Account No.") then begin
                                    if (SAccounts.Status = SAccounts.Status::Dormant) and (SAccounts."Product Type" = '505') then begin
                                        "Type of Account Change" := "Type of Account Change"::"Change of account status";
                                    end else
                                        "Type of Account Change" := "Type of Account Change"::None;
                                end;
                            end;




                            if not CustMembr.Get(SAccounts."Member No.") then begin
                                if ReactivateDeactivateHeader.Type = ReactivateDeactivateHeader.Type::"Re-joining" then
                                    Validate("Monthly Contribution", SAccounts."Monthly Contribution")  //# Check if advice info is populated
                                else
                                    Validate("Member No.", SAccounts."Member No.");
                                Validate("Single Party/Multiple/Business", SAccounts."Single Party/Multiple/Business");
                                Validate(Name, SAccounts.Name);


                                Validate("Account Status", SAccounts.Status);
                                Validate("Salary Through FOSA", SAccounts."Salary Through FOSA");
                                Validate(Blocked, SAccounts.Blocked);
                                Validate("Loan Disbursement Account", SAccounts."Loan Disbursement Account");

                                Validate("Relationship Manager", SAccounts."Relationship Manager");
                                "Mobile Phone No" := SAccounts."Mobile Phone No";
                                //VALIDATE("Mobile Phone No", SAccounts."Mobile Phone No");
                                Validate("E-Mail", SAccounts."E-Mail");
                                Validate("Payroll/Staff No.", SAccounts."Payroll/Staff No.");
                                Validate("ID No.", SAccounts."ID No.");
                                Validate("Passport No.", SAccounts."Passport No.");
                                "Date of Birth" := SAccounts."Date of Birth";
                                //VALIDATE("Date of Birth", SAccounts."Date of Birth");
                                Validate("Marital Status", SAccounts."Marital Status");
                                Validate(Gender, SAccounts.Gender);
                                Validate("Mobile Loan Blocked", SAccounts."Mobile Loan Blocked");
                                Validate("Group Account", SAccounts."Group Account");
                                Validate("Group Account No.", SAccounts."Group Account No");

                                Validate("Signing Instructions", SAccounts."Signing Instructions");
                                Validate("FD Duration", SAccounts."FD Duration");
                                Validate("FD Maturity Date", SAccounts."FD Maturity Date");
                                Validate("Fixed Deposit Amount", SAccounts."Fixed Deposit Amount");
                                Validate("Fixed Deposit cert. no", SAccounts."Fixed Deposit cert. no");
                                Validate("Fixed Deposit Status", SAccounts."Fixed Deposit Status");
                                Validate("Fixed Deposit Type", SAccounts."Fixed Deposit Type");
                                Validate("Neg. Interest Rate", SAccounts."Neg. Interest Rate");
                                Validate("Savings Account No.", SAccounts."Savings Account No.");

                                Validate("Enable Sweeping", SAccounts."Enable Sweeping");
                                Validate(Hide, SAccounts.Hide);
                                //      VALIDATE("Bank Account No.",SAccounts."External Account No");
                                //      VALIDATE("Branch Code",SAccounts."Bank Code");

                                Validate("Birth Certificate No.", SAccounts."Birth Certificate No.");
                                Validate("Parent Account No.", SAccounts."Parent Account No.");


                                Validate("Product Type", SAccounts."Product Type");
                                Validate("Product Name", SAccounts."Product Name");
                                Validate("Product Category", SAccounts."Product Category");

                                Validate("Group Account No.", SAccounts."Group Account No");
                                Validate("Company Registration No.", SAccounts."Company Registration No.");

                                Validate("Post Code", SAccounts."Post Code");
                                Validate(City, SAccounts.City);
                                //VALIDATE(County, SAccounts.County);
                                Validate("Phone No.", SAccounts."Phone No.");
                                "Mobile Phone No" := SAccounts."Mobile Phone No";
                                Validate("Mobile Phone No", SAccounts."Mobile Phone No");
                                Validate("E-Mail", SAccounts."E-Mail");
                                Validate("Current Address", SAccounts."Current Address");

                                Validate("Employer Code", SAccounts."Employer Code");
                                Validate("Global Dimension 1 Code", SAccounts."Global Dimension 1 Code");
                                Validate("Global Dimension 2 Code", SAccounts."Global Dimension 2 Code");
                                Validate("Recruited by Type", SAccounts."Recruited by Type");
                                Validate("Recruited By", SAccounts."Recruited By");
                                Validate("ATM No.", SAccounts."ATM No.");
                                Validate("Mobile Loan Blocked", SAccounts."Mobile Loan Blocked");
                                Validate("Old Account No", SAccounts."Old Account No");

                            end else begin
                                Validate("Member No.", CustMembr."No.");
                                Validate("Single Party/Multiple/Business", CustMembr."Single Party/Multiple");
                                Validate("First Name", CustMembr."First Name");
                                Validate("Second Name", CustMembr."Second Name");
                                Validate("Last Name", CustMembr."Last Name");
                                Validate(Name, CustMembr.Name);
                                Validate("P.I.N Number", CustMembr."P.I.N Number");
                                Validate("Salary Through FOSA", SAccounts."Salary Through FOSA");
                                //VALIDATE("Account Status", CustMembr.Status);
                                //VALIDATE(Blocked, CustMembr.Blocked);
                                Validate("Member Segment", CustMembr."Member Segment");
                                if CustMembr."Member Category" <> 'PREMIER' then
                                    Validate("Member Category", CustMembr."Member Category")
                                else
                                    "Member Category" := CustMembr."Member Category";
                                //VALIDATE("Member Category", CustMembr."Member Category");
                                Validate("Relationship Manager", CustMembr."Relationship Manager");
                                "Mobile Phone No" := CustMembr."Mobile Phone No";
                                //VALIDATE("Mobile Phone No", CustMembr."Mobile Phone No");
                                Validate("E-Mail", CustMembr."E-Mail");
                                Validate(Salutation, CustMembr.Salutation);
                                Validate("Payroll/Staff No.", CustMembr."Payroll/Staff No.");
                                Validate("ID No.", CustMembr."ID No.");
                                Validate("Allow Mboosta Defaulter", CustMembr."Allow MBoosta Defaulter");
                                Validate("Passport No.", CustMembr."Passport No.");
                                "Date of Birth" := CustMembr."Date of Birth";
                                //VALIDATE("Date of Birth", CustMembr."Date of Birth");
                                Validate("Marital Status", CustMembr."Marital Status");
                                Validate(Gender, CustMembr.Gender);
                                Validate("Tax Exempted", CustMembr."Tax Exempted");
                                Validate("Group Account", SAccounts."Group Account");
                                Validate("Group Account No.", SAccounts."Group Account No");


                                Validate("Signing Instructions", SAccounts."Signing Instructions");
                                Validate("FD Duration", SAccounts."FD Duration");
                                Validate("FD Maturity Date", SAccounts."FD Maturity Date");
                                Validate("Fixed Deposit Amount", SAccounts."Fixed Deposit Amount");
                                Validate("Fixed Deposit cert. no", SAccounts."Fixed Deposit cert. no");
                                Validate("Fixed Deposit Status", SAccounts."Fixed Deposit Status");
                                Validate("Fixed Deposit Type", SAccounts."Fixed Deposit Type");
                                Validate("Neg. Interest Rate", SAccounts."Neg. Interest Rate");
                                Validate("Savings Account No.", SAccounts."Savings Account No.");


                                Validate("Birth Certificate No.", SAccounts."Birth Certificate No.");
                                Validate("Parent Account No.", SAccounts."Parent Account No.");


                                Validate("Product Type", SAccounts."Product Type");
                                Validate("Product Name", SAccounts."Product Name");
                                Validate("Product Category", SAccounts."Product Category");
                                Validate("Account Status", SAccounts.Status);
                                Validate("ATM No.", SAccounts."ATM No.");
                                Validate("Mobile Loan Blocked", SAccounts."Mobile Loan Blocked");
                                Validate(Blocked, SAccounts.Blocked);
                                Validate("Loan Disbursement Account", SAccounts."Loan Disbursement Account");

                                Validate("Group Account No.", CustMembr."Group Account No.");
                                Validate("Group Type", CustMembr."Group Type");
                                Validate("Nature of Business", CustMembr."Nature of Business");
                                Validate("Company Registration No.", CustMembr."Company Registration No.");
                                Validate("Date of Business Reg.", CustMembr."Date of Business Reg.");
                                Validate("Business/Group Location", CustMembr."Business/Group Location");
                                Validate("Plot/Bldg/Street/Road", CustMembr."Plot/Bldg/Street/Road");
                                Validate("Type of Business", CustMembr."Type of Business");
                                Validate("Ownership Type", CustMembr."Ownership Type");
                                Validate("Other Business Type", CustMembr."Other Business Type");

                                Validate("Post Code", CustMembr."Post Code");
                                Validate(City, CustMembr.City);
                                Validate(Nationality, CustMembr.Nationality);
                                //VALIDATE(County, CustMembr.County);
                                Validate("Phone No.", CustMembr."Phone No.");
                                "Mobile Phone No" := CustMembr."Mobile Phone No";
                                //VALIDATE("Mobile Phone No", CustMembr."Mobile Phone No");
                                Validate("E-Mail", CustMembr."E-Mail");
                                Validate(Salutation, CustMembr.Salutation);
                                Validate("Current Address", CustMembr."Current Address");

                                Validate("Employer Code", CustMembr."Employer Code");
                                Validate("Global Dimension 1 Code", CustMembr."Global Dimension 1 Code");
                                Validate("Global Dimension 2 Code", CustMembr."Global Dimension 2 Code");
                                Validate("Recruited by Type", CustMembr."Recruited by Type");
                                //VALIDATE("Recruited By", CustMembr."Recruited By");
                                Validate("Electrol Zone", CustMembr."Region Code");
                                Validate("Area Service Center", CustMembr."Area Service Center");

                                Validate("Bank Code", CustMembr."Bank Code");
                                Validate("Branch Code", CustMembr."Branch Code");
                                Validate("Bank Account No.", CustMembr."Bank Account No.");
                                if SAccounts."Product Category" = SAccounts."Product Category"::"Junior Savings" then begin
                                    Validate(Name, SAccounts.Name);
                                    "Date of Birth" := SAccounts."Date of Birth";
                                    // VALIDATE("Date of Birth",SAccounts."Date of Birth");
                                end;
                            end;
                        end;
                    end;
                /*END;*/
                Counts := 0;
                ReactivateDeactivateHeader.Reset;
                ReactivateDeactivateHeader.SetRange(ReactivateDeactivateHeader."Account No.", "Account No.");
                //ReactivateDeactivateHeader.SETRANGE(ReactivateDeactivateHeader.Status,Status::Open, Status::Pending);
                if ReactivateDeactivateHeader.Find('-') then begin
                    repeat
                        if (ReactivateDeactivateHeader.Status = ReactivateDeactivateHeader.Status::Open) or
                        (ReactivateDeactivateHeader.Status = ReactivateDeactivateHeader.Status::Pending) then begin
                            Counts += 1;
                        end;
                    until ReactivateDeactivateHeader.Next = 0;
                end;
                if Counts > 1 then
                    Error(MultipleApplicationsError);
                ///Get Signatory
                GetSignatory;
                // GetNextofkin;

                "Status Change Reason" := '';
                if (xRec."Account No." <> "Account No.") and GuiAllowed then begin
                    // MyComment := Window.InputBox('Enter reason for status change for ' + Name, 'account:' + "Account No.", '', 100, 100);
                    if MyComment = '' then Error('Kindly Enter reason for changing status');
                    "Status Change Reason" := MyComment;
                end else
                    "Status Change Reason" := '';
                //MODIFY;

                "Member Change Reason" := '';
                //MODIFY;

            end;
        }
        field(8; Name; Text[100])
        {
        }
        field(9; Description; Text[50])
        {
            Caption = 'Remarks';
        }
        field(11; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(12; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(13; "Responsibility Center"; Code[20])
        {
            Description = 'LookUp to Responsibility Center BR';
            TableRelation = "Responsibility CenterBR";
        }
        field(14; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(15; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(16; "First Name"; Text[50])
        {

            trigger OnValidate()
            begin
                "First Name" := DelChr("First Name", '=', '0|1|2|3|4|5|6|7|8|9');
                Name := DelChr(Salutation, '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("First Name", '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("Second Name", '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("Last Name", '=', '0|1|2|3|4|5|6|7|8|9');
            end;
        }
        field(17; "Second Name"; Text[50])
        {
            Description = 'Maintain names separately';

            trigger OnValidate()
            begin
                "Second Name" := DelChr("Second Name", '=', '0|1|2|3|4|5|6|7|8|9');
                Name := DelChr(Salutation, '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("First Name", '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("Second Name", '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("Last Name", '=', '0|1|2|3|4|5|6|7|8|9');
            end;
        }
        field(18; "Last Name"; Text[50])
        {
            Description = 'Names separately';

            trigger OnValidate()
            begin
                "Last Name" := DelChr("Last Name", '=', '0|1|2|3|4|5|6|7|8|9');
                Name := DelChr(Salutation, '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("First Name", '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("Second Name", '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("Last Name", '=', '0|1|2|3|4|5|6|7|8|9');
            end;
        }
        field(19; "Member Segment"; Code[20])
        {
            Description = 'LookUp to Member Segment Table where Type = Segment';
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST(Segment));
        }
        field(20; "Member No."; Code[20])
        {
        }
        field(21; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending,Rejected,Approved,Processed';
            OptionMembers = Open,Pending,Rejected,Approved,Processed;

            trigger OnValidate()
            begin
                TestField("Account No.");
                ValidatePhone();
                if Status = Status::Approved then begin
                    if Retiree = true then begin
                        //Required documents
                        LoanReqDocs.Reset;
                        LoanReqDocs.SetRange("Loan No.", "No.");
                        if LoanReqDocs.Find('-') then begin
                            repeat
                                if (LoanReqDocs."Provided ?" = LoanReqDocs."Provided ?"::" ") or (LoanReqDocs."Provided ?" = LoanReqDocs."Provided ?"::No) then
                                    Error(Text011, LoanReqDocs.Description);
                            until LoanReqDocs.Next = 0;
                        end;
                        TestField("Employer Code", '99');
                        TestField("Member Category", 'WAFANISI');
                    end;
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
        }
        field(22; "Account Status"; Option)
        {
            OptionCaption = ' ,New,Active,Dormant,Frozen,Withdrawal Applicant,Withdrawn,Deceased,Defaulter,Closed,Withdrawn Shareholder';
            OptionMembers = " ",New,Active,Dormant,Frozen,"Withdrawal Applicant",Withdrawn,Deceased,Defaulter,Closed,"Withdrawn Shareholder";

            trigger OnValidate()
            begin
                if "Account Type" = "Account Type"::Savings then begin
                    if "Account Status" = "Account Status"::Closed then begin
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange("Savings Account No.", "Account No.");
                        if SavingsAccounts.Find('-') then begin
                            SavingsAccounts.CalcFields("Balance (LCY)");
                            if SavingsAccounts."Balance (LCY)" <> 0 then
                                Error(Erro0001);
                        end else
                            if "Account Status" = xRec."Account Status"::Deceased then
                                Error('You cannot activate decesaed account')
                    end;
                end else
                    if "Account Type" = "Account Type"::Member then begin
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange("Member No.", "Account No.");
                        if SavingsAccounts.Find('-') then begin
                            repeat
                                SavingsAccounts.CalcFields("Balance (LCY)");
                                AmoutTotal := SavingsAccounts."Balance (LCY)" + AmoutTotal;
                            until SavingsAccounts.Next = 0;
                        end;
                        if "Account Status" = "Account Status"::Closed then begin
                            if AmoutTotal <> 0 then
                                Error(Erro0001)
                        end;

                        //              IF "Account Status"=xRec."Account Status"::Deceased THEN
                        //     ERROR('You cannot activate deceased account')
                    end;
                if Rec."Account Status" <> xRec."Account Status" then
                    "Member Change Reason" += ',' + Rec.FieldName("Account Status");


                /*    IF (xRec."Account Status"<>"Account Status") AND GUIALLOWED THEN BEGIN
                        MyComment:=Window.InputBox('Enter reason for status change for '+Name,'account:'+"Account No.",'',100,100);
                        IF MyComment='' THEN ERROR('Kindly Enter reason for changing status');
                        "Status Change Reason":=MyComment;
                    END ELSE
                      "Status Change Reason":='';*/

            end;
        }
        field(23; Blocked; Option)
        {
            Caption = 'Blocked';
            OptionCaption = ' ,Credit,Debit,All';
            OptionMembers = " ",Credit,Debit,All;

            trigger OnValidate()
            begin

                if Rec.Blocked <> xRec.Blocked then
                    "Member Change Reason" += ',' + Rec.FieldName(Blocked);
            end;
        }
        field(24; "Payroll/Staff No."; Code[20])
        {
        }
        field(25; "ID No."; Code[20])
        {

            trigger OnValidate()
            begin
                /*"ID No.":=DELCHR("ID No.",'=','A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?|+|-|_');
                ``
                FieldLength("ID No.",10);
                
                IF "ID No."<>'' THEN BEGIN
                
                ReactivateDeactivateHeader.RESET;
                ReactivateDeactivateHeader.SETRANGE(ReactivateDeactivateHeader."ID No.","ID No.");
                IF ReactivateDeactivateHeader.FIND('-') THEN BEGIN
                 REPEAT
                  IF (ReactivateDeactivateHeader.Status IN [ReactivateDeactivateHeader.Status::Open,ReactivateDeactivateHeader.Status::Pending,
                                                   ReactivateDeactivateHeader.Status::Approved]) THEN
                   IF ReactivateDeactivateHeader.COUNT >1 THEN  MESSAGE(FORMAT(ReactivateDeactivateHeader.COUNT));
                   ERROR(MemberExistError,ReactivateDeactivateHeader."No.",ReactivateDeactivateHeader.Name);
                   UNTIL ReactivateDeactivateHeader.NEXT=0;
                END;
                
                Customer.RESET;
                Customer.SETRANGE(Customer."ID No.","ID No.");
                Customer.SETFILTER(Customer.Status,'<>%1',Customer.Status::Closed);
                IF Customer.FINDFIRST THEN
                 ERROR(MemberExistError,Customer."No.",Customer.Name);
                END;*/
                if Rec."ID No." <> xRec."ID No." then
                    "Member Change Reason" += ',' + Rec.FieldName("ID No.");

            end;
        }
        field(26; "Passport No."; Code[20])
        {
        }
        field(28; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;
        }
        field(29; "Product Type"; Code[20])
        {
            Editable = false;
        }
        field(30; "Product Name"; Text[100])
        {
            Editable = false;
        }
        field(31; "Document Type"; Option)
        {
            OptionCaption = ' ,Reactivate,Deactivate';
            OptionMembers = " ",Reactivate,Deactivate;
        }
        field(50; "Created By"; Code[60])
        {
            Editable = false;
        }
        field(55; "Employer Code"; Code[20])
        {
            TableRelation = Customer WHERE("Account Type" = CONST(Employer));
        }
        field(56; "Date of Birth"; Date)
        {

            trigger OnValidate()
            var
                DateofBirthError: Label 'This date cannot be greater than today.';
            begin
                ChangePermissions();

                if "Date of Birth" > Today then
                    Error(DateofBirthError);
                /*
                GeneralSetUp.GET;
                IF "Date of Birth" >  CALCDATE(GeneralSetUp."Min. Member Age",TODAY) THEN
                 ERROR(MinimumAgeError,CALCDATE(GeneralSetUp."Min. Member Age",TODAY));*/

                if Rec."Date of Birth" <> xRec."Date of Birth" then
                    "Member Change Reason" += ',' + Rec.FieldName("Date of Birth");

            end;
        }
        field(60; "Mobile Phone No"; Code[13])
        {

            trigger OnValidate()
            begin

                ChangePermissions();

                "Mobile Phone No" := DelChr("Mobile Phone No", '=', 'A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?|-|_');

                /*IF "Mobile Phone No" <>'' THEN BEGIN
                
                ReactivateDeactivateHeader.RESET;
                ReactivateDeactivateHeader.SETRANGE(ReactivateDeactivateHeader."Mobile Phone No","Mobile Phone No");
                IF ReactivateDeactivateHeader.FIND('-') THEN BEGIN
                 REPEAT
                  IF (ReactivateDeactivateHeader.Status IN [ReactivateDeactivateHeader.Status::Open,ReactivateDeactivateHeader.Status::Pending,
                                                   ReactivateDeactivateHeader.Status::Approved]) THEN
                   ERROR(MemberExistError,ReactivateDeactivateHeader."No.",ReactivateDeactivateHeader.Name);
                   UNTIL ReactivateDeactivateHeader.NEXT=0;
                END;
                
                CustMembr.RESET;
                CustMembr.SETRANGE(CustMembr."Mobile Phone No","Mobile Phone No");
                CustMembr.SETFILTER(CustMembr.Status,'<>%1',CustMembr.Status::Defaulter);
                IF CustMembr.FINDFIRST THEN
                 ERROR(MemberExistError,CustMembr."No.",CustMembr.Name);
                END;*/

                //CountryRegion.GET(Nationality);
                if Rec."Mobile Phone No" <> xRec."Mobile Phone No" then
                    "Member Change Reason" += ',' + Rec.FieldName("Mobile Phone No");

            end;
        }
        field(61; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Devorced,Widower,Widow;
        }
        field(63; Gender; Option)
        {
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(65; "Post Code"; Code[30])
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
                PostCode.ValidatePostCode(City, "Post Code", County, Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(66; City; Text[30])
        {
            Caption = 'City';
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST(County));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(68; County; Text[30])
        {
            Caption = 'County';
            Description = 'LookUp to Member Segment Table where Type = County';
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST(County));
        }
        field(69; "Bank Code"; Code[20])
        {
            Description = 'LookUp to Banks Table';
            TableRelation = "Bank Code Structure";
        }
        field(70; "Branch Code"; Code[20])
        {
            Description = 'LookUp to Banks Table';
        }
        field(71; "Recruited By"; Code[20])
        {
            Caption = 'Salesperson Code';
            // TableRelation = IF ("Recruited by Type" = FILTER(Marketer)) "HR Employees"."No."
            // ELSE
            // "Salesperson/Purchaser" WHERE(Field50001 = FIELD("Recruited by Type"));
        }
        field(73; "Type of Business"; Option)
        {
            OptionCaption = ' ,Sole Proprietor,Partnership,Limited Liability Company,Informal Body,Registered Group,Other(Specify)';
            OptionMembers = " ","Sole Proprietor",Partnership,"Limited Liability Company","Informal Body","Registered Group","Other(Specify)";
        }
        field(74; "Other Business Type"; Text[15])
        {
        }
        field(75; "Ownership Type"; Option)
        {
            OptionCaption = ' ,Personal Account,Joint Account,Group/Business,FOSA Shares';
            OptionMembers = " ","Personal Account","Joint Account","Group/Business","FOSA Shares";
        }
        field(76; "Other Account Type"; Text[15])
        {
        }
        field(77; "Nature of Business"; Text[30])
        {
        }
        field(78; "Bank Account No."; Code[20])
        {

            trigger OnValidate()
            begin
                //IF STRLEN("Bank Account No.") <>13 THEN
                //ERROR('Invalid Bank account No. Please enter the correct Bank Account No.');
            end;
        }
        field(79; "Company Registration No."; Code[20])
        {

            trigger OnValidate()
            begin
                /*IF "Company Registration No." <>'' THEN BEGIN
                CustMembr.RESET;
                CustMembr.SETRANGE(CustMembr."Company Registration No.","Company Registration No.");
                IF CustMembr.FINDFIRST THEN
                 ERROR(MemberExistError,CustMembr."No.",CustMembr.Name);
                END;*/

            end;
        }
        field(80; "Date of Business Reg."; Date)
        {

            trigger OnValidate()
            begin
                if "Date of Business Reg." > Today then
                    Error(DateofBirthError);
            end;
        }
        field(81; "Business/Group Location"; Text[50])
        {
        }
        field(82; "P.I.N Number"; Code[20])
        {

            trigger OnValidate()
            begin

                /*IF "P.I.N Number" <>'' THEN BEGIN
                CustMembr.RESET;
                CustMembr.SETRANGE(CustMembr."P.I.N Number","P.I.N Number");
                IF CustMembr.FINDFIRST THEN
                 ERROR(MemberExistError,CustMembr."No.",CustMembr.Name);
                END;*/

            end;
        }
        field(83; "Plot/Bldg/Street/Road"; Text[50])
        {
        }
        field(84; "Group Type"; Option)
        {
            OptionCaption = ' ,Welfare,Microfinance';
            OptionMembers = " ",Welfare,Microfinance;
        }
        field(85; "Single Party/Multiple/Business"; Option)
        {
            OptionCaption = 'Single,Multiple,Business';
            OptionMembers = Single,Multiple,Business;
        }
        field(86; "Birth Certificate No."; Code[15])
        {
        }
        field(87; "Group Account No."; Code[20])
        {
            Description = 'LookUp to Member where Group Account = Yes';
            TableRelation = Members WHERE("Group Account" = FILTER(true));
        }
        field(88; "MPESA Mobile No"; Code[13])
        {
            CharAllowed = '0123456789';
        }
        field(89; "Group Account"; Boolean)
        {
        }
        field(90; "Recruited by Type"; Option)
        {
            OptionCaption = 'Marketer,Others';
            OptionMembers = Marketer,Others;
        }
        field(91; "Employer Name"; Text[50])
        {
        }
        field(92; "Member Category"; Code[20])
        {
            TableRelation = "Member Category";

            trigger OnValidate()
            begin
                /*MemberCategory.RESET;
                MemberCategory.SETRANGE("No.","Member Category");
                IF MemberCategory.FIND('-') THEN
                  //IF MemberCategory."No."<>'PREMIER' THEN
                  BEGIN
                    IF "Account Type"="Account Type"::Member THEN
                      BEGIN
                        Cust.SETRANGE("No.","Member No.");
                        IF Cust.FIND('-') THEN
                          BEGIN
                            Sav.RESET;
                            Sav.SETRANGE(Sav."Member No.",Cust."No.");
                            Sav.SETRANGE(Sav."Product Category",Sav."Product Category"::"Deposit Contribution");
                            IF Sav.FIND('-') THEN
                              BEGIN
                                Sav.CALCFIELDS(Balance,"Balance (LCY)");
                                IF Sav."Balance (LCY)"<MemberCategory."Premier Club Min.Deposits" THEN
                                  BEGIN
                                  IF MemberCategory."Premier Club Min.Deposits"<>0 THEN
                                  ERROR('This member has deposits of %1 less than %2 required to Join %3',Sav.Balance,MemberCategory."Premier Club Min.Deposits",MemberCategory."No.");
                                END;
                                END;
                            END;
                        END;
                    END;
                    */

            end;
        }
        field(93; "Relationship Manager"; Code[20])
        {
            TableRelation = "HR Employees" WHERE(Status = FILTER(Active));
        }
        field(94; "Statement E-Mail Freq."; DateFormula)
        {
        }
        field(95; Classification; Option)
        {
            OptionCaption = ' ,Good Standing,Bad Standing';
            OptionMembers = " ","Good Standing","Bad Standing";
        }
        field(96; "Electrol Zone"; Code[20])
        {
            TableRelation = "Electrol Zones/Area Svr Center".Code WHERE(Type = CONST("Electral Zone"));
        }
        field(97; "Area Service Center"; Code[20])
        {
            TableRelation = "Electrol Zones/Area Svr Center".Code WHERE(Type = CONST("Area Service Centers"));
        }
        field(98; "Current Address"; Text[50])
        {
            Caption = 'Address';
        }
        field(99; "Home Address"; Text[50])
        {
            Caption = 'Home Address';
            Enabled = false;
        }
        field(100; "Phone No."; Text[20])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
            begin
                "Phone No." := DelChr("Mobile Phone No", '=', 'A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?|-|_');
            end;
        }
        field(101; Nationality; Code[30])
        {
            TableRelation = "Country/Region";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if CountryRegion.Get(Nationality) then
                    "Mobile Phone No" := CountryRegion.Code;
            end;
        }
        field(102; "Terms of Employment"; Option)
        {
            OptionMembers = " ",Permanent,Contract,Casual;
        }
        field(114; Source; Option)
        {
            Description = 'Used to identify origin of Member Application [CRM, Navision, Web]';
            OptionCaption = ' ,Navision,CRM,Web';
            OptionMembers = " ",Navision,CRM,Web;
        }
        field(115; Picture; BLOB)
        {
            Caption = 'Picture';
            Description = 'Used to capture applicant Photos and should be deleted on account creation.';
            SubType = Bitmap;

            trigger OnValidate()
            begin

                "Member Change Reason" += ',' + Rec.FieldName(Picture);
            end;
        }
        field(116; Signature; BLOB)
        {
            Caption = 'Signature';
            Description = 'Used to capture applicant Signature and should be deleted on account creation.';
            SubType = Bitmap;

            trigger OnValidate()
            begin

                "Member Change Reason" += ',' + Rec.FieldName(Signature);
            end;
        }
        field(118; "Fixed Deposit Status"; Option)
        {
            OptionCaption = ' ,Active,Matured,Closed,Not Matured';
            OptionMembers = " ",Active,Matured,Closed,"Not Matured";
        }
        field(119; "FD Marked for Closure"; Boolean)
        {
        }
        field(120; "Expected Maturity Date"; Date)
        {
        }
        field(121; "Savings Account No."; Code[20])
        {
            Description = 'LookUp to Savings Account Table';
            TableRelation = "Savings Accounts" WHERE("Member No." = FIELD("Member No."),
                                                      "Product Category" = FILTER(" "));
        }
        field(122; "Parent Account No."; Code[20])
        {
            Description = 'LookUp to Member Table';
            TableRelation = "Savings Accounts" WHERE("Member No." = FIELD("Member No."),
                                                      "Product Category" = FILTER(" "));
        }
        field(123; "Fixed Deposit Type"; Code[20])
        {
            Description = 'LookUp to Fixed Deposit Type Table';
            TableRelation = "Fixed Deposit Type" WHERE(Blocked = CONST(false));

            trigger OnValidate()
            begin
                TestField("Application Date");
                if FixedDepositType.Get("Fixed Deposit Type") then begin
                    "FD Maturity Date" := CalcDate(FixedDepositType.Duration, "Application Date");
                    "FD Duration" := FixedDepositType.Duration;
                    "Product Category" := "Product Category"::"Fixed Deposit";
                end
            end;
        }
        field(124; "FD Maturity Date"; Date)
        {
        }
        field(125; "Monthly Contribution"; Decimal)
        {
        }
        field(126; "Product Category"; Option)
        {
            OptionCaption = ',Share Capital,Deposit Contribution,Fixed Deposit,Junior Savings,Registration Fee,Benevolent,Unallocated Fund,Premier Club Reg Fee,Premier Club Account,Investment Account,Holiday Account';
            OptionMembers = ,"Share Capital","Deposit Contribution","Fixed Deposit","Junior Savings","Registration Fee",Benevolent,"Unallocated Fund","Premier Club Reg Fee","Premier Club Account","Investment Account","Holiday Account";
        }
        field(127; "Neg. Interest Rate"; Decimal)
        {
        }
        field(128; "FD Duration"; DateFormula)
        {

            trigger OnValidate()
            begin
                //"FD Maturity Date":=CALCDATE("FD Duration","Application Date");
            end;
        }
        field(129; "FD Maturity Instructions"; Option)
        {
            OptionCaption = ' ,Transfer to Savings,Transfer Interest & Renew,Renew';
            OptionMembers = " ","Transfer to Savings","Transfer Interest & Renew",Renew;
        }
        field(130; "Fixed Deposit cert. no"; Code[30])
        {
            Description = 'Capture FxD certificate Number';
        }
        field(131; "Fixed Deposit Amount"; Decimal)
        {
        }
        field(132; "Signing Instructions"; Text[30])
        {
        }
        field(133; "Dividend Payment Method"; Code[20])
        {
            TableRelation = "Segment/County/Dividend/Signat" WHERE(Type = CONST("Dividend Payment Type"));
        }
        field(134; Hide; Boolean)
        {
        }
        field(135; "Enable Sweeping"; Boolean)
        {
        }
        field(136; "Tax Exempted"; Boolean)
        {
            Caption = 'Disabled';
        }
        field(137; "Entry Type"; Option)
        {
            OptionCaption = 'Initial,Changes';
            OptionMembers = Initial,Changes;
        }
        field(138; "Loan Disbursement Account"; Boolean)
        {
        }
        field(139; "Rejoining Date"; Date)
        {
        }
        field(140; Type; Option)
        {
            OptionCaption = ' ,From Other Sacco,Re-joining';
            OptionMembers = " ","From Other Sacco","Re-joining";
        }
        field(50007; Retiree; Boolean)
        {

            trigger OnValidate()
            var
                LoanReqDocs: Record "Loan Required Documents";
                ApplDocs: Record "Application Document Setup";
            begin
                if Retiree = true then begin
                    //Update required documents
                    LoanReqDocs.Reset;
                    LoanReqDocs.SetRange(LoanReqDocs."Loan No.", "No.");
                    if LoanReqDocs.Find('-') then begin
                        LoanReqDocs.DeleteAll;
                    end;

                    ApplDocs.Reset;
                    ApplDocs.SetRange(ApplDocs."Retiree Document", true);
                    if ApplDocs.Find('-') then begin
                        repeat
                            LoanReqDocs.Init;
                            LoanReqDocs."Loan No." := "No.";
                            LoanReqDocs.Description := ApplDocs.Description;
                            LoanReqDocs."Document No." := ApplDocs."Document No.";
                            LoanReqDocs."Document Type" := ApplDocs."Document Type";
                            LoanReqDocs."Entry No." := LoanReqDocs."Entry No." + 100;
                            LoanReqDocs."Product ID" := "Account No.";
                            LoanReqDocs."Product Name" := "Member No.";
                            LoanReqDocs.Insert;
                        until ApplDocs.Next = 0;
                    end;



                    "Employer Code" := '99'
                end else
                    "Employer Code" := '';
                if "Employer Code" = '99' then
                    "Member Category" := 'WAFANISI' else
                    "Member Category" := '';
            end;
        }
        field(50008; "Retirement Date"; Date)
        {
        }
        field(50012; "Mobile Loan Blocked"; Boolean)
        {

            trigger OnValidate()
            var
                StatusChangePermissions: Record "Status Change Permissions.";
            begin
                //OnViewCurrRec();
            end;
        }
        field(50013; "Mobile Loan Date  Blocked"; Date)
        {
            Editable = false;
        }
        field(50014; "Mobile Loan Un Blocked By"; Text[50])
        {
            Editable = false;
        }
        field(50015; "Group Code"; Code[20])
        {
            TableRelation = Members."No." WHERE("Group Account" = CONST(true));
        }
        field(50016; "Group Position"; Option)
        {
            OptionCaption = 'Member,Chair Person,Secretary,Treasurer,Vice Chair Person';
            OptionMembers = Member,"Chair Person",Secretary,Treasurer,"Vice Chair Person";

            trigger OnValidate()
            begin
                AccountSignatories.Reset;
                AccountSignatories.SetRange("Account No", "Group Account No.");
                AccountSignatories.SetRange(Type, "Group Position");
                if AccountSignatories.Find('-') then begin
                    if "Group Position" <> "Group Position"::Member then
                        Error(ErrPosition, "Group Position");
                end
            end;
        }
        field(50017; "Remove From Group"; Code[10])
        {
            TableRelation = "Account Signatories"."Account No" WHERE("Member No." = FIELD("Account No."));
        }
        field(39004254; Salutation; Code[50])
        {
            Description = '39004358';
            TableRelation = "Salutation Tittles".Code WHERE(Type = CONST(Tittle));

            trigger OnValidate()
            begin
                Salutation := DelChr(Salutation, '=', '0|1|2|3|4|5|6|7|8|9');
                Name := DelChr(Salutation, '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("First Name", '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("Second Name", '=', '0|1|2|3|4|5|6|7|8|9') + ' ' + DelChr("Last Name", '=', '0|1|2|3|4|5|6|7|8|9');
            end;
        }
        field(39004255; "Old Account No"; Code[20])
        {
        }
        field(39004256; "Status Change Reason"; Text[80])
        {
            Editable = false;
        }
        field(39004257; "ATM No."; Code[20])
        {
        }
        field(39004258; "Account Category"; Option)
        {
            OptionCaption = ' ,Member,Staff Members,Board Members,Delegates,Self-Employed,SMEs,Diaspora,Spouse,Child';
            OptionMembers = " ",Member,"Staff Members","Board Members",Delegates,"Self-Employed",SMEs,Diaspora,Spouse,Child;
        }
        field(39004259; "Type of Account Change"; Option)
        {
            OptionCaption = 'None,Change of account status';
            OptionMembers = "None","Change of account status";
        }
        field(39004260; "Charge Transaction Type"; Code[20])
        {
            TableRelation = "Transaction Types".Code WHERE(Type = CONST("Savings Penalty"));
        }
        field(39004261; "Allow Mboosta Defaulter"; Boolean)
        {
        }
        field(39004262; "Allow DAdvace Defaulter"; Boolean)
        {
        }
        field(39004263; "Member Status"; Option)
        {
            OptionCaption = ' ,New,Active,Dormant,Frozen,Withdrawal Applicant,Withdrawn,Deceased,Defaulter,Closed,Withdrawn Shareholder';
            OptionMembers = " ",New,Active,Dormant,Frozen,"Withdrawal Applicant",Withdrawn,Deceased,Defaulter,Closed,"Withdrawn Shareholder";

            trigger OnValidate()
            begin
                if Rec."Member Status" <> xRec."Member Status" then
                    "Member Change Reason" += ',' + Rec.FieldName("Member Status");
            end;
        }
        field(39004264; "Member Change Reason"; Text[250])
        {
        }
        field(39004265; "Salary Through FOSA"; Boolean)
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

    trigger OnInsert()
    begin
        if "No." = '' then begin
            SeriesSetup.Get;
            SeriesSetup.TestField(SeriesSetup."Member Reactivation Nos.");
            //NoSeriesMgtInitSeries(SeriesSetup."Member Reactivation Nos.", xRec."No. Series", 0D, "No.", "No. Series");
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

    var
        Sav: Record "Savings Accounts";
        Cust: Record Members;
        Product: Record "Product Factory";
        MemberCategory: Record "Member Category";
        SeriesSetup: Record "Credit Nos. Series";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        CustMembr: Record Members;
        SAccounts: Record "Savings Accounts";
        ReactivateDeactivateHeader: Record "Reactivate/Deactivate Header";
        MultipleApplicationsError: Label 'Applicant has a similar application being processed.';
        GeneralSetUp: Record "General Set-Up";
        Text018: Label 'This applicant is below the mininmum membership age of %1. Is the applicant applying for a junior account';
        DateofBirthError: Label 'Date cannot be greater than today.';
        MinimumAgeError: Label 'Date of birth must be less than %1';
        MemberExistError: Label 'ID No. already exists with member %1 Name: %2';
        Addr: Label 'P.O. BOX - ';
        Customer: Record Members;
        PostCode: Record "Post Code";
        CountryRegion: Record "Country/Region";
        ProductFactory: Record "Product Factory";
        ImageData: Record "Image Data";
        ParentEdit: Boolean;
        TypeHide: Boolean;
        FXDDetailsVisible: Boolean;
        JuniourAccVisible: Boolean;
        FixedDepositType: Record "Fixed Deposit Type";
        SavingsAccounts: Record "Savings Accounts";
        Erro0001: Label 'You can not close an account that has balance';
        AmoutTotal: Decimal;
        SignatoryApplication: Record "Signatory Application";
        AccountSignatories: Record "Account Signatories";
        EntryNo: Integer;
        NextOfKinApp: Record "Next of KIN Application";
        NextOfKin: Record "Next of KIN";
        AccountSignApp: Record "Signatory Application";
        AccountSign: Record "Account Signatories";
        AccountSign2: Record "Account Signatories";
        MemberApplication: Record "Member Application";
        Counts: Integer;
        // [RunOnClient]
        // Window: DotNet Interaction;
        MyComment: Text;
        SavsAcc: Record "Savings Accounts";
        LoanReqDocs: Record "Loan Required Documents";
        Text011: Label 'There are documents to be provided : %1';
        NewMob: Code[20];
        GCount: Integer;
        Grps: Text;
        ErrPosition: Label 'You cannot have the same position of %1 within the same group';

    //[Scope('Internal')]
    procedure FieldLength(VarVariant: Text; FldLength: Integer): Text
    var
        FieldLengthError: Label 'Field cannot be more than %1 Characters.';
    begin
        if StrLen(VarVariant) > FldLength then
            Error(FieldLengthError, FldLength);
    end;

    //[Scope('Internal')]
    procedure ClearFields()
    begin
        "Member No." := '';
        "First Name" := '';
        "Second Name" := '';
        "Last Name" := '';
        "Allow Mboosta Defaulter" := false;
        Name := '';
        "P.I.N Number" := '';
        "Account Status" := "Account Status"::" ";
        Blocked := Blocked::" ";
        "Member Segment" := '';
        "Member Category" := '';
        "Relationship Manager" := '';
        "Mobile Phone No" := '';
        "E-Mail" := '';
        Salutation := '';
        "Payroll/Staff No." := '';
        "ID No." := '';
        "Passport No." := '';
        "Date of Birth" := 0D;
        "Rejoining Date" := 0D;
        "Marital Status" := "Marital Status"::" ";


        "Signing Instructions" := '';
        Evaluate("FD Duration", '0D');
        "FD Maturity Date" := 0D;
        "Fixed Deposit Amount" := 0;
        "Fixed Deposit cert. no" := '';
        "Fixed Deposit Status" := "Fixed Deposit Status"::" ";
        "Fixed Deposit Type" := '';
        "Neg. Interest Rate" := 0;
        "Savings Account No." := '';

        "Birth Certificate No." := '';
        "Parent Account No." := '';
        "Tax Exempted" := false;


        "Product Type" := '';
        "Product Name" := '';
        // "Product Category" := "Product Category"::"0";

        "Group Account No." := '';
        "Company Registration No." := '';


        "Group Account No." := '';
        "Group Type" := "Group Type"::" ";
        "Nature of Business" := '';
        "Company Registration No." := '';
        "Date of Business Reg." := 0D;
        "Business/Group Location" := '';
        "Plot/Bldg/Street/Road" := '';
        "Type of Business" := "Type of Business"::" ";
        "Ownership Type" := "Ownership Type"::" ";
        "Other Business Type" := '';
        ;
        "Loan Disbursement Account" := false;

        "Post Code" := '';
        City := '';
        Nationality := '';
        County := '';
        "Phone No." := '';
        "Mobile Phone No" := '';
        "E-Mail" := '';
        Salutation := '';
        "Current Address" := '';

        "Employer Code" := '';
        "Global Dimension 1 Code" := '';
        "Global Dimension 2 Code" := '';
        "Recruited By" := '';
        "Electrol Zone" := '';
        "Area Service Center" := '';

        "Bank Code" := '';
        "Branch Code" := '';
        "Bank Account No." := '';
    end;

    //[Scope('Internal')]
    procedure Tracker(CustMembr: Record Members)
    var
        ReactivateDeactivateHeader: Record "Reactivate/Deactivate Header";
        AgentApplications: Record "Agent Applications";
        SavingsAccounts: Record "Savings Accounts";
    begin
        ReactivateDeactivateHeader.Reset;
        ReactivateDeactivateHeader.SetRange(ReactivateDeactivateHeader."No.", "No.");
        if ReactivateDeactivateHeader.Find('-') then begin
            if CustMembr.Get("Account No.") then begin

                if xRec."First Name" <> "First Name" then
                    CustMembr.Validate(CustMembr."First Name", "First Name");
                if xRec."Second Name" <> "Second Name" then
                    CustMembr.Validate(CustMembr."Second Name", "Second Name");
                if xRec."Last Name" <> "Last Name" then
                    CustMembr.Validate(CustMembr."Last Name", "Last Name");
                if xRec.Name <> Name then
                    CustMembr.Validate(CustMembr.Name, Name);
                if xRec."P.I.N Number" <> "P.I.N Number" then
                    CustMembr.Validate(CustMembr."P.I.N Number", "P.I.N Number");
                if xRec."Account Status" <> "Account Status" then
                    CustMembr.Validate(CustMembr.Status, "Account Status");
                if xRec.Blocked <> Blocked then
                    CustMembr.Validate(CustMembr.Blocked, Blocked);
                if xRec."Member Segment" <> "Member Segment" then
                    CustMembr.Validate(CustMembr."Member Segment", "Member Segment");
                if xRec."Member Category" <> "Member Category" then
                    CustMembr.Validate(CustMembr."Member Category", "Member Category");
                if xRec."Relationship Manager" <> "Relationship Manager" then
                    CustMembr.Validate(CustMembr."Relationship Manager", "Relationship Manager");
                if xRec."Mobile Phone No" <> "Mobile Phone No" then
                    CustMembr.Validate(CustMembr."Mobile Phone No", "Mobile Phone No");

                //Agency Phone Number
                if SavingsAccounts.Get('512' + "Account No." + '000') then begin

                    AgentApplications.Reset;
                    AgentApplications.SetRange(Account, SavingsAccounts."No.");
                    if AgentApplications.FindFirst then
                        AgentApplications."Mobile No" := "Mobile Phone No";

                    AgentApplications.Modify;
                end;
                //Agency Phone Number

                if xRec."Payroll/Staff No." <> "Payroll/Staff No." then
                    CustMembr.Validate(CustMembr."Payroll/Staff No.", "Payroll/Staff No.");
                if xRec."ID No." <> "ID No." then
                    CustMembr.Validate(CustMembr."ID No.", "ID No.");
                if xRec."Allow Mboosta Defaulter" <> "Allow Mboosta Defaulter" then
                    CustMembr.Validate(CustMembr."Allow MBoosta Defaulter", "Allow Mboosta Defaulter");
                if xRec."Allow DAdvace Defaulter" <> "Allow DAdvace Defaulter" then
                    CustMembr.Validate(CustMembr."Allow DAdvace Defaulter", "Allow DAdvace Defaulter");
                if xRec.Salutation <> Salutation then
                    CustMembr.Validate(CustMembr.Salutation, Salutation);
                if xRec."Passport No." <> "Passport No." then
                    CustMembr.Validate(CustMembr."Passport No.", "Passport No.");
                if xRec."Date of Birth" <> "Date of Birth" then
                    CustMembr.Validate(CustMembr."Date of Birth", "Date of Birth");
                if xRec."Marital Status" <> "Marital Status" then
                    CustMembr.Validate(CustMembr."Marital Status", "Marital Status");
                if xRec."Group Account No." <> "Group Account No." then
                    CustMembr.Validate(CustMembr."Group Account No.", "Group Account No.");
                if xRec."Member Status" <> "Member Status" then
                    CustMembr.Validate(CustMembr.Status, Status);
                if xRec."Rejoining Date" <> "Rejoining Date" then
                    CustMembr.Validate("Rejoinig Date", "Rejoining Date");
                CustMembr.Retiree := Retiree;
                CustMembr."Rejoinig Date" := "Rejoining Date";
                if Retiree = true then begin
                    "Retirement Date" := Today;
                end;
                if xRec.Type <> Type then
                    CustMembr.Validate(Type, Type);
                if CustMembr.Type = Type then begin
                    //Rejoin
                    if Type = Type::"Re-joining" then begin
                        SavsAcc.Reset;
                        SavsAcc.SetRange("Member No.", "Account No.");
                        if SavsAcc.Find('-') then begin
                            repeat
                                SavsAcc.Validate(SavsAcc."Monthly Contribution");
                                SavsAcc.Modify;
                            //ERROR('i');
                            until SavsAcc.Next = 0;
                        end;
                    end;
                end;
                if xRec."Account Category" <> "Account Category" then
                    CustMembr.Validate("Account Category", "Account Category");

                if xRec."Group Type" <> "Group Type" then
                    CustMembr.Validate(CustMembr."Group Type", "Group Type");
                if xRec."Nature of Business" <> "Nature of Business" then
                    CustMembr.Validate(CustMembr."Nature of Business", "Nature of Business");
                if xRec."Company Registration No." <> "Company Registration No." then
                    CustMembr.Validate(CustMembr."Company Registration No.", "Company Registration No.");
                if xRec."Date of Business Reg." <> "Date of Business Reg." then
                    CustMembr.Validate(CustMembr."Date of Business Reg.", "Date of Business Reg.");
                if xRec."Business/Group Location" <> "Business/Group Location" then
                    CustMembr.Validate(CustMembr."Business/Group Location", "Business/Group Location");
                if xRec."Plot/Bldg/Street/Road" <> "Plot/Bldg/Street/Road" then
                    CustMembr.Validate(CustMembr."Plot/Bldg/Street/Road", "Plot/Bldg/Street/Road");
                if xRec."Type of Business" <> "Type of Business" then
                    CustMembr.Validate(CustMembr."Type of Business", "Type of Business");
                if xRec."Ownership Type" <> "Ownership Type" then
                    CustMembr.Validate(CustMembr."Ownership Type", "Ownership Type");
                if xRec."Other Business Type" <> "Other Business Type" then
                    CustMembr.Validate(CustMembr."Other Business Type", "Other Business Type");

                if xRec."Post Code" <> "Post Code" then
                    CustMembr.Validate(CustMembr."Post Code", "Post Code");
                if xRec.City <> City then
                    CustMembr.Validate(CustMembr.City, City);
                if xRec.Nationality <> Nationality then
                    CustMembr.Validate(CustMembr.Nationality, Nationality);
                if xRec."Employer Name" <> "Employer Name" then
                    CustMembr.Validate("Employer Name", "Employer Name");
                if xRec.County <> County then
                    CustMembr.Validate(CustMembr.County, County);
                if xRec."Phone No." <> "Phone No." then
                    CustMembr.Validate(CustMembr."Phone No.", "Phone No.");
                if xRec."E-Mail" <> "E-Mail" then
                    CustMembr.Validate(CustMembr."E-Mail", "E-Mail");
                if xRec."Current Address" <> "Current Address" then
                    CustMembr.Validate(CustMembr."Current Address", "Current Address");
                if xRec.Gender <> Gender then
                    CustMembr.Validate(CustMembr.Gender, Gender);
                if xRec."Employer Code" <> "Employer Code" then
                    CustMembr.Validate(CustMembr."Employer Code", "Employer Code");
                if xRec."Global Dimension 1 Code" <> "Global Dimension 1 Code" then
                    CustMembr.Validate(CustMembr."Global Dimension 1 Code", "Global Dimension 1 Code");
                if xRec."Global Dimension 2 Code" <> "Global Dimension 2 Code" then
                    CustMembr.Validate(CustMembr."Global Dimension 2 Code", "Global Dimension 2 Code");
                if xRec.County <> County then
                    CustMembr.Validate(CustMembr.County, County);
                if xRec."Recruited by Type" <> "Recruited by Type" then
                    CustMembr.Validate(CustMembr."Recruited by Type", "Recruited by Type");
                if xRec."Recruited By" <> "Recruited By" then
                    CustMembr.Validate(CustMembr."Recruited By", "Recruited By");
                if xRec."Electrol Zone" <> "Electrol Zone" then
                    CustMembr.Validate(CustMembr."Region Code", "Electrol Zone");
                if xRec."Area Service Center" <> "Area Service Center" then
                    CustMembr.Validate(CustMembr."Area Service Center", "Area Service Center");
                if xRec."Dividend Payment Method" <> "Dividend Payment Method" then
                    CustMembr."Dividend Payment Method" := "Dividend Payment Method";
                //hide
                if xRec.Hide <> Hide then
                    CustMembr.Hide := Hide;

                if xRec."Bank Code" <> "Bank Code" then
                    CustMembr.Validate(CustMembr."Bank Code", "Bank Code");
                if xRec."Branch Code" <> "Branch Code" then
                    CustMembr.Validate(CustMembr."Branch Code", "Branch Code");
                if xRec."Tax Exempted" <> "Tax Exempted" then
                    CustMembr.Validate("Tax Exempted", "Tax Exempted");
                if xRec."Bank Account No." <> "Bank Account No." then
                    CustMembr.Validate(CustMembr."Bank Account No.", "Bank Account No.");
                CustMembr.Modify;

                //
                CalcFields(Picture, Signature);
                ImageData.Reset;
                ImageData.SetRange("Member No", "Account No.");
                if ImageData.Find('-') then begin
                    ImageData.Picture := Picture;
                    ImageData.Signature := Signature;
                    ImageData.Modify;
                end else begin
                    ImageData."ID Number" := "ID No.";
                    ImageData."Member No" := "Account No.";
                    ImageData.Picture := Picture;
                    ImageData.Signature := Signature;
                    ImageData.Insert;
                end;
                NextOfKinApp.Reset;
                NextOfKinApp.SetRange(NextOfKinApp."Account No", "No.");
                if NextOfKinApp.Find('-') then begin

                    NextOfKin.Reset;
                    NextOfKin.SetRange("Account No", CustMembr."No.");
                    if NextOfKin.Find('-') then
                        NextOfKin.DeleteAll;
                    repeat

                        NextOfKin.Init;
                        NextOfKin."Entry No." := NextOfKinApp."Entry No.";
                        NextOfKin."Account No" := CustMembr."No.";
                        NextOfKin.Name := NextOfKinApp.Name;
                        NextOfKin.Relationship := NextOfKinApp.Relationship;
                        NextOfKin."Date Captured" := NextOfKinApp."Date Captured";
                        NextOfKin.Beneficiary := NextOfKinApp.Beneficiary;
                        NextOfKin."Date of Birth" := NextOfKinApp."Date of Birth";
                        NextOfKin.Address := NextOfKinApp.Address;
                        NextOfKin.Telephone := NextOfKinApp.Telephone;
                        NextOfKin.Fax := NextOfKinApp.Fax;
                        NextOfKin.Email := NextOfKinApp.Email;
                        NextOfKin."ID No." := NextOfKinApp."ID No.";
                        NextOfKin."%Allocation" := NextOfKinApp."%Allocation";
                        NextOfKin.Type := NextOfKinApp.Type;
                        NextOfKin."BBF Entitlement" := NextOfKinApp."BBF Entitlement";
                        NextOfKin."BBF Entitlement Code" := NextOfKinApp."BBF Entitlement Code";
                        NextOfKin."Date Modified" := Today;
                        NextOfKin.Insert;
                    until NextOfKinApp.Next = 0;
                end;

                AccountSignApp.Reset;
                AccountSignApp.SetRange(AccountSignApp."Account No", "No.");
                if AccountSignApp.Find('-') then begin
                    AccountSign.Reset;
                    AccountSign.SetRange("Account No", CustMembr."No.");
                    if AccountSign.Find('-') then
                        AccountSign.DeleteAll;
                    repeat

                        AccountSign.Init;
                        AccountSign."Entry No" := AccountSignApp."Entry No";
                        AccountSign."Account No" := CustMembr."No.";
                        AccountSign.Names := AccountSignApp.Names;
                        AccountSign."Date Of Birth" := AccountSignApp."Date Of Birth";
                        AccountSign."Staff/Payroll" := AccountSignApp."Staff/Payroll";
                        AccountSign."ID Number" := AccountSignApp."ID Number";
                        AccountSign.Signatory := AccountSignApp.Signatory;
                        AccountSign."Must Sign" := AccountSignApp."Must Sign";
                        AccountSign."Must be Present" := AccountSignApp."Must be Present";
                        AccountSignApp.CalcFields(AccountSignApp.Signature, AccountSignApp.Picture);
                        AccountSign.Picture := AccountSignApp.Picture;
                        AccountSign.Signature := AccountSignApp.Signature;
                        AccountSign."Expiry Date" := AccountSignApp."Expiry Date";
                        AccountSign."Phone No." := AccountSignApp."Phone No.";
                        AccountSign."Account Type" := AccountSignApp."Account Type";
                        AccountSign.Insert;

                        if AccountSignApp.Picture.HasValue then begin
                            Clear(AccountSignApp.Signature);
                            AccountSignApp.Modify;
                        end;

                        if AccountSignApp.Signature.HasValue then begin
                            Clear(AccountSignApp.Signature);
                            AccountSignApp.Modify;
                        end;
                    until AccountSignApp.Next = 0;
                end;

                if ReactivateDeactivateHeader."Group Account No." <> '' then begin
                    GCount := 0;
                    AccountSign.Reset;
                    AccountSign.SetRange(AccountSign."Member No.", Rec."Account No.");
                    if AccountSign.Find('-') then begin
                        repeat
                            Grps := AccountSign."Account No" + '/';
                        until AccountSign.Next = 0;
                        GCount := AccountSign.Count;
                        if ReactivateDeactivateHeader."Group Account No." <> AccountSign."Account No" then begin
                            Message('This Member is already a member in this groups: %1', Grps);
                            Error('ONE GROUP PER MEMBER');
                        end;
                    end;

                    AccountSign.Reset;
                    AccountSign.SetRange(AccountSign."Account No", ReactivateDeactivateHeader."Group Account No.");
                    //AccountSign.SETRANGE(AccountSign."Member No.",ReactivateDeactivateHeader."Account No.");
                    if AccountSign.Find('-') then begin
                        AccountSign2.Init;
                        AccountSign2."Account No" := AccountSign."Account No";
                        AccountSign2."Account Type" := AccountSign."Account Type";
                        AccountSign2."Member No." := CustMembr."No.";
                        AccountSign2.Names := UpperCase(CustMembr.Name);
                        AccountSign2."Date Of Birth" := CustMembr."Date of Birth";
                        AccountSign2."Staff/Payroll" := CustMembr."Payroll/Staff No.";
                        AccountSign2."ID Number" := CustMembr."ID No.";
                        AccountSign2."Phone No." := CustMembr."Mobile Phone No";
                        ImageData.Reset;
                        ImageData.SetRange(ImageData."Member No", CustMembr."No.");
                        if ImageData.Find('-') then begin
                            ImageData.CalcFields(ImageData.Signature, ImageData.Picture);
                            AccountSign2.Picture := ImageData.Picture;
                            AccountSign2.Signature := ImageData.Signature;
                        end;
                        AccountSign2."PIN Number" := CustMembr."P.I.N Number";
                        AccountSign2.Type := ReactivateDeactivateHeader."Group Position";

                        AccountSign.Reset;
                        AccountSign.SetRange(AccountSign."Account No", ReactivateDeactivateHeader."Group Account No.");
                        AccountSign.SetRange(AccountSign."Member No.", ReactivateDeactivateHeader."Account No.");
                        if not AccountSign.Find('-') then
                            AccountSign2.Insert;
                    end else begin
                        AccountSign.Reset;
                        AccountSign.SetRange(AccountSign."Account No", ReactivateDeactivateHeader."Group Account No.");
                        if not AccountSign.Find('-') then begin
                            AccountSign2.Init;
                            AccountSign2."Account No" := ReactivateDeactivateHeader."Group Account No.";
                            AccountSign2."Account Type" := AccountSign2."Account Type"::Member;
                            AccountSign2."Member No." := CustMembr."No.";
                            AccountSign2.Names := UpperCase(CustMembr.Name);
                            AccountSign2."Date Of Birth" := CustMembr."Date of Birth";
                            AccountSign2."Staff/Payroll" := CustMembr."Payroll/Staff No.";
                            AccountSign2."ID Number" := CustMembr."ID No.";
                            AccountSign2."Phone No." := CustMembr."Mobile Phone No";
                            ImageData.Reset;
                            ImageData.SetRange(ImageData."Member No", CustMembr."No.");
                            if ImageData.Find('-') then begin
                                ImageData.CalcFields(ImageData.Signature, ImageData.Picture);
                                AccountSign2.Picture := ImageData.Picture;
                                AccountSign2.Signature := ImageData.Signature;
                            end;
                            AccountSign2."PIN Number" := CustMembr."P.I.N Number";
                            AccountSign2.Type := ReactivateDeactivateHeader."Group Position";
                            AccountSign2.Insert;
                        end;
                    end;
                end;

            end;
        end;
    end;

    //[Scope('Internal')]
    procedure TrackerII(SavingsAccounts: Record "Savings Accounts")
    begin
        ReactivateDeactivateHeader.Reset;
        ReactivateDeactivateHeader.SetRange(ReactivateDeactivateHeader."No.", "No.");
        if ReactivateDeactivateHeader.Find('-') then begin
            if SavingsAccounts.Get("Account No.") then begin

                if xRec.Name <> Name then
                    SavingsAccounts.Validate(SavingsAccounts.Name, Name);
                if xRec."Account Status" <> "Account Status" then
                    SavingsAccounts.Validate(SavingsAccounts.Status, "Account Status");
                //IF xRec.Blocked <> Blocked THEN
                // SavingsAccounts.VALIDATE(SavingsAccounts.Blocked, Blocked);

                if xRec."Relationship Manager" <> "Relationship Manager" then
                    SavingsAccounts.Validate(SavingsAccounts."Relationship Manager", "Relationship Manager");
                if xRec."Mobile Phone No" <> "Mobile Phone No" then
                    SavingsAccounts.Validate(SavingsAccounts."Mobile Phone No", "Mobile Phone No");
                if xRec."Payroll/Staff No." <> "Payroll/Staff No." then
                    SavingsAccounts.Validate(SavingsAccounts."Payroll/Staff No.", "Payroll/Staff No.");
                if xRec."ID No." <> "ID No." then
                    SavingsAccounts.Validate(SavingsAccounts."ID No.", "ID No.");
                if SavingsAccounts."Loan Disbursement Account" <> "Loan Disbursement Account" then
                    SavingsAccounts.Validate(SavingsAccounts."Loan Disbursement Account", "Loan Disbursement Account");
                if xRec."Passport No." <> "Passport No." then
                    SavingsAccounts.Validate(SavingsAccounts."Passport No.", "Passport No.");
                if xRec."Date of Birth" <> "Date of Birth" then
                    SavingsAccounts.Validate(SavingsAccounts."Date of Birth", "Date of Birth");
                if xRec."Marital Status" <> "Marital Status" then
                    SavingsAccounts.Validate(SavingsAccounts."Marital Status", "Marital Status");
                if xRec."Group Account No." <> "Group Account No." then
                    SavingsAccounts.Validate(SavingsAccounts."Group Account No", "Group Account No.");
                if xRec."Monthly Contribution" <> "Monthly Contribution" then
                    SavingsAccounts.Validate(SavingsAccounts."Monthly Contribution", "Monthly Contribution");


                if xRec."Company Registration No." <> "Company Registration No." then
                    SavingsAccounts.Validate(SavingsAccounts."Company Registration No.", "Company Registration No.");
                if xRec."Signing Instructions" <> "Signing Instructions" then
                    SavingsAccounts."Signing Instructions" := "Signing Instructions";
                if xRec."FD Duration" <> "FD Duration" then
                    SavingsAccounts."FD Duration" := "FD Duration";
                if xRec."FD Maturity Date" <> "FD Maturity Date" then
                    SavingsAccounts."FD Maturity Date" := "FD Maturity Date";
                if xRec."Fixed Deposit Amount" <> "Fixed Deposit Amount" then
                    SavingsAccounts."Fixed Deposit Amount" := "Fixed Deposit Amount";
                if xRec."Fixed Deposit cert. no" <> "Fixed Deposit cert. no" then
                    SavingsAccounts."Fixed Deposit cert. no" := "Fixed Deposit cert. no";
                if xRec."Fixed Deposit Status" <> "Fixed Deposit Status" then
                    SavingsAccounts."Fixed Deposit Status" := "Fixed Deposit Status";
                if xRec."Fixed Deposit Type" <> "Fixed Deposit Type" then
                    SavingsAccounts."Fixed Deposit Type" := "Fixed Deposit Type";
                if xRec."Neg. Interest Rate" <> "Neg. Interest Rate" then
                    SavingsAccounts."Neg. Interest Rate" := "Neg. Interest Rate";
                if xRec."Savings Account No." <> "Savings Account No." then
                    SavingsAccounts."Savings Account No." := "Savings Account No.";
                if xRec."FD Maturity Instructions" <> "FD Maturity Instructions" then
                    SavingsAccounts."FD Maturity Instructions" := "FD Maturity Instructions";

                if xRec."Birth Certificate No." <> "Birth Certificate No." then
                    SavingsAccounts."Birth Certificate No." := "Birth Certificate No.";
                if xRec."Parent Account No." <> "Parent Account No." then
                    SavingsAccounts."Parent Account No." := "Parent Account No.";

                if xRec."Product Type" <> "Product Type" then
                    SavingsAccounts."Product Type" := "Product Type";
                if xRec."Product Name" <> "Product Name" then
                    SavingsAccounts."Product Name" := "Product Name";
                if xRec."Product Category" <> "Product Category" then
                    SavingsAccounts."Product Category" := "Product Category";

                if xRec."Group Account No." <> "Group Account No." then
                    SavingsAccounts."Group Account No" := "Group Account No.";
                if xRec."Company Registration No." <> "Company Registration No." then
                    SavingsAccounts."Company Registration No." := "Company Registration No.";

                if xRec.Hide <> Hide then
                    SavingsAccounts.Hide := Hide;
                if xRec."Enable Sweeping" <> "Enable Sweeping" then
                    SavingsAccounts."Enable Sweeping" := "Enable Sweeping";
                //    IF xRec."Bank Account No."<>"Bank Account No." THEN
                //      SavingsAccounts."External Account No":="Bank Account No.";
                //    IF xRec."Branch Code"<>"Branch Code" THEN
                //      SavingsAccounts."Bank Code":="Branch Code";


                if xRec."Post Code" <> "Post Code" then
                    SavingsAccounts.Validate(SavingsAccounts."Post Code", "Post Code");



                SavingsAccounts."Salary Through FOSA" := "Salary Through FOSA";
                SavingsAccounts.Validate("Salary Through FOSA");

                if xRec.City <> City then
                    SavingsAccounts.Validate(SavingsAccounts.City, City);
                if xRec.County <> County then
                    SavingsAccounts.Validate(SavingsAccounts.County, County);
                if xRec."Phone No." <> "Phone No." then
                    SavingsAccounts.Validate(SavingsAccounts."Phone No.", "Phone No.");
                if xRec."E-Mail" <> "E-Mail" then
                    SavingsAccounts.Validate(SavingsAccounts."E-Mail", "E-Mail");
                if xRec."Current Address" <> "Current Address" then
                    SavingsAccounts.Validate(SavingsAccounts."Current Address", "Current Address");

                if xRec."Employer Code" <> "Employer Code" then
                    SavingsAccounts.Validate(SavingsAccounts."Employer Code", "Employer Code");
                if xRec."Global Dimension 1 Code" <> "Global Dimension 1 Code" then
                    SavingsAccounts.Validate(SavingsAccounts."Global Dimension 1 Code", "Global Dimension 1 Code");
                if xRec."Global Dimension 2 Code" <> "Global Dimension 2 Code" then
                    SavingsAccounts.Validate(SavingsAccounts."Global Dimension 2 Code", "Global Dimension 2 Code");
                if xRec.County <> County then
                    SavingsAccounts.Validate(SavingsAccounts.County, County);
                if xRec."Recruited by Type" <> "Recruited by Type" then
                    SavingsAccounts.Validate(SavingsAccounts."Recruited by Type", "Recruited by Type");
                if xRec."Recruited By" <> "Recruited By" then
                    SavingsAccounts.Validate(SavingsAccounts."Recruited By", "Recruited By");
                if xRec."Status Change Reason" <> "Status Change Reason" then
                    SavingsAccounts.Validate(SavingsAccounts."Status Change Reason", "Status Change Reason");
                if xRec."ATM No." <> "ATM No." then
                    SavingsAccounts.Validate(SavingsAccounts."ATM No.", "ATM No.");
                if xRec."Old Account No" <> "Old Account No" then
                    SavingsAccounts.Validate(SavingsAccounts."Old Account No", "Old Account No");
                if xRec."Mobile Loan Blocked" <> "Mobile Loan Blocked" then
                    SavingsAccounts.Validate(SavingsAccounts."Mobile Loan Blocked", "Mobile Loan Blocked");
                SavingsAccounts."Mobile Loan Blocked" := "Mobile Loan Blocked";
                SavingsAccounts.Blocked := Blocked;
                SavingsAccounts."Birth Certificate No." := "Birth Certificate No.";
                if "Mobile Loan Blocked" = false then
                    SavingsAccounts."Mobile Loan Date  Blocked" := 0D else
                    SavingsAccounts."Mobile Loan Date  Blocked" := Today;
                if "Mobile Loan Blocked" = false then
                    SavingsAccounts."Mobile Loan Un Blocked By" := '' else
                    SavingsAccounts."Mobile Loan Un Blocked By" := UserId;
                if "Mobile Loan Blocked" = true then
                    SavingsAccounts."Mobile Loan Blocked By" := UserId;

                SavingsAccounts.Modify;
            end;
        end;
    end;

    local procedure GetSignatory()
    begin
        SignatoryApplication.Reset;
        SignatoryApplication.SetRange("Account No", "No.");
        if SignatoryApplication.Find('-') then
            SignatoryApplication.DeleteAll;


        AccountSignatories.Reset;
        AccountSignatories.SetRange(AccountSignatories."Account No", "Member No.");
        if AccountSignatories.Find('-') then begin
            repeat
                EntryNo += 1;
                SignatoryApplication.Init;
                SignatoryApplication."Account No" := "No.";
                SignatoryApplication."Entry No" := EntryNo;
                SignatoryApplication."Member No." := "Member No.";
                SignatoryApplication."ID Number" := AccountSignatories."ID Number";
                SignatoryApplication."Date Of Birth" := AccountSignatories."Date Of Birth";
                SignatoryApplication.Signatory := AccountSignatories.Signatory;
                //SignatoryApplication.CALCFIELDS(Signatory,Picture);
                SignatoryApplication.Signature := AccountSignatories.Signature;
                SignatoryApplication.Picture := AccountSignatories.Picture;
                SignatoryApplication."Must be Present" := AccountSignatories."Must be Present";
                SignatoryApplication."Must Sign" := AccountSignatories."Must Sign";
                SignatoryApplication.Names := AccountSignatories.Names;
                SignatoryApplication."Staff/Payroll" := AccountSignatories."Staff/Payroll";
                SignatoryApplication.Type := AccountSignatories.Type;
                SignatoryApplication."Expiry Date" := AccountSignatories."Expiry Date";
                SignatoryApplication.Insert;

            until AccountSignatories.Next = 0;
        end;
    end;

    //[Scope('Internal')]
    procedure GetNextofkin()
    var
        LineNo: Integer;
    begin
        NextOfKinApp.Reset;
        NextOfKinApp.SetRange("Account No", "No.");
        if NextOfKinApp.Find('-') then
            NextOfKinApp.DeleteAll;
        LineNo := 1;
        NextOfKin.Reset;
        NextOfKin.SetRange(NextOfKin."Account No", "Member No.");
        if NextOfKin.Find('-') then begin
            repeat
                LineNo += 1;
                NextOfKinApp.Init;
                NextOfKinApp."Entry No." := LineNo;
                NextOfKinApp."Account No" := "No.";
                NextOfKinApp.Name := NextOfKin.Name;
                NextOfKinApp.Relationship := NextOfKin.Relationship;
                NextOfKinApp.Beneficiary := NextOfKin.Beneficiary;
                NextOfKinApp."Date of Birth" := NextOfKin."Date of Birth";
                NextOfKinApp.Address := NextOfKin.Address;
                NextOfKinApp."Date Captured" := NextOfKin."Date Captured";
                NextOfKinApp.Telephone := NextOfKin.Telephone;
                NextOfKinApp.Fax := NextOfKin.Fax;
                NextOfKinApp.Email := NextOfKin.Email;
                NextOfKinApp."ID No." := NextOfKin."ID No.";
                NextOfKinApp."%Allocation" := NextOfKin."%Allocation";
                NextOfKinApp.Type := NextOfKin.Type;
                NextOfKinApp."BBF Entitlement" := NextOfKin."BBF Entitlement";
                NextOfKinApp."BBF Entitlement Code" := NextOfKin."BBF Entitlement Code";
                NextOfKinApp.Insert;
            until NextOfKin.Next = 0;
        end;
    end;

    //[Scope('Internal')]
    procedure GetPicSig()
    begin
        ImageData.Reset;
        ImageData.SetRange("Member No", "Account No.");
        if ImageData.Find('-') then begin
            ImageData.CalcFields(Picture, Signature);
            Picture := ImageData.Picture;
            Signature := ImageData.Signature;
            //Rec.MODIFY;
        end;
    end;

    //[Scope('Internal')]
    procedure OnViewCurrRec()
    var
        ChangePermission: Record "Status Change Permissions.";
        ErrorOnRestricViewTxt: Label 'You do not have Permissions to block or unlock mobile loan  on this record. Contact system administrator for assistance. %';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("Block Mobile Loan", true);
        if not ChangePermission.Find('-') then
            Error(ErrorOnRestricViewTxt, UserId);
    end;

    local procedure ValidatePhone()
    begin

        if "Phone No." <> '' then begin
            CountryRegion.Reset;
            CountryRegion.SetRange(Code, Rec.Nationality);
            if CountryRegion.FindFirst then begin
                NewMob := '';
                NewMob := CopyStr("Phone No.", 1, 4);
                if (CopyStr("Phone No.", 1, 4)) <> (CountryRegion."County Phone Code") then
                    Error('The Office Telephone No. should take the format of ' + CountryRegion."County Phone Code");
                if StrLen("Phone No.") <> 13 then
                    Error('Phone No. should be equal to 13 characters');

            end;
        end;
        if "Mobile Phone No" <> '' then begin
            CountryRegion.Reset;
            CountryRegion.SetRange(Code, Rec.Nationality);
            if CountryRegion.FindFirst then begin
                NewMob := '';
                NewMob := CopyStr("Mobile Phone No", 1, 4);
                if (CopyStr("Mobile Phone No", 1, 4)) <> (CountryRegion."County Phone Code") then
                    Error('The Mobile phone No. should take the format of ' + CountryRegion."County Phone Code");
                if StrLen("Mobile Phone No") <> 13 then
                    Error('Phone No. should be equal to 13 characters');
            end;
        end;
    end;

    local procedure ChangePermissions()
    var
        User: Record "User Setup";
        Text001: Label 'Please Contact Records Section  For update of Either Date of Birth Or Mobile Phone No';
    begin
        User.Get(UserId);
        if User."Member Change Permission" = false then Error(Text001);
    end;
}

