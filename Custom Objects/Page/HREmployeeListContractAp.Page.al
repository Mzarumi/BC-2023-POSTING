page 52186607 "HR Employee-List (Contract) Ap"
{
    CardPageID = "HR Employees Factbox";
    Editable = false;
    PageType = List;
    SourceTable = "HR Employees";
    SourceTableView = SORTING("No.")
                      ORDER(Ascending)
                      WHERE("Contract Type" = FILTER('3'),
                            Status = FILTER(Active));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("First Name"; Rec."First Name")
                {
                }
                field("Last Name"; Rec."Last Name")
                {
                }
                field(Position; Rec.Position)
                {
                }
                field("Job Title"; Rec."Job Title")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                }
                field(Office; Rec.Office)
                {
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                }
                field("Company E-Mail"; Rec."Company E-Mail")
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
        area(processing)
        {
            action("Import Notches")
            {
                Caption = 'Import Notches';
                ////RunObject = XMLport XMLport50051;
            }
            action("Import Notch Transactions")
            {
                Caption = 'Import Notch Transactions';
                ////RunObject = XMLport XMLport50061;
            }
            action("Import Payroll Variations")
            {
                Caption = 'Import Payroll Variations';
                ////RunObject = XMLport "Checkoff Buffer";
            }
            action("Import Employee Trans")
            {
                Caption = 'Import Employee Trans';
                ////RunObject = XMLport XMLport50060;
            }
            action(Abscence)
            {
                Caption = 'Abscence';
                Image = Absence;
                Promoted = true;
                RunObject = Page "Employee Absences";
                RunPageLink = "Employee No." = FIELD("No.");
                Visible = false;
            }
            action(Lateness)
            {
                Caption = 'Lateness';
                Image = AbsenceCalendar;
                Promoted = true;
                RunObject = Page prLatenessLedger;
                RunPageLink = "Employee Code" = FIELD("No.");
                Visible = false;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DepName := '';
        DValues.Reset;
        DValues.SetRange(DValues.Code, Rec."Department Code");
        if DValues.Find('-') then
            DepName := DValues.Name;

        BankName := '';
        Banks.Reset;
        Banks.SetRange(Banks."Branch Code", Rec."Main Bank");
        Banks.SetRange(Banks."Branch Name", Rec."Branch Bank");
        if Banks.Find('-') then
            BankName := Banks."Bank Name";
    end;

    trigger OnOpenPage()
    begin
        if (DepCode <> '') then
            Rec.SetFilter("Department Code", ' = %1', DepCode);
        if (OfficeCode <> '') then
            Rec.SetFilter(Office, ' = %1', OfficeCode);
    end;

    var
        Mail: Codeunit Mail;
        PictureExists: Boolean;
        DepCode: Code[10];
        OfficeCode: Code[10];
        DepName: Text[100];
        BankName: Text[200];
        DValues: Record "Dimension Value";
        Banks: Record "PR Bank Branches";

    //[Scope('Internal')]
    procedure SetNewFilter(var DepartmentCode: Code[10]; var "Office Code": Code[10])
    begin
        DepCode := DepartmentCode;
        OfficeCode := "Office Code";
    end;
}

