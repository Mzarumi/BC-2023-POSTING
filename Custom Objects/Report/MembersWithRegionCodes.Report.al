// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52186020 "Members With Region Codes"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Members With Region Codes.rdlc';

//     dataset
//     {
// Members        {
//             DataItemTableView = where("Region Code"=filter(<>""));
//             RequestFilterFields = "No.";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(PrintedBy;PrintedBy)
//             {
//             }
//             column(PrintedAt;PrintedAt)
//             {
//             }
//             column(RegionCode_Members;Members."Region Code")
//             {
//             }
//             column(No_Members;Members."No.")
//             {
//             }
//             column(Name_Members;Members.Name)
//             {
//             }
//             trigger OnAfterGetRecord()
//             begin
//                 if RemoveCode then begin
//                   Members."Region Code" := '';
//                   Members.Modify;
//                 end;
//             end;

//             trigger OnPostDataItem()
//             begin
//                 if RemoveCode then
//                   Message('UPDATE COMPLETE');
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 field("Remove Region Code";RemoveCode)
//                 {
//                     ApplicationArea = Basic;
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

//     trigger OnInitReport()
//     begin
//         PrintedBy := CopyStr(UserId,StrPos(UserId,'\')+1,StrLen(UserId));
//         PrintedAt := SkyHarambeePortal.FormatDateTimeReverse(CurrentDatetime);
//     end;

//     var
//         PrintedBy: Code[50];
//         PrintedAt: Text;
//         // SkyHarambeePortal: Codeunit 52185428;
//         RemoveCode: Boolean;
// }
