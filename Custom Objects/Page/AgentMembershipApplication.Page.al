page 52185474 "Agent Membership Application"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Activities, ,Category7_caption,Category8_caption,Category9_caption,Approvals';
    SourceTable = "Member Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Application Date"; Rec."Application Date")
                {
                    Caption = 'Application Date';
                    Editable = ApplicationDateEdit;
                }
                field("CRM Application No."; Rec."CRM Application No.")
                {
                    Editable = EmployerEdit;
                }
                field("Old Member No."; Rec."Old Member No.")
                {
                    Editable = EmployerEdit;
                }
                field("Tax Exempted"; Rec."Tax Exempted")
                {
                    Editable = EmployerEdit;
                }
                field("First Name"; Rec."First Name")
                {
                    Editable = FirstNameEdit;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        AutoOpenSavingAccs.Reset;
                        AutoOpenSavingAccs.SetRange("No.", MemberApplication."No.");
                        AutoOpenSavingAccs.SetFilter("Product Category", '<>%1', AutoOpenSavingAccs."Product Category"::"Agent Account");
                        AutoOpenSavingAccs.DeleteAll;
                    end;
                }
                field(Salutation; Rec.Salutation)
                {
                    Editable = EmployerEdit;
                    ShowMandatory = true;
                }
                field("Second Name"; Rec."Second Name")
                {
                    Editable = SecondNameEdit;
                    ShowMandatory = true;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Editable = LastNameEdit;
                    ShowMandatory = true;
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    Editable = EmployerEdit;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        Customer.Get(Rec."Employer Code");
                        if (Customer."Self Employed" = true) or (Rec.Status <> Rec.Status::Open) then
                            SelfEmployed := false else
                            SelfEmployed := true;
                        Rec."Payroll/Staff No." := '';
                    end;
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    Editable = false;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    Editable = DOBEdit;
                    ShowMandatory = true;
                }
                field("ID No."; Rec."ID No.")
                {
                    Editable = IDNoEdit;
                    ShowMandatory = true;
                }
                field("Passport No."; Rec."Passport No.")
                {
                    Editable = PassportNoEdit;
                    ShowMandatory = true;
                }
                field("P.I.N Number"; Rec."P.I.N Number")
                {
                    Editable = PINNumberEdit;
                    ShowMandatory = true;
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                    Editable = SelfEmployed;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Employer Code");
                    end;
                }
                field(Gender; Rec.Gender)
                {
                    Editable = GenderEdit;
                    ShowMandatory = true;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    Editable = MaritalstatusEdit;
                }
                field("Member Segment"; Rec."Member Segment")
                {
                    Editable = SegmentEdit;
                    ShowMandatory = true;
                }
                field("Account Category"; Rec."Account Category")
                {

                    trigger OnValidate()
                    begin
                        if (Rec."Account Category" = Rec."Account Category"::Spouse) or (Rec."Account Category" = Rec."Account Category"::Child) then begin
                            EditPrinciple := true;
                        end else
                            EditPrinciple := false;

                        if Rec."Account Category" = Rec."Account Category"::Diaspora then begin
                            EditCountry := true;
                        end else
                            EditCountry := false;
                    end;
                }
                field("Principle Member"; Rec."Principle Member")
                {
                    Editable = EditPrinciple;
                }
                field("Country Of Operation"; Rec."Country Of Operation")
                {
                    Editable = EditCountry;
                }
                field("Dividend Payment Method"; Rec."Dividend Payment Method")
                {
                    Visible = false;
                }
                field("Member Category"; Rec."Member Category")
                {
                    Editable = MemberCategoryEdit;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = RespCenterEdit;
                    ShowMandatory = true;
                }
                field("Relationship Manager"; Rec."Relationship Manager")
                {
                    Editable = RelationshipManager;
                    Visible = false;
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                }
                field(Type; Rec.Type)
                {
                    Editable = EmailEdit;
                }
                field(Status; Rec.Status)
                {

                    trigger OnValidate()
                    begin
                        StatusControl;
                    end;
                }
            }
            group("Communication Details")
            {
                field(Nationality; Rec.Nationality)
                {
                    Editable = NationalityEdit;
                    ShowMandatory = true;
                }
                field("Current Address"; Rec."Current Address")
                {
                    Caption = 'P.O. BOX';
                    Editable = AddressEdit;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Editable = PostCodeEdit;
                    Importance = Promoted;
                }
                field(County; Rec.County)
                {
                    Editable = CountyEdit;
                    ShowMandatory = true;
                }
                field(City; Rec.City)
                {
                    Caption = 'City';
                    Editable = CityEdit;
                }
                field("Office Telephone No."; Rec."Phone No.")
                {
                    Caption = 'Office Telephone No.';
                    Editable = PhoneEdit;
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                    Editable = MobileNoEdit;
                    ShowMandatory = true;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Editable = EmailEdit;
                }
            }
            group("Other Information")
            {
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = GlobalDim1Edit;
                    ShowMandatory = true;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = GlobalDim2Edit;
                    ShowMandatory = true;
                }
                field("Recruited by Type"; Rec."Recruited by Type")
                {
                }
                field("Recruited By"; Rec."Recruited By")
                {
                    Caption = 'Recruited By';
                    Editable = SalesEdit;
                }
                field("Recruited By Name"; Rec."Recruited By Name")
                {
                }
                field("Electrol Zone"; Rec."Electrol Zone")
                {
                    Editable = ElectrolZoneEdit;
                }
                field("Electrol Zone Descr."; Rec."Electrol Zone Descr.")
                {
                }
                field("Area Service Center"; Rec."Area Service Center")
                {
                    Editable = AreaServiceCenterEdit;
                }
            }
            group("Bank Details")
            {
                field("Bank Code"; Rec."Bank Code")
                {
                    Editable = BankEdit;
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    Editable = BranchEdit;
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    Editable = BankAccountNoEdit;
                }
            }
            part(Control80; "Virtual Registrations List")
            {
                SubPageLink = "ID/Passport" = FIELD("ID No.");
                Visible = AgentSource;
            }
        }
        area(factboxes)
        {
            part(Control82; "Virtual Registration Fact Box")
            {
                SubPageLink = "ID/Passport" = FIELD("ID No.");
                Visible = AgentSource;
            }
            part(Control83; "Agent Registration Fact Box")
            {
                SubPageLink = IDNO = FIELD("ID No.");
                Visible = AgentSource;
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action44)
            {
            }
            action("Next Of KIN")
            {
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Next of KIN Application";
                RunPageLink = "Account No" = FIELD("No."),
                              Type = FILTER("Next of Kin" | Spouse | "Benevolent Beneficiary");
            }
            separator(Action53)
            {
            }
            action("Family Member")
            {
                Caption = 'Sinkfund Members';
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Family Member App.";
                RunPageLink = "Account No" = FIELD("No.");
            }
            separator(Action29)
            {
            }
            action("Default Savings Product")
            {
                Image = Accounts;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Savings Account Registration";
                RunPageLink = "No." = FIELD("No.");
            }
            separator(Action55)
            {
            }
            action("Picture & Signature")
            {
                Image = Picture;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Member App Picture & Signature";
                RunPageLink = "No." = FIELD("No.");
            }
            separator(Action37)
            {
            }
            action("Application Document")
            {
                Image = Allocations;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Application Documents";
                RunPageLink = "Reference No." = FIELD("No.");
            }
            separator(Action18)
            {
            }
            action("Social Listening Sites")
            {
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Social Listening Sites App.";
                RunPageLink = "Account No." = FIELD("No.");
            }
            separator(Action24)
            {
            }
            action("Reset Application Details")
            {
                Image = Refresh;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    RegistrationMngt: Codeunit "Registration Process";
                    Text002: Label 'Are you sure you want to convert this application to membership?';
                    Text003: Label 'Are you sure you want to reset this application details?';
                    UserSetup: Record "User Setup";
                    Application: Record "Member Application";
                begin

                    Rec.TestField(Status, Rec.Status::Open);

                    if not Confirm(Text003) = true then exit;
                    UserSetup.Reset;
                    UserSetup.SetRange("User ID", UserId);
                    if UserSetup.FindFirst then begin
                        UserSetup.TestField("Global Dimension 1 Code");
                        UserSetup.TestField("Global Dimension 2 Code");
                        UserSetup.TestField("Responsibility Centre");
                        Application.Reset;
                        Application.SetRange("No.", Rec."No.");
                        if Application.Find('-') then begin
                            Rec."Application Date" := Today;
                            Rec."Created By" := UserId;
                            Rec."Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                            Rec."Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                            Rec."Responsibility Center" := UserSetup."Responsibility Centre";
                            Rec."First Name" := '';
                            Rec."Second Name" := '';
                            Rec.Name := '';
                            Rec."ID No." := '';
                            Rec."Last Name" := '';
                            Rec."Date of Birth" := 0D;
                            Rec."Payroll/Staff No." := '';
                            Rec."Employer Code" := '';
                            Rec."P.I.N Number" := '';
                            Rec."Mobile Phone No" := '';
                            Rec.Modify;

                        end;
                    end;
                end;
            }
            action("Create Member")
            {
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    RegistrationMngt: Codeunit "Registration Process";
                    Text002: Label 'Are you sure you want to convert this application to membership?';
                begin

                    Rec.TestField(Status, Rec.Status::Approved);

                    if not Confirm(Text002) = true then exit;
                    // RegistrationMngt.MemberRegistration(Rec);
                end;
            }
        }
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        Rec.TestField(Status, Rec.Status::Pending);

                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        Rec.TestField(Status, Rec.Status::Pending);

                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        Rec.TestField(Status, Rec.Status::Pending);

                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Comments";
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        NextofKinError: Label 'You must specify next of Kin for this application.';
                    begin
                        AutoOpenSavingAccs.Reset;
                        AutoOpenSavingAccs.SetRange("No.", MemberApplication."No.");
                        AutoOpenSavingAccs.SetFilter("Product Category", '<>%1', AutoOpenSavingAccs."Product Category"::"Agent Account");
                        AutoOpenSavingAccs.DeleteAll;

                        Rec.TestField(Status, Rec.Status::Open);


                        case Rec."Single Party/Multiple/Business" of
                            Rec."Single Party/Multiple/Business"::Single:
                                begin
                                    Rec.TestField(Salutation);
                                    Rec.TestField("First Name");
                                    Rec.TestField("Last Name");
                                    Rec.TestField("Date of Birth");
                                    Rec.TestField("ID No.");
                                    Rec.TestField("P.I.N Number");
                                    Rec.TestField("Employer Code");
                                    Rec.TestField("Marital Status");
                                    Rec.TestField(Gender);
                                    Rec.TestField("Member Segment");
                                    Rec.TestField("Member Category");
                                    Rec.TestField("Mobile Phone No");
                                    Rec.TestField("Post Code");
                                    Rec.TestField("Global Dimension 1 Code");
                                    Rec.TestField("Global Dimension 2 Code");
                                    Rec.TestField(County);
                                    Rec.TestField(Nationality);

                                    Rec.Testfield("Mobile Phone No");
                                    Rec./*TESTFIELD("Recruited By");*/ //TESTFIELD("Electrol Zone");
                                    CalcFields(Picture, Signature);
                                    Rec.TestField("Account Category");

                                    if Rec."Self Employed" = false then begin

                                        Rec.TestField("Payroll/Staff No.");
                                    end;
                                    if not Rec.Picture.HasValue then
                                        if not Confirm('You have not captured Pics. Do you wish to Continue?') then begin
                                            Rec.TestField(Picture);
                                            ;
                                        end;
                                    if not Rec.Signature.HasValue then
                                        if not Confirm('You have not captured signature. Do you wish to Continue?') then begin
                                            Rec.TestField(Signature);
                                        end;


                                    if (Rec."Account Category" = Rec."Account Category"::Spouse) or (Rec."Account Category" = Rec."Account Category"::Child) then begin
                                        Rec.TestField(Rec."Principle Member");

                                    end;
                                    if (Rec."ID No." = '') and (Rec."Passport No." = '') and (Rec."P.I.N Number" = '') and (Rec."Birth Certificate No." = '') then
                                        Error(Text003);

                                    /*Rec.TestField("Bank Code"); TESTFIELD("Branch Code"); Rec.TESTFIELD("Bank Account No.");*/
                                end;
                        end;

                        NextofKINApplication.Reset;
                        NextofKINApplication.SetRange("Account No", Rec."No.");
                        if not NextofKINApplication.FindFirst then begin
                            if not Confirm('You have not captured next of kin details, Do you wish to Continue?') then
                                Error(NextofKinError);
                        end;

                        /*MemberApplication.RESET;
                        MemberApplication.SETRANGE("No.",Rec."No.");
                        IF MemberApplication.FIND('-') THEN BEGIN
                          MemberApplication."Application Date":=TODAY;
                          MemberApplication."Created By":=USERID;
                          MemberApplication.MODIFY;
                        END;*/

                        if Rec.Source = Rec.Source::Agency then begin
                            VirtualRegistrations.Reset;
                            VirtualRegistrations.SetRange(VirtualRegistrations."ID/Passport", Rec."ID No.");
                            if VirtualRegistrations.Find('-') then begin
                                if not Confirm('This Member application does not have IPRIS Details Do you wish to proceed? ') then exit;
                            end;
                        end;



                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        Rec.TestField(Rec.Status, Rec.Status::Pending);

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
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
                        DMS.SetRange(DMS.Key, DMS.Key::"member App");
                        if DMS.Find('-') then begin
                            HyperLink(DMS."url path" + Rec."No.");
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        StatusControl;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Membership Option" := Rec."Membership Option"::Agent;
        AutoOpenSavingAccs.Reset;
        AutoOpenSavingAccs.SetRange("No.", MemberApplication."No.");
        //AutoOpenSavingAccs.SETFILTER("Product Category",'<>%1',AutoOpenSavingAccs."Product Category"::"Agent Account");
        AutoOpenSavingAccs.SetFilter("Product Type", '<>%1&<>%2', '505', '512');
        AutoOpenSavingAccs.DeleteAll;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Source := Rec.Source::Navision;
        Rec."Single Party/Multiple/Business" := Rec."Single Party/Multiple/Business"::Single;
        Rec."Membership Option" := Rec."Membership Option"::Agent;
        AutoOpenSavingAccs.Reset;
        AutoOpenSavingAccs.SetRange("No.", Rec."No.");
        //AutoOpenSavingAccs.SETFILTER("Product Category",'<>%1',AutoOpenSavingAccs."Product Category"::"Agent Account");
        AutoOpenSavingAccs.SetFilter("Product Type", '<>%1&<>%2', '505', '512');
        AutoOpenSavingAccs.DeleteAll;
    end;

    trigger OnOpenPage()
    begin
        StatusControl;
        Rec."Membership Option" := Rec."Membership Option"::Agent;
        if MemberApplication.Get(Rec."No.") then begin
            AutoOpenSavingAccs.Reset;
            AutoOpenSavingAccs.SetRange("No.", MemberApplication."No.");
            //AutoOpenSavingAccs.SETFILTER("Product Category",'<>%1',AutoOpenSavingAccs."Product Category"::"Agent Account");
            AutoOpenSavingAccs.SetFilter("Product Type", '<>%1&<>%2', '505', '512');
            AutoOpenSavingAccs.DeleteAll;
            ProductFactory.SetFilter(ProductFactory.Status, '%1', ProductFactory.Status::Active);
            //ProductFactory.SETFILTER(ProductFactory."Auto Open Account",'%1',TRUE);
            //ProductFactory.SETRANGE(ProductFactory."Product Category",ProductFactory."Product Category"::"Agent Account");
            ProductFactory.SetRange("Product ID", '512', '505');
            if ProductFactory.Find('-') then begin
                repeat
                    AutoOpenSavingAccs.Reset;
                    AutoOpenSavingAccs.SetRange("No.", MemberApplication."No.");
                    AutoOpenSavingAccs.SetRange("Product Type", ProductFactory."Product ID");
                    if AutoOpenSavingAccs.Find('-') then begin
                        AutoOpenSavingAccs."Monthly Contribution" := ProductFactory."Minimum Contribution";
                        AutoOpenSavingAccs.Modify;
                    end;
                until ProductFactory.Next = 0;
            end;
        end;
    end;

    var
        GenSetup: Record "General Set-Up";
        ApplicationDateEdit: Boolean;
        FirstNameEdit: Boolean;
        SecondNameEdit: Boolean;
        LastNameEdit: Boolean;
        AddressEdit: Boolean;
        EmployerEdit: Boolean;
        GlobalDim1Edit: Boolean;
        GlobalDim2Edit: Boolean;
        SalesEdit: Boolean;
        DOBEdit: Boolean;
        IDNoEdit: Boolean;
        PassportNoEdit: Boolean;
        StaffNoEdit: Boolean;
        PINNumberEdit: Boolean;
        BirthCertEdit: Boolean;
        GenderEdit: Boolean;
        MaritalstatusEdit: Boolean;
        SegmentEdit: Boolean;
        GroupAccountNoEdit: Boolean;
        EmailEdit: Boolean;
        RespCenterEdit: Boolean;
        PhoneEdit: Boolean;
        RelationshipManager: Boolean;
        MobileNoEdit: Boolean;
        PostCodeEdit: Boolean;
        ElectrolZoneEdit: Boolean;
        AreaServiceCenterEdit: Boolean;
        CityEdit: Boolean;
        MemberCategoryEdit: Boolean;
        NationalityEdit: Boolean;
        CountyEdit: Boolean;
        Text001: Label 'Date of Birth cannot be greater than today.';
        Text002: Label 'This applicant is below the mininmum membership age of %1.';
        BankEdit: Boolean;
        BranchEdit: Boolean;
        ApplicationDocumentEdit: Boolean;
        BankAccountNoEdit: Boolean;
        NextofKINApplication: Record "Next of KIN Application";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        Text003: Label 'You must provide either ID Number, Passport No., P.I.N Number or Birth Cerificate No.';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ProductFactory: Record "Product Factory";
        AutoOpenSavingAccs: Record "Savings Account Registration";
        MemberApplication: Record "Member Application";
        [InDataSet]
        AgentSource: Boolean;
        EditPrinciple: Boolean;
        SelfEmployed: Boolean;
        Customer: Record Customer;
        EditCountry: Boolean;
        VirtualRegistrations: Record "Virtual Registrations";

    //[Scope('Internal')]
    procedure StatusControl()
    begin
        case Rec.Status of
            Rec.Status::Open:
                begin
                    ApplicationDateEdit := true;
                    FirstNameEdit := true;
                    SecondNameEdit := true;
                    LastNameEdit := true;
                    DOBEdit := true;
                    IDNoEdit := true;
                    PassportNoEdit := true;
                    PINNumberEdit := true;
                    BirthCertEdit := true;
                    StaffNoEdit := true;
                    GenderEdit := true;
                    MaritalstatusEdit := true;
                    SegmentEdit := true;
                    RespCenterEdit := true;
                    GroupAccountNoEdit := true;
                    MemberCategoryEdit := true;
                    ElectrolZoneEdit := true;
                    AreaServiceCenterEdit := true;

                    PhoneEdit := true;
                    MobileNoEdit := true;
                    EmailEdit := true;
                    AddressEdit := true;
                    PostCodeEdit := true;
                    CityEdit := false;
                    NationalityEdit := true;
                    CountyEdit := true;
                    RelationshipManager := true;

                    EmployerEdit := true;
                    GlobalDim1Edit := true;
                    GlobalDim2Edit := true;
                    SalesEdit := true;

                    BankEdit := true;
                    BranchEdit := true;
                    BankAccountNoEdit := true;

                end;

            Rec.Status::Pending, Rec.Status::Approved, Rec.Status::Rejected, Rec.Status::Created:
                begin
                    ApplicationDateEdit := false;
                    FirstNameEdit := false;
                    SecondNameEdit := false;
                    LastNameEdit := false;
                    DOBEdit := false;
                    IDNoEdit := false;
                    PassportNoEdit := false;
                    PINNumberEdit := false;
                    BirthCertEdit := false;
                    StaffNoEdit := false;
                    GenderEdit := false;
                    MaritalstatusEdit := false;
                    SegmentEdit := false;
                    RespCenterEdit := false;
                    GroupAccountNoEdit := false;
                    MemberCategoryEdit := false;
                    ElectrolZoneEdit := false;
                    AreaServiceCenterEdit := false;

                    PhoneEdit := false;
                    MobileNoEdit := false;
                    EmailEdit := false;
                    AddressEdit := false;
                    PostCodeEdit := false;
                    CityEdit := false;
                    NationalityEdit := false;
                    CountyEdit := false;
                    RelationshipManager := false;

                    EmployerEdit := false;
                    GlobalDim1Edit := false;
                    GlobalDim2Edit := false;
                    SalesEdit := false;

                    BankEdit := false;
                    BranchEdit := false;
                    BankAccountNoEdit := false;
                end;

        end;

        AgentSource := false;
        if Rec.Source = Rec.Source::Agency then
            AgentSource := true;
    end;

    //[Scope('Internal')]
    procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;
}

