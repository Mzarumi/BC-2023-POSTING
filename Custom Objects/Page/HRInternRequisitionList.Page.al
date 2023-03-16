page 52186628 "HR Intern Requisition List"
{
    CardPageID = "HR Intern Requisition Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Interns Requisition";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Requisition For"; Rec."Requisition For")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field(Status; Rec.Status)
                {
                    StyleExpr = StyleText;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Outlook)
            {
            }
            systempart(Control17; Notes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        StyleText := HRCodeunit.fn_SetStyle(Format(Rec.Status));
    end;

    var
        HRCodeunit: Codeunit "HR Codeunit2";
        StyleText: Text;
}

