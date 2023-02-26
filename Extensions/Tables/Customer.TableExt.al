#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 52186403 tableextension52186403 extends Customer 
{
    fields
    {
        field(50000;"Account Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Travel Advance",Partner,"Staff Imprest",Others,"Training Advance",Employer,"Cashier Excess","Cashier Shortage",Tenant,SinkFund;

            trigger OnValidate()
            begin
                //Prevent Changing once entries exist
                //TestNoEntriesExist(FIELDCAPTION("Account Type"));
            end;
        }
        field(50001;"Employee Job Group";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Employee Statistics Group".Code;
        }
        field(50002;"Document Limit";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50003;"Advice Method";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Changes,Everything';
            OptionMembers = " ",Changes,Everything;
        }
        field(50004;"Internal Staff Employer";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50005;"Member No.";Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = Members."No.";
        }
        field(50006;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Pending Approval,Approved';
            OptionMembers = New,"Pending Approval",Approved;
        }
        field(50007;"Dont Charge Transactions";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50008;"Loan Qualification";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Basic Pay,Gross Pay,Standing Order';
            OptionMembers = "Basic Pay","Gross Pay","Standing Order";
        }
        field(50009;"Old No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(50010;"Loans Cleared";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Full Clearance,Leave One Intallment';
            OptionMembers = " ","Full Clearance","Leave One Intallment";
        }
        field(50011;"Employee No.";Code[30])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "HR Employees"."No." where (Status=const(Active));

            trigger OnValidate()
            begin
                Rec.Reset;
                Rec.SetRange(Rec."Employee No.",Rec."Employee No.");
                if Rec.Find('-') then begin
                  if Rec."Employee No."<>'' then
                  Error('The Customer already exists');
                end;

                // Emp.Get(Rec."Employee No.");
                // Rec.Validate(Rec.Name,Emp."Full Name");
                //Name:=Emp."Full Name";
                Rec."Customer Posting Group":='IMPREST';
                Rec."Gen. Bus. Posting Group":='EXCEMPT';
                Rec."VAT Bus. Posting Group":='EXCEMPT';
                Rec."Allow Line Disc.":=true;
                Rec."Account Type":=Rec."account type"::"Staff Imprest";
                Rec."Loan Qualification":=Rec."loan qualification"::"Basic Pay";
            end;
        }
        field(50012;"Self Employed";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50013;"Non-Common Board Employer";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
       // Emp: Record UnknownRecord52185650;
}
