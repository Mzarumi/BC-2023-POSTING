page 52185638 "Payroll Changes Requested"
{
    PageType = List;
    SourceTable = "Payroll Variations";
    SourceTableView = WHERE(Closed = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;
                field("Employee Code"; Rec."Employee Code")
                {
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    Visible = false;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                }
                field("Department Code"; Rec."Department Code")
                {
                    Visible = false;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
                field("New Amount"; Rec."New Amount")
                {
                }
                field("Hrs Worked"; Rec."Hrs Worked")
                {
                }
                field("Overtime Type"; Rec."Overtime Type")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Date Created"; Rec."Date Created")
                {
                }
                field("Approved By"; Rec."Approved By")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Function")
            {
                Caption = 'Function';
                action(Approve)
                {
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Rec.SetRange(Status, Rec.Status::Approved);
                        Rec.SetRange(Closed, false);
                        if Rec.Find('-') then begin
                            repeat
                                Rec.Closed := true;
                                Rec."Date Closed" := Today;
                                Rec."Approved By" := UserId;
                                Rec.Modify;
                            until Rec.Next = 0;
                        end;
                    end;
                }
                separator(Action1102756031)
                {
                }
                action(Print)
                {
                    Caption = 'Print';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction()
                    begin
                        Rec.Reset;
                        //REPORT.Run(52185635);
                        Rec.Reset;
                    end;
                }
            }
        }
    }
}

