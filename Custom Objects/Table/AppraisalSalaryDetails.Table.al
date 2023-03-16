table 52185744 "Appraisal Salary Details"
{
    // //DrillDownPageID = "Loan Disbursement Lines";
    // //LookupPageID = "Loan Disbursement Lines";

    fields
    {
        field(1; "Client Code"; Code[20])
        {
        }
        field(2; "Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Appraisal Salary Set-up";

            trigger OnValidate()
            begin
                if "SalarySet-up".Get(Code) then begin
                    Description := "SalarySet-up".Description;
                    Type := "SalarySet-up".Type;
                end;
            end;
        }
        field(3; Description; Text[30])
        {
        }
        field(4; Type; Option)
        {
            OptionCaption = ' ,Earnings,Deductions,Basic,Other Allowances,Cleared Effects,Voluntary Deductions,Gross Pay,Net Pay';
            OptionMembers = " ",Earnings,Deductions,Basic,"Other Allowances","Cleared Effects","Voluntary Deductions","Gross Pay","Net Pay";
        }
        field(5; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                if Amount < 0 then Error('Amount cannot be less than zero');

                //to initialize the STO Amount if inserted and Display a message
                if (Code = '7.1EXTERNAL BANK STO') and (Amount > 0) then begin
                    ApprDetails.Reset;
                    ApprDetails.SetRange("Loan No", "Loan No");
                    ApprDetails.SetRange(Type, ApprDetails.Type::Basic);
                    ApprDetails.SetFilter(Amount, '>0');
                    if ApprDetails.FindFirst then begin
                        Rec.Amount := 0;
                        Rec.Modify;
                        Message('Standing Order Amount not allowed when there is Basic Salary');
                    end;
                end;
                //end of initializing STO Amount

                if (Type = Type::"Net Pay") or (Type = Type::"Gross Pay") then
                    Error(Text002);

                if Type = Type::Basic then begin
                    ApprDetails.Reset;
                    ApprDetails.SetRange(Type, Type::"Net Pay");
                    ApprDetails.SetRange("Loan No", "Loan No");
                    if ApprDetails.Find('-') then begin
                        ApprDetails.Amount := ApprDetails.Amount + Amount - xRec.Amount;
                        ApprDetails.Modify;
                    end;
                    ApprDetails.Reset;
                    ApprDetails.SetRange(Type, Type::"Gross Pay");
                    ApprDetails.SetRange("Loan No", "Loan No");
                    if ApprDetails.Find('-') then begin
                        ApprDetails.Amount := ApprDetails.Amount + Amount - xRec.Amount;
                        ApprDetails.Modify;
                    end;
                end else
                    if Type = Type::"Cleared Effects" then begin
                        ApprDetails.Reset;
                        ApprDetails.SetRange(Type, Type::"Net Pay");
                        ApprDetails.SetRange("Loan No", "Loan No");
                        if ApprDetails.Find('-') then begin
                            ApprDetails.Amount := ApprDetails.Amount + Amount - xRec.Amount;
                            ApprDetails.Modify;
                        end;
                        //Type::

                    end else
                        if Type = Type::Deductions then begin
                            ApprDetails.Reset;
                            ApprDetails.SetRange(Type, Type::"Net Pay");
                            ApprDetails.SetRange("Loan No", "Loan No");
                            if ApprDetails.Find('-') then begin
                                ApprDetails.Amount := ApprDetails.Amount - Amount + xRec.Amount;
                                ApprDetails.Modify;
                            end;

                        end else
                            if Type = Type::Earnings then begin
                                ApprDetails.Reset;
                                ApprDetails.SetRange(Type, Type::"Net Pay");
                                ApprDetails.SetRange("Loan No", "Loan No");
                                if ApprDetails.Find('-') then begin
                                    ApprDetails.Amount := ApprDetails.Amount + Amount - xRec.Amount;
                                    ApprDetails.Modify;
                                end;
                                ApprDetails.Reset;
                                ApprDetails.SetRange(Type, Type::"Gross Pay");
                                ApprDetails.SetRange("Loan No", "Loan No");
                                if ApprDetails.Find('-') then begin
                                    ApprDetails.Amount := ApprDetails.Amount + Amount - xRec.Amount;
                                    ApprDetails.Modify;
                                end;
                            end else
                                if Type = Type::"Other Allowances" then begin
                                    ApprDetails.Reset;
                                    ApprDetails.SetRange(Type, Type::"Net Pay");
                                    ApprDetails.SetRange("Loan No", "Loan No");
                                    if ApprDetails.Find('-') then begin
                                        ApprDetails.Amount := ApprDetails.Amount + Amount - xRec.Amount;
                                        ApprDetails.Modify;
                                    end;
                                    ApprDetails.Reset;
                                    ApprDetails.SetRange(Type, Type::"Gross Pay");
                                    ApprDetails.SetRange("Loan No", "Loan No");
                                    if ApprDetails.Find('-') then begin
                                        ApprDetails.Amount := ApprDetails.Amount + Amount - xRec.Amount;
                                        ApprDetails.Modify;
                                    end;
                                end;


                //initialize the STO Amount if there is a value in Basic
                if (Type = Type::Basic) and (Amount > 0) then begin
                    ApprDetails.Reset;
                    ApprDetails.SetRange("Loan No", "Loan No");
                    ApprDetails.SetRange(Code, '7.1EXTERNAL BANK STO');
                    if ApprDetails.FindFirst then begin
                        STOVal := ApprDetails.Amount;
                        ApprDetails.Amount := 0;
                        ApprDetails.Modify;

                        //IF Type=Type::"Other Allowances" THEN BEGIN
                        ApprDetails.Reset;
                        ApprDetails.SetRange(Type, Type::"Net Pay");
                        ApprDetails.SetRange("Loan No", "Loan No");
                        if ApprDetails.Find('-') then begin
                            ApprDetails.Amount := ApprDetails.Amount - STOVal;
                            ApprDetails.Modify;
                        end;
                        ApprDetails.Reset;
                        ApprDetails.SetRange(Type, Type::"Gross Pay");
                        ApprDetails.SetRange("Loan No", "Loan No");
                        if ApprDetails.Find('-') then begin
                            ApprDetails.Amount := ApprDetails.Amount - STOVal;
                            ApprDetails.Modify;
                        end;
                        //END;

                    end;
                end;
                //End of initialize STO Amount if There is Basic Amount
            end;
        }
        field(6; "Loan No"; Code[50])
        {
            TableRelation = Loans;

            trigger OnValidate()
            begin
                if LoanApp.Get("Loan No") then
                    "Client Code" := LoanApp."Member No.";
            end;
        }
        field(7; Verified; Boolean)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Loan No", "Client Code", "Code")
        {
            Clustered = true;
        }
        key(Key2; "Code", "Client Code", Type)
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    var
        Text001: Label 'Loan is already %1 thus cannot modify';
    begin
        if LoanApp.Get("Loan No") then begin
            if (LoanApp.Status = LoanApp.Status::Pending) or (LoanApp.Status = LoanApp.Status::Approved) then
                Error(Text001, LoanApp.Status);
        end;
    end;

    var
        "SalarySet-up": Record "Appraisal Salary Set-up";
        LoanApp: Record Loans;
        Text002: Label 'Do not capture anything here';
        ApprDetails: Record "Appraisal Salary Details";
        STOVal: Decimal;
}

