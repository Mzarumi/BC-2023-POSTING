#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185758 "Interest Due Period"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Interest Due Period";"Interest Due Period")
        {
            column(ReportForNavId_1; 1)
            {
            }

            trigger OnPreDataItem()
            begin

                AccountingPeriod."Interest Due Date" := FiscalYearStartDate;
                AccountingPeriod.TestField("Interest Due Date");

                if AccountingPeriod.Find('-') then begin
                  FirstPeriodStartDate := AccountingPeriod."Interest Due Date";
                  FirstPeriodLocked := AccountingPeriod."Date Locked";
                  if (FiscalYearStartDate < FirstPeriodStartDate) and FirstPeriodLocked then
                    if not
                       Confirm(
                         Text000 +
                         Text001)
                    then
                      exit;
                  if AccountingPeriod.Find('+') then
                    LastPeriodStartDate := AccountingPeriod."Interest Due Date";
                end else
                  if not
                     Confirm(
                       Text002 +
                       Text003)
                  then
                    exit;

                FiscalYearStartDate2 := FiscalYearStartDate;

                for i := 1 to NoOfPeriods + 1 do begin
                  if (FiscalYearStartDate <= FirstPeriodStartDate) and (i = NoOfPeriods + 1) then
                    exit;

                  if (FirstPeriodStartDate <> 0D) then
                    if (FiscalYearStartDate >= FirstPeriodStartDate) and (FiscalYearStartDate < LastPeriodStartDate) then
                      Error(Text004);

                  AccountingPeriod.Init;
                  AccountingPeriod."Interest Due Date" := FiscalYearStartDate;
                  //AccountingPeriod."Interest Calcuation Date":=CALCDATE('1M-1D',FiscalYearStartDate);
                  AccountingPeriod."Interest Calcuation Date":=FiscalYearStartDate;
                  AccountingPeriod."Period End Date":=CalcDate ('CM', FiscalYearStartDate);
                  AccountingPeriod."No of Days":=((CalcDate ('CM', FiscalYearStartDate))-FiscalYearStartDate)+1;
                  AccountingPeriod.Validate("Interest Due Date");
                  if (i = 1) or (i = NoOfPeriods + 1) then begin
                    AccountingPeriod."New Fiscal Year" := true;
                    InvtSetup.Get;
                    AccountingPeriod."Average Cost Calc. Type" := InvtSetup."Average Cost Calc. Type";
                    AccountingPeriod."Average Cost Period" := InvtSetup."Average Cost Period";
                  end;
                  if (FirstPeriodStartDate = 0D) and (i = 1) then
                    AccountingPeriod."Date Locked" := true;
                  if (AccountingPeriod."Interest Due Date" < FirstPeriodStartDate) and FirstPeriodLocked then begin
                    AccountingPeriod.Closed := true;
                    //AccountingPeriod."Date Locked" := TRUE;
                  end;
                  if not AccountingPeriod.Find('=') then
                    AccountingPeriod.Insert;
                  FiscalYearStartDate := CalcDate(PeriodLength,FiscalYearStartDate);

                  //MESSAGE('FiscalYearStartDate %1',FiscalYearStartDate);
                end;

                AccountingPeriod.Get(FiscalYearStartDate2);
                AccountingPeriod.UpdateAvgItems(0);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date";FiscalYearStartDate)
                {
                    ApplicationArea = Basic;
                }
                field("No Of Periods";NoOfPeriods)
                {
                    ApplicationArea = Basic;
                }
                field("Period Length";PeriodLength)
                {
                    ApplicationArea = Basic;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        if NoOfPeriods = 0 then begin
          NoOfPeriods := 1;
          Evaluate(PeriodLength,'<1M>');
        end;
        if AccountingPeriod.Closed=false then
          begin
        if AccountingPeriod.Find('+') then
          FiscalYearStartDate := AccountingPeriod."Interest Due Date";
        end;
    end;

    var
        AccountingPeriod: Record 52185861;
        InvtSetup: Record "Inventory Setup";
        NoOfPeriods: Integer;
        PeriodLength: DateFormula;
        FiscalYearStartDate: Date;
        FiscalYearStartDate2: Date;
        FirstPeriodStartDate: Date;
        LastPeriodStartDate: Date;
        FirstPeriodLocked: Boolean;
        i: Integer;
        Text000: label 'The new Interest period begins before an existing interest period, so the new year will be closed automatically.\\';
        Text001: label 'Do you want to create and close the interest period?';
        Text002: label 'Once you create the new interest period you cannot change its starting date.\\';
        Text003: label 'Do you want to create the interest period?';
        Text004: label 'It is only possible to create new interest period before or after the existing ones.';
}
