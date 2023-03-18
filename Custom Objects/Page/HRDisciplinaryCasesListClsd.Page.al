page 52186469 "HR Disciplinary Cases ListClsd"
{
    Caption = 'Employee Disciplinary Cases ';
    CardPageID = "HR Disciplinary Case Card Clsd";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions,Case Status,Show';
    SourceTable = "HR Disciplinary Cases NCA";
    SourceTableView = WHERE("Disciplinary Stage Status" = FILTER(Closed));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case Number"; Rec."Case Number")
                {
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                }
                field("Type Complaint"; Rec."Type Complaint")
                {
                }
                field(Reporter; Rec.Reporter)
                {
                }
                field("Accused Employee"; Rec."Accused Employee")
                {
                }
                field("Description of Complaint"; Rec."Description of Complaint")
                {
                }
                field("Disciplinary Stage Status"; Rec."Disciplinary Stage Status")
                {
                    Style = StandardAccent;
                    StyleExpr = TRUE;
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
            systempart(Control1102755009; Outlook)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Send Case Approval Request")
                {
                    Caption = 'Send Case Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*IF CONFIRM('Send this Case for Approval ?',TRUE)=FALSE THEN EXIT;
                        AppMgmt.SendDisciplinaryApprovalReq(Rec);
                            */

                    end;
                }
                action("Cancel Case Approval Request")
                {
                    Caption = 'Cancel Case Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*IF CONFIRM('Cancel Case Approval Request?',TRUE)=FALSE THEN EXIT;
                        AppMgmt.CancelDiscipplinaryAppApprovalReq(Rec,TRUE,TRUE);
                           */

                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Disciplinary Approvals";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        /*DocumentType:=DocumentType::"Disciplinary Approvals";
                        ApprovalEntries.Setfilters(DATABASE::"HR Disciplinary Cases",DocumentType,"Case Number");
                        ApprovalEntries.RUN;
                                */

                    end;
                }
            }
            group("Case Status")
            {
                action("Under Investigation")
                {
                    Caption = 'Under Investigation';
                    Image = OpenWorksheet;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*Rec.TestField(Status,Status::Approved);

                        {
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Investigation" THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"In Progress" THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::Closed THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Review" THEN EXIT;
                        }

                        IF CONFIRM('Are you sure you want to mark this case as "Under Investigation"?')  THEN BEGIN
                        "Disciplinary Stage Status":="Disciplinary Stage Status"::"Investigation ";
                         MODIFY;
                         MESSAGE('Case Number %1 has been marked as under "Investigation"',"Case Number");
                        END;
                           */

                    end;
                }
                action("In Progress")
                {
                    Caption = 'In Progress';
                    Image = CarryOutActionMessage;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        /* Rec.TestField(Status,Status::Approved);

                         {
                         IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Investigation" THEN EXIT;
                         IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"In Progress" THEN EXIT;
                         IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::Closed THEN EXIT;
                         IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Review" THEN EXIT;
                         }

                         IF CONFIRM('Are you sure you want to open Investigations for these Case?')  THEN BEGIN
                         "Disciplinary Stage Status":="Disciplinary Stage Status"::Inprogress;
                         MODIFY;
                         MESSAGE('Case Number %1 has been marked as "In Progress"',"Case Number");
                         END;
                             */

                    end;
                }
                action(Close)
                {
                    Caption = ' Close';
                    Image = Closed;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        /*Rec.TestField(Status,Status::Approved);

                        {
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Investigation" THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"In Progress" THEN EXIT;
                      //  IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::Closed THEN EXIT;
                        IF "Disciplinary Stage Status" ="Disciplinary Stage Status"::"Under Review" THEN EXIT;
                        }

                        IF CONFIRM('Are you sure you want to mark this case as "Closed"?')  THEN BEGIN
                        "Disciplinary Stage Status":="Disciplinary Stage Status"::Closed;
                        MODIFY;
                        MESSAGE('Case Number %1 has been marked as "Closed"',"Case Number");
                        END;
                                */

                    end;
                }
                action(Appeal)
                {
                    Caption = ' Appeal';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    begin
                        /* Rec.TestField(Status,Status::Approved);


                         IF CONFIRM('Are you sure you want to mark this case as "Under Review?"')  THEN BEGIN
                         "Disciplinary Stage Status":="Disciplinary Stage Status"::"Under review";
                         MODIFY;
                         MESSAGE('Case Number %1 has been marked as "Under Review"',"Case Number");
                         END;
                         */

                    end;
                }
            }
        }
    }

    var
        "Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Leave Journal","Medical Claims","Activity Approval","Disciplinary Approvals";
}

