#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185955 "NOK With Principle Mem ID No."
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/NOK With Principle Mem ID No..rdlc';

    dataset
    {
        dataitem(Members;Members)
        {
            // DataItemTableView = where("ID No."=filter(<>""));
            column(ReportForNavId_1; 1)
            {
            }
            column(Member_No;Members."No.")
            {
            }
            column(Member_Name;Members.Name)
            {
            }
            column(Company_Name;Company.Name)
            {
            }
            column(Company_Picture;Company.Picture)
            {
            }
            column(Relationship;Relationship)
            {
            }
            column(Type;NOKType)
            {
            }
            column(NOKName;NOKName)
            {
            }

            trigger OnAfterGetRecord()
            begin
                NOK.Reset;
                NOK.SetRange("Account No",Members."No.");
                NOK.SetRange("ID No.",Members."ID No.");
                if NOK.Find('-') then begin
                  Relationship:=NOK.Relationship;
                  NOKType:=Format(NOK.Type);
                  NOKName:=NOK.Name;
                end else CurrReport.Skip;
            end;

            trigger OnPreDataItem()
            begin
                Company.Get;
                Company.CalcFields(Picture);
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
        NOK: Record 52185701;
        Company: Record "Company Information";
        Relationship: Text;
        NOKType: Text;
        NOKName: Text;
}
