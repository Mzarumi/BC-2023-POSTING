page 52185445 "Sky Update Paybill ID"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Sky Transactions";
    SourceTableView = WHERE(Posted = CONST(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transaction ID"; Rec."Transaction ID")
                {
                    Editable = false;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    Editable = false;
                }
                field("Transaction Time"; Rec."Transaction Time")
                {
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                }
                field("Phone/Acc. No"; Rec."Member Account")
                {

                    trigger OnValidate()
                    var
                        MemberNo: Code[20];
                        AccountNo: Code[20];
                        LoanNo: Code[20];
                        "Key": Text;
                        LBal: Decimal;
                    begin

                        if Loans.Get(Rec."Member Account") then begin

                            if Confirm('Member Name ' + Loans."Member No." + '. Confirm Loanee?') then begin
                                Rec."Needs Change" := false;
                                Rec."Changed By" := UserId;
                                Rec."Date Changed" := Today;
                                Rec."Changed By" := UserId;
                                Rec.Modify;
                            end
                            else
                                Error('Aborted');
                        end
                        else begin

                            if Savings.Get(Rec."Member Account") then begin

                                if Confirm('Member Name ' + Savings.Name + '. Confirm Member?') then begin
                                    Rec."Needs Change" := false;
                                    Rec."Changed By" := UserId;
                                    Rec."Date Changed" := Today;
                                    Rec."Changed By" := UserId;
                                    Rec.Modify;
                                end
                                else
                                    Error('Aborted');
                            end
                            else begin

                                Savings.Reset;
                                Savings.SetRange("Transactional Mobile No", Rec."Member Account");
                                if Savings.FindFirst then begin
                                    if Confirm(Savings.Name + '\ Confirm Member?') then begin
                                        Rec."Needs Change" := false;
                                        Rec."Member Account" := Savings."No.";
                                        Rec."Changed By" := UserId;
                                        Rec."Date Changed" := Today;
                                        Rec."Changed By" := UserId;
                                        Rec.Modify;
                                    end
                                    else
                                        Error('Aborted');
                                end
                                else
                                    Error('Member. Does not Exist');
                            end

                        end;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Retry)
            {

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to retry posting this transaction') then begin
                        Rec."Needs Change" := false;
                        Rec.Modify;
                    end;
                end;
            }
        }
    }

    trigger OnInit()
    begin
        StatusChangePermissions.Reset;
        StatusChangePermissions.SetRange("User ID", UserId);
        StatusChangePermissions.SetRange("Update Paybill Transaction", true);
        if not StatusChangePermissions.FindFirst then
            Error('You do not have the following permission: "Update Paybill Transaction"');
    end;

    var
        StatusChangePermissions: Record "Sky Permissions";
        Savings: Record "Savings Accounts";
        Loans: Record "Gen. Journal Line Loans";
        //SkyMbanking: Codeunit "Sky Mbanking";
}

