table 52186211 "Banking Account Closure"
{

    fields
    {
        field(1; No; Code[10])
        {
            Editable = false;
        }
        field(2; "Application Date"; Date)
        {
            Editable = false;
        }
        field(3; "Member No"; Code[20])
        {
            TableRelation = Members;

            trigger OnValidate()
            begin
                "Account Balance" := 0;
                "Account Name" := '';
                "Member Name" := '';
                "Account No" := '';
                "Closure Date" := 0D;
                Members.Reset;
                Members.SetRange("No.", "Member No");
                if Members.Find('-') then
                    "Member Name" := Members.Name;
            end;
        }
        field(4; "Member Name"; Text[100])
        {
            Editable = false;
        }
        field(5; "Account No"; Code[20])
        {
            TableRelation = "Savings Accounts" WHERE("Member No." = FIELD("Member No"),
                                                      Status = FILTER(<> Closed),
                                                      "Product Category" = FILTER("Junior Savings" | "Holiday Account" | "Investment Account" | "Fixed Deposit" | " "));

            trigger OnValidate()
            begin
                "Account Balance" := 0;
                "Account Name" := '';

                SavingsAccounts.Reset;
                SavingsAccounts.SetRange("No.", "Account No");
                if SavingsAccounts.Find('-') then begin
                    SavingsAccounts.CalcFields("Balance (LCY)");
                    "Account Balance" := SavingsAccounts."Balance (LCY)";
                    "Account Name" := SavingsAccounts.Name;
                end;
            end;
        }
        field(6; "Reason For Account Closure"; Text[100])
        {
        }
        field(7; "Account Balance"; Decimal)
        {
            Editable = false;
        }
        field(8; "Closure Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Closure Date" <> Today then "Closure Date" := Today;
            end;
        }
        field(9; "User Id"; Code[50])
        {
            Editable = false;
        }
        field(10; Closed; Boolean)
        {
            Editable = false;
        }
        field(11; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending,Rejected,Approved';
            OptionMembers = Open,Pending,Rejected,Approved;
        }
        field(12; "Account Name"; Text[100])
        {
            Editable = false;
        }
        field(13; "No. Series"; Code[20])
        {
            Editable = false;
        }
        field(14; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(15; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            Editable = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(16; "Closed By"; Code[50])
        {
            Editable = false;
        }
        field(17; "Date Closed"; Date)
        {
            Editable = false;
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
            MembNoSeries.Get;
            MembNoSeries.TestField(MembNoSeries."Account Closure");
            //NoSeriesMgtInitSeries(MembNoSeries."Account Closure", xRec.No, 0D, No, "No. Series");
            "User Id" := UserId;
            "Application Date" := Today;
            //"Document No.":=Code;
        end;
        if UserSetup.Get(UserId) then begin
            "Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
            "Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
        end;
    end;

    var
        Members: Record Members;
        SavingsAccounts: Record "Savings Accounts";
        MembNoSeries: Record "Banking No Setup";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
}

