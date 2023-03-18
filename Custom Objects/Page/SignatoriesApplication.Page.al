page 52185719 "Signatories Application"
{
    AutoSplitKey = true;
    Caption = 'Group Member Application';
    CardPageID = "Signatories Application Card";
    DelayedInsert = true;
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Signatory Application";

    layout
    {
        area(content)
        {
            repeater(Control9)
            {
                ShowCaption = false;
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field(Names; Rec.Names)
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
                field("Phone No."; Rec."Phone No.")
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
        //*
        UpdateControl;
    end;

    trigger OnOpenPage()
    begin
        //*
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

