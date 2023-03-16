page 52186582 "HR Staff Loan Request"
{
    SourceTable = "HR Staff Loan Request";

    layout
    {
        area(content)
        {
            group(Control1000000002)
            {
                ShowCaption = false;
                field("Loan No."; Rec."Loan No.")
                {
                    Editable = false;
                }
                field("Loan Type"; Rec."Loan Type")
                {
                }
                field("Loan Description"; Rec."Loan Description")
                {
                    Editable = false;
                }
                field("Emp No."; Rec."Emp No.")
                {
                    Editable = false;
                }
                field("Emp Name"; Rec."Emp Name")
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Editable = false;
                }
                field("Date Created"; Rec."Date Created")
                {
                    Editable = false;
                }
                field("Amount Requested"; Rec."Amount Requested")
                {
                    Editable = AmountRequestedEditable;
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                    Editable = AmountApprovedEditable;
                }
                field("Loan Disbursement Date"; Rec."Loan Disbursement Date")
                {
                    Editable = LoanDisbDateEditable;
                }
                field(Interest; Rec.Interest)
                {
                    Editable = false;
                }
                field("New Car"; Rec."New Car")
                {
                    Editable = Logbookeditable;
                    Enabled = Logbookeditable;
                }
                field(Plot; Rec.Plot)
                {
                }
                field(Building; Rec.Building)
                {
                }
                field("No of Instalments"; Rec."No of Instalments")
                {
                    Editable = NoofInstEdiatble;
                }
                field("Instalments Amount"; Rec."Instalments Amount")
                {
                    Editable = false;
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    Editable = false;
                }
                field(Balance; Rec.Balance)
                {
                    Editable = false;
                }
                field("Supervisor Email"; Rec."Supervisor Email")
                {
                    Editable = false;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Car Reg No"; Rec."Car Reg No")
                {
                    Editable = CarloanEditable;
                    Enabled = CarloanEditable;
                }
                field("Log Book No"; Rec."Log Book No")
                {
                    Editable = Logbookeditable;
                    Enabled = Logbookeditable;
                }
                field("Driving Licence No"; Rec."Driving Licence No")
                {
                    Editable = DriverlicenceNoEditable;
                    HideValue = DriverlicenceNoEditable;
                }
                field("Insurance Company"; Rec."Insurance Company")
                {
                    Editable = DriverlicenceNoEditable;
                    Enabled = DriverlicenceNoEditable;
                }
                field("Insurance No."; Rec."Insurance No.")
                {
                    Editable = DriverlicenceNoEditable;
                    Enabled = DriverlicenceNoEditable;
                }
                field("Repayment Frequency"; Rec."Repayment Frequency")
                {
                    Editable = false;
                }
                field(Selected; Rec.Selected)
                {
                }
                field("Outstanding Interest"; Rec."Outstanding Interest")
                {
                    Editable = false;
                }
                field(NetPay; Rec.NetPay)
                {
                }
            }
            part(Control1000000000; "HR Staff Loan Guarantors")
            {
                SubPageLink = "Loan No" = FIELD("Loan No.");
            }
        }
    }

    actions
    {
    }

    var
        WhichDay: Integer;
        RepayCode: Code[10];
        Lprincipal: Decimal;
        LInterest: Decimal;
        HREmp: Record "HR Employees";
        EmpJobDesc: Text[50];
        HRJobs: Record "HR Jobs";
        SupervisorName: Text[60];
        //SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        dAlloc: Decimal;
        dEarnd: Decimal;
        dTaken: Decimal;
        dLeft: Decimal;
        cReimbsd: Decimal;
        cPerDay: Decimal;
        cbf: Decimal;
        HRSetup: Record "HR Setup";
        EmpDept: Text[30];
        HRLeaveApp: Record "HR Leave Application";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batch,"Payment Voucher","Petty Cash",Requisition,Loan,Interbank,Imprest,Checkoff,"FOSA Account Opening",StandingOrder,HRJob,HRLeave,HRTraining,"HREmp Requsition",MicroTrans,"Account Reactivation","Overdraft ",BLA,"Benevolent Fund","Staff Claim",TransportRequisition,FuelRequisition,DailyWorkTicket,StaffLoan,HRBatch,Overtime,FTransfer,"Edit Member","Loan Officer",HREmp;
        ApprovalEntries: Page "Approval Entries";
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        EmpName: Text[70];
        ApprovalComments: Page "Approval Comments";
        [InDataSet]
        "Application CodeEditable": Boolean;
        [InDataSet]
        "Leave TypeEditable": Boolean;
        [InDataSet]
        "Days AppliedEditable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Start DateEditable": Boolean;
        [InDataSet]
        "Leave Allowance AmountEditable": Boolean;
        LoanApp: Record "HR Staff Loan Request";
        [InDataSet]
        RelieverEditable: Boolean;
        [InDataSet]
        RequestLeaveAllowanceEditable: Boolean;
        [InDataSet]
        SupervisorEditable: Boolean;
        [InDataSet]
        "Cell Phone NumberEditable": Boolean;
        [InDataSet]
        "Details of ExaminationEditable": Boolean;
        [InDataSet]
        "Date of ExamEditable": Boolean;
        [InDataSet]
        NumberofPreviousAttemptsEditab: Boolean;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        LeaveGjline: Record "HR Leave Journal Template";
        "LineNo.": Integer;
        sDate: Record Date;
        Customized: Record "HR Leave Calendar Lines";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRLeavePeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Batch";
        InPeriod: DateFormula;
        Qcounter: Integer;
        GrPrinciple: Integer;
        LoansR: Record "HR Staff Loan Request";
        LoanAmount: Decimal;
        InterestRate: Decimal;
        RepayPeriod: Integer;
        InitialInstal: Decimal;
        Lbalance: Decimal;
        Rundate: Date;
        InstalNo: Integer;
        TotalMRepay: Decimal;
        RunningDate: Date;
        AmountRequestededitable: Boolean;
        AmountApprovedEditable: Boolean;
        LoanDisbDateEditable: Boolean;
        NoofInstEdiatble: Boolean;
        CarloanEditable: Boolean;
        Logbookeditable: Boolean;
        DriverlicenceNoEditable: Boolean;
        grinterest: Integer;
        InitialGraceInt: Decimal;
        RepayInterval: DateFormula;
        Qprinciple: Decimal;
}

