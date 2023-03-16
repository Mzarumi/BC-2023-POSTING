// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185917 "Delegates List"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Delegates List.rdlc';

//     dataset
//     {
//         dataitem(52186062;52186062)
//         {
//             RequestFilterFields = "Global Dimension 1 Code", "Code", "Electoral Zone";
//             column(ReportForNavId_10; 10)
//             {
//             }
//             column(DelegateRegionDescription; "Delegate Region"."Delegate Region Description")
//             {
//             }
//             column(AddGroupName; AddGroupName)
//             {
//             }
//             column(Snos; Sno)
//             {
//             }
//             column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
//             {
//             }
//             column(CurrReport_PAGENO; CurrReport.PageNo)
//             {
//             }
//             column(period; period)
//             {
//             }
//             column(USERID; UserId)
//             {
//             }
//             column(CompanyInfo__Address_2_; Company."Address 2")
//             {
//             }
//             column(CompanyInfo_Address; Company.Address)
//             {
//             }
//             column(Company_Name; Company.Name)
//             {
//             }
//             column(Company_Picture; Company.Picture)
//             {
//             }
//             column(Code_DelegateGroupss; "Delegate Region".Code)
//             {
//             }
//             column(ElectoralZoneName; "Delegate Region"."Electoral Zone Name")
//             {
//             }
//             column(ElectoralZone; "Delegate Region"."Electoral Zone")
//             {
//             }
//             column(DelegateGroupDescription_DelegateGroupss; "Delegate Region"."Delegate Region Description")
//             {
//             }
//             column(ElectoralZone_DelegateGroupss; "Delegate Region"."Electoral Zone")
//             {
//             }
//             column(ElectoralZoneName_DelegateGroupss; "Delegate Region"."Electoral Zone Name")
//             {
//             }
//             column(GlobalDimension1Code_DelegateGroupss; "Delegate Region"."Global Dimension 1 Code")
//             {
//             }
//             column(GlobalDimension2Code_DelegateGroupss; "Delegate Region"."Global Dimension 2 Code")
//             {
//             }
//             column(CreatedBy_DelegateGroupss; "Delegate Region"."Created By")
//             {
//             }
//             column(CreationDate_DelegateGroupss; "Delegate Region"."Creation Date")
//             {
//             }
//             column(NoSeries_DelegateGroupss; "Delegate Region"."No. Series")
//             {
//             }
//             column(County_DelegateGroupss; "Delegate Region".County)
//             {
//             }
//             column(SubCounty_DelegateGroupss; "Delegate Region"."Sub-County")
//             {
//             }
//             column(CountyName_DelegateGroupss; "Delegate Region"."County Name")
//             {
//             }
//             column(SubCountyName_DelegateGroupss; "Delegate Region"."Sub-County Name")
//             {
//             }
//             column(Status_DelegateGroupss; "Delegate Region".Status)
//             {
//             }
//             column(GlobalDimension1Name_DelegateGroupss; "Delegate Region"."Global Dimension 1 Name")
//             {
//             }
//             column(GlobalDimension2Name_DelegateGroupss; "Delegate Region"."Global Dimension 2 Name")
//             {
//             }
//             column(ProvinceCode_DelegateGroupss; "Delegate Region"."Region Code")
//             {
//             }
//             column(ProvinceName_DelegateGroupss; "Delegate Region"."Region Name")
//             {
//             }
//             dataitem(52186063;52186063)
//             {
//                 DataItemLink = Code = field(Code);
//                 column(ReportForNavId_1; 1)
//                 {
//                 }
//                 column(Sno; Sno)
//                 {
//                 }
//                 column(AppointmentDate; "Delegate Memberss"."Appointment Date")
//                 {
//                 }
//                 column(Code_DelegateMemberss; "Delegate Memberss".Code)
//                 {
//                 }
//                 column(DelegateMNO_DelegateMemberss; "Delegate Memberss"."Delegate MNO.")
//                 {
//                 }
//                 column(DelegateName_DelegateMemberss; "Delegate Memberss"."Delegate Name")
//                 {
//                 }
//                 column(phoneNo; phoneNo)
//                 {
//                 }
//                 column(Position_DelegateMemberss; "Delegate Memberss".Position)
//                 {
//                 }
//                 column(JobTittle_DelegateMemberss; "Delegate Memberss"."Job Tittle")
//                 {
//                 }
//                 column(Status_DelegateMemberss; "Delegate Memberss".Status)
//                 {
//                 }
//                 column(idno; idno)
//                 {
//                 }
//                 column(Retired_DelegateMemberss; Retited)
//                 {
//                 }
//                 column(RetireDate_DelegateMemberss; "Delegate Memberss"."Retire Date")
//                 {
//                 }
//                 column(ServicePeriod_DelegateMemberss; "Delegate Memberss"."Service Period")
//                 {
//                 }
//                 column(RetiredBy_DelegateMemberss; "Delegate Memberss"."Retired By")
//                 {
//                 }
//                 column(EntryNo_DelegateMemberss; "Delegate Memberss"."Entry No")
//                 {
//                 }
//                 column(Reasonforretirement_DelegateMemberss; "Delegate Memberss"."Reason for retirement")
//                 {
//                 }
//                 column(ElectoralZone_DelegateMemberss; "Delegate Memberss"."Electoral Zone")
//                 {
//                 }
//                 column(ElectoralZoneName_DelegateMemberss; "Delegate Memberss"."Electoral Zone Name")
//                 {
//                 }
//                 column(AppointmentDate_DelegateMemberss; "Delegate Memberss"."Appointment Date")
//                 {
//                 }
//                 column(ExpiryDate_DelegateMemberss; "Delegate Memberss"."Expiry Date")
//                 {
//                 }
//                 column(GlobalDimension1Code_DelegateMemberss; "Delegate Memberss"."Global Dimension 1 Code")
//                 {
//                 }
//                 column(GlobalDimension1Name_DelegateMemberss; "Delegate Memberss"."Global Dimension 1 Name")
//                 {
//                 }
//                 column(IDNo_DelegateMemberss; "Delegate Memberss"."ID No.")
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin

//                     if "Delegate Memberss".Retired = true then
//                         Retited := 'Yes' else
//                         Retited := 'No';

//                     if "Delegate Memberss".Retired = true then
//                         CurrReport.Skip;

//                     Members.Reset;
//                     Members.SetRange("No.", "Delegate Memberss"."Delegate MNO.");
//                     if Members.Find('-') then begin
//                         phoneNo := Members."Phone No.";
//                         idno := Members."ID No.";
//                     end else
//                         CurrReport.Skip;

//                     Members.Reset;
//                     Members.SetRange("No.", "Delegate Memberss"."Delegate MNO.");
//                     Members.SetRange(Status, Members.Status::Deceased);
//                     if Members.Find('-') then
//                         CurrReport.Skip;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     if Company.Get() then
//                         Company.CalcFields(Company.Picture);
//                     GenSetUp.Get();
//                 end;
//             }
//             dataitem(52186059;52186059)
//             {
//                 DataItemLink = Code = field(Code);
//                 column(ReportForNavId_42; 42)
//                 {
//                 }
//                 column(Description; "Region Delegates Tariff".Description)
//                 {
//                 }
//                 column(Frequency; "Region Delegates Tariff"."Payment Frequency")
//                 {
//                 }
//                 column(Amount; "Region Delegates Tariff".Amount)
//                 {
//                 }
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 Sno += 1;
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field(AddGroupName; AddGroupName)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'AddGroupName';
//                 }
//             }
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     var
//         Company: Record "Company Information";
//         GenSetUp: Record 52185689;
//         Sno: Integer;
//         Retited: Text;
//         Members: Record "Members";
//         phoneNo: Text;
//         idno: Code[20];
//         period: Integer;
//         AddGroupName: Boolean;
// }
