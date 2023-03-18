#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185455 "Registration Process"
{

    trigger OnRun()
    begin
        // AnySavingsAccountRegistration('0198837', '06');
    end;

    var
        EntrNo: Integer;
        DocumentType: Option;
        SingleMultiple: Option;
        SavingsAccounts: Record 52185730;
        // SendSMS: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        Text002: label 'You have been approved as a member at  ';
        Text003: label 'Your Member No. is  ';
        Text004: label 'Your application has been approved by  ';
        Text005: label 'Your Account No. is  ';
        Text006: label 'This application has not been approved.';
        Text007: label 'Are you sure you want to convert this application to membership?';
        Text008: label 'Member No. %1 created successfully.';
        Cust: Record 52185700;
        PeriodInteg: Integer;
        FOSAACC: Code[50];
        GeneralSetUp: Record 52185689;
        // Temp: Record 52185782;
        // TransactionCharges: Record 52185774;
        Jtemplate: Code[20];
        Jbatch: Code[10];
        LineN: Integer;
        Dim1: Code[10];
        Dim2: Code[10];
        // Mgnt: Codeunit "Journal Posting";
        TransactionTypes: Record 52185773;
        SavingsAcc: Record 52185730;
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        // FileTracker: Record 52186080;
        Category: Record 52185723;
        Text0003: label 'You have been captured as principle member to';
        MsgT: Text;
        MsgTT: Text;


    procedure MemberRegistration(MemberApplication: Record 52185691)
    var
        LineNo: Integer;
        Cust: Record 52185700;
        GroupMembers: Record 52185700;
        Accounts: Record Vendor;
        NextOfKinApp: Record 52185692;
        NextOfKin: Record 52185701;
        // AccountSignApp: Record 52185697;
        // AccountSign: Record 52185703;
        GenSetUp: Record 52185689;
        ImageData: Record 52185702;
        DefaultSavAccReg: Record 52185695;
        SavingsAcc: Record 52185730;
        ProductFactory: Record 52185690;
        IDNumber: Code[20];
        CustMembrDocuments: Record 52185726;
        Suffix: Integer;
        SuffixText: Text;
        // CustSocialListenSite: Record 52185863;
        CompanyInformation: Record "Company Information";
        GeneralSetUp: Record 52185689;
        Factory: Record 52185690;
        GenJournalLine: Record "Gen. Journal Line";
        // Temp: Record 52185782;
        Jtemplate: Code[30];
        JBatch: Code[30];
        UserSetup: Record "User Setup";
        Text0001: label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        AccountNo: Code[50];
        i: Integer;
        SavAcc: Record 52185730;
        GrAccounts: Record 52185730;
        // VirtualRegistrations: Record 52186111;
        // AgentBiometricData: Record 52186107;
    begin
        FOSAACC := '';
        Cust."No." := '';
        Cust."Single Party/Multiple" := MemberApplication."Single Party/Multiple/Business";
        Cust."Old Member No." := Cust."Old Member No.";
        ;
        Cust."Associated Member No." := MemberApplication."Associated Member No.";
        Cust."First Name" := UpperCase(MemberApplication."First Name");
        Cust."Second Name" := UpperCase(MemberApplication."Second Name");
        Cust."Last Name" := UpperCase(MemberApplication."Last Name");
        Cust.Name := UpperCase(MemberApplication.Name);
        Cust."Registration Date" := Today;
        Cust."ID No." := MemberApplication."ID No.";
        Cust."Passport No." := MemberApplication."Passport No.";
        Cust.County := MemberApplication.City;
        Cust."P.I.N Number" := MemberApplication."P.I.N Number";
        Cust."Phone No." := MemberApplication."Phone No.";
        Cust."Mobile Phone No" := MemberApplication."Mobile Phone No";
        Cust."Current Address" := MemberApplication."Current Address";
        Cust."Post Code" := MemberApplication."Post Code";
        Cust.City := MemberApplication.City;
        Cust."Recruited by Type" := MemberApplication."Recruited by Type";
        Cust."Recruited By Name" := MemberApplication."Recruited By Name";
        Cust."Relationship Manager" := MemberApplication."Relationship Manager";
        Cust.Nationality := MemberApplication.Nationality;
        Cust."Date of Birth" := MemberApplication."Date of Birth";
        Cust."Birth Certificate No." := MemberApplication."Birth Certificate No.";
        Cust."Marital Status" := MemberApplication."Marital Status";
        Cust."Member Segment" := MemberApplication."Member Segment";
        Cust."Member Category" := MemberApplication."Member Category";
        Cust."Account Category" := MemberApplication."Account Category";
        Cust."Principle Member" := MemberApplication."Principle Member";
        Cust."Country Of Operation" := MemberApplication."Country Of Operation";
        Cust.Status := Cust.Status::New;
        // Cust."Region Code" := MemberApplication."Electrol Zone";
        // Cust."Region Code Name" := MemberApplication."Electrol Zone Descr.";
        Cust."Area Service Center" := MemberApplication."Area Service Center";
        Cust."Responsibility Center" := MemberApplication."Responsibility Center";
        Cust."Employer Code" := MemberApplication."Employer Code";
        Cust."Employer Name" := MemberApplication."Employer Name";
        Cust."Home Address" := MemberApplication."Home Address";
        Cust."Payroll/Staff No." := MemberApplication."Payroll/Staff No.";
        Cust."Recruited By" := MemberApplication."Recruited By";
        Cust."Marital Status" := MemberApplication."Marital Status";
        Cust."Customer Type" := MemberApplication."Group Type";
        Cust.Gender := MemberApplication.Gender;
        Cust."Dividend Payment Method" := MemberApplication."Dividend Payment Method";
        Cust."Type of Business" := MemberApplication."Type of Business";
        Cust."Other Business Type" := MemberApplication."Other Business Type";
        Cust."Ownership Type" := MemberApplication."Ownership Type";
        Cust."Other Account Type" := MemberApplication."Other Account Type";
        Cust."Nature of Business" := MemberApplication."Nature of Business";
        Cust."Company Registration No." := MemberApplication."Company Registration No.";
        Cust."Date of Business Reg." := MemberApplication."Date of Business Reg.";
        Cust."Business/Group Location" := MemberApplication."Business/Group Location";
        Cust."Plot/Bldg/Street/Road" := MemberApplication."Plot/Bldg/Street/Road";
        Cust."Group Account" := MemberApplication."Group Account";
        Cust."Group Type" := MemberApplication."Group Type";
        Cust.Type := MemberApplication.Type;
        Cust."Group Account No." := MemberApplication."Group Account No.";
        Cust."Bank Code" := MemberApplication."Bank Code";
        Cust."Branch Code" := MemberApplication."Branch Code";
        Cust."Single Party/Multiple" := MemberApplication."Single Party/Multiple/Business";
        Cust."Bank Account No." := MemberApplication."Bank Account No.";
        Cust."Application No." := MemberApplication."No.";
        Cust."Global Dimension 1 Code" := MemberApplication."Global Dimension 1 Code";
        Cust."Global Dimension 2 Code" := MemberApplication."Global Dimension 2 Code";
        Cust."Tax Exempted" := MemberApplication."Tax Exempted";
        Cust."Created By" := MemberApplication."Created By";
        Cust."E-Mail" := MemberApplication."E-Mail";
        Cust.Salutation := MemberApplication.Salutation;
        Cust."ID Card" := MemberApplication."ID Card";
        Cust."ID Card Back" := MemberApplication."ID Card Back";
        Cust."Constitution Provided" := MemberApplication."Constitution Provided";
        Cust."Group Minutes Provided" := MemberApplication."Group Minutes Provided";
        Cust."Membership Option" := MemberApplication."Membership Option";
        Cust."Virtual Members" := MemberApplication."Virtual Member";

        // if MemberApplication.Source = MemberApplication.Source::Agency then begin
        //     Cust."BSS Registered" := true;
        //     if VirtualRegistrations.Get(MemberApplication."ID No.") then begin
        //         Cust."ID No." := VirtualRegistrations."ID/Passport";
        //         Cust.Name := VirtualRegistrations."Full Names";
        //         case VirtualRegistrations.Gender of
        //             VirtualRegistrations.Gender::Male:
        //                 Cust.Gender := Cust.Gender::Male;
        //             VirtualRegistrations.Gender::Female:
        //                 Cust.Gender := Cust.Gender::Female;
        //         end;
        //         Cust."First Name" := VirtualRegistrations."First Name";
        //         Cust."Second Name" := VirtualRegistrations."Second Name";
        //         Cust."Last Name" := VirtualRegistrations."Last Name";
        //         Cust."Date of Birth" := VirtualRegistrations."IPRS Date Of Birth";
        //     end;
        // end;



        Cust.Insert(true);

        //.
        MemberApplication.CalcFields(Signature, Picture);

        case MemberApplication."Single Party/Multiple/Business" of
            MemberApplication."single party/multiple/business"::Single:
                begin
                    if MemberApplication."ID No." = '' then
                        IDNumber := MemberApplication."Passport No."
                    else
                        IDNumber := MemberApplication."ID No.";

                    ImageData."ID Number" := IDNumber;
                    ImageData.Picture := MemberApplication.Picture;
                    ImageData.Signature := MemberApplication.Signature;
                    ImageData."Member No" := Cust."No.";
                    if MemberApplication.Source = MemberApplication.Source::Agency then begin
                        // if AgentBiometricData.Get(IDNumber) then begin
                        //     // AgentBiometricData.CalcFields(FingerFour, FingerOne, FingerThree, FingerTwo);
                        //     ImageData.FingerOne := AgentBiometricData.FingerOne;
                        //     ImageData.FingerTwo := AgentBiometricData.FingerTwo;
                        //     ImageData.FingerThree := AgentBiometricData.FingerThree;
                        //     ImageData.FingerFour := AgentBiometricData.FingerFour;
                        // end;
                    end;
                    ImageData.Insert(true);
                end;

            MemberApplication."single party/multiple/business"::Multiple, MemberApplication."single party/multiple/business"::Business:
                begin
                    if MemberApplication."Company Registration No." = '' then
                        IDNumber := MemberApplication."P.I.N Number"
                    else
                        IDNumber := MemberApplication."Company Registration No.";

                    ImageData."ID Number" := IDNumber;
                    ImageData.Picture := MemberApplication.Picture;
                    ImageData.Signature := MemberApplication.Signature;
                    ImageData."Member No" := Cust."No.";
                    ImageData.Insert(true);
                end;
        end;

        if MemberApplication.Picture.Hasvalue then begin
            Clear(MemberApplication.Picture);
            MemberApplication.Modify;
        end;

        if MemberApplication.Signature.Hasvalue then begin
            Clear(MemberApplication.Signature);
            MemberApplication.Modify;
        end;

        NextOfKinApp.Reset;
        NextOfKinApp.SetRange(NextOfKinApp."Account No", MemberApplication."No.");
        if NextOfKinApp.Find('-') then begin
            repeat
                NextOfKin.Init;
                NextOfKin."Entry No." := NextOfKinApp."Entry No.";
                NextOfKin."Account No" := Cust."No.";
                NextOfKin.Name := UpperCase(NextOfKinApp.Name);
                NextOfKin.Relationship := NextOfKinApp.Relationship;
                NextOfKin.Beneficiary := NextOfKinApp.Beneficiary;
                NextOfKin."Date of Birth" := NextOfKinApp."Date of Birth";
                NextOfKin.Address := NextOfKinApp.Address;
                NextOfKin.Telephone := NextOfKinApp.Telephone;
                NextOfKin."Date Captured" := NextOfKinApp."Date Captured";
                NextOfKin.Fax := NextOfKinApp.Fax;
                NextOfKin.Email := NextOfKinApp.Email;
                NextOfKin."ID No." := NextOfKinApp."ID No.";
                NextOfKin."%Allocation" := NextOfKinApp."%Allocation";
                NextOfKin.Type := NextOfKinApp.Type;
                NextOfKin."BBF Entitlement" := NextOfKinApp."BBF Entitlement";
                NextOfKin."BBF Entitlement Code" := NextOfKinApp."BBF Entitlement Code";
                NextOfKin.Insert;
            until NextOfKinApp.Next = 0;
        end;




        // AccountSignApp.Reset;
        // AccountSignApp.SetRange(AccountSignApp."Account No", MemberApplication."No.");
        // if AccountSignApp.Find('-') then begin
        //     repeat
        //         AccountSign.Init;
        //         AccountSign."Entry No" := AccountSignApp."Entry No";
        //         AccountSign."Account No" := Cust."No.";
        //         AccountSign.Names := UpperCase(AccountSignApp.Names);
        //         AccountSign."Date Of Birth" := AccountSignApp."Date Of Birth";
        //         AccountSign."Staff/Payroll" := AccountSignApp."Staff/Payroll";
        //         AccountSign."ID Number" := AccountSignApp."ID Number";
        //         AccountSign.Signatory := AccountSignApp.Signatory;
        //         AccountSign."Must Sign" := AccountSignApp."Must Sign";
        //         AccountSign."Must be Present" := AccountSignApp."Must be Present";
        //         AccountSignApp.CalcFields(AccountSignApp.Signature, AccountSignApp.Picture);
        //         AccountSign.Picture := AccountSignApp.Picture;
        //         AccountSign.Signature := AccountSignApp.Signature;
        //         AccountSign.Type := AccountSignApp.Type;
        //         AccountSign."Account Type" := AccountSignApp."Account Type";
        //         AccountSign."Expiry Date" := AccountSignApp."Expiry Date";
        //         AccountSign."Phone No." := AccountSignApp."Phone No.";
        //         AccountSign.Insert;

        //         if AccountSignApp.Picture.Hasvalue then begin
        //             Clear(AccountSignApp.Signature);
        //             AccountSignApp.Modify;
        //         end;

        //         if AccountSignApp.Signature.Hasvalue then begin
        //             Clear(AccountSignApp.Signature);
        //             AccountSignApp.Modify;
        //         end;
        //     until AccountSignApp.Next = 0;
        // end;
        // AccountSignApp.Reset;
        // AccountSignApp.SetRange(AccountSignApp."Account No", MemberApplication."No.");
        // if AccountSignApp.Find('-') then begin
        //     repeat
        //         GroupMembers.Reset;
        //         GroupMembers.SetRange("No.", AccountSignApp."Member No.");
        //         if GroupMembers.FindFirst then begin

        //             GroupMembers."Group Account No." := Cust."No.";
        //             GroupMembers."Customer Type" := GroupMembers."customer type"::"Micro finance";
        //             GroupMembers."Account Category" := GroupMembers."account category"::Member;
        //             GroupMembers.Modify;
        //         end;
        //         GrAccounts.Reset;
        //         GrAccounts.SetRange("Member No.", AccountSignApp."Member No.");
        //         if GrAccounts.FindFirst then begin
        //             repeat
        //                 GrAccounts."Group Account No" := Cust."No.";
        //                 GrAccounts.Modify;
        //             until GrAccounts.Next = 0;
        //         end;

        //     until AccountSignApp.Next = 0;
        // end;

        DefaultSavAccReg.Reset;
        DefaultSavAccReg.SetRange(DefaultSavAccReg."No.", MemberApplication."No.");
        if DefaultSavAccReg.Find('-') then begin
            repeat
                if ProductFactory.Get(DefaultSavAccReg."Product Type") then
                    SavingsAcc.Init;
                //SuffixText := ProductFactory."Account No. Suffix" + FORMAT(Suffix);
                SuffixText := ProductFactory."Account No. Suffix";
                /*IF STRLEN(SuffixText) = 3 THEN
                 SuffixText:=COPYSTR(SuffixText,2);
                IF STRLEN(SuffixText) = 4 THEN
                 SuffixText:=COPYSTR(SuffixText,3);
                IF STRLEN(SuffixText) = 5 THEN
                 SuffixText:=COPYSTR(SuffixText,4);*/
                /* IF Suffix  < 10 THEN
                  SuffixText := ProductFactory."Account No. Suffix" + FORMAT(Suffix)
                 ELSE
                  SuffixText := FORMAT(Suffix);*/

                SavAcc.Reset;
                SavAcc.SetRange("Member No.", Cust."No.");
                SavAcc.SetRange("Product Type", ProductFactory."Product ID");
                if SavAcc.Find('-') then begin
                    repeat
                        i += 1;
                    until SavAcc.Next = 0;
                end;


                SavingsAcc."No." := ProductFactory."Account No. Prefix" + Cust."No." + SuffixText;
                //SavingsAcc."No.":=ProductFactory."Account No. Prefix"+Cust."No."+{+'-'+}ProductFactory."Account No. Suffix"{SuffixText};
                SavingsAcc.Validate(SavingsAcc.Name, Cust.Name);
                SavingsAcc."ID No." := MemberApplication."ID No.";
                SavingsAcc."Passport No." := MemberApplication."Passport No.";
                //**SavingsAcc.VALIDATE(SavingsAcc."Monthly Contribution");
                SavingsAcc."Virtual Member" := MemberApplication."Virtual Member";
                SavingsAcc."Customer Posting Group" := ProductFactory."Product Posting Group";
                SavingsAcc.County := MemberApplication.City;
                SavingsAcc."Phone No." := MemberApplication."Phone No.";
                SavingsAcc."Mobile Phone No" := MemberApplication."Mobile Phone No";
                SavingsAcc."Current Address" := MemberApplication."Current Address";
                SavingsAcc."Post Code" := MemberApplication."Post Code";
                SavingsAcc.City := MemberApplication.City;
                SavingsAcc.Status := SavingsAcc.Status::New;
                SavingsAcc."Country/Region Code" := MemberApplication.Nationality;
                SavingsAcc."Home Address" := MemberApplication."Home Address";
                SavingsAcc."Registration Date" := Today;
                SavingsAcc."Recruited by Type" := MemberApplication."Recruited by Type";
                SavingsAcc."Relationship Manager" := MemberApplication."Relationship Manager";
                SavingsAcc."Date of Birth" := MemberApplication."Date of Birth";
                SavingsAcc."Birth Certificate No." := MemberApplication."Birth Certificate No.";
                SavingsAcc."Payroll/Staff No." := MemberApplication."Payroll/Staff No.";
                SavingsAcc."Recruited By" := MemberApplication."Recruited By";
                SavingsAcc.Gender := MemberApplication.Gender;
                SavingsAcc."Member Category" := MemberApplication."Member Category";
                SavingsAcc."Marital Status" := MemberApplication."Marital Status";
                SavingsAcc."Old Member No." := MemberApplication."Old Member No.";
                SavingsAcc."Associated Member No." := MemberApplication."Associated Member No.";
                SavingsAcc."Responsibility Center" := MemberApplication."Responsibility Center";
                SavingsAcc."Company Registration No." := MemberApplication."Company Registration No.";
                SavingsAcc."Employer Code" := MemberApplication."Employer Code";
                SavingsAcc."Single Party/Multiple/Business" := MemberApplication."Single Party/Multiple/Business";
                SavingsAcc."Global Dimension 1 Code" := MemberApplication."Global Dimension 1 Code";
                SavingsAcc."Global Dimension 2 Code" := MemberApplication."Global Dimension 2 Code";
                SavingsAcc."Group Account No" := MemberApplication."Group Account No.";
                SavingsAcc."Created By" := MemberApplication."Created By";
                if MemberApplication."Group Account" then begin
                    Category.Reset;
                    Category.SetRange("No.", MemberApplication."Member Category");
                    if Category.FindFirst then begin
                        if DefaultSavAccReg."Product Category" = DefaultSavAccReg."product category"::"Deposit Contribution" then begin
                            SavingsAcc."Monthly Contribution" := Category."Default Share Deposit";
                        end else
                            if DefaultSavAccReg."Product Category" = DefaultSavAccReg."product category"::"Registration Fee" then begin
                                SavingsAcc."Monthly Contribution" := Category."Registration Fee";
                            end else
                                if DefaultSavAccReg."Product Category" = DefaultSavAccReg."product category"::"Share Capital" then begin
                                    SavingsAcc."Monthly Contribution" := Category."Share Capital";
                                end;
                    end;
                end else
                    SavingsAcc."Monthly Contribution" := DefaultSavAccReg."Monthly Contribution";

                if ProductFactory.Get(DefaultSavAccReg."Product Type") then begin
                    if not ProductFactory."Loan Disbursement Account" then
                        SavingsAcc."Loan Disbursement Account" := false
                    else
                        SavingsAcc."Loan Disbursement Account" := true;
                    if SavingsAcc."Loan Disbursement Account" = true then
                        FOSAACC := SavingsAcc."No.";

                    SavingsAcc."Product Category" := ProductFactory."Product Category";
                    if MemberApplication."Membership Option" = MemberApplication."membership option"::Agent then begin
                        if ProductFactory."Product Category" = ProductFactory."product category"::"Agent Account" then begin
                            FOSAACC := SavingsAcc."No.";
                        end;
                    end;
                end;
                SavingsAcc."Product Type" := DefaultSavAccReg."Product Type";
                SavingsAcc."Product Name" := DefaultSavAccReg."Product Name";
                SavingsAcc."Member No." := Cust."No.";
                SavingsAcc.Insert;

                //Advice
                if MemberApplication."Member Segment" = 'CHECKOFF' then begin
                    if (SavingsAcc."Product Category" = SavingsAcc."product category"::"Deposit Contribution") or
                    (SavingsAcc."Product Category" = SavingsAcc."product category"::Benevolent) or
                    (SavingsAcc."Product Category" = SavingsAcc."product category"::"Registration Fee") then begin
                        // AdviceSavings(SavingsAcc, SavingsAcc."Monthly Contribution", SavingsAcc."Monthly Contribution");
                    end;
                end;
                //Advice

                //Accrue Registration Fee
                CompanyInformation.Get();
                if CompanyInformation."Accrue Registration Fee" = true then begin
                    if ProductFactory."Product Category" = ProductFactory."product category"::"Registration Fee" then begin
                        GeneralSetUp.Get();
                        // Temp.Get(UserId);
                        // AccountNo := '';
                        // Jtemplate := Temp."Accrual. Fee.Journal Template";
                        // JBatch := Temp."Accrual. Fee. Journal Batch";

                        if Jtemplate = '' then begin
                            Error(Text0001);
                        end;
                        if JBatch = '' then begin
                            Error(Text0002);
                        end;



                        GenJournalLine.Reset;
                        GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                        GenJournalLine.SetRange("Journal Batch Name", JBatch);
                        GenJournalLine.DeleteAll;
                        AccountNo := SavingsAcc."No.";
                        LineNo := LineNo + 10000;
                        GenJournalLine.Init;
                        GenJournalLine."Journal Template Name" := Jtemplate;
                        GenJournalLine."Journal Batch Name" := JBatch;
                        GenJournalLine."Line No." := LineNo;
                        GenJournalLine."Document No." := AccountNo;
                        GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
                        GenJournalLine."Account No." := AccountNo;
                        GenJournalLine."External Document No." := AccountNo;
                        GenJournalLine.Validate(GenJournalLine."Account No.");
                        GenJournalLine."Posting Date" := Today;
                        GenJournalLine.Description := 'Registration Fee' + AccountNo;
                        GenJournalLine.Amount := GeneralSetUp."Registration Fee";
                        GenJournalLine.Validate(GenJournalLine.Amount);
                        GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
                        GenJournalLine."Bal. Account No." := ProductFactory."Accrual Fee Acc. (Income)";
                        GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                        GenJournalLine."Shortcut Dimension 1 Code" := MemberApplication."Global Dimension 1 Code";
                        GenJournalLine."Shortcut Dimension 2 Code" := MemberApplication."Global Dimension 2 Code";
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                        GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                        if GenJournalLine.Amount <> 0 then
                            GenJournalLine.Insert;
                        //Post
                        GenJournalLine.Reset;
                        GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                        GenJournalLine.SetRange("Journal Batch Name", JBatch);
                        if GenJournalLine.Find('-') then begin
                            // Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
                        end;
                        //Post

                    end;
                end;
            until DefaultSavAccReg.Next = 0;
        end;

        // CustMembrDocuments.Reset;
        // CustMembrDocuments.SetRange(CustMembrDocuments."Reference No.", MemberApplication."No.");
        // if CustMembrDocuments.Find('-') then begin
        //     repeat
        //         EntrNo += 1;
        //         ApplicationDocuments(EntrNo, CustMembrDocuments."Document Type", CustMembrDocuments."Document No.", CustMembrDocuments.Description, CustMembrDocuments."Single Party/Multiple",
        //                              Cust."No.", CustMembrDocuments."Product ID", CustMembrDocuments."Product Name", CustMembrDocuments.Provided);
        //     until CustMembrDocuments.Next = 0;
        // end;

        // CustSocialListenSite.Reset;
        // CustSocialListenSite.SetRange(CustSocialListenSite."Account No.", MemberApplication."No.");
        // if CustSocialListenSite.Find('-') then begin
        //     repeat
        //         EntrNo += 1;
        //         SocialSiteListening(EntrNo, Cust."No.", CustSocialListenSite.Address);
        //     until CustSocialListenSite.Next = 0;
        // end;
        // if MemberApplication."Auto Apply ATM" = true then
        //     ApplyATMandMSACCO(MemberApplication, FOSAACC);
        // PostRegistrationDeposit(Cust."No.", MemberApplication."Agent Doc No", '02', 0);
        MsgT := 'You have been approved as a member at ';
        MsgTT := ' and FOSA Account No is: ';
        if MemberApplication."Membership Option" = MemberApplication."membership option"::Agent then begin
            MsgT := 'You have been approved as a agent at ';
            MsgTT := '.';
        end else begin
            MsgT := 'You have been approved as a member at ';
            MsgTT := ' and FOSA Account No is: ' + FOSAACC + '.';
        end;

        // SendSMS.SendSms(Sourcetype::"New Member", MemberApplication."Mobile Phone No", MsgT +
        //                 COMPANYNAME + ', ' + Text003 + Cust."No." + MsgTT, MemberApplication."No.", Cust."No.", false);

        // if Cust."Virtual Members" then begin
        //     MsgTT := 'Dear ' + MemberApplication."First Name" + ', to complete your membership registration kindly deposit registration fee of Kshs 1000 to paybill 525200, Account ' +
        //     '02' + Cust."No." + '. Thank you for Saving with us.';
        //     SendSMS.SendSms(Sourcetype::"New Member", MemberApplication."Mobile Phone No", MsgTT, MemberApplication."No.", Cust."No.", false);
        // end;

        //Denis Create Member file in file movement
        // FileTracker.Init;
        // FileTracker."File Number" := Cust."No.";
        // FileTracker."Member Name" := Cust.Name;
        // FileTracker."Staff No" := Cust."Payroll/Staff No.";
        // FileTracker."File Created By" := UserId;
        // FileTracker."File Creation Date" := Today;
        // FileTracker."ID No." := Cust."ID No.";
        // FileTracker.Create := true;
        // FileTracker."File MVT User ID" := UserId;
        // FileTracker.Insert;
        //end of creation of file

        Message(Text008, Cust."No.");
        if MemberApplication."Principle Member" <> '' then begin
            Cust.Reset;
            Cust.SetRange("No.", MemberApplication."Principle Member");
            // if Cust.FindFirst then begin
            //     SendSMS.SendSms(Sourcetype::"New Member", Cust."Mobile Phone No", Text0003 + ' ' + MemberApplication.Name + ', ' +
            //                     COMPANYNAME + ', ', MemberApplication."No.", Cust."No.", false);

            // end;
        end;
        MemberApplication.Status := MemberApplication.Status::Created;
        MemberApplication.Modify;

    end;


    // procedure AccountRegistration(AccountApplication: Record 52185704)
    // var
    //     SavingsAcc: Record 52185730;
    //     AccountSignApp: Record 52185697;
    //     AccountSign: Record 52185703;
    //     GenSetUp: Record 52185689;
    //     ProductFactory: Record 52185690;
    //     Suffix: Integer;
    //     SuffixText: Text;
    //     PeriodicAcc: Codeunit "Periodic Activities";
    //     IDNumber: Code[20];
    //     ImageData: Record 52185702;
    //     SavingsAccounts: Record 52185730;
    //     CustMembrDocuments: Record 52185726;
    //     Text001: label 'This application has not been approved.';
    //     Text002: label 'Are you sure you want to convert this application to Account?';
    //     Text003: label 'Account No. %1 created successfully.';
    //     Members: Record 52185700;
    // begin
    //     if StrLen(AccountApplication."Transaction Mobile No") < 15 then begin
    //         AccountApplication."Transaction Mobile No" := '';
    //         AccountApplication.Modify;
    //     end;
    //     Members.Get(AccountApplication."Member No.");
    //     //IF NOT CONFIRM(Text002) =TRUE THEN EXIT;

    //     //check if member has same type of product account and add a suffix if the product factory allows multiple accounts
    //     SavingsAcc.Reset;
    //     SavingsAcc.SetRange(SavingsAcc."Member No.", AccountApplication."Member No.");
    //     SavingsAcc.SetRange(SavingsAcc."Product Type", AccountApplication."Product Type");
    //     Suffix := SavingsAcc.Count;

    //     SavingsAcc.Init;
    //     if ProductFactory.Get(AccountApplication."Product Type") then
    //         SuffixText := ProductFactory."Account No. Suffix" + Format(Suffix);
    //     if StrLen(SuffixText) = 3 then
    //         SuffixText := CopyStr(SuffixText, 2);
    //     if StrLen(SuffixText) = 4 then
    //         SuffixText := CopyStr(SuffixText, 3);
    //     if StrLen(SuffixText) = 5 then
    //         SuffixText := CopyStr(SuffixText, 4);
    //     SavingsAcc."No." := ProductFactory."Account No. Prefix" + AccountApplication."Member No." + '0' + SuffixText;
    //     SavingsAcc."Product Type" := AccountApplication."Product Type";
    //     SavingsAcc."Product Name" := ProductFactory."Product Description";
    //     SavingsAcc."Virtual Member" := Members."Virtual Members";
    //     SavingsAcc."Member No." := AccountApplication."Member No.";
    //     SavingsAcc.Validate(SavingsAcc.Name, AccountApplication.Name);
    //     SavingsAcc."ID No." := AccountApplication."ID No.";
    //     SavingsAcc."Passport No." := AccountApplication."Passport No.";
    //     SavingsAcc."Customer Posting Group" := ProductFactory."Product Posting Group";
    //     SavingsAcc.County := AccountApplication.City;
    //     SavingsAcc."Monthly Contribution" := AccountApplication."Monthly Contribution";
    //     SavingsAcc.Validate(SavingsAcc."Monthly Contribution");
    //     SavingsAcc."Phone No." := AccountApplication."Phone No.";
    //     SavingsAcc."Mobile Phone No" := AccountApplication."Mobile Phone No";
    //     SavingsAcc."Current Address" := AccountApplication."Current Address";
    //     SavingsAcc."Post Code" := AccountApplication."Post Code";
    //     SavingsAcc.City := AccountApplication.City;
    //     SavingsAcc."Member Category" := AccountApplication."Member Category";
    //     SavingsAcc.Status := SavingsAcc.Status::New;
    //     SavingsAcc."Parent Account No." := AccountApplication."Parent Account No.";
    //     SavingsAcc."Country/Region Code" := AccountApplication."Country/Region Code";
    //     SavingsAcc."Home Address" := AccountApplication."Home Address";
    //     SavingsAcc."Registration Date" := Today;
    //     SavingsAcc."Date of Birth" := AccountApplication."Date of Birth";
    //     SavingsAcc."Birth Certificate No." := AccountApplication."Birth Certificate No.";
    //     SavingsAcc."Payroll/Staff No." := AccountApplication."Payroll/Staff No.";
    //     SavingsAcc."Recruited By" := AccountApplication."Recruited By";
    //     SavingsAcc.Gender := AccountApplication.Gender;
    //     SavingsAcc."Recruited by Type" := AccountApplication."Recruited by Type";
    //     SavingsAcc."Relationship Manager" := AccountApplication."Relationship Manager";
    //     SavingsAcc."Marital Status" := AccountApplication."Marital Status";
    //     SavingsAcc."Responsibility Center" := AccountApplication."Responsibility Center";
    //     SavingsAcc."Company Registration No." := AccountApplication."Company Registration No.";
    //     SavingsAcc."Employer Code" := AccountApplication."Employer Code";
    //     SavingsAcc."Old Member No." := AccountApplication."Old Member No.";
    //     SavingsAcc."Associated Member No." := AccountApplication."Associated Member No.";
    //     SavingsAcc."Global Dimension 1 Code" := AccountApplication."Global Dimension 1 Code";
    //     SavingsAcc."Global Dimension 2 Code" := AccountApplication."Global Dimension 2 Code";
    //     SavingsAcc."Group Account No" := AccountApplication."Group Account No";
    //     SavingsAcc."Created By" := AccountApplication."Created By";
    //     SavingsAcc."Savings Account No." := AccountApplication."Savings Account No.";
    //     SavingsAcc."Fixed Deposit Type" := AccountApplication."Fixed Deposit Type";
    //     SavingsAcc."Product Category" := AccountApplication."Product Category";
    //     if SavingsAcc."Product Category" = SavingsAcc."product category"::"Fixed Deposit" then
    //         SavingsAcc."Fixed Deposit Status" := AccountApplication."fixed deposit status"::Active;
    //     SavingsAcc."FD Maturity Date" := AccountApplication."FD Maturity Date";
    //     SavingsAcc."Neg. Interest Rate" := AccountApplication."Neg. Interest Rate";
    //     SavingsAcc."FD Duration" := AccountApplication."FD Duration";
    //     SavingsAcc."FD Maturity Instructions" := AccountApplication."FD Maturity Instructions";
    //     SavingsAcc."Fixed Deposit cert. no" := AccountApplication."Fixed Deposit cert. no";
    //     SavingsAcc."Fixed Deposit Amount" := AccountApplication."Fixed Deposit Amount";
    //     SavingsAcc."Signing Instructions" := AccountApplication."Signing Instructions";
    //     SavingsAcc.Insert;

    //     case AccountApplication."Product Category" of
    //         AccountApplication."product category"::"Junior Savings":
    //             begin
    //                 AccountApplication.CalcFields(AccountApplication.Picture, AccountApplication.Signature);
    //                 if (AccountApplication."Birth Certificate No." = '') and (AccountApplication."Passport No." <> '') then
    //                     IDNumber := AccountApplication."Passport No.";
    //                 if (AccountApplication."Birth Certificate No." <> '') and (AccountApplication."Passport No." = '') then
    //                     IDNumber := AccountApplication."Birth Certificate No.";
    //                 if (AccountApplication."Birth Certificate No." <> '') and (AccountApplication."Passport No." <> '') then
    //                     IDNumber := AccountApplication."Birth Certificate No.";

    //                 AccountApplication.CalcFields(AccountApplication.Picture, AccountApplication.Signature);

    //                 ImageData."ID Number" := IDNumber;
    //                 ImageData.Picture := AccountApplication.Picture;
    //                 ImageData.Signature := AccountApplication.Signature;
    //                 ImageData."Member No" := SavingsAcc."No.";
    //                 ImageData.Insert(true);

    //                 if AccountApplication.Picture.Hasvalue then begin
    //                     Clear(AccountApplication.Picture);
    //                     AccountApplication.Modify;
    //                 end;

    //                 if AccountApplication.Signature.Hasvalue then begin
    //                     Clear(AccountApplication.Signature);
    //                     AccountApplication.Modify;
    //                 end;

    //             end;
    //     end;

    //     CustMembrDocuments.Reset;
    //     CustMembrDocuments.SetRange(CustMembrDocuments."Reference No.", SavingsAcc."Member No.");
    //     if CustMembrDocuments.Find('-') then begin
    //         repeat
    //             EntrNo += 1;
    //             ApplicationDocuments(EntrNo, CustMembrDocuments."Document Type", CustMembrDocuments."Document No.", CustMembrDocuments.Description, CustMembrDocuments."Single Party/Multiple",
    //                                  SavingsAcc."Member No.", CustMembrDocuments."Product ID", CustMembrDocuments."Product Name", CustMembrDocuments.Provided);
    //         until CustMembrDocuments.Next = 0;
    //     end;


    //     //Advice
    //     if SavingsAccounts.Get(SavingsAcc."No.") then begin
    //         SavingsAccounts.Validate(SavingsAccounts."Monthly Contribution");
    //     end;
    //     //******

    //     PostRegistrationDeposit(SavingsAcc."Member No.", AccountApplication."Agent Document No", SavingsAcc."Product Type", 0);


    //     SendSMS.SendSms(Sourcetype::"New Account", SavingsAcc."Mobile Phone No", Text004 +
    //                    COMPANYNAME + ', ' + Text005 + SavingsAccounts."No.", SavingsAcc."No.", SavingsAccounts."No.", false);

    //     AccountApplication.Status := AccountApplication.Status::Created;
    //     AccountApplication.Modify;
    //     Message(Text003, SavingsAcc."No.");
    // end;

    
    // procedure DeactivateReactive(DeactivateReactivateHeader: Record 52185753)
    // var
    //     SAccounts: Record 52185730;
    //     MAccount: Record 52185700;
    //     SuccessfullyChanged: label 'Sucessfully changed.';
    //     MSstatus: Option " ",New,Active,Dormant,Frozen,"Withdrawal Application",Withdrawn,Deceased,Defaulter,Closed;
    //     StartTxt: label 'You appliaction to adjust account information as been received by ';
    //     EndTxt: label 'on Member No. ';
    //     GenJournalLine: Record "Gen. Journal Line";
    //     UserSetup: Record "User Setup";
    //     AccountNo: Code[50];
    //     LineNo: Integer;
    //     AccountSign: Record 52185703;
    // begin
    //     DeactivateReactivateHeader.SetRange(DeactivateReactivateHeader."No.", DeactivateReactivateHeader."No.");
    //     DeactivateReactivateHeader.SetCurrentkey("No.", "Application Date");
    //     if DeactivateReactivateHeader.Find('-') then begin
    //         MSstatus := DeactivateReactivateHeader."Account Status";

    //         if DeactivateReactivateHeader."Account Type" = DeactivateReactivateHeader."account type"::Member then begin

    //             MAccount.Reset;
    //             MAccount.SetRange(MAccount."No.", DeactivateReactivateHeader."Account No.");
    //             if MAccount.Find('-') then begin
    //                 // DeactivateReactivateHeader.Tracker(MAccount);
    //             end;
    //         end;

    //         if DeactivateReactivateHeader."Account Type" = DeactivateReactivateHeader."account type"::Savings then begin
    //             if SAccounts.Get(DeactivateReactivateHeader."Account No.") then begin
    //                 // DeactivateReactivateHeader.TrackerII(SavingsAccounts);
    //             end;
    //         end;

    //         /*IF Cust.GET(DeactivateReactivateHeader."Member No.") THEN BEGIN
    //          IF DeactivateReactivateHeader."Member No." <> '' THEN
    //          SendSMS.SendSms(SourceType::"Member Changes",Cust."Mobile Phone No",StartTxt +
    //                          COMPANYNAME +', '+ EndTxt + Cust."No.",DeactivateReactivateHeader."No.",
    //                          Cust."No.",FALSE);
    //         END;*/

    //         DeactivateReactivateHeader.Status := DeactivateReactivateHeader.Status::Processed;
    //         DeactivateReactivateHeader.Modify;
    //         if DeactivateReactivateHeader."Remove From Group" <> '' then begin
    //             if Confirm('This Action will remove member ' + DeactivateReactivateHeader.Name + ' from accoount: '
    //               + DeactivateReactivateHeader."Remove From Group" + ', do you wish to proceed?', false) = true then begin
    //                 AccountSign.Reset;
    //                 AccountSign.SetRange(AccountSign."Account No", DeactivateReactivateHeader."Remove From Group");
    //                 AccountSign.SetRange(AccountSign."Member No.", DeactivateReactivateHeader."Account No.");
    //                 if AccountSign.Find('-') then begin
    //                     AccountSign.DeleteAll;
    //                     if Cust.Get(DeactivateReactivateHeader."Account No.") then
    //                         if Cust."Group Account No." = DeactivateReactivateHeader."Remove From Group" then begin
    //                             Cust."Group Account No." := '';
    //                             Cust.Modify;
    //                         end;
    //                 end;
    //             end;
    //         end;


    //         Message(SuccessfullyChanged);


    //         if DeactivateReactivateHeader."Type of Account Change" <> DeactivateReactivateHeader."type of account change"::None then begin

    //             TransactionTypes.Reset;
    //             TransactionTypes.SetRange(Code, DeactivateReactivateHeader."Charge Transaction Type");
    //             if TransactionTypes.Find('-') then begin

    //                 TransactionCharges.Reset;
    //                 TransactionCharges.SetRange("Transaction Type", TransactionTypes.Code);
    //                 if TransactionCharges.Find('-') then begin
    //                     if DeactivateReactivateHeader."Account Type" = DeactivateReactivateHeader."account type"::Savings then begin
    //                         SavingsAcc.Reset;
    //                         SavingsAcc.SetRange("No.", DeactivateReactivateHeader."Account No.");
    //                         SavingsAcc.SetRange("Loan Disbursement Account", true);
    //                         //SavingsAcc.SETRANGE(Status,SavingsAcc.Status::Dormant);
    //                         if SavingsAcc.Find('-') then begin
    //                             if SavingsAcc.Blocked <> SavingsAcc.Blocked::" " then begin
    //                                 SavingsAcc.Blocked := SavingsAcc.Blocked::" ";
    //                                 SavingsAcc.Status := SavingsAcc.Status::Active;
    //                                 SavingsAcc.Modify;
    //                             end;
    //                             //ERROR('Here1');
    //                             GeneralSetUp.Get();
    //                             Temp.Get(UserId);
    //                             //AccountNo:='';
    //                             Jtemplate := Temp."Cashier Journal Template";
    //                             Jbatch := Temp."Cashier Journal Batch";

    //                             if Jtemplate = '' then begin
    //                                 Error(Text0001);
    //                             end;
    //                             if Jbatch = '' then begin
    //                                 Error(Text0002);
    //                             end;
    //                             GenJournalLine.Reset;
    //                             GenJournalLine.SetRange("Journal Template Name", Jtemplate);
    //                             GenJournalLine.SetRange("Journal Batch Name", Jbatch);
    //                             GenJournalLine.DeleteAll;

    //                             AccountNo := SavingsAcc."No.";
    //                             LineNo := LineNo + 10000;
    //                             GenJournalLine.Init;
    //                             GenJournalLine."Journal Template Name" := Jtemplate;
    //                             GenJournalLine."Journal Batch Name" := Jbatch;
    //                             GenJournalLine."Line No." := LineNo;
    //                             GenJournalLine."Document No." := AccountNo;
    //                             GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
    //                             GenJournalLine."Account No." := AccountNo;
    //                             GenJournalLine."External Document No." := AccountNo;
    //                             GenJournalLine.Validate(GenJournalLine."Account No.");
    //                             GenJournalLine."Posting Date" := Today;
    //                             GenJournalLine.Description := 'Dormant Account Activation Fee' + '-' + AccountNo;
    //                             GenJournalLine.Amount := TransactionCharges."Charge Amount";//GeneralSetUp."Registration Fee";
    //                             GenJournalLine.Validate(GenJournalLine.Amount);
    //                             GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
    //                             GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";//ProductFactory."Accrual Fee Acc. (Income)";
    //                             GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
    //                             GenJournalLine."Shortcut Dimension 1 Code" := DeactivateReactivateHeader."Global Dimension 1 Code";// ."Global Dimension 1 Code";
    //                             GenJournalLine."Shortcut Dimension 2 Code" := DeactivateReactivateHeader."Global Dimension 2 Code";// MemberApplication."Global Dimension 2 Code";
    //                             GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
    //                             GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
    //                             if GenJournalLine.Amount <> 0 then
    //                                 GenJournalLine.Insert;
    //                             if TransactionCharges."Recover Excise Duty" = true then begin
    //                                 LineNo := LineNo + 10000;
    //                                 GenJournalLine.Init;
    //                                 GenJournalLine."Journal Template Name" := Jtemplate;
    //                                 GenJournalLine."Journal Batch Name" := Jbatch;
    //                                 GenJournalLine."Line No." := LineNo;
    //                                 GenJournalLine."Document No." := AccountNo;
    //                                 GenJournalLine."Account Type" := GenJournalLine."account type"::Savings;
    //                                 GenJournalLine."Account No." := AccountNo;
    //                                 GenJournalLine."External Document No." := AccountNo;
    //                                 GenJournalLine.Validate(GenJournalLine."Account No.");
    //                                 GenJournalLine."Posting Date" := Today;
    //                                 GenJournalLine.Description := 'Excise Duty' + AccountNo;//FORMAT(DeactivateReactivateHeader."Type of Account Change")+'-'+AccountNo;
    //                                 GenJournalLine.Amount := TransactionCharges."Charge Amount" * GeneralSetUp."Excise Duty (%)" * 0.01;
    //                                 GenJournalLine.Validate(GenJournalLine.Amount);
    //                                 GenJournalLine."Bal. Account Type" := GenJournalLine."bal. account type"::"G/L Account";
    //                                 GenJournalLine."Bal. Account No." := GeneralSetUp."Excise Duty G/L";
    //                                 GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
    //                                 GenJournalLine."Shortcut Dimension 1 Code" := DeactivateReactivateHeader."Global Dimension 1 Code";// ."Global Dimension 1 Code";
    //                                 GenJournalLine."Shortcut Dimension 2 Code" := DeactivateReactivateHeader."Global Dimension 2 Code";// MemberApplication."Global Dimension 2 Code";
    //                                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
    //                                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
    //                                 if GenJournalLine.Amount <> 0 then
    //                                     GenJournalLine.Insert;
    //                             end;
    //                             //Post
    //                             GenJournalLine.Reset;
    //                             GenJournalLine.SetRange("Journal Template Name", Jtemplate);
    //                             GenJournalLine.SetRange("Journal Batch Name", Jbatch);
    //                             if GenJournalLine.Find('-') then begin
    //                                 Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);
    //                             end;
    //                             //Post
    //                         end;
    //                     end;
    //                 end;
    //             end;
    //         end;
    //     end;

    // end;


    // procedure ApplicationDocuments(EntrNo: Integer; DocumentType: Option; DocumentNo: Code[20]; Description: Text; SingleMultiple: Option; ReferenceNo: Code[20]; ProductID: Code[20]; ProductName: Text; DocProvided: Option " ",No,Yes)
    // var
    //     MemberDocuments: Record 52185727;
    // begin
    //     //MemberDocuments.SETCURRENTKEY("Entry No.");
    //     //MemberDocuments.FINDLAST;//ckigen
    //     //EntrNo:=MemberDocuments."Entry No."+1;
    //     MemberDocuments.Init;
    //     //MemberDocuments."Entry No."+=EntrNo;
    //     MemberDocuments."Document Type" := DocumentType;
    //     MemberDocuments."Document No." := DocumentNo;
    //     MemberDocuments.Description := Description;
    //     MemberDocuments."Single Party/Multiple" := SingleMultiple;
    //     MemberDocuments."Reference No." := ReferenceNo;
    //     MemberDocuments."Product ID" := ProductID;
    //     MemberDocuments."Product Name" := ProductName;
    //     MemberDocuments.Provided := DocProvided;
    //     //MemberDocuments.INSERT;
    // end;


    // procedure DormancyP(PeriodFilter: Date; SavingsAccounts: Record 52185730)
    // var
    //     ProductFactory: Record 52185690;
    //     DormancyPeriod: DateFormula;
    // begin
    //     if PeriodFilter = 0D then
    //         PeriodFilter := Today;

    //     begin
    //         SavingsAccounts.SetFilter(Status, '%1', Status::Active);
    //         SavingsAccounts.SetFilter(Blocked, '%1', Blocked::" ");
    //         SavingsAccounts.CalcFields("Last Transaction Date");

    //         // if "Last Transaction Date" <> 0D then begin
    //         //     ProductFactory.Reset;
    //         //     ProductFactory.SetFilter(ProductFactory."Dormancy Period", '<>%1', DormancyPeriod);
    //         //     if ProductFactory.Find('-') then begin
    //         //         if CalcDate(ProductFactory."Dormancy Period", "Last Transaction Date") < PeriodFilter then begin
    //         //             Status := Status::Dormant;
    //         //             "Status Change Reason" := 'Dormant Account Has Not Transacted For 3 Months';
    //         //             "Last Date Modified" := Today;
    //         //             SavingsAccounts.Modify;
    //         //         end;
    //         //     end;
    //         // end;
    //     end;
    //     /*IF "Last Transaction Date" <> 0D  THEN BEGIN
    //        ProductFactory.RESET;
    //        ProductFactory.SETFILTER(ProductFactory."Dormancy Period",'<>%1',DormancyPeriod);
    //       IF ProductFactory.FIND('-') THEN BEGIN
    //        IF CALCDATE(ProductFactory."Dormancy Period","Last Transaction Date") <
    //                    PeriodFilter THEN
    //         "Status Change Reason":='Dormant Account Has Not Transacted For 3 Months';
    //         "Last Date Modified":=TODAY;
    //            MODIFY;
    //       END;
    //      END;*/

    // end;


    // procedure SocialSiteListening(EntrN: Integer; AccountNo: Code[20]; AccountAddr: Text)
    // var
    //     SocialListeningSites: Record 52185864;
    // begin
    //     SocialListeningSites.Init;
    //     SocialListeningSites."Entry No." := EntrN;
    //     SocialListeningSites."Account No." := AccountNo;
    //     SocialListeningSites.Address := AccountAddr;
    //     SocialListeningSites.Insert;
    // end;


    // procedure CreateProduct(ProductFactoryApplication: Record 52186117)
    // var
    //     ProductFactory: Record 52185690;
    //     RelatedProductApplication: Record 52186118;
    //     RelatedProduct: Record 52185750;
    //     LoanProductChargeAppl: Record 52186119;
    //     LoanProductCharge: Record 52185734;
    //     DCSParameterMatrixAppl: Record 52186120;
    //     DCSParameterMatrix: Record 52186091;
    //     ProductApplicationDocuments: Record 52186121;
    //     ProductDocuments: Record 52185725;
    // begin
    //     ProductFactory.Init;
    //     ProductFactory."Product ID" := ProductFactoryApplication."Product ID";
    //     ProductFactory."Product Description" := ProductFactoryApplication."Product Description";
    //     ProductFactory."Product Class Type" := ProductFactoryApplication."Product Class Type";
    //     ProductFactory."Min. Customer Age" := ProductFactoryApplication."Min. Customer Age";
    //     ProductFactory."Max. Member Age" := ProductFactoryApplication."Max.Customer Age";
    //     ProductFactory."Interest Rate (Min.)" := ProductFactoryApplication."Interest Rate (Min.)";
    //     ProductFactory."Interest Rate (Max.)" := ProductFactoryApplication."Interest Rate (Max.)";
    //     ProductFactory."Dormancy Period" := ProductFactoryApplication."Dormancy Period";
    //     ProductFactory."Customer Segment" := ProductFactoryApplication."Customer Segment";
    //     ProductFactory."Closure Fee" := ProductFactoryApplication."Closure Fee";
    //     ProductFactory."Account No. Prefix" := ProductFactoryApplication."Account No. Prefix";
    //     ProductFactory."Account No. Suffix" := ProductFactoryApplication."Account No. Suffix";

    //     ProductFactory.Currency := ProductFactoryApplication.Currency;
    //     ProductFactory."Product Posting Group" := ProductFactoryApplication."Product Posting Group";
    //     ProductFactory."Loan  Account [G/L]" := ProductFactoryApplication."Loan  Account [G/L]";
    //     ProductFactory."Loan Receivable Account[G/L]" := ProductFactoryApplication."Loan Receivable Account[G/L]";
    //     ProductFactory."Loan Interest Account [G/L]" := ProductFactoryApplication."Loan Interest Account [G/L]";
    //     ProductFactory."Bill Account" := ProductFactoryApplication."Bill Account";
    //     ProductFactory."Billed Account" := ProductFactoryApplication."Billed Account";
    //     ProductFactory."Penalty Paid Account" := ProductFactoryApplication."Penalty Paid Account";
    //     ProductFactory."Withholding Tax Account" := ProductFactoryApplication."Withholding Tax Account";
    //     ProductFactory."Over Draft Interest Account" := ProductFactoryApplication."Over Draft Interest Account";
    //     ProductFactory."Interest Calc Min Balance" := ProductFactoryApplication."Interest Calc Min Balance";
    //     ProductFactory."Interest Expense Account" := ProductFactoryApplication."Interest Expense Account";
    //     ProductFactory."Interest Payable Account" := ProductFactoryApplication."Interest Payable Account";
    //     ProductFactory."Suspend Interest Account [G/L]" := ProductFactoryApplication."Suspend Interest Account [G/L]";

    //     ProductFactory."Loan Disbursement Account" := ProductFactoryApplication."Loan Disbursement Account";
    //     ProductFactory."Product Category" := ProductFactoryApplication."Product Category";
    //     ProductFactory."Auto Open Account" := ProductFactoryApplication."Auto Open Account";
    //     ProductFactory."Loan Security Inclination" := ProductFactoryApplication."Loan Security Inclination";
    //     ProductFactory."Allow Multiple Accounts" := ProductFactoryApplication."Allow Multiple Accounts";
    //     ProductFactory."Minimum Contribution" := ProductFactoryApplication."Minimum Contribution";
    //     ProductFactory."Minimum Balance" := ProductFactoryApplication."Minimum Balance";
    //     ProductFactory.Notice := ProductFactoryApplication.Notice;
    //     ProductFactory."Maximum Deposit Contribution" := ProductFactoryApplication."Minimum Deposit Contribution";
    //     ProductFactory."Minimum Dep. Contribution %" := ProductFactoryApplication."Minimum Dep. Contribution %";
    //     ProductFactory."Withdrawal Interval" := ProductFactoryApplication."Withdrawal Interval";
    //     ProductFactory."Maximum No. of Withdrawal" := ProductFactoryApplication."Maximum No. of Withdrawal";
    //     ProductFactory."Earns Interest" := ProductFactoryApplication."Earns Interest";
    //     ProductFactory."WithHolding Tax" := ProductFactoryApplication."WithHolding Tax";
    //     ProductFactory."Allow Over Draft" := ProductFactoryApplication."Allow Over Draft";
    //     ProductFactory."Credit Limit(Overdraft)" := ProductFactoryApplication."Credit Limit(Overdraft)";
    //     ProductFactory."Allow Multiple Over Draft" := ProductFactoryApplication."Allow Multiple Over Draft";
    //     ProductFactory."Over Draft Interest %" := ProductFactoryApplication."Over Draft Interest %";

    //     ProductFactory."Minimum Guarantors" := ProductFactoryApplication."Minimum Guarantors";
    //     ProductFactory."Maximum Guarantors" := ProductFactoryApplication."Maximum Guarantors";
    //     ProductFactory."Interest Calculation Method" := ProductFactoryApplication."Interest Calculation Method";
    //     ProductFactory."Min. Re-application Period" := ProductFactoryApplication."Min. Re-application Period";
    //     ProductFactory."Minimum Loan Amount" := ProductFactoryApplication."Minimum Loan Amount";
    //     ProductFactory."Maximum Loan Amount" := ProductFactoryApplication."Maximum Loan Amount";
    //     ProductFactory."Prefferential Default installm" := ProductFactoryApplication."Prefferential Default installm";
    //     ProductFactory."Ordinary Default Intallments" := ProductFactoryApplication."Ordinary Default Intallments";
    //     ProductFactory."Repay Mode" := ProductFactoryApplication."Repay Mode";
    //     ProductFactory."Use Cycle" := ProductFactoryApplication."Use Cycle";
    //     ProductFactory."Grace Period - Principle" := ProductFactoryApplication."Grace Period - Principle";
    //     ProductFactory."Grace Period - Interest" := ProductFactoryApplication."Grace Period - Interest";
    //     ProductFactory."Installment Repayment Interval" := ProductFactoryApplication."Installment Repayment Interval";
    //     ProductFactory."Compute Interest Due on Postin" := ProductFactoryApplication."Compute Interest Due on Postin";
    //     ProductFactory."Fixed Loan Term" := ProductFactoryApplication."Fixed Loan Term";
    //     ProductFactory."Preferential Dep. Multiplier" := ProductFactoryApplication."Preferential Share Multiplier";
    //     ProductFactory."Ordinary Deposits Multiplier" := ProductFactoryApplication."Ordinary Share Multiplier";
    //     ProductFactory."Loan Span" := ProductFactoryApplication."Loan Span";
    //     ProductFactory."Recovery Priority" := ProductFactoryApplication."Recovery Priority";
    //     ProductFactory."Source of Funds" := ProductFactoryApplication."Source of Funds";
    //     ProductFactory."Source Of Funds No." := ProductFactoryApplication."Source Of Funds No.";
    //     ProductFactory."Salary Period" := ProductFactoryApplication."Salary Period";
    //     ProductFactory."No. of Salary Times" := ProductFactoryApplication."No. of Salary Times";
    //     //ProductFactory."Search Code":=ProductFactoryApplication.."Search Code";
    //     //ProductFactory."Nature of Loan Type":=ProductFactoryApplication."Nature of Loan Type";
    //     //ProductFactory."Type of Discounting":=ProductFactoryApplication.."Type of Discounting";
    //     ProductFactory."Computation %" := ProductFactoryApplication."Computation %";
    //     ProductFactory.Insert;


    //     RelatedProductApplication.Reset;
    //     RelatedProductApplication.SetRange(RelatedProductApplication."Document No.", ProductFactoryApplication."No.");
    //     if RelatedProductApplication.Find('-') then begin
    //         repeat
    //             RelatedProduct.Init;
    //             RelatedProduct."Product Code" := ProductFactoryApplication."Product ID";
    //             RelatedProduct."Related Product Code" := RelatedProductApplication."Related Product Code";
    //             RelatedProduct."Related Product Desc" := RelatedProductApplication."Related Product Desc";
    //             RelatedProduct.Insert;
    //         until RelatedProductApplication.Next = 0;
    //     end;

    //     LoanProductChargeAppl.Reset;
    //     LoanProductChargeAppl.SetRange(LoanProductChargeAppl."Document No.", ProductFactoryApplication."No.");
    //     if LoanProductChargeAppl.Find('-') then begin
    //         repeat
    //             LoanProductCharge.Init;
    //             LoanProductCharge."Charge Code" := LoanProductChargeAppl."Charge Code";
    //             LoanProductCharge."Charge Description" := LoanProductChargeAppl."Charge Description";
    //             LoanProductCharge."Charge Amount" := LoanProductChargeAppl."Charge Amount";
    //             LoanProductCharge."Use Percentage" := LoanProductChargeAppl."Use Percentage";
    //             LoanProductCharge.Percentage := LoanProductChargeAppl.Percentage;
    //             LoanProductCharge."Charge Type" := LoanProductChargeAppl."Charge Type";
    //             LoanProductCharge."Charging Option" := LoanProductChargeAppl."Charging Option";
    //             LoanProductCharge."Product Code" := ProductFactoryApplication."Product ID";
    //             LoanProductCharge."Charges G_L Account" := LoanProductChargeAppl."Charges G_L Account";
    //             LoanProductCharge.Minimum := LoanProductChargeAppl.Minimum;
    //             LoanProductCharge.Maximum := LoanProductChargeAppl.Maximum;
    //             LoanProductCharge."Additional Charge %" := LoanProductChargeAppl."Additional Conditional Charge";
    //             LoanProductCharge.Insert;
    //         until LoanProductChargeAppl.Next = 0;
    //     end;

    //     DCSParameterMatrixAppl.Reset;
    //     DCSParameterMatrixAppl.SetRange(DCSParameterMatrixAppl."Document No.", ProductFactoryApplication."No.");
    //     if DCSParameterMatrixAppl.Find('-') then begin
    //         repeat
    //             DCSParameterMatrix.Init;
    //             DCSParameterMatrix."Loan Product Code" := ProductFactoryApplication."Product ID";
    //             DCSParameterMatrix."Parameter Code" := DCSParameterMatrixAppl."Parameter Code";
    //             DCSParameterMatrix."Parameter Desc" := DCSParameterMatrixAppl."Parameter Desc";
    //             DCSParameterMatrix.Factor := DCSParameterMatrixAppl.Factor;
    //             DCSParameterMatrix."Contributes To Score As" := DCSParameterMatrixAppl."Contributes To Score As";
    //             DCSParameterMatrix."Parameter Base" := DCSParameterMatrixAppl."Parameter Base";
    //             DCSParameterMatrix."Application Priority" := DCSParameterMatrixAppl."Application Priority";
    //             DCSParameterMatrix.Formula := DCSParameterMatrixAppl.Formula;
    //             DCSParameterMatrix."Parameter Base Unit" := DCSParameterMatrixAppl."Parameter Base Unit";
    //             DCSParameterMatrix."Success Default Value" := DCSParameterMatrixAppl."Success Default Value";
    //             DCSParameterMatrix."Parameter Scope" := DCSParameterMatrixAppl."Parameter Scope";
    //             DCSParameterMatrix."Failure Response" := DCSParameterMatrixAppl."Failure Response";
    //             DCSParameterMatrix."Date Formula" := DCSParameterMatrixAppl."Date Formula";
    //             DCSParameterMatrix."Data Source" := DCSParameterMatrixAppl."Data Source";
    //             DCSParameterMatrix."Computation Method" := DCSParameterMatrixAppl."Computation Method";
    //             DCSParameterMatrix."Fall Back Parameter" := DCSParameterMatrixAppl."Fall Back Parameter";
    //             DCSParameterMatrix.Insert;
    //         until DCSParameterMatrixAppl.Next = 0;
    //     end;

    //     ProductApplicationDocuments.Reset;
    //     ProductApplicationDocuments.SetRange(ProductApplicationDocuments."Document No.", ProductFactoryApplication."No.");
    //     if ProductApplicationDocuments.Find('-') then begin
    //         repeat
    //             ProductDocuments.Init;
    //             ProductDocuments."Entry No." := ProductApplicationDocuments."Entry No.";
    //             ProductDocuments."Document Type" := ProductApplicationDocuments."Document Type";
    //             ProductDocuments."Document No." := ProductApplicationDocuments."Document No.";
    //             ProductDocuments.Description := ProductApplicationDocuments.Description;
    //             ProductDocuments."Single Party/Multiple" := ProductApplicationDocuments."Single Party/Multiple";
    //             ProductDocuments."Product ID" := ProductFactoryApplication."Product ID";
    //             ProductDocuments."Product Name" := ProductFactoryApplication."Product Description";
    //             ProductDocuments.Insert;
    //         until ProductApplicationDocuments.Next = 0;
    //     end;
    // end;


    // procedure SendSMS1(FieldSupplied: Text; CodeUsed: Text; FormatedText: Text; SavingsAccounts: Record 52185730)
    // var
    //     PeriodicActivities: Codeunit "Periodic Activities";
    //     MessageBody: Text[130];
    //     ComposedMessage: Text[160];
    //     SendSms: Codeunit SendSms;
    //     SMSSetup: Record 52185831;
    //     Charged: Boolean;
    //     SMSSeries: Record 52185832;
    //     SmsSource: Code[10];
    //     RecRef: RecordRef;
    //     Variant: Variant;
    //     TableName: Text;
    //     SavingsAccountApplication: Record 52185704;
    // begin
    //     begin
    //         SMSSetup.Get;

    //         if SavingsAccounts.FieldName("No.") = FieldSupplied then begin
    //             // MessageBody := PeriodicActivities.Token(FormatedText, '[');
    //             ComposedMessage := MessageBody + SavingsAccounts."No.";
    //             Message(ComposedMessage);

    //             SavingsAccounts.TestField(SavingsAccounts."Phone No.");
    //             if SMSSetup."Subscription Type" = SMSSetup."subscription type"::Push then
    //                 Charged := false
    //             else
    //                 Charged := true;

    //             SMSSetup.TestField(SMSSetup."Member Creation");
    //             if SMSSeries.Get(SMSSetup."Member Creation") then
    //                 SmsSource := SMSSeries.Code;

    //             //Send SMS
    //             // SendSms.SendSms(Source, SavingsAccounts."Phone No.", ComposedMessage, SavingsAccounts."No.", SavingsAccounts."No.", Charged)
    //         end;

    //     end;
    // end;


    // procedure CreateDelegates(DelegateGroupsApplicationss: Record 52186064)
    // var
    //     DelegateGroupss: Record 52186062;
    //     DelegateMembersApplicationss: Record 52186061;
    //     DelegateMemberss: Record 52186063;
    //     RegistrationProcess: Codeunit "Registration Process";
    //     GroupCreated: label 'Created Successfully.';
    // begin
    //     DelegateGroupss.Init;
    //     DelegateGroupss.Code := '';
    //     DelegateGroupss.County := DelegateGroupsApplicationss.County;
    //     DelegateGroupss."County Name" := DelegateGroupsApplicationss."County Name";
    //     DelegateGroupss."Sub-County" := DelegateGroupsApplicationss."Sub-County";
    //     DelegateGroupss."Sub-County Name" := DelegateGroupsApplicationss."Sub-County Name";
    //     DelegateGroupss."Delegate Region Description" := DelegateGroupsApplicationss."Delegate Region Description";
    //     DelegateGroupss."Electoral Zone" := DelegateGroupsApplicationss."Electoral Zone";
    //     DelegateGroupss."Electoral Zone Name" := DelegateGroupsApplicationss."Electoral Zone Name";
    //     DelegateGroupss."Global Dimension 1 Code" := DelegateGroupsApplicationss."Global Dimension 1 Code";
    //     DelegateGroupss."Global Dimension 2 Code" := DelegateGroupsApplicationss."Global Dimension 2 Code";
    //     DelegateGroupss.Type := DelegateGroupsApplicationss.Type;
    //     DelegateGroupss.Insert(true);

    //     DelegateMembersApplicationss.Reset;
    //     DelegateMembersApplicationss.SetRange(Code, DelegateGroupsApplicationss.Code);
    //     if DelegateMembersApplicationss.Find('-') then begin
    //         repeat
    //             DelegateMemberss.Init;
    //             DelegateMemberss.Code := DelegateGroupss.Code;
    //             DelegateMemberss."Delegate MNO." := DelegateMembersApplicationss."Delegate MNO.";
    //             DelegateMemberss."Delegate Name" := DelegateMembersApplicationss."Delegate Name";
    //             DelegateMemberss."Job Tittle" := DelegateMembersApplicationss."Job Tittle";
    //             DelegateMemberss.Position := DelegateMembersApplicationss.Position;
    //             DelegateMemberss.Status := DelegateMembersApplicationss.Status;
    //             DelegateMemberss."Electoral Zone" := DelegateGroupsApplicationss."Electoral Zone";
    //             DelegateMemberss."Electoral Zone Name" := DelegateGroupsApplicationss."Electoral Zone Name";
    //             DelegateMemberss.Type := DelegateGroupsApplicationss.Type;
    //             if DelegateGroupsApplicationss.Type = DelegateGroupsApplicationss.Type::ADM then
    //                 DelegateMemberss."Delegate Code" := DelegateMembersApplicationss."Delegate Code";
    //             DelegateMemberss.Insert(true);
    //         until DelegateMembersApplicationss.Next = 0;
    //     end;
    //     Message(DelegateGroupss."Delegate Region Description" + ' ' + GroupCreated);
    //     DelegateGroupsApplicationss.Created := true;
    //     DelegateGroupsApplicationss."Created By" := UserId;
    //     DelegateGroupsApplicationss.Modify;
    // end;


    // procedure ApplyATMandMSACCO(MemberApplication: Record 52185691; FOSAACC: Code[50])
    // var
    //     ATMApplications: Record 52185850;
    //     ATMCardTypes: Record 52185851;
    // begin
    //     begin
    //         if MemberApplication."Auto Apply ATM" = true then begin
    //             ATMApplications.Init;
    //             ATMApplications."No." := '';
    //             ATMApplications."Account Type" := ATMApplications."account type"::Savings;
    //             ATMApplications."Account No" := FOSAACC;
    //             ATMApplications."Form No" := MemberApplication."No.";
    //             ATMApplications."Request Type" := ATMApplications."request type"::New;
    //             ATMApplications."Application Date" := Today;
    //             ATMApplications."Capture Date" := Today;
    //             ATMApplications."Captured By" := UserId;
    //             ATMApplications."Shortcut Dimension 1 Code" := MemberApplication."Global Dimension 1 Code";
    //             ATMApplications."Shortcut Dimension 2 Code" := MemberApplication."Global Dimension 2 Code";
    //             ATMApplications."Phone No." := MemberApplication."Mobile Phone No";
    //             ATMApplications.Address := MemberApplication."Current Address";
    //             ATMApplications."Customer ID" := MemberApplication."ID No.";
    //             ATMCardTypes.Reset;
    //             if ATMCardTypes.Find('-') then
    //                 ATMApplications."Card Type" := ATMCardTypes.Code;
    //             ATMApplications."Auto Applied" := true;
    //             ATMApplications.Validate(ATMApplications."Auto Applied");
    //             ATMApplications.Insert(true);
    //         end;
    //     end;
    // end;


    // procedure CreateAGMDelegates(DelegateGroupsApplicationss: Record 52186064)
    // var
    //     DelegateMemberss: Record 52186063;
    //     DelegateMembersApplicationss: Record 52186061;
    //     DelegateMemberss2: Record 52186063;
    //     Txt0001: label 'Delegate Members Generated';
    //     EntryNo: Integer;
    //     DelegateZone: Record 52186062;
    // begin
    //     DelegateMembersApplicationss.Reset;
    //     DelegateMembersApplicationss.SetRange(Code, DelegateGroupsApplicationss.Code);
    //     if DelegateMembersApplicationss.Find('-') then
    //         DelegateMembersApplicationss.DeleteAll;


    //     DelegateMemberss2.Reset;
    //     DelegateMemberss2.SetFilter("Delegate MNO.", '<>%1', '');
    //     DelegateMemberss2.SetRange(Type, DelegateMemberss2.Type::Normal);
    //     DelegateMemberss2.SetRange(Retired, false);
    //     if DelegateMemberss2.Find('-') then begin
    //         repeat
    //             EntryNo += 1;
    //             DelegateMembersApplicationss.Init;
    //             DelegateMembersApplicationss.Code := DelegateGroupsApplicationss.Code;
    //             // DelegateMembersApplicationss."Entry No":=EntryNo;
    //             DelegateMembersApplicationss."Delegate MNO." := DelegateMemberss2."Delegate MNO.";
    //             DelegateMembersApplicationss."Delegate Name" := DelegateMemberss2."Delegate Name";
    //             DelegateMembersApplicationss."Job Tittle" := DelegateMemberss2."Job Tittle";
    //             DelegateMembersApplicationss.Position := DelegateMemberss2.Position;
    //             DelegateMembersApplicationss.Status := DelegateMemberss2.Status;
    //             DelegateMembersApplicationss."Appointment Date" := DelegateMemberss2."Appointment Date";
    //             // DelegateMembersApplicationss."Global Dimension 2 Name":=DelegateMemberss2."Global Dimension 1 Name";
    //             DelegateMembersApplicationss."Global Dimension 2 Code" := DelegateMemberss2.Code;
    //             DelegateZone.Reset;
    //             DelegateZone.SetRange(Code, DelegateMemberss2.Code);
    //             if DelegateZone.Find('-') then
    //                 DelegateMembersApplicationss."Global Dimension 2 Name" := DelegateZone."Delegate Region Description";
    //             DelegateMembersApplicationss."Delegate Code" := DelegateMemberss2.Code;
    //             //DelegateMembersApplicationss.e:=DelegateMemberss2."Electoral Zone";
    //             //DelegateMembersApplicationss."Electoral Zone Name":=DelegateMemberss2."Electoral Zone Name";
    //             DelegateMembersApplicationss.Insert(true);
    //         until DelegateMemberss2.Next = 0;
    //     end;
    //     Message(Txt0001);
    // end;


    // procedure PostRegistrationDeposit(MemberNo: Code[30]; AgentDocNo: Code[20]; ProductType: Code[10]; Source: Option MemberReg,AccountOpen)
    // var
    //     JTemplate: Code[20];
    //     JBatch: Code[20];
    //     Agentcomm: Decimal;
    //     SaccoComm: Decimal;
    //     Vendorcomm: Decimal;
    //     Totalcomm: Decimal;
    //     AgentAccount: Code[20];
    //     SaccoCommAcc: Code[20];
    //     VendorCommAcc: Code[20];
    //     GlobalDim1: Text;
    //     GlobalDim2: Text[49];
    //     JournalPosting: Codeunit "Journal Posting";
    //     AgentCommAcc: Code[20];
    //     ExciseDutyAcc: Code[20];
    //     OptionsAccounts: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
    //     ExciseDutyPercentage: Decimal;
    //     AgentTransactionDescription: Text[50];
    //     LoanTransactionType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills;
    //     ChargeExciseDuty: Boolean;
    //     ChargeFromExternalAmount: Boolean;
    //     ProductFactory: Record 52185690;
    //     AgentTrans: Record 52186105;
    //     LineNo: Integer;
    //     Sav: Record 52185730;
    //     Text101: label 'New Account Deposit via %1';
    //     GeneralSetUp: Record 52185689;
    //     GenJournalLine: Record "Gen. Journal Line";
    //     AccNo: Code[20];
    //     AgentApp: Record 52186104;
    // begin
    //     AgentTrans.Reset;
    //     AgentTrans.SetRange("Document No.", AgentDocNo);
    //     if AgentTrans.FindFirst then begin
    //         //IF AgentTrans.GET(AgentDocNo) THEN BEGIN
    //         if AgentTrans.Amount <= 0 then exit;

    //         Sav.Reset;
    //         Sav.SetRange("Member No.", MemberNo);
    //         Sav.SetRange("Product Type", ProductType);
    //         if not Sav.FindFirst then exit;

    //         GeneralSetUp.Get;
    //         GeneralSetUp.TestField("Agency Control Account");
    //         GeneralSetUp.TestField("Agency Posting Template");
    //         GeneralSetUp.TestField("Agency Posting Batch");

    //         JBatch := GeneralSetUp."Agency Posting Batch";
    //         JTemplate := GeneralSetUp."Agency Posting Template";
    //         JournalPosting.ClearJournalLines(JTemplate, JBatch);

    //         OptionsAccounts := Optionsaccounts::"G/L Account";
    //         AccNo := GeneralSetUp."Agency Control Account";
    //         if Source = Source::AccountOpen then begin
    //             AgentApp.Get(AgentTrans."Agent Code");
    //             OptionsAccounts := Optionsaccounts::Savings;
    //             AccNo := AgentApp.Account;
    //         end;

    //         LineNo += 1000;
    //         JournalPosting.PostJournal(JTemplate, JBatch, LineNo, OptionsAccounts, AgentTrans."Document No.", StrSubstNo(Text101, AgentTrans."Agent Code"), AgentTrans.Amount
    //            , AccNo, Today, Optionsaccounts::"G/L Account", '', AgentTrans."Document No.", Sav."Global Dimension 1 Code", Sav."Global Dimension 2 Code", 0, '', '', '', 0, '', 0);

    //         LineNo += 1000;
    //         JournalPosting.PostJournal(JTemplate, JBatch, LineNo, Optionsaccounts::Savings, AgentTrans."Document No.", StrSubstNo(Text101, AgentTrans."Agent Code"), -AgentTrans.Amount
    //            , Sav."No.", Today, Optionsaccounts::"G/L Account", '', AgentTrans."Document No.", Sav."Global Dimension 1 Code", Sav."Global Dimension 2 Code", 0, '', '', '', 0, '', 0);


    //         GenJournalLine.Reset;
    //         GenJournalLine.SetRange("Journal Template Name", JTemplate);
    //         GenJournalLine.SetRange("Journal Batch Name", JBatch);
    //         if GenJournalLine.FindFirst then
    //             Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJournalLine);


    //     end;
    // end;


    // procedure AccountRegistrationAuto(AccountApplication: Record 52185704) Acc: Code[20]
    // var
    //     SavingsAcc: Record 52185730;
    //     AccountSignApp: Record 52185697;
    //     AccountSign: Record 52185703;
    //     GenSetUp: Record 52185689;
    //     ProductFactory: Record 52185690;
    //     Suffix: Integer;
    //     SuffixText: Text;
    //     PeriodicAcc: Codeunit "Periodic Activities";
    //     IDNumber: Code[20];
    //     ImageData: Record 52185702;
    //     SavingsAccounts: Record 52185730;
    //     CustMembrDocuments: Record 52185726;
    //     Text001: label 'This application has not been approved.';
    //     Text002: label 'Are you sure you want to convert this application to Account?';
    //     Text003: label 'Account No. %1 created successfully.';
    // begin
    //     if StrLen(AccountApplication."Transaction Mobile No") < 15 then begin
    //         AccountApplication."Transaction Mobile No" := '';
    //         AccountApplication.Modify;
    //     end;

    //     //IF NOT CONFIRM(Text002) =TRUE THEN EXIT;

    //     //check if member has same type of product account and add a suffix if the product factory allows multiple accounts
    //     SavingsAcc.Reset;
    //     SavingsAcc.SetRange(SavingsAcc."Member No.", AccountApplication."Member No.");
    //     SavingsAcc.SetRange(SavingsAcc."Product Type", AccountApplication."Product Type");
    //     Suffix := SavingsAcc.Count;

    //     SavingsAcc.Init;
    //     if ProductFactory.Get(AccountApplication."Product Type") then
    //         SuffixText := ProductFactory."Account No. Suffix" + Format(Suffix);
    //     if StrLen(SuffixText) = 3 then
    //         SuffixText := CopyStr(SuffixText, 2);
    //     if StrLen(SuffixText) = 4 then
    //         SuffixText := CopyStr(SuffixText, 3);
    //     if StrLen(SuffixText) = 5 then
    //         SuffixText := CopyStr(SuffixText, 4);
    //     SavingsAcc."No." := ProductFactory."Account No. Prefix" + AccountApplication."Member No." + '0' + SuffixText;
    //     SavingsAcc."Product Type" := AccountApplication."Product Type";
    //     SavingsAcc."Product Name" := ProductFactory."Product Description";
    //     SavingsAcc."Member No." := AccountApplication."Member No.";
    //     SavingsAcc.Validate(SavingsAcc.Name, AccountApplication.Name);
    //     SavingsAcc."ID No." := AccountApplication."ID No.";
    //     SavingsAcc."Passport No." := AccountApplication."Passport No.";
    //     SavingsAcc."Customer Posting Group" := ProductFactory."Product Posting Group";
    //     SavingsAcc.County := AccountApplication.City;
    //     SavingsAcc."Monthly Contribution" := AccountApplication."Monthly Contribution";
    //     SavingsAcc.Validate(SavingsAcc."Monthly Contribution");
    //     SavingsAcc."Phone No." := AccountApplication."Phone No.";
    //     SavingsAcc."Mobile Phone No" := AccountApplication."Mobile Phone No";
    //     SavingsAcc."Current Address" := AccountApplication."Current Address";
    //     SavingsAcc."Post Code" := AccountApplication."Post Code";
    //     SavingsAcc.City := AccountApplication.City;
    //     SavingsAcc."Member Category" := AccountApplication."Member Category";
    //     SavingsAcc.Status := SavingsAcc.Status::New;
    //     SavingsAcc."Parent Account No." := AccountApplication."Parent Account No.";
    //     SavingsAcc."Country/Region Code" := AccountApplication."Country/Region Code";
    //     SavingsAcc."Home Address" := AccountApplication."Home Address";
    //     SavingsAcc."Registration Date" := Today;
    //     SavingsAcc."Date of Birth" := AccountApplication."Date of Birth";
    //     SavingsAcc."Birth Certificate No." := AccountApplication."Birth Certificate No.";
    //     SavingsAcc."Payroll/Staff No." := AccountApplication."Payroll/Staff No.";
    //     SavingsAcc."Recruited By" := AccountApplication."Recruited By";
    //     SavingsAcc.Gender := AccountApplication.Gender;
    //     SavingsAcc."Recruited by Type" := AccountApplication."Recruited by Type";
    //     SavingsAcc."Relationship Manager" := AccountApplication."Relationship Manager";
    //     SavingsAcc."Marital Status" := AccountApplication."Marital Status";
    //     SavingsAcc."Responsibility Center" := AccountApplication."Responsibility Center";
    //     SavingsAcc."Company Registration No." := AccountApplication."Company Registration No.";
    //     SavingsAcc."Employer Code" := AccountApplication."Employer Code";
    //     SavingsAcc."Old Member No." := AccountApplication."Old Member No.";
    //     SavingsAcc."Associated Member No." := AccountApplication."Associated Member No.";
    //     SavingsAcc."Global Dimension 1 Code" := AccountApplication."Global Dimension 1 Code";
    //     SavingsAcc."Global Dimension 2 Code" := AccountApplication."Global Dimension 2 Code";
    //     SavingsAcc."Group Account No" := AccountApplication."Group Account No";
    //     SavingsAcc."Created By" := AccountApplication."Created By";
    //     SavingsAcc."Savings Account No." := AccountApplication."Savings Account No.";
    //     SavingsAcc."Fixed Deposit Type" := AccountApplication."Fixed Deposit Type";
    //     SavingsAcc."Product Category" := AccountApplication."Product Category";
    //     if SavingsAcc."Product Category" = SavingsAcc."product category"::"Fixed Deposit" then
    //         SavingsAcc."Fixed Deposit Status" := AccountApplication."fixed deposit status"::Active;
    //     SavingsAcc."FD Maturity Date" := AccountApplication."FD Maturity Date";
    //     SavingsAcc."Neg. Interest Rate" := AccountApplication."Neg. Interest Rate";
    //     SavingsAcc."FD Duration" := AccountApplication."FD Duration";
    //     SavingsAcc."FD Maturity Instructions" := AccountApplication."FD Maturity Instructions";
    //     SavingsAcc."Fixed Deposit cert. no" := AccountApplication."Fixed Deposit cert. no";
    //     SavingsAcc."Fixed Deposit Amount" := AccountApplication."Fixed Deposit Amount";
    //     SavingsAcc."Signing Instructions" := AccountApplication."Signing Instructions";
    //     SavingsAcc.Insert;

    //     case AccountApplication."Product Category" of
    //         AccountApplication."product category"::"Junior Savings":
    //             begin
    //                 AccountApplication.CalcFields(AccountApplication.Picture, AccountApplication.Signature);
    //                 if (AccountApplication."Birth Certificate No." = '') and (AccountApplication."Passport No." <> '') then
    //                     IDNumber := AccountApplication."Passport No.";
    //                 if (AccountApplication."Birth Certificate No." <> '') and (AccountApplication."Passport No." = '') then
    //                     IDNumber := AccountApplication."Birth Certificate No.";
    //                 if (AccountApplication."Birth Certificate No." <> '') and (AccountApplication."Passport No." <> '') then
    //                     IDNumber := AccountApplication."Birth Certificate No.";

    //                 AccountApplication.CalcFields(AccountApplication.Picture, AccountApplication.Signature);

    //                 ImageData."ID Number" := IDNumber;
    //                 ImageData.Picture := AccountApplication.Picture;
    //                 ImageData.Signature := AccountApplication.Signature;
    //                 ImageData."Member No" := SavingsAcc."No.";
    //                 ImageData.Insert(true);

    //                 if AccountApplication.Picture.Hasvalue then begin
    //                     Clear(AccountApplication.Picture);
    //                     AccountApplication.Modify;
    //                 end;

    //                 if AccountApplication.Signature.Hasvalue then begin
    //                     Clear(AccountApplication.Signature);
    //                     AccountApplication.Modify;
    //                 end;

    //             end;
    //     end;

    //     CustMembrDocuments.Reset;
    //     CustMembrDocuments.SetRange(CustMembrDocuments."Reference No.", SavingsAcc."Member No.");
    //     if CustMembrDocuments.Find('-') then begin
    //         repeat
    //             EntrNo += 1;
    //             ApplicationDocuments(EntrNo, CustMembrDocuments."Document Type", CustMembrDocuments."Document No.", CustMembrDocuments.Description, CustMembrDocuments."Single Party/Multiple",
    //                                  SavingsAcc."Member No.", CustMembrDocuments."Product ID", CustMembrDocuments."Product Name", CustMembrDocuments.Provided);
    //         until CustMembrDocuments.Next = 0;
    //     end;


    //     //Advice
    //     if SavingsAccounts.Get(SavingsAcc."No.") then begin
    //         SavingsAccounts.Validate(SavingsAccounts."Monthly Contribution");
    //     end;
    //     //******

    //     PostRegistrationDeposit(SavingsAcc."Member No.", AccountApplication."Agent Document No", SavingsAcc."Product Type", 0);


    //     SendSMS.SendSms(Sourcetype::"New Account", SavingsAcc."Mobile Phone No", Text004 +
    //                    COMPANYNAME + ', ' + Text005 + SavingsAccounts."No.", SavingsAcc."No.", SavingsAccounts."No.", false);

    //     AccountApplication.Status := AccountApplication.Status::Created;
    //     AccountApplication.Modify;
    //     Acc := SavingsAcc."No.";
    // end;


    // procedure AnySavingsAccountRegistration(MemNo: Code[10]; ProductCode: Code[10])
    // var
    //     SavingsAcc: Record 52185730;
    //     AccountSignApp: Record 52185697;
    //     AccountSign: Record 52185703;
    //     GenSetUp: Record 52185689;
    //     ProductFactory: Record 52185690;
    //     Suffix: Integer;
    //     SuffixText: Text;
    //     PeriodicAcc: Codeunit "Periodic Activities";
    //     IDNumber: Code[20];
    //     ImageData: Record 52185702;
    //     SavingsAccounts: Record 52185730;
    //     CustMembrDocuments: Record 52185726;
    //     Text001: label 'This application has not been approved.';
    //     Text002: label 'Are you sure you want to convert this application to Account?';
    //     Text003: label 'Account No. %1 created successfully.';
    // begin
    //     //check if member has same type of product account and add a suffix if the product factory allows multiple accounts
    //     SavingsAcc.Reset;
    //     SavingsAcc.SetRange(SavingsAcc."Member No.", MemNo);
    //     SavingsAcc.SetRange(SavingsAcc."Product Type", ProductCode);
    //     Suffix := SavingsAcc.Count;
    //     Cust.Get(MemNo);

    //     SavingsAcc.Init;
    //     if ProductFactory.Get(ProductCode) then
    //         SuffixText := ProductFactory."Account No. Suffix" + Format(Suffix);
    //     if StrLen(SuffixText) = 3 then
    //         SuffixText := CopyStr(SuffixText, 2);
    //     if StrLen(SuffixText) = 4 then
    //         SuffixText := CopyStr(SuffixText, 3);
    //     if StrLen(SuffixText) = 5 then
    //         SuffixText := CopyStr(SuffixText, 4);
    //     SavingsAcc."No." := ProductFactory."Account No. Prefix" + MemNo + '0' + SuffixText;
    //     SavingsAcc."Product Type" := ProductFactory."Product ID";
    //     SavingsAcc."Product Name" := ProductFactory."Product Description";
    //     SavingsAcc."Member No." := MemNo;
    //     SavingsAcc.Validate(SavingsAcc.Name, Cust.Name);
    //     SavingsAcc."ID No." := Cust."ID No.";
    //     SavingsAcc."Passport No." := Cust."Passport No.";
    //     SavingsAcc."Customer Posting Group" := ProductFactory."Product Posting Group";
    //     SavingsAcc.County := Cust.City;
    //     SavingsAcc."Monthly Contribution" := ProductFactory."Minimum Contribution";
    //     SavingsAcc.Validate(SavingsAcc."Monthly Contribution");
    //     SavingsAcc."Phone No." := Cust."Mobile Phone No";
    //     SavingsAcc."Mobile Phone No" := Cust."Mobile Phone No";
    //     SavingsAcc."Current Address" := Cust."Current Address";
    //     SavingsAcc."Post Code" := Cust."Post Code";
    //     SavingsAcc.City := Cust.City;
    //     SavingsAcc."Single Party/Multiple/Business" := Cust."Single Party/Multiple";
    //     SavingsAcc."Member Category" := Cust."Member Category";
    //     SavingsAcc.Status := SavingsAcc.Status::New;
    //     //SavingsAcc."Parent Account No.":=AccountApplication."Parent Account No.";
    //     //SavingsAcc."Country/Region Code" :=;
    //     SavingsAcc."Home Address" := Cust."Home Address";
    //     SavingsAcc."Registration Date" := Today;
    //     SavingsAcc."Date of Birth" := Cust."Date of Birth";
    //     //SavingsAcc."Birth Certificate No.":=AccountApplication."Birth Certificate No.";
    //     SavingsAcc."Payroll/Staff No." := Cust."Payroll/Staff No.";
    //     //SavingsAcc."Recruited By":=USERID;
    //     SavingsAcc.Gender := Cust.Gender;
    //     //SavingsAcc."Recruited by Type":=AccountApplication."Recruited by Type";
    //     SavingsAcc."Relationship Manager" := Cust."Relationship Manager";
    //     SavingsAcc."Marital Status" := Cust."Marital Status";
    //     SavingsAcc."Responsibility Center" := Cust."Responsibility Center";
    //     SavingsAcc."Company Registration No." := Cust."Company Registration No.";
    //     SavingsAcc."Employer Code" := Cust."Employer Code";
    //     SavingsAcc."Old Member No." := Cust."Old Member No.";
    //     SavingsAcc."Associated Member No." := Cust."Associated Member No.";
    //     SavingsAcc."Global Dimension 1 Code" := Cust."Global Dimension 1 Code";
    //     SavingsAcc."Global Dimension 2 Code" := Cust."Global Dimension 2 Code";
    //     SavingsAcc."Group Account No" := Cust."Group Account No.";
    //     SavingsAcc."Created By" := UserId;
    //     //SavingsAcc."Savings Account No." := AccountApplication."Savings Account No.";
    //     //SavingsAcc."Fixed Deposit Type" :=ProductFacto;
    //     SavingsAcc."Product Category" := ProductFactory."Product Category";
    //     if SavingsAcc."Product Category" = SavingsAcc."product category"::"Fixed Deposit" then
    //         SavingsAcc."Fixed Deposit Status" := SavingsAcc."fixed deposit status"::Active;
    //     //SavingsAcc."FD Maturity Date" := ;
    //     //SavingsAcc."Neg. Interest Rate" := AccountApplication."Neg. Interest Rate";
    //     //SavingsAcc."FD Duration" := AccountApplication."FD Duration";
    //     //SavingsAcc."FD Maturity Instructions" := AccountApplication."FD Maturity Instructions";
    //     //SavingsAcc."Fixed Deposit cert. no" := AccountApplication."Fixed Deposit cert. no";
    //     //SavingsAcc."Fixed Deposit Amount" := AccountApplication."Fixed Deposit Amount";
    //     //SavingsAcc."Signing Instructions":=AccountApplication."Signing Instructions";
    //     SavingsAcc.Insert;

    //     /*CASE ProductFactory."Product Category" OF
    //      ProductFactory."Product Category"::"Junior Savings" :
    //       BEGIN
    //        AccountApplication.CALCFIELDS(AccountApplication.Picture,AccountApplication.Signature);
    //        IF (AccountApplication."Birth Certificate No." = '') AND (AccountApplication."Passport No." <> '') THEN
    //         IDNumber:= AccountApplication."Passport No.";
    //        IF (AccountApplication."Birth Certificate No." <> '') AND (AccountApplication."Passport No." = '') THEN
    //         IDNumber:= AccountApplication."Birth Certificate No.";
    //        IF (AccountApplication."Birth Certificate No." <> '') AND (AccountApplication."Passport No." <> '') THEN
    //         IDNumber:= AccountApplication."Birth Certificate No.";

    //        AccountApplication.CALCFIELDS(AccountApplication.Picture,AccountApplication.Signature);

    //        ImageData."ID Number":=IDNumber;
    //        ImageData.Picture:=AccountApplication.Picture;
    //        ImageData.Signature:=AccountApplication.Signature;
    //        ImageData."Member No":=SavingsAcc."No.";
    //        ImageData.INSERT(TRUE);

    //        IF AccountApplication.Picture.HASVALUE THEN BEGIN
    //        CLEAR(AccountApplication.Picture);
    //        AccountApplication.MODIFY;
    //        END;

    //        IF AccountApplication.Signature.HASVALUE THEN BEGIN
    //        CLEAR(AccountApplication.Signature);
    //        AccountApplication.MODIFY;
    //        END;

    //       END;
    //     END;

    //   CustMembrDocuments.RESET;
    //   CustMembrDocuments.SETRANGE(CustMembrDocuments."Reference No.",SavingsAcc."Member No.");
    //   IF CustMembrDocuments.FIND('-') THEN BEGIN
    //     REPEAT
    //     EntrNo+=1;
    //     ApplicationDocuments(EntrNo,CustMembrDocuments."Document Type",CustMembrDocuments."Document No.",CustMembrDocuments.Description,CustMembrDocuments."Single Party/Multiple",
    //                          SavingsAcc."Member No.",CustMembrDocuments."Product ID",CustMembrDocuments."Product Name",CustMembrDocuments.Provided);
    //       UNTIL CustMembrDocuments.NEXT=0;
    //   END;


    //     //Advice
    //     IF SavingsAccounts.GET(SavingsAcc."No.") THEN BEGIN
    //       SavingsAccounts.VALIDATE(SavingsAccounts."Monthly Contribution");
    //       END;
    //     //******

    //   PostRegistrationDeposit(SavingsAcc."Member No.",AccountApplication."Agent Document No",SavingsAcc."Product Type",0);


    //    SendSMS.SendSms(SourceType::"New Account",SavingsAcc."Mobile Phone No",Text004 +
    //                   COMPANYNAME +', '+Text005 + SavingsAccounts."No.",SavingsAcc."No.",SavingsAccounts."No.",FALSE);*/

    //     //AccountApplication.Status:=AccountApplication.Status::Created; AccountApplication.MODIFY;
    //     //MESSAGE(Text003,SavingsAcc ."No.");

    // end;


    // procedure AdviceSavings(SavingsAccounts: Record 52185730; OldAmount: Decimal; NewAmount: Decimal)
    // var
    //     CheckoffAdvice: Record 52185818;
    //     iEntryNo: Integer;
    //     SavingsAccount: Record 52185730;
    //     MemberCategory: Record 52185723;
    //     ProductFactory: Record 52185690;
    //     Members: Record 52185700;
    // begin
    //     //Advice Deposits Changes
    //     begin
    //         SavingsAccounts.CalcFields("Balance (LCY)");
    //         iEntryNo := 0;
    //         CheckoffAdvice.Reset;
    //         if CheckoffAdvice.Find('+') then
    //             iEntryNo := CheckoffAdvice."Entry No" + 1;
    //         if Members.Get(SavingsAccounts."Member No.") then begin
    //             if MemberCategory.Get(Members."Member Category") then begin
    //                 if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Deposit Contribution" then
    //                     //NewAmount:=MemberCategory."Default Share Deposit";
    //                     if SavingsAccounts."Product Category" = SavingsAccounts."product category"::Benevolent then begin
    //                         // if ProductFactory.Get("Product Type") then begin
    //                         //     //NewAmount:=ProductFactory."Minimum Contribution";
    //                         // end;
    //                     end;
    //             end;

    //         end;

    //         if (SavingsAccounts.Status = SavingsAccounts.Status::Closed) or (SavingsAccounts.Status = SavingsAccounts.Status::New) then
    //             OldAmount := 0;

    //         CheckoffAdvice.Init;
    //         CheckoffAdvice."Entry No" := iEntryNo;
    //         CheckoffAdvice."Account No." := SavingsAccounts."No.";
    //         CheckoffAdvice."Member No." := SavingsAccounts."Member No.";
    //         CheckoffAdvice."Payroll No" := SavingsAccounts."Payroll/Staff No.";
    //         CheckoffAdvice.Validate(CheckoffAdvice."Member No.");
    //         CheckoffAdvice."Amount On" := NewAmount;
    //         CheckoffAdvice."Amount Off" := 0;
    //         CheckoffAdvice.Type := CheckoffAdvice.Type::Savings;

    //         SavingsAccount.Reset;
    //         SavingsAccount.SetRange("No.", SavingsAccounts."No.");
    //         if SavingsAccount.Find('-') then begin
    //             SavingsAccount.CalcFields("Balance (LCY)");
    //             CheckoffAdvice."Balance On" := SavingsAccount."Balance (LCY)";

    //             if SavingsAccount."Employer Account No" <> '' then
    //                 CheckoffAdvice."Employer Account No." := SavingsAccount."Employer Account No"
    //             else
    //                 CheckoffAdvice."Employer Account No." := SavingsAccount."No.";
    //         end;

    //         if SavingsAccounts."Product Category" = SavingsAccounts."product category"::"Deposit Contribution" then begin
    //             SavingsAccount.Reset;
    //             SavingsAccount.SetRange("Member No.", SavingsAccounts."Member No.");
    //             SavingsAccount.SetFilter(Status, '<>%1', SavingsAccount.Status::Closed);
    //             SavingsAccount.SetRange("Product Category", SavingsAccount."product category"::"Deposit Contribution");
    //             if SavingsAccount.Find('-') then begin
    //                 SavingsAccount.CalcFields("Balance (LCY)");
    //                 if SavingsAccount."Employer Balance" = 0 then
    //                     CheckoffAdvice."Balance On" := /*CheckoffAdvice."Balance On"+*/SavingsAccount."Balance (LCY)"//Commented to prevent doubling of balance on
    //                 else
    //                     CheckoffAdvice."Balance On" := NewAmount + SavingsAccount."Employer Balance";
    //             end;
    //         end;

    //         CheckoffAdvice."Advice Method" := CheckoffAdvice."advice method"::Changes;
    //         CheckoffAdvice."Advice Date" := Today;
    //         CheckoffAdvice."ID No." := SavingsAccounts."ID No.";
    //         CheckoffAdvice."Employer Code" := SavingsAccounts."Employer Code";
    //         CheckoffAdvice.Names := SavingsAccounts.Name;
    //         CheckoffAdvice."Product Type" := SavingsAccounts."Product Type";
    //         if NewAmount = OldAmount then
    //             CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Adjustment
    //         else
    //             CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Variations;
    //         // if NewAmount = 0 then begin
    //         //     CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::Stoppage;
    //         //     CheckoffAdvice."Balance Off" := SavingsAccount."Monthly Contribution";
    //         // end else
    //         //     if "Balance (LCY)" = 0 then
    //         //         CheckoffAdvice."Advice Type" := CheckoffAdvice."advice type"::New;
    //         //**CheckoffAdvice.VALIDATE(CheckoffAdvice."Account No.");
    //         CheckoffAdvice.Validate(CheckoffAdvice."Product Type");
    //         if (CheckoffAdvice."Amount On" <> 0) or (CheckoffAdvice."Amount Off" <> 0) or (CheckoffAdvice."Balance On" <> 0) or (CheckoffAdvice."Advice Type" = CheckoffAdvice."advice type"::Stoppage) then
    //             CheckoffAdvice.Insert(true);
    //     end;

    // end;
}
