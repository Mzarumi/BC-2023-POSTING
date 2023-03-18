#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52186460 "Dividend Process"
{

    trigger OnRun()
    begin
        //**generateDivdends();
    end;

    var
        Text002: label 'Generating Dividend: #1#########\';
        Text003: label 'Member Name: #2#############\';
        DividendProgression: Record 52185713;
        DividendSetUp: Record 52185708;
        StartDate: Date;
        EndDate: Date;
        DateFilter: Text;
        ProductFactory: Record 52185690;
        SavingsAccounts: Record 52185730;
        DivPayMode: Code[20];
        DividendInstructions: Record 52185712;
        Text004: label 'Div-';
        Loans: Record 52185729;
        YearDateFilter: Text;
        GrossAmount: Decimal;
        GeneralSetUp: Record 52185689;
        Year: Integer;
        PreviousYear: Integer;
        DividendPostingBufferII: Record 52185714;
        Mydeduction: Decimal;
        OrigiGrosss: Decimal;


    procedure getDividendRate(DividendsSimulationHeader: Record 52185710)
    var
        DividendAccount: Code[20];
        DividendCalculationBuffer: Record 52185711;
    begin
        DividendCalculationBuffer.Reset;
        DividendCalculationBuffer.SetRange(DividendCalculationBuffer."Document No.", DividendsSimulationHeader."No.");
        if DividendCalculationBuffer.FindSet then
            DividendCalculationBuffer.DeleteAll;

        getDividendSetup;

        getSavingsContribution(StartDate, EndDate, DividendsSimulationHeader."G/L Account", 12, '1',
                               DividendsSimulationHeader."Product Type", DividendsSimulationHeader."No.");
    end;


    procedure getSavingsContribution(StartDate: Date; EndDate: Date; DividendAccount: Code[20]; CalculationPeriod: Integer; SimulationNo: Code[20]; ProductType: Code[10]; DocumentNo: Code[10])
    var
        GLAccount: Record "G/L Account";
        DividendCalculationBuffer: Record 52185711;
        i: Integer;
        LineNo: Integer;
        x: Integer;
    begin
        getDividendSetup;

        x := CalculationPeriod;
        for i := 1 to CalculationPeriod do begin
            GLAccount.Reset;
            LineNo += 1;
            if i = 1 then begin
                EndDate := CalcDate('CM', StartDate);
                GLAccount.SetRange(GLAccount."Date Filter", 0D, EndDate);
            end else
                GLAccount.SetRange(GLAccount."Date Filter", StartDate, EndDate);
            GLAccount.SetRange(GLAccount."No.", DividendAccount);
            if GLAccount.FindFirst then
                GLAccount.CalcFields(GLAccount."Net Change");

            with DividendCalculationBuffer do begin
                Init;
                "No." := SimulationNo;
                "Entry No" := LineNo;
                "G/L Account" := DividendAccount;
                "Start Date" := StartDate;
                "End Date" := EndDate;
                Amount := Abs(GLAccount."Net Change");
                "Weighted Amount" := Amount * (x / CalculationPeriod);
                "Product Type" := ProductType;
                "Document No." := DocumentNo;
                Insert;
            end;

            StartDate := CalcDate('1M', StartDate);
            EndDate := CalcDate('CM', StartDate);
            x := x - 1;
        end;
    end;


    procedure generateDivdends(DividendAccount: Record 52185730)
    var
        GrossDiv: Decimal;
        WTaxDiv: Decimal;
        NetDiv: Decimal;
        FromDate: Date;
        ToDate: Date;
        EntrNo: Integer;
        diaProgress: Dialog;
        MemberNo: label 'Member No: ';
        MemberName: label 'Name: ';
        intProgress: Integer;
        timProgress: Time;
        intProgressI: Integer;
        intProgressTotal: Integer;
        CustMembr: Record 52185700;
        SavingsAcc: Record 52185730;
        GeneratingDividends: label 'Generating Dividend :';
        Counter1: Integer;
        Counter2: Integer;
        GrossDividend: Decimal;
        WeightedShareDep: Decimal;
    begin
        /*
        getDividendSetup;
        DividendSetUp.GET();
        
        
        //MESSAGE('%1',DATE2DWY(DividendSetUp."Start Date",3));
        DividendProgression.RESET;
        DividendProgression.SETRANGE("Member No",custmemberno);
        DividendProgression.SETRANGE(DividendProgression.Year,DATE2DWY(DividendSetUp."Start Date",3));
        DividendProgression.DELETEALL;
        
        
        {intProgressI := 0;
        diaProgress.OPEN(GeneratingDividends+'@1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@',intProgress);}
        {ProductFactory.SETFILTER(ProductFactory."Product Class Type",'%1',ProductFactory."Product Class Type"::Savings);
        ProductFactory.SETFILTER(ProductFactory."Dividend Calc. Method",'<>%1',ProductFactory."Dividend Calc. Method"::" ");
        IF ProductFactory.FIND('-') THEN BEGIN
         REPEAT
         }
        
        {WITH CustMemb DO BEGIN
          REPEAT}
        //SavingsAccounts.SETRANGE(SavingsAccounts."Product Type",ProductFactory."Product ID");
         SavingsAccounts.SETRANGE("Member No.",custmemberno);
         SavingsAccounts.SETFILTER(SavingsAccounts."Product Type",'%1|%2','02','03');
         IF SavingsAccounts.FIND('-') THEN BEGIN
          intProgressTotal := SavingsAccounts.COUNT;
          REPEAT
        {intProgressI +=1;
          diaProgress.UPDATE(1,intProgressI); }
          ProductFactory.GET(SavingsAccounts."Product Type");
          SavingsAcc := SavingsAccounts;
          YearDateFilter:='..'+FORMAT(EndDate);
        
           CASE ProductFactory."Dividend Calc. Method" OF
        
            ProductFactory."Dividend Calc. Method"::"Flat Rate" :
             BEGIN
              DateFilter:='..'+FORMAT(EndDate);
        
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'>0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  GrossDiv:=(ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)";
                  WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                  NetDiv:= GrossDiv - WTaxDiv; EntrNo+=1;
                  IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                  DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
        
              CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                  SavingsAcc."Balance (LCY)"*(12/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                  EndDate,StartDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
             END;
        
             ProductFactory."Dividend Calc. Method"::Prorated :
              BEGIN
               FromDate:=StartDate;
               YearDateFilter:='..'+FORMAT(EndDate);
               ToDate:=CALCDATE('-1D',StartDate);
               DateFilter:='..'+FORMAT(CALCDATE('-1D',FromDate));
                   SavingsAcc.RESET;
                   SavingsAcc.SETRANGE("No.",SavingsAccounts."No.");
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(12/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                   DivPayMode:=CustMembr."Dividend Payment Method";
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(12/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   CALCDATE('-1D',FromDate),CALCDATE('-1D',FromDate),ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
               FromDate:=StartDate;
               ToDate:=CALCDATE('1M-1D',StartDate);
               DateFilter:=FORMAT(FromDate)+'..'+FORMAT(ToDate);
                   SavingsAcc.RESET;
                   SavingsAcc.SETRANGE("No.",SavingsAccounts."No.");
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(11/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                   DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(11/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   ToDate,FromDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
               FromDate:=CALCDATE('1M',StartDate);
               ToDate:=CALCDATE('2M-1D',StartDate);
               DateFilter:=FORMAT(FromDate)+'..'+FORMAT(ToDate);
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(10/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                   DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(10/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   ToDate,FromDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
               FromDate:=CALCDATE('2M',StartDate);
               ToDate:=CALCDATE('3M-1D',StartDate);
               DateFilter:=FORMAT(FromDate)+'..'+FORMAT(ToDate);
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(9/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                   DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(9/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   ToDate,FromDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
        
        
               FromDate:=CALCDATE('3M',StartDate);
               ToDate:=CALCDATE('4M-1D',StartDate);
               DateFilter:=FORMAT(FromDate)+'..'+FORMAT(ToDate);
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(8/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                   DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(8/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   ToDate,FromDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
               FromDate:=CALCDATE('4M',StartDate);
               ToDate:=CALCDATE('5M-1D',StartDate);
               DateFilter:=FORMAT(FromDate)+'..'+FORMAT(ToDate);
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(7/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                  DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(7/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   ToDate,FromDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
               FromDate:=CALCDATE('5M',StartDate);
               ToDate:=CALCDATE('6M-1D',StartDate);
               DateFilter:=FORMAT(FromDate)+'..'+FORMAT(ToDate);
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(6/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                   DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(6/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   ToDate,FromDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
               FromDate:=CALCDATE('6M',StartDate);
               ToDate:=CALCDATE('7M-1D',StartDate);
               DateFilter:=FORMAT(FromDate)+'..'+FORMAT(ToDate);
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(5/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                   DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(5/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   ToDate,FromDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
               FromDate:=CALCDATE('7M',StartDate);
               ToDate:=CALCDATE('8M-1D',StartDate);
               DateFilter:=FORMAT(FromDate)+'..'+FORMAT(ToDate);
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(4/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                   DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(4/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   ToDate,FromDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
               FromDate:=CALCDATE('8M',StartDate);
               ToDate:=CALCDATE('9M-1D',StartDate);
               DateFilter:=FORMAT(FromDate)+'..'+FORMAT(ToDate);
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(3/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                   DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(3/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   ToDate,FromDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
               FromDate:=CALCDATE('9M',StartDate);
               ToDate:=CALCDATE('10M-1D',StartDate);
               DateFilter:=FORMAT(FromDate)+'..'+FORMAT(ToDate);
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(2/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                   DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(2/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   ToDate,FromDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
               FromDate:=CALCDATE('10M',StartDate);
               ToDate:=CALCDATE('11M-1D',StartDate);
               DateFilter:=FORMAT(FromDate)+'..'+FORMAT(ToDate);
                   SavingsAcc.SETFILTER(SavingsAcc."Date Filter",DateFilter);
                   SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                   GrossDiv:=((ProductFactory."Interest Rate (Min.)"/100)*SavingsAcc."Balance (LCY)")*(1/12);
                   WTaxDiv:=GrossDiv*(ProductFactory."WithHolding Tax"/100);
                   NetDiv:=GrossDiv - WTaxDiv; EntrNo+=1;
                   IF CustMembr.GET(SavingsAccounts."Member No.") THEN
                   DivPayMode:=CustMembr."Dividend Payment Method";
        
        {//Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  WTaxDiv:=0;GrossDiv:=0;NetDiv:=0;
                  END;}
               CreateDividendLines(SavingsAcc."No.",TODAY,SavingsAcc."Product Type",SavingsAcc."Product Name",SavingsAcc."Member No.",
                                   SavingsAcc."Balance (LCY)"*(1/12),SavingsAcc."Balance (LCY)",GrossDiv,WTaxDiv,NetDiv,
                                   ToDate,FromDate,ProductFactory."Dividend Calc. Method",EntrNo,DivPayMode);
        
        
              END;
           END;
        //Withdrawn
                  SavingsAcc.RESET;
                  SavingsAcc.SETRANGE("No.",SavingsAccounts."No.");
                  SavingsAcc.SETFILTER(SavingsAcc."Date Filter",YearDateFilter);
                  SavingsAcc.SETFILTER(SavingsAcc."Balance (LCY)",'<=0');
                  SavingsAcc.CALCFIELDS(SavingsAcc."Balance (LCY)");
                  IF SavingsAcc.FIND('-') THEN BEGIN
                  DividendProgression.RESET;
                  DividendProgression.SETRANGE("Account No",SavingsAcc."No.");
                  DividendProgression.SETRANGE("Processing Date",TODAY);
                  IF DividendProgression.FIND('-')THEN
                    DividendProgression.DELETEALL;
                  END;
        
          UNTIL SavingsAccounts.NEXT=0;
         END;
        
         {UNTIL CustMemb.NEXT=0
         END;}
         //UNTIL ProductFactory.NEXT=0;
        //END;
        {diaProgress.CLOSE;}
        
        GenerateDividendPostingEntries(custmemberno);
        {CustMembr.RESET;
        CustMembr.SETCURRENTKEY(CustMembr."No.");
        CustMembr.SETFILTER(CustMembr."No.",DividendProgression."Member No");
        GenerateDividendPostingEntries(CustMembr);}
        
        
        */

        with DividendAccount do begin

            getDividendSetup;
            //Interest On Deposits
            ProductFactory.Reset;
            ProductFactory.SetRange("Product ID", "Product Type");
            ProductFactory.SetRange("Product Class Type", ProductFactory."product class type"::Savings);
            ProductFactory.SetRange("Product Category", ProductFactory."product category"::"Deposit Contribution");
            ProductFactory.SetFilter("Dividend Calc. Method", '<>%1', ProductFactory."dividend calc. method"::" ");
            if ProductFactory.Find('-') then begin

                intProgressTotal := DividendAccount.Count;
                YearDateFilter := '..' + Format(EndDate);

                case ProductFactory."Dividend Calc. Method" of
                    ProductFactory."dividend calc. method"::"Flat Rate":
                        begin
                            DateFilter := '..' + Format(EndDate);

                            SetFilter("Date Filter", DateFilter);
                            SetFilter("Balance (LCY)", '>0');
                            CalcFields("Balance (LCY)");
                            GrossDiv := (ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)";
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get("Member No.") then begin
                                DivPayMode := CustMembr."Dividend Payment Method";
                                //      IF (CustMembr.Status=CustMembr.Status::Closed) AND (CustMembr."Withdrawal Date"<DividendSetUp."Start Date") OR (CustMembr."Withdrawal Date"=0D)
                                //         OR (CustMembr.Status=CustMembr.Status::Withdrawal) AND (CustMembr."Withdrawal Date"<DividendSetUp."Start Date") OR (CustMembr."Withdrawal Date"=0D)
                                //        THEN BEGIN
                                //        GrossDiv:=0;WTaxDiv:=0;NetDiv:=0;
                                //        END;
                            end;
                            CreateDividendLines(
                            "No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                            EndDate, StartDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);
                        end;

                    ProductFactory."dividend calc. method"::Prorated:
                        begin

                            FromDate := StartDate;
                            YearDateFilter := '..' + Format(EndDate);
                            ToDate := CalcDate('-1D', StartDate);
                            DateFilter := YearDateFilter;//'..'+FORMAT(CALCDATE('-1D',StartDate));

                            Reset;
                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");

                            if "Balance (LCY)" > 0 then begin



                                FromDate := StartDate;
                                YearDateFilter := '..' + Format(EndDate);
                                ToDate := CalcDate('-1D', StartDate);
                                DateFilter := '..' + Format(CalcDate('-1D', StartDate));

                                Reset;
                                SetFilter("Date Filter", DateFilter);
                                CalcFields("Balance (LCY)");
                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (12 / 12);
                                WeightedShareDep := (("Balance (LCY)") * (12 / 12));
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                // IF CustMembr.GET("Member No.") THEN
                                //DivPayMode:=CustMembr."Dividend Payment Method";
                                if CustMembr.Get("Member No.") then begin
                                    DivPayMode := CustMembr."Dividend Payment Method";
                                    /*IF (CustMembr.Status=CustMembr.Status::Closed) AND (CustMembr."Withdrawal Date"<DividendSetUp."Start Date") OR (CustMembr."Withdrawal Date"=0D)
                                     OR (CustMembr.Status=CustMembr.Status::Withdrawal) AND (CustMembr."Withdrawal Date"<DividendSetUp."Start Date") OR (CustMembr."Withdrawal Date"=0D)
                                    THEN BEGIN
                                    GrossDiv:=0;WTaxDiv:=0;NetDiv:=0;
                                    END;*/
                                end;

                                CreateDividendLines(
                                "No.", Today, "Product Type", "Product Name", "Member No.",
                                "Balance (LCY)" * (12 / 12), "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv, CalcDate('-1D', FromDate),
                                 CalcDate('-1D', FromDate), ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                                FromDate := StartDate;
                                ToDate := CalcDate('1M-1D', StartDate);
                                DateFilter := Format(FromDate) + '..' + Format(ToDate);

                                Reset;
                                SetFilter("Date Filter", DateFilter);

                                CalcFields("Balance (LCY)");
                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (11 / 12);
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                WeightedShareDep := (("Balance (LCY)") * (11 / 12));
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                if CustMembr.Get("Member No.") then
                                    DivPayMode := CustMembr."Dividend Payment Method";


                                CreateDividendLines(
                                "No.", Today, "Product Type", "Product Name", "Member No.",
                                "Balance (LCY)" * (11 / 12), "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                                ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                                FromDate := CalcDate('1M', StartDate);
                                ToDate := CalcDate('2M-1D', StartDate);
                                DateFilter := Format(FromDate) + '..' + Format(ToDate);

                                SetFilter("Date Filter", DateFilter);
                                CalcFields("Balance (LCY)");
                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (10 / 12);
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                WeightedShareDep := (("Balance (LCY)") * (10 / 12));
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                if CustMembr.Get("Member No.") then
                                    DivPayMode := CustMembr."Dividend Payment Method";


                                CreateDividendLines(
                                "No.", Today, "Product Type", "Product Name", "Member No.",
                                "Balance (LCY)" * (10 / 12), "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                                ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                                FromDate := CalcDate('2M', StartDate);
                                ToDate := CalcDate('3M-1D', StartDate);
                                DateFilter := Format(FromDate) + '..' + Format(ToDate);

                                SetFilter("Date Filter", DateFilter);
                                CalcFields("Balance (LCY)");

                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (9 / 12);
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                WeightedShareDep := (("Balance (LCY)") * (9 / 12));
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                if CustMembr.Get("Member No.") then
                                    DivPayMode := CustMembr."Dividend Payment Method";


                                CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                                "Balance (LCY)" * (9 / 12), "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                                ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                                FromDate := CalcDate('3M', StartDate);
                                ToDate := CalcDate('4M-1D', StartDate);
                                DateFilter := Format(FromDate) + '..' + Format(ToDate);

                                SetFilter("Date Filter", DateFilter);
                                CalcFields("Balance (LCY)");
                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (8 / 12);
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                WeightedShareDep := (("Balance (LCY)") * (8 / 12));
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                if CustMembr.Get("Member No.") then
                                    DivPayMode := CustMembr."Dividend Payment Method";


                                CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                               "Balance (LCY)" * (8 / 12), "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                                ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                                FromDate := CalcDate('4M', StartDate);
                                ToDate := CalcDate('5M-1D', StartDate);
                                DateFilter := Format(FromDate) + '..' + Format(ToDate);

                                SetFilter("Date Filter", DateFilter);
                                CalcFields("Balance (LCY)");
                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (7 / 12);
                                WeightedShareDep := (("Balance (LCY)") * (7 / 12));
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                if CustMembr.Get("Member No.") then
                                    DivPayMode := CustMembr."Dividend Payment Method";


                                CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                                "Balance (LCY)" * (7 / 12), "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                               ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                                FromDate := CalcDate('5M', StartDate);
                                ToDate := CalcDate('6M-1D', StartDate);
                                DateFilter := Format(FromDate) + '..' + Format(ToDate);

                                SetFilter("Date Filter", DateFilter);
                                CalcFields("Balance (LCY)");
                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (6 / 12);
                                WeightedShareDep := (("Balance (LCY)") * (6 / 12));
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                if CustMembr.Get(SavingsAccounts."Member No.") then
                                    DivPayMode := CustMembr."Dividend Payment Method";

                                CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                                "Balance (LCY)" * (6 / 12), "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                                ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                                FromDate := CalcDate('6M', StartDate);
                                ToDate := CalcDate('7M-1D', StartDate);
                                DateFilter := Format(FromDate) + '..' + Format(ToDate);

                                SetFilter("Date Filter", DateFilter);
                                CalcFields("Balance (LCY)");
                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (5 / 12);
                                WeightedShareDep := (("Balance (LCY)") * (5 / 12));
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                if CustMembr.Get(SavingsAccounts."Member No.") then
                                    DivPayMode := CustMembr."Dividend Payment Method";


                                CreateDividendLines(
                                "No.", Today, "Product Type", "Product Name", "Member No.",
                                "Balance (LCY)" * (5 / 12), "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                                ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                                FromDate := CalcDate('7M', StartDate);
                                ToDate := CalcDate('8M-1D', StartDate);
                                DateFilter := Format(FromDate) + '..' + Format(ToDate);

                                SetFilter("Date Filter", DateFilter);
                                CalcFields("Balance (LCY)");
                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (4 / 12);
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                WeightedShareDep := (("Balance (LCY)") * (4 / 12));
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                if CustMembr.Get("Member No.") then
                                    DivPayMode := CustMembr."Dividend Payment Method";


                                CreateDividendLines(
                                "No.", Today, "Product Type", "Product Name",
                                "Member No.", "Balance (LCY)" * (4 / 12), "Balance (LCY)", GrossDiv, WTaxDiv,
                                NetDiv, ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                                FromDate := CalcDate('8M', StartDate);
                                ToDate := CalcDate('9M-1D', StartDate);
                                DateFilter := Format(FromDate) + '..' + Format(ToDate);

                                SetFilter("Date Filter", DateFilter);
                                CalcFields("Balance (LCY)");

                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (3 / 12);
                                WeightedShareDep := (("Balance (LCY)") * (3 / 12));
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                if CustMembr.Get("Member No.") then
                                    DivPayMode := CustMembr."Dividend Payment Method";


                                CreateDividendLines(
                                "No.", Today, "Product Type", "Product Name", "Member No.",
                                "Balance (LCY)" * (3 / 12), "Balance (LCY)", GrossDiv, WTaxDiv,
                                NetDiv, ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                                FromDate := CalcDate('9M', StartDate);
                                ToDate := CalcDate('10M-1D', StartDate);
                                DateFilter := Format(FromDate) + '..' + Format(ToDate);

                                SetFilter("Date Filter", DateFilter);
                                CalcFields("Balance (LCY)");
                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (2 / 12);
                                WeightedShareDep := (("Balance (LCY)") * (2 / 12));
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                if CustMembr.Get("Member No.") then
                                    DivPayMode := CustMembr."Dividend Payment Method";

                                CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                                "Balance (LCY)" * (2 / 12), "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                                ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                                FromDate := CalcDate('10M', StartDate);
                                ToDate := CalcDate('11M-1D', StartDate);
                                DateFilter := Format(FromDate) + '..' + Format(ToDate);

                                SetFilter("Date Filter", DateFilter);
                                CalcFields("Balance (LCY)");
                                GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (1 / 12);
                                WeightedShareDep := (("Balance (LCY)") * (1 / 12));
                                WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                                NetDiv := GrossDiv - WTaxDiv;
                                EntrNo += 1;
                                if CustMembr.Get(SavingsAccounts."Member No.") then
                                    DivPayMode := CustMembr."Dividend Payment Method";


                                CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                                "Balance (LCY)" * (1 / 12), "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                                ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);


                            end;
                        end;

                end;
            end;
            //Dividend
            ProductFactory.Reset;
            ProductFactory.SetRange("Product ID", "Product Type");
            ProductFactory.SetRange("Product Class Type", ProductFactory."product class type"::Savings);
            ProductFactory.SetRange("Product Category", ProductFactory."product category"::"Share Capital");
            ProductFactory.SetFilter("Dividend Calc. Method", '<>%1', ProductFactory."dividend calc. method"::" ");
            if ProductFactory.Find('-') then begin

                intProgressTotal := DividendAccount.Count;
                YearDateFilter := '..' + Format(EndDate);

                case ProductFactory."Dividend Calc. Method" of
                    ProductFactory."dividend calc. method"::"Flat Rate":
                        begin
                            DateFilter := '..' + Format(EndDate);

                            SetFilter("Date Filter", DateFilter);
                            SetFilter("Balance (LCY)", '>0');
                            CalcFields("Balance (LCY)");
                            GrossDiv := (ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)";
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get("Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";
                            /*BEGIN
                          DivPayMode:=CustMembr."Dividend Payment Method";
                            IF (CustMembr.Status=CustMembr.Status::Closed) OR (CustMembr.Status=CustMembr.Status::Withdrawal) THEN BEGIN
                              GrossDiv:=0;WTaxDiv:=0;NetDiv:=0;
                              END;
                      END;*/
                            CreateDividendLines(
                            "No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                            EndDate, StartDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);
                        end;

                    ProductFactory."dividend calc. method"::Prorated:
                        begin

                            FromDate := StartDate;
                            YearDateFilter := '..' + Format(EndDate);
                            ToDate := CalcDate('-1D', StartDate);
                            DateFilter := '..' + Format(CalcDate('-1D', FromDate));

                            Reset;
                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");
                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (12 / 12);
                            WeightedShareDep := (("Balance (LCY)") * (12 / 12));
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get("Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";
                            /*         IF CustMembr.GET("Member No.") THEN BEGIN
                           DivPayMode:=CustMembr."Dividend Payment Method";
                             IF (CustMembr.Status=CustMembr.Status::Closed) OR (CustMembr.Status=CustMembr.Status::Withdrawal) THEN BEGIN
                               GrossDiv:=0;WTaxDiv:=0;NetDiv:=0;
                               END;
                       END;*/

                            CreateDividendLines(
                            "No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv, CalcDate('-1D', FromDate),
                             CalcDate('-1D', FromDate), ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                            FromDate := StartDate;
                            ToDate := CalcDate('1M-1D', StartDate);
                            DateFilter := Format(FromDate) + '..' + Format(ToDate);

                            Reset;
                            SetFilter("Date Filter", DateFilter);

                            CalcFields("Balance (LCY)");
                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (11 / 12);
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            WeightedShareDep := (("Balance (LCY)") * (11 / 12));
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get("Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";


                            CreateDividendLines(
                            "No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                            ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                            FromDate := CalcDate('1M', StartDate);
                            ToDate := CalcDate('2M-1D', StartDate);
                            DateFilter := Format(FromDate) + '..' + Format(ToDate);

                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");
                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (10 / 12);
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            WeightedShareDep := (("Balance (LCY)") * (10 / 12));
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get("Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";


                            CreateDividendLines(
                            "No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                            ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                            FromDate := CalcDate('2M', StartDate);
                            ToDate := CalcDate('3M-1D', StartDate);
                            DateFilter := Format(FromDate) + '..' + Format(ToDate);

                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");

                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (9 / 12);
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            WeightedShareDep := (("Balance (LCY)") * (9 / 12));
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get("Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";


                            CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                            ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                            FromDate := CalcDate('3M', StartDate);
                            ToDate := CalcDate('4M-1D', StartDate);
                            DateFilter := Format(FromDate) + '..' + Format(ToDate);

                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");
                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (8 / 12);
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            WeightedShareDep := (("Balance (LCY)") * (8 / 12));
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get("Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";


                            CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                           "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                            ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                            FromDate := CalcDate('4M', StartDate);
                            ToDate := CalcDate('5M-1D', StartDate);
                            DateFilter := Format(FromDate) + '..' + Format(ToDate);

                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");
                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (7 / 12);
                            WeightedShareDep := (("Balance (LCY)") * (7 / 12));
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get("Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";


                            CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                           ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                            FromDate := CalcDate('5M', StartDate);
                            ToDate := CalcDate('6M-1D', StartDate);
                            DateFilter := Format(FromDate) + '..' + Format(ToDate);

                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");
                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (6 / 12);
                            WeightedShareDep := (("Balance (LCY)") * (6 / 12));
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get(SavingsAccounts."Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";

                            CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                            ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                            FromDate := CalcDate('6M', StartDate);
                            ToDate := CalcDate('7M-1D', StartDate);
                            DateFilter := Format(FromDate) + '..' + Format(ToDate);

                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");
                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (5 / 12);
                            WeightedShareDep := (("Balance (LCY)") * (5 / 12));
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get(SavingsAccounts."Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";


                            CreateDividendLines(
                            "No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                            ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                            FromDate := CalcDate('7M', StartDate);
                            ToDate := CalcDate('8M-1D', StartDate);
                            DateFilter := Format(FromDate) + '..' + Format(ToDate);

                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");
                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (4 / 12);
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            WeightedShareDep := (("Balance (LCY)") * (4 / 12));
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get("Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";


                            CreateDividendLines(
                            "No.", Today, "Product Type", "Product Name",
                            "Member No.", "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv,
                            NetDiv, ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                            FromDate := CalcDate('8M', StartDate);
                            ToDate := CalcDate('9M-1D', StartDate);
                            DateFilter := Format(FromDate) + '..' + Format(ToDate);

                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");

                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (3 / 12);
                            WeightedShareDep := (("Balance (LCY)") * (3 / 12));
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get("Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";


                            CreateDividendLines(
                            "No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv,
                            NetDiv, ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                            FromDate := CalcDate('9M', StartDate);
                            ToDate := CalcDate('10M-1D', StartDate);
                            DateFilter := Format(FromDate) + '..' + Format(ToDate);

                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");
                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (2 / 12);
                            WeightedShareDep := (("Balance (LCY)") * (2 / 12));
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get("Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";

                            CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                            ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);

                            FromDate := CalcDate('10M', StartDate);
                            ToDate := CalcDate('11M-1D', StartDate);
                            DateFilter := Format(FromDate) + '..' + Format(ToDate);

                            SetFilter("Date Filter", DateFilter);
                            CalcFields("Balance (LCY)");
                            GrossDiv := ((ProductFactory."Interest Rate (Min.)" / 100) * "Balance (LCY)") * (1 / 12);
                            WeightedShareDep := (("Balance (LCY)") * (1 / 12));
                            WTaxDiv := GrossDiv * (ProductFactory."WithHolding Tax" / 100);
                            NetDiv := GrossDiv - WTaxDiv;
                            EntrNo += 1;
                            if CustMembr.Get(SavingsAccounts."Member No.") then
                                DivPayMode := CustMembr."Dividend Payment Method";


                            CreateDividendLines("No.", Today, "Product Type", "Product Name", "Member No.",
                            "Balance (LCY)", "Balance (LCY)", GrossDiv, WTaxDiv, NetDiv,
                            ToDate, FromDate, ProductFactory."Dividend Calc. Method", EntrNo, DivPayMode);


                        end;
                end;

            end;

        end;

    end;


    procedure CreateDividendLines(AccountNo: Code[20]; ProcessingDate: Date; ProductID: Code[20]; ProductName: Text; MemberNo: Code[20]; QualifyingShares: Decimal; DivShares: Decimal; GrossDiv: Decimal; DivWHoldingTax: Decimal; NetDiv: Decimal; DivEndDate: Date; DivStartDate: Date; DivCalcMethod: Option " ","Flat Rate",Prorated; EntrNo: Integer; PayMode: Code[20])
    var
        CustMembr: Record 52185700;
        DivYear: Integer;
    begin
        if CustMembr.Get(MemberNo) then begin
            //** IF CustMembr."Dividend Action"=CustMembr."Dividend Action"::Pay THEN BEGIN
            EntrNo += 1;
            DividendProgression.Init;
            DividendProgression."Entry No." := EntrNo;
            DividendProgression."Account No" := AccountNo;
            DividendProgression."Processing Date" := ProcessingDate;
            DividendProgression."Product Type" := ProductID;
            DividendProgression."Product Name" := PadStr(ProductName, 20);
            DividendProgression."Member No" := MemberNo;
            DividendProgression."Qualifying Shares" := QualifyingShares;
            DividendProgression.Shares := DivShares;
            DividendProgression."Gross Dividends" := GrossDiv;
            DividendProgression."Witholding Tax" := DivWHoldingTax;
            DividendProgression."Net Dividends" := NetDiv;
            DividendProgression."Start Date" := DividendSetUp."Start Date";
            DividendProgression."End Date" := DivEndDate;
            DividendProgression."Dividend Calc. Method" := DivCalcMethod;
            DividendProgression."Payment Mode" := PayMode;
            //DivYear := DATE2DWY(20220101D,3);
            //MESSAGE(FORMAT(DivYear));
            DividendProgression.Year := Date2dwy(CalcDate('1Y', StartDate), 3);
            //MESSAGE('StartDate %1, Year %2',StartDate,DividendProgression.Year);
            if DividendProgression."Qualifying Shares" <> 0 then
                DividendProgression.Insert;
            //**END;
        end;
    end;


    procedure GenerateDividendPostingEntries(CustMemberNo: Code[20])
    var
        DividendProgression: Record 52185713;
        DividendInstructionsMember: Record 52185712;
        DividendInstructionsAmount: Decimal;
        SavingsAccounts: Record 52185730;
        RunBal: Decimal;
        SCapitalDiff: Decimal;
        GlobalDim1: Code[10];
        GlobalDim2: Code[10];
        TopupShares: label 'Topup Share Capital :-';
        DividendEarned: label 'Dividend Earned :-';
        DividendDeductions: label 'Dividend Deductions :-';
        LoanInterest: label 'Loan Interest :-';
        LoanBills: label 'Loan Bill :-';
        LoanPrincipal: label 'Loan Principal :-';
        LoanApps: Record 52185729;
        InterestonLoan: Decimal;
        PrincipalonLoan: Decimal;
        Defaulter: Boolean;
        DividendInstructionsExists: Boolean;
        DividendPostingBuffer: Record 52185714;
        EntrNo: Integer;
        CustMembr: Record 52185700;
        "==": Integer;
        TransactionCharges: Record 52185774;
        ChargeAmount: Decimal;
        TChargeAmount: Decimal;
        TariffDetails: Record 52185777;
        GeneralSetUp: Record 52185689;
        TransactionCharge: label 'Transaction Charge :-';
        ExciseDuty: label 'Excise Duty :-';
        TCharges: Decimal;
        diaProgress: Dialog;
        intProgress: Integer;
        timProgress: Time;
        intProgressI: Integer;
        intProgressTotal: Integer;
        GeneratepostLines: label 'Create Posting Lines :';
        SavingsAccountNo: Code[50];
        SavingsProductID: Code[10];
        SavingsProductName: Text;
        TotalNetAmount: Decimal;
        CreditAccount: Record 52185731;
        SavingsAcc: Record 52185730;
        CapitaliazeAcc: Code[20];
        DepContAccType: Code[10];
        SharesAccType: Code[10];
        DividendProgression1: Record 52185713;
        ShareCapAcc: Code[20];
    begin
        Year := Date2dmy(Today, 3);
        PreviousYear := Year - 1;

        DividendPostingBufferII.Reset;
        DividendPostingBufferII.SetRange("Member No.", CustMemberNo);
        DividendPostingBufferII.SetRange("Document No.", ('DIV-' + Format(PreviousYear)));
        DividendPostingBufferII.SetRange(Posted, true);
        if not DividendPostingBufferII.Find('-') then begin
            //ERROR('HERE');



            DividendPostingBuffer.Reset;
            if DividendPostingBuffer.FindLast then
                EntrNo := DividendPostingBuffer."Entry No.";

            /*intProgressI := 0;
            diaProgress.OPEN(GeneratepostLines+'@1@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@',intProgress);*/
            Year := Date2dmy(Today, 3);
            PreviousYear := Year - 1;
            getDividendSetup;

            with CustMembr do begin
                CustMembr.SetFilter(CustMembr."No.", CustMemberNo);
                intProgressTotal := CustMembr.Count;
                repeat
                    /*
                    intProgressI +=1;
                    diaProgress.UPDATE(1,intProgressI);*/

                    GlobalDim1 := CustMembr."Global Dimension 1 Code";
                    GlobalDim2 := CustMembr."Global Dimension 2 Code";

                    //Identify Loan Defaulter
                    GeneralSetUp.Get();


                    //Identify Members without Dividend Instructions
                    DividendInstructionsExists := false;
                    DividendInstructionsMember.Reset;
                    DividendInstructionsMember.SetRange(DividendInstructionsMember."Member No.", CustMembr."No.");
                    if DividendInstructionsMember.FindFirst then
                        DividendInstructionsExists := true; //Identify Members without Dividend Instructions

                    SavingsAccounts.Reset;
                    SavingsAccounts.SetRange(SavingsAccounts."Member No.", CustMembr."No.");
                    SavingsAccounts.SetFilter(SavingsAccounts."Loan Disbursement Account", '%1', true);
                    if SavingsAccounts.Find('-') then begin
                        SavingsAccountNo := SavingsAccounts."No.";
                        SavingsProductID := SavingsAccounts."Product Type";
                        SavingsProductName := SavingsAccounts."Product Name";
                    end;

                    SavingsAcc.Reset;
                    SavingsAcc.SetRange("Member No.", CustMembr."No.");
                    SavingsAcc.SetRange("Product Category", SavingsAcc."product category"::"Deposit Contribution");
                    if SavingsAcc.Find('-') then begin
                        CapitaliazeAcc := SavingsAcc."No.";
                        DepContAccType := SavingsAcc."Product Type";
                    end;
                    ShareCapAcc := '';
                    SavingsAcc.Reset;
                    SavingsAcc.SetRange("Member No.", CustMembr."No.");
                    SavingsAcc.SetRange("Product Category", SavingsAcc."product category"::"Share Capital");
                    if SavingsAcc.Find('-') then begin
                        SharesAccType := SavingsAcc."Product Type";
                        ShareCapAcc := SavingsAcc."No.";
                    end;
                    if SavingsAccountNo = '' then SavingsAccountNo := ShareCapAcc;
                    // Member Dividend earned
                    RunBal := 0;
                    DividendProgression.Reset;
                    DividendProgression.SetRange(DividendProgression."Member No", CustMembr."No.");
                    DividendProgression.SetRange(Year, PreviousYear);
                    if DividendProgression.Find('-') then begin
                        DividendProgression.CalcSums(DividendProgression."Net Dividends", DividendProgression."Gross Dividends", DividendProgression."Witholding Tax");

                        RunBal := ROUND(DividendProgression."Net Dividends", 0.01, '=');
                        TotalNetAmount := RunBal;
                        OrigiGrosss := 0;
                        GrossAmount := ROUND(DividendProgression."Gross Dividends", 0.01, '=');
                        OrigiGrosss := GrossAmount;
                        GeneralSetUp.Get;
                        GeneralSetUp.TestField("Dividend Payable Account");
                        GeneralSetUp.TestField("Withholding Tax Account");

                        //+++++++++++++++++++++++++++++++++++++++++++++++++++PAYABLE DIV--



                        EntrNo += 1;
                        DividendPostingBuffer.Init;
                        DividendPostingBuffer."Entry No." := EntrNo;
                        DividendPostingBuffer."Posting Date" := Today;
                        DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                        DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::"G/L Account";
                        DividendPostingBuffer."Account No." := GeneralSetUp."Dividend Payable Account";
                        DividendPostingBuffer.Description := PadStr('DIV PAY-' + Format(PreviousYear) + ' ' + CustMembr."No.", 50); //*
                        DividendPostingBuffer."Member No." := CustMembr."No.";
                        DividendPostingBuffer.Amount := ROUND(GrossAmount, 0.01, '=');//ROUND(DividendProgression."Gross Dividends",0.01,'=');
                        DividendPostingBuffer."Debit Amount" := GrossAmount;//ROUND(DividendPostingBuffer.Amount,0.01,'=');
                        DividendPostingBuffer."Credit Amount" := 0;
                        //DividendPostingBuffer."Transaction Type":=DividendPostingBuffer."Transaction Type"::"Interest Paid";
                        //IF ProductFactory.GET(SavingsAccounts."Product Type")
                        //DividendPostingBuffer."Product Type":=LoanApps."Loan Product Type";
                        DividendPostingBuffer."Product Type Name" := PadStr(CustMembr.Name, 20);
                        DividendPostingBuffer."Bal. Account Type" := DividendPostingBuffer."bal. account type"::Savings;
                        DividendPostingBuffer."Bal. Account No." := SavingsAccountNo;
                        DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                        DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                        if DividendPostingBuffer.Amount <> 0 then
                            DividendPostingBuffer.Insert;

                        //++++++++++++++++++++++++++++++++++++++++++++++++++++PAYABLE DIV---

                        //--------------------------------------------------------CAPITALIZE
                        if (GrossAmount) <= DividendSetUp."Minimum Capitalized" then begin

                            if CustMembr."Tax Exempted" = false then begin
                                EntrNo += 1;
                                DividendPostingBuffer.Init;
                                DividendPostingBuffer."Entry No." := EntrNo;
                                DividendPostingBuffer."Posting Date" := Today;
                                DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::"G/L Account";
                                DividendPostingBuffer."Account No." := GeneralSetUp."Withholding Tax Account";
                                DividendPostingBuffer.Description := PadStr('DIV PAY-' + Format(PreviousYear) + ' W-Tax ' + CustMembr."No.", 50); //*
                                DividendPostingBuffer."Member No." := CustMembr."No.";
                                DividendPostingBuffer.Amount := -ROUND(DividendProgression."Witholding Tax", 0.01, '=');
                                DividendPostingBuffer."Debit Amount" := 0;
                                DividendPostingBuffer."Credit Amount" := ROUND(DividendPostingBuffer.Amount, 0.01, '=');
                                //DividendPostingBuffer."Transaction Type":=DividendPostingBuffer."Transaction Type"::"Interest Paid";
                                //IF ProductFactory.GET(SavingsAccounts."Product Type")
                                //DividendPostingBuffer."Product Type":=LoanApps."Loan Product Type";
                                DividendPostingBuffer."Bal. Account Type" := DividendPostingBuffer."bal. account type"::Savings;
                                DividendPostingBuffer."Bal. Account No." := SavingsAccountNo;
                                DividendPostingBuffer."Product Type Name" := PadStr(CustMembr.Name, 20);
                                DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                if DividendPostingBuffer.Amount <> 0 then
                                    DividendPostingBuffer.Insert;
                                GrossAmount -= ROUND(DividendProgression."Witholding Tax", 0.01, '=');
                            end;

                            EntrNo += 1;
                            DividendPostingBuffer.Init;
                            DividendPostingBuffer."Entry No." := EntrNo;
                            DividendPostingBuffer."Posting Date" := Today;
                            DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                            DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Savings;
                            DividendPostingBuffer."Account No." := CapitaliazeAcc;
                            DividendPostingBuffer.Description := PadStr('DIV PAY-' + Format(PreviousYear) + ' ' + CustMembr."No.", 50); //*
                            DividendPostingBuffer."Member No." := CustMembr."No.";
                            DividendPostingBuffer.Amount := -GrossAmount;//ROUND(DividendProgression."Gross Dividends",0.01,'=');
                            DividendPostingBuffer."Debit Amount" := 0;//ROUND(DividendPostingBuffer.Amount,0.01,'=');
                            DividendPostingBuffer."Credit Amount" := ROUND(GrossAmount, 0.01, '=');
                            //DividendPostingBuffer."Transaction Type":=DividendPostingBuffer."Transaction Type"::"Interest Paid";
                            //IF ProductFactory.GET(SavingsAccounts."Product Type")
                            //DividendPostingBuffer."Product Type":=LoanApps."Loan Product Type";
                            DividendPostingBuffer."Bal. Account Type" := DividendPostingBuffer."bal. account type"::Savings;
                            DividendPostingBuffer."Bal. Account No." := SavingsAccountNo;
                            DividendPostingBuffer."Product Type Name" := PadStr(CustMembr.Name, 20);
                            DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                            DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                            if DividendPostingBuffer.Amount <> 0 then
                                DividendPostingBuffer.Insert;

                            GrossAmount -= Abs(DividendPostingBuffer.Amount);

                            //--------------------------------------------------------CAPITALIZE

                        end else begin  //-----OTHER MEMBERS CAPITALIZING
                                        //+++++++++++++++++++++++++++++++++++++++++++++++++++W-TAX--SRATR;
                            if CustMembr."Tax Exempted" = false then begin
                                EntrNo += 1;
                                DividendPostingBuffer.Init;
                                DividendPostingBuffer."Entry No." := EntrNo;
                                DividendPostingBuffer."Posting Date" := Today;
                                DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::"G/L Account";
                                DividendPostingBuffer."Account No." := GeneralSetUp."Withholding Tax Account";
                                DividendPostingBuffer.Description := PadStr('DIV PAY-' + Format(PreviousYear) + ' W-Tax ' + CustMembr."No.", 50); //*
                                DividendPostingBuffer."Member No." := CustMembr."No.";
                                DividendPostingBuffer.Amount := -ROUND(DividendProgression."Witholding Tax", 0.01, '=');
                                DividendPostingBuffer."Debit Amount" := 0;
                                DividendPostingBuffer."Credit Amount" := ROUND(DividendPostingBuffer.Amount, 0.01, '=');
                                //DividendPostingBuffer."Transaction Type":=DividendPostingBuffer."Transaction Type"::"Interest Paid";
                                //IF ProductFactory.GET(SavingsAccounts."Product Type")
                                //DividendPostingBuffer."Product Type":=LoanApps."Loan Product Type";
                                DividendPostingBuffer."Bal. Account Type" := DividendPostingBuffer."bal. account type"::Savings;
                                DividendPostingBuffer."Bal. Account No." := SavingsAccountNo;
                                DividendPostingBuffer."Product Type Name" := PadStr(CustMembr.Name, 20);
                                DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                if DividendPostingBuffer.Amount <> 0 then
                                    DividendPostingBuffer.Insert;
                                GrossAmount -= ROUND(DividendProgression."Witholding Tax", 0.01, '=');
                            end;// ELSE
                                //RunBal+=ROUND(DividendProgression."Witholding Tax",0.01,'=');

                            //Capitalize Shares 100%

                            //+++++++++++++++++++++++++++++++++++++++++++++++++++W-TAX--END;

                            //Dividend Loan
                            LoanApps.Reset;
                            LoanApps.SetRange(LoanApps."Member No.", CustMembr."No.");
                            LoanApps.SetRange("Recovery Mode", LoanApps."recovery mode"::Dividend);
                            if LoanApps.Find('-') then begin
                                repeat
                                    LoanApps.CalcFields(LoanApps."Outstanding Interest", LoanApps."Outstanding Bills", LoanApps."Outstanding Balance");
                                    if LoanApps."Outstanding Interest" > 0 then begin
                                        EntrNo += 1;
                                        DividendPostingBuffer.Init;
                                        DividendPostingBuffer."Entry No." := EntrNo;
                                        DividendPostingBuffer."Posting Date" := Today;
                                        DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                        DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Credit;
                                        DividendPostingBuffer."Account No." := LoanApps."Loan Account";
                                        DividendPostingBuffer.Description := PadStr(LoanInterest + ' ' + SavingsAccounts."No." + ' LNo:' + LoanApps."Loan No.", 50); //*
                                        DividendPostingBuffer."Member No." := CustMembr."No.";
                                        if GrossAmount > LoanApps."Outstanding Interest" then
                                            DividendPostingBuffer.Amount := -ROUND(LoanApps."Outstanding Interest", 0.01, '=')
                                        else
                                            DividendPostingBuffer.Amount := -GrossAmount;
                                        DividendPostingBuffer."Debit Amount" := 0;
                                        DividendPostingBuffer."Credit Amount" := -GrossAmount;//ROUND(DividendPostingBuffer.Amount,0.01,'=');
                                        DividendPostingBuffer."Loan No" := LoanApps."Loan No.";
                                        DividendPostingBuffer."Transaction Type" := DividendPostingBuffer."transaction type"::"Interest Paid";
                                        DividendPostingBuffer."Product Type" := LoanApps."Loan Product Type";
                                        DividendPostingBuffer."Product Type Name" := PadStr(LoanApps."Loan Product Type Name", 20);
                                        if CreditAccount.Get(LoanApps."Loan Account") then
                                            DividendPostingBuffer.Blocked := CreditAccount.Blocked;
                                        DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                        DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                        if DividendPostingBuffer.Amount <> 0 then
                                            DividendPostingBuffer.Insert;
                                        RunBal -= ROUND(Abs(DividendPostingBuffer.Amount), 0.01, '=');
                                        GrossAmount -= ROUND(Abs(DividendPostingBuffer.Amount), 0.01, '=');



                                        //Debit Savings
                                        EntrNo += 1;
                                        DividendPostingBuffer.Init;
                                        DividendPostingBuffer."Entry No." := EntrNo;
                                        DividendPostingBuffer."Posting Date" := Today;
                                        DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                        DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Savings;
                                        DividendPostingBuffer."Account No." := SavingsAccountNo;
                                        DividendPostingBuffer.Description := PadStr(LoanInterest + ' ' + SavingsAccounts."No." + ' LNo:' + LoanApps."Loan No.", 50); //*
                                        DividendPostingBuffer."Member No." := CustMembr."No.";
                                        DividendPostingBuffer.Amount := ROUND(DividendPostingBuffer.Amount, 0.01, '=') * -1;
                                        ;
                                        DividendPostingBuffer."Debit Amount" := ROUND(DividendPostingBuffer.Amount, 0.01, '=');//ROUND(DividendPostingBuffer.Amount,0.01,'=');
                                        DividendPostingBuffer."Credit Amount" := 0;
                                        //DividendPostingBuffer."Transaction Type":=DividendPostingBuffer."Transaction Type"::"Interest Paid";
                                        //IF ProductFactory.GET(SavingsAccounts."Product Type")
                                        //DividendPostingBuffer."Product Type":=LoanApps."Loan Product Type";
                                        DividendPostingBuffer."Product Type Name" := PadStr(CustMembr.Name, 20);
                                        DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                        DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                        if DividendPostingBuffer.Amount <> 0 then
                                            DividendPostingBuffer.Insert;
                                    end;

                                    if LoanApps."Outstanding Balance" > 0 then begin

                                        EntrNo += 1;
                                        DividendPostingBuffer.Init;
                                        DividendPostingBuffer."Entry No." := EntrNo;
                                        DividendPostingBuffer."Posting Date" := Today;
                                        DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                        DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Credit;
                                        DividendPostingBuffer."Account No." := LoanApps."Loan Account";
                                        DividendPostingBuffer.Description := PadStr(LoanPrincipal + ' ' + SavingsAccounts."No." + ' LNo:' + LoanApps."Loan No.", 50); //*
                                        DividendPostingBuffer."Member No." := CustMembr."No.";
                                        if GrossAmount > LoanApps."Outstanding Balance" then
                                            DividendPostingBuffer.Amount := -ROUND(LoanApps."Outstanding Balance", 0.01, '=')
                                        else
                                            DividendPostingBuffer.Amount := -GrossAmount;
                                        DividendPostingBuffer."Debit Amount" := 0;
                                        DividendPostingBuffer."Credit Amount" := -GrossAmount;//ROUND(DividendPostingBuffer.Amount,0.01,'=');
                                        DividendPostingBuffer."Loan No" := LoanApps."Loan No.";
                                        DividendPostingBuffer."Transaction Type" := DividendPostingBuffer."transaction type"::Repayment;
                                        DividendPostingBuffer."Product Type" := LoanApps."Loan Product Type";
                                        DividendPostingBuffer."Product Type Name" := PadStr(LoanApps."Loan Product Type Name", 20);
                                        if CreditAccount.Get(LoanApps."Loan Account") then
                                            DividendPostingBuffer.Blocked := CreditAccount.Blocked;
                                        DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                        DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                        if DividendPostingBuffer.Amount <> 0 then
                                            DividendPostingBuffer.Insert;

                                        RunBal -= Abs(DividendPostingBuffer.Amount);
                                        GrossAmount -= Abs(DividendPostingBuffer.Amount);

                                        //Debit Savings
                                        EntrNo += 1;
                                        DividendPostingBuffer.Init;
                                        DividendPostingBuffer."Entry No." := EntrNo;
                                        DividendPostingBuffer."Posting Date" := Today;
                                        DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                        DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Savings;
                                        DividendPostingBuffer."Account No." := SavingsAccountNo;
                                        DividendPostingBuffer.Description := PadStr(LoanInterest + ' ' + SavingsAccounts."No." + ' LNo:' + LoanApps."Loan No.", 50); //*
                                        DividendPostingBuffer."Member No." := CustMembr."No.";
                                        DividendPostingBuffer.Amount := ROUND(DividendPostingBuffer.Amount, 0.01, '=') * -1;
                                        ;
                                        DividendPostingBuffer."Debit Amount" := ROUND(DividendPostingBuffer.Amount, 0.01, '=');//ROUND(DividendPostingBuffer.Amount,0.01,'=');
                                        DividendPostingBuffer."Credit Amount" := 0;
                                        //DividendPostingBuffer."Transaction Type":=DividendPostingBuffer."Transaction Type"::"Interest Paid";
                                        //IF ProductFactory.GET(SavingsAccounts."Product Type")
                                        //DividendPostingBuffer."Product Type":=LoanApps."Loan Product Type";
                                        DividendPostingBuffer."Product Type Name" := PadStr(CustMembr.Name, 20);
                                        DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                        DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                        if DividendPostingBuffer.Amount <> 0 then
                                            DividendPostingBuffer.Insert;

                                        //Bills

                                        EntrNo += 1;
                                        DividendPostingBuffer.Init;
                                        DividendPostingBuffer."Entry No." := EntrNo;
                                        DividendPostingBuffer."Posting Date" := Today;
                                        DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                        DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Credit;
                                        DividendPostingBuffer."Account No." := LoanApps."Loan Account";
                                        DividendPostingBuffer.Description := PadStr(LoanBills + ' ' + SavingsAccounts."No." + ' LNo:' + LoanApps."Loan No.", 50); //*
                                        DividendPostingBuffer."Member No." := CustMembr."No.";
                                        //IF GrossAmount+ABS(DividendPostingBuffer.Amount) > LoanApps."Outstanding Balance" THEN
                                        //ELSE
                                        if (OrigiGrosss - ROUND(DividendProgression."Witholding Tax", 0.01, '=')) > LoanApps."Outstanding Balance" then
                                            DividendPostingBuffer.Amount := -ROUND(LoanApps."Outstanding Balance", 0.01, '=')
                                        else
                                            DividendPostingBuffer.Amount := -(OrigiGrosss - ROUND(DividendProgression."Witholding Tax", 0.01, '='));
                                        DividendPostingBuffer."Debit Amount" := 0;
                                        DividendPostingBuffer."Credit Amount" := -GrossAmount;//ROUND(DividendPostingBuffer.Amount,0.01,'=');
                                        DividendPostingBuffer."Loan No" := LoanApps."Loan No.";
                                        DividendPostingBuffer."Transaction Type" := DividendPostingBuffer."transaction type"::Bills;
                                        DividendPostingBuffer."Product Type" := LoanApps."Loan Product Type";
                                        DividendPostingBuffer."Product Type Name" := PadStr(LoanApps."Loan Product Type Name", 20);
                                        DividendPostingBuffer."Bal. Account Type" := DividendPostingBuffer."account type"::"G/L Account";
                                        ProductFactory.Reset;
                                        ProductFactory.SetRange("Product ID", LoanApps."Loan Product Type");
                                        if ProductFactory.Find('-') then begin
                                            //     ERROR('2');
                                            DividendPostingBuffer."Bal. Account No." := ProductFactory."Billed Account";
                                        end;
                                        if CreditAccount.Get(LoanApps."Loan Account") then
                                            DividendPostingBuffer.Blocked := CreditAccount.Blocked;
                                        DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                        DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                        DividendPostingBuffer."Bal. Account No." := ProductFactory."Billed Account";
                                        if DividendPostingBuffer.Amount <> 0 then
                                            DividendPostingBuffer.Insert;


                                    end;
                                until LoanApps.Next = 0;
                            end;//End Dividend Loan

                            ///DividendInstructionsExists
                            if DividendInstructionsExists = true then begin
                                DividendInstructions.Reset;
                                DividendInstructions.SetCurrentkey(Priority);
                                DividendInstructions.SetRange("Member No.", CustMembr."No.");
                                if DividendInstructions.Find('-') then begin
                                    repeat
                                        Mydeduction := 0;
                                        if GrossAmount > 0 then begin
                                            EntrNo += 1;
                                            DividendPostingBuffer.Init;
                                            DividendPostingBuffer."Entry No." := EntrNo;
                                            DividendPostingBuffer."Posting Date" := Today;
                                            DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                            DividendPostingBuffer."Account Type" := DividendInstructions."Account Type";
                                            DividendPostingBuffer."Account No." := DividendInstructions."Account No.";
                                            DividendPostingBuffer.Description := PadStr('Div' + Format(PreviousYear) + ' ' + CustMembr."No." + '-' + CustMembr.Name, 50);
                                            DividendPostingBuffer."Member No." := CustMembr."No.";
                                            if CreditAccount.Get(DividendInstructions."Account No.") then
                                                DividendPostingBuffer.Blocked := CreditAccount.Blocked;
                                            if SavingsAcc.Get(DividendInstructions."Account No.") then
                                                DividendPostingBuffer.Blocked := SavingsAcc.Blocked;
                                            if DividendInstructions."Recovery Type" = DividendInstructions."recovery type"::"Based on Amount" then begin
                                                if GrossAmount > DividendInstructions.Amount then
                                                    DividendPostingBuffer.Amount := -ROUND(DividendInstructions.Amount, 0.01, '=')
                                                else
                                                    DividendPostingBuffer.Amount := -GrossAmount;//ROUND(RunBal,0.01,'=');
                                            end else begin
                                                if GrossAmount > ((DividendInstructions.Amount / 100) * TotalNetAmount) then
                                                    DividendPostingBuffer.Amount := -ROUND(((DividendInstructions.Amount / 100) * TotalNetAmount), 0.01, '=')
                                                else
                                                    DividendPostingBuffer.Amount := -GrossAmount;//ROUND(RunBal,0.01,'=');
                                            end;
                                            Mydeduction := DividendPostingBuffer.Amount;
                                            //DividendPostingBuffer."Debit Amount":=TCharges*(GeneralSetUp."Excise Duty (%)"/100);
                                            //DividendPostingBuffer."Credit Amount":=0;
                                            DividendPostingBuffer."Loan No" := DividendInstructions."Loan No.";
                                            DividendPostingBuffer."Product Type" := DividendInstructions."Product Type";
                                            if ProductFactory.Get(DividendInstructions."Product Type") then
                                                DividendPostingBuffer."Product Type Name" := PadStr(ProductFactory."Product Description", 20)
                                            else
                                                DividendPostingBuffer."Product Type Name" := PadStr('Div Payment to-', 20);
                                            DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                            DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                            //DividendPostingBuffer."Bal. Account Type":=DividendPostingBuffer."Bal. Account Type"::"G/L Account";
                                            //DividendPostingBuffer."Bal. Account No.":=GeneralSetUp."Excise Duty G/L";
                                            if DividendPostingBuffer.Amount <> 0 then
                                                DividendPostingBuffer.Insert;
                                            RunBal := RunBal - Abs(ROUND((DividendPostingBuffer.Amount), 0.01, '='));
                                            GrossAmount -= Abs(DividendPostingBuffer.Amount);

                                            //Debit Savings
                                            EntrNo += 1;
                                            DividendPostingBuffer.Init;
                                            DividendPostingBuffer."Entry No." := EntrNo;
                                            DividendPostingBuffer."Posting Date" := Today;
                                            DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                            DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Savings;
                                            DividendPostingBuffer."Account No." := SavingsAccountNo;
                                            DividendPostingBuffer.Description := PadStr('Div' + CustMembr."No." + '-' + CustMembr.Name, 50); //*
                                            DividendPostingBuffer."Member No." := CustMembr."No.";
                                            DividendPostingBuffer.Amount := ROUND(Mydeduction, 0.01, '=') * -1;
                                            //MESSAGE(FORMAT(Mydeduction));
                                            DividendPostingBuffer."Debit Amount" := ROUND(-Mydeduction, 0.01, '=');//ROUND(DividendPostingBuffer.Amount,0.01,'=');
                                            DividendPostingBuffer."Credit Amount" := 0;
                                            //DividendPostingBuffer.Amount:=ABS(Mydeduction);
                                            //DividendPostingBuffer."Transaction Type":=DividendPostingBuffer."Transaction Type"::"Interest Paid";
                                            //IF ProductFactory.GET(SavingsAccounts."Product Type")
                                            //DividendPostingBuffer."Product Type":=LoanApps."Loan Product Type";
                                            DividendPostingBuffer."Product Type Name" := PadStr(CustMembr.Name, 20);
                                            DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                            DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                            if DividendPostingBuffer.Amount <> 0 then
                                                DividendPostingBuffer.Insert;
                                        end;
                                    until DividendInstructions.Next = 0;

                                end;
                            end;

                            /*CASE Defaulter OF
                             Defaulter = TRUE : BEGIN*/
                            if Defaulter = true then begin

                                if DividendSetUp."Defaulter Recovery" then begin

                                    LoanApps.Reset;
                                    LoanApps.SetRange(LoanApps."Member No.", CustMembr."No.");
                                    if LoanApps.Find('-') then begin
                                        repeat
                                            LoanApps.CalcFields(LoanApps."Outstanding Interest", LoanApps."Outstanding Bills", LoanApps."Outstanding Balance");
                                            if (LoanApps."Outstanding Bills" - LoanApps.Repayment) > 0 then begin
                                                if LoanApps."Outstanding Interest" > 0 then begin
                                                    EntrNo += 1;
                                                    DividendPostingBuffer.Init;
                                                    DividendPostingBuffer."Entry No." := EntrNo;
                                                    DividendPostingBuffer."Posting Date" := Today;
                                                    DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                                    DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Credit;
                                                    DividendPostingBuffer."Account No." := LoanApps."Loan Account";
                                                    if CreditAccount.Get(LoanApps."Loan Account") then
                                                        DividendPostingBuffer.Blocked := CreditAccount.Blocked;
                                                    DividendPostingBuffer.Description := PadStr(LoanInterest + ' DFTL ' + SavingsAccounts."No." + ' LNo:' + LoanApps."Loan No.", 50); //*
                                                    DividendPostingBuffer."Member No." := CustMembr."No.";
                                                    if GrossAmount > LoanApps."Outstanding Interest" then
                                                        DividendPostingBuffer.Amount := -ROUND(LoanApps."Outstanding Interest", 0.01, '=')
                                                    else
                                                        DividendPostingBuffer.Amount := -GrossAmount;//ROUND(RunBal,0.01,'=');
                                                    DividendPostingBuffer."Debit Amount" := 0;
                                                    DividendPostingBuffer."Credit Amount" := DividendPostingBuffer.Amount;
                                                    DividendPostingBuffer."Loan No" := LoanApps."Loan No.";
                                                    DividendPostingBuffer."Transaction Type" := DividendPostingBuffer."transaction type"::"Interest Paid";
                                                    DividendPostingBuffer."Product Type" := LoanApps."Loan Product Type";
                                                    DividendPostingBuffer."Product Type Name" := PadStr(LoanApps."Loan Product Type Name", 20);
                                                    DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                                    DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                                    if DividendPostingBuffer.Amount <> 0 then
                                                        DividendPostingBuffer.Insert;
                                                    RunBal -= ROUND(Abs(DividendPostingBuffer.Amount), 0.01, '=');
                                                    GrossAmount -= Abs(DividendPostingBuffer.Amount);

                                                    //Debit Savings
                                                    EntrNo += 1;
                                                    DividendPostingBuffer.Init;
                                                    DividendPostingBuffer."Entry No." := EntrNo;
                                                    DividendPostingBuffer."Posting Date" := Today;
                                                    DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                                    DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Savings;
                                                    DividendPostingBuffer."Account No." := SavingsAccountNo;
                                                    DividendPostingBuffer.Description := PadStr(LoanInterest + ' DFTL ' + SavingsAccounts."No." + ' LNo:' + LoanApps."Loan No.", 50); //*
                                                    DividendPostingBuffer."Member No." := CustMembr."No.";
                                                    DividendPostingBuffer.Amount := ROUND(DividendPostingBuffer.Amount, 0.01, '=') * -1;
                                                    ;
                                                    DividendPostingBuffer."Debit Amount" := ROUND(DividendPostingBuffer.Amount, 0.01, '=');//ROUND(DividendPostingBuffer.Amount,0.01,'=');
                                                    DividendPostingBuffer."Credit Amount" := 0;
                                                    //DividendPostingBuffer."Transaction Type":=DividendPostingBuffer."Transaction Type"::"Interest Paid";
                                                    //IF ProductFactory.GET(SavingsAccounts."Product Type")
                                                    //DividendPostingBuffer."Product Type":=LoanApps."Loan Product Type";
                                                    DividendPostingBuffer."Product Type Name" := PadStr(CustMembr.Name, 20);
                                                    DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                                    DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                                    if DividendPostingBuffer.Amount <> 0 then
                                                        DividendPostingBuffer.Insert;
                                                end;

                                                if LoanApps."Outstanding Bills" > 0 then begin
                                                    EntrNo += 1;
                                                    DividendPostingBuffer.Init;
                                                    DividendPostingBuffer."Entry No." := EntrNo;
                                                    DividendPostingBuffer."Posting Date" := Today;
                                                    DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                                    DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Credit;
                                                    DividendPostingBuffer."Account No." := LoanApps."Loan Account";
                                                    DividendPostingBuffer.Description := PadStr(LoanBills + ' DFTL ' + SavingsAccounts."No." + ' LNo:' + LoanApps."Loan No.", 50); //*
                                                    DividendPostingBuffer."Member No." := CustMembr."No.";
                                                    if GrossAmount > LoanApps."Outstanding Bills" then
                                                        DividendPostingBuffer.Amount := -ROUND(LoanApps."Outstanding Bills", 0.01, '=')
                                                    else
                                                        DividendPostingBuffer.Amount := -GrossAmount;//ROUND(RunBal,0.01,'=');
                                                    DividendPostingBuffer."Debit Amount" := 0;
                                                    DividendPostingBuffer."Credit Amount" := (DividendPostingBuffer.Amount);//ROUND(DividendPostingBuffer.Amount,0.01,'=');
                                                    DividendPostingBuffer."Loan No" := LoanApps."Loan No.";
                                                    DividendPostingBuffer."Transaction Type" := DividendPostingBuffer."transaction type"::Bills;
                                                    DividendPostingBuffer."Product Type" := LoanApps."Loan Product Type";
                                                    DividendPostingBuffer."Product Type Name" := PadStr(LoanApps."Loan Product Type Name", 20);
                                                    DividendPostingBuffer."Bal. Account Type" := DividendPostingBuffer."account type"::"G/L Account";
                                                    if ProductFactory.Get(LoanApps."Loan Product Type") then
                                                        DividendPostingBuffer."Bal. Account No." := ProductFactory."Billed Account";
                                                    if CreditAccount.Get(LoanApps."Loan Account") then
                                                        DividendPostingBuffer.Blocked := CreditAccount.Blocked;
                                                    DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                                    DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                                    if DividendPostingBuffer.Amount <> 0 then
                                                        DividendPostingBuffer.Insert;

                                                    // IF LoanApps."Outstanding Balance" >0 THEN BEGIN
                                                    EntrNo += 1;
                                                    DividendPostingBuffer.Init;
                                                    DividendPostingBuffer."Entry No." := EntrNo;
                                                    DividendPostingBuffer."Posting Date" := Today;
                                                    DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                                    DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Credit;
                                                    DividendPostingBuffer."Account No." := LoanApps."Loan Account";
                                                    DividendPostingBuffer.Description := PadStr(LoanPrincipal + ' DFTL ' + SavingsAccounts."No." + ' LNo:' + LoanApps."Loan No.", 50); //*
                                                    DividendPostingBuffer."Member No." := CustMembr."No.";
                                                    if RunBal > LoanApps."Outstanding Bills" then
                                                        DividendPostingBuffer.Amount := -ROUND(LoanApps."Outstanding Bills", 0.01, '=')
                                                    else
                                                        DividendPostingBuffer.Amount := -GrossAmount;//ROUND(RunBal,0.01,'=');
                                                    DividendPostingBuffer."Debit Amount" := 0;
                                                    DividendPostingBuffer."Credit Amount" := DividendPostingBuffer.Amount;
                                                    DividendPostingBuffer."Loan No" := LoanApps."Loan No.";
                                                    DividendPostingBuffer."Transaction Type" := DividendPostingBuffer."transaction type"::Repayment;
                                                    DividendPostingBuffer."Product Type" := LoanApps."Loan Product Type";
                                                    DividendPostingBuffer."Product Type Name" := PadStr(LoanApps."Loan Product Type Name", 20);
                                                    DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                                    DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                                    if CreditAccount.Get(LoanApps."Loan Account") then
                                                        DividendPostingBuffer.Blocked := CreditAccount.Blocked;
                                                    if DividendPostingBuffer.Amount <> 0 then
                                                        DividendPostingBuffer.Insert;
                                                    RunBal -= Abs(DividendPostingBuffer.Amount);
                                                    GrossAmount -= Abs(DividendPostingBuffer.Amount);

                                                    EntrNo += 1;
                                                    DividendPostingBuffer.Init;
                                                    DividendPostingBuffer."Entry No." := EntrNo;
                                                    DividendPostingBuffer."Posting Date" := Today;
                                                    DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                                                    DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Savings;
                                                    DividendPostingBuffer."Account No." := SavingsAccountNo;
                                                    DividendPostingBuffer.Description := PadStr(LoanPrincipal + ' DFTL ' + SavingsAccounts."No." + ' LNo:' + LoanApps."Loan No.", 50); //*
                                                    DividendPostingBuffer."Member No." := CustMembr."No.";
                                                    DividendPostingBuffer.Amount := ROUND(DividendPostingBuffer.Amount, 0.01, '=') * -1;
                                                    ;
                                                    DividendPostingBuffer."Debit Amount" := ROUND(DividendPostingBuffer.Amount, 0.01, '=');//ROUND(DividendPostingBuffer.Amount,0.01,'=');
                                                    DividendPostingBuffer."Credit Amount" := 0;
                                                    //DividendPostingBuffer."Transaction Type":=DividendPostingBuffer."Transaction Type"::"Interest Paid";
                                                    //IF ProductFactory.GET(SavingsAccounts."Product Type")
                                                    //DividendPostingBuffer."Product Type":=LoanApps."Loan Product Type";
                                                    DividendPostingBuffer."Product Type Name" := PadStr(CustMembr.Name, 20);
                                                    DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                                                    DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                                                    if DividendPostingBuffer.Amount <> 0 then
                                                        DividendPostingBuffer.Insert;
                                                end;
                                            end;
                                        //MESSAGE('Member No :%1 Loan No :%2 Balance :%3 RunBal :%4',CustMembr."No.",LoanApps."Loan No.",LoanApps."Outstanding Balance",RunBal);
                                        until LoanApps.Next = 0;
                                    end;
                                end;
                            end;//Recovery Defaulter Loans



                            ///+++++++++++++++++++++++Dividend Earned
                            ChargeAmount := 0;
                            OrigiGrosss := OrigiGrosss - ROUND(DividendProgression."Witholding Tax", 0.01, '=');
                            TransactionCharges.Reset;
                            TransactionCharges.SetRange(TransactionCharges."Transaction Type", DividendSetUp."Transaction Type");
                            if TransactionCharges.Find('-') then begin
                                repeat
                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::"% of Amount" then
                                        ChargeAmount += (OrigiGrosss * TransactionCharges."Percentage of Amount") * 0.01
                                    else
                                        ChargeAmount += TransactionCharges."Charge Amount";

                                    if TransactionCharges."Charge Type" = TransactionCharges."charge type"::Staggered then begin
                                        TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
                                        TariffDetails.Reset;
                                        TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
                                        if TariffDetails.Find('-') then begin
                                            repeat
                                                if (OrigiGrosss >= TariffDetails."Lower Limit") and (OrigiGrosss <= TariffDetails."Upper Limit") then begin
                                                    if TariffDetails."Use Percentage" then
                                                        ChargeAmount += OrigiGrosss * TariffDetails.Percentage * 0.01
                                                    else
                                                        ChargeAmount += TariffDetails."Charge Amount";
                                                end;
                                            until TariffDetails.Next = 0;
                                        end;
                                    end;
                                until TransactionCharges.Next = 0;
                                TCharges := ChargeAmount;
                            end;
                        end; //Member Dividend earned
                             // MESSAGE('%1',TCharges);
                             //++++++++++++++++++++Charges

                        if (GrossAmount > TCharges) then begin


                            EntrNo += 1;
                            DividendPostingBuffer.Init;
                            DividendPostingBuffer."Entry No." := EntrNo;
                            DividendPostingBuffer."Posting Date" := Today;
                            DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                            DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Savings;
                            DividendPostingBuffer."Account No." := SavingsAccountNo;
                            DividendPostingBuffer.Description := PadStr(TransactionCharge + CustMembr."No." + '-' + CustMembr.Name, 50);
                            DividendPostingBuffer."Member No." := CustMembr."No.";
                            DividendPostingBuffer.Amount := TCharges;
                            DividendPostingBuffer."Debit Amount" := TCharges;
                            DividendPostingBuffer."Credit Amount" := 0;
                            DividendPostingBuffer."Loan No" := '';
                            DividendPostingBuffer."Product Type" := SavingsProductID;
                            DividendPostingBuffer."Product Type Name" := PadStr(SavingsProductName, 20);
                            DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                            DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                            DividendPostingBuffer."Bal. Account Type" := DividendPostingBuffer."bal. account type"::"G/L Account";
                            DividendPostingBuffer."Bal. Account No." := TransactionCharges."G/L Account";
                            if DividendPostingBuffer.Amount <> 0 then
                                DividendPostingBuffer.Insert;



                            EntrNo += 1;
                            DividendPostingBuffer.Init;
                            DividendPostingBuffer."Entry No." := EntrNo;
                            DividendPostingBuffer."Posting Date" := Today;
                            DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                            DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::Savings;
                            DividendPostingBuffer."Account No." := SavingsAccountNo;
                            DividendPostingBuffer.Description := PadStr(ExciseDuty + CustMembr."No." + '-' + CustMembr.Name, 50);
                            DividendPostingBuffer."Member No." := CustMembr."No.";
                            DividendPostingBuffer.Amount := TCharges * (GeneralSetUp."Excise Duty (%)" / 100);
                            DividendPostingBuffer."Debit Amount" := TCharges * (GeneralSetUp."Excise Duty (%)" / 100);
                            DividendPostingBuffer."Credit Amount" := 0;
                            DividendPostingBuffer."Loan No" := '';
                            DividendPostingBuffer."Product Type" := SavingsProductID;
                            DividendPostingBuffer."Product Type Name" := PadStr(SavingsProductName, 20);
                            DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                            DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                            DividendPostingBuffer."Bal. Account Type" := DividendPostingBuffer."bal. account type"::"G/L Account";
                            DividendPostingBuffer."Bal. Account No." := GeneralSetUp."Excise Duty G/L";
                            if DividendPostingBuffer.Amount <> 0 then
                                DividendPostingBuffer.Insert;
                        end else begin
                            EntrNo += 1;
                            DividendPostingBuffer.Init;
                            DividendPostingBuffer."Entry No." := EntrNo;
                            DividendPostingBuffer."Posting Date" := Today;
                            DividendPostingBuffer."Document No." := 'DIV-' + Format(PreviousYear);
                            DividendPostingBuffer."Account Type" := DividendPostingBuffer."account type"::"G/L Account";
                            DividendPostingBuffer."Account No." := TransactionCharges."G/L Account";
                            DividendPostingBuffer.Description := PadStr('Dividend Processing' + CustMembr."No." + '-' + CustMembr.Name, 50);
                            DividendPostingBuffer."Member No." := CustMembr."No.";
                            DividendPostingBuffer.Amount := -GrossAmount;
                            DividendPostingBuffer."Debit Amount" := 0;
                            DividendPostingBuffer."Credit Amount" := GrossAmount;
                            ;
                            DividendPostingBuffer."Loan No" := '';
                            DividendPostingBuffer."Product Type" := SavingsProductID;
                            DividendPostingBuffer."Product Type Name" := PadStr(SavingsProductName, 20);
                            DividendPostingBuffer."Shortcut Dimension 1 Code" := GlobalDim1;
                            DividendPostingBuffer."Shortcut Dimension 2 Code" := GlobalDim2;
                            DividendPostingBuffer."Bal. Account Type" := DividendPostingBuffer."bal. account type"::Savings;
                            DividendPostingBuffer."Bal. Account No." := SavingsAccountNo;
                            if DividendPostingBuffer.Amount <> 0 then
                                DividendPostingBuffer.Insert;
                        end;

                    end; //OTHER MEMBERS  NOT CAPITALIZING

                until CustMembr.Next = 0;
            end;

        end;

    end;


    procedure PostDividendEarned(Jtemplate: Code[10]; JBatch: Code[10]; PostingDate: Date; DocumentNo: Code[10]; ExtDocumentNo: Code[10])
    var
        DividendPostingBuffer: Record 52185714;
        SavingsAccounts: Record 52185730;
        LoanApps: Record 52185729;
        Temp: Record 52185782;
        LineN: Integer;
        GenJLine: Record "Gen. Journal Line";
        AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
        GlobalDim1: Code[10];
        GlobalDim2: Code[10];
        PostingJnl: Codeunit "Journal Posting";
        TransactionType: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills;
    begin
        with DividendPostingBuffer do begin
            repeat
                LineN += 1;
                GenJLine.Init;
                GenJLine."Journal Template Name" := Jtemplate;
                GenJLine."Journal Batch Name" := JBatch;
                GenJLine."Line No." := LineN;
                GenJLine."Posting Date" := PostingDate;
                GenJLine."Document No." := 'DIV-' + Format(PreviousYear);
                GenJLine."External Document No." := ExtDocumentNo;
                GenJLine."Account Type" := DividendPostingBuffer."Account Type";
                GenJLine.Validate(GenJLine."Account No.", DividendPostingBuffer."Account No.");
                GenJLine.Description := DividendPostingBuffer.Description;
                GenJLine.Validate(GenJLine."Group Code", '');
                GenJLine."Transaction Type" := DividendPostingBuffer."Transaction Type";
                GenJLine.Validate(GenJLine."Loan No", DividendPostingBuffer."Loan No");
                GenJLine.Validate(GenJLine.Amount, DividendPostingBuffer.Amount);
                GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", DividendPostingBuffer."Shortcut Dimension 1 Code");
                GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", DividendPostingBuffer."Shortcut Dimension 2 Code");
                GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
                GenJLine.Validate(GenJLine."Bal. Account No.", '');
                if GenJLine.Amount <> 0 then
                    GenJLine.Insert;

                SavingsAccounts.Reset;
                SavingsAccounts.SetRange(SavingsAccounts."Member No.", DividendPostingBuffer."Member No.");
                SavingsAccounts.SetFilter(SavingsAccounts."Loan Disbursement Account", '%1', true);
                if SavingsAccounts.Find('-') then begin
                    if PadStr(DividendPostingBuffer.Description, 15) <> 'Dividend Earned' then begin
                        LineN += 1;
                        GenJLine.Init;
                        GenJLine."Journal Template Name" := Jtemplate;
                        GenJLine."Journal Batch Name" := JBatch;
                        GenJLine."Line No." := LineN;
                        GenJLine."Posting Date" := PostingDate;
                        GenJLine."Document No." := 'DIV-' + Format(PreviousYear);
                        GenJLine."External Document No." := DividendPostingBuffer."Loan No";
                        GenJLine."Account Type" := Acctype::Savings;
                        GenJLine.Validate(GenJLine."Account No.", SavingsAccounts."No.");
                        GenJLine.Description := DividendPostingBuffer.Description;
                        GenJLine.Validate(GenJLine."Group Code", '');
                        //GenJLine."Transaction Type":=DividendPostingBuffer."Transaction Type";
                        //GenJLine."Loan No":=DividendPostingBuffer."Loan No";
                        GenJLine.Validate(GenJLine.Amount, -DividendPostingBuffer.Amount);
                        GenJLine.Validate(GenJLine."Shortcut Dimension 1 Code", DividendPostingBuffer."Shortcut Dimension 1 Code");
                        GenJLine.Validate(GenJLine."Shortcut Dimension 2 Code", DividendPostingBuffer."Shortcut Dimension 2 Code");
                        GenJLine."Bal. Account Type" := GenJLine."bal. account type"::"G/L Account";
                        GenJLine.Validate(GenJLine."Bal. Account No.", '');
                        if GenJLine.Amount <> 0 then
                            GenJLine.Insert;
                    end;
                end;
            until DividendPostingBuffer.Next = 0;
        end;
    end;


    procedure CompletePosting(Template: Code[20]; Batch: Code[20])
    var
        GenJLine: Record "Gen. Journal Line";
    begin
        GenJLine.Reset;
        GenJLine.SetRange(GenJLine."Journal Template Name", Template);
        GenJLine.SetRange(GenJLine."Journal Batch Name", Batch);
        // if GenJLine.Find('-') then
    end;


    procedure getDividendSetup()
    begin
        DividendSetUp.Get;
        DividendSetUp.TestField(DividendSetUp."Start Date");
        DividendSetUp.TestField(DividendSetUp."End Date");

        StartDate := DividendSetUp."Start Date";
        EndDate := DividendSetUp."End Date";
    end;

    local procedure GetDividendInstructions(MemberNo: Code[20])
    var
        DividendInstructions: Record 52185712;
    begin
    end;
}

