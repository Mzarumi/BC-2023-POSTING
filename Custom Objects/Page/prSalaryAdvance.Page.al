page 52185674 "prSalary Advance"
{
    PageType = Card;
    SourceTable = "prSalary Advance";

    layout
    {
        area(content)
        {
            group(General)
            {
                Visible = true;
                field("Requisition No."; Rec."Requisition No.")
                {
                    Editable = true;
                    Visible = false;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit then
                            CurrPage.Update;
                    end;
                }
                field("Loan No."; Rec."Loan No.")
                {
                }
                field("Loan Type"; Rec."Loan Type")
                {
                }
                field("Loan Description"; Rec."Loan Description")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                }
                field("Loan Types"; Rec."Loan Types")
                {
                    Visible = false;
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Names"; Rec."Employee Names")
                {
                }
                field("ID No."; Rec."ID No.")
                {
                }
                field(Designation; Rec.Designation)
                {
                }
                field("Months Salary"; Rec."Months Salary")
                {
                    Visible = false;
                }
                field("Advance Amount Requested"; Rec."Advance Amount Requested")
                {
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                }
                field("Reasons for Advance Amount"; Rec."Reasons for Advance Amount")
                {
                    MultiLine = false;
                }
                field("Loan Disbursement Date"; Rec."Loan Disbursement Date")
                {
                }
                field("No of Instalments"; Rec."No of Instalments")
                {
                }
                field("Instalments Amount"; Rec."Instalments Amount")
                {
                }
                field("Loan Principal Repayment"; Rec."Loan Principal Repayment")
                {
                }
                field("Loan Interest Repayment"; Rec."Loan Interest Repayment")
                {
                }
                field(Repayment; Rec.Repayment)
                {
                }
                field("Total Loan Repayment Amount"; Rec."Total Loan Repayment Amount")
                {
                }
                field("Repayment Period"; Rec."Repayment Period")
                {
                    Visible = false;
                }
                field("Repayment Method"; Rec."Repayment Method")
                {
                }
                field("Repayment Frequency"; Rec."Repayment Frequency")
                {
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                }
                field(Balance; Rec.Balance)
                {
                }
                field(County; Rec.County)
                {
                }
                field(Department; Rec.Department)
                {
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                }
                field("1/3/ of Basic Salary"; Rec."1/3/ of Basic Salary")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Eligible; Rec.Eligible)
                {
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    Visible = true;
                }
                field("Expected Repayment Amount"; Rec."Expected Repayment Amount")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Grace Period - Principle (M)"; Rec."Grace Period - Principle (M)")
                {
                }
                field("Grace Period - Interest (M)"; Rec."Grace Period - Interest (M)")
                {
                }
                field("Payroll Code"; Rec."Payroll Code")
                {
                }
                field(Posted; Rec.Posted)
                {
                }
                field(Supervisor; Rec.Supervisor)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Send Approval Request")
                {
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        //Code
                        VarVariant := Rec;
                        //if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        //     CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action("Cancel Approval Request")
                {
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        VarVariant := Rec;
                        //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Post Salary Advance")
                {
                    Caption = 'Post Salary Advance';
                    Image = post;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        prVitalSetupInfo.Get();
                        if Rec.Status = Rec.Status::Approved then
                            //get period
                            period.Reset;
                        period.SetRange(period.Closed, false);
                        if period.Find('-') then
                            transcode.Reset;
                        transcode.SetRange(transcode."Is HR Loan", true);
                        if transcode.Find('-') then
                            Emptrans.Reset;
                        Emptrans.SetRange(Emptrans."Transaction Code", transcode."Transaction Code");
                        Emptrans.SetRange(Emptrans."Employee Code", Rec."Employee No");
                        if Emptrans.Find('-') then
                            // BEGIN
                            //  AMOUNT:=Emptrans.Amount+("Training Cost Cstimated"*(prVitalSetupInfo."Training Deduction Percentage"/100));;
                            //  Emptrans.MODIFY;
                            // END ELSE
                            Emptrans.Init;
                        Emptrans."Employee Code" := Rec."Employee No";
                        Emptrans."Transaction Code" := transcode."Transaction Code";
                        Emptrans."Transaction Name" := transcode."Transaction Name";
                        Emptrans."Period Month" := period."Period Month";
                        Emptrans."Period Year" := period."Period Year";
                        Emptrans."Payroll Period" := period."Date Opened";
                        Emptrans.Amount := Rec.Repayment;
                        Emptrans.Balance := Rec."Total Loan Repayment Amount";
                        Emptrans.Insert;
                        Message('Salary Advance Amount Successfully posted')
                    end;
                }
                action("View Schedule")
                {
                    Caption = 'View Schedule';
                    Image = ViewDetails;
                    Promoted = true;
                    PromotedCategory = "Report";
                    ShortCutKey = 'Ctrl+F7';

                    trigger OnAction()
                    begin

                        //IF Posted=TRUE THEN
                        //ERROR('Loan has been posted, Can only preview schedule');

                        if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Weekly then
                            Evaluate(InPeriod, '1W')
                        else
                            if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Monthly then
                                Evaluate(InPeriod, '1M')
                            else
                                if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Quaterly then
                                    Evaluate(InPeriod, '1Q')
                                else
                                    if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Yearly then
                                        Evaluate(InPeriod, '1Y');


                        Qcounter := 0;
                        Qcounter := 3;
                        //EVALUATE(InPeriod,'1M');
                        GrPrinciple := Rec."Grace Period - Principle (M)";
                        grinterest := Rec."Grace Period - Interest (M)";
                        InitialGraceInt := Rec."Grace Period - Interest (M)";

                        LoansR.Reset;
                        LoansR.SetRange(LoansR."Loan No.", Rec."Loan No.");
                        if LoansR.Find('-') then begin

                            Rec.TestField("Loan Disbursement Date");
                            //Rec.TestField("Repayment Start Date");
                            Rundate := 0D;
                            Rschedule.Reset;
                            Rschedule.SetRange(Rschedule."Loan No.", Rec."Loan No.");
                            if Rschedule.Find('-') then
                                Rschedule.DeleteAll;

                            LoanAmount := LoansR."Amount Approved";//LoansR."Amount Disbursed";
                            InterestRate := LoansR."Interest Rate";
                            RepayPeriod := LoansR."No of Instalments";
                            InitialInstal := LoansR."No of Instalments" + Rec."Grace Period - Principle (M)";
                            Lbalance := LoansR."Amount Approved";
                            RunningDate := LoansR."Loan Disbursement Date";
                            Rundate := LoansR."Loan Disbursement Date";//CALCDATE('-1W',RunningDate);
                            InstalNo := 0;
                            //EVALUATE(RepayInterval,'1W');
                            //EVALUATE(RepayInterval,InPeriod);
                            //MESSAGE('%1,%2',RunningDate,Rundate);
                            //Repayment Frequency
                            if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Weekly then
                                Rundate := CalcDate('-1W', Rundate)
                            else
                                if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Monthly then
                                    Rundate := CalcDate('-1M', Rundate)
                                else
                                    if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Quaterly then
                                        Rundate := CalcDate('-1Q', Rundate)
                                    else
                                        if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Yearly then
                                            Rundate := CalcDate('-1Y', Rundate);
                            //Repayment Frequency


                            repeat
                                InstalNo := InstalNo + 1;
                                //Rundate:=CALCDATE("Instalment Period",Rundate);
                                //Rundate:=CALCDATE('1W',Rundate);


                                //Repayment Frequency
                                if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Weekly then
                                    RunningDate := CalcDate('1W', RunningDate)
                                else
                                    if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Monthly then
                                        RunningDate := CalcDate('1M', RunningDate)
                                    else
                                        if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Quaterly then
                                            RunningDate := CalcDate('1Q', RunningDate)
                                        else
                                            if Rec."Repayment Frequency" = Rec."Repayment Frequency"::Yearly then
                                                RunningDate := CalcDate('1Y', RunningDate);

                                /*IF "Repayment Frequency"="Repayment Frequency"::Daily THEN
                                Rundate:=CALCDATE('-1D',Rundate)
                                ELSE IF "Repayment Frequency"="Repayment Frequency"::Weekly THEN
                                Rundate:=CALCDATE('-1W',Rundate)
                                ELSE IF "Repayment Frequency"="Repayment Frequency"::monthly THEN
                                Rundate:=CALCDATE('-1M',Rundate)
                                ELSE IF "Repayment Frequency"="Repayment Frequency"::Quartely THEN
                                Rundate:=CALCDATE('-1Q',Rundate);*/

                                //Repayment Frequency
                                //RunningDate:=CALCDATE('1M',Rundate);
                                Rundate := CalcDate('30D', Rundate);
                                //kma
                                if Rec."Repayment Method" = Rec."Repayment Method"::Amortised then begin
                                    Rec.TestField("Interest Rate");
                                    Rec.TestField("No of Instalments");
                                    TotalMRepay := Round((InterestRate / 12 / 100) / (1 - Power((1 + (InterestRate / 12 / 100)), -(RepayPeriod))) * (LoanAmount), 0.0001, '>');
                                    LInterest := Round(Lbalance / 100 / 12 * InterestRate, 0.0001, '>');
                                    Lprincipal := TotalMRepay - LInterest;
                                end;

                                if Rec."Repayment Method" = Rec."Repayment Method"::"Straight line" then begin
                                    Rec.TestField("Interest Rate");
                                    Rec.TestField("No of Instalments");
                                    Lprincipal := LoanAmount / RepayPeriod;
                                    LInterest := (InterestRate / 12 / 100) * LoanAmount;
                                    //Grace Period Interest
                                    LInterest := (LInterest * InitialInstal) / (InitialInstal - InitialGraceInt);
                                end;

                                if Rec."Repayment Method" = Rec."Repayment Method"::"Reducing Balance" then begin
                                    Rec.TestField("Interest Rate");
                                    Rec.TestField("No of Instalments");
                                    Lprincipal := LoanAmount / RepayPeriod;
                                    LInterest := (InterestRate / 12 / 100) * Lbalance;
                                end;

                                if Rec."Repayment Method" = Rec."Repayment Method"::Constants then begin
                                    Rec.TestField(Repayment);
                                    if Lbalance < Rec.Repayment then
                                        Lprincipal := Lbalance
                                    else
                                        Lprincipal := Rec.Repayment;
                                    LInterest := Rec."Interest Rate";
                                end;
                                //kma



                                //Grace Period
                                if GrPrinciple > 0 then begin
                                    Lprincipal := 0
                                end else begin
                                    //IF "Instalment Period" <> InPeriod THEN
                                    Lbalance := Lbalance - Lprincipal;
                                end;

                                if grinterest > 0 then
                                    LInterest := 0;

                                GrPrinciple := GrPrinciple - 1;
                                grinterest := grinterest - 1;
                                //Grace Period

                                /*//Q Principle
                                IF "Instalment Period" = InPeriod THEN BEGIN
                                //ADDED
                                IF GrPrinciple <> 0 THEN
                                GrPrinciple:=GrPrinciple-1;
                                IF Qcounter = 1 THEN BEGIN
                                Qcounter:=3;
                                Lprincipal:=Qprinciple+Lprincipal;
                                IF Lprincipal > Lbalance THEN
                                Lprincipal:=Lbalance;
                                Lbalance:=Lbalance-Lprincipal;
                                Qprinciple:=0;
                                END ELSE BEGIN
                                Qcounter:=Qcounter - 1;
                                Qprinciple:=Qprinciple+Lprincipal;
                                IF Qprinciple > Lbalance THEN
                                Qprinciple:=Lbalance;
                                Lprincipal:=0;
                                END

                                END;*/
                                //Q Principle


                                Evaluate(RepayCode, Format(InstalNo));
                                /*
                               WhichDay:=DATE2DWY(RunDate,1);
                               IF WhichDay=6 THEN
                                RunDate:=RunDate+2
                               ELSE IF WhichDay=7 THEN
                                RunDate:=RunDate+1;
                                      */
                                //MESSAGE('which day is %1',WhichDay);

                                //Lbalance:=Lbalance-Lprincipal;
                                //MESSAGE('Rundate %1',Rundate);
                                Rschedule.Init;
                                Rschedule."Repayment Code" := RepayCode;
                                Rschedule."Loan No." := Rec."Loan No.";
                                Rschedule."Loan Amount" := LoanAmount;
                                Rschedule."Instalment No" := InstalNo;
                                Rschedule."Repayment Date" := Rundate;
                                Rschedule."Staff No." := Rec."Employee No";
                                Rschedule."Loan Category" := Rec."Loan Type";
                                Rschedule."Monthly Repayment" := LInterest + Lprincipal;
                                Rschedule."Monthly Interest" := LInterest;
                                Rschedule."Principal Repayment" := Lprincipal;
                                Rschedule.Insert;
                                //WhichDay:=(DATE2DMY,RSchedule."Repayment Date",1);
                                WhichDay := Date2DWY(Rschedule."Repayment Date", 1);
                            //MESSAGE('which day is %1',WhichDay);
                            //BEEP(2,10000);
                            until Lbalance < 1

                        end;

                        Commit;

                        LoanApp.Reset;
                        LoanApp.SetRange(LoanApp."Loan No.", Rec."Loan No.");
                        //if LoanApp.Find('-') then
                        //REPORT.Run(52186039, true, false, LoanApp);

                    end;
                }
            }
        }
    }

    var
        prVitalSetupInfo: Record "PR Vital Setup Info";
        period: Record "PR Payroll Periods";
        transcode: Record "PR Transaction Codes";
        Emptrans: Record "PR Employee Transactions";
        InPeriod: DateFormula;
        Qcounter: Integer;
        GrPrinciple: Integer;
        grinterest: Integer;
        LoansR: Record "prSalary Advance";
        Rschedule: Record "HR Loan Repayment Schedule";
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
        InitialGraceInt: Decimal;
        RepayInterval: DateFormula;
        Qprinciple: Decimal;
        WhichDay: Integer;
        RepayCode: Code[10];
        Lprincipal: Decimal;
        LInterest: Decimal;
        LoanApp: Record "prSalary Advance";
        VarVariant: Variant;
        //CustomApprovals: Codeunit "Custom Approvals Codeunit";
        approvalsMgmt: Codeunit "Approvals Mgmt.";
}

