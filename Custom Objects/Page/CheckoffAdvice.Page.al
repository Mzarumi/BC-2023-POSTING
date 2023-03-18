page 52185839 "Checkoff Advice"
{
    PageType = List;
    SourceTable = "Checkoff Advice Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Advice Header No."; Rec."Advice Header No.")
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Account No."; Rec."Account No.")
                {
                }
                field(Names; Rec.Names)
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field("SAD No."; Rec."SAD No.")
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field(Period; Rec.Period)
                {
                }
                field("Amount On"; Rec."Amount On")
                {
                }
                field("Amount Off"; Rec."Amount Off")
                {
                }
                field("Balance On"; Rec."Balance On")
                {
                }
                field("Balance Off"; Rec."Balance Off")
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Advice Date"; Rec."Advice Date")
                {
                }
                field(Interest; Rec.Interest)
                {
                    Visible = false;
                }
                field("Payroll No"; Rec."Payroll No")
                {
                }
                field("DOD Options"; Rec."DOD Options")
                {
                }
                field("Advice Type"; Rec."Advice Type")
                {
                }
                field(Manual; Rec.Manual)
                {
                }
                field("Employer Account No."; Rec."Employer Account No.")
                {
                }
                field("Modified By"; Rec."Modified By")
                {
                    Editable = false;
                }
                field("Captured  By"; Rec."Captured  By")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Export New Loans")
            {
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ////RunObject = XMLport "Monthly Advice New Loans";
                Visible = false;
            }
            action("Export Stoppages")
            {
                Image = stop;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ////RunObject = XMLport "Monthly Advice New Loans";
                Visible = false;
            }
            action("Export Adjustments")
            {
                Image = AlternativeAddress;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ////RunObject = XMLport "Monthly Advice New Loans";
                Visible = false;
            }
            action("Generate Advice")
            {
                Image = CreateLinesFromJob;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    //PeriodicActivities.MonthlyCheckoffAdvice();
                end;
            }
        }
    }

    var
        PeriodicActivities: Codeunit "Periodic Activities";
}

