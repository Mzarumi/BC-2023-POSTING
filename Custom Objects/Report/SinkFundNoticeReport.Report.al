// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185768 "Sink Fund Notice Report"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Sink Fund Notice Report.rdlc';

//     dataset
//     {
//         dataitem(Members; UnknownTable52185940)
//         {
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(CompanyInformation_Name; CompanyInformation.Name)
//             {
//             }
//             column(CompanyInformation_Picture; CompanyInformation.Picture)
//             {
//             }
//             column(CompanyAddress; CompanyAddress)
//             {
//             }
//             column(CompanyTelephone; CompanyTelephone)
//             {
//             }
//             column(CommunicationOnline; CommunicationOnline)
//             {
//             }
//             column(No_Members; Members.No)
//             {
//             }
//             column(Date_Members; Members.Date)
//             {
//             }
//             column(ReportedByName_Members; Members."Reported By Name")
//             {
//             }
//             column(ReportedByIDNo_Members; Members."Reported By ID No")
//             {
//             }
//             column(ReportedByRelationship_Members; Members."Reported By Relationship")
//             {
//             }
//             column(MemberNo_Members; Members."Member No")
//             {
//             }
//             column(DateofDeath_Members; Members."Date of Death")
//             {
//             }
//             column(ClaimOption_Members; Members."Claim Option")
//             {
//             }
//             column(DeceasedPerson_Members; Members."Deceased Person")
//             {
//             }
//             column(MemberName_Members; Members."Member Name")
//             {
//             }
//             column(GlobalDimension1Code_Members; Members."Global Dimension 1 Code")
//             {
//             }
//             column(GlobalDimension2Code_Members; Members."Global Dimension 2 Code")
//             {
//             }
//             column(Status_Members; Members.Status)
//             {
//             }
//             column(ResponsibilyCenter_Members; Members."Responsibily Center")
//             {
//             }
//             column(CapturedBy_Members; Members."Captured By")
//             {
//             }
//             column(SavingsBalance_Members; Members."Savings Balance")
//             {
//             }
//             column(TotalOutstandingLoan_Members; Members."Total Outstanding Loan")
//             {
//             }
//             column(TotalOutstandingInterest_Members; Members."Total Outstanding Interest")
//             {
//             }
//             column(MarriageCertificateAffidavit_Members; Members."Marriage Certificate/Affidavit")
//             {
//             }
//             column(BenevolentClaimAmount_Members; Members."Benevolent Claim Amount")
//             {
//             }
//             column(Posted_Members; Members.Posted)
//             {
//             }
//             column(DatePosted_Members; Members."Date Posted")
//             {
//             }
//             column(PostedBy_Members; Members."Posted By")
//             {
//             }
//             column(InsurancePaymentStatus_Members; Members."Insurance Payment Status")
//             {
//             }
//             column(TotalNetAmount_Members; Members."Total Net Amount")
//             {
//             }
//             column(Scount; SNo)
//             {
//             }
//             column(IDNo; IDNo)
//             {
//             }
//             column(DeptCode; DeptCode)
//             {
//             }
//             column(ClaimDate; ClaimDate)
//             {
//             }
//             column(Paid; Paid)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 SNo += 1;
//                 IDNo := '';
//                 DeptCode := '';
//                 if Mem.Get(Members."Member No") then begin
//                     IDNo := Mem."ID No.";
//                     DeptCode := Mem."Employer Code";
//                 end;
//                 ClaimDate := SkyHarambeePortal.FormatDate(Members.Date);
//                 Paid := false;
//                 BBFRequisationHeader.Reset;
//                 BBFRequisationHeader.SetRange("Report Notice No", Members.No);
//                 BBFRequisationHeader.SetRange(Posted, true);
//                 if BBFRequisationHeader.FindFirst then Paid := true;
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

//     trigger OnPreReport()
//     begin
//         if CompanyInformation.Get then
//             CompanyInformation.CalcFields(CompanyInformation.Picture);
//         CompanyAddress := CompanyInformation.Address + ' -Post Code: ' + CompanyInformation."Post Code" + ' -City:' + CompanyInformation.City + ' Region: ' + CompanyInformation."Country/Region Code";
//         CompanyTelephone := 'Tel: ' + CompanyInformation."Phone No." + ' -Office Tel: ' + CompanyInformation."Phone No. 2";
//         CommunicationOnline := 'E-mail: ' + CompanyInformation."E-Mail" + '- Website: ' + CompanyInformation."Home Page";
//     end;

//     var
//         CompanyInformation: Record "Company Information";
//         CompanyAddress: Text;
//         CompanyTelephone: Text;
//         CommunicationOnline: Text;
//         SNo: Integer;
//         SavingAcc: Record 52185730;
//         CreditAcc: Record 52185731;
//         LoanAcc: Record 52185729;
//         AplhaDeposit: Decimal;
//         SharesCapital: Decimal;
//         RegFees: Decimal;
//         CreditLoans: Decimal;
//         BankingLoans: Decimal;
//         AlphaDepositProduct: Code[10];
//         SharesCapitalProduct: Code[10];
//         RegFeesProduct: Code[10];
//         ShortTLoans: Decimal;
//         LongTLoans: Decimal;
//         TotalLoans: Decimal;
//         CreatedBy: Text;
//         User: Record User;
//         NextofKIN: Record 52185701;
//         ImageData: Record 52185702;
//         HASNextKin: Boolean;
//         HASImage: Boolean;
//         ShowNextofKin: Boolean;
//         ShowImage: Boolean;
//         IDNo: Code[20];
//         Mem: Record "Members";
//         DeptCode: Code[10];
//         ClaimDate: Text;
//         SkyHarambeePortal: Codeunit 52185428;
//         BBFRequisationHeader: Record 52186126;
//         Paid: Boolean;
// }
