page 52185821 "Cashier Transaction Lines"
{
    PageType = List;
    SourceTable = "Cashier Transaction Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                }
                field("Account No"; Rec."Account No")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("Loan No"; Rec."Loan No")
                {
                }
                field(Amount; Rec.Amount)
                {
                }
                field("Member No"; Rec."Member No")
                {
                    Editable = false;
                }
                field("Transaction No"; Rec."Transaction No")
                {
                    Visible = false;
                }
                field("Product Type"; Rec."Product Type")
                {
                }
            }
            group(Control24)
            {
                ShowCaption = false;
                fixed("Account Details")
                {
                    group("Account Details.")
                    {
                        Caption = 'Account Details.';
                        field("Account No."; Rec."Account No")
                        {
                            Editable = false;
                        }
                    }
                    group(Membership)
                    {
                        Caption = 'Membership';
                        field("Member Nos"; Rec."Member No")
                        {
                            Caption = 'Member Nos';
                            Editable = false;
                        }
                    }
                    group(Amounts)
                    {
                        Caption = 'Amounts';
                        field(Balance; Rec.Amount)
                        {
                            AutoFormatType = 1;
                            Caption = 'Balance';
                            Editable = false;
                            Visible = true;
                        }
                    }
                    group(Balances)
                    {
                        Caption = 'Total Amount';
                        field(TotalBalance; Rec.Amount + TotalAmount - xRec.Amount)
                        {
                            AutoFormatType = 1;
                            Caption = 'Total Balance';
                            Editable = false;
                            Visible = true;
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            part("Approved Images"; "Member Picture & Signature")
            {
                Caption = 'Approved Images';
                SubPageLink = "Member No" = FIELD("Member No");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Monthly Repayments")
            {
                Image = SuggestLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                    Ctrans.Reset;
                    Ctrans.SetRange(Ctrans.No, Rec."Transaction No");
                    if Ctrans.Find('-') then begin

                        Loans.Reset;
                        Loans.SetRange(Loans."Member No.", Ctrans."Member No.");
                        if Loans.Find('-') then begin
                            repeat

                                Loans.CalcFields(Loans."Outstanding Balance", Loans."Outstanding Interest", Loans."Outstanding Bills");

                                if (Loans."Outstanding Balance") > 0 then begin

                                    CtransLines.Init;
                                    CtransLines."Member No" := Ctrans."Member No.";
                                    CtransLines."Transaction No" := Ctrans.No;
                                    CtransLines."Account No" := Loans."Loan Account";
                                    CtransLines."Transaction Type" := CtransLines."Transaction Type"::Repayment;
                                    CtransLines."Loan No" := Loans."Loan No.";
                                    CtransLines.Amount := Loans.Repayment;//"Outstanding Bills";
                                    CtransLines.Type := CtransLines.Type::Credit;
                                    CtransLines.Insert;

                                    CtransLines.Init;
                                    CtransLines."Member No" := Ctrans."Member No.";
                                    CtransLines."Transaction No" := Ctrans.No;
                                    CtransLines."Account No" := Loans."Loan Account";
                                    CtransLines."Transaction Type" := CtransLines."Transaction Type"::"Interest Paid";
                                    CtransLines."Loan No" := Loans."Loan No.";
                                    if Loans."Outstanding Interest" > 0 then begin
                                        CtransLines.Amount := Loans."Outstanding Interest";
                                    end;
                                    CtransLines.Type := CtransLines.Type::Credit;
                                    CtransLines.Insert;

                                end;


                            until Loans.Next = 0;
                        end;
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CalcBal;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        CalcBal;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CalcBal;
    end;

    trigger OnOpenPage()
    begin

        //**Prevent modification of approved entries
        Ctrans.Reset;
        Ctrans.SetRange(Ctrans.No, Rec."Transaction No");
        if Ctrans.Find('-') then begin
            if Ctrans.Posted then
                CurrPage.Editable := false
            else
                CurrPage.Editable := true;
        end;
        CalcBal;
    end;

    var
        Ctrans: Record "Cashier Transactions";
        Loans: Record Loans;
        CtransLines: Record "Cashier Transaction Lines";
        CashierTransactionLines: Record "Cashier Transaction Lines";
        TotalAmount: Decimal;
        CashTrans: Record "Cashier Transactions";

    //[Scope('Internal')]
    procedure CalcBal()
    begin
        TotalAmount := 0;
        CashierTransactionLines.Reset;
        CashierTransactionLines.SetRange("Transaction No", Rec."Transaction No");
        CashierTransactionLines.CalcSums(Amount);
        TotalAmount := CashierTransactionLines.Amount;
        if CashTrans.Get(Rec."Transaction No") then begin
            Rec."Member No" := CashTrans."Member No.";
        end;
    end;
}

