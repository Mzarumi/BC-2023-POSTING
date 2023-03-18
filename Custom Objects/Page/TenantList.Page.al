page 52186238 "Tenant List"
{
    CardPageID = "Customer Card-Tenant";
    DeleteAllowed = false;
    Editable = true;
    PageType = List;
    SourceTable = Customer;
    SourceTableView = WHERE("Account Type" = CONST(Tenant));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Search Name"; Rec."Search Name")
                {
                }
                field("Name 2"; Rec."Name 2")
                {
                }
                field(Address; Rec.Address)
                {
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                }
            }
        }
    }

    actions
    {
    }
}

