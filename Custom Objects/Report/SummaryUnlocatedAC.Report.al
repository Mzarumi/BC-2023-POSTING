#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185931 "Summary Unlocated A/C"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Summary Unlocated AC.rdlc';

    dataset
    {
        dataitem("Savings Accounts"; "Savings Accounts")
        {
            CalcFields = Balance;
            RequestFilterFields = "Product Type", Balance, Status;
            column(ReportForNavId_1; 1)
            {
            }
            column(MemName; "Savings Accounts".Name)
            {
            }
            column(Mem_No; "Savings Accounts"."Member No.")
            {
            }
            column(Employee_Code; "Savings Accounts"."Employer Code")
            {
            }
            column(Amount; "Savings Accounts"."Balance (LCY)")
            {
            }
            column(Comp_Name; company.Name)
            {
            }
            column(Comp_Pic; company.Picture)
            {
            }
            column(CustName; CustName)
            {
            }
            column(P_Name; "Savings Accounts"."Product Name")
            {
            }

            trigger OnAfterGetRecord()
            begin
                cust.Reset;
                cust.SetRange("No.", "Savings Accounts"."Employer Code");
                if cust.Find('-') then
                    CustName := cust.Name;
            end;

            trigger OnPreDataItem()
            begin
                company.Get;
                company.CalcFields(Picture);
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

    var
        company: Record "Company Information";
        cust: Record Customer;
        CustName: Text;
}
