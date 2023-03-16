#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185761 "EFT Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/EFT Report.rdlc';

    dataset
    {
        dataitem("EFT Transfer Header";"EFT Transfer Header")
        {
            RequestFilterFields = "No.","Date Transferred",Status;
            column(ReportForNavId_26; 26)
            {
            }
            column(EFTTransferHeader_RecordTotal;"EFT Transfer Header"."Record Total")
            {
            }
            column(EFTTransferHeader_CreatedBy;"EFT Transfer Header"."Created By")
            {
            }
            dataitem("EFT Transfer Lines";"EFT Transfer Lines")
            {
                DataItemLink = "Document No."=field("No.");
                column(ReportForNavId_1; 1)
                {
                }
                column(EntryNo_EFTTransferLines;sno)
                {
                }
                column(CompanyName;CompanyInformation.Name)
                {
                }
                column(Picture;CompanyInformation.Picture)
                {
                }
                column(CompPhone;CompanyInformation."Phone No.")
                {
                }
                column(DocumentNo_EFTTransferLines;"EFT Transfer Lines"."Document No.")
                {
                }
                column(EnteredBy_EFTTransferLines;"EFT Transfer Lines"."Entered By")
                {
                }
                column(AccountType_EFTTransferLines;"EFT Transfer Lines"."Account Type")
                {
                }
                column(AccountNo_EFTTransferLines;"EFT Transfer Lines"."Account No.")
                {
                }
                column(AccountName_EFTTransferLines;"EFT Transfer Lines"."Account Name")
                {
                }
                column(MemberNo_EFTTransferLines;"EFT Transfer Lines"."Member No.")
                {
                }
                column(ExternalAccountName_EFTTransferLines;"EFT Transfer Lines"."External Account Name")
                {
                }
                column(ChargeAmount_EFTTransferLines;"EFT Transfer Lines"."Charge Amount")
                {
                }
                column(DontCharge_EFTTransferLines;"EFT Transfer Lines"."Don't Charge")
                {
                }
                column(PhoneNo_EFTTransferLines;"EFT Transfer Lines"."Phone No.")
                {
                }
                column(Amount_EFTTransferLines;"EFT Transfer Lines".Amount)
                {
                }
                column(AmountText_EFTTransferLines;"EFT Transfer Lines"."Amount Text")
                {
                }
                column(BankCode_EFTTransferLines;"EFT Transfer Lines"."Bank Code")
                {
                }
                column(BranchCode_EFTTransferLines;"EFT Transfer Lines"."Branch Code")
                {
                }
                column(BankName_EFTTransferLines;"EFT Transfer Lines"."Bank Name")
                {
                }
                column(OverDrawn_EFTTransferLines;"EFT Transfer Lines"."Over Drawn")
                {
                }
                column(StandingOrderNo_EFTTransferLines;"EFT Transfer Lines"."Standing Order No")
                {
                }
                column(StandingOrderRegisterNo_EFTTransferLines;"EFT Transfer Lines"."Standing Order Register No")
                {
                }
                column(NotAvailable_EFTTransferLines;"EFT Transfer Lines"."Not Available")
                {
                }
                column(ChargeAccount_EFTTransferLines;"EFT Transfer Lines"."Charge Account")
                {
                }
                column(Transferred_EFTTransferLines;Trans)
                {
                }
                column(ExportFormat_EFTTransferLines;"EFT Transfer Lines".ExportFormat)
                {
                }
                column(ExternalAccountNo_EFTTransferLines;"EFT Transfer Lines"."External Account No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    CompanyInformation.Get();
                    CompanyInformation.CalcFields(CompanyInformation.Picture);
                    if "EFT Transfer Lines".Transferred=true then
                      Trans:='Yes' else
                      Trans:='No';
                    sno+=1;
                end;
            }
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
        EFTTransferLines: Record 52185716;
        Multiple: Boolean;
        Mycount: Integer;
        CompanyInformation: Record "Company Information";
        Trans: Text;
}
