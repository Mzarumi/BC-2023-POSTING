page 52185738 "Savings Acc. Application Card"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Activities, ,Category7_caption,Category8_caption,Category9_caption,Approvals';
    SourceTable = "Savings Account Application";

    layout
    {
        area(content)
        {
            group("Member Details")
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("CRM Application No."; Rec."CRM Application No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                group(Control17)
                {
                    ShowCaption = false;
                    Visible = MemberNoEdit;
                    field("Member No."; Rec."Member No.")
                    {
                        ShowMandatory = true;
                    }
                }
                field(Name; Rec.Name)
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        getControl;
                    end;
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                }
                field("Passport No."; Rec."Passport No.")
                {
                    Editable = false;
                }
                field("ID No."; Rec."ID No.")
                {
                    Editable = false;
                }
                field("Monthly Contribution"; Rec."Monthly Contribution")
                {
                    ShowMandatory = true;
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
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = false;
                }
                field("Member Category"; Rec."Member Category")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;

                    trigger OnValidate()
                    begin
                        getControl;
                        CurrPage.Update(true);
                    end;
                }
                field("Signing Instructions"; Rec."Signing Instructions")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
            }
            group("Fixed Deposit Details")
            {
                Visible = FixedDeposit;
                field("Fixed Deposit Type"; Rec."Fixed Deposit Type")
                {
                }
                field("FD Duration"; Rec."FD Duration")
                {
                }
                field("FD Maturity Date"; Rec."FD Maturity Date")
                {
                    Editable = false;
                    Visible = true;
                }
                field("Savings Account No."; Rec."Savings Account No.")
                {
                    Visible = true;
                }
                field("Fixed Deposit Amount"; Rec."Fixed Deposit Amount")
                {
                }
                field("FD Maturity Instructions"; Rec."FD Maturity Instructions")
                {
                }
                field("Neg. Interest Rate"; Rec."Neg. Interest Rate")
                {
                }
                field("Fixed Deposit cert. no"; Rec."Fixed Deposit cert. no")
                {
                }
            }
            group("Junior Account Details")
            {
                Visible = JuniorAccount;
                field("Parent Account No."; Rec."Parent Account No.")
                {
                    Editable = false;
                    Visible = true;
                }
                field("Birth Certificate No."; Rec."Birth Certificate No.")
                {
                }
            }
            group(Communication)
            {
                field("Phone No."; Rec."Phone No.")
                {
                    Caption = 'Office Telephone No.';
                    Editable = false;
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                    Editable = false;
                }
                field("Transaction Mobile No"; Rec."Transaction Mobile No")
                {
                    Editable = false;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Editable = false;
                }
            }
            group("Foreign Trade")
            {
                Visible = false;
                field("Currency Code"; Rec."Currency Code")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action8)
            {
            }
            action("Picture & Signature")
            {
                Image = Signature;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    ProductTypeID: Code[20];
                    IDNumber: Code[20];
                    ImageData: Record "Image Data";
                    sImageData: Record "Savings Account Application";
                    PictureError: Label 'This member has not registered Picture with the Society.';
                begin
                    case Rec."Product Category" of
                    /*"Product Category"::"Junior Savings" :
                     BEGIN
                      sImageData.RESET;
                      sImageData.SETRANGE(sImageData."No.",IDNumber);
                      IF sImageData.FIND('-') THEN BEGIN
                        PAGE.RUN(52185709,ImageData);
                     // PAGE.RUN(52185687,sImageData);
                      END;
                     END;*/

                    //here
                    // "Product Category"::"0", "Product Category"::"Junior Savings", "Product Category"::"Share Capital", "Product Category"::"Deposit Contribution", "Product Category"::"Fixed Deposit":
                    //     begin
                    //         if "Member No." = '' then
                    //             IDNumber := "ID No."
                    //         else
                    //             IDNumber := "Member No.";

                    //         ImageData.Reset;
                    //         ImageData.SetRange(ImageData."Member No", IDNumber);
                    //         if ImageData.Find('-') then begin
                    //             PAGE.Run(52185709, ImageData);
                    //         end else
                    //             Message(PictureError);
                    //     end;

                    end;

                end;
            }
            separator(Action9)
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
            separator(Action19)
            {
            }
            action("Create Account ")
            {
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    //RegistrationMngt: Codeunit "Registration Process";
                    Text002: Label 'Are you sure you want to convert this application to Account?';
                begin
                    Rec.TestField(Status, Rec.Status::Approved);
                    if not Confirm(Text002) = true then exit;
                    //here RegistrationMngt.AccountRegistration(Rec);
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
                        JuniorError: Label 'You must specify either %1 %2 for %3';
                        IDJunior: Code[20];
                        ProductApplicationDocuments: Record "Product Documents";
                        ApplicationDocuments: Record "Application Documents";
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField(Name);
                        Rec.TestField("Product Type");
                        Rec.TestField("Global Dimension 1 Code");
                        //Rec.TestField("Global Dimension 2 Code");
                        Rec.TestField("Responsibility Center");
                        //Rec.//Rec.TestField("Mobile Phone No");

                        //IF "Loan Disbursement Account"=TRUE THEN
                        //  Rec.TestField("Transaction Mobile No");
                        //here
                        // case "Product Category" of
                        //         "Product Category"::"0", "Product Category"::"Share Capital":
                        //             begin
                        //                 Rec.TestField("Member No.");
                        //             end;

                        //         "Product Category"::"Deposit Contribution":
                        //             begin
                        //                 Rec.TestField("Member No.");
                        //                 Rec.TestField("Monthly Contribution");
                        //             end;

                        //         "Product Category"::"Junior Savings":
                        //             begin
                        //                 Rec.TestField("Date of Birth");
                        //                 Rec.TestField("Parent Account No.");
                        //                 /* Rec.TestField(Picture); Rec.TESTFIELD(Signature);*/
                        //                 if ("Birth Certificate No." = '') and ("Passport No." = '') then
                        //                     Error(JuniorError, "Birth Certificate No.", "Passport No.", "Product Category");
                        //             end;

                        //         "Product Category"::"Fixed Deposit":
                        //             begin
                        //                 Rec.TestField("Member No.");
                        //                 Rec.TestField("Fixed Deposit Type");
                        //                 Rec.TestField("FD Duration");
                        //                 Rec.TestField("Savings Account No.");
                        //                 Rec.TestField("Fixed Deposit Amount");
                        //                 if "FD Maturity Instructions" = "FD Maturity Instructions"::" " then Error('Maturity Instructions can not be blank');
                        //             end;

                        //     end;

                        // ProductApplicationDocuments.Reset;
                        // ProductApplicationDocuments.SetRange(ProductApplicationDocuments."Product ID", "Product Type");
                        // if ProductApplicationDocuments.Find('-') then begin
                        //     repeat
                        //         ApplicationDocuments.Reset;
                        //         ApplicationDocuments.SetRange(ApplicationDocuments."Reference No.", "No.");
                        //         ApplicationDocuments.SetFilter(ApplicationDocuments."Product ID", ProductApplicationDocuments."Product ID");
                        //         ApplicationDocuments.SetFilter(ApplicationDocuments.Provided, '<>%1', ApplicationDocuments.Provided::Yes);
                        //         if ApplicationDocuments.FindFirst then begin
                        //             Error(DocumentErrorTxt, "No." + ' - ' + Name);
                        //         end;
                        //     until ProductApplicationDocuments.Next = 0;
                        // end;

                        // VarVariant := Rec;
                        // if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        //     CustomApprovals.OnSendDocForApproval(VarVariant);

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
                        //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
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
                action(SendText)
                {

                    trigger OnAction()
                    var
                        SavingsAccounts: Record "Savings Accounts";
                        ReturndFieldName: Text;
                        Separator: Text;
                        Value: Text;
                        WorkString: Text;
                        String1: Text;
                        String2: Text;
                        String3: Text;
                        String4: Text;
                        String5: Text;
                        SetupCode: Text;
                        MsgBodyCode: Text;
                        // RegistrationMngt: Codeunit "Registration Process";
                        // SendSms: Codeunit SendSms;
                        ActualMsg: Text[130];
                    begin
                        //Get the Field Name----------|
                        ReturndFieldName := SavingsAccounts.GetSMSFieldName(SavingsAccounts);

                        //Split the Field Name--------|

                        String1 := Token(ReturndFieldName, '[');

                        //Get the Code----------------|
                        SetupCode := SavingsAccounts.GetSMSCode(SavingsAccounts, String1);

                        //Get the SMS Codes-----------|
                        MsgBodyCode := SavingsAccounts.GetSMSFormat();
                        MsgBodyCode := Token(MsgBodyCode, ']');

                        //Get the actual Message
                        ActualMsg := SavingsAccounts.GetAcualSMSFormat();

                        //Validate
                        if MsgBodyCode <> SetupCode then
                            Error('Kindly check whether message body code and SMS Setup code are the same');

                        //Process the SMS.------------|
                        //*RegistrationMngt.DormancyP(String1,MsgBodyCode,ActualMsg,SavingsAccounts);
                    end;
                }
                action(Reset)
                {
                    Image = StepOut;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        if (Rec.Status = Rec.Status::Open) then begin
                            Rec."Application Date" := Today;
                            Rec."Created By" := UserId;
                            Rec."Member No." := '';
                            Rec."Product Type" := '';
                            Rec.Validate("Member No.");
                            Rec.Validate("Product Type");

                            if UserSetup.Get(UserId) then begin
                                UserSetup.TestField(UserSetup."Global Dimension 1 Code");
                                UserSetup.TestField(UserSetup."Global Dimension 2 Code");
                                Rec."Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                                Rec."Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
                                Rec."Responsibility Center" := UserSetup."Responsibility Centre";
                            end;
                            Rec.Modify;
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        getControl;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        getControl;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Source := Rec.Source::Navision;
    end;

    trigger OnOpenPage()
    begin
        getControl;
    end;

    var
        MicroGroupCode: Boolean;
        ParentEdit: Boolean;
        TypeHide: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        //CustomApprovals: Codeunit "Custom Approvals Codeunit";
        FixedDeposit: Boolean;
        JuniorAccount: Boolean;
        ProductType: Record "Product Factory";
        MemberNoEdit: Boolean;
        DocumentErrorTxt: Label 'Some documents are missing for this application %1.';
        UserSetup: Record "User Setup";

    //[Scope('Internal')]
    procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    //[Scope('Internal')]
    procedure getControl()
    begin
        if Rec.Status = Rec.Status::Open then
            CurrPage.Editable := true
        else
            CurrPage.Editable := false;

        if Rec."Product Type" = '' then
            MemberNoEdit := true
        else begin

            if ProductType.Get(Rec."Product Type") then begin
                if ProductType."Product Category" = ProductType."Product Category"::"Fixed Deposit" then begin
                    FixedDeposit := true;
                    MemberNoEdit := false;
                end else
                    FixedDeposit := false;

                if ProductType."Product Category" = ProductType."Product Category"::"Junior Savings" then begin
                    JuniorAccount := true;
                    MemberNoEdit := false;
                end else
                    JuniorAccount := false;

                if (ProductType."Product Category") in [ProductType."Product Category"::" ", ProductType."Product Category"::"Deposit Contribution",
                                                        ProductType."Product Category"::"Registration Fee", ProductType."Product Category"::"Share Capital"] then
                    MemberNoEdit := true;
            end;

        end;
    end;

    //[Scope('Internal')]
    procedure Token(var Text: Text; Separator: Text) Token: Text[250]
    var
        Pos: Integer;
    begin
        Pos := StrPos(Text, Separator);
        if Pos > 0 then begin
            Token := CopyStr(Text, 1, Pos - 1);
            if Pos + 1 <= StrLen(Text) then
                Text := CopyStr(Text, Pos + 1)
            else
                Text := '';
        end else begin
            Token := Text;
            Text := '';
        end;
    end;
}

