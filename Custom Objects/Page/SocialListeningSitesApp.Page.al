page 52186403 "Social Listening Sites App."
{
    PageType = List;
    SourceTable = "Social Listening Sites App.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account No."; Rec."Account No.")
                {
                    Visible = false;
                }
                field(Address; Rec.Address)
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
        if MemberApplication.Get(Rec."Account No.") then begin
            if MemberApplication.Status <> MemberApplication.Status::Open then
                CurrPage.Editable := false
            else
                CurrPage.Editable := true;
        end;
    end;

    var
        MemberApplication: Record "Member Application";
}

