page 52186264 "Status Change Permssion."
{
    PageType = List;
    SourceTable = "Status Change Permissions.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User ID"; Rec."User ID")
                {
                }
                field("Function"; Rec."Function")
                {
                    OptionCaption = '<,View Payroll,View Employee Record,Edit User Setup,Edit Banking User Setup,Edit Credit Setup';
                }
                field("Email Address"; Rec."Email Address")
                {
                }
                field("Responsibility Centre"; Rec."Responsibility Centre")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Function Extended"; Rec."Function Extended")
                {
                }
                field("Edit Banking User Setup"; Rec."Edit Banking User Setup")
                {
                }
                field("View Payroll"; Rec."View Payroll")
                {
                }
                field("Edit Payroll"; Rec."Edit Payroll")
                {
                }
                field("View Setup"; Rec."View Setup")
                {
                }
                field("Edit Setup"; Rec."Edit Setup")
                {
                }
                field("Update Rejoining Member"; Rec."Update Rejoining Member")
                {
                }
                field("View G/L Account"; Rec."View G/L Account")
                {
                }
                field("Edit  G/L Account"; Rec."Edit  G/L Account")
                {
                }
                field("Edit Member Changes"; Rec."Edit Member Changes")
                {
                }
                field("View Employee Record"; Rec."View Employee Record")
                {
                }
                field("Edit Employee Record"; Rec."Edit Employee Record")
                {
                }
                field("Block account"; Rec."Block account")
                {
                }
                field("Unblock Account"; Rec."Unblock Account")
                {
                }
                field("Cheque Writting"; Rec."Cheque Writting")
                {
                }
                field("Edit Bank Card"; Rec."Edit Bank Card")
                {
                }
                field("View Data Sheet"; Rec."View Data Sheet")
                {
                }
                field("Upload Old Loans"; Rec."Upload Old Loans")
                {
                }
                field("Edit Vendor"; Rec."Edit Vendor")
                {
                }
                field("View Edit"; Rec."View Edit")
                {
                }
                field("Edit Customer"; Rec."Edit Customer")
                {
                }
                field("View Customer"; Rec."View Customer")
                {
                }
                field("Edit Journal"; Rec."Edit Journal")
                {
                }
                field("View Next of Kin"; Rec."View Next of Kin")
                {
                }
                field("Edit Next of Kin"; Rec."Edit Next of Kin")
                {
                }
                field("View HR"; Rec."View HR")
                {
                }
                field("Edit HR"; Rec."Edit HR")
                {
                }
                field("Reset Notice Date"; Rec."Reset Notice Date")
                {
                }
                field("Block Mobile Loan"; Rec."Block Mobile Loan")
                {
                }
                field("View Funds Management Setup"; Rec."View Funds Management Setup")
                {
                }
                field("Register ADM Attendance"; Rec."Register ADM Attendance")
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
        //OnViewCurrRec();
    end;

    //[Scope('Internal')]
    procedure OnViewCurrRec()
    var
        ChangePermission: Record "Status Change Permissions.";
        ErrorOnRestricViewTxt: Label 'You do not have Permissions to VIEW,MODIFY or DELETE on this record. Contact system administrator for assistance. %';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("Edit Setup", true);
        ChangePermission.SetRange("Responsibility Centre", 'ICT');
        if not ChangePermission.Find('-') then
            Error(ErrorOnRestricViewTxt, UserId);
    end;
}

