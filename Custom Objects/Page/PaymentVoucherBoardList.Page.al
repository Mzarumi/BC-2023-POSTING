page 52186302 "Payment Voucher Board List"
{
    CardPageID = "Payment Voucher Board";
    Editable = false;
    PageType = List;
    SourceTable = "Payments Header Board";
    SourceTableView = WHERE(Posted = CONST(false),
                            "Payment Type" = CONST(Board));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction No."; Rec."Transaction No.")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                }
                field("Allocated Amount"; Rec."Allocated Amount")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        /*
        StatusPermissions.RESET;
        StatusPermissions.SETRANGE(StatusPermissions."User ID",USERID);
        StatusPermissions.SETRANGE(StatusPermissions."Function",StatusPermissions."Function"::Payments);
        IF StatusPermissions.FIND('-') = FALSE THEN
        ERROR('You do not have permissions to access this module.');
        */

    end;

    var
        StatusPermissions: Record "Application Document Setup";
}

