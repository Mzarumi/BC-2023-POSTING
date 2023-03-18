page 52186236 "B/Hole Water Bill"
{
    Caption = 'Water Batch Invoice Card';
    PageType = Card;
    SourceTable = "B/Hole Water Bill";

    layout
    {
        area(content)
        {
            group("B/Hole Water Charge Billing")
            {
                Caption = 'B/Hole Water Charge Billing';
                field("No."; Rec."No.")
                {
                }
                field("Zone Code"; Rec."Zone Code")
                {
                }
                field("Zone Description"; Rec."Zone Description")
                {
                    Editable = false;
                }
                field("Total Water due"; Rec."Total Water due")
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
                field("Billing date"; Rec."Billing date")
                {
                }
                field("Total Sewer Due"; Rec."Total Sewer Due")
                {
                }
                field("Total Due"; Rec."Total Due")
                {
                }
                field(Water; Rec.Water)
                {
                }
                field("Sewer charge"; Rec."Sewer charge")
                {
                }
                field("Total No Of Units"; Rec."Total No Of Units")
                {
                    Editable = false;
                }
                field("Units Total [Water]"; Rec."Units Total [Water]")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Units total [Sewer]"; Rec."Units total [Sewer]")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("billed tenants"; Rec."billed tenants")
                {
                    Editable = false;
                }
            }
            part(Control1102755031; "B/Hole Unit Meter Rating")
            {
                SubPageLink = "Water Bill No" = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Bill Tenant[Water]")
                {
                    Caption = 'Bill Tenant[Water]';

                    trigger OnAction()
                    begin

                        Rec.TestField(Rec."Billing date");


                        GSetup.Get();

                        BillTenant.Reset;
                        BillTenant.SetRange(BillTenant."Property No", Rec."Property No.");
                        BillTenant.SetRange(BillTenant."B/Hole water bill No.", Rec."No.");
                        BillTenant.SetFilter(BillTenant.Posted, Format(false));
                        if BillTenant.Find('-') then begin
                            if BillTenant.Posted = false then
                                Error(BillPostedErr);
                        end else
                            if Confirm(ConfirmText, false) = false then begin
                                Error(NotProcessedErr)
                            end;
                        GSetup.Get();

                        UnitMeterReading.Reset;
                        UnitMeterReading.SetRange(UnitMeterReading."Property No", Rec."Property No.");
                        UnitMeterReading.SetRange(UnitMeterReading."Water Bill No", Rec."No.");
                        if UnitMeterReading.Find('-') then begin
                            InvoiceNo := GSetup.BHoleInv;
                            repeat

                                BillTenant.Init;
                                BillTenant."Invoice No." := InvoiceNo;
                                BillTenant."B/Hole water bill No." := Rec."No.";
                                BillTenant."Tenant Name" := UnitMeterReading."Tenant Name";
                                BillTenant."Property Name" := UnitMeterReading."Property Name";

                                BillTenant."Property No" := UnitMeterReading."Property No";
                                BillTenant."Floor Code" := UnitMeterReading."Floor Code";
                                BillTenant."Unit Code" := UnitMeterReading."Unit Code";
                                BillTenant."Meter No" := UnitMeterReading."Meter No";
                                BillTenant."Previous Reading" := UnitMeterReading."Previous Reading";
                                BillTenant."Current Reading" := UnitMeterReading."Current Reading";
                                BillTenant.Consumption := UnitMeterReading.Consumption;
                                BillTenant."Global Dimension 1 Code" := UnitMeterReading."Global Dimension 1 Code";
                                BillTenant."Global Dimension 2 Code" := UnitMeterReading."Global Dimension 2 Code";
                                BillTenant."Total Water due" := UnitMeterReading."Total Water due";
                                BillTenant."Total Sewer Due" := UnitMeterReading."Total Sewer Due";
                                BillTenant."Date Of Billing" := UnitMeterReading."Date Of Billing";
                                BillTenant."Tenant No." := UnitMeterReading."Tenant No.";
                                BillTenant."Total Due" := UnitMeterReading."Total Due";
                                BillTenant."Posting Date" := Rec."Billing date";
                                BillTenant.Insert;
                                InvoiceNo := InvoiceNo + 1;
                            until UnitMeterReading.Next = 0;
                        end;
                        GSetup.BHoleInv := InvoiceNo;
                        GSetup.Modify;
                        Message(SuccessText);
                        Rec."billed tenants" := true;
                        Rec.Modify;
                    end;
                }
            }
        }
    }

    var
        UnitMeterReading: Record "B/Hole Units meter Ratings";
        BillTenant: Record "Bill Units meter Ratings";
        Lease: Record Lease;
        InvoiceNo: Integer;
        GSetup: Record "General Setup";
        BillPostedErr: Label 'You CANNOT Bill this Property until the previous Bill has been Posted';
        ConfirmText: Label 'Do you want to Bill Tenants?';
        NotProcessedErr: Label 'Tenant Bills Not Processed';
        SuccessText: Label 'Tenants have been Billed';
}

