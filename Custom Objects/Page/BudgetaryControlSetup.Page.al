page 52185941 "Budgetary Control Setup"
{
    PageType = Card;
    SourceTable = "Budgetary Control Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(Mandatory; Rec.Mandatory)
                {
                }
                field("Allow OverExpenditure"; Rec."Allow OverExpenditure")
                {
                }
                field("Budget Check Criteria"; Rec."Budget Check Criteria")
                {
                }
                field("Partial Budgetary Check"; Rec."Partial Budgetary Check")
                {
                }
                field("Use Totaling Account"; Rec."Use Totaling Account")
                {
                }
            }
            group(Budget)
            {
                Caption = 'Budget';
                field("Current Budget Code"; Rec."Current Budget Code")
                {
                }
                field("Current Budget Start Date"; Rec."Current Budget Start Date")
                {
                }
                field("Current Budget End Date"; Rec."Current Budget End Date")
                {
                }
                field("Current Item Budget"; Rec."Current Item Budget")
                {
                }
            }
            group(Actuals)
            {
                Caption = 'Actuals';
                Visible = false;
                field("Analysis View Code"; Rec."Analysis View Code")
                {
                }
                field("Dimension 1 Code"; Rec."Dimension 1 Code")
                {
                }
                field("Dimension 2 Code"; Rec."Dimension 2 Code")
                {
                }
                field("Dimension 3 Code"; Rec."Dimension 3 Code")
                {
                }
                field("Dimension 4 Code"; Rec."Dimension 4 Code")
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
        UserSetup.GetDefaultSalesAmountApprovalLimit();
    end;

    var
        Text000: Label 'You do not have permissions to view This page';
        StatusPermissions: Record "Status Change Permissions.";
        UserSetup: Record "User Setup";
}

