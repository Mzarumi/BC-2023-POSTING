page 52185716 "Member Application Group"
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
                field("CRM Application No."; Rec."CRM Application No.")
                {
                    Editable = EmployerEdit;
                    Visible = false;
                }
                field("Application Date"; Rec."Application Date")
                {
                    Caption = 'Membership Date';
                    Editable = false;
                }
                field("Group/Business"; Rec."Single Party/Multiple/Business")
                {
                    Editable = MemberType;
                    ValuesAllowed = Multiple, Business;

                    trigger OnValidate()
                    begin
                        AccoutTypeControl;
                        Rec."Application Date" := Today;
                    end;
                }
                field(Name; Rec."First Name")
                {
                    Editable = FirstNameEdit;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        Rec."Application Date" := Today;
                    end;
                }
                field("Second Name"; Rec."Second Name")
                {
                    Editable = FirstNameEdit;
                    Visible = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Editable = FirstNameEdit;
                    Visible = false;
                }
                field("P.I.N Number"; Rec."P.I.N Number")
                {
                    Editable = PINNumberEdit;
                }
                field("Member Category"; Rec."Member Category")
                {
                }
                field(Type; Rec.Type)
                {
                    Editable = EmailEdit;
                    Visible = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = false;
                    ShowMandatory = true;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;

                    trigger OnValidate()
                    begin
                        AccoutTypeControl;
                    end;
                }
                field("ID No."; Rec."ID No.")
                {
                    Editable = FirstNameEdit;
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Employer Code"; Rec."Employer Code")
                {
                    Editable = EmployerEdit;
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                    Editable = FirstNameEdit;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField("Employer Code");
                    end;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                    ShowMandatory = true;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                    ShowMandatory = true;
                }
                field("Recruited by Type"; Rec."Recruited by Type")
                {
                    Editable = EmployerEdit;
                }
                field("Recruited By"; Rec."Recruited By")
                {
                    Caption = 'Recruited By';
                    Editable = SalesEdit;
                }
                field("Electrol Zone"; Rec."Electrol Zone")
                {
                }
                field("Electrol Zone Descr."; Rec."Electrol Zone Descr.")
                {
                    ShowMandatory = true;
                    Visible = false;
                }
                field("Area Service Center"; Rec."Area Service Center")
                {
                    Editable = AreaServiceCenterEdit;
                    Visible = false;
                }
            }
            group(Multiple)
            {
                Visible = MultipleEdit;
                field("Group Type"; Rec."Group Type")
                {
                    Editable = GroupTypeEdit;
                }
                field("Nature of Group"; Rec."Nature of Business")
                {
                    Editable = NatureofGroupEdit;
                    ShowMandatory = true;
                }
                field("Group Registration No."; Rec."Company Registration No.")
                {
                    Caption = 'Group Registration No.';
                    Editable = GroupRegistrationNoEdit;
                }
                field("Date of Group Registration"; Rec."Date of Business Reg.")
                {
                    Editable = GroupRegistrationDateEdit;
                }
                field("Group Loaction"; Rec."Business/Group Location")
                {
                    Editable = GroupLocationEdit;
                }
                field("Group Plot/Bldg/Street/Road"; Rec."Plot/Bldg/Street/Road")
                {
                    Editable = GroupPlotBuildingStreetEdit;
                }
                field("Constitution Provided"; Rec."Constitution Provided")
                {
                }
                field("Group Minutes Provided"; Rec."Group Minutes Provided")
                {
                }
            }
            group(Business)
            {
                Visible = BusinessEdit;
                field("Type of Business"; Rec."Type of Business")
                {
                    Editable = GroupTypeEdit;
                    ShowMandatory = true;
                }
                field("Ownership Type"; Rec."Ownership Type")
                {
                    Editable = BusinessOwnershipTypeEdit;
                    ShowMandatory = false;
                }
                field("Other Business Type"; Rec."Other Business Type")
                {
                    Editable = OtherBusinessTypeEdit;
                }
                field("Nature of Business"; Rec."Nature of Business")
                {
                    Caption = 'Nature of Business';
                    Editable = NatureofGroupEdit;
                    ShowMandatory = true;
                }
                field("Business Registration No."; Rec."Company Registration No.")
                {
                    Editable = GroupRegistrationNoEdit;
                    ShowMandatory = true;
                }
                field("Date of Business Reg."; Rec."Date of Business Reg.")
                {
                    Caption = 'Date of Business Reg.';
                    Editable = GroupRegistrationDateEdit;
                    ShowMandatory = true;
                }
                field("Business Location"; Rec."Business/Group Location")
                {
                    Editable = GroupLocationEdit;
                    ShowMandatory = true;
                }
                field("Business Plot/Bldg/Street/Road"; Rec."Plot/Bldg/Street/Road")
                {
                    Editable = GroupPlotBuildingStreetEdit;
                    ShowMandatory = true;
                }
            }
            group("Communication Details")
            {
                field(Nationality; Rec.Nationality)
                {
                    Editable = NationalityEdit;
                    ShowMandatory = true;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Editable = PostCodeEdit;
                    Importance = Promoted;
                }
                field(City; Rec.City)
                {
                    Caption = 'City';
                    Editable = CityEdit;
                }
                field(County; Rec.County)
                {
                    Editable = CountyEdit;
                    ShowMandatory = true;
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                    Editable = MobileNoEdit;
                    ShowMandatory = true;
                    Style = Favorable;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    Editable = PhoneEdit;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Editable = EmailEdit;
                }
                field("Current Address"; Rec."Current Address")
                {
                    Caption = 'P.O. BOX';
                    Editable = AddressEdit;
                }
                field("Meeting Days"; Rec."Meeting Days")
                {
                }
                field("Meeting Time"; Rec."Meeting Time")
                {
                }
                field("Meeting Venue"; Rec."Meeting Venue")
                {
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
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action44)
            {
            }
            separator(Action85)
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
                Visible = false;
            }
            separator(Action83)
            {
            }
            action("Member Factory")
            {
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Category4;
                //RunObject = Page "File Tracker Card";
                //RunPageLink = "Request Number" = FIELD("No.");
            }
            separator(Action96)
            {
            }
            action("Member Class")
            {
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Movement Tracker List";
                RunPageLink = "Document No." = FIELD("No.");
            }
            separator(Action92)
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
                Visible = false;
            }
            separator(Action81)
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
            separator(Action69)
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
            separator(Action67)
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
            separator(Action65)
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
            action("Group Members")
            {
                Image = Signature;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Signatories Application";
                RunPageLink = "Account No" = FIELD("No.");
            }
            separator(Action8)
            {
            }
            action("Create Member")
            {
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;

                trigger OnAction()
                var
                    RegistrationMngt: Codeunit "Registration Process";
                    Text002: Label 'Are you sure you want to convert this application to membership?';
                begin
                    Rec.TestField(Status, Rec.Status::Approved);
                    if not Confirm(Text002) = true then exit;
                    //hereRegistrationMngt.MemberRegistration(Rec);
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
                    Visible = OpenApprovalEntriesExistForCurrUser;

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

                    trigger OnAction()
                    var
                        ApprovalCommentLine: Record "Approval Comment Line";
                    begin
                        ApprovalCommentLine.SetRange("Table ID", 52185690);
                        ApprovalCommentLine.SetRange("Record ID to Approve", (Rec.RecordId));
                        PAGE.Run(PAGE::"Approval Comments", ApprovalCommentLine);
                    end;
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
                        NoSignatoryError: Label 'You cannot proceed without specifying Signatories.';
                        i: Integer;
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField("First Name");
                        Rec.TestField("Member Category");
                        Rec.TestField("Meeting Days");
                        Rec.TestField("Meeting Venue");
                        Rec.TestField("Meeting Time");
                        Rec.TestField("Group Minutes Provided");
                        Rec.TestField("Constitution Provided");


                        if Rec."Customer Type" = Rec."Customer Type"::MicroFinance then begin


                            MemberApplication.Reset;
                            MemberApplication.SetRange("No.", Rec."No.");
                            if MemberApplication.FindFirst then begin


                                ApplicationDocumentSetup.Reset;
                                ApplicationDocumentSetup.SetRange("Document Type", ApplicationDocumentSetup."Document Type"::Member);
                                if Rec."Single Party/Multiple/Business" = Rec."Single Party/Multiple/Business"::Business then
                                    ApplicationDocumentSetup.SetFilter("Single Party/Multiple", '%1', ApplicationDocumentSetup."Single Party/Multiple"::Multiple);
                                if Rec."Single Party/Multiple/Business" = Rec."Single Party/Multiple/Business"::Multiple then
                                    ApplicationDocumentSetup.SetFilter("Single Party/Multiple", '%1', ApplicationDocumentSetup."Single Party/Multiple"::Single);
                                ApplicationDocumentSetup.SetRange("Retiree Document", true);
                                if ApplicationDocumentSetup.FindFirst then begin
                                    repeat
                                        ApplicationDocuments.Reset;
                                        ApplicationDocuments.SetRange("Reference No.", MemberApplication."No.");
                                        ApplicationDocuments.SetRange("Document No.", ApplicationDocumentSetup."Document No.");
                                        ApplicationDocuments.SetRange(Provided, ApplicationDocuments.Provided::Yes);
                                        if not ApplicationDocuments.FindFirst then
                                            Error('%1 is Mandatory for this application.', ApplicationDocumentSetup."Document No.");
                                    until ApplicationDocumentSetup.Next = 0;
                                end;


                                /*
                                MFact.RESET;
                                MFact.SETRANGE("Application No",MemberApplication."No.");
                                MFact.SETFILTER("Factory Code",'<>%1','');
                                MFact.SETRANGE("Staff No.",'');
                                IF MFact.FINDFIRST THEN
                                    ERROR('KTDA No. Must have a value on Member Factory Details');
                                */



                            end;



                        end;


                        case Rec."Single Party/Multiple/Business" of
                            Rec."Single Party/Multiple/Business"::Multiple:
                                begin
                                    Rec.TestField("Application Date");
                                    Rec.TestField("Single Party/Multiple/Business");
                                //     Rec./*Rec.TestField("P.I.N Number");*/ /*TESTFIELD("Member Segment");*/
                                //                                            //     Rec.TestField("Responsibility Center");
                                //                                            //     Rec./* Rec.TestField("Employer Code");*/ /*TESTFIELD("Global Dimension 1 Code");*/
                                //                                            //     Rec.TestField("Global Dimension 2 Code");
                                //                                            //     Rec.TestField("Recruited By");
                                //                                            //     Rec./*Rec.TestField("Electrol Zone");*/

                                //     //     Rec.TestField("Group Type");
                                //     //     Rec.TestField("Group Account");
                                //     //     Rec./*Rec.TestField("Nature of Business");*/ /*TESTFIELD("Company Registration No.");*/
                                //     //                                                  //**Rec.TestField("Date of Business Reg."); TESTFIELD("Business/Group Location"); Rec.TESTFIELD("Plot/Bldg/Street/Road");

                                //     //   //Rec.TestField("Mobile Phone No"); TESTFIELD("Current Address"); TESTFIELD("Post Code"); Rec.TESTFIELD(Nationality);
                                //     //   Rec.TestField(County);

                                //     //Rec.TestField("Nature of Business");
                                //     //Rec.TestField("Date of Business Reg.");
                                //     //Rec.TestField("Bank Account No.");
                                end;

                            Rec."Single Party/Multiple/Business"::Business:
                                begin
                                    Rec.TestField("Application Date");
                                    Rec.TestField("Single Party/Multiple/Business");
                                    Rec.TestField("P.I.N Number");
                                    /*Rec.TestField("Member Segment");*/
                                    Rec.TestField("Responsibility Center");
                                    /*TESTFIELD("Employer Code")*/
                                    /*Rec.TestField("Global Dimension 1 Code");*/
                                    Rec.TestField("Global Dimension 2 Code");
                                    Rec.TestField("Recruited By");
                                    //Rec./*Rec.TestField("Electrol Zone");*/

                                    //Rec.TestField("Type of Business");
                                    //                                 Rec.TestField("Group Account");
                                    //                                 Rec./*Rec.TestField("Nature of Business");*/ /*TESTFIELD("Company Registration No.")*/
                                    //                                                                              //**Rec.TestField("Date of Business Reg."); TESTFIELD("Business/Group Location"); Rec.TESTFIELD("Plot/Bldg/Street/Road");
                                    //     //Rec.TestField("Ownership Type");
                                    //                                 Rec./*Rec.TestField("Other Business Type");*/

                                    //    /*Rec.TestField("Mobile Phone No");*/
                                    //    Rec.TestField("Current Address");
                                    //Rec.TestField("Post Code");
                                    // Rec.TestField(Nationality);
                                    // Rec.TestField(County);

                                    /*Rec.TestField("Bank Code"); TESTFIELD("Branch Code"); Rec.TESTFIELD("Bank Account No.");*/
                                end;
                        end;

                        SignatoriesApplication.Reset;
                        SignatoriesApplication.SetRange(SignatoriesApplication."Account No", Rec."No.");
                        if not SignatoriesApplication.Find('-') then begin
                            repeat
                                Error(NoSignatoryError);
                            until SignatoriesApplication.Next = 0;
                        end;

                        SignatoriesApplication.Reset;
                        SignatoriesApplication.SetRange(SignatoriesApplication."Account No", Rec."No.");
                        if SignatoriesApplication.Find('-') then begin
                            repeat
                                i += 1;
                            until SignatoriesApplication.Next = 0;
                        end;
                        GenSetup.Get;
                        if i < GenSetup."Minimum No of Group Members" then Error('Minimun number of Group Members is %1, Please add %2 more Members', GenSetup."Minimum No of Group Members", (10 - i));
                        SignatoriesApplication.Reset;
                        SignatoriesApplication.SetRange(SignatoriesApplication."Account No", Rec."No.");
                        if SignatoriesApplication.Find('-') then begin
                            repeat
                                SignatoriesApplication.TestField(SignatoriesApplication.Names);
                                //SignatoriesApplication.TestField(SignatoriesApplication."Date Of Birth");
                                SignatoriesApplication.CalcFields(SignatoriesApplication.Picture,
                                SignatoriesApplication.Signature);
                            //IF SignatoriesApplication."Must Sign" THEN
                            //SignatoriesApplication.TestField(SignatoriesApplication.Signature);
                            until SignatoriesApplication.Next = 0;
                        end;


                        if UserSetup.Get(UserId) then begin
                            UserSetup.TestField(UserSetup."Global Dimension 1 Code");
                            UserSetup.TestField(UserSetup."Global Dimension 2 Code");
                            Rec."Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                            Rec."Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                            Rec."Responsibility Center" := UserSetup."Responsibility Centre";
                            Rec."Application Date" := Today;
                            //"Current Address":=Addr;
                            Rec."Created By" := UserId;
                            Rec.Modify;
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
                        Rec.TestField(Status, Rec.Status::Pending);
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
            }
            action("MEMBER [FILE]")
            {
                Image = Document;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;

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
            action("Reopen Document")
            {

                trigger OnAction()
                begin

                    if not Confirm('Are you sure you want to re-open document?') then exit;
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        AccoutTypeControl;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Source := Rec.Source::Navision;
        Rec."Group Account" := true;
        Rec."Customer Type" := Rec."Customer Type"::MicroFinance;
        MemberApplication.Reset;
        MemberApplication.SetRange("Created By", UserId);
        MemberApplication.SetRange(Status, MemberApplication.Status::Open);
        MemberApplication.SetRange(Name, '');
        if MemberApplication.FindFirst then
            if MemberApplication.Count >= 1 then begin
                Error('You Already Have an Unused Open Card %1', MemberApplication."No." + ' ' + 'On membership Application Group Or on the open membership single list');
            end;
        MemberApplication.Init;
        Rec."Responsibility Center" := UserSetup."Responsibility Centre";
        Rec."Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
        Rec."Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
        MemberApplication.Insert;
    end;

    trigger OnOpenPage()
    begin
        AccoutTypeControl;
        Rec.SetFilter("Created By", '=%1', UserId);
        if Rec."Created By" <> '' then
            if UserId <> Rec."Created By" then Error('you cannot open or edit a card you did not create');
    end;

    var
        GenSetup: Record "General Set-Up";
        Text001: Label 'Date of Birth cannot be greater than today.';
        Text002: Label 'This applicant is below the mininmum membership age of %1.';
        MultipleEdit: Boolean;
        BusinessEdit: Boolean;
        ApplicationDateEdit: Boolean;
        MemberType: Boolean;
        FirstNameEdit: Boolean;
        AddressEdit: Boolean;
        EmployerEdit: Boolean;
        GlobalDim1Edit: Boolean;
        GlobalDim2Edit: Boolean;
        SalesEdit: Boolean;
        PINNumberEdit: Boolean;
        SegmentEdit: Boolean;
        MemberCategoryEdit: Boolean;
        GroupTypeEdit: Boolean;
        NatureofGroupEdit: Boolean;
        GroupRegistrationNoEdit: Boolean;
        GroupRegistrationDateEdit: Boolean;
        GroupLocationEdit: Boolean;
        GroupPlotBuildingStreetEdit: Boolean;
        BusinessOwnershipTypeEdit: Boolean;
        OtherBusinessTypeEdit: Boolean;
        RelationshipManager: Boolean;
        EmailEdit: Boolean;
        ElectrolZoneEdit: Boolean;
        AreaServiceCenterEdit: Boolean;
        RespCenterEdit: Boolean;
        PhoneEdit: Boolean;
        MobileNoEdit: Boolean;
        PostCodeEdit: Boolean;
        CityEdit: Boolean;
        NationalityEdit: Boolean;
        CountyEdit: Boolean;
        BankEdit: Boolean;
        BranchEdit: Boolean;
        BankAccountNoEdit: Boolean;
        SignatoriesApplication: Record "Signatory Application";
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        Text003: Label 'You must provide either ID Number, Passport No., P.I.N Number or Birth Cerificate No.';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        MembersegmentEdit: Boolean;
        MemberApplication: Record "Member Application";
        MemberClass: Record "Agent Next Of Kin Details";
        ProductFactory: Record "Product Factory";
        AutoOpenSavingAccs: Record "Savings Account Registration";
        ApplicationDocumentSetup: Record "Application Document Setup";
        ApplicationDocuments: Record "Application Documents";
        AccountSignatories: Record "Account Signatories";
        UserSetup: Record "User Setup";

    //[Scope('Internal')]
    procedure AccoutTypeControl()
    begin
        case Rec."Single Party/Multiple/Business" of
            Rec."Single Party/Multiple/Business"::Multiple:
                begin
                    MultipleEdit := true;
                    BusinessEdit := false;
                    Rec."Group Account" := true;
                end;

           Rec. "Single Party/Multiple/Business"::Business:
                begin
                    BusinessEdit := true;
                    MultipleEdit := false;
                    Rec."Group Account" := true;
                end;

        end;

        StatusControl;
    end;

    //[Scope('Internal')]
    procedure StatusControl()
    begin
        case Rec.Status of
            Rec.Status::Open:
                begin
                    ApplicationDateEdit := true;
                    MemberType := true;
                    FirstNameEdit := true;
                    PINNumberEdit := true;
                    SegmentEdit := true;
                    RespCenterEdit := true;
                    EmployerEdit := true;
                    GlobalDim1Edit := true;
                    GlobalDim2Edit := true;
                    SalesEdit := true;
                    MemberCategoryEdit := true;

                    GroupTypeEdit := true;
                    NatureofGroupEdit := true;
                    GroupRegistrationNoEdit := true;
                    GroupRegistrationDateEdit := true;
                    GroupLocationEdit := true;
                    GroupPlotBuildingStreetEdit := true;
                    BusinessOwnershipTypeEdit := true;
                    OtherBusinessTypeEdit := true;

                    PhoneEdit := true;
                    MobileNoEdit := true;
                    EmailEdit := true;
                    AddressEdit := true;
                    PostCodeEdit := true;
                    CityEdit := false;
                    NationalityEdit := true;
                    CountyEdit := true;
                    RelationshipManager := true;
                    ElectrolZoneEdit := true;
                    AreaServiceCenterEdit := true;
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
                    MemberType := false;
                    FirstNameEdit := false;
                    PINNumberEdit := false;
                    SegmentEdit := false;
                    RespCenterEdit := false;
                    EmployerEdit := false;
                    GlobalDim1Edit := false;
                    GlobalDim2Edit := false;
                    SalesEdit := false;
                    MemberCategoryEdit := false;

                    GroupTypeEdit := false;
                    NatureofGroupEdit := false;
                    GroupRegistrationNoEdit := false;
                    GroupRegistrationDateEdit := false;
                    GroupLocationEdit := false;
                    GroupPlotBuildingStreetEdit := false;
                    BusinessOwnershipTypeEdit := false;
                    OtherBusinessTypeEdit := false;

                    PhoneEdit := false;
                    MobileNoEdit := false;
                    EmailEdit := false;
                    AddressEdit := false;
                    PostCodeEdit := false;
                    CityEdit := false;
                    NationalityEdit := false;
                    CountyEdit := false;
                    RelationshipManager := false;
                    ElectrolZoneEdit := false;
                    AreaServiceCenterEdit := false;

                    EmployerEdit := false;
                    GlobalDim1Edit := false;
                    GlobalDim2Edit := false;
                    SalesEdit := false;

                    BankEdit := false;
                    BranchEdit := false;
                    BankAccountNoEdit := false;
                end;

        end;
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

