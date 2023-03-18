page 52186078 "Legal Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = Legal;
    SourceTableView = WHERE("Case Level" = FILTER(<> Closed));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Case Number"; Rec."Case Number")
                {
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                }
                field("Case Type"; Rec."Case Type")
                {
                    Editable = "Case TypeEditable";
                }
                field("Case Description"; Rec."Case Description")
                {
                    Editable = false;
                }
                field("Description of Complaint"; Rec."Description of Complaint")
                {
                    Editable = "Description of ComplaintEditable";
                }
                field("Plaintiff Type"; Rec."Plaintiff Type")
                {
                    Editable = "Plaintiff TypeEditable";
                }
                field(Plaintiff; Rec.Plaintiff)
                {
                    Editable = "PlaintiffEditable";
                }
                field(Others; Rec.Others)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Accused Type"; Rec."Accused Type")
                {
                    Editable = "Accused TypeEdtable";
                }
                field("Accused Employee"; Rec."Accused Employee")
                {
                    Editable = "Accused EmployeeEditable";
                }
                field("Accused Name"; Rec."Accused Name")
                {
                }
                field("Reporter Type"; Rec."Reporter Type")
                {
                    Editable = "Reporter TypeEditable";
                }
                field(Reporter; Rec.Reporter)
                {
                    Editable = ReporterEditable;
                }
                field("Reporter Name"; Rec."Reporter Name")
                {
                }
                field("Action Duration Start Date"; Rec."Action Duration Start Date")
                {
                    Editable = "Action Duration Start DateEditable";
                }
                field("Action Duration End  Date"; Rec."Action Duration End  Date")
                {
                    Editable = "Action Duration End  DateEditable";
                }
                field("Case Duration"; Rec."Case Duration")
                {
                    Editable = false;
                }
                field("Body Handling The Complaint"; Rec."Body Handling The Complaint")
                {
                    Editable = "Body Handling The ComplaintEditable";
                }
                field("Body Name"; Rec."Body Name")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Total Cost"; Rec."Total Cost")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Case Level"; Rec."Case Level")
                {
                    Editable = false;
                }
            }
            part("Legal Line"; "Legal Line")
            {
                Caption = 'Legal Line';
                SubPageLink = No = FIELD("Case Number");
            }
            part(Control9; "Verdict List")
            {
                SubPageLink = "Case No" = FIELD("Case Number");
                Visible = true;
            }
            field("Policy Description"; Rec."Policy Description")
            {
            }
            field("Recommended Action"; Rec."Recommended Action")
            {
            }
            field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Case Cost")
            {
                Caption = 'Case Cost';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Case Cost List";
                RunPageLink = Code = FIELD("Case Number");
            }
            action(Advocate)
            {
                Image = Addresses;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Advocate List";
                RunPageLink = No = FIELD("Case Number");
                Scope = Repeater;
            }
            action("Damages List")
            {
                Caption = 'Damages List';
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Category8;
                PromotedIsBig = true;
                RunObject = Page "Damages List";
                RunPageLink = "Case No" = FIELD("Case Number");
            }
            action(Appeal)
            {
                Caption = ' Appeal';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction()
                begin
                    Rec.TestField("Case Level", Rec."Case Level"::Closed);

                    if Rec.Appealed = true then begin
                        Error('A case can only be Appealed once');
                    end;

                    if Confirm('Are you sure you want to Apeal this case?"') then begin
                        Rec."Case Level" := Rec."Case Level"::Closed;
                        Rec.Appealed := true;
                        Rec.Modify;
                        Message('Case Number %1 has been marked as "Under Appeal"', Rec."Case Number");
                    end;
                end;
            }
            action("Case Witness")
            {
                Caption = 'Case Witness';
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                RunObject = Page "Witness Line";
                RunPageLink = "Case No" = FIELD("Case Number");
                Scope = Repeater;
            }
            action("Pending Hearing")
            {
                Caption = 'Pending Hearing';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction()
                begin
                    Rec.TestField("Case Level", Rec."Case Level"::Open);

                    if Confirm('Are you sure you want to this case as Pending Hearing?"') then begin
                        Rec."Case Level" := Rec."Case Level"::"Pending Hearing";
                        Rec.Modify;
                        Message('Case Number %1 has been marked as Pending Hearing', Rec."Case Number");
                    end;
                end;
            }
            action("In Progress")
            {
                Caption = 'In Progress';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction()
                begin
                    Rec.TestField("Case Level", Rec."Case Level"::"Pending Hearing");

                    if Confirm('Are you sure you want to this case as In Proress?"') then begin
                        Rec."Case Level" := Rec."Case Level"::"In Proress";
                        Rec.Modify;
                        Message('Case Number %1 has been marked as In Proress', Rec."Case Number");
                    end;
                end;
            }
            action(Close)
            {
                Caption = 'Close';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction()
                begin
                    Rec.TestField("Case Level", Rec."Case Level"::"In Proress");
                    //Rec.TestField("Case Verdict");
                    if Confirm('Are you sure you want to this case as closed?"') then begin
                        Rec."Case Level" := Rec."Case Level"::Closed;
                        Rec.Modify;
                        Message('Case Number %1 has been marked as closed', Rec."Case Number");
                    end;
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
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
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
                action(Action52)
                {
                }
            }
        }
    }

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        UpdatePageControls;
    end;

    trigger OnOpenPage()
    begin
        UpdatePageControls;
    end;

    var
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        "Plaintiff TypeEditable": Boolean;
        PlaintiffEditable: Boolean;
        "Description of ComplaintEditable": Boolean;
        "Accused EmployeeEditable": Boolean;
        "Accused TypeEdtable": Boolean;
        ReporterEditable: Boolean;
        "Reporter TypeEditable": Boolean;
        "Body Handling The ComplaintEditable": Boolean;
        "Date of ComplaintEditable": Boolean;
        "Action Duration Start DateEditable": Boolean;
        "Action Duration End  DateEditable": Boolean;
        "Case TypeEditable": Boolean;

    //[Scope('Internal')]
    procedure UpdatePageControls()
    begin
        /* IF Status<>Status::Approved THEN BEGIN
           "Payment Release DateEditable" :=FALSE;
           "Cheque No.Editable" :=FALSE;
           "Cheque TypeEditable" :=FALSE;
           "Invoice Currency CodeEditable" :=TRUE;
         END ELSE BEGIN
          "Payment Release DateEditable" :=TRUE;
          "Cheque TypeEditable" :=TRUE;
          "Invoice Currency CodeEditable" :=FALSE;
          PaymodeEditable:=TRUE;
          BankEditabl:=TRUE;
          OnBehalfEditable:=TRUE;
          RespEditabl:=TRUE;

         END;*/


        if Rec.Status = Rec.Status::Approved then begin
            "Plaintiff TypeEditable" := false;
            PlaintiffEditable := false;
            "Description of ComplaintEditable" := false;
            "Accused TypeEdtable" := false;
            "Accused EmployeeEditable" := false;
            ReporterEditable := false;
            "Reporter TypeEditable" := false;
            "Reporter TypeEditable" := false;
            "Body Handling The ComplaintEditable" := false;
            "Case TypeEditable" := false;
        end else begin
            if Rec.Status = Rec.Status::New then begin
                "Plaintiff TypeEditable" := true;
                PlaintiffEditable := true;
                "Description of ComplaintEditable" := true;
                "Accused TypeEdtable" := true;
                "Accused EmployeeEditable" := true;
                ReporterEditable := true;
                "Reporter TypeEditable" := true;
                "Reporter TypeEditable" := true;
                "Body Handling The ComplaintEditable" := true;
                "Action Duration Start DateEditable" := true;
                "Action Duration End  DateEditable" := true;
                "Case TypeEditable" := true;
            end;
        end;

    end;
}

