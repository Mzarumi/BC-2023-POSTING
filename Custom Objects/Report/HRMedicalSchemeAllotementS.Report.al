#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185502 "HR Medical Scheme Allotement S"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HR Medical Scheme Allotement S.rdlc';

    dataset
    {
        dataitem("HR Medical Schemes";"HR Medical Schemes")
        {
            RequestFilterFields = "Scheme No";
            column(ReportForNavId_1; 1)
            {
            }
            column(SchemeNo_HRMedicalSchemes;"HR Medical Schemes"."Scheme No")
            {
            }
            column(MedicalInsurer_HRMedicalSchemes;"HR Medical Schemes"."Medical Insurer")
            {
            }
            column(SchemeName_HRMedicalSchemes;"HR Medical Schemes"."Scheme Name")
            {
            }
            column(Inpatientlimit_HRMedicalSchemes;"HR Medical Schemes"."In-patient limit")
            {
            }
            column(Outpatientlimit_HRMedicalSchemes;"HR Medical Schemes"."Out-patient limit")
            {
            }
            column(USERID;UserId)
            {
            }
            column(TODAY;Today)
            {
            }
            column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            }
            // column(CompanyInfo_Picture;CompanyInfo.Picture)
            // {
            // }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            dataitem("HR Medical Scheme Members";"HR Medical Scheme Members")
            {
                DataItemLink = "Scheme No"=field("Scheme No");
                column(ReportForNavId_7; 7)
                {
                }
                column(EmployeeNo_HRMedicalSchemeMembers;"HR Medical Scheme Members"."Employee No")
                {
                }
                column(FirstName_HRMedicalSchemeMembers;"HR Medical Scheme Members"."First Name")
                {
                }
                column(LastName_HRMedicalSchemeMembers;"HR Medical Scheme Members"."Last Name")
                {
                }
                column(SchemeJoinDate_HRMedicalSchemeMembers;"HR Medical Scheme Members"."Scheme Join Date")
                {
                }
                column(m;m)
                {
                }
                column(m1;m1)
                {
                }
                column(m2;m2)
                {
                }
                column(m3;m3)
                {
                }
                column(m4;m4)
                {
                }
                column(m5;m5)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Mcount:=0;
                    m:=0;
                    m1:=0;
                    m2:=0;
                    m3:=0;
                    m4:=0;
                    m5:=0;

                    Rates.Reset;
                    Rates.SetRange(Rates."Medical Scheme No.", "HR Medical Scheme Members"."Scheme No");
                    if Rates.Find('-') then
                      begin


                    Benefits.Reset;
                    Benefits.SetRange(Benefits."Employee Code", "HR Medical Scheme Members"."Employee No");
                    Benefits.SetRange(Benefits.Type, Benefits.Type::Beneficiary);
                    if Benefits.Find('-') then
                    Mcount:=Benefits.Count;
                    if Mcount = 0 then
                      m:=Rates.M;
                    if Mcount = 1 then
                      m:=Rates."M+1";
                    if Mcount = 2 then
                      m:=Rates."M+2";
                    if Mcount = 3 then
                      m:=Rates."M+3";
                    if Mcount = 4 then
                      m:=Rates."M+4";
                    if Mcount = 5 then
                      m:=Rates."M+5";

                      end;
                end;
            }
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
        CompanyInfo.Reset;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        m: Decimal;
        m1: Decimal;
        m2: Decimal;
        m3: Decimal;
        m4: Decimal;
        m5: Decimal;
        Rates: Record 52186207;
        Benefits: Record 52185518;
        Mcount: Integer;
        CompanyInfo: Record "Company Information";
}
