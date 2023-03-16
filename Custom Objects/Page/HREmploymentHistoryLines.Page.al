page 52186545 "HR Employment History Lines"
{
    Caption = 'Employment History Lines';
    PageType = List;
    SourceTable = "HR Employment History";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field("Company Name"; Rec."Company Name")
                {
                }
                field(From; Rec.From)
                {
                }
                field("To Date"; Rec."To Date")
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                field("Key Experience"; Rec."Key Experience")
                {
                }
                field("Salary On Leaving"; Rec."Salary On Leaving")
                {
                }
                field("Postal Address"; Rec."Postal Address")
                {
                }
                field("Address 2"; Rec."Address 2")
                {
                }
                field("Reason For Leaving"; Rec."Reason For Leaving")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
            }
        }
    }

    actions
    {
    }
}

