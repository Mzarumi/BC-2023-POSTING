page 52185564 "HR Leave Reimbursment Card"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions,Comments';
    SourceTable = "HR Leave Reimbursement";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Application Code"; Rec."Application Code")
                {
                    Editable = false;
                }
                field("Leave Application No"; Rec."Leave Application No")
                {
                }
                field("Application Date"; Rec."Application Date")
                {
                    Editable = false;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Start Date"; Rec."Start Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Return Date"; Rec."Return Date")
                {
                    Editable = false;
                }
                label("Employee Details")
                {
                    Caption = 'Employee Details';
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Employee No"; Rec."Employee No")
                {
                    Caption = 'Employee No.';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                }
                field(Names; Rec.Names)
                {
                    Caption = 'Applicant Name';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Job Tittle"; Rec."Job Tittle")
                {
                    Caption = 'Job Title';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Days to Reimburse"; Rec."Days to Reimburse")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Send Approval Request")
                {
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        // Rec.TestFieldS;

                        if Confirm('Send this Leave Reimbursement for Approval?', true) = false then exit;

                        Rec.Selected := true;
                        Rec."User ID" := UserId;

                        //ApprovalMgt.SendLeaveReimbApprovalReq(Rec);
                    end;
                }
                action("&Approvals")
                {
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Jobs,"Employee Req",Employees,Promotion,Confirmation,"Employee Transfer","Asset Transfer","Transport Req",Overtime,"Training App","Leave App","Leave Reimb";
                        ApprovalEntries: Page "Approval Entries";
                    begin

                        DocumentType := DocumentType::"Leave Reimb";
                        ApprovalEntries.Setfilters(DATABASE::"HR Leave Reimbursement", DocumentType, Rec."Application Code");
                        ApprovalEntries.Run;
                    end;
                }
                action("&Cancel Approval Request")
                {
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Confirm('Cancel Leave Reimbursement Approval Request?', true) = false then exit;

                        //ApprovalMgt.CancelLeaveReimbAppRequest(Rec,TRUE,TRUE);
                    end;
                }
            }
        }
    }

    var
        Text19010232: Label 'Leave Statistics';
        Text1: Label 'Reliver Details';
        EmpName: Text;

    //[Scope('Internal')]
    procedure TESTFIELDS()
    begin
        Rec.TestField("Responsibility Center");
        Rec.TestField("Days Applied");
        Rec.TestField("Days to Reimburse");
    end;
}

