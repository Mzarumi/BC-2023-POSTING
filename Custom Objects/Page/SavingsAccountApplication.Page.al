page 52185737 "Savings Account Application"
{
    CardPageID = "Savings Acc. Application Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Savings Account Application";
    SourceTableView = WHERE(Status = FILTER(Open | Pending | Approved));

    layout
    {
        area(content)
        {
            repeater(Control2)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field("CRM Application No."; Rec."CRM Application No.")
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
                field("Product Name"; Rec."Product Name")
                {
                }
                field("Group Code"; Rec."Group Code")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Source := Rec.Source::Navision;
    end;
}

