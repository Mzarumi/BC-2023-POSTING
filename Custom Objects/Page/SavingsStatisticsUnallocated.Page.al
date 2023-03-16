page 52186344 "Savings Statistics Unallocated"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Savings Accounts";
    SourceTableView = WHERE("Product Category" = FILTER("Unallocated Fund"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Product Name"; Rec."Product Name")
                {
                }
                field("Product Category"; Rec."Product Category")
                {
                    Visible = false;
                }
                field("Member No."; Rec."Member No.")
                {
                    Visible = false;
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                }
                field("Monthly Contribution"; Rec."Monthly Contribution")
                {
                }
                field("Loan Disbursement Account"; Rec."Loan Disbursement Account")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Employer Account No"; Rec."Employer Account No")
                {
                }
                field("Employer Balance"; Rec."Employer Balance")
                {
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    Caption = 'Balance (LCY)';
                    Visible = ShowS;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        ShowS := true;
        SavingsAccounts.Reset;
        SavingsAccounts.SetRange("Member No.", Rec."Member No.");
        SavingsAccounts.SetRange("Loan Disbursement Account", true);
        if SavingsAccounts.Find('-') then begin
            if SavingsAccounts.Hide = true then begin
                ShowS := false;
            end;
        end;

        Rec.CalcFields("Balance (LCY)");
        Evaluate(HideBal, Format(Rec."Balance (LCY)"));

        if UserSetup.Get(UserId) then begin
            if UserSetup."Show Hidden Balance" = false then begin
                if Rec."Product Category" = Rec."Product Category"::"Unallocated Fund" then begin
                    //MESSAGE('u');
                    ShowS := false;
                end;

            end;
        end;
    end;

    var
        UserSetup: Record "User Setup";
        ShowS: Boolean;
        Members: Record Members;
        SavingsAccounts: Record "Savings Accounts";
        HideBal: Text;
}

