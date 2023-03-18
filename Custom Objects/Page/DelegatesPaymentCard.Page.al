// page 52186328 "Delegates Payment Card"
// {
//     DeleteAllowed = false;
//     PageType = Card;
//     SourceTable = "Delegates Payment";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 Editable = PageEditable;
//                 field("Code"; Rec.Code)
//                 {
//                 }
//                 field("Delegate Region"; Rec."Delegate Region")
//                 {
//                     Caption = 'Electoral Code';
//                 }
//                 field("Delegate Region Description"; Rec."Delegate Region Description")
//                 {
//                     Caption = 'Electoral Name';
//                 }
//                 field("Minute No."; Rec."Minute No.")
//                 {
//                 }
//                 field("Amount To Pay"; Rec."Amount To Pay")
//                 {
//                 }
//                 field("Transaction Type"; Rec."Transaction Type")
//                 {
//                 }
//                 field("Payment Frequency"; Rec."Payment Frequency")
//                 {
//                 }
//                 field("Posting Date"; Rec."Posting Date")
//                 {
//                 }
//                 field("Document No."; Rec."Document No.")
//                 {
//                 }
//                 field("Payment Made To"; Rec."Payment Made To")
//                 {
//                 }
//                 field("Payment Description"; Rec."Payment Description")
//                 {
//                 }
//                 field("Total Payment"; Rec."Total Payment")
//                 {
//                 }
//                 field("Period Ending Date"; Rec."Period Ending Date")
//                 {
//                 }
//                 field("Transaction Code"; Rec."Transaction Code")
//                 {
//                 }
//             }
//             group("Other Details")
//             {
//                 Editable = PageEditable;
//                 field("Electoral Zone"; Rec."Electoral Zone")
//                 {
//                 }
//                 field("Electoral Zone Name"; Rec."Electoral Zone Name")
//                 {
//                 }
//                 field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
//                 {
//                 }
//                 field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
//                 {
//                 }
//                 field("Created By"; Rec."Created By")
//                 {
//                 }
//                 field("Creation Date"; Rec."Creation Date")
//                 {
//                 }
//                 field(County; Rec.County)
//                 {
//                 }
//                 field("Sub-County"; Rec."Sub-County")
//                 {
//                 }
//                 field("County Name"; Rec."County Name")
//                 {
//                 }
//                 field("Sub-County Name"; Rec."Sub-County Name")
//                 {
//                 }
//                 field("Approval Date"; Rec."Approval Date")
//                 {
//                 }
//                 field(Status; Rec.Status)
//                 {
//                 }
//                 field(Posted; Rec.Posted)
//                 {
//                 }
//                 field("Date Posted"; Rec."Date Posted")
//                 {
//                 }
//             }
//             part(Control25; "Delegates Payment Line List")
//             {
//                 Editable = PageEditable;
//                 SubPageLink = Code = FIELD(Code),
//                               "Delegate Region" = FIELD("Delegate Region"),
//                               "Payment Frequency" = FIELD("Payment Frequency");
//             }
//         }
//     }

//     actions
//     {
//         area(creation)
//         {
//             group("Request Approval")
//             {
//                 Caption = 'Request Approval';
//                 action(SendApprovalRequest)
//                 {
//                     Caption = 'Send A&pproval Request';
//                     Enabled = NOT OpenApprovalEntriesExist;
//                     Image = SendApprovalRequest;
//                     Promoted = true;
//                     PromotedCategory = Category9;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                         CustomApprovals: Codeunit "Custom Approvals Codeunit";
//                     begin
//                         TestField("Minute No.");
//                         TestField("Delegate Region");
//                         TestField("Amount To Pay");
//                         TestField("Total Payment");
//                         TestField("Posting Date");
//                         TestField("Document No.");
//                         TestField("Transaction Type");
//                         TestField("Payment Frequency");
//                         TestField("Transaction Code");

//                         CalcFields("Total Payment");
//                         if "Total Payment" <> "Amount To Pay" then
//                             Error(Err0001);

//                         if not LinesExists then
//                             Error('There are no Lines created for this Document');

//                         VarVariant := Rec;
//                         if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
//                             CustomApprovals.OnSendDocForApproval(VarVariant);
//                     end;
//                 }
//                 action(CancelApprovalRequest)
//                 {
//                     Caption = 'Cancel Approval Re&quest';
//                     Enabled = OpenApprovalEntriesExist;
//                     Image = Cancel;
//                     Promoted = true;
//                     PromotedCategory = Category9;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                         CustomApprovals: Codeunit "Custom Approvals Codeunit";
//                     begin
//                         VarVariant := Rec;
//                         CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
//                     end;
//                 }
//             }
//             group(Navigate)
//             {
//                 Caption = 'Navigate';
//                 action(Approvals)
//                 {
//                     Caption = 'Approvals';
//                     Image = Approvals;
//                     Promoted = true;
//                     PromotedCategory = Category9;

//                     trigger OnAction()
//                     var
//                         ApprovalEntries: Page "Approval Entries";
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         /*
//                         DocumentType := DocumentType::"Payment Voucher";
//                         ApprovalEntries.Setfilters(DATABASE::"Payments Header","Document Type","No.");
//                         ApprovalEntries.RUN;
//                         */
//                         ApprovalsMgmt.OpenApprovalEntriesPage(RecordId)

//                     end;
//                 }
//             }
//             group(Approval)
//             {
//                 Caption = 'Approval';
//                 action(Reopen)
//                 {
//                     Caption = 'Reopen';
//                     Image = ReOpen;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         TestField(Posted, false);
//                         if not Confirm('Are you sure you want to reopen this document?') then
//                             exit;
//                         Status := Status::Open;
//                         Modify;
//                     end;
//                 }
//                 action(Approve)
//                 {
//                     Caption = 'Approve';
//                     Image = Approve;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     Visible = OpenApprovalEntriesExistForCurrUser;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId)
//                     end;
//                 }
//                 action(Reject)
//                 {
//                     Caption = 'Reject';
//                     Image = Reject;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;
//                     Visible = OpenApprovalEntriesExistForCurrUser;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         ApprovalsMgmt.RejectRecordApprovalRequest(RecordId)
//                     end;
//                 }
//                 action(Delegate)
//                 {
//                     Caption = 'Delegate';
//                     Image = Delegate;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     Visible = OpenApprovalEntriesExistForCurrUser;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId)
//                     end;
//                 }
//                 action(Comment)
//                 {
//                     Caption = 'Comments';
//                     Image = ViewComments;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     RunObject = Page "Approval Comments";
//                     RunPageLink = "Table ID" = CONST(52185888),
//                                   "Document No." = FIELD("No. Series");
//                     Visible = OpenApprovalEntriesExistForCurrUser;
//                 }
//                 action(Post)
//                 {
//                     Image = PostDocument;
//                     Promoted = true;
//                     PromotedCategory = Category8;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     var
//                         DelegatePaym: Record "Delegate Payment Line";
//                         SavingsLedgerEntry: Record "Savings Ledger Entry";
//                         ChargeDuty: Boolean;
//                     begin
//                         Amt := 0;
//                         RunBal := 0;
//                         TestField(Posted, false);
//                         TestField(Status, Status::Approved);
//                         if not Confirm('Are you sure you want to post this transaction?') then exit;
//                         //SaccoTransactions
//                         Temp.Get(UserId);
//                         AccountNo := '';
//                         Jtemplate := Temp."Delegates Pay.Journal Template";
//                         JBatch := Temp."Delegates Pay. Journal Batch";
//                         Tillno := Temp."Default  Bank";
//                         CmemberNo := Temp."Member No.";
//                         Excess := Temp."Excess Account";
//                         Shortage := Temp."Shortage Account";
//                         GenSetup.Get();
//                         if Jtemplate = '' then begin
//                             Error(Text0001);
//                         end;

//                         if JBatch = '' then begin
//                             Error(Text0002);
//                         end;
//                         GenJournalLine.Reset;
//                         GenJournalLine.SetRange("Journal Template Name", Jtemplate);
//                         GenJournalLine.SetRange("Journal Batch Name", JBatch);
//                         GenJournalLine.DeleteAll;

//                         Dim1 := "Global Dimension 1 Code";
//                         Dim2 := "Global Dimension 2 Code";

//                         DelegatePaymentLine.Reset;
//                         DelegatePaymentLine.SetRange(Code, Code);
//                         DelegatePaymentLine.SetRange(Posted, false);
//                         if DelegatePaymentLine.Find('-') then begin
//                             repeat
//                                 //get Fosa Account
//                                 if Members.Get(DelegatePaymentLine."Delegate MNO.") then begin
//                                     Account.Reset;
//                                     Account.SetRange("Member No.", Members."No.");
//                                     Account.SetRange("Loan Disbursement Account", true);
//                                     Account.SetCurrentKey(Blocked);
//                                     if Account.Find('-') then begin
//                                         AccountNo := Account."No.";
//                                         LineNo := LineNo + 10000;

//                                         DelegatesTariff.Get(DelegatePaymentLine."Tariff Code");

//                                         GenJournalLine.Init;
//                                         GenJournalLine."Journal Template Name" := Jtemplate;
//                                         GenJournalLine."Journal Batch Name" := JBatch;
//                                         GenJournalLine."Line No." := LineNo;
//                                         GenJournalLine."Document No." := "Document No.";
//                                         GenJournalLine."Account Type" := GenJournalLine."Account Type"::Employee;
//                                         GenJournalLine."Account No." := AccountNo;
//                                         GenJournalLine."External Document No." := DelegatePaymentLine."Tariff Code";
//                                         GenJournalLine.Validate(GenJournalLine."Account No.");
//                                         GenJournalLine."Posting Date" := "Posting Date";
//                                         GenJournalLine.Description := PadStr(Format(DelegatePaymentLine."Delegate Name") + '-' + "Payment Description" + '-' + DelegatesTariff.Description, 50);
//                                         GenJournalLine.Amount := DelegatePaymentLine."Amount Payable" * -1;
//                                         GenJournalLine.Validate(GenJournalLine.Amount);
//                                         GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::"G/L Account";
//                                         GenJournalLine."Bal. Account No." := DelegatesTariff."Account No.";
//                                         GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
//                                         GenJournalLine."Shortcut Dimension 1 Code" := Dim1;//Deleg"Global Dimension 1 Code";
//                                         GenJournalLine."Shortcut Dimension 2 Code" := Dim2;//DelegatePaymentLine."Global Dimension 2 Code";
//                                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                         GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                         if GenJournalLine.Amount <> 0 then
//                                             GenJournalLine.Insert;



//                                         //Charges



//                                         SavingsLedgerEntry.Reset;
//                                         SavingsLedgerEntry.SetRange("Customer No.", AccountNo);
//                                         SavingsLedgerEntry.SetRange("Document No.", "Document No.");
//                                         SavingsLedgerEntry.SetRange("Posting Date", "Posting Date");
//                                         if not SavingsLedgerEntry.Find('-') then begin
//                                             ChargeAmount := 0;

//                                             TCharges := 0;
//                                             TransactionCharges.Reset;
//                                             TransactionCharges.SetRange(TransactionCharges."Transaction Type", "Transaction Code");
//                                             if TransactionCharges.Find('-') then begin
//                                                 repeat
//                                                     if (TransactionCharges."Transaction Charge Category" = TransactionCharges."Transaction Charge Category"::Normal) or
//                                                     (TransactionCharges."Transaction Charge Category" = TransactionCharges."Transaction Charge Category"::"Stamp Duty") then begin
//                                                         // LineNo:=LineNo+10000;
//                                                         ChargeAmount := 0;
//                                                         if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::"% of Amount" = true then
//                                                             ChargeAmount := (DelegatePaymentLine."Amount Payable" * TransactionCharges."Percentage of Amount") * 0.01
//                                                         else
//                                                             ChargeAmount := TransactionCharges."Charge Amount";
//                                                         if TransactionCharges."Charge Type" = TransactionCharges."Charge Type"::Staggered then begin
//                                                             TransactionCharges.TestField(TransactionCharges."Staggered Charge Code");
//                                                             TariffDetails.Reset;
//                                                             TariffDetails.SetRange(TariffDetails.Code, TransactionCharges."Staggered Charge Code");
//                                                             if TariffDetails.Find('-') then begin
//                                                                 repeat
//                                                                     if (DelegatePaymentLine."Amount Payable" >= TariffDetails."Lower Limit") and (DelegatePaymentLine."Amount Payable" <= TariffDetails."Upper Limit") then begin
//                                                                         if TariffDetails."Use Percentage" = true then begin
//                                                                             ChargeAmount := DelegatePaymentLine."Amount Payable" * TariffDetails.Percentage * 0.01;
//                                                                         end else begin
//                                                                             ChargeAmount := TariffDetails."Charge Amount";
//                                                                         end;
//                                                                     end;
//                                                                 until TariffDetails.Next = 0;
//                                                             end;
//                                                         end;

//                                                     end;
//                                                 until TransactionCharges.Next = 0;

//                                                 LineNo := LineNo + 10000;

//                                                 GenJournalLine.Init;
//                                                 GenJournalLine."Journal Template Name" := Jtemplate;
//                                                 GenJournalLine."Journal Batch Name" := JBatch;
//                                                 GenJournalLine."Line No." := LineNo;
//                                                 GenJournalLine."Document No." := "Document No.";
//                                                 GenJournalLine."Account Type" := GenJournalLine."Account Type"::Employee;
//                                                 GenJournalLine."Account No." := AccountNo;
//                                                 GenJournalLine."External Document No." := DelegatePaymentLine."Tariff Code";
//                                                 GenJournalLine.Validate(GenJournalLine."Account No.");
//                                                 GenJournalLine."Posting Date" := "Posting Date";
//                                                 GenJournalLine.Description := PadStr(Format(DelegatePaymentLine."Delegate Name") + '-' + 'Charges', 50);
//                                                 GenJournalLine.Amount := ChargeAmount;
//                                                 GenJournalLine.Validate(GenJournalLine.Amount);
//                                                 GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::"G/L Account";
//                                                 GenJournalLine."Bal. Account No." := TransactionCharges."G/L Account";
//                                                 GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
//                                                 GenJournalLine."Shortcut Dimension 1 Code" := Dim1;//Deleg"Global Dimension 1 Code";
//                                                 GenJournalLine."Shortcut Dimension 2 Code" := Dim2;//DelegatePaymentLine."Global Dimension 2 Code";
//                                                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                                 if GenJournalLine.Amount <> 0 then
//                                                     GenJournalLine.Insert;

//                                                 LineNo := LineNo + 10000;

//                                                 GenJournalLine.Init;
//                                                 GenJournalLine."Journal Template Name" := Jtemplate;
//                                                 GenJournalLine."Journal Batch Name" := JBatch;
//                                                 GenJournalLine."Line No." := LineNo;
//                                                 GenJournalLine."Document No." := "Document No.";
//                                                 GenJournalLine."Account Type" := GenJournalLine."Account Type"::Employee;
//                                                 GenJournalLine."Account No." := AccountNo;
//                                                 GenJournalLine."External Document No." := DelegatePaymentLine."Tariff Code";
//                                                 GenJournalLine.Validate(GenJournalLine."Account No.");
//                                                 GenJournalLine."Posting Date" := "Posting Date";
//                                                 GenJournalLine.Description := PadStr(Format(DelegatePaymentLine."Delegate Name") + '-' + 'Excise Duty Charges', 50);
//                                                 GenJournalLine.Amount := ChargeAmount * (GenSetup."Excise Duty (%)" / 100);
//                                                 GenJournalLine.Validate(GenJournalLine.Amount);
//                                                 GenJournalLine."Bal. Account Type" := GenJournalLine."Bal. Account Type"::"G/L Account";
//                                                 GenJournalLine."Bal. Account No." := GenSetup."Excise Duty G/L";
//                                                 GenJournalLine.Validate(GenJournalLine."Bal. Account No.");
//                                                 GenJournalLine."Shortcut Dimension 1 Code" := Dim1;//Deleg"Global Dimension 1 Code";
//                                                 GenJournalLine."Shortcut Dimension 2 Code" := Dim2;//DelegatePaymentLine."Global Dimension 2 Code";
//                                                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 1 Code");
//                                                 GenJournalLine.Validate(GenJournalLine."Shortcut Dimension 2 Code");
//                                                 if GenJournalLine.Amount <> 0 then
//                                                     GenJournalLine.Insert;
//                                                 //  END;
//                                             end;




//                                         end;
//                                         Interest := 0;
//                                         Principle := 0;
//                                         Loans.Reset;
//                                         Loans.SetRange(Loans."Member No.", Members."No.");
//                                         Loans.SetRange(Loans."Recovery Mode", Loans."Recovery Mode"::"D Allowance");
//                                         Loans.SetCurrentKey("Recovery Priority");
//                                         if Loans.Find('-') then begin
//                                             repeat
//                                                 ProdType.Get(Loans."Loan Product Type");
//                                                 Loans.CalcFields("Outstanding Balance", "Outstanding Bills", "Outstanding Interest");
//                                                 DelegatePaymentLines.Reset;
//                                                 DelegatePaymentLines.SetRange(Code, Code);
//                                                 DelegatePaymentLines.SetRange(Posted, false);
//                                                 DelegatePaymentLines.SetRange(DelegatePaymentLines."Delegate MNO.", Loans."Member No.");
//                                                 DelegatePaymentLines.CalcSums(DelegatePaymentLines."Amount Payable");
//                                                 Amt := DelegatePaymentLines."Amount Payable";
//                                                 RunBal := DelegatePaymentLines."Amount Payable";
//                                                 //**************

//                                                 //Interest recovery
//                                                 if Loans."Outstanding Interest" > 0 then begin
//                                                     Interest := Loans."Outstanding Interest";
//                                                     //MESSAGE('Interest %1',Interest);
//                                                     //Pass to savings Account
//                                                     AccNo := Loans."Loan Account";
//                                                     AccType := AccType::Credit;
//                                                     BalAccType := BalAccType::"G/L Account";
//                                                     TransTypes := TransTypes::"Interest Paid";
//                                                     BalAccNo := '';
//                                                     LineNo := LineNo + 10000;
//                                                     Descr := PadStr(Format('Interest paid') + '-' + "Payment Description" + '-' + Loans."Loan No.", 50);//ProdFac."Product Description"+' '+'Loan';
//                                                     Descr := CopyStr(Descr, 1, 50);
//                                                     if Amt > Interest then
//                                                         Amt := Interest;
//                                                     JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, "Document No.", Descr, Amt * -1, AccNo,
//                                                     Today, BalAccType, BalAccNo, '', Dim1, Dim2, TransTypes, Loans."Loan No.", '', '', 0, '', 0);
//                                                     RunBal := RunBal - (Abs(Amt));
//                                                     //Pass to savings Account
//                                                     AccNo := AccountNo;
//                                                     AccType := AccType::Savings;
//                                                     BalAccType := BalAccType::"G/L Account";
//                                                     BalAccNo := '';
//                                                     BalAccType := BalAccType::"G/L Account";
//                                                     LineNo := LineNo + 10000;
//                                                     Descr := '';
//                                                     Descr := PadStr(Format('Interest paid') + '-' + "Payment Description" + '-' + Loans."Loan No.", 50);//ProdFac."Product Description"+' '+'Loan';
//                                                     Descr := CopyStr(Descr, 1, 50);
//                                                     JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, "Document No.", Descr, Amt, AccNo,
//                                                     Today, BalAccType, BalAccNo, '', Dim1, Dim2, TransTypes, '', '', '', 0, '', 0);
//                                                 end;

//                                                 //Principle recovery
//                                                 if Loans."Outstanding Bills" > 0 then begin
//                                                     Principle := Loans."Outstanding Bills";
//                                                     //Pass to savings Account
//                                                     AccNo := Loans."Loan Account";
//                                                     AccType := AccType::Credit;
//                                                     BalAccType := BalAccType::"G/L Account";
//                                                     TransTypes := TransTypes::Repayment;
//                                                     BalAccNo := '';
//                                                     LineNo := LineNo + 10000;
//                                                     Descr := PadStr(Format('Repayment') + '-' + "Payment Description" + '-' + Loans."Loan No.", 50);//ProdFac."Product Description"+' '+'Loan';
//                                                     Descr := CopyStr(Descr, 1, 50);
//                                                     if RunBal > Principle then
//                                                         Amt := Principle else
//                                                         Amt := RunBal;
//                                                     JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, "Document No.", Descr, Amt * -1, AccNo,
//                                                     Today, BalAccType, BalAccNo, '', Dim1, Dim2, TransTypes, Loans."Loan No.", '', '', 0, '', 0);

//                                                     //Pass to savings Account
//                                                     AccNo := AccountNo;
//                                                     AccType := AccType::Savings;
//                                                     BalAccType := BalAccType::"G/L Account";
//                                                     BalAccNo := '';
//                                                     LineNo := LineNo + 10000;
//                                                     Descr := '';
//                                                     Descr := PadStr(Format('Repayment') + '-' + "Payment Description" + '-' + Loans."Loan No.", 50);//ProdFac."Product Description"+' '+'Loan';
//                                                     Descr := CopyStr(Descr, 1, 50);
//                                                     JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, "Document No.", Descr, Amt, AccNo,
//                                                     Today, BalAccType, BalAccNo, '', Dim1, Dim2, TransTypes, '', '', '', 0, '', 0);
//                                                 end;

//                                                 //pass Bills
//                                                 AccNo := Loans."Loan Account";
//                                                 AccType := AccType::Credit;
//                                                 BalAccType := BalAccType::"G/L Account";
//                                                 TransTypes := TransTypes::Bills;
//                                                 BalAccNo := ProdType."Billed Account";
//                                                 LineNo := LineNo + 10000;
//                                                 Descr := PadStr(Format('Repayment') + '-' + "Payment Description" + '-' + Loans."Loan No.", 50);//ProdFac."Product Description"+' '+'Loan';
//                                                 Descr := CopyStr(Descr, 1, 50);
//                                                 if RunBal > Principle then
//                                                     Amt := Principle else
//                                                     Amt := RunBal;
//                                                 JournalPosting.PostJournal(Jtemplate, JBatch, LineNo, AccType, "Document No.", Descr, Amt * -1, AccNo,
//                                                 Today, BalAccType, BalAccNo, '', Dim1, Dim2, TransTypes, Loans."Loan No.", '', '', 0, '', 0);
//                                             until Loans.Next = 0;
//                                         end;
//                                     end else
//                                         Error('Account Not Found for %1', DelegatePaymentLine."Delegate MNO.");
//                                     //Post
//                                     GenJournalLine.Reset;
//                                     GenJournalLine.SetRange("Journal Template Name", Jtemplate);
//                                     GenJournalLine.SetRange("Journal Batch Name", JBatch);
//                                     if GenJournalLine.Find('-') then begin
//                                         CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post New", GenJournalLine);
//                                     end;
//                                     //Post
//                                     DelegatePaymentLine.Posted := true;
//                                     DelegatePaymentLine."Posting Date" := Today;
//                                     DelegatePaymentLine.Modify;
//                                     Commit;
//                                 end;

//                                 //SMS---
//                                 SavingsAccounts.Reset;
//                                 SavingsAccounts.SetRange("Member No.", Members."No.");
//                                 SavingsAccounts.SetRange("Loan Disbursement Account", true);
//                                 if SavingsAccounts.Find('-') then begin
//                                     CompInfo.Get;
//                                     SendSms.SendSms(SourceType::"Salary Processing", SavingsAccounts."Transactional Mobile No", 'Dear member, your Delegate Allowance has been credited to your FOSA A/C. Withdraw via Harambee Mcash *357# or use ATM'
//                                     + '. Harambee SACCO.For Help:' + ' ' + CompInfo."Phone No.", '', SavingsAccounts."No.", false);
//                                 end;
//                             //SMS---

//                             until DelegatePaymentLine.Next = 0;
//                             //DelegatePaymentLine.Posted:=TRUE;
//                             //DelegatePaymentLine."Posting Date":=TODAY;
//                             //DelegatePaymentLine.MODIFYALL;
//                             //COMMIT;
//                         end;
//                         /*
//                         //Post
//                         GenJournalLine.RESET;
//                         GenJournalLine.SETRANGE("Journal Template Name",Jtemplate);
//                         GenJournalLine.SETRANGE("Journal Batch Name",JBatch);
//                         IF GenJournalLine.FIND('-') THEN BEGIN
//                         CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post New",GenJournalLine);
//                         END;
//                         //Post
//                         */

//                         //DIVSMS
//                         DPay.Reset;
//                         DPay.SetRange(Code, DelegatePaymentLine.Code);
//                         if DPay.Find('-') then
//                             DPay.CalcFields("Total Payment");
//                         /*SavingsAccounts.RESET;
//                         SavingsAccounts.SETRANGE("Member No.",Members."No.");
//                         SavingsAccounts.SETRANGE("Loan Disbursement Account",TRUE);
//                         IF SavingsAccounts.FIND('-') THEN BEGIN
//                           CompInfo.GET;
//                            SendSms.SendSms(SourceType::"Salary Processing",SavingsAccounts."Transactional Mobile No",'Dear member, your Delegate Allowance has been credited to your FOSA A/C. Withdraw via M-Sacco *346# or ATM'
//                            +'. Harambee SACCO.For Help:'+' '+CompInfo."Phone No.",'',SavingsAccounts."No.",FALSE);
//                        END;
//                        */

//                         //if DelegatesMinutesHeader.Get("Minute No.") then begin
//                             if DelegatesMinutesHeader.Type <> DelegatesMinutesHeader.Type::ADM then begin
//                                 DelegatesMinutesHeader.Posted := true;
//                                 DelegatesMinutesHeader."Posted By" := UserId;
//                                 DelegatesMinutesHeader."Posted Date" := CurrentDateTime;
//                                 DelegatesMinutesHeader.Modify;
//                             end;
//                         //end;
//                         // Posted := true;
//                         // "Posted By" := UserId;
//                         // "Posting Date" := Today;
//                         // "Date Posted" := Today;
//                         // Modify;
//                         Message('Posted Successfully');

//                     end;
//                 }
//                 action("Payment Slip")
//                 {
//                     Image = Receipt;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         DPay.Reset;
//                         //DPay.SetRange(Code, Code);
//                         //if DPay.Find('-') then
//                         //REPORT.Run(52185919, true, true, DPay);
//                     end;
//                 }
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     begin
//         UpdateControls;
//         SetControlAppearance;
//     end;

//     trigger OnOpenPage()
//     begin
//         UpdateControls;
//         SetControlAppearance;
//     end;

//     var
//         DPay: Record "Delegates Payment";
//         "NOT OpenApprovalEntriesExist": Boolean;
//         OpenApprovalEntriesExistForCurrUser: Boolean;
//         OpenApprovalEntriesExist: Boolean;
//         VarVariant: Variant;
//         HasLines: Boolean;
//         PageEditable: Boolean;
//         DelegateMembersRetirementss: Record "Delegate Members Retirementss";
//         DelegateMemberss: Record "Delegate Memberss";
//         SaccoTransactions: Codeunit "Sacco Transactions";
//         Temp: Record "Banking User Template";
//         Jtemplate: Code[30];
//         JBatch: Code[30];
//         UserSetup: Record "User Setup";
//         DBranch: Code[20];
//         DelegatePaymentLine: Record "Delegate Payment Line";
//         DelegatePaymentLines: Record "Delegate Payment Line";
//         DActivity: Code[20];
//         Tillno: Code[20];
//         CmemberNo: Code[20];
//         Excess: Code[20];
//         Shortage: Code[20];
//         Text0001: Label 'Ensure the Cashier Journal Template is set up in Banking User Setup';
//         Text0002: Label 'Ensure the Cashier Journal Batch is set up in Banking User Setup';
//         GenSetup: Record "General Set-Up";
//         Acc: Record "Savings Accounts";
//         DelegatesTariff: Record "Delegates Tariff";
//         BankSetup: Record "Banking User Template";
//         BankAccount: Record "Bank Account";
//         CurrentTellerAmount: Decimal;
//         GenJournalLine: Record "Gen. Journal Line";
//         LineNo: Integer;
//         TCharges: Decimal;
//         TransactionCharges: Record "Transaction Charges";
//         ChargeAmount: Decimal;
//         TariffDetails: Record "Tiered Charges Lines";
//         TChargeAmount: Decimal;
//         Account: Record "Savings Accounts";
//         AccountTypes: Record "Product Factory";
//         ProdType: Record "Product Factory";
//         TransType: Record "Transaction Types";
//         Employer: Record Customer;
//         AccountNo: Code[20];
//         Members: Record Members;
//         JournalPosting: Codeunit "Journal Posting";
//         AcctNo: Code[20];
//         AccNo: Code[20];
//         AccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
//         BalAccType: Option "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Savings,Credit;
//         BalAccNo: Code[20];
//         Amt: Decimal;
//         Descr: Text;
//         TransTypes: Option " ",Loan,Repayment,"Interest Due","Interest Paid",Bills,Appraisal;
//         Loans: Record Loans;
//         Interest: Decimal;
//         Principle: Decimal;
//         RunBal: Decimal;
//         Err0001: Label 'Amount must be equal to Total pay';
//         Dim1: Code[20];
//         Dim2: Code[20];
//         DelegatesMinutesHeader: Record "Delegates Minutes Header";
//         CompInfo: Record "Company Information";
//         SendSms: Codeunit SendSms;
//         SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes","Cashier Below Limit","Cashier Above Limit","Chq Book",Internetbanking,CRM;
//         SavingsAccounts: Record "Savings Accounts";

//     //[Scope('Internal')]
//     procedure LinesExists(): Boolean
//     var
//         PayLines: Record "Delegate Members Retirementss";
//     begin
//         HasLines := false;
//         DelegatePaymentLine.Reset;
//         DelegatePaymentLine.SetRange(DelegatePaymentLine.Code, Code);
//         if DelegatePaymentLine.Find('-') then begin
//             HasLines := true;
//             exit(HasLines);
//         end;
//     end;

//     //[Scope('Internal')]
//     procedure UpdateControls()
//     var
//         DelegatePaymentLine: Record "Delegate Payment Line";
//     begin
//         // if (Status <> Status::Open) or (Posted = true) then
//         //     PageEditable := false else
//             PageEditable := true;

//         DelegatePaymentLines.Reset;
//         //DelegatePaymentLines.SetRange(Code, Code);
//         DelegatePaymentLines.SetRange("Amount Payable", 0);
//         if DelegatePaymentLines.Find('-') then
//             DelegatePaymentLines.DeleteAll;
//     end;

//     local procedure SetControlAppearance()
//     var
//         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//     begin
//         //OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
//         //OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
//     end;
// }

