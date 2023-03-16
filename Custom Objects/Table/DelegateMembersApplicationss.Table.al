table 52186061 "Delegate Members Applicationss"
{
    //DrillDownPageID = "Delegate Members";
    //LookupPageID = "Delegate Members";

    fields
    {
        field(1; "Code"; Code[50])
        {
            Description = 'Lookup to Delegate groups';
            Editable = false;
        }
        field(2; "Delegate MNO."; Code[50])
        {
            Description = 'Lookup to Member table';
            TableRelation = Members."No.";

            trigger OnValidate()
            begin
                TestField("Job Tittle");
                TestField(Position);

                GeneralSetUp.Get();
                DelegateMemberss.Reset;
                DelegateMemberss.SetRange(DelegateMemberss."Delegate MNO.", "Delegate MNO.");
                DelegateMemberss.SetRange(Retired, false);
                if DelegateMemberss.Find('-') then begin
                    Error('This member is already a member of %1', DelegateMemberss.Code);
                end;
                Validate(Position);
                if Members.Get("Delegate MNO.") then begin
                    if (CalcDate(GeneralSetUp."Min.Delegate Membership Period", Members."Registration Date")) > Today then
                        Error(ErrMemb, GeneralSetUp."Min.Delegate Membership Period");
                    //chech where salary is passing through'
                    if GeneralSetUp."Requires Salary Processing" = true then begin
                        Account.Reset;
                        Account.SetRange("Member No.", Members."No.");
                        Account.SetRange("Loan Disbursement Account", true);
                        Account.SetCurrentKey(Blocked);
                        if Account.Find('-') then begin
                            AccountNo := Account."No.";
                            EndDateSalo := CalcDate('-' + Format(GeneralSetUp."Salary Period"), Today);
                            SalProc.Reset;
                            SalProc.SetRange("Account No.", AccountNo);
                            SalProc.SetRange("Posting Date", EndDateSalo, Today);
                            SalProc.SetRange(Posted, true);
                            if not SalProc.Find('-') then
                                Error(Text010);
                        end;
                        SavingsAccount.Reset;
                        SavingsAccount.SetRange(SavingsAccount."Member No.", "Delegate MNO.");
                        SavingsAccount.SetRange(SavingsAccount."Product Category", SavingsAccount."Product Category"::"Share Capital");
                        if SavingsAccount.Find('-') then begin
                            SavingsAccount.CalcFields(SavingsAccount."Balance (LCY)");
                            //MESSAGE(FORMAT(SavingsAccount."Balance (LCY)"));
                            if SavingsAccount."Balance (LCY)" < GeneralSetUp."Min. Delegates Share Capital" then
                                Error('This member donot meet the required Share Capital of %1', GeneralSetUp."Min. Delegates Share Capital");
                        end else
                            Error('This member does not have Share Capital account');

                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Delegate MNO.");
                        SavingsAccounts.SetRange(SavingsAccounts."Product Category", SavingsAccounts."Product Category"::"Deposit Contribution");
                        if SavingsAccounts.Find('-') then begin
                            SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                            // MESSAGE(FORMAT(SavingsAccounts."Balance (LCY)"));
                            if SavingsAccounts."Balance (LCY)" < GeneralSetUp."Min. Delegates deposit" then
                                Error('This member donot meet the required deposit contribution of %1', GeneralSetUp."Min. Delegates deposit");
                        end else
                            Error('This member does not have Deposit Contribution account');
                    end;


                    DelegateGroupsApplicationss.Reset;
                    DelegateGroupsApplicationss.SetRange(DelegateGroupsApplicationss.Code, Code);
                    if DelegateGroupsApplicationss.Find('-') then begin
                        // IF DelegateGroupsApplicationss."Global Dimension 2 Code"<>Members."Global Dimension 2 Code" THEN
                        //  ERROR('Member No.: %1 belong to Branch: %2 and therefore cannot represent  Branch: %3',Members."No.",Members."Global Dimension 2 Code",DelegateGroupsApplicationss."Global Dimension 2 Code");
                    end;
                    "Global Dimension 2 Code" := Members."Global Dimension 2 Code";
                    Validate("Global Dimension 2 Code");
                    "Delegate Name" := Members.Name;
                    "ID No." := Members."ID No.";
                    "Appointment Date" := Today;
                end;
            end;
        }
        field(3; "Delegate Name"; Text[100])
        {
            Editable = false;
        }
        field(4; Position; Code[50])
        {
            Description = 'Lookup 39004358 filter type tittle';
            TableRelation = "Salutation Tittles".Code WHERE(Type = CONST(Position));

            trigger OnValidate()
            begin
                DelegateMembers.Reset;
                DelegateMembers.SetRange(Code, Code);
                DelegateMembers.SetRange(Position, Position);
                if DelegateMembers.Find('-') then begin
                    if Position <> '' then
                        Error(ErrPosition, Position);
                end;
            end;
        }
        field(5; "Job Tittle"; Code[50])
        {
            Description = '39004358';
            TableRelation = "Salutation Tittles".Code WHERE(Type = CONST(Tittle));
        }
        field(6; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending,Approved';
            OptionMembers = Open,Pending,Approved;
        }
        field(7; Address; Text[100])
        {
        }
        field(8; "Appointment Date"; Date)
        {
        }
        field(9; "Expiry Date"; Date)
        {
        }
        field(10; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Branch Code.';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                DimensionValue.Reset;
                DimensionValue.SetRange(Code, "Global Dimension 2 Code");
                if DimensionValue.Find('-') then begin
                    "Global Dimension 2 Name" := DimensionValue.Name;
                end;
            end;
        }
        field(11; "Global Dimension 2 Name"; Code[50])
        {
            Caption = 'Branch Name';
            Editable = false;
        }
        field(12; "ID No."; Code[20])
        {
        }
        field(13; "Delegate Code"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Delegate MNO.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Members: Record Members;
        DelegateMembers: Record "Delegate Members Applicationss";
        ErrPosition: Label 'You cannot have the same position of %1 within the same group';
        GeneralSetUp: Record "General Set-Up";
        ErrMemb: Label 'This member has not met minimum membership period of %1';
        DelegateMemberss: Record "Delegate Memberss";
        DelegateGroupsApplicationss: Record "Delegate Region Applicationss";
        DimensionValue: Record "Dimension Value";
        EndDateSalo: Date;
        SalProc: Record "Salary Lines";
        Text010: Label 'This member does not receive salary through the sacco';
        Account: Record "Savings Accounts";
        AccountNo: Code[20];
        SavingsAccounts: Record "Savings Accounts";
        SavingsAccount: Record "Savings Accounts";
}

