// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52186003 "Membership Declaration"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Membership Declaration.rdlc';

//     dataset
//     {
//         dataitem(Members;Members)
//         {
//             RequestFilterFields = "No.";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(No_Members;Members."No.")
//             {
//             }
//             column(Name_Members;Members.Name)
//             {
//             }
//             column(IDNo_Members;Members."ID No.")
//             {
//             }
//             column(PrintedBy;PrintedBy)
//             // {
//             // }
//             // column(PrintedAt;PrintedAt)
//             // {
//             // }
//             // column(MembersDOB;MembersDOB)
//             // {
//             // }
//             dataitem("Next of KIN";"Next of KIN")
//             {
//                 DataItemLink = "Account No"=field("No.");
//                 //DataItemTableView = where(Beneficiary=const(Yes),Deceased=const(No),Type=const("Benevolent Beneficiary"));
//                 column(ReportForNavId_2; 2)
//                 {
//                 }
//                 column(Name_NextofKIN;"Next of KIN".Name)
//                 {
//                 }
//                 column(Relationship_NextofKIN;"Next of KIN".Relationship)
//                 {
//                 }
//                 column(Beneficiary_NextofKIN;"Next of KIN".Beneficiary)
//                 {
//                 }
//                 column(BBFEntitlementCode_NextofKIN;"Next of KIN"."BBF Entitlement Code")
//                 {
//                 }
//                 column(IDNo_NextofKIN;"Next of KIN"."ID No.")
//                 {
//                 }
//                 column(DateOfBirth;DateOfBirth)
//                 {
//                 }
//                 column(BBFEnt;BBFEnt)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     DateOfBirth := '';

//                     if "Next of KIN"."Date of Birth" <> 0D then
//                     DateOfBirth := SkyHarambeePortal.FormatDate("Next of KIN"."Date of Birth");
//                     BBFEntitlement.Reset;
//                     BBFEntitlement.SetRange(Code,"Next of KIN"."BBF Entitlement Code");
//                     if BBFEntitlement.FindFirst then BBFEnt := BBFEntitlement.Description;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 NextofKIN.Reset;
//                 NextofKIN.SetRange("Account No",Members."No.");
//                 NextofKIN.SetRange(Deceased,false);
//                 NextofKIN.SetRange(Type,NextofKIN.Type::"Benevolent Beneficiary");
//                 NextofKIN.SetRange(Beneficiary,true);
//                 if not NextofKIN.FindFirst then CurrReport.Skip;

//                 MembersDOB := SkyHarambeePortal.FormatDate(Members."Date of Birth");
//             end;

//             trigger OnPreDataItem()
//             begin
//                 PrintedBy := CopyStr(UserId,StrPos(UserId,'\')+1,StrLen(UserId));
//                 PrintedAt := SkyHarambeePortal.FormatDateTimeReverse(CurrentDatetime);
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
//         DateOfBirth: Text;
//         SkyHarambeePortal: Codeunit 52185428;
//         NextofKIN: Record 52185701;
//         BBFEnt: Text;
//         BBFEntitlement: Record 52185852;
//         MembersDOB: Text;
//         PrintedBy: Code[50];
//         PrintedAt: Text;
// }
