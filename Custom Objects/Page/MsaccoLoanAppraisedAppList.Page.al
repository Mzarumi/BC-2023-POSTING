page 52186266 "Msacco Loan Appraised App List"
{
    CardPageID = "Msacco Loan Application Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Loans;
    SourceTableView = WHERE(Posted = CONST(false),
                            "Dummy Appraisal" = FILTER(false),
                            "Picked Mobile Loan" = FILTER(true),
                            Status = FILTER(Pending | Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Staff No"; Rec."Staff No")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                }
                // field(MobileNo; Rec.MobileNo)
                // {
                //     Caption = 'Mobile No.';
                // }
                field(Interest; Rec.Interest)
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Approval Date"; Rec."Approval Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Loan Rejection Reason"; Rec."Loan Rejection Reason")
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
        Members.Get(Rec."Member No.");
        MobileNo := Members."Mobile Phone No";
    end;

    var
        LoansR: Record Loans;
        MobileNo: Code[20];
        Members: Record Members;
}

