page 52185960 "Funds Mgt Comment Sheet"
{
    AutoSplitKey = true;
    Caption = 'Funds Mgt Comment Sheet';
    DataCaptionFields = "Document Type";
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Funds Mgt Comment Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field(Date; Rec.Date)
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //SetUpNewLine;
        //"User Id" := UserId;
    end;
}

