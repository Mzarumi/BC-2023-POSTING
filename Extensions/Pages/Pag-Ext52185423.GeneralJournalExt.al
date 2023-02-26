pageextension 52185423 "General Journal Ext" extends "General Journal"
{

     actions
    {
        modify(Post)
        {
            Visible = false;
        }

        addbefore(Post){
            action(postII){
               
                ApplicationArea = Basic, Suite;
                Caption = 'P&ost';
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Category9;
                PromotedIsBig = true;
                ShortCutKey = 'F9';
                ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';

                trigger OnAction()
                begin
                    // SendToPosting(Codeunit::"Gen. Jnl.-Post");
                    // CurrentJnlBatchName := GetRangeMax("Journal Batch Name");
                    // if IsSimplePage then
                    //     if GeneralLedgerSetup."Post with Job Queue" then
                    //         NewDocumentNo()
                    //     else
                    //         SetDataForSimpleModeOnPost;
                    // SetJobQueueVisibility();
                    // CurrPage.Update(false);
                    Message('I changed the functionality of this action');
                end;
                
            }
        }
    }
}
