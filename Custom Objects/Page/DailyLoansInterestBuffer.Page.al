page 52185877 "Daily Loans Interest Buffer"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Daily Loans Interest Buffer";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Interest Date"; Rec."Interest Date")
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Loan Product type"; Rec."Loan Product type")
                {
                }
                field("Interest Amount"; Rec."Interest Amount")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field(Transferred; Rec.Transferred)
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(Action19)
            {
                action("Generate Daily Interest")
                {
                    Image = GetEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    // trigger OnAction()
                    // begin
                    //     PeriodicActivities.GenerateDailyInterest(Rec);
                    // end;
                }
                separator(Action17)
                {
                }
                action("Generate Daily Interest 2")
                {
                    //RunObject = Report "Compute Daily Interest";
                }
            }
        }
    }

    var
        PeriodicActivities: Codeunit "Periodic Activities";
}

