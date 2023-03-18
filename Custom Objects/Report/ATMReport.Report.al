#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185753 "ATM Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/ATM Report.rdlc';

    dataset
    {
        dataitem("ATM Applications"; "ATM Applications")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(CompanyName; CompanyInformation.Name)
            {
            }
            column(Picture; CompanyInformation.Picture)
            {
            }
            column(SNO; sno)
            {
            }
            column(ATMApplicationNo; "ATM Applications"."No.")
            {
            }
            column(AccountNo; "ATM Applications"."Account No")
            {
            }
            column(BranchCode; "ATM Applications"."Branch Code")
            {
            }
            column(AccountTyp; "ATM Applications"."Account Type")
            {
            }
            column(AccountName; "ATM Applications"."Account Name")
            {
            }
            column(Address; "ATM Applications".Address)
            {
            }
            column(CustomerId; "ATM Applications"."Customer ID")
            {
            }
            column(RelationIndicator_ATMApplications; "ATM Applications"."Relation Indicator")
            {
            }
            column(CardType; "ATM Applications"."Card Type")
            {
            }
            column(RequestType; "ATM Applications"."Request Type")
            {
            }
            column(ApplicationDate; "ATM Applications"."Application Date")
            {
            }
            column(CardNo; "ATM Applications"."Card No")
            {
            }
            column(DateIssued; "ATM Applications"."Date Issued")
            {
            }
            column(Limit_ATMApplications; "ATM Applications".Limit)
            {
            }
            column(TermsReadandUnderstood_ATMApplications; "ATM Applications"."Terms Read and Understood")
            {
            }
            column(CardIssued; "ATM Applications"."Card Issued")
            {
            }
            column(FormNo; "ATM Applications"."Form No")
            {
            }
            column(SentToExternalFile_ATMApplications; "ATM Applications"."Sent To External File")
            {
            }
            column(CardStatus; "ATM Applications"."Card Status")
            {
            }
            column(DateActivated; "ATM Applications"."Date Activated")
            {
            }
            column(DateFrozen; "ATM Applications"."Date Frozen")
            {
            }
            column(ReplacementForCardNo; "ATM Applications"."Replacement For Card No")
            {
            }
            column(PhoneNo; "ATM Applications"."Phone No.")
            {
            }
            column(Collected; "ATM Applications".Collected)
            {
            }
            column(DateCollected; "ATM Applications"."Date Collected")
            {
            }
            column(CardIssuedBy; "ATM Applications"."Card Issued By")
            {
            }
            column(Status; "ATM Applications".Status)
            {
            }
            column(CardExpiryDate; "ATM Applications"."Card Expiry Date")
            {
            }
            column(ResponsibilityCenter; "ATM Applications"."Responsibility Center")
            {
            }
            column(ShortcutDimension1Code; "ATM Applications"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code; "ATM Applications"."Shortcut Dimension 2 Code")
            {
            }
            column(CardIssuedDate_ATMApplications; "ATM Applications"."Card Issued Date")
            {
            }
            column(PINIssuedDate; "ATM Applications"."PIN Issued Date")
            {
            }
            column(PINIssuedBy; "ATM Applications"."PIN Issued By")
            {
            }
            column(LinkedDate; "ATM Applications"."Linked Date")
            {
            }
            column(ATMLinked; "ATM Applications"."ATM Linked")
            {
            }
            column(PINIssued; "ATM Applications"."PIN Issued")
            {
            }
            column(LinkedBy; "ATM Applications"."Linked By")
            {
            }
            column(DelinkedBy; "ATM Applications"."Delinked By")
            {
            }
            column(ATMDelinked; "ATM Applications"."ATM Delinked")
            {
            }
            column(ATMDelinkedDate; "ATM Applications"."ATM Delinked Date")
            {
            }

            trigger OnAfterGetRecord()
            begin
                sno += 1;
            end;

            trigger OnPreDataItem()
            begin
                CompanyInformation.Get();
                CompanyInformation.CalcFields(CompanyInformation.Picture);
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
        sno: Integer;
        CompanyInformation: Record "Company Information";
}
