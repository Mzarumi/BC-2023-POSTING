#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 52186418 tableextension52186418 extends "Reversal Entry"
{
    procedure AutoReverseRegister(RegisterNo: Integer)
    var
        GLReg: Record "G/L Register";
    begin
        if UserSetup.Get(UserId) then
            if UserSetup."Post Reversals" = false then
                Error('You donnot have permission to do a reversal');
        GLReg.Get(RegisterNo);
        // if GLReg.Reversed then
        //   Error(Text010,GLReg.TableCaption,GLReg."No.");
        if GLReg."Journal Batch Name" = '' then
            ReversalEntry.TestFieldError;

        AutoReverseEntries(RegisterNo, Rec."reversal type"::Register);
    end;

    local procedure AutoReverseEntries(Number: Integer; RevType: Option Transaction,Register)
    var
    // ReversalPost: Codeunit 52185440;
    begin
        HideDialog := true;
        // InsertReversalEntry(Number,RevType);
        ReversalEntry.SetCurrentkey("Document No.", "Posting Date", "Entry Type", "Entry No.");
        if not HideDialog then
            Page.RunModal(Page::"Reverse Entries", ReversalEntry)
        else begin
            // ReversalPost.SetPrint(false);
            // ReversalPost.Run(ReversalEntry);
        end;
        ReversalEntry.DeleteAll;
    end;

    var
        UserSetup: Record "User Setup";
        ReversalEntry: Record "Reversal Entry" temporary;
}
