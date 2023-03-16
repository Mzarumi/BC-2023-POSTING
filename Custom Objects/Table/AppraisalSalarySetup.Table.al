table 52185745 "Appraisal Salary Set-up"
{
    // //DrillDownPageID = "Appraisal Salary Set-up";
    // //LookupPageID = "Appraisal Salary Set-up";

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[30])
        {
        }
        field(3; Type; Option)
        {
            OptionCaption = ' ,Earnings,Deductions,Basic,Other Allowances,Cleared Effects,Voluntary Deductions,Gross Pay,Net Pay';
            OptionMembers = " ",Earnings,Deductions,Basic,"Other Allowances","Cleared Effects","Voluntary Deductions","Gross Pay","Net Pay";
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

