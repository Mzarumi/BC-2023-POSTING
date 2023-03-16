page 52185787 "Msacco Loans"
{
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "M-SACCO Loans";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry no"; Rec."Entry no")
                {
                }
                field(DocumentNo; Rec.DocumentNo)
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field(Remarks; Rec.Remarks)
                {
                }
                field("STO Amount"; Rec."STO Amount")
                {
                }
                field("Total loans"; Rec."Total loans")
                {
                }
                field("Latest Salary Amount"; Rec."Latest Salary Amount")
                {
                    Caption = 'Qualified Amount';
                }
                field("Loan Code"; Rec."Loan Code")
                {
                }
                field("Loan No"; Rec."Loan No")
                {
                }
                field("Ghris Password"; Rec."Ghris Password")
                {
                }
                field(Branch; Rec.Branch)
                {
                }
            }
        }
    }

    actions
    {
    }
}

