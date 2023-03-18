page 52185431 "Mbanking Registered Members"
{
    CardPageID = "Savings Account Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    ShowFilter = true;
    SourceTable = "Savings Accounts";
    SourceTableView = WHERE("Transactional Mobile No" = FILTER(<> ''));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Old Account No"; Rec."Old Account No")
                {
                }
                // field(Salutation; Rec.Salutation)
                // {
                //     Caption = 'Salutation';
                // }
                field(Name; Rec.Name)
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Registration Date"; Rec."Registration Date")
                {
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                }
                field("Transactional Mobile No"; Rec."Transactional Mobile No")
                {
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Send Statement Freq."; Rec."Send Statement Freq.")
                {
                }
                field("Last Statement Date"; Rec."Last Statement Date")
                {
                }
                field("Group Account No"; Rec."Group Account No")
                {
                }
                // field("ATM No."; Rec.NewStr)
                // {
                // }
                field("Product Category"; Rec."Product Category")
                {
                }
                // field(HideBal; Rec.HideBal)
                // {
                //     Caption = 'Balance (LCY)';
                // }
                field("Employer Account No"; Rec."Employer Account No")
                {
                }
                field("Loan Disbursement Account"; Rec."Loan Disbursement Account")
                {
                }
                field("Salary Through FOSA"; Rec."Salary Through FOSA")
                {
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        NewStr := '';
        if StrLen(Rec."ATM No.") > 4 then begin
            Str := (CopyStr(Rec."ATM No.", StrLen(Rec."ATM No.") - 3, 4));
            NewStr := 'xxxxxxxx' + Str;
        end;

        Rec.CalcFields("Balance (LCY)");
        Evaluate(HideBal, Format(Rec."Balance (LCY)"));
        //HideBal:='X.XX';
        if UserSetup.Get(UserId) then begin
            if UserSetup."Show Hidden Balance" = false then begin
                if Rec."Product Category" = Rec."Product Category"::"Unallocated Fund" then
                    HideBal := 'X.XX';
                if Rec."Loan Disbursement Account" = true then
                    HideBal := 'X.XX';
            end;
        end;
        if Members.Get(Rec."Member No.") then begin
            Salutation := Members.Salutation;
        end;
    end;

    trigger OnOpenPage()
    begin
        NewStr := '';
        if StrLen(Rec."ATM No.") > 4 then begin
            Str := (CopyStr(Rec."ATM No.", StrLen(Rec."ATM No.") - 3, 4));
            NewStr := 'xxxxxxxx' + Str;
        end;
        Rec.CalcFields("Balance (LCY)");
        Evaluate(HideBal, Format(Rec."Balance (LCY)"));

        if UserSetup.Get(UserId) then begin
            if UserSetup."Show Hidden Balance" = false then begin
                if Rec."Product Category" = Rec."Product Category"::"Unallocated Fund" then
                    HideBal := 'X.XX';
                if Rec."Loan Disbursement Account" = true then
                    HideBal := 'X.XX';
            end;
        end;
        if Members.Get(Rec."Member No.") then begin
            Salutation := Members.Salutation;
        end;
    end;

    var
        Str: Code[30];
        NewStr: Code[30];
        Members: Record Members;
        Salutation: Code[10];
        HideBal: Text;
        UserSetup: Record "User Setup";
}

