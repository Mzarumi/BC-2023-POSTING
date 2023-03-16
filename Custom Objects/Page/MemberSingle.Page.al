page 52185726 "Member Single"
{
    //DeleteAllowed = false;
    //Editable = false;
    //InsertAllowed = false;
    PageType = Card;
    UsageCategory = Administration;
    PromotedActionCategories = 'New,Process,Reports,Information, ,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = Members;


    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = true;
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Old Member No."; Rec."Old Member No.")
                {
                }
                field(Salutation; Rec.Salutation)
                {
                }
                field(Name; Rec.Name)
                {
                    Visible = false;
                }
                field(Comment; Rec.Comment)
                {
                }
                field("First Name"; Rec."First Name")
                {
                    ShowMandatory = true;
                }
                field("Second Name"; Rec."Second Name")
                {
                    ShowMandatory = true;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ShowMandatory = true;
                }
                field("Tax Exempted"; Rec."Tax Exempted")
                {
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    Editable = true;
                }
                field("ID No."; Rec."ID No.")
                {
                    Caption = 'ID Number';
                    Visible = GroupAccout;
                }
                field("Passport No."; Rec."Passport No.")
                {
                }
                field("P.I.N Number"; Rec."P.I.N Number")
                {
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    Caption = 'Date Of birth';
                    Editable = true;
                    Visible = true;
                }
                field("Birth Certificate No."; Rec."Birth Certificate No.")
                {
                }
                // field(NotAvailable; Rec.NotAvailable)
                // {
                //     Caption = 'Alert';
                //     Style = Attention;
                //     StyleExpr = TRUE;
                // }
                // field("Branch Official"; Rec.BranchOfficial)
                // {
                // }
                field(Gender; Rec.Gender)
                {
                    ValuesAllowed = Male, Female;
                    Visible = GroupDetailsVisible;
                }
                field(txtMarital; Rec."Marital Status")
                {
                    Caption = 'Marital Status';
                    Visible = GroupDetailsVisible;
                }
                field("Member Segment"; Rec."Member Segment")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                    Visible = GroupAccout;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Employer Code");
                    end;
                }
                field(Classification; Rec.Classification)
                {
                }
                field(Status; Rec.Status)
                {

                    trigger OnValidate()
                    begin
                        /*StatusPermissions.RESET;
                        StatusPermissions.SETRANGE(StatusPermissions."User ID",USERID);
                        StatusPermissions.SETRANGE(StatusPermissions."Function",StatusPermissions."Function"::"9");
                        IF StatusPermissions.FIND('-') = FALSE THEN
                        ERROR('You do not have permissions to change the account status.');*/

                    end;
                }
                field("Allow MBoosta Defaulter"; Rec."Allow MBoosta Defaulter")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Member Category"; Rec."Member Category")
                {
                }
                field("Status Change Statistics"; Rec."Status Change Statistics")
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    Editable = false;
                }
                field("Account Category"; Rec."Account Category")
                {
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = true;
                }
                field("Dividend Action"; Rec."Dividend Action")
                {
                }
                field("Allow DAdvace Defaulter"; Rec."Allow DAdvace Defaulter")
                {
                }
            }
            group("Communication ")
            {
                field(Nationality; Rec.Nationality)
                {
                }
                field(County; Rec.County)
                {
                }
                field("Post Code"; Rec."Post Code")
                {
                    Caption = 'Post Code/City';
                }
                field(City; Rec.City)
                {
                }
                field("Current Address"; Rec."Current Address")
                {
                    Editable = false;
                }
                field("Home Address"; Rec."Home Address")
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                    Caption = 'Office Telephone No.';
                    Editable = true;
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                }
                field("MPESA Mobile No"; Rec."MPESA Mobile No")
                {
                    Caption = 'Mobile Money No.';
                    Editable = true;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
            }
            group("Group Account.")
            {
                Editable = true;
                Visible = GroupDetails;
                field("Group Type"; Rec."Group Type")
                {
                }
                field("Group Account No."; Rec."Group Account No.")
                {
                }
                field("Group Account"; Rec."Group Account")
                {
                }
                field("Company Registration No."; Rec."Company Registration No.")
                {
                }
                field("Date of Business Reg."; Rec."Date of Business Reg.")
                {
                }
                field("Business/Group Location"; Rec."Business/Group Location")
                {
                }
                field("Plot/Bldg/Street/Road"; Rec."Plot/Bldg/Street/Road")
                {
                }
                field("Single Party/Multiple"; Rec."Single Party/Multiple")
                {
                }
            }
            group("Other Information")
            {
                field("Region Code"; Rec."Region Code")
                {
                }
                field("Region Code Name"; Rec."Region Code Name")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    ShowMandatory = true;
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ShowMandatory = true;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ShowMandatory = true;
                }
                field("Relationship Manager"; Rec."Relationship Manager")
                {
                    Visible = false;
                }
                field("Recruited By"; Rec."Recruited By")
                {
                }
                field("Recruited By Name"; Rec."Recruited By Name")
                {
                }
                field(Hide; Rec.Hide)
                {
                }
            }
            group("Bank Details")
            {
                field("Bank Code"; Rec."Bank Code")
                {
                }
                field("Branch Code"; Rec."Branch Code")
                {
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action28)
            {
            }
            action("Next of KIN")
            {
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Next of KIN";
                RunPageLink = "Account No" = FIELD("No."),
                              Type = FILTER("Next of Kin" | Spouse | "Benevolent Beneficiary");
            }
            separator(Action58)
            {
            }
            action("Family Member")
            {
                Caption = 'Sinkfund Members';
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Family Member";
                RunPageLink = "Account No" = FIELD("No.");
            }
            separator(Action31)
            {
            }
            action("Picture & Signature")
            {
                Image = Signature;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Member Picture & Signature";
                RunPageLink = "Member No" = FIELD("No.");
            }
            separator(Action41)
            {
            }
            action("Loanee Information Base")
            {
                Image = CancelAttachment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Loanee Information Base";
                RunPageLink = "Member No." = FIELD("No.");
            }
            action("Member Document")
            {
                Image = Allocations;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Member Documents";
                RunPageLink = "Reference No." = FIELD("No.");
            }
            separator(Action78)
            {
            }
            action("Account Association")
            {
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    AccountAssociations.Reset;
                    if AccountAssociations.FindLast then
                        AccountAssociations.EntyNo := EntryNo + 1;

                    AccountSignatories.Reset;
                    AccountSignatories.SetRange("ID Number", Rec."ID No.");
                    if AccountSignatories.Find('-') then begin
                        repeat

                            AccountAssociations.Reset;
                            AccountAssociations.SetRange("Account No.", AccountSignatories."Account No");
                            if not AccountAssociations.Find('-') then begin
                                AccountAssociations.Init;
                                AccountAssociations.EntyNo := EntryNo;
                                AccountAssociations."Member No." := Rec."No.";

                                //      AccountAssociations.Type:=AccountSignatories.Type;
                                AccountAssociations."ID No." := Rec."ID No.";
                                AccountAssociations.Description := 'Signatory';
                                AccountAssociations."Account No." := AccountSignatories."Account No";
                                if CustMembr.Get(AccountSignatories."Account No") then
                                    AccountAssociations."Account Name" := CustMembr.Name;
                                AccountAssociations.Insert;
                            end else begin
                                AccountAssociations.EntyNo := EntryNo;
                                AccountAssociations."Member No." := Rec."No.";

                                //AccountAssociations.Type:=AccountSignatories.Type;
                                AccountAssociations."ID No." := Rec."ID No.";
                                AccountAssociations.Description := 'Signatory';
                                AccountAssociations."Account No." := AccountSignatories."Account No";
                                if CustMembr.Get(AccountSignatories."Account No") then
                                    AccountAssociations."Account Name" := CustMembr.Name;
                                AccountAssociations.Modify;
                            end;
                        until AccountSignatories.Next = 0;
                    end;

                    AccountAssociations.Reset;
                    AccountAssociations.SetRange("Member No.", Rec."No.");
                    if AccountAssociations.Find('-') then
                        PAGE.Run(52186424, AccountAssociations);
                end;
            }
            separator(Action89)
            {
            }
            action("Social Listening Sites")
            {
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Social Listening Sites";
                RunPageLink = "Account No." = FIELD("No.");
            }
            separator(Action74)
            {
            }
            action("Member Collaterals")
            {
                Image = AvailableToPromise;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Member Collaterals";
                RunPageLink = "Member No" = FIELD("No.");
                Visible = false;
            }
            separator(Action77)
            {
            }
            action("Check Off Advice")
            {
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Checkoff Advice";
                RunPageLink = "Member No." = FIELD("No.");
            }
            separator(Action87)
            {
            }
            action("Checkoff Advice Variance")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "Checkoff Advice Variance";
            }
            separator(Action92)
            {
            }
            action("Promise Topay")
            {
                Image = PaymentDays;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Promise Topay";
                RunPageLink = "No." = FIELD("No.");
            }
            separator(Action90)
            {
            }
            action("Dividend Instructions")
            {
                Image = InsertAccount;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Dividend Instructions - Member";
                RunPageLink = "Member No." = FIELD("No.");
            }
            separator(Action70)
            {
            }
            action(FingerPrints)
            {
                Caption = 'FingerPrints';
                Image = Filed;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec."FingerPrint Verified" := false;
                    Rec.Modify;

                    FingerprintProcessingFn.RunInputFingerPrints(Rec."No.", Rec.Name, Rec."ID No.");
                end;
            }
            action(VerifyPrints)
            {
                Caption = 'VerifyPrints';
                Image = ValidateEmailLoggingSetup;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    MyGuid: Guid;
                begin
                    Rec.SystemGeneratedGuid := CreateGuid;
                    Rec.Modify;

                    Rec."FingerPrint Verified" := false;
                    Rec."FingerPrint Verified" := (FingerprintProcessingFn.VerifyFingerPrints(Rec."No.", Rec.Name, Rec."ID No.", Rec.SystemGeneratedGuid));
                    Rec.Modify;
                end;
            }
            separator(Action69)
            {
            }
            action("Member Statistics")
            {
                Image = StatisticsGroup;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Member Statistics";
                RunPageLink = "No." = FIELD("No.");

                trigger OnAction()
                begin
                    if Rec.Hide = true then begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Show Hidden" = false then
                                Error('You do not have permissions to view this account information.');
                        end;
                    end;
                end;
            }
        }
        area(reporting)
        {
            action(Statement)
            {
                Image = Customer;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    if Rec.Hide = true then begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Show Hidden" = false then
                                Error('You do not have permissions to view this account information.');
                        end;
                    end;


                    CustMembr.Reset;
                    CustMembr.SetRange(CustMembr."No.", Rec."No.");
                    //if CustMembr.Find('-') then
                    //REPORT.Run(52185692, true, false, CustMembr);
                end;
            }
            action("Loan Statement")
            {
                Image = CreateCreditMemo;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    if Rec.Hide = true then begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Show Hidden" = false then
                                Error('You do not have permissions to view this account information.');
                        end;
                    end;


                    CustMembr.Reset;
                    CustMembr.SetRange(CustMembr."No.", Rec."No.");
                    //if CustMembr.Find('-') then
                    //REPORT.Run(52185767, true, false, CustMembr);
                end;
            }
            separator(Action66)
            {
            }
            action("Dividend Deduction")
            {
                Image = Database;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Page "Dividend Posting Buffer";
                RunPageLink = "Member No." = FIELD("No.");
            }
            separator(Action25)
            {
            }
            action("E-Mail Statement")
            {
                Caption = 'E-Mail Statement';
                Image = Email;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                    CustMembr := Rec;
                    CurrPage.SetSelectionFilter(CustMembr);
                    CustMembr.EmailRecords(true);
                end;
            }
            action("MEMBER [FILE]")
            {
                Image = Document;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                var
                    DMS: Record EDMS;
                begin
                    DMS.Reset;
                    DMS.SetRange(DMS.Key, DMS.Key::"Member File");
                    if DMS.Find('-') then begin
                        HyperLink(DMS."url path" + Rec."No.");
                    end;
                end;
            }
            action("New Member Statement ")
            {
                Image = Customer;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    if Rec.Hide = true then begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Show Hidden" = false then
                                Error('You do not have permissions to view this account information.');
                        end;
                    end;

                    CustMembr.Reset;
                    CustMembr.SetRange(CustMembr."No.", Rec."No.");
                    //if CustMembr.Find('-') then
                    //REPORT.Run(52186055, true, false, CustMembr);
                end;
            }
            action("Member Statement[ Historical ]")
            {
                Image = customer;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    if Rec.Hide = true then begin
                        if UserSetup.Get(UserId) then begin
                            if UserSetup."Show Hidden" = false then
                                Error('You do not have permissions to view this account information.');
                        end;
                    end;

                    CustMembr.Reset;
                    CustMembr.SetRange(CustMembr."No.", Rec."No.");
                    //if CustMembr.Find('-') then
                    //REPORT.Run(52186291, true, false, CustMembr);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        //*
        "BranchOfficial??";
        lblIDVisible := true;
        lblDOBVisible := true;
        lblRegNoVisible := false;
        lblRegDateVisible := false;
        lblGenderVisible := true;
        txtGenderVisible := true;
        lblMaritalVisible := true;
        txtMaritalVisible := true;

        if Rec."Account Category" <> Rec."Account Category"::" " then begin
            lblIDVisible := false;
            lblDOBVisible := false;
            lblRegNoVisible := true;
            lblRegDateVisible := true;
            lblGenderVisible := false;
            txtGenderVisible := false;
            lblMaritalVisible := false;
            txtMaritalVisible := false;
        end;

        if Rec."Global Dimension 1 Code" <> 'MICRO' then begin
            GroupDetailsVisible := false;
            txtMaritalVisible := false;
        end else begin
            GroupDetailsVisible := true;
        end;

        //--...Missing Data
        NotAvailable := NotAvailableData(Rec);
    end;

    trigger OnInit()
    begin
        //*
        txtMaritalVisible := true;
        lblMaritalVisible := true;
        txtGenderVisible := true;
        lblGenderVisible := true;
        lblRegDateVisible := true;
        lblRegNoVisible := true;
        lblDOBVisible := true;
        lblIDVisible := true;
    end;

    trigger OnOpenPage()
    begin
        //*check if delegate
        "BranchOfficial??";

        if Rec.Hide = true then begin
            if UserSetup.Get(UserId) then begin
                if UserSetup."Show Hidden" = false then
                    Error('You do not have permissions to view this account information.');
            end;
        end;
        GroupControls;
        AccountAccessLogging;
    end;

    var
        [InDataSet]
        lblIDVisible: Boolean;
        [InDataSet]
        lblDOBVisible: Boolean;
        [InDataSet]
        lblRegNoVisible: Boolean;
        [InDataSet]
        lblRegDateVisible: Boolean;
        [InDataSet]
        lblGenderVisible: Boolean;
        [InDataSet]
        txtGenderVisible: Boolean;
        [InDataSet]
        lblMaritalVisible: Boolean;
        [InDataSet]
        txtMaritalVisible: Boolean;
        AccNo: Code[20];
        GenledSetup: Record "General Set-Up";
        GroupAccout: Boolean;
        GroupDetails: Boolean;
        GroupDetailsVisible: Boolean;
        CustMembr: Record Members;
        FingerprintProcessingFn: Codeunit "Fingerprint Processing Fn";
        UserSetup: Record "User Setup";
        AccountSignatories: Record "Account Signatories";
        Customer: Record Customer;
        Vendor: Record Vendor;
        AccountAssociations: Record "Account Associations";
        EntryNo: Integer;
        BranchOfficial: Text[100];
        DelegateMembers: Record "Delegate Memberss";
        NotAvailable: Text;

    local procedure GroupControls()
    begin
        if Rec."Group Type" <> Rec."Group Type"::" " then begin
            GroupAccout := false;
            GroupDetails := true;
        end else begin
            GroupAccout := true;
            GroupDetails := false;
        end;
    end;

    //[Scope('Internal')]
    procedure "BranchOfficial??"()
    begin
        DelegateMembers.Reset;
        DelegateMembers.SetRange(DelegateMembers."Delegate MNO.", Rec."No.");
        DelegateMembers.SetRange(DelegateMembers.Retired, false);
        if DelegateMembers.Find('-') then begin
            BranchOfficial := 'Yes';
        end;
    end;

    //[Scope('Internal')]
    procedure AccountAccessLogging()
    var
        AccountAccessLog: Record "Account Access Log";
    begin
        AccountAccessLog.Init;
        AccountAccessLog.Source := AccountAccessLog.Source::Member;
        AccountAccessLog."Account No." := Rec."No.";
        AccountAccessLog.Date := Today;
        AccountAccessLog."Info Source" := AccountAccessLog."Info Source"::"Member Card";
        AccountAccessLog.Time := Time;
        AccountAccessLog."User Id" := UserId;
        AccountAccessLog.Insert(true);
    end;

    local procedure NotAvailableData(Members: Record Members) Str: Text[250]
    var
        ImageData: Record "Image Data";
        NextofKIN: Record "Next of KIN";
    begin
        //Check Condation available

        NextofKIN.Reset;
        NextofKIN.SetRange("Account No", Members."No.");
        if not NextofKIN.Find('-') then begin
            Str := 'KIN/'
        end;

        ImageData.Reset;
        ImageData.SetRange("Member No", Members."No.");
        if ImageData.Find('-') then begin
            ImageData.CalcFields(Picture, Signature);
            if (ImageData.Picture.HasValue = false) or (ImageData.Signature.HasValue = false) then begin
                Str := Str + 'Picture and Signature/'
            end;
        end;


        if Members."Date of Birth" = 0D then begin
            Str := Str + 'Date of Birth/';
        end;

        if Members."Mobile Phone No" = '' then begin
            Str := Str + 'Phone No./'
        end;

        if Members."E-Mail" = '' then begin
            Str := Str + 'E-mail'
        end;
    end;
}

