page 52185423 "Mpesa Manual Upload"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Mpesa Manual Upload";
    SourceTableView = WHERE(Transfered = FILTER(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Already Posted"; Rec."Already Posted")
                {
                    Editable = false;
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    Editable = false;
                }
                field("Completion Time"; Rec."Completion Time")
                {
                    Editable = false;
                }
                field("Paid In"; Rec."Paid In")
                {
                    Editable = false;
                }
                field(Withdrawn; Rec.Withdrawn)
                {
                }
                field("A/C No."; Rec."A/C No.")
                {
                    Editable = false;
                }
                field("Needs Change"; Rec."Needs Change")
                {
                    Editable = false;
                }
                field(Validated; Rec.Validated)
                {
                    Editable = false;
                }
                field(Details; Rec.Details)
                {
                }
                field("Other Party Info"; Rec."Other Party Info")
                {
                }
                field("Account No"; Rec."Account No")
                {
                    Editable = false;
                }
                field("Key Word"; Rec."Key Word")
                {
                    Editable = false;
                }
                field("Loan No"; Rec."Loan No")
                {
                    Editable = false;
                }
                field("Loan Balance"; Rec."Loan Balance")
                {
                    Editable = false;
                }
                field(Transfered; Rec.Transfered)
                {
                    Editable = false;
                }
                field("New Account No"; Rec."New Account No")
                {

                    trigger OnValidate()
                    begin
                        Rec.TestField(Transfered, false);
                        Rec.TestField(Validated, false);
                        Rec.TestField("Needs Change", true);
                    end;
                }
                field("Date Uploaded"; Rec."Date Uploaded")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action19)
            {
            }
            action("Import Paybill Transactions")
            {
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                ////RunObject = XMLport "Import Paybill";
            }
            action(Clear)
            {
                Image = Default;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    if Confirm('Are you sure you want to Clear All Untransfered Entries?') then begin
                        MpesaManualUpload.Reset;
                        MpesaManualUpload.SetRange(Transfered, false);
                        if MpesaManualUpload.Find('-') then begin
                            MpesaManualUpload.DeleteAll;
                        end;
                    end;
                end;
            }
            action("Validate Entries")
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin


                    MpesaManualUpload.Reset;
                    MpesaManualUpload.SetRange(Validated, false);
                    MpesaManualUpload.SetRange(Transfered, false);
                    //MpesaManualUpload.SETRANGE("A/C No.",'ORD9609');
                    if MpesaManualUpload.Find('-') then begin
                        repeat
                            MpesaManualUpload."Already Posted" := false;

                            BLedger.Reset;
                            BLedger.SetRange("Document No.", MpesaManualUpload."Receipt No.");
                            if BLedger.FindFirst then begin

                                MpesaManualUpload."Already Posted" := true;
                                MpesaManualUpload.Validated := false;
                            end
                            else begin

                                MpesaManualUpload.Validated := true;
                                /*
                                  MemberNo := '';
                                  Key := '';
                                  AccountNo := '';
                                  LoanNo := '';
                                  LBal := 0;
                                  PAct := MpesaManualUpload."A/C No.";
                                  IF (MpesaManualUpload."Needs Change") AND (MpesaManualUpload."New Account No"<>'') THEN
                                      PAct := MpesaManualUpload."New Account No";

                                  MpesaManualUpload."Needs Change" := TRUE;


                                  MobileBanking.GetPayBillAccount(PAct,MemberNo,AccountNo,LoanNo,Key,LBal);

                                  IF MemberNo <> '' THEN
                                      IF AccountNo <> '' THEN BEGIN
                                          MpesaManualUpload."Loan No" := LoanNo;
                                          MpesaManualUpload."Account No" := AccountNo;
                                          MpesaManualUpload."Key Word" := Key;
                                          MpesaManualUpload.Validated := TRUE;
                                          MpesaManualUpload."Loan Balance" := LBal;
                                          MpesaManualUpload."Needs Change" := FALSE;
                                      END;

                                  */
                            end;


                            MpesaManualUpload.Modify;

                        until MpesaManualUpload.Next = 0;
                    end;
                    Message('Validated');

                end;
            }
            action(Transfer)
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    MpesaManualUpload: Record "Mpesa Manual Upload";
                    MBankingTransactions: Record "Sky Transactions";
                    AccountNo: Code[20];
                    LoanNo: Code[20];
                    "Key": Text;
                begin


                    if Confirm('Are you sure you want to transfer all validated Entries?') then begin
                        MpesaManualUpload.Reset;
                        MpesaManualUpload.SetRange(Validated, true);
                        MpesaManualUpload.SetRange(Transfered, false);
                        MpesaManualUpload.SetRange("Already Posted", false);
                        MpesaManualUpload.SetFilter("Paid In", '>0');
                        if MpesaManualUpload.Find('-') then begin
                            repeat

                                MBankingTransactions.Reset;
                                MBankingTransactions.SetRange(MBankingTransactions."Transaction ID", MpesaManualUpload."Receipt No.");
                                if MBankingTransactions.Find('-') = false then begin

                                    MBankingTransactions.Init;
                                    MBankingTransactions."Entry No." := MpesaManualUpload."Receipt No.";
                                    MBankingTransactions."Transaction ID" := MBankingTransactions."Transaction ID";
                                    MBankingTransactions."Session ID" := MpesaManualUpload."Receipt No.";
                                    MBankingTransactions."Transaction Type" := MBankingTransactions."Transaction Type"::Paybill;
                                    MBankingTransactions."Transaction Name" := 'Paybill';
                                    MBankingTransactions.Description := CopyStr(MpesaManualUpload.Details, 1, 50);
                                    MBankingTransactions."Transaction Date" := DT2Date(MpesaManualUpload."Initiation Time");
                                    MBankingTransactions."Transaction Time" := DT2Time(MpesaManualUpload."Initiation Time");
                                    MBankingTransactions."Member Account" := MpesaManualUpload."A/C No.";
                                    MBankingTransactions.Amount := MpesaManualUpload."Paid In";
                                    MBankingTransactions."Loan No." := MpesaManualUpload."Loan No";
                                    MBankingTransactions."Mobile No." := '';
                                    MBankingTransactions."Vendor Commission" := 0;
                                    MBankingTransactions."Sacco Fee" := 0;
                                    MBankingTransactions."Paybill Member ID" := MpesaManualUpload."A/C No.";
                                    MBankingTransactions."Destination Account" := '';
                                    MBankingTransactions."Destination Name" := '';
                                    MBankingTransactions."Manually Inserted" := true;
                                    MBankingTransactions.Organization := '';
                                    MBankingTransactions.Insert;


                                    MpesaManualUpload.Transfered := true;
                                    MpesaManualUpload.Modify;

                                end;
                            until MpesaManualUpload.Next = 0;
                        end;


                        MpesaManualUpload.Reset;
                        MpesaManualUpload.SetRange(Validated, true);
                        MpesaManualUpload.SetRange(Transfered, false);
                        MpesaManualUpload.SetRange("Already Posted", false);
                        MpesaManualUpload.SetFilter(Withdrawn, '<0');
                        if MpesaManualUpload.Find('-') then begin
                            repeat

                                MBankingTransactions.Reset;
                                MBankingTransactions.SetRange(MBankingTransactions."Transaction ID", MpesaManualUpload."Receipt No.");
                                if MBankingTransactions.Find('-') = false then begin

                                    MBankingTransactions.Init;
                                    MBankingTransactions."Entry No." := MpesaManualUpload."Receipt No.";
                                    MBankingTransactions."Transaction ID" := MpesaManualUpload."Receipt No.";
                                    MBankingTransactions."Session ID" := MpesaManualUpload."Linked Transaction ID";
                                    MBankingTransactions."Transaction Type" := MBankingTransactions."Transaction Type"::"Mpesa Withdrawal";
                                    MBankingTransactions."Transaction Name" := 'Mpesa Withdrawal';
                                    MBankingTransactions.Description := CopyStr(MpesaManualUpload.Details, 1, 50);
                                    MBankingTransactions."Transaction Date" := DT2Date(MpesaManualUpload."Initiation Time");
                                    MBankingTransactions."Transaction Time" := DT2Time(MpesaManualUpload."Initiation Time");
                                    MBankingTransactions."Member Account" := MpesaManualUpload."A/C No.";
                                    MBankingTransactions.Amount := MpesaManualUpload.Withdrawn * -1;
                                    MBankingTransactions."Loan No." := MpesaManualUpload."Loan No";
                                    MBankingTransactions."Mobile No." := '';
                                    MBankingTransactions."Vendor Commission" := 0;
                                    MBankingTransactions."Sacco Fee" := 0;
                                    MBankingTransactions."Paybill Member ID" := MpesaManualUpload."A/C No.";
                                    MBankingTransactions."Destination Account" := '';
                                    MBankingTransactions."Destination Name" := '';
                                    MBankingTransactions.Organization := '';
                                    MBankingTransactions."Manually Inserted" := true;
                                    MBankingTransactions.Insert;


                                    MpesaManualUpload.Transfered := true;
                                    MpesaManualUpload.Modify;

                                end;
                            until MpesaManualUpload.Next = 0;
                        end;

                    end;
                end;
            }
        }
    }

    var
        MobileBanking: Codeunit "Sky Mbanking";
        MpesaManualUpload: Record "Mpesa Manual Upload";
        MBankingTransactions: Record "Sky Transactions";
        AccountNo: Text;
        LoanNo: Code[20];
        "Key": Text;
        MemberNo: Code[20];
        LBal: Decimal;
        PAct: Code[20];
        BLedger: Record "Bank Account Ledger Entry";
}

