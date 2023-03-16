#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185760 "Duplicate EFT Transfer Lines"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Duplicate EFT Transfer Lines.rdlc';

    dataset
    {
        dataitem("EFT Transfer Header";"EFT Transfer Header")
        {
            column(ReportForNavId_26; 26)
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
                column(Transferred_EFTTransferLines;"EFT Transfer Lines".Transferred)
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

                    Mycount:=0;
                    EFTTransferLines.Reset;
                    EFTTransferLines.SetRange("Account No.","EFT Transfer Lines"."Account No.");
                    if EFTTransferLines.Find('-') then
                      begin
                        repeat
                          Mycount+=1;
                          until EFTTransferLines.Next=0;
                        end;
                       // MESSAGE('my count %1',Mycount);
                        if Mycount>2 then
                          begin
                          Multiple:=true;
                          "EFT Transfer Lines"."Multiple Accounts":=true;
                          "EFT Transfer Lines".Modify;
                            end else
                            begin
                           Multiple:=false;
                          "EFT Transfer Lines"."Multiple Accounts":=false;
                          "EFT Transfer Lines".Modify;
                              end;
                    if Multiple=false then
                      CurrReport.Skip;
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
}
