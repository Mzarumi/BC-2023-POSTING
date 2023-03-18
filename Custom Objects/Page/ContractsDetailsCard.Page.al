page 52186036 "Contracts Details Card"
{
    DeleteAllowed = false;
    PageType = Document;
    SourceTable = Contracts;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = GeneralSectionEdit;
                field("Contract No"; Rec."Contract No")
                {
                }
                field("Type Of Service"; Rec."Type Of Service")
                {

                    trigger OnValidate()
                    begin
                        UpdateControls
                    end;
                }
                field("Nature Of Service"; Rec."Nature Of Service")
                {
                    Enabled = NatureOfService;
                    Visible = false;
                }
                field("Contract Description"; Rec."Contract Description")
                {
                }
                field("Start Date"; Rec."Start Date")
                {

                    trigger OnValidate()
                    begin
                        Duration := '';

                        if (Rec."Start Date" <> 0D) then
                            Duration := HRCodeunit.DetermineAge(Rec."Start Date", Rec."End Date");
                    end;
                }
                field("End Date"; Rec."End Date")
                {

                    trigger OnValidate()
                    begin
                        Duration := '';

                        if (Rec."Start Date" <> 0D) then
                            Duration := HRCodeunit.DetermineAge(Rec."Start Date", Rec."End Date");
                    end;
                }
                // field(Duration; Rec.Duration)
                // {
                //     Caption = 'Duration';
                //     Editable = false;
                // }
                field("Contractor Type"; Rec."Contractor Type")
                {
                }
                field("Contractor No"; Rec."Contractor No")
                {
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    Editable = false;
                }
                field(Address; Rec.Address)
                {
                }
                field("Tel No."; Rec."Tel No.")
                {
                }
                field("Advocate Name"; Rec."Advocate Name")
                {
                    Visible = false;
                }
                field("Review Interval"; Rec."Review Interval")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Defect Liability Period"; Rec."Defect Liability Period")
                {
                    Editable = DefectLiabilityPeriodeditable;
                }
                field("Support Period"; Rec."Support Period")
                {
                }
                field("Warranty Period"; Rec."Warranty Period")
                {
                }
                field("Payment Terms"; Rec."Payment Terms")
                {
                }
                field("Board Approval Date"; Rec."Board Approval Date")
                {
                }
                field("Responsible Employee"; Rec."Responsible Employee")
                {
                }
                field("Responsible Employee Name"; Rec."Responsible Employee Name")
                {
                }
                field("User Department"; Rec."User Department")
                {
                }
                field("Contract Amount"; Rec."Contract Amount")
                {
                    Editable = true;
                }
                field(Balance; Rec.Balance)
                {
                }
                field("Total Balance"; Rec."Total Balance")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                    MultiLine = true;
                }
                field(Status; Rec.Status)
                {

                    trigger OnValidate()
                    begin
                        UpdateControls;
                    end;
                }
            }
            part("Contract Milestone Entries"; Milestones)
            {
                SubPageLink = "Contract No" = FIELD("Contract No");
            }
            group(Termination)
            {
                Editable = TerminationEdit;
                field("Termination Reason"; Rec."Termination Reason")
                {
                    ColumnSpan = 100;
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Co&mments")
            {
                RunObject = Page "Comment Sheet";
            }
            action("Upload Files")
            {
                Caption = 'Upload Files';
                Enabled = UploadFiles;
                Image = FileContract;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    //SkyFileManagement: Codeunit "Sky File Management";
                    FileLocation: Text;
                    SkyTempBlob: Record "Sky TempBlob";
                    FileName: Text;
                    ContractDocuments: Record "Contract Documents";
                    Document: Text;
                    SelectionTxt: Label '&Upload Indemnity,&Upload Contract,&Upload SLA';
                begin
                    if (Rec.Status <> Rec.Status::New) and (Rec.Status <> Rec.Status::"Pending Approval") then
                        Error('Status must not be %1', Format(Rec.Status));


                    Selection := StrMenu(SelectionTxt);


                    if Selection = 0 then begin
                        Message('Operation aborted!');
                    end;

                    if Selection = 1 then begin
                        Document := 'Indemnity File';
                        ContractDocuments.Get('INDEMNITY');
                        FileName := ContractDocuments."File Location" + '\Indemnity_' + Rec."Contract No" + '.pdf';
                    end;

                    if Selection = 2 then begin
                        Document := 'Contract File';
                        ContractDocuments.Get('CONTRACT');
                        FileName := ContractDocuments."File Location" + '\Contract_' + Rec."Contract No" + '.pdf';
                    end;
                    if Selection = 3 then begin
                        Document := 'SLA File';
                        ContractDocuments.Get('SLA');
                        FileName := ContractDocuments."File Location" + '\SLA_' + Rec."Contract No" + '.pdf';
                    end;
                    // if Selection <> 0 then begin
                    //     FileLocation := SkyFileManagement.OpenFileDialog(Document, '*.pdf', '');
                    //     SkyFileManagement.BLOBImportFromServerFile(SkyTempBlob, FileLocation);

                    //     if Exists(FileName) then begin
                    //         if not Confirm('There is already another ' + Document + ' that has been uploaded, uploading this one will replace the other one! Would you like to continue?') then
                    //             Message('Operation aborted!')
                    //         else begin
                    //             Erase(FileName);
                    //             SkyFileManagement.BLOBExportToServerFile(SkyTempBlob, FileName);
                    //             Message('Indemnity File Uploaded Successfully');
                    //         end;
                    //     end else begin
                    //         SkyFileManagement.BLOBExportToServerFile(SkyTempBlob, FileName);
                    //         Message('%1 Uploaded Successfully', Document);
                    //     end;
                    // end;
                end;
            }
            action("Download Files")
            {
                Caption = 'Download Files';
                Image = ExportAttachment;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    //SkyFileManagement: Codeunit "Sky File Management";
                    FileLocation: Text;
                    SkyTempBlob: Record "Sky TempBlob";
                    FileName: Text;
                    ContractDocuments: Record "Contract Documents";
                    Document: Text;
                    SelectionTxt: Label '&Download Indemnity,&Download Contract,&Download SLA';
                    Name: Text;
                begin
                    Selection := StrMenu(SelectionTxt);
                    if Selection = 0 then begin
                        Message('Operation aborted!');
                    end;

                    if Selection = 1 then begin
                        Document := 'Indemnity';
                        ContractDocuments.Get('INDEMNITY');
                        FileName := ContractDocuments."File Location" + '\Indemnity_' + Rec."Contract No" + '.pdf';
                        Name := 'Indemnity_' + Rec."Contract No" + '.pdf';
                    end;

                    if Selection = 2 then begin
                        Document := 'Contract';
                        ContractDocuments.Get('CONTRACT');
                        FileName := ContractDocuments."File Location" + '\Contract_' + Rec."Contract No" + '.pdf';
                        Name := 'Contract_' + Rec."Contract No" + '.pdf';
                    end;
                    if Selection = 3 then begin
                        Document := 'SLA';
                        ContractDocuments.Get('SLA');
                        FileName := ContractDocuments."File Location" + '\SLA_' + Rec."Contract No" + '.pdf';
                        Name := 'SLA_' + Rec."Contract No" + '.pdf';
                    end;
                    //here
                    // if Selection <> 0 then begin
                    //     if Exists(FileName) then
                    //         Download(FileName, Document, '', 'Text file(*.pdf)|*.pdf', Name)
                    //     else
                    //         Message('The file you are looking for is not available');
                    // end;
                end;
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
                    Enabled = SendApproval;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                        ContractDocuments: Record "Contract Documents";
                        FileName: Text;
                    begin
                        Rec.TestField("Type Of Service");
                        // Rec.TestField("Nature Of Service");
                        Rec.TestField("Start Date");
                        Rec.TestField("End Date");
                        Rec.TestField("Contractor Type");
                        Rec.TestField("Contractor No");
                        Rec.TestField(Address);
                        Rec.TestField("Tel No.");
                        if Rec."Type Of Service" = Rec."Type Of Service"::Services then begin
                            Rec.TestField("Defect Liability Period");
                            Rec.TestField("Warranty Period");
                        end;
                        if Rec."Type Of Service" = Rec."Type Of Service"::Goods then begin
                            Rec.TestField("Support Period");
                        end;
                        Rec.TestField("Payment Terms");
                        Rec.TestField("Board Approval Date");
                        Rec.TestField("Responsible Employee");
                        Rec.TestField("User Department");
                        Rec.TestField(Remarks);
                        Rec.TestField(Status, Rec.Status::New);

                        ContractDocuments.Get('CONTRACT');
                        FileName := ContractDocuments."File Location" + '\Contract_' + Rec."Contract No" + '.pdf';
                        // if not Exists(FileName) then
                        //     Error('You cannot send a contract for approval without the contract document');

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
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
                action("Terminate Contract")
                {
                    Caption = 'Terminate Contract';
                    Enabled = TerminateContract;
                    Image = CarryOutActionMessage;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("Termination Reason");
                        Rec.TestField(Status, Rec.Status::Approved);
                        if Confirm('Are you sure you want to Terminate This Contract?') then begin
                            Rec.Terminated := true;
                            Rec.Modify;
                            Message('Contract Number %1 has been Terminated', Rec."Contract No");
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        UpdateControls();
    end;

    trigger OnAfterGetRecord()
    begin
        Duration := '';

        if (Rec."Start Date" <> 0D) then
            Duration := HRCodeunit.DetermineAge(Rec."Start Date", Rec."End Date");
    end;

    trigger OnInit()
    begin
        SupportPeriodEditable := true;
        WarrantyPeriodeditable := true;
        DefectLiabilityPeriodeditable := true;
    end;

    trigger OnOpenPage()
    begin
        UpdateControls;
    end;

    var
        ContMilestones: Record Milestones;
        ContMilestones2: Record "Contract Cycle Stage";
        StageNo: Integer;
        CopyContr: Record Contracts;
        ChkContLastStage: Record "Contract Cycle Stage";
        LastStage: Boolean;
        Expectations: Record "Contract Expectation Details";
        AllStages: Record "All Stages Per Contract";
        Invoiced: Boolean;
        DefectLiabilityPeriodeditable: Boolean;
        SupportPeriodEditable: Boolean;
        WarrantyPeriodeditable: Boolean;
        OnAfterGetCurrRecord: Integer;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        Duration: Text[100];
        HRCodeunit: Codeunit "HR Codeunit";
        Selection: Integer;
        NatureOfService: Boolean;
        GeneralSectionEdit: Boolean;
        UploadFiles: Boolean;
        SendApproval: Boolean;
        CancelApproval: Boolean;
        TerminateContract: Boolean;
        TerminationEdit: Boolean;

    //[Scope('Internal')]
    procedure UpdateControls()
    begin

        if Rec."Type Of Service" = Rec."Type Of Service"::Goods then
            NatureOfService := false;
        if Rec."Type Of Service" = Rec."Type Of Service"::Services then
            NatureOfService := true;

        if Rec.Status = Rec.Status::New then begin
            GeneralSectionEdit := true;
            UploadFiles := true;
            SendApproval := true;
            TerminateContract := false;
            CancelApproval := false;
            TerminationEdit := false;
        end;

        if Rec.Status = Rec.Status::Approved then begin
            GeneralSectionEdit := false;
            UploadFiles := false;
            SendApproval := false;
            TerminateContract := true;
            CancelApproval := false;
            TerminationEdit := true;
        end;

        if Rec.Status = Rec.Status::"Pending Approval" then begin
            GeneralSectionEdit := false;
            UploadFiles := false;
            SendApproval := false;
            TerminateContract := false;
            CancelApproval := true;
            TerminationEdit := false;
        end;

        if Rec.Status = Rec.Status::Rejected then begin
            GeneralSectionEdit := false;
            UploadFiles := false;
            SendApproval := false;
            TerminateContract := false;
            CancelApproval := false;
            TerminationEdit := false;
        end;

        if Rec.Terminated = true then begin
            TerminationEdit := false;
            GeneralSectionEdit := false;
            UploadFiles := false;
            SendApproval := false;
            TerminateContract := false;
            CancelApproval := false;
            TerminationEdit := false;
        end;
    end;
}

