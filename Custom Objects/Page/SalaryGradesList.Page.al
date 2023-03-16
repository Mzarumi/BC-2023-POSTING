page 52185634 "Salary Grades List"
{
    Editable = true;
    PageType = List;
    SourceTable = "Salary Grades";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;
                field("Salary Grade"; Rec."Salary Grade")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Salary Amount"; Rec."Salary Amount")
                {
                    Visible = false;
                }
                field("Minimum Amount"; Rec."Minimum Amount")
                {
                }
                field("Maxmum Amount"; Rec."Maxmum Amount")
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
        OnViewCurrRec();
    end;

    //[Scope('Internal')]
    procedure OnViewCurrRec()
    var
        ChangePermission: Record "Status Change Permissions.";
        ErrorOnRestricViewTxt: Label 'You do not have Permissions to VIEW,MODIFY or DELETE on this record. Contact system administrator for assistance. %';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("View Payroll", true);
        //ChangePermission.SETRANGE("Function Extended",ChangePermission."Function Extended"::"Edit HR Setups");
        if not ChangePermission.Find('-') then
            Error(ErrorOnRestricViewTxt, UserId);
    end;
}

