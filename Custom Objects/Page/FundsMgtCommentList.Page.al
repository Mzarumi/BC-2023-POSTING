page 52185961 "Funds Mgt Comment List"
{
    Caption = 'Funds Mgt Comment List';
    DataCaptionFields = "Document Type";
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Funds Mgt Comment Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document Type"; Rec."Document Type")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                }
                field(Date; Rec.Date)
                {
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("User Id"; Rec."User Id")
                {
                }
            }
        }
    }

    actions
    {
    }
}

