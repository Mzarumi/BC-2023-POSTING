page 52186588 "Approved Leave Applications"
{
    CardPageID = "HR Leave Application Card";
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "HR Leave Application";
    SourceTableView = WHERE(Status = FILTER(Approved));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                ShowCaption = false;
                field("Application Code"; Rec."Application Code")
                {
                    Caption = 'Application No';
                }
                field("Applicant Staff No."; Rec."Applicant Staff No.")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("Return Date"; Rec."Return Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Status; Rec.Status)
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755006; "HR Leave Applicaitons Factbox")
            {
                SubPageLink = "No." = FIELD("Applicant Staff No.");
            }
            systempart(Control1102755004; Outlook)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        HREmp.Reset;
        if HREmp.Get(Rec."Applicant Staff No.") then begin
            EmpName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
        end else begin
            EmpName := 'n/a';
        end;
    end;

    var
        EmpName: Text;
        HREmp: Record "HR Employees";

    //[Scope('Internal')]
    procedure TESTFIELDS()
    begin
        Rec.TestField("Leave Type");
        Rec.TestField("Days Applied");
        Rec.TestField("Start Date");
        Rec.TestField(Reliever);
        Rec.TestField("Applicant Supervisor");
    end;

    //[Scope('Internal')]
    procedure TestLeaveFamily()
    var
        LeaveFamily: Record "HR Leave Family Groups";
        LeaveFamilyEmployees: Record "HR Leave Family Employees";
        Employees: Record "HR Employees";
    begin
        /*
        LeaveFamilyEmployees.SETRANGE(LeaveFamilyEmployees."Employee No","Employee No");
        IF LeaveFamilyEmployees.FINDSET THEN //find the leave family employee is associated with
        REPEAT
          LeaveFamily.SETRANGE(LeaveFamily.Code,LeaveFamilyEmployees.Family);
          LeaveFamily.SETFILTER(LeaveFamily."Max Employees On Leave",'>0');
          IF LeaveFamily.FINDSET THEN //find the status other employees on the same leave family
            BEGIN
              Employees.SETRANGE(Employees."No.",LeaveFamilyEmployees."Employee No");
              Employees.SETRANGE(Employees."Leave Status",Employees."Leave Status"::"0");
              IF Employees.COUNT>LeaveFamily."Max Employees On Leave" THEN
              ERROR('The Maximum number of employees on leave for this family has been exceeded, Contact th HR manager for more information');
            END
        UNTIL LeaveFamilyEmployees.NEXT = 0;
        */

    end;
}

