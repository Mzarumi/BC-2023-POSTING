#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185754 "Update Member"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Member.rdlc';

    dataset
    {
        dataitem(Members; Members)
        {
            //DataItemTableView = where("Employer Code"=filter(<>""));
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if (Members."Employer Code" = '99') or (Members."Employer Code" = '9902') or (Members."Employer Code" = '9905') or (Members."Employer Code" = '9901') then
                    Members.Validate("Member Segment", 'UNCHECKOFF')
                else
                    Members.Validate("Member Segment", 'CHECKOFF');

                Members.Modify;
            end;

            trigger OnPostDataItem()
            begin
                Message('Done!!!');
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        ProductFactory: Record 52185690;
}
