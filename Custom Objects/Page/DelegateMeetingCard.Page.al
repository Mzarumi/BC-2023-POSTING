// page 52186321 "Delegate Meeting Card"
// {
//     DeleteAllowed = false;
//     PageType = Card;
//     SourceTable = "Delegates Minutes Header";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("Code"; Rec.Code)
//                 {
//                 }
//                 field(Type; Rec.Type)
//                 {
//                     Editable = false;
//                 }
//                 field("Delegate Region"; Rec."Delegate Region")
//                 {
//                     Caption = 'Delegate Region';
//                     Editable = false;
//                 }
//                 field("Electoral Name"; Rec."Electoral Name")
//                 {
//                     Editable = false;
//                 }
//                 field("Electoral Region"; Rec."Electoral Region")
//                 {
//                     Editable = false;
//                 }
//                 field(Month; Rec.Month)
//                 {
//                     Editable = false;
//                 }
//                 field(Year; Rec.Year)
//                 {
//                     Editable = false;
//                 }
//                 field(Venue; Rec.Venue)
//                 {
//                     Editable = false;
//                 }
//                 field("Meeting Date"; Rec."Meeting Date")
//                 {
//                     Editable = false;
//                 }
//                 field(Posted; Rec.Posted)
//                 {
//                 }
//                 field("Total Branch Members"; Rec."Total Branch Members")
//                 {
//                     Editable = false;
//                 }
//             }
//             group("Submitted By")
//             {
//                 Editable = false;
//                 field("Submitted By No"; Rec."Delegate Member No")
//                 {
//                 }
//                 field("Submitted By Name"; Rec."Delegate Name")
//                 {
//                 }
//             }
//             part(Control12; "Delegate Meeting Attendees")
//             {
//                 Editable = false;
//                 SubPageLink = "Header No" = FIELD(Code);
//             }
//             part("Monthly Returns"; "Monthly Returns List")
//             {
//                 Caption = 'Monthly Returns';
//                 SubPageLink = "Header No" = FIELD(Code);
//             }
//             part("Complaints and Remarks"; "Return Complaints and Remarks")
//             {
//                 Caption = 'Complaints and Remarks';
//                 SubPageLink = "Header No" = FIELD(Code);
//             }
//             part("Proposed Resolutions"; "Return Other Remarks")
//             {
//                 Caption = 'Proposed Resolutions';
//                 SubPageLink = "Header No" = FIELD(Code);
//             }
//         }
//     }

//     actions
//     {
//         area(creation)
//         {
//             action("Download delegates correspondence")
//             {
//                 Image = Note;
//                 Promoted = true;

//                 trigger OnAction()
//                 var
//                     EDMS: Record EDMS;
//                     FromFile: Text;
//                     Name: Text;
//                     url: Text;
//                     GeneralSetUp: Record "General Set-Up";
//                 // begin
//                     DelegatesMinutesHeader.Reset;
//                     // DelegatesMinutesHeader.SetRange(Code, Code);
//                     if DelegatesMinutesHeader.FindFirst then begin
//                         DelegatesMonthlyReturns.Reset;
//                         // DelegatesMonthlyReturns.SetRange("Header No", Code);
//                         //if DelegatesMonthlyReturns.FindFirst then begin
//                             //REPORT.Run(52186006, true, false, DelegatesMinutesHeader);
//                         //end else begin
//                             GeneralSetUp.Get();
//                             //FromFile := GeneralSetUp."PDF B64 Folder" + '\' + 'meeting - ' + Code + '.pdf';
//                             //Name := 'meeting - ' + Code;
//                             //here
//                             // if Exists(FromFile) then
//                             //     Download(FromFile, 'Meeting', '', 'Text file(*.pdf)|*.pdf', Name)
//                             // else
//                             //     Message('The file you are looking for is not available');
//                         //end;
//                     //end;
//                 end;
//             }
//         }
//     }

//     var
//         DelegatesMinutesHeader: Record "Delegates Minutes Header";
//         DelegatesMonthlyReturns: Record "Delegates Monthly Returns";
// }

