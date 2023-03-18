// page 52185750 "EFT Transfer Header"
// {
//     DeleteAllowed = false;
//     PageType = Card;
//     PromotedActionCategories = 'New,Process,Reports,Approval,Standing order,Slalary ,Category7_caption,Category8_caption,Approvals,Category9_caption';
//     SourceTable = "EFT Transfer Header";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("No."; Rec."No.")
//                 {
//                 }
//                 field("Date Entered"; Rec."Date Entered")
//                 {
//                 }
//                 field("Document Type"; Rec."Document Type")
//                 {
//                     Editable = DocumentTypeEdit;
//                     ValuesAllowed = "Electronic Fund Transfer", RTGS;
//                 }
//                 field("Transaction Type"; Rec."Transaction Type")
//                 {
//                     Editable = TransactionTypeEdit;
//                 }
//                 field("Account Type"; Rec."Account Type")
//                 {
//                     Editable = AccountTypeEdit;
//                     ShowMandatory = true;
//                     ValuesAllowed = "Bank Account";
//                 }
//                 field("Account No."; Rec."Account No.")
//                 {
//                     Editable = AccountNoEdit;
//                     ShowMandatory = true;
//                 }
//                 field("Account Name"; Rec."Account Name")
//                 {
//                 }
//                 field("Start Date"; Rec."Start Date")
//                 {
//                     Editable = StartDateEdit;
//                 }
//                 field("End Date"; Rec."End Date")
//                 {
//                     Editable = EndDateEdit;
//                 }
//                 field(Remarks; Rec.Remarks)
//                 {
//                     Editable = RemarkEdit;
//                     ShowMandatory = true;
//                 }
//                 field("Record Total"; Rec."Record Total")
//                 {
//                 }
//                 field("Record Count"; Rec."Record Count")
//                 {
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     Editable = false;

//                     trigger OnValidate()
//                     begin
//                         getControl;
//                     end;
//                 }
//                 field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
//                 {
//                 }
//                 field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
//                 {
//                 }
//                 field("Responsibility Centre"; Rec."Responsibility Centre")
//                 {
//                 }
//                 field("Created By"; Rec."Created By")
//                 {
//                 }
//                 field("Date Transferred"; Rec."Date Transferred")
//                 {
//                 }
//             }
//             part(Control1; "EFT Transfer Lines")
//             {
//                 Editable = EFTLineEdit;
//                 SubPageLink = "Document No." = FIELD("No.");
//             }
//         }
//     }

//     actions
//     {
//         area(creation)
//         {
//             group("Process EFT")
//             {
//                 Caption = 'Process EFT';
//                 action("View Schedule")
//                 {
//                     Caption = 'View Schedule';
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";
//                 }
//                 action("Generete EFT File")
//                 {
//                     Caption = 'Generete Transfer File';
//                     Image = Sales;
//                     Promoted = true;
//                     PromotedCategory = Category5;

//                     trigger OnAction()
//                     var
//                         EFTDetails: Record "EFT Transfer Lines";
//                     begin
//                         TestField(Status, Status::Transferred);
//                         if not Confirm(EFTFileTxt) = true then exit;
//                         if (Status = Status::Approved) or (Status = Status::Transferred) then begin
//                             EFTDetails.Reset;
//                             EFTDetails.SetRange(EFTDetails."Document No.", "No.");
//                             if EFTDetails.Find('-') then begin
//                                 repeat
//                                     EFTDetails.TestField(EFTDetails."Account Type");
//                                     EFTDetails.TestField(EFTDetails.Amount);
//                                     EFTDetails.TestField(EFTDetails."External Account No.");
//                                     EFTDetails.TestField(EFTDetails."External Account Name");
//                                     EFTDetails.TestField(EFTDetails."Bank Code");
//                                     //EFTDetails.TESTFIELD(EFTDetails."Branch Code");

//                                     //For STIMA, replace staff No with stima
//                                     GeneralSetUp.Get;

//                                     if EFTDetails.Amount <> Round(EFTDetails.Amount, 1) then begin
//                                         if EFTDetails.Amount <> Round(EFTDetails.Amount, 0.1) then begin
//                                             EFTDetails.ExportFormat := DelChr(
//                                                                      PadStr('', 14 - StrLen(EFTDetails."External Account No."), ' ') + EFTDetails."External Account No." +
//                                                                      PadStr('', 5, ' ') +
//                                                                      PadStr('', 6 - StrLen((EFTDetails."Bank Code")), ' ') + (EFTDetails."Bank Code") + ' ' +
//                                                                      EFTDetails."External Account Name" + PadStr('', 30 - StrLen(EFTDetails."External Account Name"), ' ') +
//                                                                      PadStr('', 9 - StrLen(DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',')), ' ') +
//                                                                             DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',') +
//                                                                      PadStr('', 8 - StrLen(CopyStr(GeneralSetUp.Reference, 1, 8)), ' ') + GeneralSetUp.Reference
//                                                                      , '=', '"');
//                                         end else begin
//                                             EFTDetails.ExportFormat := DelChr(
//                                                                      PadStr('', 14 - StrLen(EFTDetails."External Account No."), ' ') + EFTDetails."External Account No." +
//                                                                      PadStr('', 5, ' ') +
//                                                                      PadStr('', 6 - StrLen((EFTDetails."Bank Code")), ' ') + (EFTDetails."Bank Code") + ' ' +
//                                                                      EFTDetails."External Account Name" + PadStr('', 30 - StrLen(EFTDetails."External Account Name"), ' ') +
//                                                                      PadStr('', 8 - StrLen(DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',')), ' ') +
//                                                                             DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',') + '0' +
//                                                                      PadStr('', 8 - StrLen(CopyStr(GeneralSetUp.Reference, 1, 8)), ' ') + GeneralSetUp.Reference
//                                                                      , '=', '"');
//                                         end;
//                                     end else begin
//                                         TextGen := Format(EFTDetails."Member No.");

//                                         EFTDetails.ExportFormat := DelChr(
//                                                                  PadStr('', 14 - StrLen(EFTDetails."External Account No."), ' ') + EFTDetails."External Account No." +
//                                                                  PadStr('', 5, ' ') +
//                                                                  PadStr('', 6 - StrLen((EFTDetails."Bank Code")), ' ') + (EFTDetails."Bank Code") + ' ' +
//                                                                  EFTDetails."External Account Name" + PadStr('', 30 - StrLen(EFTDetails."External Account Name"), ' ') +
//                                                                  PadStr('', 7 - StrLen(DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',')), ' ') +
//                                                                         DelChr(DelChr(Format(EFTDetails.Amount), '=', '.'), '=', ',') + '00' +
//                                                                  PadStr('', 8 - StrLen(CopyStr(GeneralSetUp.Reference, 1, 8)), ' ') + GeneralSetUp.Reference
//                                                                  , '=', '"');
//                                     end;
//                                     EFTDetails.Modify;
//                                 until EFTDetails.Next = 0;
//                             end;

//                         end;

//                         Commit;

//                         EFTDetails.Reset;
//                         EFTDetails.SetRange(EFTDetails."Document No.", "No.");
//                         if EFTDetails.Find('-') then
//                             XMLPORT.Run(52185620, true, false, EFTDetails);

//                         Message(SuccessfulGeneration);
//                     end;
//                 }
//                 action("Generate Salary EFT")
//                 {
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";

//                     trigger OnAction()
//                     begin

//                         if Status = Status::Transferred then
//                             Error('EFT Batch already transfered. Please use another one.');


//                         TestField("Transaction Type");

//                         EFTHeader.Reset;
//                         EFTHeader.SetRange(EFTHeader."No.", "No.");
//                         //if EFTHeader.Find('-') then
//                             //REPORT.Run(52185647, true, true, EFTHeader)
//                     end;
//                 }
//                 action("Generate Standing Order EFT")
//                 {
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";

//                     trigger OnAction()
//                     begin

//                         TestField("Transaction Type");

//                         if "Standing Order EFT Done" = true then
//                             Error('The get standing order eft process has already been run for this batch');

//                         EFTHeader.Reset;
//                         EFTHeader.SetRange(EFTHeader."No.", "No.");
//                         //if EFTHeader.Find('-') then
//                             //REPORT.Run(52185652, true, true, EFTHeader)
//                     end;
//                 }
//                 action("Multiple Account Report")
//                 {
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";

//                     trigger OnAction()
//                     begin
//                         EFTHeader.Reset;
//                         EFTHeader.SetRange(EFTHeader."No.", "No.");
//                         //if EFTHeader.Find('-') then
//                             //REPORT.Run(52185760, true, true, EFTHeader)
//                     end;
//                 }
//                 action("EFT Report")
//                 {
//                     Image = "Report";
//                     Promoted = true;
//                     PromotedCategory = "Report";

//                     trigger OnAction()
//                     begin
//                         EFTHeader.Reset;
//                         EFTHeader.SetRange(EFTHeader."No.", "No.");
//                         //if EFTHeader.Find('-') then
//                             //REPORT.Run(52185761, true, true, EFTHeader)
//                     end;
//                 }
//                 action(Post)
//                 {
//                     Caption = 'Post';
//                     Image = Post;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     Visible = TransferVisible;

//                     trigger OnAction()
//                     begin
//                         TestField(Status, Status::Approved);
//                         //here//eftProcessing.ElectronicFundsProcessing(Rec);
//                     end;
//                 }
//             }
//             group(Approval)
//             {
//                 Caption = 'Approval';
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
//                         TestField(Status, Status::Pending);
//                         ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
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
//                         TestField(Status, Status::Pending);
//                         ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
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
//                         TestField(Status, Status::Pending);
//                         ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
//                     end;
//                 }
//                 action(Comment)
//                 {
//                     Caption = 'Comments';
//                     Image = ViewComments;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     RunObject = Page "Approval Comments";
//                     Visible = OpenApprovalEntriesExistForCurrUser;
//                 }
//             }
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
//                     Visible = SendApprovalRequestVisible;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         TestField(Status, Status::Open);
//                         TestField("Document Type");
//                         TestField("Account No.");
//                         TestField(Remarks);

//                         ElectronicFundsL.Reset;
//                         ElectronicFundsL.SetRange(ElectronicFundsL."Document No.", "No.");
//                         if ElectronicFundsL.Find('-') then begin
//                             repeat
//                                 ElectronicFundsL.TestField(ElectronicFundsL."Account No.");
//                                 ElectronicFundsL.TestField(ElectronicFundsL."Account Name");
//                                 ElectronicFundsL.TestField(ElectronicFundsL.Amount);
//                                 ElectronicFundsL.TestField(ElectronicFundsL."Bank Code");
//                                 //ElectronicFundsL.TESTFIELD(ElectronicFundsL."Branch Code");
//                                 ElectronicFundsL.TestField(ElectronicFundsL."Bank Name");
//                             until ElectronicFundsL.Next = 0;
//                         end;



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
//                     Visible = CancelApprovalRequestVisible;

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         TestField(Status, Status::Pending);

//                         VarVariant := Rec;
//                         CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
//                     end;
//                 }
//                 action(Approvals)
//                 {
//                     Caption = 'Approvals';
//                     Image = Approvals;
//                     Promoted = true;
//                     PromotedCategory = Category9;

//                     trigger OnAction()
//                     var
//                         ApprovalEntries: Page "Approval Entries";
//                         approvalsMgmt: Codeunit "Approvals Mgmt.";
//                     begin
//                         approvalsMgmt.OpenApprovalEntriesPage(RecordId);
//                     end;
//                 }
//                 action("Reopen Document")
//                 {
//                     Image = ReOpen;
//                     Promoted = true;
//                     PromotedCategory = Category9;

//                     trigger OnAction()
//                     begin
//                         if Status = Status::Transferred then
//                             Error('This has already been Transferred hence cannot be opened');

//                         if not Confirm(ConfirmMSG) then
//                             exit;
//                         Status := Status::Open;
//                         Modify;
//                     end;
//                 }
//                 action(Approves)
//                 {
//                     Image = ReOpen;
//                     Promoted = true;
//                     PromotedCategory = Category9;

//                     trigger OnAction()
//                     begin
//                         Status := Status::Approved;
//                         Modify;
//                     end;
//                 }
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     begin
//         SetControlAppearance;
//         getControl;
//     end;

//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         "Account Type" := "Account Type"::"Bank Account";
//     end;

//     var
//         eftProcessing: Codeunit "Sacco Transactions";
//         DocumentTypeEdit: Boolean;
//         TransactionTypeEdit: Boolean;
//         AccountTypeEdit: Boolean;
//         AccountNoEdit: Boolean;
//         StartDateEdit: Boolean;
//         EndDateEdit: Boolean;
//         RemarkEdit: Boolean;
//         EFTLineEdit: Boolean;
//         VarVariant: Variant;
//         CustomApprovals: Codeunit "Custom Approvals Codeunit";
//         OpenApprovalEntriesExistForCurrUser: Boolean;
//         OpenApprovalEntriesExist: Boolean;
//         SendApprovalRequestVisible: Boolean;
//         CancelApprovalRequestVisible: Boolean;
//         GenerateStandingOrdtVisible: Boolean;
//         TransferVisible: Boolean;
//         SuccessfulGeneration: Label 'Successfully Generated';
//         GeneralSetUp: Record "General Set-Up";
//         TextGen: Text[250];
//         EFTHeader: Record "EFT Transfer Header";
//         EFTFileTxt: Label 'are you sure you want to generate EFT File ?';
//         ConfirmMSG: Label 'are you sure you want to set status of this document to open?';
//         ElectronicFundsL: Record "EFT Transfer Lines";

//     //[Scope('Internal')]
//     procedure SetControlAppearance()
//     var
//         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//     begin
//         OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
//         OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
//     end;

//     //[Scope('Internal')]
//     procedure getControl()
//     begin
//         if Status = Status::Transferred then begin
//             SendApprovalRequestVisible := false;
//             CancelApprovalRequestVisible := false;
//             GenerateStandingOrdtVisible := false;
//             TransferVisible := false;
//         end else begin
//             SendApprovalRequestVisible := true;
//             CancelApprovalRequestVisible := true;
//             GenerateStandingOrdtVisible := false;
//             TransferVisible := true;
//         end;

//         case Status of
//             Status::Open:
//                 begin
//                     DocumentTypeEdit := true;
//                     TransactionTypeEdit := true;
//                     AccountTypeEdit := true;
//                     AccountNoEdit := true;
//                     StartDateEdit := true;
//                     EndDateEdit := true;
//                     RemarkEdit := true;
//                     EFTLineEdit := true;
//                 end;

//             //Status::Pending, Status::Rejected, Status::Approved:
//                 begin
//                     DocumentTypeEdit := false;
//                     TransactionTypeEdit := false;
//                     AccountTypeEdit := false;
//                     AccountNoEdit := false;
//                     StartDateEdit := false;
//                     EndDateEdit := false;
//                     RemarkEdit := false;
//                     EFTLineEdit := false;
//                 end;
//         end;
//     end;
// }

