page 52185587 "HR Shortlisting Lines"
{
    Caption = 'Shorlisted Candidates';
    Editable = false;
    PageType = List;
    SourceTable = "HR Shortlisted Applicants";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;
                field(Qualified; Rec.Qualified)
                {
                    Caption = 'Qualified';

                    trigger OnValidate()
                    begin
                        Rec."Manual Change" := true;
                        Rec.Modify;
                    end;
                }
                field("Job Application No"; Rec."Job Application No")
                {
                }
                field("Full Name"; Rec."Full Name")
                {
                }
                field("ID No"; Rec."ID No")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        MyCount: Integer;

    //[Scope('Internal')]
    procedure GetApplicantNo() AppicantNo: Code[20]
    begin
        //AppicantNo:=Applicant;
    end;
}

