page 52186483 "HR Trainings Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Training App Header";

    layout
    {
        area(content)
        {
            group(Control1102755018)
            {
                ShowCaption = false;
                label(Control1102755019)
                {
                    CaptionClass = Text1;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Application No"; Rec."Application No")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Created by"; Rec."Created by")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("No. Series"; Rec."No. Series")
                {
                }
                field("Course Title"; Rec."Course Title")
                {
                }
                field("Course Description"; Rec."Course Description")
                {
                }
                field("No. of Participants"; Rec."No. of Participants")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        Text1: Label 'Training Details';

}

