page 52186203 "Posted Nairobi water Bill"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Nairobi Water Bill";
    SourceTableView = WHERE("billed tenants" = CONST(true));

    layout
    {
        area(content)
        {
            group("Water billing")
            {
                Caption = 'Water billing';
                label(Control1102755046)
                {
                    CaptionClass = Text19029898;
                    ShowCaption = false;
                }
                field("Property No."; Rec."Property No.")
                {
                }
                field("No."; Rec."No.")
                {
                    Caption = 'Billing No.';
                    Editable = false;
                }
                field("Meter Category"; Rec."Meter Category")
                {
                }
                field("L/R No."; Rec."L/R No.")
                {
                }
                field(Water; Rec.Water)
                {
                }
                field("Sewer charge"; Rec."Sewer charge")
                {
                }
                field("Meter No."; Rec."Meter No.")
                {
                    Caption = 'Meter No';
                }
                field("Previous Reading"; Rec."Previous Reading")
                {
                    Caption = 'Previous Meter reading';
                    Editable = false;
                }
                field("Current[Present] reading"; Rec."Current[Present] reading")
                {
                    Caption = 'Current Meter Reading';
                }
                field(Consumption; Rec.Consumption)
                {
                    Caption = 'Consumption';
                }
                field("Total Sewer Due"; Rec."Total Sewer Due")
                {
                }
                field("Total Water due"; Rec."Total Water due")
                {
                    Editable = false;
                }
                field("Total Due"; Rec."Total Due")
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Bill No."; Rec."Bill No.")
                {
                }
                field("Property Sequence"; Rec."Property Sequence")
                {
                }
                field("Meter Reading Date"; Rec."Meter Reading Date")
                {
                }
                field("Account No.[Bill Account]"; Rec."Account No.[Bill Account]")
                {
                }
                field("Total No Of Units"; Rec."Total No Of Units")
                {
                    Caption = 'Total No. Units[Occupied]';
                    Editable = false;
                }
                field("Billing date"; Rec."Billing date")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Due Date"; Rec."Due Date")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Units Total [Water]"; Rec."Units Total [Water]")
                {
                    Editable = false;
                }
                field("Units total [Sewer]"; Rec."Units total [Sewer]")
                {
                    Editable = false;
                }
                field("billed tenants"; Rec."billed tenants")
                {
                }
            }
            part(Control1102755053; "Units Meter Rating")
            {
                SubPageLink = "Property No" = FIELD("Property No."),
                              "Nairobi Water Bill No" = FIELD("No.");
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
                Visible = false;
                action("Bill Tenant[Water]")
                {
                    Caption = 'Bill Tenant[Water]';

                    trigger OnAction()
                    begin
                        if Confirm('Do you want to Bill Tenants?', false) = false then begin
                            Error('Tenant Bills Not Processed')
                        end;
                        UnitMeterReading.Reset;
                        UnitMeterReading.SetRange(UnitMeterReading."Property No", Rec."Property No.");
                        // UnitMeterReading.GET(UnitMeterReading."Property No");
                        if UnitMeterReading.Find('-') then begin
                            repeat
                                // BillTenant.RESET;
                                BillTenant.Init;
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
                                BillTenant.Insert;
                            until UnitMeterReading.Next = 0;
                        end;
                        Message('Tenants have been Billed');
                        Rec."billed tenants" := true;
                        Rec.Modify;
                    end;
                }
            }
        }
    }

    var
        NairobiWater: Record "Nairobi Water Bill";
        LL: Record "Lease Line";
        IntC: Integer;
        BL: Record "Lease Bill Lines";
        SaleHeader: Record "Sales Header";
        SaleLine: Record "Sales Line";
        SRSetup: Record "Sales & Receivables Setup";
        NextNo: Code[20];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FType: Text[30];
        FValue: Integer;
        UnitMeterReading: Record "Units meter Ratings";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        InvDesc: Text[30];
        NoSeries: Record "No. Series Line";
        LastNo: Code[20];
        SaleSetup: Record "Sales & Receivables Setup";
        LineNo: Integer;
        PostInv: Boolean;
        SalesSetup: Record "Sales & Receivables Setup";
        SalesPost: Codeunit "Sales-Post";
        PostingDateReq: Date;
        DueDate: Date;
        Postdate: Date;
        "Rent Payable": Decimal;
        FirstDate: Date;
        LastDate: Date;
        Total: Decimal;
        NoSeriesNo: Integer;
        Date: Date;
        Cust: Record Customer;
        RegNo: Integer;
        DocDate: Date;
        PrevInv: Boolean;
        InvPrevNo: Integer;
        LastMonth1: Date;
        LastMonth2: Date;
        NQBeginDate: Date;
        NQEndDate: Date;
        Test: Integer;
        "NextNo.": Integer;
        NextPeriod: Date;
        CompInfo: Record "Company Information";
        MonthTo: Text[30];
        Year: Text[30];
        VAT: Decimal;
        TotalVAT: Decimal;
        BillTenant: Record "Bill Units meter Ratings";
        Text19029898: Label 'Sewer reading';
}

