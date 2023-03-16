#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185932 "Deligates Registration"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Deligates Registration.rdlc';

    dataset
    {
        dataitem("Delegate Memberss";"Delegate Memberss")
        {
            DataItemTableView = where(Code=filter(0290));
            RequestFilterFields = "Attended AGM";
            column(ReportForNavId_1; 1)
            {
            }
            column(D_Mem_No;"Delegate Memberss"."Delegate MNO.")
            {
            }
            column(D_Name;"Delegate Memberss"."Delegate Name")
            {
            }
            column(D_Position;"Delegate Memberss".Position)
            {
            }
            column(D_Code;"Delegate Memberss"."Delegate Code")
            {
            }
            column(D_type;"Delegate Memberss".Type)
            {
            }
            column(Comp_name;company.Name)
            {
            }
            column(comp__pic;company.Picture)
            {
            }
            column(Code_name;codename)
            {
            }

            trigger OnAfterGetRecord()
            begin
                DelegateRegion.Reset;
                DelegateRegion.SetRange(Code,"Delegate Memberss"."Delegate Code");
                if DelegateRegion.FindFirst then
                  codename:=DelegateRegion."Delegate Region Description";
            end;

            trigger OnPreDataItem()
            begin
                company.Get;
                company.CalcFields(Picture);
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
        company: Record "Company Information";
        DelegateRegion: Record 52186062;
        codename: Text;
}
