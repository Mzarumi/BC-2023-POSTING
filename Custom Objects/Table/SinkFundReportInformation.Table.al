table 52185940 "SinkFund Report Information"
{

    fields
    {
        field(1; No; Code[10])
        {
        }
        field(2; Date; Date)
        {
            Editable = false;
        }
        field(3; "Reported By Name"; Text[50])
        {
        }
        field(4; "Reported By ID No"; Code[20])
        {

            trigger OnValidate()
            begin
                "Reported By ID No" := DelChr("Reported By ID No", '=', 'A|B|C|D|E|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|.|,|!|@|#|$|%|^|&|*|(|)|[|]|{|}|/|\|"|;|:|<|>|?|+|-|_');
                // FieldLength("Reported By ID No", 10);
            end;
        }
        field(5; "Reported By Relationship"; Text[30])
        {
            TableRelation = "Relationship Types";
        }
        field(6; "Member No"; Code[20])
        {
            TableRelation = Members."No." WHERE(Status = FILTER(<> Deceased));

            trigger OnValidate()
            begin
                CompanyInformation.Get();
                "Reported By ID No" := '';
                "Reported By Name" := '';
                "Reported By Relationship" := '';
                "Date of Death" := 0D;
                "Exclude Loans and Deposits" := false;
                "Claim Option" := '';
                "Deceased Person" := '';
                "Staff No." := '';
                "Member Name" := '';
                "Total Net Amount" := 0;
                "Total Outstanding Interest" := 0;
                "Total Outstanding Loan" := 0;
                "Savings Balance" := 0;
                "Sms Sent" := false;
                "Sms Request Reason" := '';
                if Members.Get("Member No") then begin

                    "Member Name" := Members.Name;
                    "Staff No." := Members."Payroll/Staff No.";

                    // if Members.Status = Members.Status::Defaulter then begin
                    //     if Confirm('Do you want to send SMS notification to the member: The member is a defaulter?', false) = true then begin
                    //         SendSMS.SendSms(SourceType::"Account Status", Members."Mobile Phone No", 'Your claim request has been rejected due because ' +
                    //   'the member is a defaulter, incase of querry Call ' + CompanyInformation."Phone No.", No, "Member No", false);
                    //         "Sms Request Reason" := 'The member is a defaulter';
                    //         //Status:=Status::Rejected;
                    //     end;
                    // end;
                end else begin
                    "Member Name" := '';
                end;
                Counts := 0;
                BBFRequisationHeader2.Reset;
                BBFRequisationHeader2.SetRange(BBFRequisationHeader2."Member No", "Member No");
                if BBFRequisationHeader2.Find('-') then begin
                    repeat
                        if (BBFRequisationHeader2.Status = BBFRequisationHeader2.Status::Open) or
                           (BBFRequisationHeader2.Status = BBFRequisationHeader2.Status::Pending) then begin
                            Counts += 1;
                        end;
                    until BBFRequisationHeader2.Next = 0;
                    if Counts > 8 then
                        Error('MultipleApplicationsError');
                end;

                NextofKIN.Reset;
                NextofKIN.SetRange("Account No", "Member No");
                NextofKIN.SetRange(Beneficiary, true);
                NextofKIN.SetRange(Type, NextofKIN.Type::"Benevolent Beneficiary");
                if not NextofKIN.Find('-') then begin
                    "Sms Request Reason" := 'Update Required for Picture,Signature and Beneficiaries';
                    Message(Err0001);
                end;
                ImageData.Reset;
                ImageData.SetRange(ImageData."Member No", Rec."Member No");
                if ImageData.Find('-') then begin
                    ImageData.CalcFields(ImageData.Picture, ImageData.Signature);
                    if not ImageData.Picture.HasValue then
                        Message('Kindly capture the member photo before proceeding');
                    if not ImageData.Signature.HasValue then
                        Message('Kindly Signature sample of the member before proceeding');
                end;

                "Captured By" := UserId;
                Date := Today;
            end;
        }
        field(7; "Date of Death"; Date)
        {

            trigger OnValidate()
            begin
                Validate("Claim Option");
            end;
        }
        field(8; "Claim Option"; Code[20])
        {
            TableRelation = "BBF Entitlement".Code WHERE(Code = FILTER(<> 'PRINCIPLE'));

            trigger OnValidate()
            var
                BBFEntitlementSetUp: Record "BBF Entitlement SetUp";
                KinDetails: Record "Next of KIN";
            begin
                "Deceased Person" := '';
                "Total Net Amount" := 0;
                "Total Outstanding Interest" := 0;
                "Total Outstanding Loan" := 0;
                "Savings Balance" := 0;
                TestField("Member No");

                if "Claim Option" <> 'PRINCIPAL MEMBER' then begin
                    KinDetails.Reset;
                    KinDetails.SetRange(Beneficiary, true);
                    KinDetails.SetRange(Deceased, false);
                    KinDetails.SetFilter("BBF Entitlement Code", "Claim Option");
                    KinDetails.SetRange(Type, KinDetails.Type::"Benevolent Beneficiary");
                    KinDetails.SetRange("Account No", "Member No");
                    if not KinDetails.FindFirst then begin
                        Error('The NOK must be a beneficiary, not deceased, a %1 and of type beneficiary in the Next of Kin details', "Claim Option");
                    end else begin
                        "Deceased Person" := KinDetails.Name;
                    end;
                end;
                // CalculateBBFAmounts("Date of Death", "Claim Option", "Sacco Income Recovable", "Benevolent Claim Amount");
                "Total Net Amount" := "Benevolent Claim Amount" + "Sacco Income Recovable";
                if "Claim Option" = 'PRINCIPAL MEMBER' then begin
                    if Members.Get("Member No") then begin
                        "Member Name" := Members.Name;
                        "Deceased Person" := Members.Name;
                        if "Exclude Loans and Deposits" = false then begin
                            Loans.Reset;
                            Loans.SetRange(Loans."Member No.", Rec."Member No");
                            Loans.SetFilter("Outstanding Balance", '>0');
                            Loans.SetFilter("Date Filter", '..' + Format("Date of Death"));
                            if Loans.Find('-') then begin
                                repeat
                                    Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                                    "Total Outstanding Loan" += Loans."Outstanding Balance";
                                    "Total Outstanding Interest" += Loans."Outstanding Interest";
                                until Loans.Next = 0;
                            end;

                            SavingsAccounts.Reset;
                            SavingsAccounts.SetRange(SavingsAccounts."Member No.", Rec."Member No");
                            SavingsAccounts.SetRange("Product Category", SavingsAccounts."Product Category"::"Deposit Contribution");
                            if SavingsAccounts.Find('-') then begin
                                SavingsAccounts.CalcFields("Balance (LCY)");
                                "Savings Balance" := SavingsAccounts."Balance (LCY)";
                            end;
                            if "Date of Death" <= 20170731D then "Savings Balance" := 0;
                        end;
                        "Total Net Amount" := ("Total Outstanding Loan" + "Savings Balance" + "Benevolent Claim Amount");
                    end;
                end;

                //check no other Option was placed before
                BBFRequisationHeader.Reset;
                BBFRequisationHeader.SetRange(BBFRequisationHeader."Member No", "Member No");
                BBFRequisationHeader.SetFilter(No, '<>%1', Rec.No);
                BBFRequisationHeader.SetRange(BBFRequisationHeader."Claim Option", "Claim Option");
                if BBFRequisationHeader.Find('-') then begin
                    if BBFRequisationHeader.Status = BBFRequisationHeader.Status::Approved then
                        Error('An Approved record of this claim option for this member exist No:%1', BBFRequisationHeader.No);
                    if BBFRequisationHeader.Status = BBFRequisationHeader.Status::Open then
                        Error('An open record of this claim option for this member exist No:%1', BBFRequisationHeader.No);
                    if BBFRequisationHeader.Status = BBFRequisationHeader.Status::Pending then
                        Error('A pending record of this claim option for this member exist No:%1', BBFRequisationHeader.No);
                end
            end;
        }
        field(9; "Deceased Person"; Text[100])
        {
            Editable = false;
            TableRelation = "Next of KIN".Name WHERE(Type = CONST("Benevolent Beneficiary"),
                                                      Deceased = CONST(false),
                                                      Beneficiary = CONST(true),
                                                      "Account No" = FIELD("Member No"),
                                                      "BBF Entitlement Code" = FIELD("Claim Option"));
        }
        field(10; "Member Name"; Text[100])
        {
            Editable = false;
        }
        field(11; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            Editable = false;
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          "Dimension Value Type" = CONST(Standard));
        }
        field(12; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            Editable = false;
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          "Dimension Value Type" = CONST(Standard));
        }
        field(13; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(14; "Responsibily Center"; Code[30])
        {
            Editable = false;
            TableRelation = "Responsibility CenterBR";
        }
        field(15; "Captured By"; Code[30])
        {
            Editable = false;
        }
        field(16; "No. Series"; Code[20])
        {
        }
        field(17; "Request Letter"; Boolean)
        {
        }
        field(18; "ID Copy Of Claimnant"; Boolean)
        {
        }
        field(19; "ID Copy Deceased"; Boolean)
        {
        }
        field(20; "Birth Certificate"; Boolean)
        {
        }
        field(21; "Stamped Burial Permitt"; Boolean)
        {
        }
        field(22; "Employer Letter"; Boolean)
        {
        }
        field(23; "Chief's Letter"; Boolean)
        {
        }
        field(24; "Death Certificate"; Boolean)
        {
        }
        field(25; PaySlip; Boolean)
        {
        }
        field(26; "Savings Balance"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                //"Total Net Amount":=("Total Outstanding Loan"+"Savings Balance"+"Benevolent Claim Amount");
                if "Exclude Loans and Deposits" = false then
                    "Total Net Amount" := ("Total Outstanding Loan" + "Savings Balance" + "Benevolent Claim Amount")
                else
                    "Total Net Amount" := ("Benevolent Claim Amount")
            end;
        }
        field(27; "Total Outstanding Loan"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "Exclude Loans and Deposits" = false then
                    "Total Net Amount" := ("Total Outstanding Loan" + "Savings Balance" + "Benevolent Claim Amount")
                else
                    "Total Net Amount" := ("Benevolent Claim Amount")
            end;
        }
        field(28; "Total Outstanding Interest"; Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                if "Exclude Loans and Deposits" = false then
                    "Total Net Amount" := ("Total Outstanding Loan" + "Savings Balance" + "Benevolent Claim Amount")
                else
                    "Total Net Amount" := ("Benevolent Claim Amount")
            end;
        }
        field(29; "Marriage Certificate/Affidavit"; Boolean)
        {
        }
        field(30; "Benevolent Claim Amount"; Decimal)
        {
            Editable = false;
        }
        field(31; Posted; Boolean)
        {
            Editable = true;
        }
        field(32; "Date Posted"; Date)
        {
            Editable = false;
        }
        field(33; "Posted By"; Code[50])
        {
        }
        field(34; "Insurance Payment Status"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Pending Payment,Insurance Paid,Beneficiary Claim Paid,Principal Amount Paid';
            OptionMembers = " ","Pending Payment","Insurance Paid","Beneficiary Claim Paid","Principal Amount Paid";
        }
        field(35; "Total Net Amount"; Decimal)
        {

            trigger OnValidate()
            begin
                "Total Net Amount" := ("Total Outstanding Loan" + "Savings Balance" + "Benevolent Claim Amount");
            end;
        }
        field(36; "Sms Sent"; Boolean)
        {
            Editable = false;
        }
        field(37; "Sms Request Reason"; Text[250])
        {
            Editable = false;

            trigger OnValidate()
            begin
                CompanyInformation.Get();
                if "Sms Request Reason" <> '' then begin
                    if Confirm('Do you want to send SMS notification to the member?', false) = true then begin
                        if Mem.Get("Member No") then begin
                            // SendSMS.SendSms(SourceType::"Account Status", Mem."Mobile Phone No", 'Your claim has been deferred Kindly provide ' + ': ' + "Sms Request Reason"
                            //  + 'Incase of querry Call ' + CompanyInformation."Phone No. 2", No, "Member No", true);
                            Message('sms Sent');
                        end;
                    end;
                    //Status:=Status::Rejected;
                end;
            end;
        }
        field(38; "Exclude Loans and Deposits"; Boolean)
        {

            trigger OnValidate()
            begin
                Validate("Total Net Amount");
            end;
        }
        field(39; "Staff No."; Code[15])
        {
            Editable = false;
        }
        field(40; "Sacco Income Recovable"; Decimal)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Status <> Status::Open then
            Error('Status must be Open');
    end;

    trigger OnInsert()
    begin
        BBFRequisationHeader2.Reset;
        BBFRequisationHeader2.SetRange(Status, BBFRequisationHeader2.Status::Open);
        BBFRequisationHeader2.SetFilter("Member No", '=%1', '');
        BBFRequisationHeader2.SetRange("Captured By", UserId);
        if BBFRequisationHeader2.Find('-') then begin
            if BBFRequisationHeader2.Count > 2 then
                Error('Kindly use the open document first for you to create a new one');
        end;
        if No = '' then begin
            SeriesSetup.Get;
            SeriesSetup.TestField(SeriesSetup."BBF Report");
            //NoSeriesMgtInitSeries(SeriesSetup."BBF Report", xRec."No. Series", 0D, No, "No. Series");
        end;
        if UserSetup.Get(UserId) then
            "Responsibily Center" := UserSetup."Responsibility Centre";
        "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
        "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";

        "Captured By" := UserId;
        Date := Today;
    end;

    trigger OnModify()
    begin
        //IF Status<>Status::Open THEN
        //  ERROR('Status must be Open');
    end;

    trigger OnRename()
    begin
        if Status <> Status::Open then
            Error('Status must be Open');
    end;

    var
        Members: Record Members;
        SeriesSetup: Record "Credit Nos. Series";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        BBFRequisationHeader2: Record "SinkFund Report Information";
        Counts: Integer;
        BBFRequisationHeader: Record "SinkFund Report Information";
        ImageData: Record "Image Data";
        NextofKIN: Record "Next of KIN";
        Loans: Record Loans;
        SavingsAccounts: Record "Savings Accounts";
        BBFEntitlement: Record "BBF Entitlement";
        Err0001: Label 'Member does not have next of kin details';
        // SendSMS: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        CompanyInformation: Record "Company Information";
        Mem: Record Members;

    //[Scope('Internal')]
    procedure FieldLength(VarVariant: Text; FldLength: Integer): Text
    var
        FieldLengthError: Label 'Field cannot be more than %1 Characters.';
    begin
        if StrLen(VarVariant) > FldLength then
            Error(FieldLengthError, FldLength);
    end;

    //[Scope('Internal')]
    procedure CalculateBBFAmounts(DateOfDeath: Date; BBFOption: Code[50]; var SaccoRecovableAmount: Decimal; var BBFClaimAmount: Decimal)
    var
        BBFEntitlementSetUp: Record "BBF Entitlement SetUp";
        SinkFundReportInformation: Record "SinkFund Report Information";
    begin
        BBFEntitlementSetUp.Reset;
        BBFEntitlementSetUp.SetRange("BBF Code", BBFOption);
        BBFEntitlementSetUp.SetFilter("Start Date", '<=%1', DateOfDeath);
        BBFEntitlementSetUp.SetFilter("End Date", '>=%1', DateOfDeath);
        if BBFEntitlementSetUp.FindFirst then begin
            SaccoRecovableAmount := BBFEntitlementSetUp."Sacco Amount";
            BBFClaimAmount := BBFEntitlementSetUp."Member Amount";
        end;
    end;
}

