page 52185846 "Checkoff Advice Header"
{
    PageType = Card;
    SourceTable = "Checkoff Advice Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Date Entered"; Rec."Date Entered")
                {
                }
                field("Employer Code"; Rec."Employer Code")
                {
                }
                field("Employer Name"; Rec."Employer Name")
                {
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Period; Rec.Period)
                {
                    Editable = false;
                }
                field("Loan Issue Cut OFF Date"; Rec."Loan Issue Cut OFF Date")
                {
                }
                field("Loan Interest Cut OFF Date"; Rec."Loan Interest Cut OFF Date")
                {
                }
                field("Captured By"; Rec."Captured By")
                {
                    Editable = false;
                }
                field(Processed; Rec.Processed)
                {
                    Editable = false;
                }
            }
            part(Control10; "Checkoff Advice")
            {
                Editable = EditBuff;
                SubPageLink = "Advice Header No." = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Export New Loans")
            {
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    CheckoffAdviceHeader.Reset;
                    CheckoffAdviceHeader.SetRange(CheckoffAdviceHeader."No.", Rec."No.");
                    if CheckoffAdviceHeader.Find('-') then
                        XMLPORT.Run(52185498, true, true, CheckoffAdviceHeader);
                end;
            }
            action("Generate Advice")
            {
                Image = CreateLinesFromJob;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Loan Interest Cut OFF Date");
                    Rec.TestField("Loan Issue Cut OFF Date");
                    if Rec.Processed = false then begin
                        //here//PeriodicActivities.MonthlyCheckoffAdvice(Rec)

                    end else
                        Error(Txt0001);

                    Message(Txt0002);
                end;
            }
            action("Mark as Processed")
            {
                Image = AlternativeAddress;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //here//PeriodicActivities.ProcessAdvice(Rec);
                end;
            }
            action("Checkoff Advice - Loans")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetFilter("No.", Rec."No.");
                    //REPORT.Run(52185656, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action("Checkoff Advice - Cummulative")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetFilter("No.", Rec."No.");
                    //REPORT.Run(52185650, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action("Checkoff Advice - Savings")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetFilter("No.", Rec."No.");
                    //REPORT.Run(52185651, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action("Checkoff Advice - Loans Main")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetFilter("No.", Rec."No.");
                    //REPORT.Run(52185666, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action("Checkoff Advice - Effective Variance")
            {
                Caption = ' Effective Variance';
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetFilter("No.", Rec."No.");
                    //REPORT.Run(52185692, true, true, Rec);
                    Rec.Reset;
                end;
            }
            action("KDF Options")
            {
                Image = UpdateDescription;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    AdviceLine: Record "Checkoff Advice Line";
                    KDFpf: Integer;
                    StaffNo: Integer;
                begin
                    Rec.TestField("Employer Code", '05');

                    AdviceLine.Reset;
                    AdviceLine.SetRange(AdviceLine."Advice Header No.", Rec."No.");
                    if AdviceLine.Find('-') then begin
                        repeat
                            Evaluate(StaffNo, AdviceLine."Payroll No");
                            KDFpf := StaffNo;
                            if (KDFpf <= 16999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Army;
                            AdviceLine.Modify;
                            if (KDFpf >= 17000) and (KDFpf <= 21999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Officers;
                            AdviceLine.Modify;
                            if (KDFpf >= 22000) and (KDFpf <= 22999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Army;
                            AdviceLine.Modify;
                            if (KDFpf >= 30000) and (KDFpf <= 36999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Navy;
                            AdviceLine.Modify;
                            if (KDFpf >= 37000) and (KDFpf <= 37999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Officers;
                            AdviceLine.Modify;
                            if (KDFpf >= 38000) and (KDFpf <= 39999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Army;
                            AdviceLine.Modify;
                            if (KDFpf >= 40000) and (KDFpf <= 43999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::"Army-Const";
                            AdviceLine.Modify;
                            if (KDFpf >= 44000) and (KDFpf <= 46999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Army;
                            AdviceLine.Modify;
                            if (KDFpf >= 47000) and (KDFpf <= 47999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Officers;
                            AdviceLine.Modify;
                            if (KDFpf >= 48000) and (KDFpf <= 49999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Officers;
                            AdviceLine.Modify;
                            if (KDFpf >= 50000) and (KDFpf <= 88000) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Army;
                            AdviceLine.Modify;
                            if (KDFpf >= 89000) and (KDFpf <= 99999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Army;
                            AdviceLine.Modify;
                            if (KDFpf >= 100000) and (KDFpf <= 109999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::"Air Force";
                            AdviceLine.Modify;
                            if (KDFpf >= 110000) and (KDFpf <= 129999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::"Air Force";
                            AdviceLine.Modify;
                            if (KDFpf >= 130000) and (KDFpf <= 139999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Officers;
                            AdviceLine.Modify;
                            if (KDFpf >= 140000) and (KDFpf <= 149999) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Navy;
                            AdviceLine.Modify;
                            if (KDFpf >= 150000) and (KDFpf <= 160000) then
                                AdviceLine."DOD Options" := AdviceLine."DOD Options"::Army;
                            AdviceLine.Modify;
                        until AdviceLine.Next = 0;
                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.Processed = true then
            CurrPage.Editable := false;
    end;

    var
        PeriodicActivities: Codeunit "Periodic Activities";
        CheckoffAdviceHeader: Record "Checkoff Advice Header";
        EditBuff: Boolean;
        Txt0001: Label 'Advice already processed';
        Txt0002: Label 'Advice Generated Successfully';
}

