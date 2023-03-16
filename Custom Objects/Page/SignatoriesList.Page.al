page 52185864 "Signatories List"
{
    AutoSplitKey = true;
    Caption = 'Group Members';
    CardPageID = "Signatories Card";
    DelayedInsert = true;
    DeleteAllowed = false;
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Account Signatories";

    layout
    {
        area(content)
        {
            repeater(Control9)
            {
                ShowCaption = false;
                field(Names; Rec.Names)
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field("Staff/Payroll"; Rec."Staff/Payroll")
                {
                    Caption = 'Staff/Payroll No';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                }
                field(Type; Rec.Type)
                {
                    Caption = 'Designation';
                }
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

