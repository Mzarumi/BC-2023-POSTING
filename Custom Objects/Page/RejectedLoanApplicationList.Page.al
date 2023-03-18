page 52186332 "Rejected Loan Application List"
{
    CardPageID = "Loan Application Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Loans;
    SourceTableView = WHERE(Posted = CONST(false),
                            "Dummy Appraisal" = FILTER(false),
                            "Picked Mobile Loan" = FILTER(false),
                            Status = FILTER(Rejected));

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
        /*IF (Status=Status::Open) AND ("Application Date"<>0D) THEN BEGIN
        
        IF CALCDATE('60D',"Application Date")>=TODAY THEN
          Status:=Status::Rejected;
          "Loan Rejection Reason":='Loan application expired';
        MODIFY;
        END;*/

    end;

    var
        LoansR: Record Loans;
}

