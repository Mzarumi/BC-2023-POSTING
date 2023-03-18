page 52185585 "HR Shortlisting List"
{
    CardPageID = "HR Shortlisting Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Employee Requisitions";
    SourceTableView = WHERE("Approval Status" = CONST(Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                // field(Overdue; Rec.Overdue)
                // {
                //     Caption = 'Overdue';
                //     Editable = false;
                //     Style = Attention;
                //     StyleExpr = TRUE;
                // }
                field("Requisition No."; Rec."Requisition No.")
                {
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                }
                field("Job ID"; Rec."Job ID")
                {
                }
                field("Job Description"; Rec."Job Description")
                {
                }
                field("Required Positions"; Rec."Required Positions")
                {
                }
                field("No. of Job Applications"; Rec."No. of Job Applications")
                {
                }
                field("Closing Date"; Rec."Closing Date")
                {
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Completion Status"; Rec."Completion Status")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755005; Outlook)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."Closing Date" <= Today then begin
            Overdue := Overdue::Yes;
        end else begin
            Overdue := Overdue::" ";
        end;
    end;

    var
        Overdue: Option " ",Yes;
    //    (Rec.RecordIdText: Text;
}

