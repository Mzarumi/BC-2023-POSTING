page 52186576 "HR Disciplinary Case Card N"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Case Status,Show';
    SourceTable = "HR Disciplinary Cases NCA";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Case Number"; Rec."Case Number")
                {
                }
                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    Editable = false;
                }
                field("Accused Employee"; Rec."Accused Employee")
                {
                }
                field("Accused Employee Name"; Rec."Accused Employee Name")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Head of Department"; Rec."Head of Department")
                {
                }
                field("Head of Department Name"; Rec."Head of Department Name")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Type Complaint"; Rec."Type Complaint")
                {
                }
                field("Description of Complaint"; Rec."Description of Complaint")
                {
                    MultiLine = true;
                }
                field("Severity Of the Complain"; Rec."Severity Of the Complain")
                {
                }
                field("Date of Complaint was Reported"; Rec."Date of Complaint was Reported")
                {
                }
                field("Accussed By"; Rec."Accussed By")
                {
                }
                field(Reporter; Rec.Reporter)
                {
                }
                field("Reporter Name"; Rec."Reporter Name")
                {
                    Editable = false;
                    ShowCaption = false;
                }
                field("Non Employee Reporter"; Rec."Non Employee Reporter")
                {
                }
                field("Witness #1"; Rec."Witness #1")
                {
                }
                field("Witness #1 Name"; Rec."Witness #1 Name")
                {
                    Editable = false;
                }
                field("Witness #2"; Rec."Witness #2")
                {
                }
                field("Witness #2  Name"; Rec."Witness #2  Name")
                {
                    Editable = false;
                }
                field("Date To Discuss Case"; Rec."Date To Discuss Case")
                {
                }
                field("Body Handling The Complaint"; Rec."Body Handling The Complaint")
                {
                }
                field("Body Handling Name"; Rec."Body Handling Name")
                {
                    Editable = false;
                }
                field("Mode of Lodging the Complaint"; Rec."Mode of Lodging the Complaint")
                {
                    Editable = true;
                }
                field("Policy Guidlines In Effect"; Rec."Policy Guidlines In Effect")
                {
                }
                field("Policy Description"; Rec."Policy Description")
                {
                    Editable = false;
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                    Editable = RecommendedActionEditable;
                }
                field("Recommended Action Description"; Rec."Recommended Action Description")
                {
                    Editable = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Disciplinary Stage Status"; Rec."Disciplinary Stage Status")
                {
                }
            }
            group("Action Information")
            {
                Caption = 'Action Information';
                field("Action Taken"; Rec."Action Taken")
                {
                }
                field("Taken Action Description"; Rec."Taken Action Description")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                    Editable = true;
                    MultiLine = true;
                }
                field("n jj"; Rec.Comments)
                {
                    MultiLine = true;
                }
                field("Review Findings"; Rec."Review Findings")
                {
                    MultiLine = true;
                }
                field("Action Duration Start Date"; Rec."Action Duration Start Date")
                {
                }
                field("Action Duration End  Date"; Rec."Action Duration End  Date")
                {
                }
                field("Interdict Employee"; Rec."Interdict Employee")
                {
                }
            }
            group("Appeal Information")
            {
                Caption = 'Appeal Information';
                field(Appealed; Rec.Appealed)
                {
                    Editable = false;
                }
                field("Appeal Finding"; Rec."Appeal Finding")
                {
                }
                field("Appeal Date"; Rec."Appeal Date")
                {
                }
                field("Appeal Decision"; Rec."Appeal Decision")
                {
                }
            }
            group("Court Information")
            {
                Caption = 'Court Information';
                field("Court Decision"; Rec."Court Decision")
                {
                }
                field("Court Decision Date"; Rec."Court Decision Date")
                {
                }
            }
        }
        area(factboxes)
        {
            part("HR Disciplinary Cases Factbox"; "HR Disciplinary Cases Factbox")
            {
                Caption = 'HR Disciplinary Cases Factbox';
                SubPageLink = "Case Number" = FIELD("Case Number");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Case Status")
            {
                action("Under Investigation")
                {
                    Caption = 'Under Investigation';
                    Image = OpenWorksheet;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("Disciplinary Stage Status", Rec."Disciplinary Stage Status"::Reported);
                        Rec.TestField("Accused Employee");
                        Rec.TestField("Description of Complaint");
                        Rec.TestField("Date of Complaint was Reported");
                        Rec.TestField("Date To Discuss Case");
                        Rec.TestField("Witness #1");

                        if Confirm('Are you sure you want to mark this case as "Under Investigation"?') then begin
                            Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::"Under Investigation";
                            Rec.Modify;
                            Message('Case Number %1 has been marked as under "Investigation"', Rec."Case Number");
                        end;
                    end;
                }
                action("In Progress")
                {
                    Caption = 'In Progress';
                    Image = CarryOutActionMessage;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        Rec.TestField("Disciplinary Stage Status", Rec."Disciplinary Stage Status"::"Under Investigation");



                        if Confirm('Are you sure you want to mark this case as "In Progress"?') then begin
                            Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::"In progress";
                            Rec.Modify;
                            Message('Case Number %1 has been marked as "In Progress"', Rec."Case Number");
                        end;
                    end;
                }
                action(Close)
                {
                    Caption = ' Close';
                    Image = Closed;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("Recommended Action");
                        Rec.TestField(Comments);
                        if (Rec."Disciplinary Stage Status" <> Rec."Disciplinary Stage Status"::"In progress") and (Rec."Disciplinary Stage Status" <> Rec."Disciplinary Stage Status"::"Under review") then
                            Error('You can only close a case that is in progress or under review');

                        if Confirm('Are you sure you want to mark this case as "Closed"?') then begin
                            Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::Closed;
                            Rec.Modify;
                            Message('Case Number %1 has been marked as "Closed"', Rec."Case Number");
                        end;
                    end;
                }
                action(Print)
                {
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        DiscCase.Reset;
                        DiscCase.SetRange(DiscCase."Case Number", Rec."Case Number");
                        //if DiscCase.Find('-') then
                        //REPORT.Run(REPORT::"HR Disciplinary Cases", true, true, DiscCase);
                    end;
                }
                action(Appeal)
                {
                    Caption = ' Appeal';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin

                        Rec.TestField(Status, Rec.Status::Approved);

                        if Rec.Appealed = true then begin
                            Error('A case can only be Appealed once');
                        end;

                        if Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"Under Investigation" then exit;
                        if Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"In progress" then exit;
                        if Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"Under review" then exit;


                        if Confirm('Are you sure you want to mark this case as "Under Review?"') then begin
                            Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::"Under review";
                            Rec.Appealed := true;
                            Rec.Modify;
                            Message('Case Number %1 has been marked as "Under Review"', Rec."Case Number");
                        end;
                    end;
                }
                action("Withdraw Case")
                {
                    Image = Delete;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::Withdrawn;
                        Rec.Modify
                    end;
                }
                action("Sent Case to Court")
                {
                    Caption = 'Sent Case to Court';
                    Image = changestatus;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("Disciplinary Stage Status", Rec."Disciplinary Stage Status"::Closed);

                        if Rec.Appealed <> true then begin
                            Error('A case can only be sent to  court after one appeal');
                        end;

                        if Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"Under Investigation" then exit;
                        if Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"In progress" then exit;
                        if Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"Under review" then exit;
                        if Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"court case" then exit;
                        if Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"closed by court" then exit;



                        if Confirm('Are you sure you want to sent this case to court?"') then begin
                            Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::"court case";
                            Rec.Modify;
                            Message('Case Number %1 has been marked as closed by court', Rec."Case Number");
                        end;
                    end;
                }
                action("Court Close")
                {
                    Caption = 'Court Close';
                    Image = Completed;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("Disciplinary Stage Status", Rec."Disciplinary Stage Status"::"court case");

                        if Rec.Appealed <> true then begin
                            Error(Text00002);
                        end;
                        if Rec."Court Decision" = '' then
                            Error(Text00001);
                        if Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"Under Investigation" then exit;
                        if Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"In progress" then exit;
                        if Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"Under review" then exit;


                        if Confirm(Text00003) then begin
                            Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::"closed by court";
                            Rec.Modify;
                            Message('Case Number %1 has been marked as closed by court', Rec."Case Number");
                        end;
                    end;
                }
                action("Post to Payroll")
                {
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin

                        /* //MESSAGE('yes');
                    IF Status=Status::Approved THEN BEGIN
                      IF ("Disciplinary Stage Status"="Disciplinary Stage Status"::Closed)
                        OR ("Disciplinary Stage Status"="Disciplinary Stage Status"::"closed by court") THEN
                        BEGIN
                          salCard.RESET;
                          salCard.SETRANGE(salCard."Employee Code", "Accused Employee");
                          IF salCard.FIND('-') THEN BEGIN
                            salCard."Suspend Pay":=TRUE;
                            salCard."Suspension Date":=TODAY;
                            salCard."Suspension Reasons":="Type Complaint";
                            salCard.MODIFY;
                            END;
                        END;
                    END;
                    */

                        if Rec."Interdict Employee" = true then
                            Question := 'Are you sure you want to post this to payroll?';
                        Answer := DIALOG.Confirm(Question, false);
                        if Answer = true then begin
                            salCard.Reset;
                            salCard.SetRange(salCard."Employee Code", Rec."Accused Employee");
                            if salCard.Find('-') then begin
                                salCard."Basic Pay" := salCard."Basic Pay" / 2;
                                //ERROR(FORMAT(salCard."Basic Pay"));
                                salCard.Modify

                            end
                        end

                    end;
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
            }
        }
    }

    trigger OnInit()
    begin
        RecommendedActionEditable := true;
        ActionTakenEditable := true;
        DisciplinaryRemarksEditable := true;
    end;

    trigger OnOpenPage()
    begin
        UpdateControls;
    end;

    var
        "Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Leave Journal","Medical Claims","Activity Approval","Disciplinary Approvals";
        RecommendedActionEditable: Boolean;
        ActionTakenEditable: Boolean;
        DisciplinaryRemarksEditable: Boolean;
        DiscCase: Record "HR Disciplinary Cases NCA";
        Text00001: Label 'Please specify the decision of the court before case  closure';
        Text00002: Label 'A case can only be closed by court if its not in court';
        Text00003: Label 'Are you sure you want to mark this case as closed by Court?';
        salCard: Record "PR Salary Card";
        HREmp: Record "HR Employees";
        Answer: Boolean;
        Question: Text[250];
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        /*
        IF DiscCase.Status=DiscCase.Status::New THEN
        BEGIN
          RecommendedActionEditable:=FALSE;
          ActionTakenEditable:=FALSE;
          DisciplinaryRemarksEditable:=FALSE;
        END;
        
        IF DiscCase.Status=DiscCase.Status::Approved  THEN
        BEGIN
          CurrPage.EDITABLE:=FALSE;
        END;
        
        IF DiscCase.Status=DiscCase.Status::"Pending Approval"  THEN
        BEGIN
          CurrPage.EDITABLE:=FALSE;
        END;
        */

    end;
}

