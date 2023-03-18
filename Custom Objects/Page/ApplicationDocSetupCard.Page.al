page 52186063 "Application Doc. Setup Card"
{
    PageType = Card;
    SourceTable = "Application Document Setup";

    layout
    {
        area(content)
        {
            group(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Retiree Document"; Rec."Retiree Document")
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

    trigger OnAfterGetCurrRecord()
    begin
        SOControl;
    end;

    var
        SinglePartyMultiple: Boolean;

    //[Scope('Internal')]
    procedure SOControl()
    begin
        case Rec."Document Type" of
            Rec."Document Type"::Member, Rec."Document Type"::Account:
                begin
                    SinglePartyMultiple := true;
                end;

            Rec."Document Type"::" ", Rec."Document Type"::Loan:
                begin
                    SinglePartyMultiple := false;
                end;
        end;
    end;
}

