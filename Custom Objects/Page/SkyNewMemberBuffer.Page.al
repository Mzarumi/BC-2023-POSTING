page 52185437 "Sky New Member Buffer"
{
    PageType = List;
    SourceTable = "Sky New Members Buffer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("First Name"; Rec."First Name")
                {
                }
                field("Second Name"; Rec."Second Name")
                {
                }
                field("Last Name"; Rec."Last Name")
                {
                }
                field(Phone; Rec.Phone)
                {
                }
                field("ID No"; Rec."ID No")
                {
                }
                field("Service Number"; Rec."Service Number")
                {
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                }
                field("Montly Amount"; Rec."Montly Amount")
                {
                }
                field(Created; Rec.Created)
                {
                }
                field(Erroneous; Rec.Erroneous)
                {
                }
                field("Error Message"; Rec."Error Message")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Created At"; Rec."Created At")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Import Members")
            {
                Image = Import;
                Promoted = true;
                ////RunObject = XMLport "Import New Members";
            }
            action(CreateMembers)
            {
                Image = CreateDocument;
                Promoted = true;

                trigger OnAction()
                begin
                    MemberRegistration();
                end;
            }
        }
    }

    var
        Text002: Label 'You have been approved as a member at  ';
        Text003: Label 'Your Member No. is  ';
        Text004: Label 'Your application has been approved by  ';
        Text005: Label 'Your Account No. is  ';
        Text006: Label 'This application has not been approved.';
        Text007: Label 'Are you sure you want to convert this application to membership?';
        Text008: Label 'Member No. %1 created successfully.';
        Text0001: Label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: Label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        Text0003: Label 'You have been captured as principle member to';

    //[Scope('Internal')]
    procedure MemberRegistration()
    var
        LineNo: Integer;
        Cust: Record Members;
        GroupMembers: Record Members;
        Accounts: Record Vendor;
        NextOfKinApp: Record "Next of KIN Application";
        NextOfKin: Record "Next of KIN";
        AccountSignApp: Record "Signatory Application";
        AccountSign: Record "Account Signatories";
        GenSetUp: Record "General Set-Up";
        ImageData: Record "Image Data";
        DefaultSavAccReg: Record "Savings Account Registration";
        SavingsAcc: Record "Savings Accounts";
        ProductFactory: Record "Product Factory";
        IDNumber: Code[20];
        CustMembrDocuments: Record "Application Documents";
        Suffix: Integer;
        SuffixText: Text;
        CustSocialListenSite: Record "Social Listening Sites App.";
        CompanyInformation: Record "Company Information";
        GeneralSetUp: Record "General Set-Up";
        Factory: Record "Product Factory";
        GenJournalLine: Record "Gen. Journal Line";
        Temp: Record "Banking User Template";
        Jtemplate: Code[30];
        JBatch: Code[30];
        UserSetup: Record "User Setup";
        Text0001: Label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
        Text0002: Label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
        AccountNo: Code[50];
        i: Integer;
        SavAcc: Record "Savings Accounts";
        GrAccounts: Record "Savings Accounts";
        VirtualRegistrations: Record "Virtual Registrations";
        AgentBiometricData: Record "Agent Biometric Data";
        FOSAACC: Code[50];
        SkyNewMembersBuffer: Record "Sky New Members Buffer";
        SkyAutomatedSavings: Record "Sky Automated Savings";
        //RegistrationProcess: Codeunit "Registration Process";
        MsgT: Text;
        MsgTT: Text;
        //SendSms: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        ProgressWindow: Dialog;
    begin
        ProgressWindow.Open('Creating #1#######');
        SkyNewMembersBuffer.Reset;
        SkyNewMembersBuffer.SetRange(Created, false);
        SkyNewMembersBuffer.SetRange(Erroneous, false);
        if SkyNewMembersBuffer.FindFirst then begin
            repeat
                Sleep(1000);
                ProgressWindow.Update(1, SkyNewMembersBuffer."First Name");
                // Process the account.
                FOSAACC := '';
                Cust.Init;
                Cust."No." := '';
                // Cust."Single Party/Multiple":=MemberApplication."Single Party/Multiple/Business";
                // Cust."Old Member No.":=Cust."Old Member No.";;
                // Cust."Associated Member No.":=MemberApplication."Associated Member No.";
                Cust."First Name" := UpperCase(SkyNewMembersBuffer."First Name");
                Cust."Second Name" := UpperCase(SkyNewMembersBuffer."Second Name");
                Cust."Last Name" := UpperCase(SkyNewMembersBuffer."Last Name");
                Cust.Name := UpperCase(SkyNewMembersBuffer."First Name" + ' ' + SkyNewMembersBuffer."Second Name" + ' ' + SkyNewMembersBuffer."Last Name");
                Cust."Registration Date" := Today;
                Cust."ID No." := Format(SkyNewMembersBuffer."ID No");
                //Cust."Passport No.":=MemberApplication."Passport No.";
                //Cust.County:=MemberApplication.City;
                //Cust."P.I.N Number":=MemberApplication."P.I.N Number";
                Cust."Phone No." := SkyNewMembersBuffer.Phone;
                Cust."Mobile Phone No" := SkyNewMembersBuffer.Phone;
                //Cust."Current Address":=MemberApplication."Current Address";
                //Cust."Post Code":=MemberApplication."Post Code";
                //Cust.City:=MemberApplication.City;
                //Cust."Recruited by Type":=MemberApplication."Recruited by Type";
                //Cust."Recruited By Name":=MemberApplication."Recruited By Name";
                //Cust."Relationship Manager":=MemberApplication."Relationship Manager";
                //Cust.Nationality:=MemberApplication.Nationality;
                Cust."Date of Birth" := SkyNewMembersBuffer."Date of Birth";
                //Cust."Birth Certificate No.":=MemberApplication."Birth Certificate No.";
                //Cust."Marital Status":=MemberApplication."Marital Status";
                Cust."Member Segment" := 'CHECKOFF';
                //Cust."Member Category":=MeberApplication."Member Category";
                //Cust."Account Category":=MemberApplication."Account Category";
                //Cust."Principle Member":=MemberApplication."Principle Member";
                //Cust."Country Of Operation":=MemberApplication."Country Of Operation";
                Cust.Status := Cust.Status::New;
                //Cust."Electrol Zone":=MemberApplication."Electrol Zone";
                //Cust."Electrol Zone Descr.":=MemberApplication."Electrol Zone Descr.";
                //Cust."Area Service Center":=MemberApplication."Area Service Center";
                //Cust."Responsibility Center":=MemberApplication."Responsibility Center";
                Cust."Employer Code" := '01';
                Cust."Employer Name" := 'OFFICE OF THE PRESIDENT';
                //Cust."Home Address":=MemberApplication."Home Address";
                Cust."Payroll/Staff No." := SkyNewMembersBuffer."Service Number";
                //Cust."Recruited By":=MemberApplication."Recruited By";
                //Cust."Marital Status":=MemberApplication."Marital Status";
                // Cust."Customer Type":=MemberApplication."Group Type";
                // Cust.Gender:=MemberApplication.Gender;
                // Cust."Dividend Payment Method":= MemberApplication."Dividend Payment Method";
                // Cust."Type of Business":=MemberApplication."Type of Business";
                // Cust."Other Business Type":=MemberApplication."Other Business Type";
                // Cust."Ownership Type":=MemberApplication."Ownership Type";
                // Cust."Other Account Type":=MemberApplication."Other Account Type";
                // Cust."Nature of Business":=MemberApplication."Nature of Business";
                // Cust."Company Registration No.":=MemberApplication."Company Registration No.";
                // Cust."Date of Business Reg.":=MemberApplication."Date of Business Reg.";
                // Cust."Business/Group Location":=MemberApplication."Business/Group Location";
                // Cust."Plot/Bldg/Street/Road":=MemberApplication."Plot/Bldg/Street/Road";
                // Cust."Group Account":=MemberApplication."Group Account";
                // Cust."Group Type":=MemberApplication."Group Type";
                // Cust.Type:=MemberApplication.Type;
                // Cust."Group Account No.":= MemberApplication."Group Account No.";
                // Cust."Bank Code":=MemberApplication."Bank Code";
                // Cust."Branch Code":=MemberApplication."Branch Code";
                // Cust."Single Party/Multiple":=MemberApplication."Single Party/Multiple/Business";
                // Cust."Bank Account No.":=MemberApplication."Bank Account No.";
                // Cust."Application No.":=MemberApplication."No.";
                // Cust."Global Dimension 1 Code":=MemberApplication."Global Dimension 1 Code";
                // Cust."Global Dimension 2 Code":=MemberApplication."Global Dimension 2 Code";
                // Cust."Tax Exempted":=MemberApplication."Tax Exempted";
                Cust."Created By" := UserId;
                // Cust."E-Mail":=MemberApplication."E-Mail";
                // Cust.Salutation:=MemberApplication.Salutation;
                // Cust."ID Card":=MemberApplication."ID Card";
                // Cust."ID Card Back":=MemberApplication."ID Card Back";
                // Cust."Constitution Provided":=MemberApplication."Constitution Provided";
                // Cust."Group Minutes Provided":=MemberApplication."Group Minutes Provided";
                // Cust."Membership Option":=MemberApplication."Membership Option";

                // IF MemberApplication.Source=MemberApplication.Source::Agency THEN
                //  BEGIN
                //    Cust."BSS Registered":=TRUE;
                //    IF VirtualRegistrations.GET(MemberApplication."ID No.") THEN BEGIN
                //        Cust."ID No." := VirtualRegistrations."ID/Passport";
                //        Cust.Name := VirtualRegistrations."Full Names";
                //        CASE VirtualRegistrations.Gender OF
                //             VirtualRegistrations.Gender::Male:
                //               Cust.Gender := Cust.Gender::Male;
                //             VirtualRegistrations.Gender::Female:
                //               Cust.Gender := Cust.Gender::Female;
                //          END;
                //        Cust."First Name" := VirtualRegistrations."First Name";
                //        Cust."Second Name" := VirtualRegistrations."Second Name";
                //        Cust."Last Name" := VirtualRegistrations."Last Name";
                //        Cust."Date of Birth":= VirtualRegistrations."IPRS Date Of Birth";
                //    END;
                // END;



                Cust.Insert(true);

                //.
                // MemberApplication.CALCFIELDS(Signature,Picture);
                //
                // CASE MemberApplication."Single Party/Multiple/Business" OF
                //  MemberApplication."Single Party/Multiple/Business"::Single :
                //   BEGIN
                //    IF MemberApplication."ID No." = '' THEN
                //     IDNumber:= MemberApplication."Passport No."
                //    ELSE
                //     IDNumber:= MemberApplication."ID No.";
                //
                //    ImageData."ID Number":=IDNumber;
                //    ImageData.Picture:=MemberApplication.Picture;
                //    ImageData.Signature:=MemberApplication.Signature;
                //    ImageData."Member No":=Cust."No.";
                //    IF MemberApplication.Source=MemberApplication.Source::Agency THEN
                //        BEGIN
                //          IF AgentBiometricData.GET(IDNumber) THEN BEGIN
                //              AgentBiometricData.CALCFIELDS(FingerFour,FingerOne,FingerThree,FingerTwo);
                //              ImageData.FingerOne:=AgentBiometricData.FingerOne;
                //              ImageData.FingerTwo:=AgentBiometricData.FingerTwo;
                //              ImageData.FingerThree:=AgentBiometricData.FingerThree;
                //              ImageData.FingerFour:=AgentBiometricData.FingerFour;
                //            END;
                //    END;
                //    ImageData.INSERT(TRUE);
                //   END;
                //
                //  MemberApplication."Single Party/Multiple/Business"::Multiple,MemberApplication."Single Party/Multiple/Business"::Business :
                //   BEGIN
                //    IF MemberApplication."Company Registration No." = '' THEN
                //     IDNumber:= MemberApplication."P.I.N Number"
                //    ELSE
                //     IDNumber:= MemberApplication."Company Registration No.";
                //
                //    ImageData."ID Number":=IDNumber;
                //    ImageData.Picture:=MemberApplication.Picture;
                //    ImageData.Signature:=MemberApplication.Signature;
                //    ImageData."Member No":=Cust."No.";
                //    ImageData.INSERT(TRUE);
                //   END;
                // END;

                // IF MemberApplication.Picture.HASVALUE THEN BEGIN
                // CLEAR(MemberApplication.Picture);
                // MemberApplication.MODIFY;
                // END;
                //
                // IF MemberApplication.Signature.HASVALUE THEN BEGIN
                // CLEAR(MemberApplication.Signature);
                // MemberApplication.MODIFY;
                // END;

                // NextOfKinApp.RESET;
                // NextOfKinApp.SETRANGE(NextOfKinApp."Account No",MemberApplication."No.");
                // IF NextOfKinApp.FIND('-') THEN BEGIN
                // REPEAT
                //  NextOfKin.INIT;
                //  NextOfKin."Entry No.":=NextOfKinApp."Entry No.";
                //  NextOfKin."Account No":=Cust."No.";
                //  NextOfKin.Name:=UPPERCASE(NextOfKinApp.Name);
                //  NextOfKin.Relationship:=NextOfKinApp.Relationship;
                //  NextOfKin.Beneficiary:=NextOfKinApp.Beneficiary;
                //  NextOfKin."Date of Birth":=NextOfKinApp."Date of Birth";
                //  NextOfKin.Address:=NextOfKinApp.Address;
                //  NextOfKin.Telephone:=NextOfKinApp.Telephone;
                //  NextOfKin."Date Captured":=NextOfKinApp."Date Captured";
                //  NextOfKin.Fax:=NextOfKinApp.Fax;
                //  NextOfKin.Email:=NextOfKinApp.Email;
                //  NextOfKin."ID No.":=NextOfKinApp."ID No.";
                //  NextOfKin."%Allocation":=NextOfKinApp."%Allocation";
                //  NextOfKin.Type:=NextOfKinApp.Type;
                //  NextOfKin."BBF Entitlement":=NextOfKinApp."BBF Entitlement";
                //  NextOfKin."BBF Entitlement Code":=NextOfKinApp."BBF Entitlement Code";
                //  NextOfKin.INSERT;
                // UNTIL NextOfKinApp.NEXT = 0;
                // END;




                // AccountSignApp.RESET;
                // AccountSignApp.SETRANGE(AccountSignApp."Account No",MemberApplication."No.");
                // IF AccountSignApp.FIND('-') THEN BEGIN
                // REPEAT
                //  AccountSign.INIT;
                //  AccountSign."Entry No":=AccountSignApp."Entry No";
                //  AccountSign."Account No":=Cust."No.";
                //  AccountSign.Names:=UPPERCASE(AccountSignApp.Names);
                //  AccountSign."Date Of Birth":=AccountSignApp."Date Of Birth";
                //  AccountSign."Staff/Payroll":=AccountSignApp."Staff/Payroll";
                //  AccountSign."ID Number":=AccountSignApp."ID Number";
                //  AccountSign.Signatory:=AccountSignApp.Signatory;
                //  AccountSign."Must Sign":=AccountSignApp."Must Sign";
                //  AccountSign."Must be Present":=AccountSignApp."Must be Present";
                //  AccountSignApp.CALCFIELDS(AccountSignApp.Signature,AccountSignApp.Picture);
                //  AccountSign.Picture:=AccountSignApp.Picture;
                //  AccountSign.Signature:=AccountSignApp.Signature;
                //  AccountSign.Type:=AccountSignApp.Type;
                //  AccountSign."Account Type":=AccountSignApp."Account Type";
                //  AccountSign."Expiry Date":=AccountSignApp."Expiry Date";
                //  AccountSign."Phone No.":=AccountSignApp."Phone No.";
                //  AccountSign.INSERT;
                //
                //  IF AccountSignApp.Picture.HASVALUE THEN BEGIN
                //   CLEAR(AccountSignApp.Signature);
                //   AccountSignApp.MODIFY;
                //  END;
                //
                //  IF AccountSignApp.Signature.HASVALUE THEN BEGIN
                //   CLEAR(AccountSignApp.Signature);
                //   AccountSignApp.MODIFY;
                //  END;
                // UNTIL AccountSignApp.NEXT = 0;
                // END;

                // AccountSignApp.RESET;
                // AccountSignApp.SETRANGE(AccountSignApp."Account No",MemberApplication."No.");
                // IF AccountSignApp.FIND('-') THEN BEGIN
                // REPEAT
                //   GroupMembers.RESET;
                //   GroupMembers.SETRANGE("No.",AccountSignApp."Member No.");
                //   IF GroupMembers.FINDFIRST THEN BEGIN
                //
                //     GroupMembers."Group Account No.":=Cust."No.";
                //     GroupMembers."Customer Type":=GroupMembers."Customer Type"::"Micro finance";
                //     GroupMembers."Account Category":=GroupMembers."Account Category"::Member;
                //     GroupMembers.MODIFY;
                // END;
                // GrAccounts.RESET;
                // GrAccounts.SETRANGE("Member No.",AccountSignApp."Member No.");
                // IF GrAccounts.FINDFIRST THEN BEGIN
                // REPEAT
                //  GrAccounts."Group Account No":=Cust."No.";
                //  GrAccounts.MODIFY;
                // UNTIL GrAccounts.NEXT=0;
                // END;
                //
                // UNTIL AccountSignApp.NEXT = 0;
                // END;

                SkyAutomatedSavings.Reset;
                //SkyAutomatedSavings.SETRANGE("Product Type",'505');
                if SkyAutomatedSavings.Find('-') then begin
                    repeat
                        if ProductFactory.Get(SkyAutomatedSavings."Product Type") then
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
                        SavingsAcc."ID No." := Format(SkyNewMembersBuffer."ID No");
                        //SavingsAcc."Passport No.":=MemberApplication."Passport No.";
                        //**SavingsAcc.VALIDATE(SavingsAcc."Monthly Contribution");
                        SavingsAcc."Customer Posting Group" := ProductFactory."Product Posting Group";
                        //SavingsAcc.County:=MemberApplication.City;
                        SavingsAcc."Phone No." := SkyNewMembersBuffer.Phone;
                        SavingsAcc."Mobile Phone No" := SkyNewMembersBuffer.Phone;
                        //    SavingsAcc."Current Address":=MemberApplication."Current Address";
                        //    SavingsAcc."Post Code" :=MemberApplication."Post Code";
                        //    SavingsAcc.City:=MemberApplication.City;
                        SavingsAcc.Status := SavingsAcc.Status::New;
                        //    SavingsAcc."Country/Region Code" :=MemberApplication.Nationality;
                        //    SavingsAcc."Home Address":=MemberApplication."Home Address";
                        SavingsAcc."Registration Date" := Today;
                        //    SavingsAcc."Recruited by Type":=MemberApplication."Recruited by Type";
                        //    SavingsAcc."Relationship Manager":=MemberApplication."Relationship Manager";
                        SavingsAcc."Date of Birth" := SkyNewMembersBuffer."Date of Birth";
                        //    SavingsAcc."Birth Certificate No.":=MemberApplication."Birth Certificate No.";
                        SavingsAcc."Payroll/Staff No." := SkyNewMembersBuffer."Service Number";
                        //    SavingsAcc."Recruited By":=MemberApplication."Recruited By";
                        //    SavingsAcc.Gender:=MemberApplication.Gender;
                        //    SavingsAcc."Member Category":=MemberApplication."Member Category";
                        //    SavingsAcc."Marital Status":=MemberApplication."Marital Status";
                        //    SavingsAcc."Old Member No.":=MemberApplication."Old Member No.";
                        //    SavingsAcc."Associated Member No.":= MemberApplication."Associated Member No.";
                        //    SavingsAcc."Responsibility Center":=MemberApplication."Responsibility Center";
                        //    SavingsAcc."Company Registration No.":=MemberApplication."Company Registration No.";
                        SavingsAcc."Employer Code" := Cust."Employer Code";
                        //    SavingsAcc."Single Party/Multiple/Business":=MemberApplication."Single Party/Multiple/Business";
                        //    SavingsAcc."Global Dimension 1 Code":=MemberApplication."Global Dimension 1 Code";
                        //    SavingsAcc."Global Dimension 2 Code":=MemberApplication."Global Dimension 2 Code";
                        //    SavingsAcc."Group Account No":= MemberApplication."Group Account No.";
                        SavingsAcc."Created By" := UserId;
                        SavingsAcc."Monthly Contribution" := SkyAutomatedSavings."Monthly Contribution";
                        if SkyAutomatedSavings."Product Type" = '02' then
                            SavingsAcc."Monthly Contribution" := SkyNewMembersBuffer."Montly Amount";

                        if ProductFactory.Get(SkyAutomatedSavings."Product Type") then begin
                            if not ProductFactory."Loan Disbursement Account" then
                                SavingsAcc."Loan Disbursement Account" := false
                            else
                                SavingsAcc."Loan Disbursement Account" := true;
                            if SavingsAcc."Loan Disbursement Account" = true then
                                FOSAACC := SavingsAcc."No.";
                            SavingsAcc."Product Category" := ProductFactory."Product Category";

                        end;
                        //Update Can Guarantee Loan
                        if ProductFactory."Can Guarantee Loan" = true then
                            SavingsAcc."Can Guarantee Loan" := true;
                        //Update Can Guarantee Loan
                        SavingsAcc."Product Type" := DefaultSavAccReg."Product Type";
                        SavingsAcc."Product Name" := DefaultSavAccReg."Product Name";
                        SavingsAcc."Member No." := Cust."No.";
                        SavingsAcc.Insert;

                        //Advice
                        if Cust."Member Segment" = 'CHECKOFF' then
                            SavingsAcc.Validate("Monthly Contribution");
                        //Advice

                        //Accrue Registration Fee
                        CompanyInformation.Get();
                        if CompanyInformation."Accrue Registration Fee" = true then begin
                            if ProductFactory."Product Category" = ProductFactory."Product Category"::"Registration Fee" then begin
                                GeneralSetUp.Get();
                                Temp.Get(UserId);
                                AccountNo := '';
                                Jtemplate := Temp."Accrual. Fee.Journal Template";
                                JBatch := Temp."Accrual. Fee. Journal Batch";

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
                                GenJournalLine."Account Type" := GenJournalLine."Account Type"::Employee;
                                GenJournalLine."Account No." := AccountNo;
                                GenJournalLine."External Document No." := AccountNo;
                                GenJournalLine.Validate(GenJournalLine."Account No.");
                                GenJournalLine."Posting Date" := Today;
                                GenJournalLine.Description := 'Registration Fee' + AccountNo;
                                GenJournalLine.Amount := GeneralSetUp."Registration Fee";
                                GenJournalLine.Validate(GenJournalLine.Amount);
                                GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::"G/L Account";
                                GenJournalLine."Bal. Account No." := ProductFactory."Accrual Fee Acc. (Income)";
                                GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
                                GenJournalLine."Shortcut Dimension 1 Code" := Format('CREDIT');
                                GenJournalLine."Shortcut Dimension 2 Code" := 'NBI';
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
                                GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
                                if GenJournalLine.Amount <> 0 then
                                    GenJournalLine.Insert;
                                //Post
                                GenJournalLine.Reset;
                                GenJournalLine.SetRange("Journal Template Name", Jtemplate);
                                GenJournalLine.SetRange("Journal Batch Name", JBatch);
                                if GenJournalLine.Find('-') then begin
                                    //CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post New", GenJournalLine);
                                end;
                                //Post

                            end;
                        end;
                    until SkyAutomatedSavings.Next = 0;
                end;

                // CustMembrDocuments.RESET;
                // CustMembrDocuments.SETRANGE(CustMembrDocuments."Reference No.",MemberApplication."No.");
                // IF CustMembrDocuments.FIND('-') THEN BEGIN
                //  REPEAT
                //  EntrNo+=1;
                //  ApplicationDocuments(EntrNo,CustMembrDocuments."Document Type",CustMembrDocuments."Document No.",CustMembrDocuments.Description,CustMembrDocuments."Single Party/Multiple",
                //                       Cust."No.",CustMembrDocuments."Product ID",CustMembrDocuments."Product Name",CustMembrDocuments.Provided);
                //    UNTIL CustMembrDocuments.NEXT=0;
                // END;
                //
                // CustSocialListenSite.RESET;
                // CustSocialListenSite.SETRANGE(CustSocialListenSite."Account No.",MemberApplication."No.");
                // IF CustSocialListenSite.FIND('-') THEN BEGIN
                //  REPEAT
                //    EntrNo+=1;
                //    SocialSiteListening(EntrNo,Cust."No.",CustSocialListenSite.Address);
                //    UNTIL CustSocialListenSite.NEXT=0;
                //  END;
                //  IF MemberApplication."Auto Apply ATM"=TRUE THEN
                // ApplyATMandMSACCO(MemberApplication,FOSAACC);

                //RegistrationProcess.PostRegistrationDeposit(Cust."No.",MemberApplication."Agent Doc No",'02',0);
                MsgT := 'You have been approved as a member at ';
                MsgTT := ' and FOSA Account No is: ';
                // IF MemberApplication."Membership Option"=MemberApplication."Membership Option"::Agent THEN
                // BEGIN
                // MsgT:='You have been approved as a agent at ' ;
                // MsgTT:='.';
                // END ELSE BEGIN
                // MsgT:='You have been approved as a member at ';
                // MsgTT:=' and FOSA Account No is: '+FOSAACC+'.';
                // END;

                // SendSms.SendSms(SourceType::"New Member", SkyNewMembersBuffer.Phone, MsgT +
                //                 CompanyName + ', ' + Text003 + Cust."No." + MsgTT + '505' + Cust."No." + '000', '505' + Cust."No." + '000', Cust."No.", false);


                //Denis Create Member file in file movementz1
                // FileTracker.INIT;
                // FileTracker."File Number":=Cust."No.";
                // FileTracker."Member Name":=Cust.Name;
                // FileTracker."Staff No":=Cust."Payroll/Staff No.";
                // FileTracker."File Created By":=USERID;
                // FileTracker."File Creation Date":=TODAY;
                // FileTracker."ID No.":=Cust."ID No.";
                // FileTracker.Create:=TRUE;
                // FileTracker."File MVT User ID":=USERID;
                // FileTracker.INSERT;
                //end of creation of file

                // MESSAGE(Text008,Cust."No.");
                // IF MemberApplication."Principle Member"<>'' THEN BEGIN
                // Cust.RESET;
                // Cust.SETRANGE("No.",MemberApplication."Principle Member");
                // IF Cust.FINDFIRST THEN BEGIN
                // SendSMS.SendSms(SourceType::"New Member",Cust."Mobile Phone No",Text0003 + ' ' +MemberApplication.Name +', '+
                //                COMPANYNAME +', ',MemberApplication."No.",Cust."No.",FALSE);
                //
                // END;
                // END;
                //MemberApplication.Status:=MemberApplication.Status::Created; MemberApplication.MODIFY;
                SkyNewMembersBuffer.Created := true;
                // SkyNewMembersBuffer."Created By" := USERID;
                // SkyNewMembersBuffer."Created At" := CURRENTDATETIME;
                SkyNewMembersBuffer.Modify;
            until SkyNewMembersBuffer.Next = 0;
        end;
        ProgressWindow.Close;

        Message('Members Created Succesfully');

    end;

    //[Scope('Internal')]
    procedure AccountRegistration(AccountApplication: Record "Savings Account Application")
    var
        SavingsAcc: Record "Savings Accounts";
        AccountSignApp: Record "Signatory Application";
        AccountSign: Record "Account Signatories";
        GenSetUp: Record "General Set-Up";
        ProductFactory: Record "Product Factory";
        Suffix: Integer;
        SuffixText: Text;
        //PeriodicAcc: Codeunit "Periodic Activities";
        IDNumber: Code[20];
        ImageData: Record "Image Data";
        SavingsAccounts: Record "Savings Accounts";
        CustMembrDocuments: Record "Application Documents";
        Text001: Label 'This application has not been approved.';
        Text002: Label 'Are you sure you want to convert this application to Account?';
        Text003: Label 'Account No. %1 created successfully.';
    begin
        /*IF STRLEN(AccountApplication."Transaction Mobile No") < 15 THEN BEGIN
        AccountApplication."Transaction Mobile No":='';
        AccountApplication.MODIFY;
        END;
        
        //IF NOT CONFIRM(Text002) =TRUE THEN EXIT;
        
        //check if member has same type of product account and add a suffix if the product factory allows multiple accounts
          SavingsAcc.RESET;
          SavingsAcc.SETRANGE(SavingsAcc."Member No.",AccountApplication."Member No.");
          SavingsAcc.SETRANGE(SavingsAcc."Product Type",AccountApplication."Product Type");
          Suffix := SavingsAcc.COUNT;
        
               SavingsAcc.INIT;
          IF ProductFactory.GET(AccountApplication."Product Type") THEN
        
            SuffixText := ProductFactory."Account No. Suffix" + FORMAT(Suffix);
            IF STRLEN(SuffixText) = 3 THEN
             SuffixText:=COPYSTR(SuffixText,2);
            IF STRLEN(SuffixText) = 4 THEN
             SuffixText:=COPYSTR(SuffixText,3);
            IF STRLEN(SuffixText) = 5 THEN
             SuffixText:=COPYSTR(SuffixText,4);
          SavingsAcc."No.":= ProductFactory."Account No. Prefix"+AccountApplication."Member No."+'0'+SuffixText;
          SavingsAcc."Product Type" := AccountApplication."Product Type";
          SavingsAcc."Product Name":=ProductFactory."Product Description";
          SavingsAcc."Member No." := AccountApplication."Member No.";
          SavingsAcc.VALIDATE(SavingsAcc.Name,AccountApplication.Name);
          SavingsAcc."ID No.":=AccountApplication."ID No.";
          SavingsAcc."Passport No.":=AccountApplication."Passport No.";
          SavingsAcc."Customer Posting Group":=ProductFactory."Product Posting Group";
          SavingsAcc.County:=AccountApplication.City;
          SavingsAcc."Monthly Contribution":=AccountApplication."Monthly Contribution";
          SavingsAcc.VALIDATE(SavingsAcc."Monthly Contribution");
          SavingsAcc."Phone No.":=AccountApplication."Phone No.";
          SavingsAcc."Mobile Phone No":=AccountApplication."Mobile Phone No";
          SavingsAcc."Current Address":=AccountApplication."Current Address";
          SavingsAcc."Post Code" :=AccountApplication."Post Code";
          SavingsAcc.City:=AccountApplication.City;
          SavingsAcc."Member Category":=AccountApplication."Member Category";
          SavingsAcc.Status:=SavingsAcc.Status::New;
          SavingsAcc."Parent Account No.":=AccountApplication."Parent Account No.";
          SavingsAcc."Country/Region Code" :=AccountApplication."Country/Region Code";
          SavingsAcc."Home Address":=AccountApplication."Home Address";
          SavingsAcc."Registration Date":=TODAY;
          SavingsAcc."Date of Birth":=AccountApplication."Date of Birth";
          SavingsAcc."Birth Certificate No.":=AccountApplication."Birth Certificate No.";
          SavingsAcc."Payroll/Staff No." :=AccountApplication."Payroll/Staff No.";
          SavingsAcc."Recruited By":=AccountApplication."Recruited By";
          SavingsAcc.Gender:=AccountApplication.Gender;
          SavingsAcc."Recruited by Type":=AccountApplication."Recruited by Type";
          SavingsAcc."Relationship Manager":=AccountApplication."Relationship Manager";
          SavingsAcc."Marital Status":=AccountApplication."Marital Status";
          SavingsAcc."Responsibility Center":=AccountApplication."Responsibility Center";
          SavingsAcc."Company Registration No.":=AccountApplication."Company Registration No.";
          SavingsAcc."Employer Code":=AccountApplication."Employer Code";
          SavingsAcc."Old Member No.":=AccountApplication."Old Member No.";
          SavingsAcc."Associated Member No.":= AccountApplication."Associated Member No.";
          SavingsAcc."Global Dimension 1 Code":=AccountApplication."Global Dimension 1 Code";
          SavingsAcc."Global Dimension 2 Code":=AccountApplication."Global Dimension 2 Code";
          SavingsAcc."Group Account No":= AccountApplication."Group Account No";
          SavingsAcc."Created By":=AccountApplication."Created By";
          SavingsAcc."Savings Account No." := AccountApplication."Savings Account No.";
          SavingsAcc."Fixed Deposit Type" := AccountApplication."Fixed Deposit Type";
          SavingsAcc."Product Category":=AccountApplication."Product Category";
          IF SavingsAcc."Product Category" = SavingsAcc."Product Category"::"Fixed Deposit" THEN
          SavingsAcc."Fixed Deposit Status" := AccountApplication."Fixed Deposit Status"::Active;
          SavingsAcc."FD Maturity Date" := AccountApplication."FD Maturity Date";
          SavingsAcc."Neg. Interest Rate" := AccountApplication."Neg. Interest Rate";
          SavingsAcc."FD Duration" := AccountApplication."FD Duration";
          SavingsAcc."FD Maturity Instructions" := AccountApplication."FD Maturity Instructions";
          SavingsAcc."Fixed Deposit cert. no" := AccountApplication."Fixed Deposit cert. no";
          SavingsAcc."Fixed Deposit Amount" := AccountApplication."Fixed Deposit Amount";
          SavingsAcc."Signing Instructions":=AccountApplication."Signing Instructions";
          SavingsAcc.INSERT;
        
          CASE AccountApplication."Product Category" OF
           AccountApplication."Product Category"::"Junior Savings" :
            BEGIN
             AccountApplication.CALCFIELDS(AccountApplication.Picture,AccountApplication.Signature);
             IF (AccountApplication."Birth Certificate No." = '') AND (AccountApplication."Passport No." <> '') THEN
              IDNumber:= AccountApplication."Passport No.";
             IF (AccountApplication."Birth Certificate No." <> '') AND (AccountApplication."Passport No." = '') THEN
              IDNumber:= AccountApplication."Birth Certificate No.";
             IF (AccountApplication."Birth Certificate No." <> '') AND (AccountApplication."Passport No." <> '') THEN
              IDNumber:= AccountApplication."Birth Certificate No.";
        
             AccountApplication.CALCFIELDS(AccountApplication.Picture,AccountApplication.Signature);
        
             ImageData."ID Number":=IDNumber;
             ImageData.Picture:=AccountApplication.Picture;
             ImageData.Signature:=AccountApplication.Signature;
             ImageData."Member No":=SavingsAcc."No.";
             ImageData.INSERT(TRUE);
        
             IF AccountApplication.Picture.HASVALUE THEN BEGIN
             CLEAR(AccountApplication.Picture);
             AccountApplication.MODIFY;
             END;
        
             IF AccountApplication.Signature.HASVALUE THEN BEGIN
             CLEAR(AccountApplication.Signature);
             AccountApplication.MODIFY;
             END;
        
            END;
          END;
        
        CustMembrDocuments.RESET;
        CustMembrDocuments.SETRANGE(CustMembrDocuments."Reference No.",SavingsAcc."Member No.");
        IF CustMembrDocuments.FIND('-') THEN BEGIN
          REPEAT
          EntrNo+=1;
          ApplicationDocuments(EntrNo,CustMembrDocuments."Document Type",CustMembrDocuments."Document No.",CustMembrDocuments.Description,CustMembrDocuments."Single Party/Multiple",
                               SavingsAcc."Member No.",CustMembrDocuments."Product ID",CustMembrDocuments."Product Name",CustMembrDocuments.Provided);
            UNTIL CustMembrDocuments.NEXT=0;
        END;
        
        
          //Advice
          IF SavingsAccounts.GET(SavingsAcc."No.") THEN BEGIN
            SavingsAccounts.VALIDATE(SavingsAccounts."Monthly Contribution");
            END;
          //******
        
        PostRegistrationDeposit(SavingsAcc."Member No.",AccountApplication."Agent Document No",SavingsAcc."Product Type",0);
        
        
         SendSMS.SendSms(SourceType::"New Account",SavingsAcc."Mobile Phone No",Text004 +
                        COMPANYNAME +', '+Text005 + SavingsAccounts."No.",SavingsAcc."No.",SavingsAccounts."No.",FALSE);
        
          AccountApplication.Status:=AccountApplication.Status::Created; AccountApplication.MODIFY;
          MESSAGE(Text003,SavingsAcc ."No.");
          */

    end;
}

