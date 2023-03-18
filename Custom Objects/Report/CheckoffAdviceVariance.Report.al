#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185653 "Checkoff Advice Variance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Checkoff Advice Variance.rdlc';

    dataset
    {
        dataitem("Checkoff Advice Header"; "Checkoff Advice Header")
        {
            RequestFilterFields = "No.";
            column(ReportForNavId_2; 2)
            {
            }
            // column(PeriodDate; PeriodDate)
            // {
            // }
            dataitem("Checkoff Advice Line"; "Checkoff Advice Line")
            {
                DataItemLink = "Advice Header No." = field("No.");
                RequestFilterFields = "Employer Code", "Document No. Filter";
                column(ReportForNavId_1; 1)
                {
                }
                column(MemberNo; "Checkoff Advice Line"."Member No.")
                {
                }
                column(PayrollNo; "Checkoff Advice Line"."Payroll No")
                {
                }
                column(Name; Name)
                {
                }
                column(Amount; "Checkoff Advice Line"."Amount On")
                {
                }
                column(Interest; "Checkoff Advice Line".Interest)
                {
                }
                column(ProductFactory; "Checkoff Advice Line"."Product Search Code")
                {
                }
                column(CompanyName; Company.Name)
                {
                }
                column(CompanyAddress; Company.Address)
                {
                }
                column(ComapnyPicture; Company.Picture)
                {
                }
                column(Period; "Checkoff Advice Header".Period)
                {
                }
                column(EmployerName; "Checkoff Advice Header"."Employer Name")
                {
                }
                column(PostedInterest; PostedInterest)
                {
                }
                column(PostedAmount; PostedAmount)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if Members.Get("Checkoff Advice Line"."Member No.") then begin

                        Loans.Reset;
                        Loans.SetRange("Loan No.", "Checkoff Advice Line"."Loan No.");
                        Loans.SetFilter("Document No. Filter", "Checkoff Advice Line".GetFilter("Checkoff Advice Line"."Document No. Filter"));
                        if Loans.Find('-') then begin
                            Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                            PostedAmount := Loans."Outstanding Balance";
                            PostedInterest := Loans."Outstanding Interest";
                        end;

                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange("No.", "Checkoff Advice Line"."Account No.");
                        SavingsAccounts.SetFilter("Document No. Filter", "Checkoff Advice Line".GetFilter("Checkoff Advice Line"."Document No. Filter"));
                        if SavingsAccounts.Find('-') then begin
                            SavingsAccounts.CalcFields("Balance (LCY)", "Debit Amount (LCY)", "Credit Amount (LCY)");
                            PostedAmount := SavingsAccounts."Credit Amount (LCY)";
                            PostedInterest := 0;
                        end;
                        CheckoffAdviceLine.Reset;
                        CheckoffAdviceLine.SetCurrentkey("Member No.");
                        CheckoffAdviceLine.SetRange("Advice Header No.", "Checkoff Advice Header"."No.");
                        CheckoffAdviceLine.SetRange("Member No.", Members."No.");
                        if CheckoffAdviceLine.Find('-') then begin
                            repeat
                                MemberNo := CheckoffAdviceLine."Member No.";
                                Name := CheckoffAdviceLine.Names;
                            until CheckoffAdviceLine.Next = 0;
                        end;
                    end;
                    //IF Turn=2 THEN CurrReport.SKIP
                end;

                trigger OnPreDataItem()
                begin
                    i := 1;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                PeriodDate := Format("Checkoff Advice Header"."Start Date") + '..' + Format("Checkoff Advice Header"."End Date");
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        Company.Get;
        Company.CalcFields(Picture);
    end;

    var
        ProductFactory: Record 52185690;
        Loans: Record 52185729;
        Members: Record "Members";
        ClolumHeader: Code[10];
        ColumnValue: Decimal;
        MemberNo: Code[10];
        PayrollNo: Code[10];
        Name: Text;
        Interest: Decimal;
        Amount: Decimal;
        CheckoffAdviceLine: Record 52185818;
        Turn: Integer;
        CulumnA: array[50] of Code[10];
        Company: Record "Company Information";
        i: Integer;
        PeriodDate: Text;
        CreditAccounts: Record 52185731;
        SavingsAccounts: Record 52185730;
        PostedAmount: Decimal;
        PostedInterest: Decimal;
}
