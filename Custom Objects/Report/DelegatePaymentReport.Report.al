#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185749 "Delegate Payment Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Delegate Payment Report.rdlc';

    dataset
    {
        dataitem("Delegate Memberss";"Delegate Memberss")
        {
            RequestFilterFields = "Code";
            column(ReportForNavId_1; 1)
            {
            }
            column(MemberNo;"Delegate Memberss"."Delegate MNO.")
            {
            }
            column(MemberName;"Delegate Memberss"."Delegate Name")
            {
            }
            column(Postions;"Delegate Memberss".Position)
            {
            }
            column(Tilte;"Delegate Memberss"."Job Tittle")
            {
            }
            column(ElectoralZone;"Delegate Memberss"."Electoral Zone")
            {
            }
            column(RegionName;RegionName)
            {
            }
            column(AmountPaid;AmountPaid)
            {
            }
            column(DocNo;DocNo)
            {
            }
            column(CName;CompanyInformation.Name)
            {
            }
            column(CAddress;CompanyInformation.Address)
            {
            }
            column(CPicture;CompanyInformation.Picture)
            {
            }

            trigger OnAfterGetRecord()
            begin
                RegionName:='';
                DocNo:='';
                AmountPaid:=0;
                if DelegateRegion.Get("Delegate Memberss"."Delegate Code") then
                  RegionName:=DelegateRegion."Delegate Region Description";

                if "Delegate Memberss".Type="Delegate Memberss".Type::ADM then begin
                DelegatePaymentLine.Reset;
                DelegatePaymentLine.SetRange("Delegate Region","Delegate Memberss".Code);
                DelegatePaymentLine.SetRange("Delegate MNO.","Delegate Memberss"."Delegate MNO.");
                if DelegatePaymentLine.Find('-') then begin
                  DelegatePaymentLine.CalcSums("Amount Payable");
                  AmountPaid:=DelegatePaymentLine."Amount Payable";
                  DocNo:=DelegatePaymentLine.Code;
                  end;
                  end else begin
                    DelegatePaymentLine.Reset;
                    DelegatePaymentLine.SetRange("Delegate Region","Delegate Memberss".Code);
                    DelegatePaymentLine.SetRange("Delegate MNO.","Delegate Memberss"."Delegate MNO.");
                    if DelegatePaymentLine.Find('-') then begin
                      DelegatePaymentLine.CalcSums("Amount Payable");
                      AmountPaid:=DelegatePaymentLine."Amount Payable";
                      DocNo:=DelegatePaymentLine.Code;
                      end;
                    end;
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
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        DelegateRegion: Record 52186062;
        RegionName: Text;
        DelegatePaymentLine: Record 52186068;
        AmountPaid: Decimal;
        DocNo: Code[20];
        CompanyInformation: Record "Company Information";
}
