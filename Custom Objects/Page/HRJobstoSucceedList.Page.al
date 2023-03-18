page 52186515 "HR Jobs to Succeed List"
{
    CardPageID = "HR Jobs to Succeed Card";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Functions,Job,Administration';
    RefreshOnActivate = true;
    SourceTable = "HR Jobs";
    SourceTableView = WHERE("Marked for Succession" = FILTER(true));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Job ID"; Rec."Job ID")
                {
                    Importance = Promoted;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Caption = 'Job Title';
                }
                field("No of Posts"; Rec."No of Posts")
                {
                }
                field("Occupied Positions"; Rec."Occupied Positions")
                {
                }
                field("Date Created"; Rec."Date Created")
                {
                    StyleExpr = TRUE;
                }
                field(Status; Rec.Status)
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Marked for Succession"; Rec."Marked for Succession")
                {
                }
            }
        }
        area(factboxes)
        {
            part("<Page39003906>"; "HR Jobs Factbox")
            {
                SubPageLink = "Job ID" = FIELD("Job ID");
            }
            systempart(Control1102755004; Outlook)
            {
            }
        }
    }

    actions
    {
    }
}

