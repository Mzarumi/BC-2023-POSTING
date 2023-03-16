page 52186695 "Portal Endpoints"
{
    PageType = List;
    SourceTable = "Portal Endpoints";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                }
                field(Enabled; Rec.Enabled)
                {
                }
                field("Password Verification"; Rec."Password Verification")
                {
                }
                field("OTP Verification"; Rec."OTP Verification")
                {
                }
                field("Change Status Stats"; Rec."Change Status Stats")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    var
        UserEndPoint: Record "Portal Endpoints";
        UserNm: Record "Log Endpoint  Entiries";
    begin
    end;

    trigger OnDeleteRecord(): Boolean
    var
        UserEndPoint: Record "Portal Endpoints";
        UserNm: Record "Log Endpoint  Entiries";
    begin

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        UserEndPoint: Record "Portal Endpoints";
        UserNm: Record "Log Endpoint  Entiries";
    begin


    end;

    trigger OnModifyRecord(): Boolean
    var
        UserEndPoint: Record "Portal Endpoints";
        UserNm: Record "Log Endpoint  Entiries";
    begin

    end;
}

