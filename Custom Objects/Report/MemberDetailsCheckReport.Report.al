#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185702 "Member Details Check Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Member Details Check Report.rdlc';

    dataset
    {
        dataitem(Members;Members)
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(FORMAT_TODAY_0_4_;Format(Today,0,4))
            {
            }
            column(CurrReport_PAGENO;CurrReport.PageNo)
            {
            }
            column(USERID;UserId)
            {
            }
            column(CompanyInfo__Address_2_;Company."Address 2")
            {
            }
            column(CompanyInfo_Address;Company.Address)
            {
            }
            column(Company_Name;Company.Name)
            {
            }
            column(Company_Picture;Company.Picture)
            {
            }
            column(GlobalDimension1Code_Members;Members."Global Dimension 1 Code")
            {
            }
            column(No_Members;Members."No.")
            {
            }
            column(Name_Members;Members.Name)
            {
            }
            column(GlobalDimension2Code_Members;Members."Global Dimension 2 Code")
            {
            }
            column(PhoneNo_Members;Members."Phone No.")
            {
            }
            column(RegistrationDate_Members;Members."Registration Date")
            {
            }
            column(EmployerCode_Members;Members."Employer Code")
            {
            }
            column(DateofBirth_Members;Members."Date of Birth")
            {
            }
            column(IDNo_Members;Members."ID No.")
            {
            }
            column(MobilePhoneNo_Members;Members."Mobile Phone No")
            {
            }
            column(RecruitedBy_Members;Members."Recruited By")
            {
            }
            column(SNo;SNO)
            {
            }
            column(HasNexOfKin;HasNexOfKin)
            {
            }
            column(HasPic;HasPic)
            {
            }

            trigger OnAfterGetRecord()
            begin
                 HasNexOfKin:=false;
                HasPic:=false;
                    NextofKIN.Reset;
                    NextofKIN.SetRange("Account No",Members."No.");
                    if NextofKIN.Find('-') then
                      begin
                        HasNexOfKin:=true;
                      end;

                      ImageData.Reset;
                      ImageData.SetRange("Member No",Members."No.");
                      if ImageData.Find('-') then
                        begin
                          ImageData.CalcFields(Picture,Signature);
                          if (ImageData.Picture.Hasvalue) and (ImageData.Picture.Hasvalue) then
                          HasPic:=true;
                          end;
                        if (OnlywithoutNextOfKin=true)  and (HasNexOfKin=true)then
                        CurrReport.Skip;
                        if (OnlywithoutPicandSignature=true) and (HasPic=true) then
                        CurrReport.Skip ;
                SNO+=1;
            end;

            trigger OnPreDataItem()
            begin
                Company.Get();
                Company.CalcFields(Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Only without Next Of Kin";OnlywithoutNextOfKin)
                {
                    ApplicationArea = Basic;
                }
                field("Only Without Pic & Signature";OnlywithoutPicandSignature)
                {
                    ApplicationArea = Basic;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        SNO: Integer;
        NextofKIN: Record 52185701;
        OnlywithoutNextOfKin: Boolean;
        OnlywithoutPicandSignature: Boolean;
        HasNexOfKin: Boolean;
        HasPic: Boolean;
        ImageData: Record 52185702;
        Company: Record "Company Information";
}
