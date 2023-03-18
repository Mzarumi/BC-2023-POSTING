page 52185770 "Appraisal Salary Details"
{
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
                    StyleExpr = StyleText;
                }
                field(Description; Rec.Description)
                {
                    StyleExpr = StyleText;
                }
                field(Type; Rec.Type)
                {
                    StyleExpr = StyleText;
                }
                field(Amount; Rec.Amount)
                {
                    StyleExpr = StyleText;
                }
                field(Verified; Rec.Verified)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Salary Details Verified")
            {
                Image = View;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Rec.Verified = false then begin
                        repeat
                            Rec.Verified := true;
                            Rec.Modify;
                        until Rec.Next = 0;
                        Loan.Reset;
                        Loan.SetRange("Loan No.", Rec."Loan No");
                        if Loan.Find('-') then begin
                            LoanGuarantorsandSecurity.Reset;
                            LoanGuarantorsandSecurity.SetRange("Loan No", Loan."Loan No.");
                            if LoanGuarantorsandSecurity.Find('-') then begin
                                repeat
                                    if (LoanGuarantorsandSecurity.Verified = true) and (Rec.Verified = true) then
                                        Loan."Details Verified By" := UserId;
                                    Loan.Modify;
                                until LoanGuarantorsandSecurity.Next = 0;
                            end;

                        end;
                    end else
                        if Rec.Verified = true then begin
                            repeat
                                Rec.Verified := false;
                                Rec.Modify;
                            until Rec.Next = 0;
                            Loan.Reset;
                            Loan.SetRange("Loan No.", Rec."Loan No");
                            if Loan.Find('-') then begin
                                LoanGuarantorsandSecurity.Reset;
                                LoanGuarantorsandSecurity.SetRange("Loan No", Loan."Loan No.");
                                if LoanGuarantorsandSecurity.Find('-') then begin
                                    repeat
                                        if (LoanGuarantorsandSecurity.Verified = false) and (Rec.Verified = false) then
                                            Loan."Details Verified By" := '';
                                        Loan.Modify;
                                    until LoanGuarantorsandSecurity.Next = 0;
                                end;
                            end;

                        end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        StyleText := '';
        if Rec.Code = '7.1EXTERNAL BANK STO' then /*BEGIN*/
            StyleText := 'StrongAccent';

    end;

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
        StyleText: Text[20];
        Loan: Record Loans;
        AppraisalSalaryDetails: Record "Appraisal Salary Details";
        LoanGuarantorsandSecurity: Record "Loan Guarantors and Security";
}

