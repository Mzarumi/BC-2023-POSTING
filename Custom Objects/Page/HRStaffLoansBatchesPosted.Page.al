page 52186585 "HR Staff Loans Batches Posted"
{
    DeleteAllowed = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "HR Batches";
    SourceTableView = WHERE(Posted = CONST(true));

    layout
    {
        area(content)
        {
            group(Control1000000002)
            {
                ShowCaption = false;
                field("Batch No."; Rec."Batch No.")
                {
                    Editable = false;
                }
                field("Batch Type"; Rec."Batch Type")
                {
                    Editable = true;
                }
                field("Description/Remarks"; Rec."Description/Remarks")
                {
                }
                field("Batch Date"; Rec."Batch Date")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Total Loan Amount"; Rec."Total Loan Amount")
                {
                }
                field("No of Loans"; Rec."No of Loans")
                {
                }
                field("Mode Of Disbursement"; Rec."Mode Of Disbursement")
                {
                }
                field("Document No."; Rec."Document No.")
                {

                    trigger OnValidate()
                    begin
                        /*IF STRLEN("Document No.") > 6 THEN
                          ERROR('Document No. cannot contain More than 6 Characters.');
                          */

                    end;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("BOSA Bank Account"; Rec."BOSA Bank Account")
                {
                    Caption = 'Loan Disbursement Account';
                }
                field("Responcibility Center"; Rec."Responcibility Center")
                {
                }
            }
            part(LoansSubForm; "HR Staff Loans Subpage")
            {
                SubPageLink = "Batch No." = FIELD("Batch No.");
            }
            part(Control1000000003; "HR Overtime Lines")
            {
            }
            part(Control1000000004; "Approved Leave Applications")
            {
            }
        }
    }

    actions
    {
    }

    var
        Text001: Label 'Status must be open';
}

