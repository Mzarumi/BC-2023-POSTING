#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185844 "Property Vacancy Schedule"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Property Vacancy Schedule.rdlc';

    dataset
    {
        dataitem(unit;Unit)
        {
            RequestFilterFields = "Property No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(PropertyNo_Unit;Unit."Property No.")
            {
            }
            column(FloorCode_Unit;Unit."Floor Code")
            {
            }
            column(UnitCode_Unit;Unit."Unit Code")
            {
            }
            column(UnitName_Unit;Unit."Unit Name")
            {
            }
            column(UnitType_Unit;Unit."Unit Type")
            {
            }
            column(UnitTypeName_Unit;Unit."Unit Type Name")
            {
            }
            column(UnitSubType_Unit;Unit."Unit Sub Type")
            {
            }
            column(Status;Unit."Unit Status")
            {
            }
            // column(Name;CI.Name)
            // {
            // }
            // column(Pic;CI.Picture)
            // {
            // }
            // column(Email;CI."E-Mail")
            // {
            // }
            // column(HomePage;CI."Home Page")
            // {
            // }
            // column(FaxNo;CI."Fax No.")
            // {
            // }
            // column(PhoneNo;CI."Phone No.")
            // {
            // }
            // column(Address;CI.Address)
            // {
            // }
            // column(Address2;CI."Address 2")
            // {
            // }
            // column(City;CI.City)
            // {
            // }
            // dataitem(52186005;52186005)
            // {
            //     DataItemLink = "No."=field("Property No.");
            //     column(ReportForNavId_9; 9)
            //     {
            //     }
            //     column(PName;PName)
            //     {
            //     }
            // }

            trigger OnAfterGetRecord()
            begin
                   P.Reset;
                   P.SetRange(P."No.","Property No.");
                   if P.Find('-')then begin
                   PName:=P.Description;
                   end;
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

    trigger OnPreReport()
    begin
        CI.Reset;
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        P: Record 52186005;
        PName: Text[100];
        CI: Record "Company Information";
}
