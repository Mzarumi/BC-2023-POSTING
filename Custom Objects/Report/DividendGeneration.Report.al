#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185624 "Dividend Generation"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Savings Accounts"; "Savings Accounts")
        {
            DataItemTableView = where("Product Type" = filter(02 | 03));
            RequestFilterFields = "No.", "Employer Code";
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                DividendSetUp.Get();

                // intProgressI +=1;
                //
                // IF (intProgressI >= NoOfRecsProgress) OR (TIME - TimeProgress > 1000) THEN BEGIN
                //  NoOfProgressed := NoOfProgressed + intProgressI;
                //  diaProgress.UPDATE(1,ROUND(NoOfProgressed / intProgressTotal * 10000,1));
                //  intProgressI := 0;
                //  TimeProgress := TIME;
                // END;
                //
                //
                // // DividendSetUp.GET();
                // //
                // // DividendProgression.RESET;
                // // DividendProgression.SETRANGE("Member No",Members."No.");
                // // DividendProgression.SETRANGE(DividendProgression.Year,DATE2DWY(DividendSetUp."End Date",3));
                // // IF DividendProgression.FIND('-') THEN
                // // DividendProgression.DELETEALL;
                //
                // DividendProcess.generateDivdends("Savings Accounts");



                if ProductFactory.Get("Savings Accounts"."Product Type") then begin
                    if ProductFactory."Dividend Calc. Method" <> ProductFactory."dividend calc. method"::" " then begin
                        DividendProgression.Reset;
                        DividendProgression.SetRange(DividendProgression.Year, Date2dwy(DividendSetUp."Start Date", 3));
                        DividendProgression.SetRange("Account No", "Savings Accounts"."No.");
                        if DividendProgression.Find('-') then
                            DividendProgression.DeleteAll;

                        intProgressI += 1;

                        if (intProgressI >= NoOfRecsProgress) or (Time - TimeProgress > 1000) then begin
                            NoOfProgressed := NoOfProgressed + intProgressI;
                            diaProgress.Update(1, ROUND(NoOfProgressed / intProgressTotal * 10000, 1));
                            intProgressI := 0;
                            TimeProgress := Time;
                        end;
                        //MESSAGE("Savings Accounts"."No.");


                        // DividendProcess.generateDivdends("Savings Accounts");
                    end;
                end;
            end;

            trigger OnPostDataItem()
            begin
                diaProgress.Close;
            end;

            trigger OnPreDataItem()
            begin
                intProgressTotal := "Savings Accounts".Count;

                intProgressI := 0;
                TimeProgress := Time;
                NoOfRecsProgress := intProgressTotal DIV 100;
                NoOfProgressed := 0;

                diaProgress.Open(GeneratingDividends + '@1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@', intProgress);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    var
        // DividendProcess: Codeunit 52185459;
        Members: Record "Members";
    begin
        //ERROR('Contact ICT');
    end;

    trigger OnPreReport()
    var
        // DividendProcess: Codeunit 52185459;
        SavingsAccounts: Record 52185730;
    begin
    end;

    var
        Text001: label 'Successfully Processed.';
        // DividendProcess: Codeunit 52185459;
        intProgressTotal: Integer;
        diaProgress: Dialog;
        intProgressI: Integer;
        GeneratingDividends: label 'Generating Dividends';
        intProgress: Integer;
        TimeProgress: Time;
        NoOfProgressed: Integer;
        NoOfRecsProgress: Integer;
        DividendSetUp: Record 52185708;
        DividendProgression: Record 52185713;
        ProductFactory: Record 52185690;
}
