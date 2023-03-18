page 52185756 "Loan Application List"
{
    CardPageID = "Loan Application Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Loans;
    SourceTableView = WHERE(Posted = CONST(false),
                            "Dummy Appraisal" = FILTER(false),
                            "Picked Mobile Loan" = FILTER(false),
                            "Sent Online" = FILTER(false),
                            Status = FILTER(<> Approved & <> Pending & <> Rejected));

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

    trigger OnOpenPage()
    begin
        if (Rec.Status = Rec.Status::Open) and (Rec."Application Date" <> 0D) then begin

            if CalcDate('60D', Rec."Application Date") >= Today then
                Rec.Status := Rec.Status::Rejected;
            Rec.Modify;
        end;
        Rec.FilterGroup(2);
        Rec.SetFilter("Application Date", '%1..%2', CalcDate('-3M', Today), Today);
        Rec.FilterGroup(0);
    end;

    var
        LoansR: Record Loans;
}

