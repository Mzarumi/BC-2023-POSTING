#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 52185441 "HR Leave Jnl.-Post"
{
    TableNo = 52185544;

    trigger OnRun()
    begin
        HRJournalLine.Copy(Rec);
        Code;
        Rec.Copy(HRJournalLine);
    end;

    var
        Text000: label 'Do you want to post the journal lines?';
        Text001: label 'There is nothing to post.';
        Text002: label 'The journal lines were successfully posted.';
        Text003: label 'The journal lines were successfully posted. You are now in the %1 journal.';
        HRJournalLineTemplate: Record 52185533;
        HRJournalLine: Record 52185544;
        HRJournalPostBatch: Codeunit "HR Leave Jnl.- Post Batch";
        TempJnlBatchName: Code[10];
        Text004: label 'Since you are making a Negative Adjustment, "Number of Days" Should be Less Than Zero and not %1';

    local procedure "Code"()
    begin
        begin



            // HRJournalLineTemplate.Get("Journal Template Name");
            HRJournalLineTemplate.TestField("Force Posting Report", false);

            //   IF NOT CONFIRM(Text000,FALSE) THEN
            //     EXIT;

            // TempJnlBatchName := "Journal Batch Name";

            HRJournalPostBatch.Run(HRJournalLine);

            // if "Line No." = 0 then
            //     Message(Text001)
            // else
            //     if TempJnlBatchName = "Journal Batch Name" then begin
            //         Message(Text002);
            //         HRJournalLine.DeleteAll
            //     end
            //     else begin
            //         Message(
            //           Text003,
            //       "Journal Batch Name");
            //     end;
            // if not HRJournalLine.Find('=><') or (TempJnlBatchName <> "Journal Batch Name") then begin
            //     HRJournalLine.Reset;
            //     HRJournalLine.FilterGroup := 2;
            //     HRJournalLine.SetRange("Journal Template Name", "Journal Template Name");
            //     HRJournalLine.SetRange("Journal Batch Name", "Journal Batch Name");
            //     HRJournalLine.FilterGroup := 0;
            //     "Line No." := 1;
            // end;
        end;
    end;
}
