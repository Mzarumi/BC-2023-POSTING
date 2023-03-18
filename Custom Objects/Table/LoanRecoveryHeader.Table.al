table 52185829 "Loan Recovery Header"
{
    //DrillDownPageID = "Posted Loan Recovery Header";
    //LookupPageID = "Posted Loan Recovery Header";

    fields
    {
        field(1; "No."; Code[10])
        {

            trigger OnValidate()
            begin
                if xRec."No." <> xRec."No." then begin
                    CreditNosSeries.Get;
                    //NoSeriesMgtTestManual(CreditNosSeries."Loan Recovery");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Member No."; Code[20])
        {
            TableRelation = Members;

            trigger OnValidate()
            begin
                if Members.Get("Member No.") then
                    Name := Members.Name
                else
                    Name := '';

                Validate("Recovery Type");
            end;
        }
        field(3; Name; Text[50])
        {
        }
        field(4; "Loan No."; Code[20])
        {
            TableRelation = IF ("Recovery Type" = FILTER(All | Single)) Loans WHERE("Member No." = FIELD("Member No."),
                                                                                 "Total Loan Balance" = FILTER(> 0))
            ELSE
            IF ("Recovery Type" = FILTER(Detachement)) Loans WHERE("Member No." = FIELD("Member No."));

            trigger OnValidate()
            begin
                if Loans.Get("Loan No.") then begin
                    Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest");
                    "Outsatnding Interest" := Loans."Outstanding Interest";
                    "Outstanding Balance" := Loans."Outstanding Balance";


                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
                    SavingsAccounts.SetRange(SavingsAccounts."Product Category", SavingsAccounts."Product Category"::"Deposit Contribution");
                    if SavingsAccounts.Find('-') then begin
                        SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                        "Member Deposits" := SavingsAccounts."Balance (LCY)";
                    end;

                end else begin
                    "Member Deposits" := 0;
                    "Outsatnding Interest" := 0;
                    "Outstanding Balance" := 0;
                end;
            end;
        }
        field(5; "Date Entered"; Date)
        {
        }
        field(6; "Entered By"; Code[50])
        {
        }
        field(7; Status; Option)
        {
            OptionCaption = 'Open,Pending,Approved,Rejected';
            OptionMembers = Open,Pending,Approved,Rejected;
        }
        field(8; "Outstanding Balance"; Decimal)
        {
        }
        field(9; "Outsatnding Interest"; Decimal)
        {
        }
        field(10; "Member Deposits"; Decimal)
        {
        }
        field(11; "No. Series"; Code[20])
        {
        }
        field(12; Recovered; Boolean)
        {
        }
        field(13; "Posting Date"; Date)
        {
        }
        field(14; "Recovery Type"; Option)
        {
            OptionCaption = ' ,Single,All,Detachement';
            OptionMembers = " ",Single,All,Detachement;

            trigger OnValidate()
            begin
                "Outsatnding Interest" := 0;
                "Outstanding Balance" := 0;

                if "Recovery Type" = "Recovery Type"::All then begin
                    Loans.Reset;
                    Loans.SetRange("Member No.", "Member No.");
                    if Loans.Find('-') then begin
                        repeat
                            // IF Loans."Loan Span"<>Loans."Loan Span"::" " THEN BEGIN

                            Loans.CalcFields("Outstanding Balance", "Outstanding Interest");
                            "Outsatnding Interest" := "Outsatnding Interest" + Loans."Outstanding Interest";
                            "Outstanding Balance" := "Outstanding Balance" + Loans."Outstanding Balance";
                        // END;
                        until Loans.Next = 0;
                        SavingsAccounts.Reset;
                        SavingsAccounts.SetRange(SavingsAccounts."Member No.", "Member No.");
                        SavingsAccounts.SetRange(SavingsAccounts."Product Category", SavingsAccounts."Product Category"::"Deposit Contribution");
                        if SavingsAccounts.Find('-') then begin
                            SavingsAccounts.CalcFields(SavingsAccounts."Balance (LCY)");
                            "Member Deposits" := SavingsAccounts."Balance (LCY)";
                        end;
                    end else begin
                        "Outsatnding Interest" := 0;
                        "Outstanding Balance" := 0;
                        "Member Deposits" := 0;
                    end;
                end;
            end;
        }
        field(15; "Detach Recovery No"; Code[20])
        {
            Enabled = true;
            TableRelation = "Loan Recovery Header"."No." WHERE("Member No." = FIELD("Member No."),
                                                                "Recovery Type" = FILTER(<> Detachement));
        }
        field(16; "Detachment Reason"; Option)
        {
            OptionMembers = " ","Repaying correctly","Refinanced internally","CEO/Credit MGR Approved","Under Investigation","Clearing in full",Deceased,"Repaying Partially";
        }
        field(17; "Modify Recovered"; Boolean)
        {
        }
        field(18; "Modified By"; Text[50])
        {
        }
        field(19; "Date Modified"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            CreditNosSeries.Get;
            CreditNosSeries.TestField(CreditNosSeries."Loan Recovery");
            //NoSeriesMgtInitSeries(CreditNosSeries."Loan Recovery", xRec."No. Series", 0D, "No.", "No. Series");

        end;
        "Entered By" := UserId;
        "Date Entered" := Today;
        GeneralSetUp.Get;
        LRHeader.Reset;
        LRHeader.SetRange("Entered By", UserId);
        LRHeader.SetRange(Status, LRHeader.Status::Open);
        LRHeader.SetRange(Recovered, false);
        if LRHeader.Find('-') then begin
            if LRHeader.Count >= GeneralSetUp."Max Store Open Documents" then
                Error('This user has documents that have not been used  Do No %1', LRHeader."No.");
        end;
    end;

    var
        CreditNosSeries: Record "Credit Nos. Series";
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        Members: Record Members;
        Loans: Record Loans;
        SavingsAccounts: Record "Savings Accounts";
        LoanAmount: Decimal;
        InterestAmount: Decimal;
        LRHeader: Record "Loan Recovery Header";
        GeneralSetUp: Record "General Set-Up";
        DetachNoEnabled: Boolean;
        DetachReasonEnabled: Boolean;
}

