page 52186372 "Internet Loan Application List"
{
    CardPageID = "Internet Loan Application Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Loans;
    SourceTableView = WHERE(Posted = CONST(false),
                            "Dummy Appraisal" = FILTER(false),
                            "Picked Mobile Loan" = FILTER(false),
                            Status = FILTER(Open | Pending),
                            "Sent Online" = FILTER(true));

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
                // field(GhrisPassword; Rec.GhrisPassword)
                // {
                //     Caption = 'Ghris Password';
                // }
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
                // field(branch; Rec.branch)
                // {
                //     Caption = 'Branch';
                // }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Portal Loans Report")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                //RunObject = Report "Portal Loans Report";
            }
            action("Portal Application Loan Report")
            {
                Image = Report2;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                //RunObject = Report "Portal Application Loan Report";
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        MobileNo := '';
        branch := '';
        Members.Get(Rec."Member No.");
        MobileNo := Members."Mobile Phone No";
        branch := Members."Global Dimension 2 Code";

        InternetLoans.Reset;
        InternetLoans.SetRange("Loan No", Rec."Loan No.");
        if InternetLoans.FindFirst then begin
            GhrisPassword := InternetLoans."Ghris Password";
        end;
    end;

    var
        LoansR: Record Loans;
        MobileNo: Code[20];
        Members: Record Members;
        GhrisPassword: Text;
        InternetLoans: Record "Online Loans Applications";
        branch: Text;
}

