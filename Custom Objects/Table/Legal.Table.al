table 52185957 Legal
{
    //DrillDownPageID = "Legal List";
    //LookupPageID = "Legal List";

    fields
    {
        field(1; "Case Number"; Code[20])
        {
            Editable = false;
        }
        field(3; "Date of Complaint"; Date)
        {

            trigger OnValidate()
            begin
                if "Date of Complaint" > Today then
                    Error('The Complaint date cannot be in future');

                "Action Duration Start Date" := "Date of Complaint";
                //"Action Duration End  Date":="Date of Complaint";
            end;
        }
        field(4; "Type of Complainant"; Code[20])
        {
            NotBlank = true;
            TableRelation = IF ("Type of Complainant" = CONST('MEMBER')) Members."No."
            ELSE
            IF ("Type of Complainant" = CONST('SUPPLIER')) Vendor."No."
            ELSE
            IF ("Type of Complainant" = CONST('STAFF')) "HR Employees"."No."
            ELSE
            IF ("Type of Complainant" = CONST('TENANT')) Customer."No.";
        }
        field(5; "Recommended Action"; Code[250])
        {
        }
        field(6; "Description of Complaint"; Text[250])
        {
        }
        field(7; Reporter; Code[10])
        {
            TableRelation = IF ("Reporter Type" = CONST(Member)) Members."No."
            ELSE
            IF ("Reporter Type" = CONST(Supplier)) Vendor."No."
            ELSE
            IF ("Reporter Type" = CONST(Tenant)) Customer."No."
            ELSE
            IF ("Reporter Type" = CONST(Staff)) "HR Employees"."No.";

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange(Emp."No.", Reporter);
                if Emp.Find('-') then
                    "Reporter Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";

                Cust.Reset;
                Cust.SetRange(Cust."No.", Reporter);
                if Cust.Find('-') then
                    "Reporter Name" := Cust.Name;


                Vend.Reset;
                Vend.SetRange(Vend."No.", Reporter);
                if Vend.Find('-') then
                    "Reporter Name" := Vend.Name;


                Memb.Reset;
                Memb.SetRange(Memb."No.", Reporter);
                if Memb.Find('-') then
                    "Reporter Name" := Memb.Name;
            end;
        }
        field(8; Witness; Code[20])
        {
            TableRelation = Witnesses.No;

            trigger OnValidate()
            begin
                Witn.Reset;
                Witn.SetRange(Witn.No, Witness);
                if Witn.Find('-') then
                    "Witness #1 Name" := Witn.Name;
            end;
        }
        field(9; "Witness #2"; Code[20])
        {
            TableRelation = "HR Employees"."No.";
        }
        field(10; "Action Taken"; Code[20])
        {
            TableRelation = Advocate.No;
        }
        field(11; "Date To Discuss Case"; Date)
        {
        }
        field(13; "Disciplinary Remarks"; Text[30])
        {
        }
        field(14; Comments; Text[250])
        {
        }
        field(15; "Case Discussion"; Boolean)
        {
        }
        field(16; "Body Handling The Complaint"; Code[100])
        {
            TableRelation = "HR Committees".Code;

            trigger OnValidate()
            begin
                HRCommittees.Reset;
                HRCommittees.SetRange(HRCommittees.Code, "Body Handling The Complaint");
                if HRCommittees.Find('-') then
                    "Body Name" := HRCommittees.Description;
            end;
        }
        field(17; Recomendations; Code[10])
        {
        }
        field(23; "No. Series"; Code[20])
        {
        }
        field(24; "Accused Employee"; Code[30])
        {
            TableRelation = IF ("Accused Type" = CONST(Member)) Members."No."
            ELSE
            IF ("Accused Type" = CONST(Supplier)) Vendor."No."
            ELSE
            IF ("Accused Type" = CONST(Tenant)) Customer."No."
            ELSE
            IF ("Accused Type" = CONST(Staff)) "HR Employees"."No.";

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange(Emp."No.", "Accused Employee");
                if Emp.Find('-') then
                    "Accused Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";

                Cust.Reset;
                Cust.SetRange(Cust."No.", "Accused Employee");
                if Cust.Find('-') then
                    "Accused Name" := Cust.Name;


                Vend.Reset;
                Vend.SetRange(Vend."No.", "Accused Employee");
                if Vend.Find('-') then
                    "Accused Name" := Vend.Name;


                Memb.Reset;
                Memb.SetRange(Memb."No.", "Accused Employee");
                if Memb.Find('-') then
                    "Accused Name" := Memb.Name;
            end;
        }
        field(28; "Policy Description"; Text[50])
        {
        }
        field(29; "Taken Action Description"; Text[50])
        {
        }
        field(3963; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility CenterBR".Code;
        }
        field(3964; "Reporter Name"; Text[40])
        {
            Editable = false;
        }
        field(3965; "Witness #1 Name"; Text[50])
        {
        }
        field(3966; "Witness #2  Name"; Text[50])
        {
        }
        field(3968; "Legal Type"; Option)
        {
            OptionCaption = ' ,Internal,External';
            OptionMembers = " ",Internal,External;
        }
        field(3969; "User ID"; Code[50])
        {
            Editable = false;
        }
        field(3970; "Accused Name"; Text[100])
        {
            Editable = false;
        }
        field(50003; "Action Duration Start Date"; Date)
        {

            trigger OnValidate()
            begin
                //"Case Duration":="Action Duration End  Date"-"Action Duration Start Date";
            end;
        }
        field(50004; "Action Duration End  Date"; Date)
        {

            trigger OnValidate()
            begin
                "Case Duration" := "Action Duration End  Date" - "Action Duration Start Date";
            end;
        }
        field(50005; Status; Option)
        {
            Editable = true;
            OptionCaption = 'New,Pending Approval,Approved,Rejected';
            OptionMembers = New,"Pending Approval",Approved,Rejected;
        }
        field(50006; "Plaintiff Type"; Option)
        {
            OptionMembers = " ",Member,Supplier,Tenant,Staff,Others;
        }
        field(50007; Plaintiff; Code[20])
        {
            TableRelation = IF ("Plaintiff Type" = CONST(Member)) Members."No."
            ELSE
            IF ("Plaintiff Type" = CONST(Supplier)) Vendor."No."
            ELSE
            IF ("Plaintiff Type" = CONST(Tenant)) Customer."No."
            ELSE
            IF ("Plaintiff Type" = CONST(Staff)) "HR Employees"."No.";

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange(Emp."No.", Plaintiff);
                if Emp.Find('-') then
                    Name := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";

                Cust.Reset;
                Cust.SetRange(Cust."No.", Plaintiff);
                if Cust.Find('-') then
                    Name := Cust.Name;


                Vend.Reset;
                Vend.SetRange(Vend."No.", Plaintiff);
                if Vend.Find('-') then
                    Name := Vend.Name;


                Memb.Reset;
                Memb.SetRange(Memb."No.", Plaintiff);
                if Memb.Find('-') then
                    Name := Memb.Name;
            end;
        }
        field(50008; Name; Text[100])
        {
            Editable = false;
        }
        field(50009; "Accused Type"; Option)
        {
            OptionMembers = " ",Member,Supplier,Tenant,Staff,"Harambee Sacco";
        }
        field(50010; "Total Cost"; Decimal)
        {
            CalcFormula = Sum("Case Cost List".Cost WHERE(Code = FIELD("Case Number")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50011; "Case Level"; Option)
        {
            OptionMembers = Open,"Pending Hearing","In Proress",Closed;
        }
        field(50012; Appealed; Boolean)
        {
        }
        field(50013; "Case Verdict"; Text[250])
        {
        }
        field(50014; "Reporter Type"; Option)
        {
            OptionMembers = " ",Member,Supplier,Tenant,Staff;
        }
        field(50015; "Body Name"; Text[100])
        {
            Editable = false;
        }
        field(50016; "Case Duration"; Integer)
        {

            trigger OnValidate()
            begin
                "Case Duration" := "Action Duration End  Date" - "Action Duration Start Date";
            end;
        }
        field(50017; "Case Type"; Code[20])
        {
            TableRelation = "Segment/County/Dividend/Signat".Code WHERE(Type = CONST("Case Type"));

            trigger OnValidate()
            begin
                Casetype.Reset;
                Casetype.SetRange(Casetype.Code, "Case Type");
                if Casetype.Find('-') then
                    "Case Description" := Casetype.Description;
            end;
        }
        field(50018; "Case Description"; Text[100])
        {
        }
        field(50019; Others; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Case Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Case Number" = '' then begin
            GenLedgerSetup.Get;
            //NoSeriesMgtInitSeries(GenLedgerSetup."Case Number", xRec."No. Series", 0D, "Case Number", "No. Series");
        end;

        "User ID" := UserId;
    end;

    var
        Emp: Record "HR Employees";
        GenLedgerSetup: Record "Cash Office Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        Vend: Record Vendor;
        Cust: Record Customer;
        Memb: Record Members;
        Witn: Record Witnesses;
        HRCommittees: Record "HR Committees";
        Casetype: Record "Segment/County/Dividend/Signat";
}

