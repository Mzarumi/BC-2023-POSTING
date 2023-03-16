page 52186167 "Agent Error Messages"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Agent Error Messages";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'General';
                field("Entry No"; Rec."Entry No")
                {
                }
                field(Source; Rec.Source)
                {
                }
                field("Agent Code"; Rec."Agent Code")
                {
                }
                field("Document No"; Rec."Document No")
                {
                }
                field("Transaction Description"; Rec."Transaction Description")
                {
                }
                field(DateTime; Rec.DateTime)
                {
                }
                field("Error Message"; Rec."Error Message")
                {
                }
                // field("Agent Name"; Rec.AgentApp.Name)
                // {
                // }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if AgentApp.Get(Rec."Agent Code") then;
    end;

    var
        AgentApp: Record "Agent Applications..";
}

