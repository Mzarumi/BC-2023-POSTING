// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185818 "Delegates Listing"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Delegates Listing.rdlc';

//     dataset
//     {
//         dataitem(52186063;52186063)
//         {
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column("Code"; "Delegate Memberss".Code)
//             {
//             }
//             column(ElectoralZoneName_DelegateMemberss; "Delegate Memberss"."Electoral Zone Name")
//             {
//             }
//             column(DelegateMNO; "Delegate Memberss"."Delegate MNO.")
//             {
//             }
//             column(DelegateName; "Delegate Memberss"."Delegate Name")
//             {
//             }
//             column(IDNo; "Delegate Memberss"."ID No.")
//             {
//             }
//             column(AppointmentDate; "Delegate Memberss"."Appointment Date")
//             {
//             }
//             column(Deposits; Deposits)
//             {
//             }
//             column(ShareCap; ShareCap)
//             {
//             }
//             column(EmployerCode; EMployerName)
//             {
//             }
//             column(Age; Age)
//             {
//             }
//             column(DOB; DOB)
//             {
//             }
//             column(ID; ID)
//             {
//             }
//             column(Region; Region)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 Members.Reset;
//                 Members.SetRange("No.", "Delegate Memberss"."Delegate MNO.");
//                 if Members.Find('-') then begin
//                     DOB := Members."Date of Birth";
//                     EmployerCode := Members."Employer Code";
//                     ID := Members."ID No.";
//                     Age := (Today - DOB)
//                 end;
//                 if Customer.Get(EmployerCode) then begin
//                     EMployerName := Customer.Name;
//                 end;

//                 DelegateRegion.Reset;
//                 DelegateRegion.SetRange(Code, "Delegate Memberss".Code);
//                 if DelegateRegion.Find('-') then begin
//                     Region := DelegateRegion."Delegate Region Description";
//                 end;




//                 if DOB <> 0D then
//                     Age := ROUND((Today - DOB) / 365, 1, '>')
//                 else
//                     Age := 0;

//                 SavingsAccounts.Reset;
//                 SavingsAccounts.SetRange("Member No.", "Delegate Memberss"."Delegate MNO.");
//                 SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Deposit Contribution");
//                 if SavingsAccounts.Find('-') then begin
//                     SavingsAccounts.CalcFields("Balance (LCY)");
//                     Deposits := SavingsAccounts."Balance (LCY)";
//                 end;



//                 SavingsAccounts.Reset;
//                 SavingsAccounts.SetRange("Member No.", "Delegate Memberss"."Delegate MNO.");
//                 SavingsAccounts.SetRange("Product Category", SavingsAccounts."product category"::"Share Capital");
//                 if SavingsAccounts.Find('-') then begin
//                     SavingsAccounts.CalcFields("Balance (LCY)");
//                     ShareCap := SavingsAccounts."Balance (LCY)";
//                 end;
//             end;
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

//     var
//         Members: Record "Members";
//         SavingsAccounts: Record 52185730;
//         Deposits: Decimal;
//         ShareCap: Decimal;
//         DOB: Date;
//         EmployerCode: Code[20];
//         Age: Integer;
//         ID: Code[10];
//         Customer: Record Customer;
//         EMployerName: Text;
//         DelegateRegion: Record 52186062;
//         Region: Text;
// }
