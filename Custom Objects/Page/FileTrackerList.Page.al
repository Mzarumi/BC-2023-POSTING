page 52186350 "File Tracker List"
{
    //CardPageID = "File Tracker Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "File Tracker";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request Number"; Rec."Request Number")
                {
                    Caption = 'Creation No.';
                }
                field("File Number"; Rec."File Number")
                {
                }
                field("Folio Number"; Rec."Folio Number")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Sent To"; Rec."Sent To")
                {
                    Caption = 'Current Location';
                }
                field("Office Name"; Rec."Office Name")
                {
                    Visible = false;
                }
                field("Loan No"; Rec."Loan No")
                {
                    Visible = false;
                }
                field("Staff No"; Rec."Staff No")
                {
                }
                field("Other  Doc  No"; Rec."Other  Doc  No")
                {
                }
                field("File  Forwarded"; Rec."File  Forwarded")
                {
                }
                field(Create; Rec.Create)
                {
                    Caption = 'File Created';
                }
            }
        }
    }

    actions
    {
    }
}

