page 52186534 "HR Company Targets Header"
{
    PageType = Card;
    SourceTable = "HR Company Targets Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Appraisal no"; Rec."Appraisal no")
                {
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                }
                field("Appraisal Date"; Rec."Appraisal Date")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Financial Targeted Score"; Rec."Financial Targeted Score")
                {
                }
                field("Achieved Financial  Score"; Rec."Achieved Financial  Score")
                {
                }
                field("Unachieved Targets"; Rec."Unachieved Targets")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Training Targeted Score"; Rec."Training Targeted Score")
                {
                }
                field("Service Delivery Target Score"; Rec."Service Delivery Target Score")
                {
                }
                field("Customer Target Score"; Rec."Customer Target Score")
                {
                }
                field("Customer Achieved  Score"; Rec."Customer Achieved  Score")
                {
                }
                field("Service Delivery Achieved"; Rec."Service Delivery Achieved")
                {
                }
                field("Training Achieved  Score"; Rec."Training Achieved  Score")
                {
                }
            }
            part(Control1000000016; "HR Company Target Line")
            {
                SubPageLink = "Appraisal No" = FIELD("Appraisal no");
            }
        }
    }

    actions
    {
    }
}

