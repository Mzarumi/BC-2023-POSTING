#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185958 "Loan Movement Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Loan Movement Summary.rdlc';

    dataset
    {
        dataitem("Product Factory";"Product Factory")
        {
            DataItemTableView = where("Product Class Type"=const(Loan));
            column(ReportForNavId_1; 1)
            {
            }
            column(Loan_Type;"Product Factory"."Product ID")
            {
            }
            column(Loan_Type_Desciption;"Product Factory"."Product Description")
            {
            }
            column(Start;StartDate)
            {
            }
            column("End";EndDate)
            {
            }
            column(Int_Paid;TotalIntPaid)
            {
            }
            column(Princ_Paid;totalPrincPaid)
            {
            }
            column(Total_Approved;TotalApproved)
            {
            }
            column(Company_Name;Company.Name)
            {
            }
            column(Company_Picture;Company.Picture)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TotalApproved:=0;
                TotalIntPaid:=0;
                totalPrincPaid:=0;

                Loans.Reset;
                Loans.SetRange("Loan Product Type","Product Factory"."Product ID");
                Loans.SetRange("Approval Date",StartDate,EndDate);
                Loans.SetRange(Posted,true);
                if Loans.Find('-') then begin
                  repeat
                    TotalApproved+=Loans."Approved Amount";
                  until Loans.Next=0;
                end;

                Loans.Reset;
                Loans.SetRange("Loan Product Type","Product Factory"."Product ID");
                Loans.SetFilter("Date Filter",'%1..%2',StartDate,EndDate);
                Loans.SetRange(Posted,true);
                if Loans.Find('-') then begin
                  repeat
                    Loans.CalcFields("Interest Paid","Principle Paid","Outstanding Balance","Outstanding Interest");
                    //TotalApproved+=Loans."Approved Amount";
                    TotalIntPaid+=Abs(Loans."Interest Paid");
                    totalPrincPaid+=Abs(Loans."Principle Paid");
                  until Loans.Next=0;

                end;
            end;

            trigger OnPreDataItem()
            begin
                if StartDate=0D then Error('Kindly set the start date');
                if EndDate=0D then Error('Kindly set the end date');
                Company.Get;
                Company.CalcFields(Picture);
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                field(StartDate;StartDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Start Date';
                }
                field(EndDate;EndDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'End Date';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Loans: Record 52185729;
        StartDate: Date;
        EndDate: Date;
        TotalApproved: Decimal;
        TotalIntPaid: Decimal;
        totalPrincPaid: Decimal;
        Company: Record "Company Information";
}
