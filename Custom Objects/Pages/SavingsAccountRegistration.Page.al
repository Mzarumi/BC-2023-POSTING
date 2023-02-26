page 52185721 "Savings Account Registration"
{
    PageType = List;
    SourceTable = "Savings Account Registration";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field("Monthly Contribution"; Rec."Monthly Contribution")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Notes)
            {
            }
            systempart(Control8; MyNotes)
            {
            }
            systempart(Control9; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        PageControl;
    end;

    trigger OnOpenPage()
    begin
        PageControl;
    end;

    procedure PageControl()
    var
        MemberAppl: Record "Member Application";
    begin
        if MemberAppl.Get(Rec."No.") then begin
            case MemberAppl.Status of
                MemberAppl.Status::Pending, MemberAppl.Status::Approved, MemberAppl.Status::Rejected, MemberAppl.Status::Created:
                    begin
                        CurrPage.Editable := false;
                    end;

                MemberAppl.Status::Open:
                    begin
                        CurrPage.Editable := true;
                    end;
            end;
        end;
    end;
}

