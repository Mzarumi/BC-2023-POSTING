#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185489 "Receipt Apply"
{
    TableNo = 52185877;

    trigger OnRun()
    begin
        ReceiptLine.Copy(Rec);
        begin
            BilToCustNo := ReceiptLine."Account No.";
            CustLedgEntry.SetCurrentkey("Customer No.", Open);
            CustLedgEntry.SetRange("Customer No.", BilToCustNo);
            CustLedgEntry.SetRange(Open, true);
            // if "Applies-to ID" = '' then
            //     "Applies-to ID" := No;
            // if "Applies-to ID" = '' then
            //     Error(
            //       Text000,
            //       ReceiptLine.FieldCaption(No), ReceiptLine.FieldCaption("Applies-to ID"));
            // ApplyCustEntries.SetReceipts(ReceiptLine, CustLedgEntry, ReceiptLine.FieldNo("Applies-to ID"));
            ApplyCustEntries.SetRecord(CustLedgEntry);
            ApplyCustEntries.SetTableview(CustLedgEntry);
            ApplyCustEntries.LookupMode(true);
            OK := ApplyCustEntries.RunModal = Action::LookupOK;
            Clear(ApplyCustEntries);
            if not OK then
                exit;
            CustLedgEntry.Reset;
            CustLedgEntry.SetCurrentkey("Customer No.", Open);
            CustLedgEntry.SetRange("Customer No.", BilToCustNo);
            CustLedgEntry.SetRange(Open, true);
            // CustLedgEntry.SetRange("Applies-to ID", "Applies-to ID");
            // if CustLedgEntry.Find('-') then begin
            //     "Applies-to Doc. Type" := 0;
            //     "Applies-to Doc. No." := '';
            // end else
            //     "Applies-to ID" := '';

            ReceiptLine.Modify;
        end;
    end;

    var
        Text000: label 'You must specify %1 or %2.';
        ReceiptLine: Record 52185877;
        CustLedgEntry: Record "Cust. Ledger Entry";
        BilToCustNo: Code[20];
        OK: Boolean;
        ApplyCustEntries: Page "Apply Customer Entries";
}
