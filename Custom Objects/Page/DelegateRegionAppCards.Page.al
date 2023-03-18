page 52186337 "Delegate Region App Cards"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Delegate Region Applicationss";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = PageEditable;
                field("Code"; Rec.Code)
                {
                    Editable = false;
                }
                field("Delegate Region Description"; Rec."Delegate Region Description")
                {
                }
                field("Region Code"; Rec."Region Code")
                {
                }
                field("Region Name"; Rec."Region Name")
                {
                }
                field("Electoral Zone"; Rec."Electoral Zone")
                {
                }
                field("Electoral Zone Name"; Rec."Electoral Zone Name")
                {
                    Visible = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 1 Name"; Rec."Global Dimension 1 Name")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Global Dimension 2 Name"; Rec."Global Dimension 2 Name")
                {
                }
                field(County; Rec.County)
                {
                }
                field("County Name"; Rec."County Name")
                {
                }
                field("Sub-County"; Rec."Sub-County")
                {
                }
                field("Sub-County Name"; Rec."Sub-County Name")
                {
                }
                field("Delegate Count"; Rec."Delegate Count")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
                field("Approved By"; Rec."Approved By")
                {
                }
                field("Approval Date"; Rec."Approval Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Created; Rec.Created)
                {
                }
                field(Type; Rec.Type)
                {
                }
            }
            part(Control25; "Delegate Members Applicationss")
            {
                Enabled = PageEditable;
                SubPageLink = Code = FIELD(Code);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Approve)
            {
                Caption = 'Approve';
                Image = Approve;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    // Status := Status::Approved;
                    // Modify;
                end;
            }
            separator(Action21)
            {
            }
            action(SendApprovalRequest)
            {
                Caption = 'Send A&pproval Request';
                Enabled = NOT OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;

                trigger OnAction()
                var
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    // CalcFields("Delegate Count");
                    // if "Delegate Count" = 0 then
                    Error('The delegates must be captured');
                    //TESTFIELD("Delegate Region Description");
                    //TESTFIELD("Electoral Zone");
                    // TestField("Global Dimension 1 Code");
                    // TestField("Global Dimension 2 Code");

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
                    // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;

                trigger OnAction()
                var
                    // ApprovalEntries: Page "Approval Entries";
                    // approvalsMgmt: Codeunit "Approvals Mgmt.";
                begin

                    //approvalsMgmt.OpenApprovalEntriesPage(RecordId);

                end;
            }
            action("Create Electoral Zone")
            {
                Image = CreateWarehousePick;
                Promoted = true;

                trigger OnAction()
                begin
                    // TestField(Created, false);
                    // TestField(Status, Status::Approved);

                    if not Confirm(ConfirmCreation) then
                        exit;
                    //here//RegistrationProcess.CreateDelegates(Rec);
                end;
            }
            action("Generate AGM Delegate")
            {
                Image = CreateLinesFromTimesheet;
                Promoted = true;
                PromotedCategory = Process;

                // trigger OnAction()
                // begin
                //     if Type = Type::ADM then
                //         RegistrationProcess.CreateAGMDelegates(Rec)
                //         else
                //         exit;
                // end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls;
        SetControlAppearance;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        UpdateControls;
    end;

    trigger OnOpenPage()
    begin
        UpdateControls;
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        ConfirmCreation: Label 'Are you sure you want to create this group of delegates?';
        DelegateGroupss: Record "Delegate Region";
        DelegateMembersApplicationss: Record "Delegate Members Applicationss";
        DelegateMemberss: Record "Delegate Memberss";
        RegistrationProcess: Codeunit "Registration Process";
        PageEditable: Boolean;

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        //if (Status <> Status::Open) or (Created = true) then
        //PageEditable := false else
        PageEditable := true;
    end;

    //[Scope('Internal')]
    procedure SetControlAppearance()
    var
        // ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        //OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        //OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);

    end;
}

