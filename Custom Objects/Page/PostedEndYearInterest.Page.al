page 52185875 "Posted End Year Interest"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "End Year Transfer Header";
    SourceTableView = WHERE(Posted = FILTER(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                }
                field("Distributed Amount"; Rec."Distributed Amount")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field(Cashier; Rec.Cashier)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Posted By"; Rec."Posted By")
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
            }
            part(Control18; "End Year Interest Buffer")
            {
                SubPageLink = No = FIELD("No.");
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        UpdateControls();
    end;

    trigger OnOpenPage()
    begin
        UpdateControls();
    end;

    var
        InterestBuffer: Record "End Year Interest Buffer";
        InterestBuffer2: Record "End Year Interest Buffer";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation",Overdraft,BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp,FuelCard,Appraisal,HRNeed,HRExit,TreasuryTransactions,BSC,"Risk Claim",Delegate,Maint,TellerTransactions,ATMM,GeneralRepair,Saccotransffers,ImprestSurrender,"BL Opening","Risk Closure","Defaulter Recovery","Guarantors Subsitute",MPESAApp,MPESAChange;
        PeriodicActivities: Codeunit "Periodic Activities";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        ErrNotApproved: Label 'This document has not been approved';
        ErrNoEntries: Label 'This Document has no Lines to post';
        MSGEntriesGenerated: Label 'Entries Generated Successfully';
        MSGConfirmation: Label 'Confirm interest Generation for period starting %1 and Ending %2';
        SavingsAccounts: Record "Savings Accounts";
        FromDateS: Text[100];
        ToDateS: Text[100];
        DateFilter: Text[100];
        ProductFactory: Record "Product Factory";
        ProductFactoryCode: Code[20];
        InterestRate: Decimal;
        PayableAccount: Code[20];
        ExpenseAccount: Code[20];
        BankingUserTemplate: Record "Banking User Template";
        GenJournalLine: Record "Gen. Journal Line";
        LineNo: Integer;
        JTemp: Code[20];
        JBatch: Code[20];
        ErrPosted: Label 'This document has already been posted';
        PageEditable: Boolean;
        Members: Record Members;
        SavingsInterestBuffer: Record "Savings Interest Buffer";
        IntEarned: Decimal;

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        if Rec.Posted = true then begin
            PageEditable := false;
        end;
    end;
}

