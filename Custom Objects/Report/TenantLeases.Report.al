// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185846 "Tenant Leases"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Tenant Leases.rdlc';

//     dataset
//     {
//         dataitem(Lease;Lease)
//         {
//             RequestFilterFields = "No.";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(No_Lease;Lease."No.")
//             {
//             }
//             column(DateRegistered_Lease;Lease."Date Registered")
//             {
//             }
//             column(PropertyNo_Lease;Lease."Property No.")
//             {
//             }
//             column(LRNo_Lease;Lease."L.R. No.")
//             {
//             }
//             column(FloorNo_Lease;Lease."Floor No.")
//             {
//             }
//             column(FloorName_Lease;Lease."Floor Name")
//             {
//             }
//             column(UnitCode_Lease;Lease."Unit Code")
//             {
//             }
//             column(UnitDescription_Lease;Lease."Unit Description")
//             {
//             }
//             column(TenantNo_Lease;Lease."Tenant No.")
//             {
//             }
//             column(TenantName_Lease;Lease."Tenant Name")
//             {
//             }
//             column(LeaseCommenceDate_Lease;Lease."Lease Commence Date")
//             {
//             }
//             column(ExpiryDate_Lease;Lease."Expiry Date")
//             {
//             }
//             column(BillingFrequency_Lease;Lease."Billing Frequency")
//             {
//             }
//             column(Name;CI.Name)
//             {
//             }
//             column(Pic;CI.Picture)
//             {
//             }
//             column(Email;CI."E-Mail")
//             {
//             }
//             column(HomePage;CI."Home Page")
//             {
//             }
//             column(FaxNo;CI."Fax No.")
//             {
//             }
//             column(PhoneNo;CI."Phone No.")
//             {
//             }
//             column(Address;CI.Address)
//             {
//             }
//             column(Address2;CI."Address 2")
//             {
//             }
//             column(City;CI.City)
//             {
//             }
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//         }

//         actions
//         {
//         }
//     }

//     labels
//     {
//     }

//     trigger OnPreReport()
//     begin
//         CI.Reset;
//         CI.Get;
//         CI.CalcFields(CI.Picture);
//     end;

//     var
//         CI: Record "Company Information";
// }
