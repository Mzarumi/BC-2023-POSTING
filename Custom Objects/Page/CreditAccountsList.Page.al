page 52185837 "Credit Accounts List"
{
    CardPageID = "Credit Account Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Credit Accounts";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field("Product Type"; Rec."Product Type")
                {
                }
                field("Payroll/Staff No."; Rec."Payroll/Staff No.")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
                field("Oustanding Balance"; Rec."Balance (LCY)")
                {
                    Caption = 'Oustanding Balance';

                    trigger OnDrillDown()
                    var
                        DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
                        CustLedgEntry: Record "Cust. Ledger Entry";
                    begin
                        /*DtldCustLedgEntry.SETRANGE("Customer No.","No.");
                        COPYFILTER("Global Dimension 1 Filter",DtldCustLedgEntry."Initial Entry Global Dim. 1");
                        COPYFILTER("Global Dimension 2 Filter",DtldCustLedgEntry."Initial Entry Global Dim. 2");
                        COPYFILTER("Currency Filter",DtldCustLedgEntry."Currency Code");
                        CustLedgEntry.DrillDownOnEntries(DtldCustLedgEntry);
                        */

                    end;
                }
                field("Outstanding Interest"; Rec."Outstanding Interest")
                {
                }
                field("Outstanding Bills"; Rec."Outstanding Bills")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

