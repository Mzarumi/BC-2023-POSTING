page 52185510 "HR Jobs Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions,Job,Job Succession';
    SourceTable = "HR Jobs";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Job ID"; Rec."Job ID")
                {
                    Editable = true;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Caption = 'Job Title';
                    Importance = Promoted;
                }
                group(Control17)
                {
                    ShowCaption = false;
                    grid(Control16)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control15)
                        {
                            ShowCaption = false;
                            field("Position Reporting to"; Rec."Position Reporting to")
                            {
                                Importance = Promoted;
                            }
                            field("Position Reporting Name"; Rec."Position Reporting Name")
                            {
                                ShowCaption = false;
                            }
                        }
                    }
                }
                field(Grade; Rec.Grade)
                {
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    Importance = Promoted;
                }
                field("Occupied Positions"; Rec."Occupied Positions")
                {
                    Importance = Promoted;
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    Importance = Promoted;
                }
                group(Control33)
                {
                    ShowCaption = false;
                    grid(Control31)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control30)
                        {
                            ShowCaption = false;
                            field("Responsibility Center"; Rec."Responsibility Center")
                            {
                                Editable = true;
                                Enabled = true;
                                HideValue = false;
                                ShowCaption = true;
                                Visible = true;
                            }
                            field("Responsibility Center Name"; Rec."Responsibility Center Name")
                            {
                                Editable = false;
                            }
                        }
                    }
                }
                field("Employee Requisitions"; Rec."Employee Requisitions")
                {
                    Editable = false;
                }
                field("Date Created"; Rec."Date Created")
                {
                    Editable = false;
                    Style = Attention;
                }
                field(Status; Rec.Status)
                {
                    Importance = Promoted;
                    Style = Attention;
                }
                field("Marked for Succession"; Rec."Marked for Succession")
                {
                }
            }
            group(Dimensions)
            {
                Caption = 'Dimensions';
                group(Control29)
                {
                    ShowCaption = false;
                    grid(Control10)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control9)
                        {
                            ShowCaption = false;
                            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                            {
                            }
                            field("Global Dimension 1 Name"; Rec."Global Dimension 1 Name")
                            {
                                ShowCaption = false;
                            }
                        }
                    }
                }
                group(Control6)
                {
                    ShowCaption = false;
                    grid(Control5)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control4)
                        {
                            ShowCaption = false;
                            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                            {
                            }
                            field("Global Dimension 2 Name"; Rec."Global Dimension 2 Name")
                            {
                                ShowCaption = false;
                            }
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755004; "HR Jobs Factbox")
            {
                SubPageLink = "Job Description" = FIELD("Job ID");
            }
            systempart(Control1102755006; Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
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

                        Rec.TestField("Position Reporting to");
                        //Rec.TestField("Responsibility Center");
                        Rec.TestField("No of Posts");
                        Rec.TestField("Global Dimension 1 Code");
                        Rec.TestField("Global Dimension 2 Code");


                        Rec.CalcFields("No. of Requirements");
                        if Rec."No. of Requirements" = 0 then Error('Please Specify the Job Requirements');
                        Rec.CalcFields("No. of Responsibilities");

                        if Rec."No. of Responsibilities" = 0 then Error('Please Specify the Job Responsibilities');


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
            }
            group(Job)
            {
                action("Job Requirements")
                {
                    Caption = 'Job Requirements';
                    Image = Card;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Requirement Lines";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
                action(Responsibilities)
                {
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
                action(Occupants)
                {
                    Caption = 'Occupants';
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Occupants";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
                action("Mark for Succession")
                {
                    Caption = 'Mark for Succession';
                    Image = Check;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if Rec.Status = Rec.Status::Approved then begin
                            Rec."Marked for Succession" := true;
                            Rec.Modify;
                        end;
                    end;
                }
                action("Reopen Job Card")
                {
                    Caption = 'Reopen Job Card';
                    Image = OpenJournal;
                    Promoted = true;

                    trigger OnAction()
                    begin

                        Rec.Status := Rec.Status::Open;
                        Rec.Modify;
                    end;
                }
                action("Board Minutes[case 360 Docs]")
                {
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction()
                    begin
                        DMS.Reset;
                        DMS.SetRange(DMS.Key, DMS.Key::"Board Minutes");
                        if DMS.Find('-') then begin
                            HyperLink(DMS."url path" + Rec."Job ID");
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin

        UpdateControls;
    end;

    trigger OnAfterGetRecord()
    begin

        OpenApprovalEntriesExistCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        Rec.Validate("Vacant Positions");
    end;

    trigger OnOpenPage()
    begin

        UpdateControls;
    end;

    var
        HREmployees: Record "HR Employees";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        HRCodeunit: Codeunit "HR Codeunit2";
        [InDataSet]
        PageEditable: Boolean;
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        DMS: Record EDMS;

    //[Scope('Internal')]
    procedure RecordLinkCheck(job: Record "HR Jobs") RecordLnkExist: Boolean
    var
        objRecordLnk: Record "Record Link";
        // TableCaption:(Rec.RecordId);
        objRecord_Link: RecordRef;
    begin
        objRecord_Link.GetTable(job);
        // TableCaption := objRecord_Link(Rec.RecordId);
        objRecordLnk.Reset;
        // objRecordLnk.SetRange(objRecordLnk."Record ID", Rec.TableCaption);
        if objRecordLnk.Find('-') then exit(true) else exit(false);
    end;

    local procedure UpdateControls()
    begin
        //CurrPage.EDITABLE:=HRCodeunit.fn_UpdateControls(FORMAT(Status));
    end;
}

