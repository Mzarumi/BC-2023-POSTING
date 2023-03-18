page 52185842 "Checkoff Buffer"
{
    PageType = List;
    SourceTable = "Checkoff Buffer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Upload No."; Rec."Upload No.")
                {
                }
                field(Payroll; Rec.Payroll)
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Loan No"; Rec."Loan No")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Interest; Rec.Interest)
                {
                }
                field("Search Code"; Rec."Search Code")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field("Checkoff No"; Rec."Checkoff No")
                {
                }
                field("Savings Account"; Rec."Savings Account")
                {
                }
                field("Credit Account"; Rec."Credit Account")
                {
                }
                field("Upload Response"; Rec."Upload Response")
                {
                    Editable = true;
                }
                field("Not Found"; Rec."Not Found")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field(Balance; Rec.Balance)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Validate Buffer")
            {
                Image = Accounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    MsgValidate: Label 'Validation Successful';
                begin
                    //here//PeriodicCheckoff.CheckoffValidate(Rec);
                    //**MESSAGE(MsgValidate);
                end;
            }
            action("Import Checkoff")
            {
                Image = import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ////RunObject = XMLport "Checkoff Buffer";
            }
            action("Consolidtae Data")
            {
                Image = GetEntries;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    //here//PeriodicCheckoff.ConsolidateBuffer(Rec);
                end;
            }
            action("Clear Buffer")
            {
                Image = DeleteAllBreakpoints;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to delete?', false) = false then
                        exit;
                    Rec.DeleteAll;
                    Message('Entries deleted successfully');
                end;
            }
        }
    }

    var
        PeriodicCheckoff: Codeunit "Periodic Activities";
}

