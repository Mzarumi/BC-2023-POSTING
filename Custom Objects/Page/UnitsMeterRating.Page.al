page 52186221 "Units Meter Rating"
{
    PageType = ListPart;
    SourceTable = "Units meter Ratings";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Property No"; Rec."Property No")
                {
                    Editable = false;
                }
                field("Floor Code"; Rec."Floor Code")
                {
                    Editable = false;
                }
                field("Unit Code"; Rec."Unit Code")
                {
                    Editable = false;
                }
                field(No; Rec.No)
                {
                }
                field(Water; Rec.Water)
                {
                }
                field("Meter No"; Rec."Meter No")
                {
                }
                field(InvoiceNo; Rec.InvoiceNo)
                {
                }
                field("Nairobi Water Bill No"; Rec."Nairobi Water Bill No")
                {
                }
                field("Sewer charge"; Rec."Sewer charge")
                {
                }
                field("Tenant No."; Rec."Tenant No.")
                {
                }
                field("Date Of Billing"; Rec."Date Of Billing")
                {

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                        //is obsolete in 2015
                        FrmCalendar.SetDate("Date Of Billing");
                        FrmCalendar.RUNMODAL;
                        D := FrmCalendar.GetDate;
                        CLEAR(FrmCalendar);
                        IF D <> 0D THEN
                          "Date Of Billing":= D;
                         */

                    end;
                }
                field("Meter Rent"; Rec."Meter Rent")
                {
                }
                field("C/Area Fixed Charge"; Rec."C/Area Fixed Charge")
                {
                }
                field("Previous Reading"; Rec."Previous Reading")
                {
                    Editable = false;
                }
                field("Current Reading"; Rec."Current Reading")
                {
                }
                field(Consumption; Rec.Consumption)
                {
                    Editable = false;
                }
                field("Total Water due"; Rec."Total Water due")
                {
                }
                field("Total Sewer Due"; Rec."Total Sewer Due")
                {
                }
                field("Total Due"; Rec."Total Due")
                {
                }
                field(Comments; Rec.Comments)
                {
                }
                field("Discrepancy(Units)"; Rec."Discrepancy(Units)")
                {
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Discrepancy(Amount)"; Rec."Discrepancy(Amount)")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        BillTenant: Record "Bill Units meter Ratings";
        NairobiWater: Record "Nairobi Water Bill";
        FrmCalendar: Page "Units Meter Rating";
        D: Date;
}

