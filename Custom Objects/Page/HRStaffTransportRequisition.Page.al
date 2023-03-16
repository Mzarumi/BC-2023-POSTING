page 52186465 "HR Staff Transport Requisition"
{
    PageType = Card;
    PromotedActionCategories = 'Manage,Process,Report';
    SourceTable = "HR Transport Requisition Head";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transport Request No"; Rec."Transport Request No")
                {
                    Editable = false;
                }
                field("Raised By"; Rec."Raised By")
                {
                    Editable = false;
                }
                field("Application Date"; Rec."Application Date")
                {
                    Editable = false;
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                }
                field("Job Title"; Rec."Job Title")
                {
                    Editable = false;
                }
                field("Departure Date"; Rec."Departure Date")
                {
                }
                field("Return Date"; Rec."Return Date")
                {
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    Editable = false;
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                }
                field("Pickup Point"; Rec."Pickup Point")
                {
                }
                field(From; Rec.From)
                {
                }
                field(Destination; Rec.Destination)
                {
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        // IF ApprovalsMgmt.CheckHrtransportApprovalsWorkflowEnabled(Rec) THEN
                        //  ApprovalsMgmt.OnSendHrtransportForApproval(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';
                    Image = cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        //ApprovalsMgmt.OnCancelHrtransportApprovalRequest(Rec);
                    end;
                }
            }
        }
    }

    var
        HREmp: Record "HR Employees";
        EmpJobDesc: Text[30];
        HRJobs: Record "HR Jobs";
        SupervisorName: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        dAlloc: Decimal;
        dEarnd: Decimal;
        dTaken: Decimal;
        dLeft: Decimal;
        cReimbsd: Decimal;
        cPerDay: Decimal;
        cbf: Decimal;
        HRSetup: Record "HR Setup";
        EmpDept: Text[30];
        HRLeaveApp: Record "HR Transport Requisition Head";
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        D: Date;
        EmpName: Text[70];
        DoclLink: Record "HR Company Attachments";
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";

    //[Scope('Internal')]
    procedure TESTFIELDS()
    begin
        Rec.TestField("Days Applied");
        Rec.TestField("Departure Date");
    end;
}

