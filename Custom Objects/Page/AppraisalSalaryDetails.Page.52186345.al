page 52186345 "Appraisal Salary Details."
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Appraisal Salary Details";

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                ShowCaption = false;
                field("Loan No"; Rec."Loan No")
                {
                    Visible = false;
                }
                field("Client Code"; Rec."Client Code")
                {
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Amount; Rec.Amount)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin


        //**Prevent modification of approved entries
        LoanApps.Reset;
        LoanApps.SetRange(LoanApps."Loan No.", Rec."Loan No");
        if LoanApps.Find('-') then begin
            if LoanApps.Posted = true then begin
                CurrPage.Editable := false;
            end else
                CurrPage.Editable := true;
        end;
    end;

    var
        LoanApps: Record Loans;
}

