page 52185512 "HR Job Applications Factbox"
{
    PageType = ListPart;
    SourceTable = "HR Job Applications";

    layout
    {
        area(content)
        {
            // field(GeneralInfo; Rec.GeneralInfo)
            // {
            //     Style = Strong;
            //     StyleExpr = TRUE;
            // }
            field("Job Application No."; Rec."Job Application No.")
            {
            }
            field("Date Applied"; Rec."Date Applied")
            {
            }
            field("First Name"; Rec."First Name")
            {
            }
            field("Middle Name"; Rec."Middle Name")
            {
            }
            field("Last Name"; Rec."Last Name")
            {
            }
            field(Qualified; Rec.Qualified)
            {
            }
            field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
            {
            }
            field("ID Number"; Rec."ID Number")
            {
            }
            // field(PersonalInfo; Rec.PersonalInfo)
            // {
            //     Style = Strong;
            //     StyleExpr = TRUE;
            // }
            field(Status; Rec.Status)
            {
            }
            field(Age; Rec.Age)
            {
            }
            field("Marital Status"; Rec."Marital Status")
            {
            }
            // field(CommunicationInfo; Rec.CommunicationInfo)
            // {
            //     Style = Strong;
            //     StyleExpr = TRUE;
            // }
            // field("Cell Phone Number"; Rec."Cell Phone Number")
            // {
            //     ExtendedDatatype = PhoneNo;
            // }
            // field("E-Mail"; Rec."E-Mail")
            // {
            //     ExtendedDatatype = EMail;
            // }
            // field("Work Phone Number"; Rec."Work Phone Number")
            // {
            //     ExtendedDatatype = PhoneNo;
            // }
        }
    }

    actions
    {
    }

    var
        GeneralInfo: Label 'General Applicant Information';
        PersonalInfo: Label 'Personal Infomation';
        CommunicationInfo: Label 'Communication Information';
}

