page 52186485 "HR Training Needs Card"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approvals,Training Need';
    SourceTable = "HR Training Needs";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = FieldEditable;
                group(Control44)
                {
                    ShowCaption = false;
                    grid(Control43)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control42)
                        {
                            ShowCaption = false;
                            field("Code"; Rec.Code)
                            {
                            }
                            field(Description; Rec.Description)
                            {
                                NotBlank = true;
                                ShowMandatory = true;
                            }
                        }
                    }
                }
                field("Training Category"; Rec."Training Category")
                {
                }
                field("Training Type"; Rec."Training Type")
                {
                }
                field("Total Costs"; Rec."Total Costs")
                {
                    Enabled = false;
                }
                field("Need Source"; Rec."Need Source")
                {
                    ShowMandatory = true;
                }
                group(Control41)
                {
                    ShowCaption = false;
                    grid(Control40)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control32)
                        {
                            ShowCaption = false;
                            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                            {
                            }
                            field("Responsibility Center"; Rec."Responsibility Center")
                            {
                            }
                            field(Status; Rec.Status)
                            {
                            }
                            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                            {
                            }
                        }
                    }
                }
                group(Control36)
                {
                    ShowCaption = false;
                    grid(Control35)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control34)
                        {
                            ShowCaption = false;
                            field("Start Date"; Rec."Start Date")
                            {
                                ShowMandatory = true;
                            }
                            field("End Date"; Rec."End Date")
                            {
                            }
                            field("Re-Assessment Date"; Rec."Re-Assessment Date")
                            {
                            }
                        }
                    }
                }
                group(Control39)
                {
                    ShowCaption = false;
                    grid(Control38)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control37)
                        {
                            ShowCaption = false;
                            field(Location; Rec.Location)
                            {
                            }
                            field(Provider; Rec.Provider)
                            {
                            }
                            field("Provider Name"; Rec."Provider Name")
                            {
                            }
                            field("Other Provider"; Rec."Other Provider")
                            {
                            }
                        }
                    }
                }
            }
            group(Bonding)
            {
                Caption = 'Bonding';
                Editable = FieldEditable;
                field("Bondage Required?"; Rec."Bondage Required?")
                {
                }
                field("Bondage Start Date"; Rec."Bondage Start Date")
                {
                }
                field("Bondage Duration"; Rec."Bondage Duration")
                {
                }
                field("Bondage Release Date"; Rec."Bondage Release Date")
                {
                }
                field("Allow Early Exit if Bonded?"; Rec."Allow Early Exit if Bonded?")
                {
                    Caption = 'Allow Early Exit with Conditions? If its a Bonded Training';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
            }
            systempart(Control25; Notes)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Functions")
            {
                Caption = '&Functions';
                action("Training Costs")
                {
                    Caption = 'Training Costs';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Training Cost";
                    RunPageLink = "Training ID" = FIELD(Code);
                }
                action("Training Bonding Conditions")
                {
                    Caption = 'Training Bonding Conditions';
                    Image = BOM;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Training Bonding Cond. List";
                    RunPageLink = "Training Bonding Code" = FIELD(Code);
                }
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
                        //Rec.TestField("No of Posts");
                        /*Rec.TestField("Document No.");
                        Rec.TestField(Description);
                        Rec.TestField("Interest Due Date");*/
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
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        approvalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
            group(Functions)
            {
                Caption = 'Functions';
                action(Close)
                {
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Confirm(Txt001, true) = false then exit;
                        Rec.Closed := true;
                    end;
                }
                action("Re-Open")
                {
                    Image = OpenJournal;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Confirm(Txt002, true) = false then exit;
                        Rec.Closed := false;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControls;
    end;

    trigger OnAfterGetRecord()
    begin
        UpdateControls;
    end;

    trigger OnInit()
    begin
        UpdateControls;
    end;

    trigger OnOpenPage()
    begin
        UpdateControls;
    end;

    var
        HRTrainingBondingCond: Record "HR Training Bonding Conditions";
        FieldEditable: Boolean;
        Txt001: Label 'Do you want to close this training need?';
        Txt002: Label 'Do you want to reopen this training need?';
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        HRCodeunit: Codeunit "HR Codeunit2";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        OpenApprovalEntriesExist: Boolean;

    local procedure UpdateControls()
    begin
        if Rec.Closed = true then begin
            FieldEditable := false;
        end else begin
            FieldEditable := true;
        end;
    end;
}

