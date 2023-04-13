codeunit 52185514 "Events Subscriber"
{
    EventSubscriberInstance = StaticAutomatic;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Events Publisher", 'OnPostEvent', '', true, true)]
    // procedure ActionOnPost();
    // begin
    //     Message('Event Published and raised');
    //     EXIT;
    //     Message('No code should run');
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post", 'OnCodeOnAfterGenJnlPostBatchRun', '', true, true)]
    // procedure HijackBeforePosting();
    // begin
    //     Message('Event Published and raised');
    //     EXIT;
    //     Message('No code should run');
    // end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Gen. Jnl.-Post Line", 'OnBeforePostGenJnlLine', '', false, false)]
    local procedure OnBeforePostGenJnlLine(var Sender: Codeunit "Gen. Jnl.-Post Line"; var GenJournalLine: Record "Gen. Journal Line"; Balancing: Boolean)
    begin
        NextEntryNo := Sender.GetNextEntryNo();
        NextEntryNo += 1;

        NextTransactionNo := Sender.GetNextTransactionNo();
        case
            GenJournalLine."Account Type" of
            GenJournalLine."Account Type"::Savings:
                begin
                    CustomPostCU.PostSavings(GenJournalLine, false);
                    Message('Savings Ledger Route');
                end;
            GenJournalLine."Account Type"::Credit:
                begin
                    // CustomPostCU.PostCustII(GenJournalLine, false);
                    Message('Credit Ledger Route');
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"Gen. Jnl.-Post Line", 'OnMoveGenJournalLine', '', false, false)]
    local procedure OnMoveGenJournalLine(var GenJournalLine: Record "Gen. Journal Line"; ToRecordID: RecordId)
    begin
    end;
    //Variable Declarations
    var
        NextEntryNo: Integer;
        NextTransactionNo: Integer;
        LoanApp: Record Loans;
        LoanTypes: Record "Product Factory";
        CustomPostCU: Codeunit "Gen. Jnl.-Post Line Ext";



}