// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Member Statement.rdlc';

//     dataset
//     {
//         dataitem(Members; UnknownTable52185700)
//         {
//             RequestFilterFields = "No.";
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
//             column(No_Members; Members."No.")
//             {
//             }
//             column(Name_Members; Members.Name)
//             {
//             }
//             column(IDNumber_Members; Members."ID No.")
//             {
//             }
//             column(MobilePhoneNo_Members; Members."Mobile Phone No")
//             {
//             }
//             column(County_Members; Members.County)
//             {
//             }
//             column(EMail_Members; Members."E-Mail")
//             {
//             }
//             column(PayrollStaffNo_Members; Members."Payroll/Staff No.")
//             {
//             }
//             dataitem(SavingsAccounts; "Savings Accounts")
//             {
//                 DataItemLink = "Member No." = field("No."), "Date Filter" = field("Date Filter");
//                 DataItemTableView = sorting("No.");
//                 column(ReportForNavId_2; 2)
//                 {
//                 }
//                 column(No_SavingsAccounts; SavingsAccounts."No.")
//                 {
//                 }
//                 column(Name_SavingsAccounts; SavingsAccounts.Name)
//                 {
//                 }
//                 column(MemberNo_SavingsAccounts; SavingsAccounts."Member No.")
//                 {
//                 }
//                 column(SavingsAccountName; SavingsAccountName)
//                 {
//                 }
//                 column(BalanceBF; BalanceBF)
//                 {
//                 }
//                 dataitem(SavingsLedgerEntry; UnknownTable52185732)
//                 {
//                     DataItemLink = "Customer No." = field("No."), "Posting Date" = field("Date Filter");
//                     DataItemTableView = sorting("Customer No.", "Posting Date", "Currency Code.");
//                     column(ReportForNavId_3; 3)
//                     {
//                     }
//                     column(MemberNo_SavingsLedgerEntry; SavingsLedgerEntry."Member No.")
//                     {
//                     }
//                     column(CustomerNo_SavingsLedgerEntry; SavingsLedgerEntry."Customer No.")
//                     {
//                     }
//                     column(PostingDate_SavingsLedgerEntry; SavingsLedgerEntry."Posting Date")
//                     {
//                     }
//                     column(DocumentNo_SavingsLedgerEntry; SavingsLedgerEntry."Document No.")
//                     {
//                     }
//                     column(Description_SavingsLedgerEntry; SavingsLedgerEntry.Description)
//                     {
//                     }
//                     column(DebitAmountLCY_SavingsLedgerEntry; SavingsLedgerEntry."Debit Amount (LCY)")
//                     {
//                     }
//                     column(CreditAmountLCY_SavingsLedgerEntry; SavingsLedgerEntry."Credit Amount (LCY)")
//                     {
//                     }
//                     column(AmountLCY_SavingsLedgerEntry; SavingsLedgerEntry."Amount (LCY)")
//                     {
//                     }
//                     column(SavingsAccountRunBal; SavingsAccountRunBal)
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     begin

//                         SavingsAccountRunBal += -SavingsLedgerEntry."Amount (LCY)";
//                     end;

//                     trigger OnPreDataItem()
//                     begin
//                         SavingsAccountRunBal := 0;
//                     end;
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     if (StartDate <> 0D) and (EndDate <> 0D) then begin
//                         SavingsAccounts.SetRange(SavingsAccounts."Date Filter", 0D, CalcDate('-1D', StartDate));
//                         SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
//                         BalanceBF := SavingsAccounts."Balance (LCY)";

//                         SavingsAccounts.SetRange(SavingsAccounts."Date Filter", StartDate, EndDate);
//                         SavingsAccountName := SavingsAccounts."Product Type" + '-' + SavingsAccounts."Product Name";
//                         SavingsAccountRunBal := BalanceBF;
//                     end else
//                         SavingsAccountRunBal := 0;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     SavingsAccountName := '';
//                     BalanceBF := 0;
//                 end;
//             }
//             dataitem(CreditAccounts; "Agent Applications")
//             {
//                 DataItemLink = "Member No." = field("No."), "Date Filter" = field("Date Filter");
//                 DataItemTableView = sorting("No.");
//                 column(ReportForNavId_37; 37)
//                 {
//                 }
//                 column(No_CreditAccounts; CreditAccounts."No.")
//                 {
//                 }
//                 column(Name_CreditAccounts; CreditAccounts.Name)
//                 {
//                 }
//                 column(MemberNo_CreditAccounts; CreditAccounts."Member No.")
//                 {
//                 }
//                 column(CreditAccountName; CreditAccountName)
//                 {
//                 }
//                 dataitem(CreditLedgerEntry; UnknownTable52185733)
//                 {
//                     DataItemLink = "Customer No." = field("No."), "Posting Date" = field("Date Filter");
//                     DataItemTableView = sorting("Customer No.", "Posting Date", "Currency Code");
//                     column(ReportForNavId_32; 32)
//                     {
//                     }
//                     column(MemberNo_CreditLedgerEntry; CreditLedgerEntry."Member No.")
//                     {
//                     }
//                     column(CustomerNo_CreditLedgerEntry; CreditLedgerEntry."Customer No.")
//                     {
//                     }
//                     column(PostingDate_CreditLedgerEntry; CreditLedgerEntry."Posting Date")
//                     {
//                     }
//                     column(DocumentNo_CreditLedgerEntry; CreditLedgerEntry."Document No.")
//                     {
//                     }
//                     column(Description_CreditLedgerEntry; CreditLedgerEntry.Description)
//                     {
//                     }
//                     column(SASRAStatus; CreditLedgerEntry."SASRA Loan Status")
//                     {
//                     }
//                     column(DebitAmountLCY_CreditLedgerEntry; CreditLedgerEntry."Debit Amount (LCY)")
//                     {
//                     }
//                     column(CreditAmountLCY_CreditLedgerEntry; CreditLedgerEntry."Credit Amount (LCY)")
//                     {
//                     }
//                     column(AmountLCY_CreditLedgerEntry; CreditLedgerEntry."Amount (LCY)")
//                     {
//                     }
//                     column(CreditAccountRunBal; CreditAccountRunBal)
//                     {
//                     }

//                     trigger OnAfterGetRecord()
//                     begin

//                         CreditAccountRunBal += CreditLedgerEntry."Amount (LCY)";
//                     end;

//                     trigger OnPreDataItem()
//                     begin
//                         CreditAccountRunBal := 0;
//                     end;
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     if (StartDate <> 0D) and (EndDate <> 0D) then begin
//                         CreditAccounts.SetRange(CreditAccounts."Date Filter", 0D, CalcDate('-1D', StartDate));
//                         CreditAccounts.CalcFields(CreditAccounts."Balance (LCY)");
//                         BalanceBF := CreditAccounts."Balance (LCY)";

//                         CreditAccounts.SetRange(CreditAccounts."Date Filter", StartDate, EndDate);
//                         CreditAccountName := CreditAccounts."Product Type" + '-' + CreditAccounts."Product Name";

//                         CreditAccountRunBal := BalanceBF;
//                     end else
//                         CreditAccountRunBal := 0;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     CreditAccountName := '';
//                     BalanceBF := 0;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 if StartDate = 0D then StartDate := 20900101D;
//                 if EndDate = 0D then EndDate := Today;
//             end;
//         }
//     }

//     requestpage
//     {

//         layout
//         {
//             area(content)
//             {
//                 group("Date Filter")
//                 {
//                     field("Start Date:"; StartDate)
//                     {
//                         ApplicationArea = Basic;
//                     }
//                     field("End Date:"; EndDate)
//                     {
//                         ApplicationArea = Basic;
//                     }
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

//     trigger OnPreReport()
//     begin
//         if CompanyInformation.Get then
//             CompanyInformation.CalcFields(CompanyInformation.Picture);
//         CompanyAddress := CompanyInformation.Address + ' -Post Code: ' + CompanyInformation."Post Code" + ' -City:' + CompanyInformation.City + ' Region: ' + CompanyInformation."Country/Region Code";
//         CompanyTelephone := 'Tel: ' + CompanyInformation."Phone No." + ' -Office Tel: ' + CompanyInformation."Phone No. 2";
//         CommunicationOnline := 'E-mail: ' + CompanyInformation."E-Mail" + '- Website: ' + CompanyInformation."Home Page";
//     end;

//     var
//         BalanceBF: Decimal;
//         SavingsAccountName: Text;
//         SavingsAccountRunBal: Decimal;
//         CreditAccountName: Text;
//         CreditAccountRunBal: Decimal;
//         CompanyInformation: Record "Company Information";
//         CompanyAddress: Text;
//         CompanyTelephone: Text;
//         CommunicationOnline: Text;
//         StartDate: Date;
//         EndDate: Date;
// }
