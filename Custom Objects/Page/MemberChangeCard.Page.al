page 52186647 "Member Change Card"
{
    //DeleteAllowed = false;
    PageType = Card;
    UsageCategory = Administration;
    PromotedActionCategories = 'New,Process,Reports,Activities, ,Category7_caption,Category8_caption,Category9_caption,Approvals';
    SourceTable = "Reactivate/Deactivate Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field(Control5; Rec.Comment)
                {
                }
                field("Account Type"; Rec."Account Type")
                {

                    trigger OnValidate()
                    begin
                        if Rec."Account Type" = Rec."Account Type"::Savings then begin
                            SingleMemberVisibl := false;
                            GroupMemberVisibl := false;
                            IsFixedDepositVisibl := false;
                            IsJuniorVisibl := false;
                            EmployerVisibl := false;
                            BankDetailVisibl := false;
                        end else begin
                            SingleMemberVisibl := false;
                            GroupMemberVisibl := false;
                            IsFixedDepositVisibl := false;
                            IsJuniorVisibl := false;
                            EmployerVisibl := false;
                            BankDetailVisibl := false;
                        end;
                        StatusControl;
                    end;
                }
                field("Account No."; Rec."Account No.")
                {

                    trigger OnValidate()
                    begin
                        StatusControl;
                    end;
                }
                field("Type of Account Change"; Rec."Type of Account Change")
                {
                    Editable = false;
                }
                field("Charge Transaction Type"; Rec."Charge Transaction Type")
                {
                }
                field("First Name"; Rec."First Name")
                {
                    Editable = FirstNameEditabl;
                }
                field("Second Name"; Rec."Second Name")
                {
                    Editable = SecondNameEditabl;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Editable = LastNameEditabl;
                }
                field("Tax Exempted"; Rec."Tax Exempted")
                {
                }
                field("P.I.N Number"; Rec."P.I.N Number")
                {
                }
                field("Monthly Contribution"; Rec."Monthly Contribution")
                {
                }
                field("Account Status"; Rec."Account Status")
                {
                }
                field("Status Change Reason"; Rec."Status Change Reason")
                {
                }
                field("Member Change Reason"; Rec."Member Change Reason")
                {
                    Editable = false;
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Member Segment"; Rec."Member Segment")
                {
                }
                field("Member Category"; Rec."Member Category")
                {
                }
                field("Account Category"; Rec."Account Category")
                {
                }
                field("Old Account No"; Rec."Old Account No")
                {
                }
                field("ATM No."; Rec."ATM No.")
                {
                }
                field("Dividend Payment Method"; Rec."Dividend Payment Method")
                {
                }
                field("Relationship Manager"; Rec."Relationship Manager")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Member Status"; Rec."Member Status")
                {
                }
                field(Status; Rec.Status)
                {

                    trigger OnValidate()
                    begin
                        StatusControl;
                        CurrPage.Update;
                    end;
                }
                field("Entry Type"; Rec."Entry Type")
                {
                }
                field("Loan Disbursement Account"; Rec."Loan Disbursement Account")
                {
                    Editable = Rec."Account Type" = Rec."Account Type"::Savings;
                }
                field("Mobile Loan Blocked"; Rec."Mobile Loan Blocked")
                {
                    Editable = Rec."Account Type" = Rec."Account Type"::Savings;
                }
                field("Group Account No."; Rec."Group Account No.")
                {
                }
                field("Group Position"; Rec."Group Position")
                {
                }
                field("Remove From Group"; Rec."Remove From Group")
                {
                }
                field("Allow Mboosta Defaulter"; Rec."Allow Mboosta Defaulter")
                {
                }
                field("Allow Div Advance"; Rec."Allow DAdvace Defaulter")
                {
                }
                field("Salary Through FOSA"; Rec."Salary Through FOSA")
                {

                    trigger OnValidate()
                    begin
                        if xRec."Salary Through FOSA" <> true then
                            if CopyStr(Rec."Account No.", 1, 3) <> '505' then Error('Only 505');

                        UserSetup.Reset;
                        UserSetup.SetRange("User ID", UserId);
                        UserSetup.SetRange("Edit Sal Through FOSA", true);
                        if not UserSetup.FindFirst then Error('''Edit Sal Through FOSA'' must be true in user setup');
                    end;
                }
            }
            group("Single Member")
            {
                Visible = SingleMemberVisibl;
                field(Name; Rec.Name)
                {
                    Editable = NameEditabl;
                }
                field(Salutation; Rec.Salutation)
                {
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                    Editable = StaffNoEditabl;
                }
                field("ID No."; Rec."ID No.")
                {
                    Editable = IDNoEditabl;
                }
                field("Passport No."; Rec."Passport No.")
                {
                    Editable = PassportNoEditabl;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    Editable = DOBEditabl;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    Editable = MaritalStatusEditabl;
                }
                field(Gender; Rec.Gender)
                {
                    Editable = GenderEditabl;
                    OptionCaption = ' ,Male,Female';
                }
                field(Type; Rec.Type)
                {
                }
                field("Rejoining Date"; Rec."Rejoining Date")
                {
                }
                field(Retiree; Rec.Retiree)
                {
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                }
            }
            group(Multiple)
            {
                Visible = GroupMemberVisibl;
                field("Group Type"; Rec."Group Type")
                {
                }
                field("Nature of Group"; Rec."Nature of Business")
                {
                }
                field("Group Registration No."; Rec."Company Registration No.")
                {
                }
                field("Date of Group Reg."; Rec."Date of Business Reg.")
                {
                }
                field("Group Location"; Rec."Business/Group Location")
                {
                }
                field("Group Plot/Bldg/Street/Road"; Rec."Plot/Bldg/Street/Road")
                {
                }
            }
            group("Business Member")
            {
                Visible = BusinessMemberVisibl;
                field("Type of Business"; Rec."Type of Business")
                {
                }
                field("Ownership Type"; Rec."Ownership Type")
                {
                }
                field("Other Business Type"; Rec."Other Business Type")
                {
                }
                field("Nature of Business"; Rec."Nature of Business")
                {
                }
                field("Business Registration No."; Rec."Company Registration No.")
                {
                }
                field("Date of Business Reg."; Rec."Date of Business Reg.")
                {
                }
                field("Business/Group Location"; Rec."Business/Group Location")
                {
                }
                field("Business Plot/Bldg/Street/Road"; Rec."Plot/Bldg/Street/Road")
                {
                }
            }
            group(Communication)
            {
                Visible = CommVisbl;
                field("Post Code"; Rec."Post Code")
                {
                }
                field(City; Rec.City)
                {
                }
                field(Nationality; Rec.Nationality)
                {
                }
                field(County; Rec.County)
                {
                }
                field("Office Telephone No:"; Rec."Phone No.")
                {
                    Caption = 'Office Telephone No:';
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                }
                field("E-Mail"; Rec."E-Mail")
                {
                }
                field("P.O. BOX "; Rec."Current Address")
                {
                }
            }
            group("Fixed Deposit")
            {
                Caption = 'Fixed Deposit';
                Visible = IsFixedDepositVisibl;
                field("Fixed Deposit Type"; Rec."Fixed Deposit Type")
                {
                }
                field("Fixed Deposit Status"; Rec."Fixed Deposit Status")
                {
                }
                field("FD Maturity Date"; Rec."FD Maturity Date")
                {
                }
                field("Neg. Interest Rate"; Rec."Neg. Interest Rate")
                {
                }
                field("FD Duration"; Rec."FD Duration")
                {
                    Caption = 'FD Duration(Months)';
                }
                field("FD Maturity Instructions"; Rec."FD Maturity Instructions")
                {
                }
                field("Fixed Deposit cert. no"; Rec."Fixed Deposit cert. no")
                {
                }
                field("Fixed Deposit Amount"; Rec."Fixed Deposit Amount")
                {
                }
            }
            group("Child Account")
            {
                Visible = IsJuniorVisibl;
                field("Parent Account No."; Rec."Parent Account No.")
                {
                }
                field("Birth Certificate No."; Rec."Birth Certificate No.")
                {
                }
                field("<Child Date of Birth>"; Rec."Date of Birth")
                {
                    Caption = 'Date of Birth';
                }
                field("<Full Name>"; Rec.Name)
                {
                    Caption = 'Full Name';
                }
            }
            group("Other Information")
            {
                Visible = EmployerVisibl;
                field("Employer Code"; Rec."Employer Code")
                {
                    ShowMandatory = true;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Recruited By"; Rec."Recruited By")
                {
                    Caption = 'Recruited By';
                }
                field("Electrol Zone"; Rec."Electrol Zone")
                {
                }
                field("Area Service Center"; Rec."Area Service Center")
                {
                }
                field("Enable Sweeping"; Rec."Enable Sweeping")
                {
                }
                field(Hide; Rec.Hide)
                {
                }
            }
            group("Bank Details")
            {
                Visible = BankDetailVisibl;
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
        area(factboxes)
        {
            systempart(Control13; Notes)
            {
            }
            systempart(Control14; MyNotes)
            {
            }
            systempart(Control15; Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action31)
            {
                separator(Action99)
                {
                }
                action(Signatories)
                {
                    Image = Signature;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Signatories Application";
                    RunPageLink = "Account No" = FIELD("No.");
                }
                separator(Action102)
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
                separator(Action97)
                {
                }
                action("Post Changes")
                {
                    Image = Add;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        RegistrationProcess: Codeunit "Registration Process";
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);
                        //here//RegistrationProcess.DeactivateReactive(Rec);
                    end;
                }
            }
            action("Picture & Signature")
            {
                Image = Picture;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "MemberChanges Pic & Sig";
                RunPageLink = "No." = FIELD("No.");
            }
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
                        ApplDocs: Record "Product Documents";
                        LoanReqDocs: Record "Loan Required Documents";
                        Text011: Label 'There are documents to be provided : %1';
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec./*Rec.TestField("Document Type");*/
TestField(Rec."Account Type");
                        Rec.TestField("Account No.");
                        /*TESTFIELD(Description)*/
                        ;
                        Rec.TestField("Responsibility Center");
                        if Rec.Retiree = true then begin
                            //Required documents
                            LoanReqDocs.Reset;
                            LoanReqDocs.SetRange("Loan No.", Rec."No.");
                            if LoanReqDocs.Find('-') then begin
                                repeat
                                    if (LoanReqDocs."Provided ?" = LoanReqDocs."Provided ?"::" ") or (LoanReqDocs."Provided ?" = LoanReqDocs."Provided ?"::No) then
                                        Error(Text011, LoanReqDocs.Description);
                                until LoanReqDocs.Next = 0;
                            end;
                            Rec.TestField("Employer Code", '99');
                        end;
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);

                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Status, Rec.Status::Pending);
                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
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
                action("Mandatory Requirements")
                {
                    Image = RegisteredDocs;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    RunObject = Page "Loan Required Documents";
                    RunPageLink = "Loan No." = FIELD("No.");
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
        if Rec.Status = Rec.Status::Processed then
            CurrPage.Editable := false;
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Processed then
            CurrPage.Editable := false;
    end;

    var
        SingleMemberVisibl: Boolean;
        FirstNameEditabl: Boolean;
        SecondNameEditabl: Boolean;
        LastNameEditabl: Boolean;
        NameEditabl: Boolean;
        IDNoEditabl: Boolean;
        PassportNoEditabl: Boolean;
        StaffNoEditabl: Boolean;
        DOBEditabl: Boolean;
        MaritalStatusEditabl: Boolean;
        GenderEditabl: Boolean;
        GroupAccountNoEditabl: Boolean;
        GroupMemberVisibl: Boolean;
        BusinessMemberVisibl: Boolean;
        IsFixedDepositVisibl: Boolean;
        IsJuniorVisibl: Boolean;
        CommVisbl: Boolean;
        OtherVisibl: Boolean;
        EmployerVisibl: Boolean;
        BankDetailVisibl: Boolean;
        "-": Integer;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        UserSetup: Record "User Setup";

    //[Scope('Internal')]
    procedure StatusControl()
    begin
        if (Rec."Account Type" in [Rec."Account Type"::" ", Rec."Account Type"::Savings]) then begin
            case Rec."Product Category" of
                Rec."Product Category"::"Fixed Deposit":
                    begin
                        IsFixedDepositVisibl := true;
                        IsJuniorVisibl := false;
                        EmployerVisibl := false;
                        BankDetailVisibl := false;
                        SingleMemberVisibl := false;
                        GroupMemberVisibl := false;
                        BusinessMemberVisibl := false;
                        CommVisbl := false;
                    end;
                Rec."Product Category"::"Junior Savings":
                    begin
                        IsFixedDepositVisibl := false;
                        IsJuniorVisibl := true;
                        EmployerVisibl := false;
                        BankDetailVisibl := false;
                        SingleMemberVisibl := false;
                        GroupMemberVisibl := false;
                        BusinessMemberVisibl := false;
                        CommVisbl := false;
                    end;
            // "Product Category"::"0", "Product Category"::"Share Capital", "Product Category"::"Deposit Contribution",
            // "Product Category"::"Registration Fee":
            //     begin
            //         IsFixedDepositVisibl := false;
            //         IsJuniorVisibl := false;
            //         EmployerVisibl := false;
            //         BankDetailVisibl := false;
            //         SingleMemberVisibl := false;
            //         GroupMemberVisibl := false;
            //         BusinessMemberVisibl := false;
            //         CommVisbl := false;
            //     end;
            end;

        end else begin
            case Rec."Single Party/Multiple/Business" of
                Rec."Single Party/Multiple/Business"::Single:
                    begin
                        SingleMemberVisibl := true;
                        NameEditabl := false;
                        FirstNameEditabl := true;
                        SecondNameEditabl := true;
                        LastNameEditabl := true;
                        StaffNoEditabl := true;
                        IDNoEditabl := true;
                        PassportNoEditabl := true;
                        DOBEditabl := true;
                        MaritalStatusEditabl := true;
                        GenderEditabl := true;
                        GroupAccountNoEditabl := true;
                        GroupMemberVisibl := false;
                        BusinessMemberVisibl := false;
                        CommVisbl := true;
                        EmployerVisibl := true;
                        BankDetailVisibl := true;
                    end;
                Rec."Single Party/Multiple/Business"::Multiple:
                    begin
                        SingleMemberVisibl := false;
                        NameEditabl := true;
                        FirstNameEditabl := false;
                        SecondNameEditabl := false;
                        LastNameEditabl := false;
                        StaffNoEditabl := false;
                        IDNoEditabl := false;
                        PassportNoEditabl := false;
                        DOBEditabl := false;
                        MaritalStatusEditabl := false;
                        GenderEditabl := false;
                        GroupAccountNoEditabl := false;
                        GroupMemberVisibl := true;
                        BusinessMemberVisibl := false;
                        CommVisbl := true;
                        EmployerVisibl := true;
                        BankDetailVisibl := true;
                    end;
                Rec."Single Party/Multiple/Business"::Business:
                    begin
                        SingleMemberVisibl := false;
                        NameEditabl := true;
                        FirstNameEditabl := false;
                        SecondNameEditabl := false;
                        LastNameEditabl := false;
                        StaffNoEditabl := false;
                        IDNoEditabl := false;
                        PassportNoEditabl := false;
                        DOBEditabl := false;
                        MaritalStatusEditabl := false;
                        GenderEditabl := false;
                        GroupAccountNoEditabl := false;
                        GroupMemberVisibl := false;
                        BusinessMemberVisibl := true;
                        CommVisbl := true;
                        EmployerVisibl := true;
                        BankDetailVisibl := true;
                    end;
            end;
        end;


        case Rec.Status of
            Rec.Status::Open:
                begin
                    CurrPage.Editable := true;
                end;

            Rec.Status::Pending, Rec.Status::Rejected, Rec.Status::Processed:
                begin
                    CurrPage.Editable := false;
                end;
        end;

        /*
        CASE "Single Party/Multiple/Business" OF
        "Single Party/Multiple/Business"::Single: BEGIN
          SingleMemberVisibl:=TRUE;
           NameEditabl:=FALSE; FirstNameEditabl:=TRUE; SecondNameEditabl:=TRUE; LastNameEditabl:=TRUE; StaffNoEditabl:=TRUE;
           IDNoEditabl:=TRUE; PassportNoEditabl:=TRUE; DOBEditabl:=TRUE; MaritalStatusEditabl:=TRUE; GenderEditabl:=TRUE;
           GroupAccountNoEditabl:=TRUE;
          GroupMemberVisibl:=FALSE;
          BusinessMemberVisibl:=FALSE;
          END;
        "Single Party/Multiple/Business"::Multiple: BEGIN
          SingleMemberVisibl:=FALSE;
           NameEditabl:=TRUE; FirstNameEditabl:=FALSE; SecondNameEditabl:=FALSE; LastNameEditabl:=FALSE; StaffNoEditabl:=FALSE;
           IDNoEditabl:=FALSE; PassportNoEditabl:=FALSE; DOBEditabl:=FALSE; MaritalStatusEditabl:=FALSE; GenderEditabl:=FALSE;
           GroupAccountNoEditabl:=FALSE;
          GroupMemberVisibl:=TRUE;
          BusinessMemberVisibl:=FALSE;
          END;
        "Single Party/Multiple/Business"::Business: BEGIN
          SingleMemberVisibl:=FALSE;
           NameEditabl:=TRUE; FirstNameEditabl:=FALSE; SecondNameEditabl:=FALSE; LastNameEditabl:=FALSE; StaffNoEditabl:=FALSE;
           IDNoEditabl:=FALSE; PassportNoEditabl:=FALSE; DOBEditabl:=FALSE; MaritalStatusEditabl:=FALSE; GenderEditabl:=FALSE;
           GroupAccountNoEditabl:=FALSE;
          GroupMemberVisibl:=FALSE;
          BusinessMemberVisibl:=TRUE;
          END;
        END;
        
        
        CASE "Product Category" OF
        "Product Category"::"Fixed Deposit" : BEGIN
          IsFixedDepositVisibl:=TRUE;
          IsJuniorVisibl:=FALSE;
          EmployerVisibl:=FALSE;
          BankDetailVisibl:=FALSE;
          END;
        "Product Category"::"Junior Savings" : BEGIN
          IsFixedDepositVisibl:=FALSE;
          IsJuniorVisibl:=TRUE;
          EmployerVisibl:=FALSE;
          BankDetailVisibl:=FALSE;
          END;
        "Product Category"::" ", "Product Category" ::"Share Capital", "Product Category" ::"Deposit Contribution",
        "Product Category" ::"Registration Fee" : BEGIN
          IsFixedDepositVisibl:=FALSE;
          IsJuniorVisibl:=FALSE;
          EmployerVisibl:=TRUE;
          BankDetailVisibl:=TRUE;
          END;
        END;
        
        
        
        //IF ("Account Type" IN ["Account Type"::" ","Account Type"::Savings]) THEN BEGIN
        
        
        
        CASE Status OF
         Status::Open :
           BEGIN
             CurrPage.EDITABLE:=TRUE;
             END;
        
         Status::Pending, Status::Rejected, Status::Processed :
           BEGIN
             CurrPage.EDITABLE:=FALSE;
             END;
        END;
        */

    end;
}

