page 52185882 "Interest Due Periods"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Interest Due Period";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Interest Due Date"; Rec."Interest Due Date")
                {
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field("New Fiscal Year"; Rec."New Fiscal Year")
                {
                    Editable = false;
                }
                field(Closed; Rec.Closed)
                {
                }
                field("Date Locked"; Rec."Date Locked")
                {
                    Editable = false;
                }
                field("Closed by User"; Rec."Closed by User")
                {
                    Editable = false;
                }
                field("Closing Date Time"; Rec."Closing Date Time")
                {
                    Editable = false;
                }
                field("Period End Date"; Rec."Period End Date")
                {
                }
                field("No of Days"; Rec."No of Days")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action15)
            {
            }
            action("Create Period")
            {
                Image = AccountingPeriods;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //REPORT.Run(52185861)
                    //CreateInterestDuePeriod.CreateItDuePeriods(Rec);
                end;
            }
        }
    }

    var
        InvtPeriod: Record "Inventory Period";
        date: DateFormula;
        InterestPeriod: Record "Interest Due Period";
        CreateInterestDuePeriod: Codeunit "Periodic Activities";
}

