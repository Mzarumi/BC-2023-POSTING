page 52185835 "Investment Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Investment Header";
    SourceTableView = WHERE("Asset Type" = CONST("Money Market"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Investment No"; Rec."Investment No")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                    Editable = false;
                }
                field("Investment Type Code"; Rec."Investment Type Code")
                {
                    Editable = InvTcode;
                }
                field("Investment Type Description"; Rec."Investment Type Description")
                {
                }
                field(Institution; Rec.Institution)
                {
                    Editable = Inst;
                }
                field("Institution Name"; Rec."Institution Name")
                {
                }
                field("Vendor Credit Limit(LCY)"; Rec."Vendor Credit Limit(LCY)")
                {
                    Editable = false;
                }
                field("Available Amount"; Rec."Available Amount")
                {
                    Editable = false;
                }
                field("Deposit Type"; Rec."Deposit Type")
                {
                    Editable = DepType;
                }
                field("Interest Mode"; Rec."Interest Mode")
                {
                    Editable = IntMode;

                    trigger OnValidate()
                    begin
                        /*IF Status=Status::FulFilled THEN
                        FullFill:=TRUE
                        ELSE
                        IF Status=Status::Approved THEN
                        Approved:=TRUE
                        ELSE
                        FullFill:=TRUE;
                        IF "Interest Mode"="Interest Mode"::Advance THEN
                        WhtVissible:=FALSE
                        ELSE
                        WhtVissible:=TRUE;
                        */

                    end;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Editable = CurrCode;

                    trigger OnValidate()
                    begin
                        /*IF "Currency Code"<>'NGN' THEN
                        Forex:=TRUE;
                        */

                    end;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = RespCenter;
                }
                field(Remarks; Rec.Remarks)
                {
                    Editable = Rmks;
                }
                group(Control25)
                {
                    ShowCaption = false;
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    Editable = WtaxCode;
                }
                field("Investment Date"; Rec."Investment Date")
                {
                    Caption = 'Proposed Value Date';
                    Editable = INVdate;
                }
                field("Period Type"; Rec."Period Type")
                {
                    Editable = pType;
                }
                field("Frequency Period"; Rec."Frequency Period")
                {
                    Editable = Freq;
                }
                field(Tenor; Rec.Tenor)
                {
                    Editable = false;
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    Editable = false;
                }
                field("Expected Payment Date"; Rec."Expected Payment Date")
                {
                    Editable = false;
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    Editable = Intrate;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field("Date Posted"; Rec."Date Posted")
                {
                    Editable = false;
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
            }
            part(Control4; "Money Market Subform")
            {
                Editable = Mmarketpage;
                SubPageLink = "Investment No" = FIELD("Investment No");
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Print Requisition")
            {
                Caption = 'Print Requisition';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                Visible = false;

                trigger OnAction()
                begin
                    /*PV.RESET;
                    PV.SETRANGE(PV."Requisition No.","Request No.");
                    IF PV.FIND('-') THEN
                    //REPORT.Run(39005736,TRUE,TRUE,PV);
                    */

                end;
            }
        }
        area(processing)
        {
            action("Check Compliance")
            {
                Image = CalculateHierarchy;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    //ComplianceChecking()
                end;
            }
            action("Place Deal")
            {
                Image = Purchase;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::Fulfilled) then begin

                        PaymentsHeader.Reset;//39005566
                        PaymentsHeader.SetRange(PaymentsHeader."Creation Doc Type", PaymentsHeader."Creation Doc Type"::Investment);
                        PaymentsHeader.SetRange(PaymentsHeader."Creation Doc No.", Rec."Investment No");
                        if PaymentsHeader.Find('-') then begin

                            if PaymentsHeader.Posted = false then
                                PAGE.Run(52185890, PaymentsHeader)
                            else
                                PAGE.Run(52185992, PaymentsHeader);
                        end else begin
                            Rec.CreatePaymentDoc;
                        end;
                    end else
                        Error(DocMustbeApprovedorFulfilled);
                end;
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Comments";
                    Visible = OpenApprovalEntriesExistForCurrUser;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin


                        Rec.TestField("Investment Type Code");
                        Rec.TestField(Institution);
                        Rec.TestField("Responsibility Center");
                        Rec.TestField("Withholding Tax Code");
                        Rec.TestField("Investment Date");
                        Rec.TestField("Frequency Period");
                        Rec.TestField("Interest Rate");

                        if Rec.Status <> Rec.Status::Open then
                            Error(DocMustbeOpen);

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        if Rec.Status <> Rec.Status::"Pending Approval" then
                            Error(DocMustbePending);

                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        UpdateControls;
    end;

    trigger OnInit()
    begin
        UpdateControls;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Asset Type" := Rec."Asset Type"::"Money Market";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Asset Type" := Rec."Asset Type"::"Money Market";
    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        DocMustbeOpen: Label 'This application request must be open';
        DocMustbePending: Label 'This application request must be Pending';
        InvTcode: Boolean;
        Inst: Boolean;
        DepType: Boolean;
        IntMode: Boolean;
        CurrCode: Boolean;
        RespCenter: Boolean;
        Rmks: Boolean;
        WtaxCode: Boolean;
        INVdate: Boolean;
        pType: Boolean;
        Freq: Boolean;
        Intrate: Boolean;
        Mmarketpage: Boolean;
        DocMustbeApprovedorFulfilled: Label 'This application request must be approved';
        PaymentsHeader: Record "Payments Header";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    local procedure UpdateControls()
    begin

        if Rec.Status = Rec.Status::Open then begin
            InvTcode := true;
            Inst := true;
            DepType := false;
            IntMode := false;
            CurrCode := true;
            RespCenter := true;
            Rmks := true;
            WtaxCode := true;
            INVdate := true;
            pType := true;
            Freq := true;
            Intrate := true;
            Mmarketpage := true;
        end;


        if Rec.Status = Rec.Status::"Pending Approval" then begin
            InvTcode := false;
            Inst := false;
            DepType := false;
            IntMode := false;
            CurrCode := false;
            RespCenter := false;
            Rmks := false;
            WtaxCode := false;
            INVdate := false;
            pType := false;
            Freq := false;
            Intrate := false;
            Mmarketpage := false;
        end;


        if Rec.Status = Rec.Status::Rejected then begin
            InvTcode := false;
            Inst := false;
            DepType := false;
            IntMode := false;
            CurrCode := false;
            RespCenter := false;
            Rmks := false;
            WtaxCode := false;
            INVdate := false;
            pType := false;
            Freq := false;
            Intrate := false;
            Mmarketpage := false;
        end;

        if Rec.Status = Rec.Status::Approved then begin
            InvTcode := false;
            Inst := false;
            DepType := false;
            IntMode := false;
            CurrCode := false;
            RespCenter := false;
            Rmks := false;
            WtaxCode := false;
            INVdate := false;
            pType := false;
            Freq := false;
            Intrate := false;
            Mmarketpage := false;
        end;

        if Rec.Status = Rec.Status::Fulfilled then begin
            InvTcode := false;
            Inst := false;
            DepType := false;
            IntMode := false;
            CurrCode := false;
            RespCenter := false;
            Rmks := false;
            WtaxCode := false;
            INVdate := false;
            pType := false;
            Freq := false;
            Intrate := false;
            Mmarketpage := false;
        end;
    end;
}

