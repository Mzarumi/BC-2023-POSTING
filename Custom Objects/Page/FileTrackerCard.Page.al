// page 52186351 "File Tracker Card"
// {
//     DeleteAllowed = false;
//     InsertAllowed = false;
//     PageType = Card;
//     SourceTable = "File Tracker";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("Request Number"; Rec."Request Number")
//                 {
//                 }
//                 field("File Number"; Rec."File Number")
//                 {
//                     Caption = 'File/Member No.';
//                     Enabled = fieldeditable;

//                     trigger OnValidate()
//                     begin
//                         CurrPage.Update;
//                     end;
//                 }
//                 field("Member Name"; Rec."Member Name")
//                 {
//                 }
//                 field("Folio Number"; Rec."Folio Number")
//                 {
//                 }
//                 field("Action"; Rec.Action)
//                 {
//                     Editable = false;
//                 }
//                 field("Office Name"; Rec."Office Name")
//                 {
//                     Visible = false;
//                 }
//                 field(Overdue; Rec.Overdue)
//                 {
//                     Visible = false;
//                 }
//                 field("ID No."; Rec."ID No.")
//                 {
//                 }
//                 field("Loan No"; Rec."Loan No")
//                 {
//                     Visible = false;
//                 }
//                 field("Staff No"; Rec."Staff No")
//                 {
//                 }
//                 field("File Created By"; Rec."File Created By")
//                 {
//                 }
//                 field("File Creation Date"; Rec."File Creation Date")
//                 {
//                 }
//                 field("Member Status"; Rec."Member Status")
//                 {
//                 }
//                 field(Create; Rec.Create)
//                 {
//                 }
//                 field("File Issued"; Rec."File Issued")
//                 {
//                 }
//             }
//             group(Location)
//             {
//                 field("Move to"; Rec."Move to")
//                 {
//                     Editable = MVEditable;
//                 }
//                 field("Sent To"; Rec."Sent To")
//                 {
//                 }
//                 field("File Movement Remarks"; Rec."File Movement Remarks")
//                 {
//                     ShowMandatory = true;
//                 }
//                 field("File MVT User ID"; Rec."File MVT User ID")
//                 {
//                     Editable = false;
//                 }
//                 field("File MVT Time"; Rec."File MVT Time")
//                 {
//                     Editable = false;
//                 }
//                 field("Current File Location"; Rec."Current File Location")
//                 {
//                 }
//                 field("File MVT Date"; Rec."File MVT Date")
//                 {
//                     Editable = false;
//                 }
//                 field("File received date"; Rec."File received date")
//                 {
//                     Editable = false;
//                 }
//                 field("File received Time"; Rec."File received Time")
//                 {
//                     Editable = false;
//                 }
//                 field("File Received by"; Rec."File Received by")
//                 {
//                     Editable = false;
//                 }
//                 field("File Received"; Rec."File Received")
//                 {
//                     Editable = false;
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     Editable = false;
//                 }
//                 field(Narration; Rec.Narration)
//                 {
//                 }
//                 field("File Recalled"; Rec."File Recalled")
//                 {
//                     Editable = false;
//                     Visible = false;
//                 }
//                 field("Other  Doc  No"; Rec."Other  Doc  No")
//                 {
//                 }
//                 field("File  Forwarded"; Rec."File  Forwarded")
//                 {
//                     Editable = false;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             action("Issues Files")
//             {
//                 Caption = 'Issue File';
//                 Promoted = true;
//                 PromotedCategory = Process;

//                 trigger OnAction()
//                 begin
//                     if Create = false then Error(ErrorFileNotCreated);
//                     if "File Issued" = true then Error(AlreadyIssued);


//                     UserStations.Reset;
//                     UserStations.SetRange(UserStations."User Id", UserId);
//                     if UserStations.Find('-') then
//                         if UserStations."Can Issue" = false then
//                             Error(OnlyUsersError);

//                     TestField("Sent To");
//                     TestField("Folio Number");
//                     TestField(Narration);
//                     TestField("File Movement Remarks");

//                     //MESSAGE(SureIssue,Rec."Member Name");
//                     if Confirm(SureIssue) = true then begin
//                         "File MVT User ID" := UserId;
//                         "File MVT Time" := Time;
//                         "File MVT Date" := Today;
//                         Action := Action::Issued;
//                         "File Issued" := true;
//                     end;


//                     //get the location of the issurer
//                     UserStations.Reset;
//                     UserStations.SetRange(UserStations."User Id", "File MVT User ID");
//                     if UserStations.Find('-') then begin
//                         CurrMoveTo := UserStations."Station Code";
//                         CurrLocation := UserStations."Station Name";
//                     end;

//                     //create a record in file movement location
//                     ApprovalsSetup.Reset;
//                     ApprovalsSetup.SetRange(ApprovalsSetup."Station Code", "Move to");
//                     if ApprovalsSetup.Find('-') then begin
//                         FileMovementTracker.Reset;
//                         FileMovementTracker.SetCurrentKey("Entry No.");
//                         if FileMovementTracker.Find('+') then
//                             EntryNo := FileMovementTracker."Entry No." + 1;
//                         FileMovementTracker.Init;
//                         FileMovementTracker."Entry No." := EntryNo;
//                         FileMovementTracker."Member No." := "File Number";
//                         FileMovementTracker."Section Code" := CurrMoveTo/*"Move to"*/;
//                         FileMovementTracker."Current Location" := false;
//                         FileMovementTracker."Station Name" := CurrLocation/*"Sent To"*/;
//                         FileMovementTracker.Station := ApprovalsSetup."Station Code";
//                         FileMovementTracker."Date/Time In" := CreateDateTime(Today, Time);
//                         FileMovementTracker."USER ID" := UserId;
//                         FileMovementTracker.Remarks := Format("File Movement Remarks");
//                         FileMovementTracker.Status := Status;
//                         FileMovementTracker."Current Location" := true;
//                         //FileMovementTracker."Date/Time Out":=CURRENTDATETIME;
//                         FileMovementTracker.Folio := "Folio Number";
//                         FileMovementTracker.Narration := Narration;
//                         FileMovementTracker."Issued To" := "Sent To";
//                         FileMovementTracker.Insert(true);

//                     end;

//                 end;
//             }
//             separator(Action1000000032)
//             {
//             }
//             action("File  Received")
//             {
//                 Caption = 'Receive File';
//                 Image = Receipt;
//                 Promoted = true;
//                 PromotedCategory = Process;

//                 trigger OnAction()
//                 begin
//                     TestField("Sent To");
//                     if Rec."File Received" = true then Error(AlreadyReceived, "File Received by");

//                     //error if one not in department sent to and tries to receive
//                     UserStations.Reset;
//                     UserStations.SetRange(UserStations."User Id", UserId);
//                     if UserStations.Find('-') then
//                         if UserStations."Station Code" <> Rec."Move to" then
//                             Error(NotAllowedReceive, Rec."Sent To");


//                     TestField("File Movement Remarks");
//                     Action := Action::Received;

//                     if Confirm(SureRecieve) = false then
//                         exit;
//                     FileMovementTracker.Reset;
//                     FileMovementTracker.SetRange(FileMovementTracker."Member No.", "File Number");
//                     if FileMovementTracker.Find('-') then begin
//                         repeat
//                             FileMovementTracker."Current Location" := false;
//                             //FileMovementTracker.Status:=FileMovementTracker.Status::Forwarded;
//                             FileMovementTracker.Modify;
//                         until FileMovementTracker.Next = 0;
//                     end;

//                     //Modify date out
//                     FileMovementTracker.Reset;
//                     FileMovementTracker.SetRange("Member No.", Rec."File Number");
//                     if FileMovementTracker.Find('+') then begin
//                         FileMovementTracker."Date/Time Out" := CurrentDateTime;
//                         FileMovementTracker.Status := FileMovementTracker.Status::Forwarded;
//                         FileMovementTracker.Modify;
//                     end;

//                     ApprovalsSetup.Reset;
//                     ApprovalsSetup.SetRange(ApprovalsSetup."Station Code", "Move to");
//                     if ApprovalsSetup.Find('-') then begin
//                         FileMovementTracker.Reset;
//                         FileMovementTracker.SetCurrentKey("Entry No.");
//                         if FileMovementTracker.Find('+') then
//                             EntryNo := FileMovementTracker."Entry No." + 1;
//                         FileMovementTracker.Init;
//                         FileMovementTracker."Entry No." := EntryNo;
//                         FileMovementTracker."Member No." := "File Number";
//                         FileMovementTracker."Section Code" := Rec."Move to";
//                         FileMovementTracker."Current Location" := false;
//                         FileMovementTracker."Station Name" := Rec."Sent To";
//                         FileMovementTracker.Station := ApprovalsSetup."Station Code";
//                         FileMovementTracker."Date/Time In" := CreateDateTime(Today, Time);
//                         FileMovementTracker."USER ID" := UserId;
//                         FileMovementTracker.Remarks := Format("File Movement Remarks");
//                         FileMovementTracker.Status := FileMovementTracker.Status::"Being Processed";
//                         FileMovementTracker."Current Location" := true;
//                         //FileMovementTracker."Date/Time Out":=CURRENTDATETIME;
//                         FileMovementTracker.Folio := "Folio Number";
//                         FileMovementTracker.Narration := Narration;
//                         FileMovementTracker.Insert(true);

//                     end;

//                     "File received date" := Today;
//                     "File received Time" := Time;
//                     "File Received by" := UserId;
//                     "File Received" := true;
//                     "Folio Number" := '';
//                     Narration := '';
//                     "File Movement Remarks" := '';
//                     "Move to" := '';
//                     "Sent To" := '';
//                     "File MVT User ID" := UserId;
//                     Rec."File  Forwarded" := false;

//                     CurrPage.Update;
//                 end;
//             }
//             separator(Action1000000030)
//             {
//             }
//             action("Recall File")
//             {
//                 Image = VoidCheck;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 Visible = false;

//                 trigger OnAction()
//                 begin
//                     /*IF  "File Received" =TRUE THEN BEGIN
//                      ERROR('YOU CANNOT RECALL RECEIVED FILE');
//                      END;
                    
//                     TESTFIELD("File Movement Remarks");
                    
//                     "File received date":=TODAY;
//                     "File received Time":=TIME;
//                     "File Received by":=USERID;
//                     "File Recalled":= TRUE;
//                     Action:=Action::"Open ";
//                     */

//                 end;
//             }
//             separator(Action1000000028)
//             {
//             }
//             action(Forward)
//             {
//                 Image = SendEmailPDF;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 Visible = true;

//                 trigger OnAction()
//                 begin
//                     /*IF "File Received by" <> USERID THEN BEGIN
//                     ERROR('You are not Allowed to forward  this file only '+Rec."File Received by"+ ' can  forward  the file');
//                     END;*/
//                     //TESTFIELD("Move to");
//                     if Rec."File  Forwarded" = true then Error(AlreadyForwarded, "Sent To");

//                     if "File Received" = true then begin
//                         UserStations.Reset;
//                         UserStations.SetRange(UserStations."User Id", "File Received by");
//                         if UserStations.Find('-') then begin
//                             UserStationCode := UserStations."Station Code";
//                             UserStationName := UserStations."Station Name";
//                         end;

//                         UserStations.Reset;
//                         UserStations.SetRange(UserStations."User Id", UserId);
//                         if UserStations.Find('-') then
//                             if UserStations."Station Code" <> UserStationCode then
//                                 Error(ForwardError, UserStationName);
//                     end;

//                     TestField("File received date");
//                     TestField("File received Time");
//                     TestField("File Received by");
//                     TestField("Folio Number");
//                     TestField("Move to");
//                     TestField("File Movement Remarks");
//                     TestField(Narration);
//                     Status := Status::Processed;


//                     if Confirm(ConfirmForward) = false then
//                         exit
//                     else begin

//                         "File received date" := Today;
//                         "File received Time" := Time;
//                         "File Received by" := UserId;
//                         Action := Action::Forwarded;

//                         "Request Number" := "Request Number";
//                         "File Number" := "File Number";
//                         "Folio Number" := "Folio Number";
//                         "File MVT User ID" := "Sent To";
//                         "Loan No" := "Loan No";
//                         "Other  Doc  No" := "Other  Doc  No";
//                         "File MVT Date" := "File MVT Date";
//                         "File MVT Time" := "File MVT Time";
//                         "File received date" := 0D;
//                         "File received Time" := 0T;
//                         "File Received by" := '';
//                         "File Received" := false;
//                         "File  Forwarded" := true;
//                         "File MVT User ID" := "File Received by";
//                         Action := Action;
//                         Action := Action::Forwarded;
//                         Modify;

//                         "File MVT User ID" := UserId;
//                         "File MVT Time" := Time;
//                         "File MVT Date" := Today;
//                         Action := Action::Forwarded;

//                         FileMovementTracker.Reset;
//                         FileMovementTracker.SetRange(FileMovementTracker."Member No.", "File Number");
//                         if FileMovementTracker.Find('-') then begin
//                             repeat
//                                 FileMovementTracker."Current Location" := false;
//                                 FileMovementTracker.Modify;
//                             until FileMovementTracker.Next = 0;
//                         end;

//                         ApprovalsSetup.Reset;
//                         ApprovalsSetup.SetRange(ApprovalsSetup."Station Code", "Move to");
//                         if ApprovalsSetup.Find('-') then begin
//                             FileMovementTracker.Reset;
//                             FileMovementTracker.SetCurrentKey("Entry No.");
//                             if FileMovementTracker.Find('+') then
//                                 EntryNo := FileMovementTracker."Entry No." + 1;
//                             FileMovementTracker.Init;
//                             FileMovementTracker."Entry No." := EntryNo;
//                             FileMovementTracker."Member No." := "File Number";
//                             FileMovementTracker."Section Code" := Rec."Move to";
//                             FileMovementTracker."Current Location" := false;
//                             FileMovementTracker."Station Name" := Rec."Sent To";
//                             FileMovementTracker.Station := ApprovalsSetup."Station Code";
//                             FileMovementTracker."Date/Time In" := CreateDateTime(Today, Time);
//                             FileMovementTracker."USER ID" := UserId;
//                             FileMovementTracker.Remarks := Format("File Movement Remarks");
//                             FileMovementTracker.Status := FileMovementTracker.Status::Forwarded;
//                             FileMovementTracker."Current Location" := true;
//                             //FileMovementTracker."Date/Time Out":=CURRENTDATETIME;
//                             FileMovementTracker.Folio := "Folio Number";
//                             FileMovementTracker.Narration := Narration;
//                             FileMovementTracker.Insert(true);

//                         end;
//                         Message(ForwadMessage, "Sent To");
//                         Rec."File  Forwarded" := true;
//                         CurrPage.Update;
//                     end;

//                     CurrPage.Close;

//                 end;
//             }
//             separator(Action3)
//             {
//             }
//             action("New File")
//             {
//                 Caption = 'Create New File';
//                 Image = New;
//                 Promoted = true;
//                 PromotedCategory = Category4;

//                 trigger OnAction()
//                 begin
//                     if Create = true then
//                         Error(AlreadyCreated, "File Created By");

//                     //Check if user is in Registry
//                     UserStations.Reset;
//                     UserStations.SetRange(UserStations."User Id", UserId);
//                     if UserStations.Find('-') then
//                         if UserStations."Can Create New" = false then
//                             Error(UserPermision);


//                     if Confirm(CreateFile) = false then exit;
//                     "File MVT User ID" := UserId;
//                     "File Creation Date" := Today;
//                     "File Created By" := UserId;
//                     Create := true;
//                     CurrPage.Update;
//                 end;
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     begin
//         //File number not editable
//         if Rec."File MVT User ID" <> '' then
//             fieldeditable := false;
//         if Rec."File MVT User ID" = '' then
//             fieldeditable := true;

//         //move to not editable if user not in same Dpt

//         UserStations.Reset;
//         UserStations.SetRange("User Id", Rec."File MVT User ID");
//         if UserStations.FindFirst then begin
//             MvtUserStationName := UserStations."Station Name";
//         end;

//         UserStations.Reset;
//         UserStations.SetRange("User Id", UserId);
//         if UserStations.FindFirst then begin
//             if UserStations."Station Name" <> MvtUserStationName then
//                 MVEditable := false
//             else
//                 if UserStations."Station Name" = MvtUserStationName then
//                     MVEditable := true;
//         end;

//         /*IF Rec."File MVT User ID"<>USERID THEN
//           MVEditable:=FALSE;
//         IF Rec."File MVT User ID"=USERID THEN
//           MVEditable:=TRUE;
//         IF Rec."File Received"=TRUE THEN
//           MVEditable:=FALSE*/

//     end;

//     trigger OnAfterGetRecord()
//     begin

//         /*IF "File MVT User ID"='' THEN
//           fieldeditable:=TRUE;*/

//     end;

//     trigger OnOpenPage()
//     begin
//         //IF "File MVT Date"<>0D THEN CurrPage.EDITABLE:=FALSE;
//         /*IF Rec."File MVT User ID"<>'' THEN
//           fieldeditable:=FALSE;
//         IF Rec."File MVT User ID"='' THEN
//           fieldeditable:=TRUE;*/

//     end;

//     var
//         FileMovementTracker: Record "File Location";
//         ApprovalsSetup: Record "File Stations";
//         Showlist: Record "File Tracker";
//         EntryNo: Integer;
//         UserStations: Record "User Stations";
//         [InDataSet]
//         fieldeditable: Boolean;
//         FileAlreadyIssued: Label 'File has Already been issued to %1';
//         SureIssue: Label 'Are you sure you want to issue file';
//         NotAllowedReceive: Label 'You are not allowed to receive files sent to %1 Section';
//         SureRecieve: Label 'Are you sure you want to receive this file?';
//         ErrorForward: Label 'This file is in %1 and can only be forwarded by %2 users';
//         [InDataSet]
//         MVEditable: Boolean;
//         AlreadyCreated: Label 'File already created by %1';
//         UserPermision: Label 'Only users with Create New permission can Create a new file';
//         CreateFile: Label 'Are you sure you want to create the new file';
//         ErrorFileNotCreated: Label 'File is not Created';
//         CurrMoveTo: Code[10];
//         CurrLocation: Text;
//         DateOut: DateTime;
//         UserStationCode: Code[10];
//         UserStationName: Text;
//         MvtUserStationName: Text;
//         AlreadyIssued: Label 'File Already Issued';
//         OnlyUsersError: Label 'Only users in Registry can Issue a file';
//         AlreadyReceived: Label 'File ALready Received by %1';
//         AlreadyForwarded: Label 'File Has already been Forwaded to %1';
//         ForwardError: Label 'File can only be forwarded by users in %1';
//         ConfirmForward: Label 'Are you sure you want to forward the file to the selected section?';
//         ForwadMessage: Label 'File has been fowarded to %1';
// }

