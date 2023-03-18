page 52185912 "Receipt Types"
{
    PageType = Card;
    SourceTable = "Receipts and Payment Types";
    SourceTableView = WHERE(Type = CONST(Receipt));

    layout
    {
        area(content)
        {
            group(Control1)
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
                        //check the account type selected by the user
                        case Rec."Account Type" of
                            Rec."Account Type"::Customer:
                                begin
                                    CustomerPaymentOnAccountVisibl := true;
                                end;
                            Rec."Account Type"::Vendor,
                            Rec."Account Type"::"Bank Account",
                            Rec."Account Type"::"Fixed Asset",
                            Rec."Account Type"::"G/L Account":
                                begin
                                    CustomerPaymentOnAccountVisibl := false;
                                end;
                        end;
                    end;
                }
                field("Customer Payment On Account"; Rec."Customer Payment On Account")
                {
                    Visible = CustomerPaymentOnAccountVisibl;
                }
                field("Default Grouping"; Rec."Default Grouping")
                {
                }
                field("G/L Account"; Rec."G/L Account")
                {
                }
                field("Transation Remarks"; Rec."Transation Remarks")
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
        OnAfterGetCurrRecord;
    end;

    trigger OnInit()
    begin
        CustomerPaymentOnAccountVisibl := true;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Type" := Rec."Type"::Receipt;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage()
    begin
        UserSetup.GetDefaultSalesAmountApprovalLimit();
    end;

    var
        [InDataSet]
        CustomerPaymentOnAccountVisibl: Boolean;
        UserSetup: Record "User Setup";

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        //check the account type selected by the user
        case Rec."Account Type" of
            Rec."Account Type"::Customer:
                begin
                    CustomerPaymentOnAccountVisibl := true;
                end;
            Rec."Account Type"::Vendor,
            Rec."Account Type"::"Bank Account",
            Rec."Account Type"::"Fixed Asset",
            Rec."Account Type"::"G/L Account":
                begin
                    CustomerPaymentOnAccountVisibl := false;
                end;
        end;
    end;
}

