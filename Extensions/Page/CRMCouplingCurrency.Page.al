// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Page 5245 "CRM Coupling Currency"
// {
//     Caption = 'Microsoft Dynamics CRM Transaction Currency Coupling';
//     PageType = StandardDialog;
//     SourceTable = Currency;

//     layout
//     {
//         area(content)
//         {
//             group(Coupling)
//             {
//                 Caption = 'Coupling';
//                 //The GridLayout property is only supported on controls of type Grid
//                 //GridLayout = Rows;
//                 group("Dynamics NAV")
//                 {
//                     Caption = 'Dynamics NAV';
//                     field("Code";Rec.Code)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Currency';
//                         Editable = false;
//                     }
//                     field(SynchActionControl;SynchAction)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Synchronize After Coupling';
//                         Editable = not CreateNewInCRM;
//                         Enabled = not CreateNewInCRM;
//                         OptionCaption = 'No,Yes - Use the Dynamics NAV data';

//                         trigger OnValidate()
//                         begin
//                             SetPushActionCheckboxes;
//                         end;
//                     }
//                 }
//                 group("Dynamics CRM")
//                 {
//                     Caption = 'Dynamics CRM';
//                     field("CRM Transactioncurrency ISOCurrencyCode";CRMTransactioncurrency.ISOCurrencyCode)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Transaction Currency';
//                         Enabled = not CreateNewInCRM;

//                         trigger OnLookup(var Text: Text): Boolean
//                         var
//                             PreviouslySelectedCRMTransactioncurrency: Record "CRM Transactioncurrency";
//                             CRMTransactionCurrencyList: Page "CRM TransactionCurrency List";
//                         begin
//                             CRMTransactionCurrencyList.SetRecord(CRMTransactioncurrency);
//                             CRMTransactionCurrencyList.SetCurrentlyCoupledCRMTransactioncurrency(OriginalCRMTransactioncurrency);
//                             CRMTransactionCurrencyList.LookupMode(true);
//                             PreviouslySelectedCRMTransactioncurrency := CRMTransactioncurrency;

//                             if CRMTransactionCurrencyList.RunModal = Action::LookupOK then begin
//                               CRMTransactionCurrencyList.GetRecord(CRMTransactioncurrency);
//                               if PreviouslySelectedCRMTransactioncurrency.TransactionCurrencyId <> CRMTransactioncurrency.TransactionCurrencyId then
//                                 HandleNewCRMTransactioncurrency;
//                             end;
//                         end;

//                         trigger OnValidate()
//                         var
//                             ManualCRMTransactioncurrency: Record "CRM Transactioncurrency";
//                             PreviouslySelectedCRMTransactioncurrency: Record "CRM Transactioncurrency";
//                             CRMTransactioncurrencyFound: Boolean;
//                         begin
//                             PreviouslySelectedCRMTransactioncurrency := CRMTransactioncurrency;
//                             ManualCRMTransactioncurrency.SetRange(ISOCurrencyCode,CRMTransactioncurrency.ISOCurrencyCode);

//                             if ManualCRMTransactioncurrency.FindFirst then
//                               CRMTransactioncurrencyFound := true
//                             else begin
//                               ManualCRMTransactioncurrency.SetCurrentkey(ISOCurrencyCode);
//                               ManualCRMTransactioncurrency.SetFilter(ISOCurrencyCode,'%1',CRMTransactioncurrency.ISOCurrencyCode + '*');
//                               if ManualCRMTransactioncurrency.FindFirst then
//                                 CRMTransactioncurrencyFound := true;
//                             end;

//                             if CRMTransactioncurrencyFound then begin
//                               CRMTransactioncurrency := ManualCRMTransactioncurrency;
//                               if PreviouslySelectedCRMTransactioncurrency.TransactionCurrencyId <> CRMTransactioncurrency.TransactionCurrencyId then
//                                 HandleNewCRMTransactioncurrency;
//                             end else
//                               Error(StrSubstNo(NoSuchCRMRecordErr,CRMTransactioncurrency.ISOCurrencyCode));
//                         end;
//                     }
//                     field(CreateNewControl;CreateNewInCRM)
//                     {
//                         ApplicationArea = Basic;
//                         Caption = 'Create New Transaction Currency';

//                         trigger OnValidate()
//                         begin
//                             if CreateNewInCRM then begin
//                               SavedCRMTransactioncurrency := CRMTransactioncurrency;
//                               SavedSynchAction := SynchAction;
//                               SynchAction := Synchaction::PushToCRM;
//                               CRMTransactioncurrency.Init;
//                             end else begin
//                               CRMTransactioncurrency := SavedCRMTransactioncurrency;
//                               SynchAction := SavedSynchAction;
//                             end;

//                             SetPushActionCheckboxes;
//                         end;
//                     }
//                 }
//             }
//             group("Coupled Records")
//             {
//                 Caption = 'Coupled Records';
//                 Editable = false;
//                 fixed(Control10)
//                 {
//                     group("Dynamics NAV Currency")
//                     {
//                         Caption = 'Dynamics NAV Currency';
//                         //The GridLayout property is only supported on controls of type Grid
//                         //GridLayout = Columns;
//                         field(Code2;Rec.Code)
//                         {
//                             ApplicationArea = Basic;
//                             Caption = 'Code';
//                         }
//                         field(Description;Rec.Description)
//                         {
//                             ApplicationArea = Basic;
//                         }
//                         field(PushToCRMControl;PushToCRM)
//                         {
//                             ApplicationArea = Basic;
//                             Caption = 'Use for Synchronization';
//                         }
//                     }
//                     group("Dynamics CRM Transaction Currency")
//                     {
//                         Caption = 'Dynamics CRM Transaction Currency';
//                         field("CRMTransactioncurrency.ISOCurrencyCode";CRMTransactioncurrency.ISOCurrencyCode)
//                         {
//                             ApplicationArea = Basic;
//                         }
//                         field("CRMTransactioncurrency.CurrencyName";CRMTransactioncurrency.CurrencyName)
//                         {
//                             ApplicationArea = Basic;
//                         }
//                         field(PushToNAVControl;PushToNAV)
//                         {
//                             ApplicationArea = Basic;
//                         }
//                     }
//                 }
//             }
//         }
//     }

//     actions
//     {
//     }

//     trigger OnAfterGetRecord()
//     var
//         CRMIntegrationRecord: Record "CRM Integration Record";
//         CRMID: Guid;
//     begin
//         if CRMIntegrationRecord.FindIDFromRecordID(Rec.RecordId,CRMID) then begin
//           CRMTransactioncurrency.Get(CRMID);
//           OriginalCRMTransactioncurrency := CRMTransactioncurrency;
//           SynchAction := Synchaction::DoNotSynch;
//           SetPushActionCheckboxes;
//         end;
//     end;

//     trigger OnInit()
//     begin
//         SynchAction := Synchaction::PushToCRM;
//         SetPushActionCheckboxes;
//     end;

//     var
//         CRMTransactioncurrency: Record "CRM Transactioncurrency";
//         OriginalCRMTransactioncurrency: Record "CRM Transactioncurrency";
//         IntegrationTableMapping: Record "Integration Table Mapping";
//         SavedCRMTransactioncurrency: Record "CRM Transactioncurrency";
//         CreateNewInCRM: Boolean;
//         PushToCRM: Boolean;
//         PushToNAV: Boolean;
//         InitialSynchDisabledErr: label 'No initial synchronization direction was specified because initial synchronization was disabled.';
//         NoSuchCRMRecordErr: label 'Transaction Currency with ISO currency code %1 does not exist in Microsoft Dynamics CRM.', Comment='%1 = The Transaction Currency isocurrencycode entered by the user';
//         SynchAction: Option DoNotSynch,PushToCRM;
//         SavedSynchAction: Integer;

//     local procedure SetPushActionCheckboxes()
//     begin
//         if SynchAction = Synchaction::DoNotSynch then begin
//           PushToCRM := false;
//           PushToNAV := false;
//         end else begin
//           PushToCRM := SynchAction = Synchaction::PushToCRM;
//           PushToNAV := not PushToCRM;
//         end
//     end;

//     local procedure HandleNewCRMTransactioncurrency()
//     var
//         CRMIntegrationRecord: Record "CRM Integration Record";
//     begin
//         if OriginalCRMTransactioncurrency.TransactionCurrencyId <> CRMTransactioncurrency.TransactionCurrencyId then
//           CRMIntegrationRecord.AssertRecordIDCanBeCoupled(Rec.RecordId,CRMTransactioncurrency.TransactionCurrencyId);
//     end;


//     procedure GetCRMID(): Guid
//     begin
//         exit(CRMTransactioncurrency.TransactionCurrencyId);
//     end;


//     procedure GetCreateNewInCRM(): Boolean
//     begin
//         exit(CreateNewInCRM);
//     end;


//     procedure GetPerformInitialSynchronization(): Boolean
//     begin
//         exit(SynchAction <> Synchaction::DoNotSynch);
//     end;


//     procedure GetInitialSynchronizationDirection(): Integer
//     begin
//         if SynchAction = Synchaction::DoNotSynch then
//           Error(InitialSynchDisabledErr);

//         exit(IntegrationTableMapping.Direction::ToIntegrationTable);
//     end;
// }
