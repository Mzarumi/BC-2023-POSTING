page 52186021 "Approved Contract Card"
{
    Caption = 'Approved Contract Card';
    Editable = false;
    InsertAllowed = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Jobs;
    SourceTableView = WHERE(Status = CONST(Contract),
                            "Approval Status" = FILTER(Approved));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                }
                field("Re:"; Rec."Re:")
                {
                }
                field(Title; Rec.Title)
                {
                }
                field("Funding Agency"; Rec."Main Donor")
                {
                }
                field(Institution; Rec.Institution)
                {
                }
                field("Prime PI"; Rec."PI Name")
                {
                }
                field("Performance Period Starting Date"; Rec."Starting Date")
                {
                }
                field("Performance Period Ending Date"; Rec."Ending Date")
                {
                }
                field("Payment Method"; Rec."Payment Methods")
                {
                }
                field("Amount Awarded"; Rec."Amount Awarded")
                {
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
            group("Summary on Ammendment")
            {
                part("<Contract Lines>>"; "Contract Lines")
                {
                    Caption = '<Contract Lines>';
                    SubPageLink = "Document No." = FIELD("No.");
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Links)
            {
                Editable = false;
                Visible = true;
            }
            systempart(Control1000000014; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("W&IP")
            {
                Caption = 'W&IP';
                Visible = false;
                action("Calculate WIP")
                {
                    Caption = 'Calculate WIP';
                    Ellipsis = true;
                    Image = CalculateWIP;

                    trigger OnAction()
                    var
                        Job: Record Jobs;
                    begin
                        Rec.TestField("No.");
                        Job.Copy(Rec);
                        Job.SetRange("No.", Rec."No.");
                        //REPORT.RunModal(REPORT::"Job Calculate WIP", true, false, Job);
                    end;
                }
                action("Post WIP to G/L")
                {
                    Caption = 'Post WIP to G/L';
                    Ellipsis = true;
                    Image = Post;

                    trigger OnAction()
                    var
                        Job: Record Jobs;
                    begin
                        Rec.TestField("No.");
                        Job.Copy(Rec);
                        Job.SetRange("No.", Rec."No.");
                        //REPORT.RunModal(REPORT::"Job Post WIP to G/L", true, false, Job);
                    end;
                }
                action("WIP Entries")
                {
                    Caption = 'WIP Entries';
                }
            }
            group("&Prices")
            {
                Caption = '&Prices';
                Visible = false;
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Visible = false;
                action("Resource Allocated per Job")
                {
                    Caption = 'Resource Allocated per Job';
                    RunObject = Page "Resource Allocated per Job";
                }
                separator(a)
                {
                    Caption = 'a';
                }
                action("Res. &Gr. Allocated per Job")
                {
                    Caption = 'Res. &Gr. Allocated per Job';
                    RunObject = Page "Res. Gr. Allocated per Job";
                }
            }
            group("&Proposal")
            {
                Caption = '&Proposal';
                action("Page Proposal Check List")
                {
                    Caption = 'Proposal Check List';
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Job),
                                  "No." = FIELD("No.");
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(52185775),
                                  "No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                separator(Action64)
                {
                }
                separator(Action1102755008)
                {
                }
                separator(Action1102755019)
                {
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition",JV,"Grant Task","Concept Note",Proposal;
                    begin
                        DocumentType := DocumentType::Proposal;
                        ApprovalEntries.Setfilters(DATABASE::Jobs, DocumentType, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                separator(Action1102755018)
                {
                }
                action("Send Approval Request")
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        //Release the grant for Approval
                        //Rec.TestField("Total Cost");
                        //IF ApprovalMgt.SendProposalApprovalReq(Rec) THEN;
                    end;
                }
                action("Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';

                    trigger OnAction()
                    begin
                        // IF ApprovalMgt.CancelProposalAppRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                separator(Action1102755020)
                {
                }
                action("Copy Grant")
                {
                    Caption = 'Copy Grant';
                    Ellipsis = true;
                    // RunObject = Report Report1084;
                }
                action("Revert to Proposal")
                {
                    Caption = 'Revert to Proposal';

                    trigger OnAction()
                    begin
                        // Status:=Status::"Concept Formulation";
                        // MODIFY;


                        //IF "Approval Status"= "Approval Status"::Open THEN ERROR('Concept must be approved first');
                        if Confirm('Revert contract to proposal?') then begin
                            Rec.Status := Rec.Status::Proposal;
                            Rec."Approval Status" := "Approval Status"::Open;
                            Rec.Modify
                        end
                    end;
                }
                action("Convert to Project")
                {
                    Caption = 'Convert to Project';

                    trigger OnAction()
                    begin
                        //ChangeProjectStatus;
                    end;
                }
                action(recordlinks)
                {
                    Caption = 'recordlinks';

                    trigger OnAction()
                    begin
                        objNewJob.Reset;
                        objNewJob.SetRange(objNewJob."No.", Rec."Project No");
                        //if objNewJob.Find('-') then
                        //RecordLinkMove(Rec,objNewJob);
                    end;
                }
                action(Open)
                {
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    begin
                        if Confirm('Do you want to Re-open the Contract?') then begin
                            Rec."Approval Status" := "Approval Status"::Open;
                            Rec.Modify;
                        end
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Contract Route Sheet")
            {
                Caption = 'Contract Route Sheet';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunPageOnRec = true;

                trigger OnAction()
                begin
                    //      Report project Summary Sheet
                    objjobs.Reset;
                    objjobs.SetRange(objjobs."No.", Rec."No.");
                    //if objjobs.Find('-') then
                    //REPORT.Run(39005815, true, true, objjobs);
                end;
            }
        }
    }

    trigger OnInit()
    begin
        "Currency CodeEditable" := true;
        "Invoice Currency CodeEditable" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        if UserMgt.GetPurchasesFilter <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter);
            Rec.FilterGroup(0);
        end;

        //IF NOT MapMgt.TestSetup THEN
        //  CurrForm.MapPoint.VISIBLE(FALSE);

        CurrencyCheck;
    end;

    var
        Planning: Record "Job-Planning Line";
        AccountedAmount: Decimal;
        GrantSurr: Record "Grant Surrender Header";
        UserMgt: Codeunit "User Setup Management BR";
        [InDataSet]
        "Invoice Currency CodeEditable": Boolean;
        [InDataSet]
        "Currency CodeEditable": Boolean;
        objNewJob: Record Jobs;
        objjobs: Record Jobs;

    //[Scope('Internal')]
    procedure CurrencyCheck()
    begin
        if Rec."Currency Code" <> '' then
            "Invoice Currency CodeEditable" := false
        else
            "Invoice Currency CodeEditable" := true;

        if Rec."Invoice Currency Code" <> '' then
            "Currency CodeEditable" := false
        else
            "Currency CodeEditable" := true;
    end;
}

