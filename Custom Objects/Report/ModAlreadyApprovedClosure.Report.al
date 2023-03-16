// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185443 "Mod Already Approved Closure"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Mod Already Approved Closure.rdlc';

//     dataset
//     {
//         //dataitem(52185824;52185824)
//         {
//             DataItemTableView = where(Status=const(Pending),"Closing Date"=const("05/10/18"));
//             RequestFilterFields = "No.";
//             column(ReportForNavId_1; 1)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin

//                 ApprovalENt.Reset;
//                 ApprovalENt.SetRange(ApprovalENt."Record ID to Approve","Membership closure".RecordId);
//                 ApprovalENt.SetRange(ApprovalENt.Status,ApprovalENt.Status::Approved);
//                 //ApprovalENt.SETRANGE(ApprovalENt."Due Date",20180510D);
//                 if ApprovalENt.Find('-') then begin
//                   "Membership closure".Status:="Membership closure".Status::Approved;
//                  "Membership closure".Modify;
//                  // MESSAGE('the record id to approve is %1',ApprovalENt."Record ID to Approve")
//                   end;
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
//         ApprovalENt: Record "Approval Entry";
// }
