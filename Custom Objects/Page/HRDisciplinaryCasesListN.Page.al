page 52186577 "HR Disciplinary Cases List N"
{
    Caption = 'Employee Disciplinary Cases ';
    CardPageID = "HR Disciplinary Case Card N";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions,Case Status,Show';
    SourceTable = "HR Disciplinary Cases NCA";
    SourceTableView = WHERE("Disciplinary Stage Status" = FILTER(<> Closed));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case Number"; Rec."Case Number")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
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
    }

    var
        "Document Type": Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Store Requisition","Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Induction Approval","Leave Journal","Medical Claims","Activity Approval","Disciplinary Approvals";
}

