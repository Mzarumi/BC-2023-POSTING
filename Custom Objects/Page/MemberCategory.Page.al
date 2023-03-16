page 52186654 "Member Category"
{
    PageType = List;
    SourceTable = "Member Category";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Registration Fee"; Rec."Registration Fee")
                {
                }
                field("Share Capital"; Rec."Share Capital")
                {
                }
                field("Max. Installment"; Rec."Max. Installment")
                {
                }
                field("Default Share Capital"; Rec."Default Share Capital")
                {
                }
                field("Default Share Deposit"; Rec."Default Share Deposit")
                {
                }
                field(Checkoff; Rec.Checkoff)
                {
                }
                field("Can Take Loan"; Rec."Can Take Loan")
                {
                }
                field("Auto Generate Staff No"; Rec."Auto Generate Staff No")
                {
                }
                field(Acronym; Rec.Acronym)
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("Premier Club Min.Deposits"; Rec."Premier Club Min.Deposits")
                {
                }
                field("Premier Club Reg Fee"; Rec."Premier Club Reg Fee")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control15; Notes)
            {
            }
            systempart(Control16; MyNotes)
            {
            }
            systempart(Control17; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        OnAccesRestrictView();
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

