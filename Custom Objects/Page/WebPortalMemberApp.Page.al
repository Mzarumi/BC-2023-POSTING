page 52186687 "Web Portal Member App"
{
    CardPageID = "Virtual Registreation Page";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Sky Virtual Member";
    SourceTableView = WHERE(Validated = CONST(false),
                            "Sent To Application" = CONST(false),
                            "Source Application" = CONST("Members Portal"),
                            Status = FILTER(Open | Pending | Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field("ID Number"; Rec."ID Number")
                {
                    Editable = false;
                }
                field(Telephone; Rec.Telephone)
                {
                    Editable = false;
                }
                field(Names; Rec.Names)
                {
                    Editable = false;
                }
                field("Name on IPRS"; Rec."Name on IPRS")
                {
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    Editable = false;
                }
                field(Gender; Rec.Gender)
                {
                    Editable = false;
                }
                field(Email; Rec.Email)
                {
                }
                field(Citizenship; Rec.Citizenship)
                {
                    Editable = false;
                }
                field("Service Number"; Rec."Service Number")
                {
                }
                field(Employer; Rec.Employer)
                {
                }
                field("Entry Date"; Rec."Entry Date")
                {
                    Editable = false;
                }
                field("Entry Time"; Rec."Entry Time")
                {
                    Editable = false;
                }
                field("Reffered By"; Rec."Reffered By")
                {
                    Editable = false;
                }
                field("Referer Member No"; Rec."Referer Member No")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    Editable = false;
                }
                field("Payroll Number"; Rec."Payroll Number")
                {
                    Editable = false;
                }
                field(Validated; Rec.Validated)
                {
                    Editable = false;
                }
                field("Sent To Application"; Rec."Sent To Application")
                {
                    Editable = false;
                }
                field("Actioned By"; Rec."Actioned By")
                {
                    Editable = false;
                }
                field("Source Application"; Rec."Source Application")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
        }
    }

    var
        MemberApplication: Record "Member Application";
        SeriesSetup: Record "Credit Nos. Series";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        MemberAppNo: Code[50];
        Members: Record Members;
        RecruiterMemberNo: Code[30];
        RecruiterName: Text[50];
        Source: Option NEW_MEMBER,NEW_ACCOUNT,LOAN_ACCOUNT_APPROVAL,DEPOSIT_CONFIRMATION,CASH_WITHDRAWAL_CONFIRM,LOAN_APPLICATION,LOAN_APPRAISAL,LOAN_GUARANTORS,LOAN_REJECTED,LOAN_POSTED,LOAN_DEFAULTED,SALARY_PROCESSING,TELLER_CASH_DEPOSIT,TELLER_CASH_WITHDRAWAL,TELLER_CHEQUE_DEPOSIT,FIXED_DEPOSIT_MATURITY,INTERACCOUNT_TRANSFER,ACCOUNT_STATUS,STATUS_ORDER,EFT_EFFECTED,ATM_APPLICATION_FAILED,ATM_COLLECTION,MBANKING,MEMBER_CHANGES,CASHIER_BELOW_LIMIT,CASHIER_ABOVE_LIMIT,INTERNETBANKING,CRM,MOBILE_PIN;
        // SkyMbanking: Codeunit "Sky Mbanking";
        ProductFactory: Record "Product Factory";
        AutoOpenSavingAccs: Record "Savings Account Registration";
        // CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
}

