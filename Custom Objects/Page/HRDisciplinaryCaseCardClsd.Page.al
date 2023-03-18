page 52186468 "HR Disciplinary Case Card Clsd"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Case Status,Show';
    SourceTable = "HR Disciplinary Cases NCA";
    SourceTableView = WHERE("Disciplinary Stage Status" = FILTER(Closed));

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
                    ShowCaption = true;
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
                field("Disciplinary Stage Status"; Rec."Disciplinary Stage Status")
                {
                }
                field(Appealed; Rec.Appealed)
                {
                    Editable = false;
                }
            }
            group("Action Information")
            {
                Caption = 'Action Information';
                field("Action Taken"; Rec."Action Taken")
                {
                    Editable = true;
                }
                field("Taken Action Description"; Rec."Taken Action Description")
                {
                    Editable = false;
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                    Editable = true;
                    MultiLine = true;
                }
                field("Investigation Findings"; Rec.Comments)
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

                        if Rec.Appealed = true then begin
                            Error('A case can only be Appealed once');
                        end;

                        if Confirm('Are you sure you want to mark this case as "Under Review?"') then begin
                            Rec."Disciplinary Stage Status" := Rec."Disciplinary Stage Status"::"Under review";
                            Rec.Appealed := true;
                            Rec.Modify;
                            Message('Case Number %1 has been marked as "Under Review"', Rec."Case Number");
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
                action("Post to Payroll")
                {
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        //MESSAGE('yes');
                        //IF Status=Status::Approved THEN BEGIN
                        if (Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::Closed)
                          or (Rec."Disciplinary Stage Status" = Rec."Disciplinary Stage Status"::"closed by court") then begin
                            salCard.Reset;
                            salCard.SetRange(salCard."Employee Code", Rec."Accused Employee");
                            if salCard.Find('-') then begin
                                salCard."Suspend Pay" := true;
                                salCard."Suspension Date" := Today;
                                salCard."Suspension Reasons" := Rec."Type Complaint";
                                salCard.Modify;
                                Message('Successful')
                            end;
                        end;
                        //END;
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
        salCard: Record "PR Salary Card";

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

