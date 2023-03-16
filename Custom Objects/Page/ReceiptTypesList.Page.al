page 52185990 "Receipt Types List"
{
    CardPageID = "Receipt Types";
    PageType = List;
    SourceTable = "Receipts and Payment Types";
    SourceTableView = WHERE(Type = CONST(Receipt));

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
        StatusPermissions.Reset;
        StatusPermissions.SetRange(StatusPermissions."User ID", UserId);
        StatusPermissions.SetRange(StatusPermissions."View Funds Management Setup", true);
        StatusPermissions.SetRange(StatusPermissions."Function Extended", StatusPermissions."Function Extended"::Administrator);
        if not StatusPermissions.Find('-') then
            Error(Text000);
    end;

    var
        [InDataSet]
        CustomerPaymentOnAccountVisibl: Boolean;
        StatusPermissions: Record "Status Change Permissions.";
        Text000: Label 'You do not have permissions to view This page';

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

