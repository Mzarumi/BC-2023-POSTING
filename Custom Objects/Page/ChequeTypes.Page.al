page 52185798 "Cheque Types"
{
    PageType = List;
    SourceTable = "Cheque Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Clearing Days"; Rec."Clearing Days")
                {
                }
                field("Clearing  Days"; Rec."Clearing  Days")
                {
                }
                field("Cheque Limit"; Rec."Cheque Limit")
                {
                }
                field("Clearing Charge Code"; Rec."Clearing Charge Code")
                {
                }
                field("Clearing Charges GL Account"; Rec."Clearing Charges GL Account")
                {
                }
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
            //Error(ErrorOnRestrictViewTxt, UserId, Rec.TableCaption);
        end;
    end;
}

