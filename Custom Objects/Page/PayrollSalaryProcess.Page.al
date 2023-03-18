page 52185977 "Payroll Salary Process"
{
    CardPageID = "Salary Header";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Salary Header";
    SourceTableView = WHERE("Account No" = FILTER('00'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                }
                field("Account Type"; Rec."Account Type")
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Document No"; Rec."Document No")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Scheduled Amount"; Rec."Scheduled Amount")
                {
                }
                field("Total Count"; Rec."Total Count")
                {
                }
                field("Account Name"; Rec."Account Name")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Income Type"; Rec."Income Type")
                {
                }
                field("Posting date"; Rec."Posting date")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field("Posted By"; Rec."Posted By")
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
        OnViewCurrRec();
    end;

    //[Scope('Internal')]
    procedure OnViewCurrRec()
    var
        ChangePermission: Record "Status Change Permissions.";
        ErrorOnRestricViewTxt: Label 'You do not have Permissions to VIEW,MODIFY or DELETE on this record. Contact system administrator for assistance. %';
    begin
        ChangePermission.Reset;
        ChangePermission.SetRange("User ID", UserId);
        ChangePermission.SetRange("View Payroll", true);
        ChangePermission.SetRange("Function Extended", ChangePermission."Function Extended"::"View Payroll");
        if not ChangePermission.Find('-') then
            Error(ErrorOnRestricViewTxt, UserId);
    end;
}

