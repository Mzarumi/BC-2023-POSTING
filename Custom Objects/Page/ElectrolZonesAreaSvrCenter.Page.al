page 52186405 "Electrol Zones/Area Svr Center"
{
    PageType = List;
    SourceTable = "Electrol Zones/Area Svr Center";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                }
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Mileage (KMs)"; Rec."Mileage (KMs)")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Notes)
            {
            }
            systempart(Control7; MyNotes)
            {
            }
            systempart(Control8; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        //OnAccesRestrictView();
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
            // Error(ErrorOnRestrictViewTxt, UserId, TableCaption);
        end;
    end;
}

