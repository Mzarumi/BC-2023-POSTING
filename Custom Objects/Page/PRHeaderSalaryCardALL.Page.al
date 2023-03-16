page 52185660 "PR Header Salary Card - ALL"
{
    // strempcode,dtDOE,curbasicpay,blnpaye,blnnssf,blnnhif,selectedperio,dtopenperio,
    // membership,referenceno,dttermination,blngetspayereleif

    Caption = 'Salary Card';
    DeleteAllowed = false;
    InsertAllowed = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "HR Employees";

    layout
    {
        area(content)
        {
            group("Employee Details")
            {
                Caption = 'Employee Details';
                Editable = false;
                field("No."; Rec."No.")
                {
                    Editable = true;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Editable = true;
                    Enabled = true;
                }
                field("First Name"; Rec."First Name")
                {
                    Editable = true;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Editable = true;
                }
                // field("Date Of Join"; Rec."Date Of Join")
                // {
                //     Editable = true;
                // }
                field("ID Number"; Rec."ID Number")
                {
                    Editable = true;
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    Editable = true;
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    Editable = true;
                }
                field("PIN No."; Rec."PIN No.")
                {
                    Editable = true;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    Editable = true;
                }
                // field(Grade; Rec.Grade)
                // {
                //     Editable = true;
                // }
                field(Disabled; Rec.Disabled)
                {
                }
                // field("Responsibility Center"; Rec."Responsibility Center")
                // {
                //     Editable = false;
                // }
                field("Posting Group"; Rec."Posting Group")
                {
                }
                // field("Employee Type"; Rec."Employee Type")
                // {
                // }
                field(Status; Rec.Status)
                {
                    Caption = 'Employment Status';
                }
            }
            part(PaymentInfo; "PR Salary Information")
            {
                Caption = 'Payment Information';
                ShowFilter = true;
                SubPageLink = "Employee Code" = FIELD("No.");
            }
            group(Posting)
            {
                Caption = 'Posting';
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin

        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            SelectedPeriod := objPeriod."Date Opened";
            PeriodName := objPeriod."Period Name";
            PeriodMonth := objPeriod."Period Month";
            PeriodYear := objPeriod."Period Year";
        end;
    end;

    var
        objEmp: Record "HR Employees";
        SalCard: Record "PR Salary Card";
        objPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        //ProcessPayroll: Codeunit "PR Payroll Processing";
        HrEmployee: Record "HR Employees";
        ProgressWindow: Dialog;
        HREmpPR: Record "HR Employees";
}

