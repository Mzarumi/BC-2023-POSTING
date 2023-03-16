// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185843 "Tenant Invoice"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Tenant Invoice.rdlc';

//     dataset
//     {
//         dataitem("Leases Billed";"Leases Billed")
//         {
//             DataItemTableView = sorting(InvoiceNo,"Property No.","Tenant No.","No.","Transaction Code");
//             RequestFilterFields = InvoiceNo,"Batch No";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(PropertyName_LeasesBilled;"Leases Billed"."Property Name")
//             {
//             }
//             column(TransactionCode_LeasesBilled;"Leases Billed"."Transaction Code")
//             {
//             }
//             column(InvoiceNo_LeasesBilled;"Leases Billed".InvoiceNo)
//             {
//             }
//             column(LeasedAmount_LeasesBilled;"Leases Billed"."Leased Amount")
//             {
//             }
//             column(LeasedVATAmount_LeasesBilled;"Leases Billed"."Leased VAT Amount")
//             {
//             }
//             column(TransactionName_LeasesBilled;"Leases Billed"."Transaction Name")
//             {
//             }
//             column(TotalInclVAT_LeasesBilled;"Leases Billed"."Total Incl. VAT")
//             {
//             }
//             column(ChargeName_LeasesBilled;"Leases Billed"."Charge Name")
//             {
//             }
//             column(Description_LeasesBilled;"Leases Billed".Description)
//             {
//             }
//             column(LandlordName_LeasesBilled;"Leases Billed"."Landlord Name")
//             {
//             }
//             column(LandlordNo_LeasesBilled;"Leases Billed"."Landlord No.")
//             {
//             }
//             column(TenantNo_LeasesBilled;"Leases Billed"."Tenant No.")
//             {
//             }
//             column(TenantName_LeasesBilled;"Leases Billed"."Tenant Name")
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
//         CI.Get;
//         CI.CalcFields(Picture);
//     end;

//     var
//         CI: Record "Company Information";
// }
