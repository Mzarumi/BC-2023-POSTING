page 52186626 "HR Interns Card"
{
    PageType = Card;
    SourceTable = "HR Interns";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Full Name"; Rec."Full Name")
                {
                }
                field(Sex; Rec.Sex)
                {
                }
                field(Ethnicity; Rec.Ethnicity)
                {
                }
                field(Institution; Rec.Institution)
                {
                }
                field("Monthly Stipend"; Rec."Monthly Stipend")
                {
                }
                group(Control25)
                {
                    ShowCaption = false;
                    grid(Control24)
                    {
                        GridLayout = Rows;
                        ShowCaption = false;
                        group(Control23)
                        {
                            ShowCaption = false;
                            field("Course Undertaken"; Rec."Course Undertaken")
                            {
                            }
                            field(Specialization; Rec.Specialization)
                            {
                            }
                        }
                    }
                }
                group(Control21)
                {
                    ShowCaption = false;
                    grid("Posted to")
                    {
                        Caption = 'Posted to';
                        GridLayout = Rows;
                        group(Control13)
                        {
                            ShowCaption = false;
                            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                            {
                            }
                            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                            {
                            }
                        }
                    }
                    group(Control19)
                    {
                        ShowCaption = false;
                        grid("Posted Period")
                        {
                            Caption = 'Posted Period';
                            GridLayout = Rows;
                            group(Control17)
                            {
                                ShowCaption = false;
                                field("Posted Quarter"; Rec."Posted Quarter")
                                {
                                }
                                field("Period Start"; Rec."Period Start")
                                {
                                }
                                field("Period End"; Rec."Period End")
                                {
                                }
                                field("Posting Status"; Rec."Posting Status")
                                {
                                    StyleExpr = StyleText;
                                }
                            }
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
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
        }
    }

    trigger OnAfterGetRecord()
    begin
        StyleText := HRCodeunit.fn_SetStyle(Format(Rec."Posting Status"));
    end;

    var
        StyleText: Text;
        HRCodeunit: Codeunit "HR Codeunit2";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
}

