page 52186580 "HR Batches - List"
{
    CardPageID = "HR Staff Loans Batches";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "HR Batches";
    SourceTableView = WHERE(Posted = FILTER(false));

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                ShowCaption = false;
                field("Batch No."; Rec."Batch No.")
                {
                    Editable = false;
                }
                field(Source; Rec.Source)
                {
                }
                field("Description/Remarks"; Rec."Description/Remarks")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("No of Loans"; Rec."No of Loans")
                {
                    Editable = false;
                }
                field("Mode Of Disbursement"; Rec."Mode Of Disbursement")
                {
                    Editable = true;
                }
                field("Batch Type"; Rec."Batch Type")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Batch)
            {
                Caption = 'Batch';
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                    end;
                }
                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        Text001: Label 'This Batch is already pending approval';
                    begin
                    end;
                }
                action("Canel Approval Request")
                {
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                }
                action(Post)
                {
                    Caption = 'Post';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        Text001: Label 'The Batch need to be approved.';
                    begin
                    end;
                }
            }
        }
    }
}

