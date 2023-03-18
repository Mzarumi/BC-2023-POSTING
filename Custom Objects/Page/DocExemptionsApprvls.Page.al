page 52185897 "Doc.Exemptions Apprvls"
{
    CardPageID = "Document Exemptions Apprvls";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Document Exemptions Auth.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Sequence No."; Rec."Sequence No.")
                {
                }
                field("Approval Code"; Rec."Approval Code")
                {
                }
                field("Sender ID"; Rec."Sender ID")
                {
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                }
                field("Approver ID"; Rec."Approver ID")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Date-Time Sent for Approval"; Rec."Date-Time Sent for Approval")
                {
                }
                field("Last Date-Time Modified"; Rec."Last Date-Time Modified")
                {
                }
                field("Last Modified By ID"; Rec."Last Modified By ID")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                }
                field("Approval Type"; Rec."Approval Type")
                {
                }
                field("Limit Type"; Rec."Limit Type")
                {
                }
                field("Available Credit Limit (LCY)"; Rec."Available Credit Limit (LCY)")
                {
                }
                field("Table ID"; Rec."Table ID")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
            }
        }
    }

    actions
    {
    }
}

