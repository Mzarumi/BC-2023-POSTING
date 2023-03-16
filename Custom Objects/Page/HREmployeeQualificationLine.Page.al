page 52185540 "HR Employee Qualification Line"
{
    Caption = 'Employee Qualification Lines';
    PageType = List;
    SourceTable = "HR Employee Qualifications";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Qualification Type"; Rec."Qualification Type")
                {
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                }
                field("From Date"; Rec."From Date")
                {
                }
                field("To Date"; Rec."To Date")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                }
                field("Course Grade"; Rec."Course Grade")
                {
                }
                field(Score; Rec.Score)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Q&ualification")
            {
                Caption = 'Q&ualification';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = CONST("Employee Qualification"),
                                  "No." = FIELD("Employee No."),
                                  "Table Line No." = FIELD("Line No.");
                }
                separator(Action1102755021)
                {
                }
                action("Q&ualification Overview")
                {
                    Caption = 'Q&ualification Overview';
                    RunObject = Page "Qualification Overview";
                }
            }
        }
    }
}

