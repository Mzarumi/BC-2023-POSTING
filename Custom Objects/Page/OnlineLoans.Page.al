page 52186459 "Online Loans"
{
    CardPageID = "Online Loan Application";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Online Loans Applications";
    SourceTableView = WHERE(submitted = CONST(true),
                            Posted = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No"; Rec."Application No")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Membership No"; Rec."Membership No")
                {
                }
                field("Member Names"; Rec."Member Names")
                {
                }
                field("Loan Type"; Rec."Loan Type")
                {
                }
                field("Loan Amount"; Rec."Loan Amount")
                {
                }
                field("Repayment Period"; Rec."Repayment Period")
                {
                }
                field(submitted; Rec.submitted)
                {
                }
                field(Approved; Rec.Approved)
                {
                }
                field(Rejected; Rec.Rejected)
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Posted Date"; Rec."Posted Date")
                {
                }
                field("Loan No"; Rec."Loan No")
                {
                }
            }
        }
    }

    actions
    {
    }
}

