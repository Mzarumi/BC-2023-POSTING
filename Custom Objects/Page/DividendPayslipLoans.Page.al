page 52185492 "Dividend Payslip Loans"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Dividend Payslip Loans";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                }
                field("Loan No"; Rec."Loan No")
                {
                }
                field(Balance; Rec.Balance)
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Update Records")
            {
                Image = UpdateShipment;
                Promoted = true;
                //RunObject = Report "Update Dividend Payslip Loans";
            }
        }
    }
}

