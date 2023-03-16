// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Report 52185647 "Get Salary EFT"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Get Salary EFT.rdlc';

//     dataset
//     {
//         //dataitem("EFT Transfer Header";"EFT Transfer Header")
//         {
//             column(ReportForNavId_1; 1)
//             {
//             }
//             dataitem("Savings Accounts"; "Savings Accounts")
//             {
//                 CalcFields = Balance, "Uncleared Cheques", "Authorised Over Draft", "ATM Transactions", "Lien Placed";
//                 //DataItemTableView = sorting("No.") where("Product Category" = filter(" "), "Enable Sweeping" = const(Yes));
//                 //RequestFilterFields = "No.", "Date Filter", "Document No. Filter";
//                 column(ReportForNavId_2; 2)
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin

//                     AvailableBal := 0;
//                     MinBal := 0;
//                     SalaryDed := 0;
//                     SalaryEFTAmount := 0;

//                     if ProdTypes.Get("Savings Accounts"."Product Type") then begin
//                         MinBal := ProdTypes."Minimum Balance";


//                         AvailableBal := ("Savings Accounts".Balance + "Savings Accounts"."Authorised Over Draft") - ("Savings Accounts"."Uncleared Cheques"
//                                     + "Savings Accounts"."Lien Placed" + "Savings Accounts"."ATM Transactions" + MinBal + 275);
//                     end;
//                     //MESSAGE('The available balance is %1',AvailableBal);
//                     //Get the Deductions done on processing
//                     TransferAmnt := 0;

//                     SavingsAccount.Reset;
//                     SavingsAccount.SetRange(SavingsAccount."No.", "Savings Accounts"."No.");
//                     SavingsAccount.SetFilter(SavingsAccount."Document No. Filter", "Savings Accounts".GetFilter("Savings Accounts"."Document No. Filter"));
//                     SavingsAccount.SetFilter(SavingsAccount."Date Filter", "Savings Accounts".GetFilter("Savings Accounts"."Date Filter"));
//                     if SavingsAccount.Find('-') then begin
//                         //MESSAGE('Checked');
//                         SavingsAccount.CalcFields(SavingsAccount."Debit Amount (LCY)", SavingsAccount."Credit Amount (LCY)");
//                         SalaryDed := SavingsAccount."Debit Amount (LCY)" + MinBal;
//                         SalaryEFTAmount := SavingsAccount."Credit Amount (LCY)";
//                         TransferAmnt := SalaryEFTAmount - SalaryDed;
//                         //MESSAGE('The Deduction from the salary is %1 and the eft amount is %2 and transfer amount is%3',SalaryDed,SalaryEFTAmount,TransferAmnt);
//                     end;



//                     //IF ((SalaryEFTAmount-SalaryDed) - 100) > AvailableBal THEN
//                     //SalaryEFTAmount:=AvailableBal
//                     //ELSE
//                     //SalaryEFTAmount:=((SalaryEFTAmount-SalaryDed) - 100);

//                     //MESSAGE('The salary eft amount is %1',TransferAmnt);

//                     if TransferAmnt > 0 then begin

//                         if TransferAmnt > AvailableBal then
//                             TransferAmnt := AvailableBal else
//                             TransferAmnt := TransferAmnt;

//                         //IF TransferAmnt<AvailableBal THEN BEGIN

//                         //MESSAGE('The transfer amount is %1',TransferAmnt);

//                         EFTLines.Init;
//                         EFTLines.No := '';
//                         EFTLines."Document No." := "EFT Transfer Header"."No.";
//                         EFTLines."Account Type" := EFTLines."account type"::Savings;
//                         EFTLines."Account No." := "Savings Accounts"."No.";
//                         EFTLines."Account Name" := "Savings Accounts".Name;
//                         EFTLines."Member No." := "Savings Accounts"."Member No.";
//                         EFTLines.Amount := TransferAmnt;
//                         //EFTLines."Charge Amount":=250;
//                         //MESSAGE('The amount is %1',EFTLines.Amount);
//                         EFTLines."External Account No." := "Savings Accounts"."External Account No";
//                         //EFTLines."Branch Code":="Savings Accounts"."Bank Code";
//                         EFTLines."Bank Code" := "Savings Accounts"."Bank Code";
//                         EFTLines."External Account Name" := "Savings Accounts".Name;
//                         EFTLines.Insert(true);


//                         EFTLines.Reset;
//                         EFTLines.SetRange(EFTLines."Document No.", "EFT Transfer Header"."No.");
//                         EFTLines.SetRange(EFTLines."Account No.", "Savings Accounts"."No.");
//                         if EFTLines.Find('-') then begin
//                             EFTLines.Validate(EFTLines."Branch Code");
//                             EFTLines.Validate(EFTLines."Account No.");
//                             EFTLines.Validate(EFTLines.Amount);
//                             EFTLines.Modify;
//                         end;


//                         //END;
//                     end;
//                 end;

//                 trigger OnPostDataItem()
//                 begin

//                     Message('The EFT Batch has been Completed sucessfully');
//                 end;
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

//     var
//         ProdTypes: Record 52185690;
//         SavingsAccount: Record 52185730;
//         SalaryEFTAmount: Decimal;
//         SalaryDed: Decimal;
//         AvailableBal: Decimal;
//         EFTLines: Record 52185716;
//         MinBal: Decimal;
//         TransferAmnt: Decimal;
// }
