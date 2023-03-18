page 52186141 "Workplan Activities"
{
    Caption = 'Departmental Procurement Plan Activities';
    Editable = true;
    PageType = List;
    SourceTable = "Workplan Activities";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = statuseditable;
                IndentationColumn = NameIndent;
                IndentationControls = "Activity Code", "Activity Description";
                ShowAsTree = false;
                field("Workplan Code"; Rec."Workplan Code")
                {
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    Caption = 'Activity Code';
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                }
                field(Unit; Rec.Unit)
                {
                }
                field("Source Of Funds"; Rec."Source Of Funds")
                {
                }
                field(category; Rec.category)
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                    Style = Strong;
                    StyleExpr = NoEmphasize;

                    trigger OnValidate()
                    begin
                        UpdateControls;
                    end;
                }
                field(Type; Rec.Type)
                {
                    Caption = 'Type';
                    Style = Strong;
                    StyleExpr = NameEmphasize;
                }
                field("Expense Code"; Rec."Expense Code")
                {
                }
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Totaling; Rec.Totaling)
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = NoEmphasize;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Proc. Method No."; Rec."Proc. Method No.")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit of Cost"; Rec."Unit of Cost")
                {
                    Caption = ' Cost Per Unit';
                }
                field("Amount to Transfer"; Rec."Amount to Transfer")
                {
                }
                field("Date to Transfer"; Rec."Date to Transfer")
                {
                    Visible = false;
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    Editable = false;
                }
                field("Uploaded to Procurement Workpl"; Rec."Uploaded to Procurement Workpl")
                {
                    Editable = false;
                }
                field("Converted to Budget"; Rec."Converted to Budget")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control2; Outlook)
            {
            }
            systempart(Control1; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                Visible = false;
                action(IndentWorkPlan)
                {
                    Caption = 'Indent Workplan Activities';
                    Image = IndentChartOfAccounts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    // RunObject = Codeunit "Workplan Indent";
                }
                action("Import Procurement Plan ")
                {
                    Caption = 'Import Procurement Plan';
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //ImportProcurementPlan('');
                        //XMLPORT.run(39003901);
                    end;
                }
                action("&Print")
                {
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin


                        //IF LinesCommitted THEN
                        //ERROR('All Lines should be committed');
                        Rec.Reset;
                        // SetRange("No.", "No.");
                        //REPORT.Run(52185913, true, true, Rec);
                        Rec.Reset;
                        //DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
            group("Actions")
            {
                Caption = 'Actions';
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
                    begin
                        VarVariant := Rec;
                        // if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        //     CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
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
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*
                        DocumentType := DocumentType::"Payment Voucher";
                        ApprovalEntries.Setfilters(DATABASE::"Payments Header","Document Type","No.");
                        ApprovalEntries.RUN;
                        */
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        UpdateControls;
    end;

    var
        [InDataSet]
        NoEmphasize: Boolean;
        [InDataSet]
        NameEmphasize: Boolean;
        [InDataSet]
        NameIndent: Integer;
        Text0001: Label 'Convert to Workplan Activity [ %1-%2 ]to a Workplan Budget Entry?';
        Text0002: Label 'Workplan Budget Entry created for Workplan Activity [ %1-%2 ]';
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        VarVariant: Variant;
        // CustomApprovals: Codeunit "Custom Approvals Codeunit";
        [InDataSet]
        StatusEditable: Boolean;

    //[Scope('Internal')]
    procedure SetSelection(var GLAcc: Record "Workplan Activities")
    begin
        CurrPage.SetSelectionFilter(GLAcc);
    end;

    //[Scope('Internal')]
    procedure GetSelectionFilter(): Code[80]
    var
        GLAcc: Record "Workplan Activities";
        FirstAcc: Text[20];
        LastAcc: Text[20];
        SelectionFilter: Code[80];
        GLAccCount: Integer;
        More: Boolean;
    begin
        CurrPage.SetSelectionFilter(GLAcc);
        GLAcc.SetCurrentKey("Activity Code");
        GLAccCount := GLAcc.Count;
        if GLAccCount > 0 then begin
            GLAcc.Find('-');
            while GLAccCount > 0 do begin
                GLAccCount := GLAccCount - 1;
                GLAcc.MarkedOnly(false);
                FirstAcc := GLAcc."Activity Code";
                LastAcc := FirstAcc;
                More := (GLAccCount > 0);
                while More do
                    if GLAcc.Next = 0 then
                        More := false
                    else
                        if not GLAcc.Mark then
                            More := false
                        else begin
                            LastAcc := GLAcc."Activity Code";
                            GLAccCount := GLAccCount - 1;
                            if GLAccCount = 0 then
                                More := false;
                        end;
                if SelectionFilter <> '' then
                    SelectionFilter := SelectionFilter + '|';
                if FirstAcc = LastAcc then
                    SelectionFilter := SelectionFilter + FirstAcc
                else
                    SelectionFilter := SelectionFilter + FirstAcc + '..' + LastAcc;
                if GLAccCount > 0 then begin
                    GLAcc.MarkedOnly(true);
                    GLAcc.Next;
                end;
            end;
        end;
        exit(SelectionFilter);
    end;

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        /*
        IF (Type = Type::"Begin-Total") OR (Type = Type::"End-Total") THEN
        BEGIN
            FieldEditable:=FALSE;
        END ELSE
        BEGIN
            FieldEditable:=TRUE;
        END;
        */

        //For Bold and Indentation
        NoEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;
        NameIndent := Rec.Indentation;
        NameEmphasize := Rec."Account Type" <> Rec."Account Type"::Posting;

        StatusEditable := true;
        if Rec.Status <> Rec.Status::Pending then
            StatusEditable := false;

    end;

    //[Scope('Internal')]
    procedure CheckRequiredFields()
    begin

        Rec.TestField("Account Type");
        Rec.TestField("Activity Description");
        Rec.TestField("Workplan Code");
        Rec.TestField("Date to Transfer", 0D);
        //if
    end;

    //[Scope('Internal')]
    procedure UploadWorkplanActivities()
    var
        WorkplanEntry: Record "Workplan Entry";
        EntryNum: Integer;
    begin
        WorkplanEntry.Reset;
        WorkplanEntry.Init;

        WorkplanEntry."Entry No." := GetNextEntryNo;

        WorkplanEntry."Workplan Code" := WorkplanEntry."Workplan Code";
        WorkplanEntry."Activity Code" := WorkplanEntry."Activity Code";
        WorkplanEntry.Date := Rec."Date to Transfer";

        //Validation will fill other variables
        WorkplanEntry.Validate(WorkplanEntry.Date);

        WorkplanEntry.Insert;
    end;

    local procedure GetNextEntryNo() EntryNumber: Integer
    var
        WorkplanEntry: Record "Workplan Entry";
        EntryNum: Integer;
    begin
        WorkplanEntry.SetCurrentKey("Entry No.");
        if WorkplanEntry.Find('+') then
            exit(WorkplanEntry."Entry No." + 1)
        else
            exit(1);
    end;

    //[Scope('Internal')]
    // procedure ImportProcurementPlan(FileName: Text)here
    // var
    //     TempBlob: Record TempBlob;
    //     FileManagement: Codeunit "File Management";
    //     ExportImportWorkPlan: XMLport WorkPlan;
    //     InStr: InStream;
    // begin
    //     TempBlob.Init;
    //     if FileManagement.BLOBImport(TempBlob, FileName) = '' then
    //         exit;
    //     TempBlob.Blob.CreateInStream(InStr);
    //     ExportImportWorkPlan.SetSource(InStr);
    //     ExportImportWorkPlan.Import;
    // end;
}

