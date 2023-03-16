page 52185469 "Created Sky Virtual Member"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Sky Virtual Member";
    SourceTableView = WHERE(Validated = CONST(true),
                            "Sent To Application" = CONST(true),
                            "Source Application" = CONST(USSD),
                            Status = CONST(Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                }
                field(Telephone; Rec.Telephone)
                {
                }
                field(Names; Rec.Names)
                {
                }
                field("Name on IPRS"; Rec."Name on IPRS")
                {
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                }
                field(Gender; Rec.Gender)
                {
                }
                field(Email; Rec.Email)
                {
                }
                field(Citizenship; Rec.Citizenship)
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                }
                field("Entry Time"; Rec."Entry Time")
                {
                }
                field("Reffered By"; Rec."Reffered By")
                {
                }
                field("Employer Name"; Rec."Employer Name")
                {
                }
                field("Payroll Number"; Rec."Payroll Number")
                {
                }
                field(Validated; Rec.Validated)
                {
                }
                field("Sent To Application"; Rec."Sent To Application")
                {
                }
                field("Referer Member No"; Rec."Referer Member No")
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
}

