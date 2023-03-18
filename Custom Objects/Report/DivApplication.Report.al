#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52186004 "Div Application"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Div Application.rdlc';

    dataset
    {
        dataitem(Members;Members)
        {
            DataItemTableView = where(Status=const(Active),"Dividend Action"=const(Pay));
            RequestFilterFields = "No.";
            column(ReportForNavId_1; 1)
            {
            }
            column(No_Members;Members."No.")
            {
            }
            column(Name_Members;Members.Name)
            {
            }
            column(IDNo_Members;Members."ID No.")
            {
            }
            column(PrintedBy;PrintedBy)
            {
            }
            column(PrintedAt;PrintedAt)
            {
            }
            column(MembersDOB;MembersDOB)
            {
            }
            column(CurrentLoans;CurrentLoans)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CurrentLoans := 0;
                ProductFactory.Get('136');
                Loans.Reset;
                Loans.SetRange("Member No.",Members."No.");
                Loans.SetRange("Loan Product Type",'136');
                Loans.SetFilter("Disbursement Date",'>=%1',ProductFactory."DAdvance Limit Period");
                Loans.SetFilter("Outstanding Balance",'>0');
                if Loans.FindFirst then begin
                  CurrentLoans := Loans.Count;
                  if CurrentLoans < NoOfLoans then CurrReport.Skip;
                end else CurrReport.Skip;
            end;

            trigger OnPreDataItem()
            begin
                PrintedBy := CopyStr(UserId,StrPos(UserId,'\')+1,StrLen(UserId));
                // PrintedAt := SkyHarambeePortal.FormatDateTimeReverse(CurrentDatetime);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Number Of Loans";NoOfLoans)
                {
                    ApplicationArea = Basic;
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
        DateOfBirth: Text;
        //SkyHarambeePortal: Codeunit 52185428;
        NextofKIN: Record 52185701;
        BBFEnt: Text;
        BBFEntitlement: Record 52185852;
        MembersDOB: Text;
        PrintedBy: Code[50];
        PrintedAt: Text;
        Loans: Record 52185729;
        GeneralSetUp: Record 52185689;
        ProductFactory: Record 52185690;
        NoOfLoans: Integer;
        CurrentLoans: Integer;
}
