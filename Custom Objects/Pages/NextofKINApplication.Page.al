page 52185717 "Next of KIN Application"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    Editable = true;
    InsertAllowed = true;
    LinksAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "Next of KIN Application";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                }
                field(Relationship; Rec.Relationship)
                {
                    Editable = true;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("%Allocation"; Rec."%Allocation")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field(Telephone; Rec.Telephone)
                {
                    Caption = 'Mobile No.';
                }
                field(Email; Rec.Email)
                {
                }
                field(Fax; Rec.Fax)
                {
                }
               
                field("BBF Entitlement Code"; Rec."BBF Entitlement Code")
                {
                }
                field("BBF Entitlement"; Rec."BBF Entitlement")
                {
                }
                field(Beneficiary; Rec.Beneficiary)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
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

