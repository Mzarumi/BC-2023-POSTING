page 52185865 "Signatories Card"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Account Signatories";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Names; Rec.Names)
                {
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                }
                field("Staff/Payroll"; Rec."Staff/Payroll")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field(Type; Rec.Type)
                {
                }
            }
            group(Instructions)
            {
                field(Signatory; Rec.Signatory)
                {
                }
                field("Must Sign"; Rec."Must Sign")
                {
                }
                field("Must be Present"; Rec."Must be Present")
                {
                }
            }
            group(Pictures)
            {
                field(Picture; Rec.Picture)
                {
                }
            }
            group(Signatures)
            {
                field(Signature; Rec.Signature)
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
            {
            }
            systempart(Control13; MyNotes)
            {
            }
            systempart(Control14; Links)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControl;
    end;

    trigger OnOpenPage()
    begin
        UpdateControl;
    end;

    //[Scope('Internal')]
    procedure UpdateControl()
    var
        MemberAppl: Record "Member Application";
    begin
        if MemberAppl.Get(Rec."Account No") then begin
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

