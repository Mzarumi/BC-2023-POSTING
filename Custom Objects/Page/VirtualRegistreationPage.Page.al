page 52186690 "Virtual Registreation Page"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Sky Virtual Member";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field(Telephone; Rec.Telephone)
                {
                    Editable = true;
                }
                field(Names; Rec.Names)
                {
                }
                field("Name on IPRS"; Rec."Name on IPRS")
                {
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                }
                field(Gender; Rec.Gender)
                {
                }
                field(Citizenship; Rec.Citizenship)
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Passport Number"; Rec."Passport Number")
                {
                }
                field("Reffered By"; Rec."Reffered By")
                {
                }
                field(Validated; Rec.Validated)
                {
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field(Email; Rec.Email)
                {
                }
                field("Referer Member No"; Rec."Referer Member No")
                {
                }
                field("Sent To Application"; Rec."Sent To Application")
                {
                }
                field("Actioned By"; Rec."Actioned By")
                {
                }
                field("Service Number"; Rec."Service Number")
                {
                }
                field(Status; Rec.Status)
                {

                    trigger OnValidate()
                    begin
                        ControlActions;
                    end;
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Entry Time"; Rec."Entry Time")
                {
                }
                field("Source Application"; Rec."Source Application")
                {
                }
                field("Pushed by Member No"; Rec."Pushed by Member No")
                {
                }
                field("Pushed by Name"; Rec."Pushed by Name")
                {
                }
            }
            group("Employment Details")
            {
                Editable = EmployerDetailsEdit;
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field(Employer; Rec.Employer)
                {
                }
                field("Employer Name"; Rec."Employer Name")
                {
                }
                field("Payroll Number"; Rec."Payroll Number")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Validate)
            {
                Image = ValidateEmailLoggingSetup;
                Promoted = true;
            }
            action("Send To Application")
            {
                Enabled = SendToApplication;
                Image = SendConfirmation;
                Promoted = true;

                trigger OnAction()
                var
                    FirstName: Text[50];
                    SecondName: Text[50];
                    LastName: Text[50];
                    FirstSTRPOS: Integer;
                    SeccondAndLastName: Text;
                    SecondSTRPOS: Integer;
                    msg: Text;
                    RecruiterFound: Boolean;
                    UserSetup: Record "User Setup";
                    ResponsibilityCenter: Code[50];
                    ActivityCode: Code[50];
                    BranchCode: Code[50];
                    FullName: Text;
                begin
                    Rec.TestField(Status, Rec.Status::Approved);
                    MemberApplication.Reset;
                    MemberApplication.SetRange("ID No.", Rec."ID Number");
                    if MemberApplication.FindFirst then Error('Another record with this ID Number already exists in the system');

                    //Rec.TestField("Employer Code");
                    RecruiterFound := false;
                    SeriesSetup.Get;
                    SeriesSetup.TestField(SeriesSetup."Virtual Member App. No");
                    NoSeriesMgt.InitSeries(SeriesSetup."Virtual Member App. No", MemberApplication."No. Series", 0D, MemberApplication."No.", MemberApplication."No. Series");
                    RecruiterFound := false;
                    Members.Reset;
                    Members.SetFilter("Mobile Phone No", '=%1|=%2', '+' + Rec."Reffered By", Rec."Reffered By");
                    if Members.FindFirst then begin
                        RecruiterMemberNo := Members."No.";
                        RecruiterName := Members.Name;
                        RecruiterFound := true;
                    end else begin
                        Message('Recruiter Phone No %1 not found', Rec."Reffered By");
                        RecruiterFound := false;
                    end;

                    MemberAppNo := MemberApplication."No.";
                    FullName := Rec."Name on IPRS";
                    if FullName = '' then FullName := Rec.Names;
                    FirstName := CopyStr(FullName, 1, StrPos(FullName, ' ') - 1);
                    FirstSTRPOS := StrPos(FullName, ' ');
                    SeccondAndLastName := CopyStr(FullName, FirstSTRPOS + 1, 100);
                    SecondSTRPOS := StrPos(SeccondAndLastName, ' ');
                    if SecondSTRPOS = 0 then
                        LastName := CopyStr(SeccondAndLastName, 1, 100)
                    else
                        SecondName := CopyStr(SeccondAndLastName, 1, SecondSTRPOS - 1);

                    if SecondSTRPOS > 1 then
                        LastName := CopyStr(SeccondAndLastName, SecondSTRPOS + 1, 100);

                    UserSetup.Reset;
                    UserSetup.SetRange("User ID", UserId);

                    MemberApplication.Init;
                    MemberApplication."First Name" := FirstName;
                    MemberApplication."Second Name" := SecondName;
                    MemberApplication."Last Name" := LastName;
                    MemberApplication."No." := MemberAppNo;
                    MemberApplication."Phone No." := '+' + Rec.Telephone;
                    MemberApplication."Mobile Phone No" := '+' + Rec.Telephone;
                    MemberApplication."ID No." := Rec."ID Number";
                    MemberApplication.Name := FullName;
                    MemberApplication."Date of Birth" := Rec."Date Of Birth";
                    MemberApplication.Gender := Rec.Gender;
                    if RecruiterFound then begin
                        MemberApplication."Recruited By" := RecruiterMemberNo;
                        MemberApplication."Recruited by Type" := MemberApplication."Recruited by Type"::Self;
                        MemberApplication."Recruited By Name" := RecruiterName;
                    end;
                    //MemberApplication."Employer Code" := "Employer Code";
                    MemberApplication."Employer Name" := Rec."Employer Name";
                    MemberApplication."Payroll/Staff No." := Rec."Payroll Number";
                    MemberApplication."Application Date" := Today;
                    MemberApplication."Created By" := UserId;
                    MemberApplication.Nationality := Rec.Citizenship;
                    MemberApplication."Virtual Member" := true;
                    MemberApplication."Membership Option" := MemberApplication."Membership Option"::Member;
                    MemberApplication."Virtual Member" := true;
                    MemberApplication.Validate(MemberApplication."Date of Birth");
                    MemberApplication.Insert;

                    //Auto Accounts
                    ProductFactory.SetFilter(ProductFactory.Status, '%1', ProductFactory.Status::Active);
                    ProductFactory.SetFilter(ProductFactory."Auto Open Account", '%1', true);
                    ProductFactory.SetFilter(ProductFactory."Product Category", '<>%1 & <>%2', ProductFactory."Product Category"::"Fixed Deposit",
                                             ProductFactory."Product Category"::"Junior Savings");
                    // if ProductFactory.Find('-') then begin
                    //     repeat
                    //         AutoOpenSavingAccs.Init;
                    //         AutoOpenSavingAccs."No." := MemberAppNo;
                    //         AutoOpenSavingAccs.Validate(AutoOpenSavingAccs."Product Type", ProductFactory."Product ID");
                    //         AutoOpenSavingAccs."Monthly Contribution" := ProductFactory."Minimum Contribution";
                    //         AutoOpenSavingAccs.Insert;
                    //     until ProductFactory.Next = 0;
                    // end;


                    Rec.Validated := true;
                    Rec."Sent To Application" := true;
                    Rec."Actioned By" := UserId;
                    Rec.Modify;



                    msg := 'Dear ' + Rec.Names + ', your application has been received under ref no: ' + MemberAppNo +
                    '. Please indicate this ref no. on the form and submit to the Sacco to allow for completion of the registration ' +
                    'process. For help 0709943000.';
                    // SkyMbanking.SendSms(Source::MBANKING, Telephone, msg, MemberAppNo, '', true, 205, false);

                    if RecruiterFound then begin
                        msg := 'Dear Member, thank you for introducing ' + Rec.Names + ' to Harambee Sacco. Application is being processed under ref no: ' + MemberAppNo +
                        '. For help 0709943000.';
                        // SkyMbanking.SendSms(Source::MBANKING, "Reffered By", msg, MemberAppNo, '', true, 205, false);
                    end;

                    Message('Application sent succsessfully');
                end;
            }
            action(Approve)
            {
                Caption = 'Approve';
                Enabled = Approve;
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    Rec.TestField(Status, Rec.Status::Pending);

                    ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                end;
            }
            separator(Action38)
            {
            }
            action(SendApprovalRequest)
            {
                Caption = 'Send A&pproval Request';
                Enabled = SendApproval;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    MemberCategory: Record "Member Category";
                    SegmentCountyDividendSignat: Record "Segment/County/Dividend/Signat";
                begin
                    VarVariant := Rec;
                    // if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                    //     CustomApprovals.OnSendDocForApproval(VarVariant);
                end;
            }
            action(CancelApprovalRequest)
            {
                Caption = 'Cancel Approval Re&quest';
                Enabled = CancelApproval;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    VarVariant := Rec;
                    // CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action("Re-Open Deferred  Loan")
            {

                trigger OnAction()
                begin

                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;

                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                    approvalsMgmt: Codeunit "Approvals Mgmt.";
                begin

                    approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Member Report")
            {

                trigger OnAction()
                begin
                    SkyVirtualMember.Reset;
                    SkyVirtualMember.SetRange("No.", Rec."No.");
                    if SkyVirtualMember.FindFirst then begin
                        SkyVirtualMember.Reset;
                        SkyVirtualMember.SetRange("No.", Rec."No.");
                        if SkyVirtualMember.FindFirst then begin
                            //REPORT.Run(52186019, true, false, SkyVirtualMember);
                        end else begin
                            GeneralSetUp.Get();
                            FromFile := GeneralSetUp."PDF B64 Folder" + '\' + 'member - ' + Rec."No." + '.pdf';
                            Name := 'meeting - ' + Rec."No.";
                            // if Exists(FromFile) then
                            //     Download(FromFile, 'Member', '', 'Text file(*.pdf)|*.pdf', Name)
                            // else
                            //     Message('The file you are looking for is not available');
                        end;
                    end;
                end;
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        ControlActions
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        ControlActions
    end;

    trigger OnOpenPage()
    begin
        ControlActions
    end;

    var
        SeriesSetup: Record "Credit Nos. Series";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        MemberAppNo: Code[50];
        Members: Record Members;
        RecruiterMemberNo: Code[30];
        RecruiterName: Text[50];
        Source: Option NEW_MEMBER,NEW_ACCOUNT,LOAN_ACCOUNT_APPROVAL,DEPOSIT_CONFIRMATION,CASH_WITHDRAWAL_CONFIRM,LOAN_APPLICATION,LOAN_APPRAISAL,LOAN_GUARANTORS,LOAN_REJECTED,LOAN_POSTED,LOAN_DEFAULTED,SALARY_PROCESSING,TELLER_CASH_DEPOSIT,TELLER_CASH_WITHDRAWAL,TELLER_CHEQUE_DEPOSIT,FIXED_DEPOSIT_MATURITY,INTERACCOUNT_TRANSFER,ACCOUNT_STATUS,STATUS_ORDER,EFT_EFFECTED,ATM_APPLICATION_FAILED,ATM_COLLECTION,MBANKING,MEMBER_CHANGES,CASHIER_BELOW_LIMIT,CASHIER_ABOVE_LIMIT,INTERNETBANKING,CRM,MOBILE_PIN;
        // SkyMbanking: Codeunit "Sky Mbanking";
        ProductFactory: Record "Product Factory";
        // AutoOpenSavingAccs: Record "Savings Account Registration";
        // CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        MemberApplication: Record "Member Application";
        SendApproval: Boolean;
        Approve: Boolean;
        CancelApproval: Boolean;
        SendToApplication: Boolean;
        EmployerDetailsEdit: Boolean;
        SkyVirtualMember: Record "Sky Virtual Member";
        GeneralSetUp: Record "General Set-Up";
        Name: Text;
        FromFile: Text;

    local procedure ControlActions()
    begin
        if Rec.Status = Rec.Status::Open then begin
            SendApproval := true;
            SendToApplication := false;
            Approve := false;
            CancelApproval := false;
            EmployerDetailsEdit := true;
        end;

        if Rec.Status = Rec.Status::Pending then begin
            SendApproval := false;
            SendToApplication := false;
            Approve := true;
            CancelApproval := true;
            EmployerDetailsEdit := false;
        end;

        if Rec.Status = Rec.Status::Rejected then begin
            SendApproval := false;
            SendToApplication := false;
            Approve := false;
            CancelApproval := false;
            EmployerDetailsEdit := false;
        end;

        if Rec.Status = Rec.Status::Approved then begin
            SendApproval := false;
            SendToApplication := true;
            Approve := false;
            CancelApproval := false;
            EmployerDetailsEdit := false;
        end;
    end;
}

