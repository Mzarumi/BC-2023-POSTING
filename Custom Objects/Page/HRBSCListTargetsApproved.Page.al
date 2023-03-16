page 52186604 "HR BSC List Targets-Approved"
{
    CardPageID = "HR BSC Appraisal Header-Approv";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Individual Targets Header";
    SourceTableView = WHERE(Status = FILTER(Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {
                }
                field("Appraisal Date"; Rec."Appraisal Date")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Appraisal Year"; Rec."Appraisal Year")
                {
                }
                field("Finance Rating"; Rec."Finance Rating")
                {
                }
                field("Customer Rating"; Rec."Customer Rating")
                {
                }
                field("Training Rating"; Rec."Training Rating")
                {
                }
                field("Service Rating"; Rec."Service Rating")
                {
                }
                field("Overall Rating"; Rec."Overall Rating")
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
        Rec.SetFilter("User ID", UserId);
    end;
}

