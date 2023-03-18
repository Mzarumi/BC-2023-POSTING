page 52185522 "HR BSC List Review"
{
    CardPageID = "HR BSC Appraisal Header-Superv";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Individual Targets Header";
    SourceTableView = WHERE("Appraisal Type" = FILTER("Appraisal Review"),
                            Status = FILTER(Approved));

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
        //SETFILTER("User ID",USERID);
    end;
}

