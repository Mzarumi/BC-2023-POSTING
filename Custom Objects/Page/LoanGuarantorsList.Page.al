page 52185857 "Loan Guarantors List"
{
    PageType = ListPart;
    SourceTable = "Loan Guarantors Sub";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Savings Account No."; Rec."Savings Account No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Loan No"; Rec."Loan No")
                {
                    Editable = false;
                }
                field("Loan Balance"; Rec."Loan Balance")
                {
                }
                field(Shares; Rec.Shares)
                {
                }
                field("Member Substituted"; Rec."Member Substituted")
                {
                }
                field(Substituted; Rec.Substituted)
                {
                    Caption = 'Substitute';

                    trigger OnValidate()
                    begin
                        /*
                        GuarantSubt.RESET;
                        GuarantSubt.SETRANGE(GuarantSubt."Loan Account No.","Member No");
                        IF GuarantSubt.FIND('-') THEN BEGIN
                        IF GuarantSubt.Status<>GuarantSubt.Status::Approved THEN
                        ERROR(Text001);
                        END;
                         */

                    end;
                }
                field("No Of Loans Guaranteed"; Rec."No Of Loans Guaranteed")
                {
                }
                field("Amount Guaranteed"; Rec."Amount Guaranteed")
                {
                    Editable = true;
                }
                field("Staff/Payroll No."; Rec."Staff/Payroll No.")
                {
                    Editable = false;
                }
                field("Self Guarantee"; Rec."Self Guarantee")
                {
                    Editable = false;
                }
                field("Member Guaranteed"; Rec."Member Guaranteed")
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                    Editable = false;
                }
                field("Group Account No."; Rec."Group Account No.")
                {
                    Editable = false;
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                }
                field("Member No"; Rec."Member No")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        Text001: Label 'This Application is not Approved';
}

