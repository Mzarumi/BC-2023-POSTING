table 52186039 "Permission Requisition"
{

    fields
    {
        field(1; No; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            begin

                if No <> xRec.No then begin
                    CashOfficeSetup.Get;
                    //NoSeriesMgtTestManual(CashOfficeSetup."Permission Requisition Nos");
                    "No.Series" := '';
                end;
            end;
        }
        field(2; "No.Series"; Code[10])
        {
        }
        field(4; "Full Name"; Text[100])
        {
            Editable = false;
        }
        field(6; "Staff No"; Code[20])
        {
            Editable = false;
            TableRelation = "HR Employees";

            trigger OnValidate()
            begin
                HREmployees.Reset;
                HREmployees.SetRange("No.", "Staff No");
                if HREmployees.Find('-') then begin
                    // Department := HREmployees."Global Dimension 1 Code";
                    // "Phone No" := HREmployees."Cell Phone Number";
                    "Full Name" := HREmployees."Full Name";
                    "Employment Type" := HREmployees."Contract Type";
                end;
            end;
        }
        field(7; Department; Text[30])
        {
            Editable = false;
        }
        field(10; "Phone No"; Text[30])
        {
            Editable = false;
        }
        field(23; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Approved,Rejected;

            trigger OnValidate()
            begin
                if Status = Rec.Status::Approved then begin
                    "Date Approved" := Today;
                    "Time Approved" := Time;
                end;
            end;
        }
        field(24; User; Code[50])
        {
            Editable = false;
        }
        field(25; "Employment Type"; Code[30])
        {
        }
        field(26; "Request Type"; Option)
        {
            OptionCaption = ' ,New,Amendment';
            OptionMembers = " ",New,Amendment;
        }
        field(27; "Date Captured"; Date)
        {
            Editable = false;
        }
        field(28; "Date Approved"; Date)
        {
        }
        field(29; "Time Approved"; Time)
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin

            CashOfficeSetup.Get();
            CashOfficeSetup.TestField(CashOfficeSetup."Permission Requisition Nos");
            //NoSeriesMgtInitSeries(CashOfficeSetup."Permission Requisition Nos", xRec."No.Series", 0D, No, "No.Series");
        end;

        "Date Captured" := Today;

        User := UserId;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindFirst then begin
            //"Branch Code" := UserSetup."Global Dimension 2 Code";
            //"Responsibility Center":=UserSetup."Responsibility Centre";
        end;
        HREmployees.Reset;
        HREmployees.SetRange("User ID", UserId);
        if HREmployees.FindFirst then begin
            "Staff No" := HREmployees."No.";
            Validate("Staff No");
            "Full Name" := HREmployees."Full Name";
            "Phone No" := Format(HREmployees."Cellular Phone Number");
            "Employment Type" := HREmployees."Contract Type";
        end;
    end;

    trigger OnModify()
    begin
        "Date Captured" := Today;
        User := UserId;
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        if UserSetup.FindFirst then begin
            //"Branch Code" := UserSetup."Global Dimension 2 Code";
            //"Responsibility Center":=UserSetup."Responsibility Centre";
            Modify;
        end;
        //Category:=Category::"1";
        Modify
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        Members: Record Members;
        SavingsAccounts: Record "Savings Accounts";
        Txt001: Label 'With Effect Date Cannot be less than Capture date';
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        HREmployees: Record "HR Employees";
        UserSetup: Record "User Setup";
        SalaryAgreement: Record "Salary Agreement";
        Txt002: Label 'You cann not have two Salary forms witin the same period';
        DelegateMemberss: Record "Delegate Memberss";
        CashOfficeSetup: Record "Cash Office Setup";
}

