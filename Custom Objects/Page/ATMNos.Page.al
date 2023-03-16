page 52185480 "ATM Nos"
{
    PageType = List;
    SourceTable = "ATM Nos";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Import)
            {
                ////RunObject = XMLport "Loan Account Import";
            }
            action(Validate)
            {
                // RunObject = Report "Update PVs";
            }
        }
    }
}

