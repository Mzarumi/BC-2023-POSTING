// page 52186390 "Deleage AGM Update Header"
// {
//     DeleteAllowed = false;
//     PageType = Card;
//     SourceTable = "Delegate AGM Update Header";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("No."; Rec."No.")
//                 {
//                 }
//                 field("AGM Year"; Rec."AGM Year")
//                 {
//                 }
//                 field("Update Type"; Rec."Update Type")
//                 {
//                 }
//                 field(Remarks; Rec.Remarks)
//                 {
//                 }
//                 field(Status; Rec.Status)
//                 {
//                 }
//                 field(Updated; Rec.Updated)
//                 {
//                 }
//                 field("Created By"; Rec."Created By")
//                 {
//                 }
//                 field("Creation Date"; Rec."Creation Date")
//                 {
//                 }
//             }
//             part(Control6; "Delegate Retire Lines")
//             {
//                 SubPageLink = "No." = FIELD("No.");
//                 Visible = "Update Type" = "Update Type"::Retire;
//             }
//             part(Control7; "Delegate Appoint  Lines")
//             {
//                 SubPageLink = "No." = FIELD("No.");
//                 Visible = "Update Type" = "Update Type"::Appoint;
//             }
//         }
//     }

//     actions
//     {
//         area(creation)
//         {
//             action("Retire Deleagtes")
//             {
//                 Image = BOMLedger;
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 PromotedIsBig = true;
//                 Visible = "Update Type" = "Update Type"::Retire;

//                 trigger OnAction()
//                 begin
//                     TestField(Status, Status::Approved);
//                     TestField(Updated, false);
//                     DelegateRetireUpdate.Reset;
//                     DelegateRetireUpdate.SetRange("No.", Rec."No.");
//                     if DelegateRetireUpdate.Find('-') then begin
//                         repeat
//                             DelegateMemberss.Reset;
//                             DelegateMemberss.SetRange("Delegate MNO.", DelegateRetireUpdate."Delegate MNO.");
//                             DelegateMemberss.SetRange(Code, DelegateRetireUpdate.Code);
//                             if DelegateMemberss.Find('-') then begin
//                                 DelegateRetireUpdate.Tracker(DelegateMemberss);
//                             end;
//                         until DelegateRetireUpdate.Next = 0;
//                     end;
//                 end;
//             }
//             action("Import Retired Delegate")
//             {
//                 Image = Import;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 ////RunObject = XMLport "Import Retired Delegated";
//                 Visible = "Update Type" = "Update Type"::Retire;
//             }
//             action("Update New Deleagtes")
//             {
//                 Image = BOMLedger;
//                 Promoted = true;
//                 PromotedCategory = "Report";
//                 PromotedIsBig = true;
//                 Visible = "Update Type" = "Update Type"::Appoint;

//                 trigger OnAction()
//                 begin
//                     TestField(Status, Status::Approved);
//                     TestField(Updated, false);
//                     DelegateAppointUpdate.Reset;
//                     DelegateAppointUpdate.SetRange("No.", Rec."No.");
//                     if DelegateAppointUpdate.Find('-') then begin
//                         repeat
//                             DelegateMemberss.Reset;
//                             Eno := DelegateMemberss.Count;
//                             DelegateMemberss.SetRange("Delegate MNO.", DelegateAppointUpdate."Delegate MNO.");
//                             DelegateMemberss.SetRange(Retired, false);
//                             if not DelegateMemberss.Find('-') then begin
//                                 //DelegateAppointUpdate.Tracker(DelegateMemberss);
//                                 Eno += 1;
//                                 DelegateMemberss.Init;
//                                 DelegateMemberss.Code := DelegateAppointUpdate.Code;
//                                 DelegateMemberss."Entry No" := Eno;
//                                 DelegateMemberss."Delegate MNO." := DelegateAppointUpdate."Delegate MNO.";
//                                 DelegateMemberss."Delegate Name" := DelegateAppointUpdate."Delegate Name";
//                                 DelegateMemberss."Job Tittle" := DelegateAppointUpdate."Job Tittle";
//                                 DelegateMemberss.Position := DelegateAppointUpdate.Position;
//                                 DelegateMemberss."Appointment Date" := DelegateAppointUpdate."Appointment Date";
//                                 DelegateMemberss."Registered By" := UserId;
//                                 DelegateMemberss."ID No." := DelegateAppointUpdate."ID No.";
//                                 DelegateMemberss.Insert;
//                             end;

//                         until DelegateAppointUpdate.Next = 0;
//                         Updated := true;
//                         Modify;
//                     end;
//                 end;
//             }
//             action("Import New Delegate")
//             {
//                 Image = Import;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 ////RunObject = XMLport "Import New Delegated";
//                 Visible = "Update Type" = "Update Type"::Appoint;
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

//                     trigger OnAction()
//                     var
//                         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                         CustomApprovals: Codeunit "Custom Approvals Codeunit";
//                     begin
//                         TestField(Updated, false);
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

//                         ApprovalsMgmt.OpenApprovalEntriesPage(RecordId)
//                     end;
//                 }
//             }
//             group(Approval)
//             {
//                 Caption = 'Approval';
//             }
//         }
//     }

//     trigger OnOpenPage()
//     begin
//         // if Updated = true then CurrPage.Editable := false;
//         // if Status <> Status::Open then CurrPage.Editable := false;
//         SetControlAppearance;
//     end;

//     var
//         "NOT OpenApprovalEntriesExist": Boolean;
//         OpenApprovalEntriesExistForCurrUser: Boolean;
//         [InDataSet]
//         OpenApprovalEntriesExist: Boolean;
//         VarVariant: Variant;
//         DelegateRetireUpdate: Record "Delegate AGM Retire Update";
//         DelegateMemberss: Record "Delegate Memberss";
//         DelegateAppointUpdate: Record "Delegate AGM Appoint Update";
//         Eno: Integer;

//     local procedure SetControlAppearance()
//     var
//         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//     begin
//         OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
//         OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
//     end;
// }

