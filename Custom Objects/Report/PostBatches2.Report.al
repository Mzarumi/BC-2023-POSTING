// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185428 PostBatches2
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/PostBatches2.rdlc';

//     dataset
//     {
//         dataitem("Gen. Journal Line 3"; "Gen. Journal Line 3")
//         {
//             DataItemTableView = where(Posted = const(No));
//             column(ReportForNavId_1; 1)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin

//                 GenJnl.Init;
//                 GenJnl."Journal Template Name" := 'GENERAL';
//                 GenJnl."Journal Batch Name" := 'OPENING';
//                 GenJnl."Line No." := GenJnl."Line No." + 1000;
//                 GenJnl."Account Type" := "Gen. Journal Line 3"."Account Type";
//                 GenJnl."Document No." := "Gen. Journal Line 3"."Document No.";
//                 GenJnl."Posting Date" := "Gen. Journal Line 3"."Posting Date";
//                 GenJnl."Account No." := "Gen. Journal Line 3"."Account No.";
//                 GenJnl.Validate(GenJnl."Account No.");
//                 GenJnl.Description := "Gen. Journal Line 3".Description;
//                 GenJnl.Amount := "Gen. Journal Line 3".Amount;
//                 GenJnl.Validate(GenJnl.Amount);
//                 GenJnl."Bal. Account Type" := "Gen. Journal Line 3"."Bal. Account Type";
//                 GenJnl."Bal. Account No." := "Gen. Journal Line 3"."Bal. Account No.";
//                 GenJnl.Validate(GenJnl."Bal. Account No.");
//                 GenJnl."Loan No" := "Gen. Journal Line 3"."Loan No";
//                 GenJnl."Transaction Type" := "Gen. Journal Line 3"."Transaction Type";
//                 GenJnl."Group Code" := "Gen. Journal Line 3"."Group Code";
//                 GenJnl."Applies-to Doc. No." := "Gen. Journal Line 3"."Applies-to Doc. No.";
//                 GenJnl."External Document No." := "Gen. Journal Line 3"."External Document No.";
//                 GenJnl.Validate(GenJnl."Applies-to Doc. No.");
//                 GenJnl."Document Type" := "Gen. Journal Line 3"."Document Type";
//                 GenJnl."Currency Code" := "Gen. Journal Line 3"."Currency Code";
//                 GenJnl."Shortcut Dimension 1 Code" := "Gen. Journal Line 3"."Shortcut Dimension 1 Code";
//                 GenJnl."Shortcut Dimension 2 Code" := "Gen. Journal Line 3"."Shortcut Dimension 2 Code";
//                 GenJnl.Validate(GenJnl."Shortcut Dimension 1 Code");
//                 GenJnl.Validate(GenJnl."Shortcut Dimension 2 Code");
//                 GenJnl.Validate(GenJnl."Currency Code");
//                 GenJnl."Applies-to Doc. Type" := "Gen. Journal Line 3"."Applies-to Doc. Type";
//                 if GenJnl.Amount <> 0 then
//                     GenJnl.Insert;

//                 GenJnl.Reset;
//                 GenJnl.SetRange(GenJnl."Journal Template Name", 'GENERAL');
//                 GenJnl.SetRange(GenJnl."Journal Batch Name", 'OPENING');
//                 Codeunit.Run(Codeunit::"Gen. Jnl.-Post New", GenJnl);
//                 "Gen. Journal Line 3".Posted := true;
//                 "Gen. Journal Line 3".Modify;
//                 Commit;
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
//         GenJnl: Record "Gen. Journal Line";
// }
