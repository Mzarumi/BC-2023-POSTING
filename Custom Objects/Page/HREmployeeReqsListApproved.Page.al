page 52185526 "HR Employee Reqs List Approved"
{
    CardPageID = "HR Employee Requisition Card";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Job,Functions,Employee';
    ShowFilter = true;
    SourceTable = "HR Employee Requisitions";
    SourceTableView = WHERE("Approval Status" = FILTER(Approved));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                ShowCaption = false;
                field("Requisition No."; Rec."Requisition No.")
                {
                    StyleExpr = TRUE;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    StyleExpr = TRUE;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Caption = 'Job Title';
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                }
                field("Required Positions"; Rec."Required Positions")
                {
                }
                field("Type of Contract Required"; Rec."Type of Contract Required")
                {
                    Caption = 'Contract';
                    Editable = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = true;
                    Style = Attention;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755008; Outlook)
            {
            }
        }
    }

    actions
    {
    }

    var
        HREmp: Record "HR Employees";
        HREmailParameters: Record "HR E-Mail Parameters";
        //SMTP: Codeunit "SMTP Mail";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition";
        ApprovalEntries: Page "Approval Entries";
        HREmpReq: Record "HR Employee Requisitions";

    //[Scope('Internal')]
    procedure TESTFIELDS()
    begin
        Rec.TestField("Job ID");
        Rec.TestField("Closing Date");
        Rec.TestField("Type of Contract Required");
        Rec.TestField("Requisition Type");
        Rec.TestField("Required Positions");
        if Rec."Reason For Request" = Rec."Reason For Request"::Other then
            Rec.TestField("Reason for Request(Other)");
    end;
}

