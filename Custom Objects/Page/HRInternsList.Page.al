page 52186625 "HR Interns List"
{
    CardPageID = "HR Interns Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Interns";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Full Name"; Rec."Full Name")
                {
                }
                field(Sex; Rec.Sex)
                {
                }
                field(Institution; Rec.Institution)
                {
                }
                field("Course Undertaken"; Rec."Course Undertaken")
                {
                }
                field(Specialization; Rec.Specialization)
                {
                }
                field("Posting Status"; Rec."Posting Status")
                {
                    StyleExpr = StyleText;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Notes)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        StyleText := HRCodeunit.fn_SetStyle(Format(Rec."Posting Status"));
    end;

    var
        StyleText: Text;
        HRCodeunit: Codeunit "HR Codeunit2";
}

