#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52185619 "Member Register"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Member Register.rdlc';

    dataset
    {
        dataitem(Members; Members)
        {
            RequestFilterFields = "No.", "Single Party/Multiple", Status, "Employer Code", "Registration Date", "Group Account", "Global Dimension 1 Code", "Global Dimension 2 Code", Nationality;
            column(ReportForNavId_1; 1)
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(CompanyInformation_Picture; CompanyInformation.Picture)
            {
            }
            column(CompanyAddress; CompanyAddress)
            {
            }
            column(CompanyTelephone; CompanyTelephone)
            {
            }
            column(CommunicationOnline; CommunicationOnline)
            {
            }
            column(No_Members; Members."No.")
            {
            }
            column(AccountType_Members; Members."Single Party/Multiple")
            {
            }
            column(Name_Members; Members.Name)
            {
            }
            column(GlobalDimension1Code_Members; Members."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Members; Members."Global Dimension 2 Code")
            {
            }
            column(RegistrationDate_Members; Members."Registration Date")
            {
            }
            column(EmployerCode_Members; Members."Employer Code")
            {
            }
            column(Nationality_Members; Members.Nationality)
            {
            }
            column(PayrollStaffNo_Members; Members."Payroll/Staff No.")
            {
            }
            column(PhoneNo_Members; Members."Phone No.")
            {
            }
            column(IDNumber_Members; Members."ID No.")
            {
            }
            column(BirthCertificateNo_Members; Members."Birth Certificate No.")
            {
            }
            column(GroupAccountNo_Members; Members."Group Account No.")
            {
            }
            column(SalespersonCode_Members; Members."Recruited By")
            {
            }
            column(MemberSegment_Members; Members."Member Segment")
            {
            }
            column(CreatedBy_Members; Members."Created By")
            {
            }
            column(Source_Members; Members.Source)
            {
            }
            column(Status_Members; Members.Status)
            {
            }
            column(SCount; SNo)
            {
            }
            column(MemberCategory_Members; Members."Member Category")
            {
            }
            column(AplhaDeposit; AplhaDeposit)
            {
            }
            column(SharesCapital; SharesCapital)
            {
            }
            column(RegFees; RegFees)
            {
            }
            column(ShortTLoans; ShortTLoans)
            {
            }
            column(LongTLoans; LongTLoans)
            {
            }
            column(TotalLoans; TotalLoans)
            {
            }
            column(BranchCode_Members; Members."Branch Code")
            {
            }
            column(CreatedBy; CreatedBy)
            {
            }
            column(HASImage; HASImage)
            {
            }
            column(HASNextKin; HASNextKin)
            {
            }

            trigger OnAfterGetRecord()
            begin
                SNo += 1;
                HASImage := false;
                HASNextKin := false;
                ShortTLoans := 0;
                LongTLoans := 0;
                SharesCapital := 0;
                AplhaDeposit := 0;
                RegFees := 0;
                TotalLoans := 0;
                CreatedBy := '';
                User.Reset;
                User.SetRange("User Name", Members."Created By");
                if User.Find('-') then begin
                    CreatedBy := User."Full Name";
                end;

                SavingAcc.Reset;
                SavingAcc.SetRange("Member No.", "No.");
                SavingAcc.SetRange("Product Type", AlphaDepositProduct);
                if SavingAcc.Find('-') then begin
                    SavingAcc.CalcFields(Balance);
                    AplhaDeposit := SavingAcc.Balance;
                end;

                SavingAcc.Reset;
                SavingAcc.SetRange("Member No.", "No.");
                SavingAcc.SetRange("Product Type", SharesCapitalProduct);
                if SavingAcc.Find('-') then begin
                    SavingAcc.CalcFields(Balance);
                    SharesCapital := SavingAcc.Balance;
                end;

                SavingAcc.Reset;
                SavingAcc.SetRange("Member No.", "No.");
                SavingAcc.SetRange("Product Type", RegFeesProduct);
                if SavingAcc.Find('-') then begin
                    SavingAcc.CalcFields(Balance);
                    RegFees := SavingAcc.Balance;
                end;

                LoanAcc.Reset;
                LoanAcc.SetRange("Member No.", "No.");
                LoanAcc.SetRange("Loan Span", LoanAcc."loan span"::"Short Term");
                if LoanAcc.Find('-') then begin
                    repeat
                        LoanAcc.CalcFields("Outstanding Balance");
                        ShortTLoans := ShortTLoans + LoanAcc."Outstanding Balance";
                    until LoanAcc.Next = 0;
                end;

                LoanAcc.Reset;
                LoanAcc.SetRange("Member No.", "No.");
                LoanAcc.SetFilter("Loan Span", '<>%1', LoanAcc."loan span"::"Short Term");
                if LoanAcc.Find('-') then begin
                    repeat
                        LoanAcc.CalcFields("Outstanding Balance");
                        LongTLoans := LongTLoans + LoanAcc."Outstanding Balance";
                    until LoanAcc.Next = 0;
                end;

                // CreditAcc.RESET;
                // CreditAcc.SETRANGE("Member No.","No.");
                // IF CreditAcc.FIND('-') THEN
                //    BEGIN
                //    REPEAT
                //    CreditAcc.CALCFIELDS(Balance);
                //    TotalLoans:=TotalLoans+CreditAcc.Balance;
                //    UNTIL CreditAcc.NEXT=0;
                //    END;

                LoanAcc.Reset;
                LoanAcc.SetRange("Member No.", "No.");
                if LoanAcc.Find('-') then begin
                    repeat
                        LoanAcc.CalcFields("Outstanding Balance");
                        TotalLoans := TotalLoans + LoanAcc."Outstanding Balance";
                    until LoanAcc.Next = 0;
                end;

                NextofKIN.Reset;
                NextofKIN.SetRange("Account No", Members."No.");
                if NextofKIN.Find('-') then
                    HASNextKin := true;

                ImageData.Reset;
                ImageData.SetRange("Member No", Members."No.");
                if ImageData.Find('-') then begin
                    ImageData.CalcFields(Picture, Signature);
                    if ImageData.Picture.Hasvalue and ImageData.Signature.Hasvalue then
                        HASImage := true;
                end;
                if (ShowImage = true) or (ShowNextofKin = true) then begin
                    if (ShowImage = true) and (ShowNextofKin = true) then begin
                        if (HASImage = false) and (HASNextKin = false) then
                            CurrReport.Skip;
                    end else
                        if (ShowImage = true) and (ShowNextofKin = false) then begin
                            if (HASImage = false) and (HASNextKin = true) then
                                CurrReport.Skip;
                        end else
                            if (ShowImage = false) and (ShowNextofKin = true) then begin
                                if (HASImage = true) and (HASNextKin = false) then
                                    CurrReport.Skip;
                            end else
                                if (ShowImage = false) and (ShowNextofKin = false) then begin
                                    if (HASImage = true) and (HASNextKin = true) then
                                        CurrReport.Skip;
                                end;

                end;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(AlphaDepositProduct; AlphaDepositProduct)
                {
                    ApplicationArea = Basic;
                    Caption = 'Deposit Contribution Code';
                    TableRelation = "Product Factory"."Product ID" where("Product Category" = filter("Deposit Contribution"));
                }
                field(SharesCapitalProduct; SharesCapitalProduct)
                {
                    ApplicationArea = Basic;
                    Caption = 'Shares Capital Code';
                    TableRelation = "Product Factory"."Product ID" where("Product Category" = filter("Share Capital"));
                }
                field(RegFeesProduct; RegFeesProduct)
                {
                    ApplicationArea = Basic;
                    Caption = 'Registration Fees Code';
                    TableRelation = "Product Factory"."Product ID" where("Product Category" = filter("Registration Fee"));
                }
                field(ShowNextofKin; ShowNextofKin)
                {
                    ApplicationArea = Basic;
                    Caption = 'Show Next of Kin';
                }
                field(ShowImage; ShowImage)
                {
                    ApplicationArea = Basic;
                    Caption = 'Show Image';
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

    trigger OnPreReport()
    begin
        if CompanyInformation.Get then
            CompanyInformation.CalcFields(CompanyInformation.Picture);
        CompanyAddress := CompanyInformation.Address + ' -Post Code: ' + CompanyInformation."Post Code" + ' -City:' + CompanyInformation.City + ' Region: ' + CompanyInformation."Country/Region Code";
        CompanyTelephone := 'Tel: ' + CompanyInformation."Phone No." + ' -Office Tel: ' + CompanyInformation."Phone No. 2";
        CommunicationOnline := 'E-mail: ' + CompanyInformation."E-Mail" + '- Website: ' + CompanyInformation."Home Page";
    end;

    var
        CompanyInformation: Record "Company Information";
        CompanyAddress: Text;
        CompanyTelephone: Text;
        CommunicationOnline: Text;
        SNo: Integer;
        SavingAcc: Record 52185730;
        CreditAcc: Record 52185731;
        LoanAcc: Record 52185729;
        AplhaDeposit: Decimal;
        SharesCapital: Decimal;
        RegFees: Decimal;
        CreditLoans: Decimal;
        BankingLoans: Decimal;
        AlphaDepositProduct: Code[10];
        SharesCapitalProduct: Code[10];
        RegFeesProduct: Code[10];
        ShortTLoans: Decimal;
        LongTLoans: Decimal;
        TotalLoans: Decimal;
        CreatedBy: Text;
        User: Record User;
        NextofKIN: Record 52185701;
        ImageData: Record 52185702;
        HASNextKin: Boolean;
        HASImage: Boolean;
        ShowNextofKin: Boolean;
        ShowImage: Boolean;
}
