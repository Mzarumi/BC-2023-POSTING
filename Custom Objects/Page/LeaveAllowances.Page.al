page 52185861 "Leave Allowances"
{
    PageType = List;
    SourceTable = "Leave Allowances";
    SourceTableView = WHERE(Paid = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                }
                field("Employee No."; Rec."Employee No.")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field(Paid; Rec.Paid)
                {
                }
                field(Year; Rec.Year)
                {
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(Control13; Outlook)
            {
            }
            systempart(Control14; Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Job)
            {
                action("Post Leave")
                {
                    Caption = 'Post Leave';
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        if Confirm('Do You want to Post the Leave Allowances?', false) = false then
                            Error('Process Aborted');
                        PRTrans.Reset;
                        PRTrans.SetRange(PRTrans."IsLeave Allowance", true);
                        if PRTrans.Find('-') then begin
                            PRPeriod.Reset;
                            PRPeriod.SetRange(PRPeriod.Closed, false);
                            if PRPeriod.Find('-') then begin
                                LeaveAllowances.Reset;
                                LeaveAllowances.SetRange(LeaveAllowances.Paid, false);
                                if LeaveAllowances.Find('-') then begin
                                    repeat
                                        PREmpTrans.Reset;
                                        // PREmpTrans.SETRANGE(PREmpTrans."Employee Code",LeaveAllowances."Employee No.");
                                        //  PREmpTrans.SETRANGE(PREmpTrans."Payroll Period",PRPeriod."Date Opened");
                                        // IF PREmpTrans.FIND('-') THEN
                                        begin
                                            PREmpTrans.Init;
                                            PREmpTrans."Employee Code" := LeaveAllowances."Employee No.";
                                            PREmpTrans."Transaction Code" := PRTrans."Transaction Code";
                                            PREmpTrans."Period Month" := PRPeriod."Period Month";
                                            PREmpTrans."Period Year" := PRPeriod."Period Year";
                                            PREmpTrans."Payroll Period" := PRPeriod."Date Opened";
                                            PREmpTrans."Transaction Name" := PRTrans."Transaction Name";
                                            PREmpTrans.Amount := LeaveAllowances.Amount;
                                            PREmpTrans.Insert;
                                            LeaveAllowances.Paid := true;
                                            LeaveAllowances.Modify;
                                        end
                                    until LeaveAllowances.Next = 0;
                                end;
                                Message('Successfully Posted Leave Allowances');
                            end else begin
                                Error('No Payroll Period is open');
                            end;

                        end else begin
                            Error('No Transaction code found')
                        end
                    end;
                }
            }
        }
    }

    var
        PREmpTrans: Record "PR Employee Transactions";
        PRPeriod: Record "PR Payroll Periods";
        PRTrans: Record "prTransaction Codes";
        LeaveAllowances: Record "Leave Allowances";
        prVitalSetup: Record "PR Vital Setup Info";
}

