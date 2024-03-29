page 52186568 "HR Company Activities Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Company Activities";

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
                field("Code"; Rec.Code)
                {
                }
                field("Acitivity Description"; Rec."Acitivity Description")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field(Venue; Rec.Venue)
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Caption = 'Employee Responsible';
                }
                field("Email Message"; Rec."Email Message")
                {
                }
                label(Control1102755020)
                {
                    CaptionClass = Text2;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Costs; Rec.Costs)
                {
                }
                field("Contribution Amount (If Any)"; Rec."Contribution Amount (If Any)")
                {
                }
                field("G/L Account No"; Rec."G/L Account No")
                {
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                }
                field("Bal. Account No"; Rec."Bal. Account No")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                label(Control1102755012)
                {
                    CaptionClass = Text3;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Closed; Rec.Closed)
                {
                }
                field("Activity Status"; Rec."Activity Status")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        Text1: Label 'Activity Description';
        Text2: Label 'Activity Cost';
        Text3: Label 'Activity Status';
}

