page 52186168 "Agent Sent Sms Messages"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Agent Sent Sms";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Agent Code"; Rec."Agent Code")
                {
                }
                field("Agent Name"; AgentApplications."Name of the Proposed Agent")
                {
                }
                field("Document No"; Rec."Document No")
                {
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field(DateTime; Rec.DateTime)
                {
                }
                field("Text Message"; Rec."Text Message")
                {
                }
                field("Source Transaction"; Rec."Source Transaction")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        if AgentApplications.Get(Rec."Agent Code") then;
    end;

    var
        AgentApplications: Record "Agent Applications";
}

