page 52186488 "HR Training Application Header"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Show';
    SourceTable = "HR Training App Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Application No"; Rec."Application No")
                {
                    Editable = false;
                }
                field("Application Date"; Rec."Application Date")
                {
                    Editable = false;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ShowMandatory = true;
                    TableRelation = "HR Training Needs" WHERE(Closed = CONST(false));
                }
                field("Bonded Training?"; Rec."Bonded Training?")
                {
                }
                field("Course Description"; Rec."Course Description")
                {
                    Editable = false;
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                    Editable = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    Editable = false;
                }
                field("End Date"; Rec."End Date")
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field(Status; Rec.Status)
                {
                    ShowMandatory = false;
                }
            }
            part(Control3; "HR Training Application Lines")
            {
                SubPageLink = "Application No." = FIELD("Application No");
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
            }
            systempart(Control15; Notes)
            {
            }
        }
    }

    actions
    {
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
                        //Rec.TestField("No of Posts");
                        /*Rec.TestField("Document No.");
                        Rec.TestField(Description);
                        Rec.TestField("Interest Due Date");*/
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
                action("Suggest Participants")
                {
                    Caption = 'Suggest Participants';
                    Image = Employee;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        //DW
                        HRCodeunit.fn_SuggestParticipants(39003976, Rec."Application No", 1); // Parameters = LineTable ID & Document No
                    end;
                }
                action("Get Participants")
                {
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        //Rec.TestField(Closed,FALSE);

                        //DELETE ANY PREVIOS RECORDS RELATED TO THIS ACTIVITY
                        HRActivityApprovalEntry.SetRange(HRActivityApprovalEntry."Application No.", Rec."Application No");
                        if HRActivityApprovalEntry.Find('-') then
                            HRActivityApprovalEntry.DeleteAll;

                        //GET ONLY ACTIVE EMPLOYEES
                        HREmp.Reset;
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        HREmp.FindFirst;
                        begin
                            HRActivityApprovalEntry.Reset;
                            repeat
                                HRActivityApprovalEntry.Init;
                                //HREmp.TestField(HREmp."User ID");
                                HRActivityApprovalEntry."Employee No." := HREmp."No.";
                                HRActivityApprovalEntry.Name := HREmp."Full Name";
                                //HRActivityApprovalEntry."Participant E-Mail":= HREmp."Company E-Mail";
                                HRActivityApprovalEntry."Application No." := Rec."Application No";
                                HRActivityApprovalEntry.Validate(HRActivityApprovalEntry."Employee No.");
                                HRActivityApprovalEntry.Insert();
                            until HREmp.Next = 0;
                        end;
                    end;
                }
                action("Notify Participants")
                {
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        /*
                        //Rec.TestField(Closed,FALSE);
                        
                        HRActivityApprovalEntry.RESET;
                        HRActivityApprovalEntry.SETRANGE(HRActivityApprovalEntry."Application No.","Application No");
                        
                        //IF NO PARTICIPANTS ARE IMPORTED
                        IF HRActivityApprovalEntry.COUNT=0 THEN
                        ERROR('You must get participants to notify before using this function');
                        
                        //ELSE
                        GET("Application No");
                        HRActivityApprovalEntry.RESET;
                        
                        WITH HRActivityApprovalEntry DO BEGIN
                        
                        
                        //DocType:=DocType::CompAct;
                        
                        
                        //SETRANGE("Table ID",DATABASE::"HR Activity Participants");
                        //SETRANGE("Document Type",DocType);
                        //SETRANGE(""Document no.", Code);
                        //SETRANGE("Activity Status","Activity Status"::Created);
                        //
                        REPEAT
                        
                        //ApprovalsMgtNotification.SendActivityNotificationMail(Rec,HRActivityApprovalEntry);
                        
                        
                        HRActivityApprovalEntry.GET("Employee No.");
                        //HREmp.TestField(HREmp."Company E-Mail");
                        
                        HREmailParameters.RESET;
                        HREmailParameters.GET(HREmailParameters."Associate With"::"Leave Notifications");
                        smtp.CreateMessage(HREmailParameters."Sender Name",HREmailParameters."Sender Address",HREmp."Company E-Mail",
                        HREmailParameters.Subject,'Dear'+' '+ HREmp."First Name" +' '+
                        HREmailParameters.Body+' '+"Application No"+' '+ HREmailParameters."Body 2",TRUE);
                        smtp.Send();
                        //MESSAGE('Leave applicant has been notified successfully');
                        
                        HRActivityApprovalEntry.Notified:=TRUE;
                        HRActivityApprovalEntry.MODIFY;
                        
                        UNTIL HRActivityApprovalEntry.NEXT = 0;
                        MESSAGE('%1',Text001)
                        END
                        //END
                        */



                        if Rec.Status = Rec.Status::New then
                            Error('You Cannot notify driver when the application is not approved');

                        // smtp.CreateMessage('Dear' + ' ' + HRTrainingAppLines.Name + ',' + 'Training Approval Notification', HRTrainingAppLines."Participant Email", HRTrainingAppLines."Participant Email",
                        //    'Training Approval Notification', 'You have Training Notification,' + "Application No" + '  ' +
                        //     HRTrainingAppLines."Employee No." + ' ', true);//"Drop Off Point"+'  '+"Pickup Point"+'  '+FORMAT("Transport Type")+'   '+'Days Applied'+'   '+FORMAT("Days Applied")+'   '+'   '+'Start Time'+'   ',TRUE)
                        //                                                    // '  '+FORMAT(Time)+'   '+'Start Date'+FORMAT("Start Date")+'   '+'   '+'Return Date'+'   '+ FORMAT("Return Date")+'  ''Driver Name'+'  '+"Driver Name"+'  '+'Vehicle'+'  '+Vehicle+'  '+"Name Vehicle",TRUE);
                        // smtp.Send();
                        Message('Email sent to participants');

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if Rec.Status = Rec.Status::New then begin
            "Responsibility CenterEditable" := true;
            "Application NoEditable" := true;
            "Employee No.Editable" := true;
            "Employee NameEditable" := true;
            "Employee DepartmentEditable" := true;
            "Purpose of TrainingEditable" := true;
            "Course TitleEditable" := true;
        end else begin
            "Responsibility CenterEditable" := false;
            "Application NoEditable" := false;
            "Employee No.Editable" := false;
            "Employee NameEditable" := false;
            "Employee DepartmentEditable" := false;
            "Purpose of TrainingEditable" := false;
            "Course TitleEditable" := false;
        end;
    end;

    trigger OnInit()
    begin
        "Course TitleEditable" := true;
        "Purpose of TrainingEditable" := true;
        "Employee DepartmentEditable" := true;
        "Employee NameEditable" := true;
        "Employee No.Editable" := true;
        "Application NoEditable" := true;
        "Responsibility CenterEditable" := true;
    end;

    var
        HREmp: Record "HR Employees";
        EmpNames: Text[40];
        sDate: Date;
        HRTrainingApplications: Record "HR Training App Header";
        ApprovalComments: Page "Approval Comments";
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Application NoEditable": Boolean;
        [InDataSet]
        "Employee No.Editable": Boolean;
        [InDataSet]
        "Employee NameEditable": Boolean;
        [InDataSet]
        "Employee DepartmentEditable": Boolean;
        [InDataSet]
        "Purpose of TrainingEditable": Boolean;
        [InDataSet]
        "Course TitleEditable": Boolean;
        HRExitTrainingBond: Record "HR Exit Training Bonding";
        HRTrainingAppLines: Record "HR Training App Lines";
        HRTrainingNeeds: Record "HR Training Needs";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        HRCodeunit: Codeunit "HR Codeunit2";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExist: Boolean;
        HRActivityApprovalEntry: Record "HR Training App Lines";
        HREmailParameters: Record "HR E-Mail Parameters";
        //smtp: Codeunit "SMTP Mail";
        Text001: Label 'All Participants have been notified via E-Mail';

    //[Scope('Internal')]
    procedure TESTFIELDS()
    begin
    end;

    local procedure get_LastLineNo() LastLineNo: Integer
    var
        HRExitTrainingBonding2: Record "HR Exit Training Bonding";
    begin
        HRExitTrainingBonding2.Reset;
        if HRExitTrainingBonding2.Find('+') then begin
            Rec.Status := Rec.Status::Approved;
            LastLineNo := HRExitTrainingBonding2."Line No.";
        end else begin
            Rec.Status := Rec.Status::Approved;
            LastLineNo := 1;
        end;
    end;
}

