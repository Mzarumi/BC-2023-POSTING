// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 825 "DO Payment Connection Setup"
// {
//     Caption = 'Microsoft Dynamics ERP Payment Services Connection Setup';
//     DeleteAllowed = false;
//     InsertAllowed = false;
//     PageType = Card;
//     SourceTable = 825;

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 Caption = 'General';
//                 field(Active; Active)
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Run in Test Mode"; "Run in Test Mode")
//                 {
//                     ApplicationArea = Basic;
//                 }
//                 field("Service ID"; "Service ID")
//                 {
//                     ApplicationArea = Basic;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//             group("F&unctions")
//             {
//                 Caption = 'F&unctions';
//                 Image = "Action";
//                 action(SignUpNowAction)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Sign up Now';
//                     Ellipsis = true;
//                     Image = SignUp;

//                     trigger OnAction()
//                     begin
//                         SignUp;
//                     end;
//                 }
//                 action(ManageAccountAction)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Manage Account';
//                     Ellipsis = true;
//                     Image = EditCustomer;

//                     trigger OnAction()
//                     begin
//                         ManageAccount;
//                     end;
//                 }
//                 action(DisassociateAccountAction)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Disassociate Account';
//                     Ellipsis = true;
//                     Image = UnLinkAccount;

//                     trigger OnAction()
//                     begin
//                         Disassociate;
//                         Message(UnlinkMessage);
//                     end;
//                 }
//             }
//             group(EncryptionActionGroup)
//             {
//                 Caption = 'Encryption';
//                 action(GenerateKeyAction)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Generate Key';
//                     Image = CreateDocument;

//                     trigger OnAction()
//                     begin
//                         if DOEncryptionMgt.HasKey then
//                             if not Confirm(OverwriteExistingKeyWarning) then
//                                 exit;

//                         DOEncryptionMgt.CreateKey;
//                         Message(KeyGeneratedMessage);
//                     end;
//                 }
//                 action(DeleteKeyAction)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Delete Key';
//                     Image = Delete;

//                     trigger OnAction()
//                     begin
//                         if not DOEncryptionMgt.HasKey then
//                             Error(KeyDoesNotExistError);

//                         if not Confirm(DeleteKeyWarning) then
//                             exit;

//                         DOEncryptionMgt.DeleteKey;
//                         Message(KeyDeletedMessage);
//                     end;
//                 }
//                 action(ExportKeyAction)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Download Key';
//                     Image = Export;

//                     trigger OnAction()
//                     var
//                         FileMgt: Codeunit "File Management";
//                         StdPasswordDialog: Page "Std. Password Dialog";
//                         ServerFilename: Text;
//                         ClientFilename: Text;
//                         PasswordText: Text;
//                     begin
//                         ServerFilename := FileMgt.ServerTempFileName('key');
//                         StdPasswordDialog.EnableBlankPassword(false);
//                         if StdPasswordDialog.RunModal = Action::OK then
//                             PasswordText := StdPasswordDialog.GetPasswordValue
//                         else
//                             exit;

//                         DOEncryptionMgt.Export(ServerFilename, PasswordText);
//                         ClientFilename := 'Encryption.key';
//                         if Download(ServerFilename, '', '', '', ClientFilename) then;
//                         Erase(ServerFilename);
//                     end;
//                 }
//                 action(ImportKeyAction)
//                 {
//                     ApplicationArea = Basic;
//                     Caption = 'Upload Key';
//                     Image = Import;

//                     trigger OnAction()
//                     var
//                         StdPasswordDialog: Page "Std. Password Dialog";
//                         ServerFilename: Text;
//                         PasswordText: Text;
//                     begin
//                         if Upload('', '', '', '', ServerFilename) then begin
//                             StdPasswordDialog.EnableBlankPassword(true);
//                             if StdPasswordDialog.RunModal = Action::OK then
//                                 PasswordText := StdPasswordDialog.GetPasswordValue
//                             else
//                                 exit;

//                             if DOEncryptionMgt.HasKey then
//                                 if not Confirm(OverwriteExistingKeyWarning) then
//                                     exit;

//                             DOEncryptionMgt.Import(ServerFilename, PasswordText);
//                         end;
//                     end;
//                 }
//             }
//         }
//     }

//     trigger OnOpenPage()
//     begin
//         CreateDefaultSetup;
//     end;

//     var
//         DOEncryptionMgt: Codeunit 824;
//         OverwriteExistingKeyWarning: label 'Changing the key may render existing data unreadable. Do you want to continue?';
//         DeleteKeyWarning: label 'Deleting the key will render existing data unreadable. Do you want to continue?';
//         KeyDoesNotExistError: label 'Encryption key does not exist.';
//         KeyDeletedMessage: label 'Encryption key was successfully deleted.';
//         KeyGeneratedMessage: label 'Encryption key was successfully generated.';
//         UnlinkMessage: label 'Disassociation of the account has succeeded.';
// }
