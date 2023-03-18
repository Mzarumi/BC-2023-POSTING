#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185940 "Members Age"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Members Age.rdlc';

    dataset
    {
        dataitem(Members;Members)
        {
            RequestFilterFields = "No.",Status;
            column(ReportForNavId_1; 1)
            {
            }
            column(No_Members;Members."No.")
            {
            }
            column(Name_Members;Members.Name)
            {
            }
            column(IdNo_Members;Members."ID No.")
            {
            }
            column(Gender_Members;Members.Gender)
            {
            }
            column(DOB_Members;Members."Date of Birth")
            {
            }
            column(Age;Age)
            {
            }
            column(AgeGroup;AgeBracket)
            {
            }
            column(Company_Name;Company.Name)
            {
            }
            column(Company_Picture;Company.Picture)
            {
            }
            column(Employer_Code;Members."Employer Code")
            {
            }
            column(Employer_Name;EmployerName)
            {
            }
            column(Joining_Date;Members."Registration Date")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Age:=0;
                Days:=0;
                AgeBracket:='';
                EmployerName:='';
                if Members."Date of Birth"<>0D then begin
                  Days:=Today-Members."Date of Birth";
                  Age:=ROUND((Days/365.2364),1,'<') //Denis takes into Account Leap Years
                  end
                  else
                  Age:=0;

                //Group Age
                if Age<>0 then begin
                    if Age<18 then AgeBracket:='Below 18';
                    if (Age>=18) and (Age<=30) then AgeBracket:='18-30';
                    if (Age>30) and (Age<=40) then AgeBracket:='31-40';
                    if (Age>40) and (Age<=50) then AgeBracket:='41-50';
                    if (Age>50) and (Age<=60) then AgeBracket:='51-60';
                    if (Age>60) then AgeBracket:='Over 60';

                end
                else AgeBracket:='No D.O.B';

                if Customer.Get(Members."Employer Code") then
                  EmployerName:=Customer.Name
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
        Days: Integer;
        Age: Integer;
        AgeBracket: Text;
        Company: Record "Company Information";
        Customer: Record Customer;
        EmployerName: Text;
}
