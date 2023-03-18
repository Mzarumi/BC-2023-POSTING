page 52185899 "CRM Application List"
{
    CardPageID = "CRM Application Card";
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "CRM Application";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("Application Form No."; Rec."Application Form No.")
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                }
                field(Date; Rec.Date)
                {
                    Editable = true;
                }
                field("Member No."; Rec."Member No.")
                {
                }
                field(Created; Rec.Created)
                {
                }
                field("Application Type"; Rec."Application Type")
                {
                }
                field("Member Name"; Rec."Member Name")
                {
                }
                field(Time; Rec.Time)
                {
                }
                field(Source; Rec.Source)
                {
                }
                field("Product Factory"; Rec."Product Factory")
                {
                }
                field("Payroll No."; Rec."Payroll No.")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field("Certificate No."; Rec."Certificate No.")
                {
                }
                field("Amount On"; Rec."Amount On")
                {
                }
                field("Amount Off"; Rec."Amount Off")
                {
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                }
                field("Closure Type"; Rec."Closure Type")
                {
                }
                field("Buyer No."; Rec."Buyer No.")
                {
                }
                field("Buyer ID No."; Rec."Buyer ID No.")
                {
                }
                field(Adviced; Rec.Adviced)
                {
                }
                field("Date Adviced"; Rec."Date Adviced")
                {
                }
                field("Time Adviced"; Rec."Time Adviced")
                {
                }
                field("Adviced By"; Rec."Adviced By")
                {
                }
                field("Modification Type"; Rec."Modification Type")
                {
                }
                field("Shedule Type"; Rec."Shedule Type")
                {
                }
                field("In coming Guarantor No."; Rec."In coming Guarantor No.")
                {
                }
                field("Replaced Guarantor No."; Rec."Replaced Guarantor No.")
                {
                }
                field("Temp. Name"; Rec."Temp. Name")
                {
                }
                field(Case360_Docs; Rec.Case360_Docs)
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Approval Status"; Rec."Approval Status")
                {
                }
                field("Loan status"; Rec."Loan status")
                {
                }
            }
        }
    }

    actions
    {
    }
}

