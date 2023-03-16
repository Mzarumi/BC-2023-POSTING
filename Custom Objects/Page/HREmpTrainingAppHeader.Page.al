page 52186573 "HR Emp Training App. Header"
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
                field(Duration; Rec.Duration)
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    ShowMandatory = true;
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
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                action(Comments)
                {
                    Caption = 'Comments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                    begin
                        /*DocumentType:=DocumentType::"Training Application";
                        ApprovalComments.Setfilters(DATABASE::"HR Training App Header",DocumentType,"Application No");
                        ApprovalComments.SetUpLine(DATABASE::"HR Training App Header",DocumentType,"Application No");
                        ApprovalComments.RUN;
                        */

                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType := DocumentType::"Training Application";
                        ApprovalEntries.Setfilters(DATABASE::"HR Training App Header", DocumentType, Rec."Application No");
                        ApprovalEntries.Run;
                    end;
                }
                action("&Send Approval &Request")
                {
                    Caption = '&Send Approval &Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        // Rec.TestFieldS;

                        if Confirm('Send this Application for Approval?', true) = false then exit;
                        //ApprovalMgt.SendTrainingAppApprovalRequest(Rec);



                        if (Rec."Bonded Training?") and (Rec.Status = Rec.Status::Approved) then begin
                            HRTrainingAppLines.Reset;
                            HRTrainingAppLines.SetRange(HRTrainingAppLines."Application No.", Rec."Application No");
                            if HRTrainingAppLines.Find('-') then begin
                                repeat
                                    HRExitTrainingBond.Reset;

                                    HRExitTrainingBond.Init;
                                    HRExitTrainingBond."Line No." := get_LastLineNo + 1;
                                    HRExitTrainingBond."Employee No." := HRTrainingAppLines."Employee No.";
                                    HRExitTrainingBond."Training Application Code" := Rec."Course Title";
                                    HRExitTrainingBond."Training Description" := Rec."Course Description";


                                    HRTrainingNeeds.Reset;
                                    if HRTrainingNeeds.Get(Rec."Course Title") then begin
                                        HRExitTrainingBond."Bonding Duration" := HRTrainingNeeds."Bondage Duration";
                                        HRExitTrainingBond."Bondage Start Date" := HRTrainingNeeds."Bondage Start Date";
                                        HRExitTrainingBond."Bondage Release Date" := HRTrainingNeeds."Bondage Release Date";
                                    end;

                                    HRExitTrainingBond.Insert;

                                until HRTrainingAppLines.Next = 0;
                            end;
                        end;
                    end;
                }
                action("&Cancel Approval request")
                {
                    Caption = '&Cancel Approval request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;
                        //ApprovalMgt.CancelTrainingAppApprovalReq(Rec,TRUE,TRUE);
                    end;
                }
                action("&Print")
                {
                    Caption = '&Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);

                        HRTrainingApplications.SetRange(HRTrainingApplications."Application No", Rec."Application No");
                        //if HRTrainingApplications.Find('-') then
                        //REPORT.Run(52185874, true, true, HRTrainingApplications);
                    end;
                }
                action("<A ction1102755042>")
                {
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::New;
                        Rec.Modify;
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
        HREmp: Record "HR Succession Job Rotation";
        EmpNames: Text[40];
        sDate: Date;
        HRTrainingApplications: Record "HR Training App Header";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
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

