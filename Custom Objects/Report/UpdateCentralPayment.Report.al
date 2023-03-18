#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185797 "Update Central Payment"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Update Central Payment.rdlc';

    dataset
    {
        dataitem("Central Payment"; "Central Payment")
        {
            column(ReportForNavId_1102755000; 1102755000)
            {
            }

            trigger OnAfterGetRecord()
            begin
                case "Table ID" of
                    //Payment Voucher and Petty Cash
                    Database::"Payments Header":
                        begin
                            PaymentsHeader.Reset;
                            PaymentsHeader.SetRange(PaymentsHeader."No.", "Document No.");
                            if PaymentsHeader.FindFirst then
                                if PaymentsHeader.Posted = true then begin
                                    DocumentPosted := true;
                                    //UnknownTable52185920.Modify;
                                end
                        end;

                    //Imprests
                    Database::"Imprest Header":
                        begin
                            ImprestHeader.Reset;
                            ImprestHeader.SetRange(ImprestHeader."No.", "Document No.");
                            if ImprestHeader.FindFirst then
                                if ImprestHeader.Posted = true then begin
                                    DocumentPosted := true;
                                    //UnknownTable52185920.Modify;
                                end
                        end;

                    //staff advance
                    Database::"Staff Advance Header":
                        begin
                            StaffAdvance.Reset;
                            StaffAdvance.SetRange(StaffAdvance."No.", "Document No.");
                            if StaffAdvance.FindFirst then
                                if StaffAdvance.Posted = true then begin
                                    DocumentPosted := true;
                                    //UnknownTable52185920.Modify;
                                end

                        end;

                    //Staff Advance Surrender Header
                    Database::"Staff Advance Surrender Header":
                        begin
                            StaffAdvanceSurr.Reset;
                            StaffAdvanceSurr.SetRange(StaffAdvanceSurr.No, "Document No.");
                            if StaffAdvanceSurr.FindFirst then
                                if StaffAdvanceSurr.Posted = true then begin
                                    DocumentPosted := true;
                                    // UnknownTable52185920.Modify;
                                end

                        end;


                    //Imprest Surrender
                    Database::"Imprest Surrender Header":
                        begin
                            ImprestSurr.Reset;
                            ImprestSurr.SetRange(ImprestSurr.No, "Document No.");
                            if ImprestSurr.FindFirst then
                                if ImprestSurr.Posted = true then begin
                                    DocumentPosted := true;
                                    // UnknownTable52185920.Modify;
                                end

                        end;
                    //Interbank Transfer
                    Database::"InterBank Transfers":
                        begin
                            Interbank.Reset;
                            Interbank.SetRange(Interbank.No, "Document No.");
                            if Interbank.FindFirst then
                                if Interbank.Posted = true then begin
                                    DocumentPosted := true;
                                    // UnknownTable52185920.Modify;
                                end

                        end;

                    //staff claims
                    Database::"Staff Claims Header":
                        begin
                            StaffClaim.Reset;
                            StaffClaim.SetRange(StaffClaim."No.", "Document No.");
                            if StaffClaim.FindFirst then
                                if StaffClaim.Posted = true then begin
                                    DocumentPosted := true;
                                    // UnknownTable52185920.Modify;
                                end

                        end;


                    else
                        exit;
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

    var
        SalesHeader: Record "Sales Header";
        PurchHeader: Record "Purchase Header";
        PaymentsHeader: Record 52185888;
        ImprestHeader: Record 52185909;
        SRHeader: Record 52185868;
        ImprestSurr: Record 52185885;
        Interbank: Record 52185881;
        StaffAdvance: Record 52185914;
        StaffAdvanceSurr: Record 52185916;
        StaffClaim: Record 52185912;


    procedure GetPostedDocStatus()
    begin
    end;
}
