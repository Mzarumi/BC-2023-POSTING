page 52185723 "Segment/County/Dividend/Signat"
{
    PageType = List;
    SourceTable = "Segment/County/Dividend/Signat";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {

                    trigger OnValidate()
                    begin
                        ShowDetails;
                    end;
                }
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(County; Rec.County)
                {
                    Visible = CountyVisible;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        ShowDetails;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        ShowDetails;
    end;

    trigger OnOpenPage()
    begin
        ShowDetails;
        OnAccesRestrictView();
    end;

    var
        CountyVisible: Boolean;

    //[Scope('Internal')]
    procedure ShowDetails()
    begin
        if Rec."Type" = Rec."Type"::"Sub-County" then
            CountyVisible := true else
            CountyVisible := false;
    end;

    //[Scope('Internal')]
    procedure OnAccesRestrictView()
    var
        ChangePermission: Record "Status Change Permissions.";
        ErrorOnRestrictViewTxt: Label 'You do Not have Permission on View,Read,Modify on this Page. Contact system administrator for assistance. %1-%2';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("Edit Setup", true);
        ChangePermission.SetRange("Function Extended", ChangePermission."Function Extended"::Administrator);
        if not ChangePermission.Find('-') then begin
            CurrPage.Editable := false;
        end;
    end;
}

