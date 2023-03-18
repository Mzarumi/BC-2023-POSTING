// page 52186334 "Delegate Change Cards"
// {
//     DeleteAllowed = false;
//     PageType = Card;
//     SourceTable = "Delegate Region Mem Retirement";

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
//                 }
//                 field("Delegate Region Description"; Rec."Delegate Region Description")
//                 {
//                 }
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
//                 field(County; Rec.County)
//                 {
//                 }
//                 field("County Name"; Rec."County Name")
//                 {
//                 }
//                 field("Sub-County"; Rec."Sub-County")
//                 {
//                 }
//                 field("Sub-County Name"; Rec."Sub-County Name")
//                 {
//                 }
//                 field("Reason for retirement"; Rec."Reason for retirement")
//                 {
//                 }
//                 field(Status; Rec.Status)
//                 {
//                 }
//                 field("Created By"; Rec."Created By")
//                 {
//                 }
//                 field("Creation Date"; Rec."Creation Date")
//                 {
//                 }
//                 field("Delegates Retired"; Rec."Delegates Retired")
//                 {
//                 }
//             }
//             part(Control11; "Delegate Retire Memberss")
//             {
//                 Editable = pageEditable;
//                 SubPageLink = Code = FIELD("Delegate Region");
//                 Visible = "Reason for retirement" <> "Reason for retirement"::Transfer;
//             }
//             part("Delegate Transfer"; "Delegate  Memberss Transfer")
//             {
//                 Editable = pageEditable;
//                 SubPageLink = Code = FIELD("Delegate Region");
//                 Visible = "Reason for retirement" = "Reason for retirement"::Transfer;
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
//                         TestField("Reason for retirement");
//                         Found := false;
//                         FoundDate := false;

//                         if not LinesExists then
//                             Error('There are no Lines created for this Document');
//                         if "Reason for retirement" <> "Reason for retirement"::Transfer then begin
//                             ChangeLine.Reset;
//                             ChangeLine.SetRange(Code, Rec."Delegate Region");
//                             if ChangeLine.Find('-') then begin
//                                 repeat
//                                     if Found = false then begin

//                                         if (ChangeLine.Retired = false) and (ChangeLine.Reinstate = false) then Found := true;//ERROR('Kindly Select Action on Lines');
//                                                                                                                               //MESSAGE('%1',Found);
//                                     end;
//                                     if FoundDate = false then begin
//                                         if (ChangeLine.Retired = true) and (ChangeLine."Retirement Date" = 0D) then FoundDate := true;

//                                         // ERROR('Specify Retirement Date');

//                                         if (ChangeLine.Reinstate = true) and (ChangeLine."Reinstatement Date" = 0D) then FoundDate := true;
//                                     end;
//                                 //THEN ERROR('Specify Reinstatement Date');
//                                 until ChangeLine.Next = 0;
//                             end;

//                             //IF Found=FALSE THEN
//                             //ERROR('Kindly Select Action on Lines');

//                             //IF FoundDate=FALSE THEN
//                             // ERROR('Specify Reinstatement Date');

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
//                         TestField(Effected, false);
//                         if not Confirm('Are you sure you want to reopen this document?') then
//                             exit;
//                         Status := Status::Open;
//                         Modify;
//                     end;
//                 }
//                 action("Cancel Document")
//                 {
//                     Image = Cancel;
//                     Promoted = true;
//                     PromotedCategory = Category4;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         Status := Status::Rejected;
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
//                 action("Register Delegates")
//                 {
//                     Image = Add;
//                     Promoted = true;
//                     PromotedCategory = Category8;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         TestField(Effected, false);
//                         TestField(Status, Status::Approved);
//                         ChangeLine.Reset;
//                         ChangeLine.SetRange(Code, Rec."Delegate Region");
//                         ChangeLine.SetRange(Appoint, true);
//                         ChangeLine.SetRange(Reinstate, false);
//                         ChangeLine.SetRange(Retired, false);
//                         if ChangeLine.Find('-') then begin
//                             if (ChangeLine."Appointment Date" = 0D) then Error('Appointment date Must be specified');

//                         end;




//                         if not Confirm('Are you sure you want to register the selected delegates?') then
//                             exit;
//                         DelegateMembersRetirementss.Reset;
//                         DelegateMembersRetirementss.SetRange(DelegateMembersRetirementss.Code, "Delegate Region");
//                         DelegateMembersRetirementss.SetRange(Retired, true);
//                         if DelegateMembersRetirementss.Find('-') then begin
//                             repeat
//                                 DelegateMemberss.Reset;
//                                 DelegateMemberss.SetRange(DelegateMemberss."Delegate MNO.", DelegateMembersRetirementss."Delegate MNO.");
//                                 //DelegateMemberss.SETRANGE("Entry No","Entry No");
//                                 DelegateMemberss.SetFilter(Retired, '=%1', false);
//                                 if DelegateMemberss.Find('-') then begin
//                                     repeat
//                                         DelegateMemberss."Retire Date" := Today;
//                                         DelegateMemberss."Reason for retirement" := "Reason for retirement";
//                                         DelegateMemberss.Retired := true;
//                                         DelegateMemberss."Retired By" := UserId;
//                                         DelegateMemberss."Appointment Date" := DelegateMembersRetirementss."Appointment Date";
//                                         DelegateMemberss.Modify;
//                                     until DelegateMemberss.Next = 0;
//                                 end;// ELSE
//                             until DelegateMembersRetirementss.Next = 0;
//                         end;


//                         DelegateMembersRetirement.Reset;
//                         DelegateMembersRetirement.SetRange(DelegateMembersRetirement.Code, "Delegate Region");
//                         DelegateMembersRetirement.SetRange(Retired, false);
//                         if DelegateMembersRetirement.Find('-') then begin
//                             repeat
//                                 DelegateMember.Reset;
//                                 DelegateMember.SetRange(DelegateMember."Delegate MNO.", DelegateMembersRetirement."Delegate MNO.");
//                                 DelegateMember.SetRange(DelegateMember.Retired, false);
//                                 if not DelegateMember.Find('-') then begin
//                                     repeat
//                                         DelegateMember.Init;
//                                         DelegateMember.Code := "Delegate Region";
//                                         DelegateMember."Delegate Name" := DelegateMembersRetirement."Delegate Name";
//                                         DelegateMember."Delegate MNO." := DelegateMembersRetirement."Delegate MNO.";
//                                         DelegateMember."Job Tittle" := DelegateMembersRetirement."Job Tittle";
//                                         DelegateMember.Position := DelegateMembersRetirement.Position;
//                                         DelegateMember."Service Period" := DelegateMembersRetirement."Service Period";
//                                         DelegateMember."Appointment Date" := DelegateMembersRetirement."Appointment Date";
//                                         DelegateMember.Status := DelegateMembersRetirement.Status;
//                                         DelegateMember.Insert;
//                                     until DelegateMember.Next = 0;
//                                 end;
//                             until DelegateMembersRetirement.Next = 0;
//                         end;
//                         "Delegates Retired" := true;
//                         Effected := true;
//                         Modify;
//                         Message('Delegates has been Registered');
//                     end;
//                 }
//                 action("Retire Delegates")
//                 {
//                     Image = Delete;
//                     Promoted = true;
//                     PromotedCategory = Category8;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         TestField(Effected, false);

//                         TestField(Status, Status::Approved);
//                         ChangeLine.Reset;
//                         ChangeLine.SetRange(Code, Rec."Delegate Region");
//                         if ChangeLine.Find('-') then begin
//                             if (ChangeLine.Retired = true) and (ChangeLine."Retirement Date" = 0D) then Error('Specify Retirement Date');
//                         end;





//                         if not Confirm('Are you sure you want to retire the selected delegates?') then
//                             exit;
//                         MemRetirement.Reset;
//                         MemRetirement.SetRange(Code, Rec.Code);
//                         MemRetirement.SetRange("Delegate Region", Rec."Delegate Region");
//                         if MemRetirement.Find('-') then begin
//                             DelegateMembersRetirementss.Reset;
//                             DelegateMembersRetirementss.SetRange(DelegateMembersRetirementss.Code, Rec."Delegate Region");
//                             DelegateMembersRetirementss.SetFilter(Retired, '=%1', true);
//                             if DelegateMembersRetirementss.Find('-') then begin
//                                 repeat
//                                     DelegateMemberss.Reset;
//                                     DelegateMemberss.SetRange(DelegateMemberss."Delegate MNO.", DelegateMembersRetirementss."Delegate MNO.");
//                                     //DelegateMemberss.SETRANGE("Entry No","Entry No");
//                                     DelegateMemberss.SetFilter(Retired, '=%1', false);
//                                     if DelegateMemberss.Find('-') then begin
//                                         repeat
//                                             // DelegateMemberss."Retire Date":=TODAY;
//                                             DelegateMemberss."Reason for retirement" := "Reason for retirement";
//                                             DelegateMemberss.Retired := true;
//                                             DelegateMemberss."Retired By" := UserId;
//                                             DelegateMemberss."Retirement Date" := DelegateMembersRetirementss."Retirement Date";
//                                             DelegateMemberss.Modify;
//                                         until DelegateMemberss.Next = 0;
//                                     end;// ELSE
//                                 until DelegateMembersRetirementss.Next = 0;
//                             end;

//                             DelegateMembersRetirement.Reset;
//                             DelegateMembersRetirement.SetRange(DelegateMembersRetirement.Code, "Delegate Region");
//                             DelegateMembersRetirement.SetRange(Retired, false);
//                             if DelegateMembersRetirement.Find('-') then begin
//                                 repeat
//                                     DelegateMember.Reset;
//                                     DelegateMember.SetRange(DelegateMember."Delegate MNO.", DelegateMembersRetirement."Delegate MNO.");
//                                     DelegateMember.SetRange(DelegateMember.Retired, false);
//                                     if not DelegateMember.Find('-') then begin
//                                         repeat
//                                             DelegateMember.Init;
//                                             DelegateMember.Code := "Delegate Region";
//                                             DelegateMember."Delegate Name" := DelegateMembersRetirement."Delegate Name";
//                                             DelegateMember."Delegate MNO." := DelegateMembersRetirement."Delegate MNO.";
//                                             DelegateMember."Job Tittle" := DelegateMembersRetirement."Job Tittle";
//                                             DelegateMember.Position := DelegateMembersRetirement.Position;
//                                             DelegateMember."Service Period" := DelegateMembersRetirement."Service Period";
//                                             DelegateMember."Appointment Date" := DelegateMembersRetirement."Appointment Date";
//                                             DelegateMember.Status := DelegateMembersRetirement.Status;
//                                             DelegateMember.Insert;
//                                         until DelegateMember.Next = 0;
//                                     end;
//                                 until DelegateMembersRetirement.Next = 0;
//                             end;
//                         end;
//                         "Delegates Retired" := true;
//                         Effected := true;
//                         Modify;
//                         Message('Delegate has been Retired');
//                     end;
//                 }
//                 action("Reinstate Delegate")
//                 {
//                     Image = AddContacts;
//                     Promoted = true;
//                     PromotedCategory = Category8;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         if (Effected = true) and ("Delegates Retired" = false) then begin
//                             "Delegates Retired" := true;
//                             Modify;
//                         end else
//                             TestField(Effected, false);
//                         TestField(Status, Status::Approved);

//                         ChangeLine.Reset;
//                         ChangeLine.SetRange(Code, Rec."Delegate Region");
//                         if ChangeLine.Find('-') then begin

//                             if (ChangeLine.Reinstate = true) and (ChangeLine."Reinstatement Date" = 0D) then Error('Specify Reinstatement Date');
//                         end;



//                         if not Confirm('Are you sure you want to Reinstate  the selected delegates?') then
//                             exit;

//                         DelegateMembersRetirement.Reset;
//                         DelegateMembersRetirement.SetRange(DelegateMembersRetirement.Code, "Delegate Region");
//                         DelegateMembersRetirement.SetRange(Reinstate, true);
//                         DelegateMembersRetirement.SetRange(Retired, false);
//                         if DelegateMembersRetirement.Find('-') then begin
//                             repeat
//                                 DelegateMember.Reset;
//                                 DelegateMember.SetRange(DelegateMember."Delegate MNO.", DelegateMembersRetirement."Delegate MNO.");
//                                 DelegateMember.SetRange(Retired, true);
//                                 if DelegateMember.Find('-') then begin
//                                     repeat
//                                         DelegateMember.Position := DelegateMembersRetirement.Position;
//                                         DelegateMember.Retired := DelegateMembersRetirement.Retired;
//                                         DelegateMember."Reinstatement Date" := DelegateMembersRetirement."Reinstatement Date";
//                                         DelegateMember.Modify;
//                                     until DelegateMember.Next = 0;
//                                 end;
//                             until DelegateMembersRetirement.Next = 0;
//                         end;

//                         Effected := true;
//                         "Delegates Retired" := true;
//                         Modify;
//                         Message('Delegates has been Reinstated');
//                     end;
//                 }
//                 action("Transfer Delegates")
//                 {
//                     Image = Add;
//                     Promoted = true;
//                     PromotedCategory = Category8;
//                     PromotedIsBig = true;

//                     trigger OnAction()
//                     begin
//                         TestField(Effected, false);
//                         TestField(Status, Status::Approved);
//                         ChangeLine.Reset;
//                         ChangeLine.SetRange(Code, Rec."Delegate Region");
//                         ChangeLine.SetRange(Reinstate, false);
//                         ChangeLine.SetRange(Retired, false);
//                         ChangeLine.SetRange(Transfer, true);
//                         if ChangeLine.Find('-') then begin
//                             if (ChangeLine."Tranfer Date" = 0D) then Error('Transfer date Must be specified');

//                         end;


//                         if not Confirm('Are you sure you want to retire the selected delegates?') then
//                             exit;
//                         MemRetirement.Reset;
//                         MemRetirement.SetRange(Code, Rec.Code);
//                         MemRetirement.SetRange("Delegate Region", Rec."Delegate Region");
//                         if MemRetirement.Find('-') then begin
//                             DelegateMembersRetirementss.Reset;
//                             DelegateMembersRetirementss.SetRange(DelegateMembersRetirementss.Code, Rec."Delegate Region");
//                             DelegateMembersRetirementss.SetFilter(Transfer, '=%1', true);
//                             if DelegateMembersRetirementss.Find('-') then begin
//                                 repeat
//                                     DelegateMemberss.Reset;
//                                     DelegateMemberss.SetRange(DelegateMemberss."Delegate MNO.", DelegateMembersRetirementss."Delegate MNO.");
//                                     DelegateMemberss.SetFilter(Retired, '=%1', false);
//                                     if DelegateMemberss.Find('-') then begin
//                                         repeat
//                                             DelegateMemberss."Reason for retirement" := "Reason for retirement";
//                                             DelegateMemberss.Retired := true;
//                                             DelegateMemberss."Retired By" := UserId;
//                                             DelegateMemberss."Retirement Date" := DelegateMembersRetirementss."Tranfer Date";
//                                             DelegateMemberss.Modify;
//                                         until DelegateMemberss.Next = 0;
//                                     end;// ELSE
//                                 until DelegateMembersRetirementss.Next = 0;
//                             end;

//                         end;
//                         "Delegates Retired" := true;
//                         Modify;
//                         //MESSAGE('Delegate has been Retired');
//                         if not Confirm('Are you sure you want to Transfer the selected delegates?') then
//                             exit;

//                         DelegateMembersRetirement.Reset;
//                         DelegateMembersRetirement.SetRange(Transfer, true);
//                         if DelegateMembersRetirement.Find('-') then begin
//                             repeat
//                                 DelegateMember.Reset;
//                                 DelegateMember.SetRange(DelegateMember."Delegate MNO.", DelegateMembersRetirement."Delegate MNO.");
//                                 DelegateMember.SetRange(DelegateMember.Retired, false);
//                                 if not DelegateMember.Find('-') then begin
//                                     repeat
//                                         DelegateMember.Init;
//                                         DelegateMember.Code := DelegateMembersRetirement."Tranfer To";
//                                         DelegateMember."Delegate Name" := DelegateMembersRetirement."Delegate Name";
//                                         DelegateMember."Delegate MNO." := DelegateMembersRetirement."Delegate MNO.";
//                                         DelegateMember."Appointment Date" := DelegateMembersRetirement."Tranfer Date";
//                                         DelegateMember."Job Tittle" := DelegateMembersRetirement."Job Tittle";
//                                         DelegateMember.Position := DelegateMembersRetirement."Transfer to Position";
//                                         DelegateMember.Status := DelegateMembersRetirement.Status;
//                                         DelegateMember.Insert;
//                                     until DelegateMember.Next = 0;
//                                 end;
//                             until DelegateMembersRetirement.Next = 0;
//                         end;
//                         Effected := true;
//                         "Delegates Retired" := true;
//                         Modify;
//                         Message('Delegates has been Registered');
//                     end;
//                 }
//             }
//         }
//     }

//     trigger OnAfterGetRecord()
//     begin
//         UpdateControls;
//     end;

//     trigger OnOpenPage()
//     begin
//         UpdateControls;
//     end;

//     var
//         "NOT OpenApprovalEntriesExist": Boolean;
//         OpenApprovalEntriesExistForCurrUser: Boolean;
//         OpenApprovalEntriesExist: Boolean;
//         VarVariant: Variant;
//         HasLines: Boolean;
//         PageEditable: Boolean;
//         DelegateMembersRetirementss: Record "Delegate Members Retirementss";
//         DelegateMemberss: Record "Delegate Memberss";
//         DelegateMembersRetirement: Record "Delegate Members Retirementss";
//         DelegateMember: Record "Delegate Memberss";
//         DelegateMembers: Record "Delegate Memberss";
//         MemRetirement: Record "Delegate Region Mem Retirement";
//         ChangeLine: Record "Delegate Members Retirementss";
//         Found: Boolean;
//         FoundDate: Boolean;

//     //[Scope('Internal')]
//     procedure LinesExists(): Boolean
//     var
//         PayLines: Record "Delegate Members Retirementss";
//     begin
//         HasLines := false;
//         PayLines.Reset;
//         //PayLines.SetRange(PayLines.Code, "Delegate Region");
//         if PayLines.Find('-') then begin
//             HasLines := true;
//             exit(HasLines);
//         end;
//         //TestField("Reason for retirement");
//     end;

//     //[Scope('Internal')]
//     procedure UpdateControls()
//     begin
//         // if Status <> Status::Open then
//         //     PageEditable := false else
//         //     PageEditable := true;
//     end;
// }

