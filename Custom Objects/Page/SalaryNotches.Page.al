page 52185641 "Salary Notches"
{
    PageType = List;
    SourceTable = "Salary Notch";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Salary Notch"; Rec."Salary Notch")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Salary Amount"; Rec."Salary Amount")
                {
                }
                field("Annual Salary Amount"; Rec."Annual Salary Amount")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Notch)
            {
                Caption = 'Notch';
                action(Transactions)
                {
                    Caption = 'Transactions';
                    Image = Trace;
                    Promoted = true;
                    RunObject = Page "Salary Step/Notch Transactions";
                    RunPageLink = "Salary Grade" = FIELD("Salary Grade"),
                                  "Salary Step/Notch" = FIELD("Salary Notch");
                }
                separator(Action1102755015)
                {
                }
                action("Update All Employees Transactions")
                {
                    Caption = 'Update All Employees Transactions';
                    Image = UpdateDescription;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to update all employees in this salary step/notch with the changes?', false) = false then
                            exit;

                        Employee.Reset;
                        // Employee.SetRange(Employee."Salary Grade", Rec."Salary Grade");
                        Employee.SetRange(Employee."Salary Notch/Step", Rec."Salary Notch");
                        if Employee.Find('-') then begin
                            repeat
                                Employee.Validate(Employee."Salary Notch/Step");
                                Employee.Modify;

                            until Employee.Next = 0;
                        end;

                        Message('Update completed successfully.');
                    end;
                }
            }
        }
    }

    var
        Employee: Record "HR Employees";
}

