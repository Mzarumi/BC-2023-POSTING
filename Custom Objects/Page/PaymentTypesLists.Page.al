page 52185989 "Payment Types Lists"
{
    CardPageID = "Payment Types";
    PageType = List;
    SourceTable = "Receipts and Payment Types";
    SourceTableView = WHERE(Type = CONST(Payment));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Account Type"; Rec."Account Type")
                {

                    trigger OnValidate()
                    begin
                        AccountTypeOnAfterValidate;
                    end;
                }
                field("Payment Reference"; Rec."Payment Reference")
                {
                }
                field("VAT Chargeable"; Rec."VAT Chargeable")
                {

                    trigger OnValidate()
                    begin
                        UpdateControl;
                    end;
                }
                field("Withholding Tax Chargeable"; Rec."Withholding Tax Chargeable")
                {

                    trigger OnValidate()
                    begin
                        UpdateControl;
                    end;
                }
                field("VAT Withholding Code"; Rec."VAT Withholding Code")
                {
                }
                field("VAT Deductible"; Rec."VAT Deductible")
                {
                }
                field("Calculate Retention"; Rec."Calculate Retention")
                {

                    trigger OnValidate()
                    begin
                        UpdateControl;
                    end;
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    Enabled = "VAT CodeEnable";
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    Enabled = "Withholding Tax CodeEnable";
                }
                field("Retention Code"; Rec."Retention Code")
                {
                    Enabled = "Retention CodeEnable";
                }
                field("Default Grouping"; Rec."Default Grouping")
                {
                }
                field("G/L Account"; Rec."G/L Account")
                {
                }
                field("Pending Voucher"; Rec."Pending Voucher")
                {
                }
                field("Transation Remarks"; Rec."Transation Remarks")
                {
                }
                field("Direct Expense"; Rec."Direct Expense")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        //CurrPage."G/L AccountVisible":=("Account Type"="Account Type"::"G/L Account");
        OnAfterGetCurrRecord;
    end;

    trigger OnInit()
    begin
        "Retention CodeEnable" := true;
        "Withholding Tax CodeEnable" := true;
        "VAT CodeEnable" := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Type := Rec.Type::Payment;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Account Type" := Rec."Account Type"::Credit;
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage()
    begin
        UpdateControl;
    end;

    var
        [InDataSet]
        "VAT CodeEnable": Boolean;
        [InDataSet]
        "Withholding Tax CodeEnable": Boolean;
        [InDataSet]
        "Retention CodeEnable": Boolean;

    //[Scope('Internal')]
    procedure UpdateControl()
    begin
        if Rec."VAT Chargeable" = Rec."VAT Chargeable"::Yes then
            "VAT CodeEnable" := true
        else
            "VAT CodeEnable" := false;

        if Rec."Withholding Tax Chargeable" = Rec."Withholding Tax Chargeable"::Yes then
            "Withholding Tax CodeEnable" := true
        else
            "Withholding Tax CodeEnable" := false;

        if Rec."Calculate Retention" = Rec."Calculate Retention"::Yes then
            "Retention CodeEnable" := true

        else
            "Retention CodeEnable" := false;
    end;

    local procedure AccountTypeOnAfterValidate()
    begin
        //CurrPage."G/L Account".VISIBLE:=("Account Type"="Account Type"::"G/L Account");
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        UpdateControl;
    end;
}

