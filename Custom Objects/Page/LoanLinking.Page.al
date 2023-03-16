page 52186417 "Loan Linking"
{
    PageType = Card;
    SourceTable = "Loan Linking";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                }
                field("Entered By"; Rec."Entered By")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                }
                field(Processed; Rec.Processed)
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
            }
            part(Control8; "Loan Linking List")
            {
                SubPageLink = No = FIELD("No.");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Update Records")
            {
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Approved then begin
                        LoanLinkingLine.Reset;
                        LoanLinkingLine.SetRange(LoanLinkingLine.No, Rec."No.");
                        if LoanLinkingLine.Find('-') then begin
                            repeat
                                if Loans.Get(LoanLinkingLine."Loan No") then begin
                                    Loans."Loan Linking No." := LoanLinkingLine."Loan Linking No.";
                                    Loans.Modify;
                                end;
                            until LoanLinkingLine.Next = 0;
                        end;
                        Message('Update Successful');
                    end else
                        Error('Document must be approved');
                end;
            }
        }
    }

    var
        Loans: Record Loans;
        LoanLinkingLine: Record "Loan Linking Line";
}

