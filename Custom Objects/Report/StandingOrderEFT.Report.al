// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185652 "Standing Order EFT"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Standing Order EFT.rdlc';

//     dataset
//     {
//         dataitem("EFT Transfer Header";"EFT Transfer Header")
//         {
//             RequestFilterFields = "Document No. Filter","Date Filter";
//             column(ReportForNavId_1; 1)
//             {
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 STORegister.Reset;
//                 if "EFT Transfer Header".GetFilter("EFT Transfer Header"."Date Filter") <> '' then
//                 STORegister.SetFilter(STORegister."Date Processed","EFT Transfer Header".GetFilter("EFT Transfer Header"."Date Filter"));
//                 if "EFT Transfer Header".GetFilter("EFT Transfer Header"."Document No. Filter") <> '' then
//                 STORegister.SetFilter(STORegister."Document No.","EFT Transfer Header".GetFilter("EFT Transfer Header"."Document No. Filter"));
//                 STORegister.SetRange(STORegister.EFT,true);
//                 STORegister.SetRange(STORegister."Deduction Status",STORegister."deduction status"::Successful);
//                 STORegister.SetRange(STORegister."Transfered to EFT",false);
//                 if STORegister.Find('-') then begin
//                 repeat

//                 EFTDetails.Init;
//                 EFTDetails.No:='';
//                 EFTDetails."Document No.":="EFT Transfer Header"."No.";
//                 EFTDetails."Account Type":=EFTDetails."account type"::Savings;
//                 EFTDetails."Account No.":=STORegister."Source Account No.";
//                 EFTDetails.Amount:=STORegister.Amount;//"Amount Deducted";

//                 STOlines.Reset;
//                 STOlines.SetRange(STOlines."Document No.",STORegister."Document No.");
//                 if STOlines.Find('-') then begin
//                   EFTDetails."External Account No.":=STOlines."Destination Account No.";
//                  EFTDetails."External Account No.":=STOlines."Bank Account No.";
//                  EFTDetails."Bank Code":=STOlines."Bank Code";
//                   EFTDetails."External Account Name":=STOlines."Destination Account Name";
//                   end;

//                 EFTDetails."Standing Order No":=STORegister."Document No.";//"Standing Order No.";
//                 EFTDetails."Standing Order Register No":=STORegister."No.";
//                 if EFTDetails.Amount > 0 then
//                 EFTDetails.Insert(true);


//                 EFTDetails.Reset;
//                 EFTDetails.SetRange(EFTDetails."Document No.","No.");
//                 if EFTDetails.Find('-') then begin
//                   EFTDetails.Validate(EFTDetails."Account No.");
//                   EFTDetails.Validate(EFTDetails."Bank Code");
//                   EFTDetails.Validate(EFTDetails.Amount);
//                   EFTDetails.Modify;
//                   end;


//                 until STORegister.Next = 0
//                 end;

//                 "EFT Transfer Header"."Standing Order EFT Done":=true;
//                 // UnknownTable52185715.Modify;
//             end;

//             trigger OnPostDataItem()
//             begin

//                 Message('The EFT Batch has been Completed sucessfully');
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
//         STORegister: Record 52185719;
//         EFTDetails: Record 52185716;
//         STOlines: Record 52185718;
// }
