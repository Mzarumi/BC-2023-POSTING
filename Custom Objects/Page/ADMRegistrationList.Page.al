page 52186346 "ADM Registration List"
{
    Caption = 'ADM Registration List';
    CardPageID = "Delegate AGM Registration";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "ADM Registration";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reg No"; Rec."Reg No")
                {
                }
                field("Code"; Rec.Code)
                {
                }
                field("Delegate Region Description"; Rec."Delegate Region Description")
                {
                }
                field("Electoral Zone"; Rec."Electoral Zone")
                {
                }
                field("Electoral Zone Name"; Rec."Electoral Zone Name")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Creation Date"; Rec."Creation Date")
                {
                }
                field("Created By"; Rec."Created By")
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
        FnRestrictAccess();
        Rec.SetRange("Created By", UserId);
    end;

    //[Scope('Internal')]
    procedure FnRestrictAccess()
    var
        StatusPermission: Record "Status Change Permissions.";
        ErrorOnRestrictViewTxt: Label 'You do Not have Permission on View,Read,Modify on this Page. Contact system administrator for assistance. %1-%2';
    begin
        StatusPermission.Reset;
        StatusPermission.SetRange("User ID", DATABASE.UserId);
        StatusPermission.SetRange("Register ADM Attendance", true);
        if not StatusPermission.Find('-') then begin
            CurrPage.Editable := false;
        end else begin
            CurrPage.Editable := true;
        end;
    end;
}

