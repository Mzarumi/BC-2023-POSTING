page 52186571 "HR Appraissal Appeal list"
{
    CardPageID = "HR Appraissal Appeal";
    PageType = List;
    SourceTable = "HR Appraissal Appeal";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Appraissal Period"; Rec."Appraissal Period")
                {
                }
                field("Appraisser No."; Rec."Appraisser No.")
                {
                }
                field("Appraiser Name"; Rec."Appraiser Name")
                {
                }
                field(Region; Rec.Region)
                {
                }
                field(Reason; Rec.Reason)
                {
                }
                field(Department; Rec.Department)
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
    }
}

