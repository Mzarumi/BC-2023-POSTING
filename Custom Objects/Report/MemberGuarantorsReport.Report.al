
// /*
// Report 52185915 "Member Guarantors Report"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Layouts/Member Guarantors Report.rdlc';

//     dataset
//     {
//         dataitem(Loans; Loans)
//         {
//             //DataItemTableView = where(Posted = filter(Yes), Repayment = filter(<> 0));
//             RequestFilterFields = "Loan No.", Repayment, "Application Date", "Loan Product Type", "Member No.", "Disbursement Date", Status, "Outstanding Balance", "Date Filter";
//             column(ReportForNavId_1; 1)
//             {
//             }
//             column(Loan_No; Loans."Loan No.")
//             {
//             }
//             column(Member_No; Loans."Member No.")
//             {
//             }
//             column(Mmember_name; Loans."Member Name")
//             {
//             }
//             column(Loan_Type; Loans."Loan Product Type")
//             {
//             }
//             column(Loan_TypeName; Loans."Loan Product Type Name")
//             {
//             }
//             column(Approved_amount; Loans."Approved Amount")
//             {
//             }
//             column(Amount_Paid; AmountPaid)
//             {
//             }
//             column(Outstanding_Balance; Loans."Outstanding Balance")
//             {
//             }
//             column(Outstanding_Interest; Loans."Outstanding Interest")
//             {
//             }
//             column(Arrears; Arreas)
//             {
//             }
//             column(Days_Defaulted; Days_Defaulted)
//             {
//             }
//             column(LastPayDate; LastPayDate)
//             {
//             }
//             column(Monthly_installements; Loans.Repayment)
//             {
//             }
//             column(Date_Issued; Loans."Disbursement Date")
//             {
//             }
//             column(With_Effect_from; Loans."Repayment Start Date")
//             {
//             }
//             column(Expiry_Date; Loans."Expected Date of Completion")
//             {
//             }
//             column(Loans_Category; Loans."Loans Category-SASRA")
//             {
//             }
//             column(Picture; Company.Picture)
//             {
//             }
//             column(Address; Company.Address)
//             {
//             }
//             column(Staff_No; Loans."Staff No")
//             {
//             }
//             column(Company_Name; Company.Name)
//             {
//             }
//             column(LoaneePhone; LoaneePhone)
//             {
//             }
//             column(IDNo; IDNo)
//             {
//             }
//             column(Loan_Account; Loans."Loan Account")
//             {
//             }
//             column(LoaneePhysical_Addr; LoaneeAddress)
//             {
//             }
//             column(Loanee_Email; LoaneeEmail)
//             {
//             }
//             column(Employer_Address; EmployerAddress)
//             {
//             }
//             column(Loanee_Postal; LoaneePostal)
//             {
//             }
//             column(Branch; LoaneeBranch)
//             {
//             }
//             column(Employer_Code; EmployerCode)
//             {
//             //     dataitem(LoanSecurity; UnknownTable52185739)
//             //     {
//             //         //DataItemLink = "Loan No" = field("Loan No.");
//             //         column(ReportForNavId_18; 18)
//             //         {
//             //         }
//             //         // column(Guar_Name; LoanSecurity.Name)
//             //         // {
//             //         // }
//             //         column(guar_phonenumber; GuarPhone)
//             //         {
//             //         }
//             //         column(Guar_email; GuarEmail)
//             //         {
//             //         }
//             //         column(Guar_Address; GuarAddress)
//             //         {
//             //         }
//             //         // column(Guar_No; LoanSecurity."Member No")
//             //         // {
//             //         // }
//             //         column(Guar_PFNo; GuarPFNO)
//             //         {
//             //         }

//             //         trigger OnAfterGetRecord()
//             //         begin
//             //             GuarEmail := '';
//             //             GuarPhone := '';
//             //             GuarAddress := '';

//             //             Members.Reset;
//             //             Members.SetRange("No.", LoanSecurity."Member No");
//             //             if Members.Find('-') then begin
//             //                 GuarEmail := Members."E-Mail";
//             //                 GuarPhone := Members."Mobile Phone No";
//             //                 GuarAddress := Members."Current Address";
//             //                 GuarPFNO := Members."Payroll/Staff No.";
//             //             end
//             //         end;
//             //     }

//             //     trigger OnAfterGetRecord()
//             //     begin
//             //         AmountPaid := 0;
//             //         Arreas := 0;
//             //         LastPayDate := 0D;
//             //         IDNo := '';
//             //         LoaneePhone := '';
//             //         LoaneeAddress := '';
//             //         LoaneePostal := '';
//             //         LoaneeEmail := '';
//             //         LoaneeBranch := '';
//             //         EmployerCode := '';
//             //         EmployerAddress := '';

//             //         Members.Reset;
//             //         Members.SetRange("No.", Loans."Member No.");
//             //         if Members.Find('-') then begin
//             //             IDNo := Members."ID No.";
//             //             LoaneePhone := Members."Mobile Phone No";
//             //             LoaneeAddress := Members."Current Address";
//             //             LoaneePostal := Members."Post Code";
//             //             LoaneeEmail := Members."E-Mail";
//             //             LoaneeBranch := Members."Global Dimension 2 Code";
//             //             EmployerCode := Members."Employer Code";
//             //             EmployerAddress := Members."Employer Name";
//             //         end
//             //     end;

//             //     trigger OnPreDataItem()
//             //     begin
//             //         Company.Get;
//             //         Company.CalcFields(Picture);
//             //     end;
//             // }
//             // }
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
//         AmountPaid: Decimal;
//         Arreas: Decimal;
//         Days_Defaulted: Integer;
//         LastPayDate: Date;
//         Members: Record "Members";
//         GuarEmail: Text;
//         GuarPhone: Code[15];
//         com: Integer;
//         Company: Record "Company Information";
//         CreditLedger: Record 52185733;
//         LoanGuara: Record 52185739;
//         IDNo: Code[10];
//         LoaneePhone: Code[15];
//         LoaneeAddress: Text;
//         LoaneeEmail: Text;
//         LoaneeBranch: Text;
//         EmployerAddress: Text;
//         LoaneePostal: Code[10];
//         GuarAddress: Text;
//         EmployerCode: Code[10];
//         GuarPFNO: Code[15];
// }
