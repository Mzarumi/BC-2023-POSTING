page 52185720 "Signatories Application Card"
{
    AutoSplitKey = true;
    Caption = 'Group Member Application Card';
    DelayedInsert = true;
    PageType = Card;
    SourceTable = "Signatory Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Account Type"; Rec."Account Type")
                {

                    trigger OnValidate()
                    begin
                        MembNo := true;
                        if Rec."Account Type" = Rec."Account Type"::"Non-Member" then begin
                            MembNo := false;
                            MembName := true;
                        end
                    end;
                }
                field("Member No."; Rec."Member No.")
                {
                    Editable = MembNo;
                }
                field(Names; Rec.Names)
                {
                    Editable = MembName;
                }
                field("ID Number"; Rec."ID Number")
                {
                }
                field("Phone No."; Rec."Phone No.")
                {
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                }
                field("Staff/Payroll"; Rec."Staff/Payroll")
                {
                }
                field("PIN Number"; Rec."PIN Number")
                {
                }
                field(Type; Rec.Type)
                {
                    Caption = 'Designation';
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
        MembNo := true;
        MembName := false;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin

        if (Rec."Account Type" = Rec."Account Type"::Member) then begin
            if Rec."Member No." <> '' then begin
                if not Confirm('Do you wish to save?') then begin
                    Rec.Delete;
                end else begin
                    Rec.TestField("ID Number");
                    Rec.TestField("Date Of Birth");
                    Rec.TestField("Phone No.");
                    Rec.TestField(Picture);
                    Rec.Validate("Phone No.");
                end;
            end;
        end;

        if (Rec."Account Type" = Rec."Account Type"::"Non-Member") then begin
            if Rec.Names <> '' then begin
                if not Confirm('Do you wish to save?') then begin
                    Rec.Delete
                end else begin
                    Rec.TestField("ID Number");
                    Rec.TestField("Date Of Birth");
                    Rec.TestField("Phone No.");
                    Rec.Validate("Phone No.");
                end;
            end;
        end;
    end;

    var
        MembNo: Boolean;
        MembName: Boolean;
        Sig: Record "Signatory Application";

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

