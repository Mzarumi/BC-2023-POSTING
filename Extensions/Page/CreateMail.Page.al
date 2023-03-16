// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 5148 "Create Mail"
// {
//     Caption = 'Create Mail';
//     DataCaptionExpression = Caption;
//     DeleteAllowed = false;
//     InsertAllowed = false;
//     LinksAllowed = false;
//     PageType = NavigatePage;
//     SourceTable = "Segment Line";

//     layout
//     {
//         area(content)
//         {
//             group(Step1)
//             {
//                 Caption = 'Step 1';
//                 InstructionalText = 'This wizard helps you to create e-mails. Mails are recorded as interaction log entries.';
//                 Visible = Step1Visible;
//                 field(ContactName;Cont.Name)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Mail to Contact Name:';
//                     Editable = ContactNameEditable;
//                 }
//                 field("Contact Via";Rec."Contact Via")
//                 {
//                     ApplicationArea = Basic;
//                     AssistEdit = true;
//                     Caption = 'What is their e-mail address?';

//                     trigger OnAssistEdit()
//                     var
//                         ContactVia: Text[80];
//                     begin
//                         Clear(Mail);
//                         ContactVia := Mail.CollectAddresses(Cont."No.",ContactThrough,true);
//                         if ContactVia <> '' then
//                           Rec."Contact Via" := ContactVia;
//                     end;
//                 }
//                 field(Subject;Rec.Subject)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'What is the subject of the mail?';
//                 }
//                 field("Salesperson Code";Rec."Salesperson Code")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Who is the salesperson responsible?';
//                 }
//                 field("Mail Contact";Rec."Mail Contact")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Mail contact on Next.';
//                 }
//             }
//             group(Step2)
//             {
//                 Caption = 'Step 2';
//                 InstructionalText = 'You can now record optional information about the e-mail.';
//                 Visible = Step2Visible;
//                 field("Initiated By";Rec."Initiated By")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Cost (LCY)";Rec."Cost (LCY)")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'What was the cost of the e-mail (LCY)?';
//                 }
//                 field("Duration (Min.)";Rec."Duration (Min.)")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'How long did it take to write the e-mail?';
//                 }
//                 field(Evaluation;Rec.Evaluation)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'What is your evaluation of the mail?';
//                 }
//                 field("Campaign No.";Rec."Campaign No.")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'What is the number of the campaign the e-mail is linked to?';
//                     Editable = "Campaign No.Editable";
//                 }
//                 field("Opportunity Description";Rec."Opportunity Description")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'What is the opportunity?';
//                     Editable = OpportunityDescriptionEditable;
//                     Lookup = false;
//                     TableRelation = Opportunity;

//                     trigger OnAssistEdit()
//                     begin
//                         if Opp.Get(Rec."Opportunity No.") then ;
//                         if Page.RunModal(0,Opp) = Action::LookupOK then begin
//                           Rec.Validate(Rec."Opportunity No.",Opp."No.");
//                           Rec."Opportunity Description" := Opp.Description;
//                         end;
//                     end;
//                 }
//                 field("Interaction Successful";Rec."Interaction Successful")
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'The e-mail attempt was successful.';
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action(Back)
//             {
//                 ApplicationArea = Basic;
//                 Caption = '&Back';
//                 Enabled = BackEnable;
//                 Image = PreviousRecord;
//                 InFooterBar = true;

//                 trigger OnAction()
//                 begin
//                     ShowStep(false);
//                     PerformPrevWizardStatus3;
//                     CurrPage.Update(true);
//                     ShowStep(true);
//                 end;
//             }
//             action(Next)
//             {
//                 ApplicationArea = Basic;
//                 Caption = '&Next';
//                 Enabled = NextEnable;
//                 Image = NextRecord;
//                 InFooterBar = true;

//                 trigger OnAction()
//                 begin
//                     CheckStatus3;
//                     ShowStep(false);
//                     PerformNextWizardStatus3;
//                     ShowStep(true);
//                     CurrPage.Update(true);
//                     PerformPostStep3
//                 end;
//             }
//             action(Finish)
//             {
//                 ApplicationArea = Basic;
//                 Caption = '&Finish';
//                 Enabled = FinishEnable;
//                 Image = Approve;
//                 InFooterBar = true;

//                 trigger OnAction()
//                 begin
//                     CheckStatus3;
//                     FinishWizard3;
//                     CurrPage.Close;
//                 end;
//             }
//         }
//     }

//     trigger OnInit()
//     begin
//         NextEnable := true;
//         "Campaign No.Editable" := true;
//         ContactNameEditable := true;
//         OpportunityDescriptionEditable := true;
//     end;

//     trigger OnOpenPage()
//     begin
//         FormWidth := CancelXPos + CancelWidth + 220;
//         FrmXPos := ROUND((FrmWidth - FormWidth) / 2,1) + FrmXPos;
//         FrmYPos := 3000;
//         FrmHeight := CancelYPos + CancelHeight + 220;
//         FrmWidth := FormWidth;

//         OpportunityDescriptionEditable := false;

//         Cont.Get(Rec."Contact No.");
//         ContactNameEditable := false;
//         if Campaign.Get(Rec.GetFilter(Rec."Campaign No.")) then
//           "Campaign No.Editable" := false;

//         Rec."Interaction Successful" := true;

//         Rec."Mail Contact" := true;
//         ShowStep(true);
//     end;

//     var
//         Text001: label 'untitled';
//         Cont: Record Contact;
//         Campaign: Record Campaign;
//         Opp: Record Opportunity;
//         ContactThrough: Record "Communication Method" temporary;
//         Mail: Codeunit Mail;
//         FormWidth: Integer;
//         [InDataSet]
//         OpportunityDescriptionEditable: Boolean;
//         [InDataSet]
//         ContactNameEditable: Boolean;
//         [InDataSet]
//         "Campaign No.Editable": Boolean;
//         CancelXPos: Integer;
//         CancelYPos: Integer;
//         CancelHeight: Integer;
//         CancelWidth: Integer;
//         FrmXPos: Integer;
//         FrmYPos: Integer;
//         FrmHeight: Integer;
//         FrmWidth: Integer;
//         [InDataSet]
//         Step1Visible: Boolean;
//         [InDataSet]
//         Step2Visible: Boolean;
//         [InDataSet]
//         FinishEnable: Boolean;
//         [InDataSet]
//         BackEnable: Boolean;
//         [InDataSet]
//         NextEnable: Boolean;

//     local procedure ShowStep(Visible: Boolean)
//     begin
//         case Rec."Wizard Step" of
//           Rec."wizard step"::"1":
//             begin
//               Step1Visible := Visible;
//               if Visible then begin
//                 FinishEnable := false;
//                 BackEnable := false;
//                 NextEnable := true;
//               end;
//             end;
//           Rec."wizard step"::"2":
//             begin
//               Step2Visible := Visible;
//               if Visible then begin
//                 FinishEnable := true;
//                 BackEnable := true;
//                 NextEnable := false;
//               end;
//             end;
//         end;
//     end;

//     local procedure Caption(): Text[260]
//     var
//         CaptionStr: Text[260];
//     begin
//         if Cont.Get(Rec.GetFilter(Rec."Contact Company No.")) then
//           CaptionStr := CopyStr(Cont."No." + ' ' + Cont.Name,1,MaxStrLen(CaptionStr));
//         if Cont.Get(Rec.GetFilter(Rec."Contact No.")) then
//           CaptionStr := CopyStr(CaptionStr + ' ' + Cont."No." + ' ' + Cont.Name,1,MaxStrLen(CaptionStr));
//         if CaptionStr = '' then
//           CaptionStr := Text001;

//         exit(CaptionStr);
//     end;
// }
