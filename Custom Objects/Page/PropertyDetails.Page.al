page 52186183 "Property Details"
{
    PageType = Card;
    SourceTable = "Property Details";
    SourceTableView = WHERE("Agreement Status" = FILTER(<> Active),
                            "Property Type" = FILTER(<> 'LAND'));

    layout
    {
        area(content)
        {
            group("Property Information")
            {
                Caption = 'Property Information';
                field("No."; Rec."No.")
                {
                    Editable = true;
                }
                field("L.R. No."; Rec."L.R. No.")
                {
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Property Name';
                }
                field("Landlord No."; Rec."Landlord No.")
                {
                }
                field("Landlord Name"; Rec."Landlord Name")
                {
                    Editable = false;
                }
                field(City; Rec.City)
                {
                }
                field(Street; Rec.Street)
                {
                }
                field("Property Type"; Rec."Property Type")
                {
                    LookupPageID = "Property Category";

                    trigger OnValidate()
                    begin
                        if Rec."Property Type" = 'RESIDENTIAL' then begin
                            "Total Area sq ftVisible" := false;
                        end
                        else
                            if Rec."Property Type" = 'COMMERCIAL' then begin
                                "Total Area sq ftVisible" := true;
                            end;
                        if Rec."Property Type" = 'LAND' then begin
                            Error(PTypeErr);
                        end
                    end;
                }
                field("Property Code"; Rec."Property Code")
                {
                    Caption = 'Department Code';
                }
                field("Department name"; Rec."Department name")
                {
                    Editable = false;
                }
                field("Total Area sq ft"; Rec."Total Area sq ft")
                {
                    Editable = true;
                    Visible = "Total Area sq ftVisible";
                }
                field("total Units"; Rec."total Units")
                {
                    Caption = 'Total Units';
                    Editable = false;
                    Importance = Promoted;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                }
                field("Agreement Status"; Rec."Agreement Status")
                {
                    Caption = 'Contract Status';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
            }
            part("Property Lines"; Floor)
            {
                SubPageLink = "No." = FIELD("No.");
            }
            group("Other Details")
            {
                Caption = 'Other Details';
                field("File Ref No."; Rec."File Ref No.")
                {
                }
                field("Commence Date"; Rec."Commence Date")
                {
                    Caption = 'Contract Commence Date';
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin

                        /*
                        //is obsolete in 2015
                        FrmCalendar.SetDate("Commence Date");
                        FrmCalendar.RUNMODAL;
                        D := FrmCalendar.GetDate;
                        CLEAR(FrmCalendar);
                        IF D <> 0D THEN
                         "Commence Date":= D;
                         */

                    end;
                }
                field("Duration Type"; Rec."Duration Type")
                {
                    Visible = false;
                }
                field("Duration Value"; Rec."Duration Value")
                {
                    Visible = false;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    Caption = 'Contract Expiry Date';
                    Editable = false;
                    Visible = false;
                }
            }
            group("Management Fees")
            {
                Caption = 'Management Fees';
                Visible = false;
                field("Commission Rate"; Rec."Commission Rate")
                {
                    Caption = 'Management Fee Rate';
                }
                field("Commision Flat Amount"; Rec."Commision Flat Amount")
                {
                    Caption = 'Management Fee Amount';
                }
                field("Letting Fee Rate(%)"; Rec."Letting Fee Rate(%)")
                {
                }
                field("Letting Flat Amount"; Rec."Letting Flat Amount")
                {
                }
                field("Reletting Fee Rate(%)"; Rec."Reletting Fee Rate(%)")
                {
                }
                field("Reletting Flat Amount"; Rec."Reletting Flat Amount")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Property)
            {
                Caption = 'Property';
                action(Caretakers)
                {
                    Caption = 'Caretakers';
                    Image = EditCustomer;
                    RunObject = Page "Caretaker List";
                }
                separator(Action1102755032)
                {
                }
                action(Charges)
                {
                    Caption = 'Charges';
                    RunObject = Page "Property Charges";
                    RunPageLink = "Property Code" = FIELD("No.");
                    Visible = false;
                }
                action("Activate Property")
                {
                    Caption = 'Activate Property';
                    Image = Allocations;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);

                        if Confirm('Are you sure you what to Activate property') = true then begin
                            Rec."Agreement Status" := Rec."Agreement Status"::Active;
                            Rec."Time Property Created" := Time;
                            Rec."Property Created By" := UserId;
                            Rec.Modify;
                        end
                        else begin
                            exit
                        end;
                    end;
                }
                action("Terminate Property")
                {
                    Caption = 'Terminate Property';
                    Image = Cancel;

                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::Approved);

                        if Confirm('Are you sure you what to Terminate property') = true then begin
                            Rec."Agreement Status" := Rec."Agreement Status"::Terminated;
                            Rec."Time Property Created" := Time;
                            Rec."Property Created By" := UserId;
                            Rec.Modify;
                        end
                        else begin
                            exit
                        end;
                    end;
                }
            }
            group(Action2)
            {
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin


                        if Rec.Status = Rec.Status::Approved then begin
                            Error('Property Approval Request has Already been Approved');
                        end
                        else
                            if Rec.Status = Rec.Status::"Pending Approval" then begin
                                Error('Property Approval Request is Already at the Pending Level');
                            end
                            else
                                VarVariant := Rec;
                        // if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                        //     CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    //CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        //CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
            }
        }
    }

    trigger OnInit()
    begin
        "Total Area sq ftVisible" := true;
    end;

    var
        FrmCalendar: Page "Units Meter Rating";
        D: Date;
        [InDataSet]
        "Total Area sq ftVisible": Boolean;
        PTypeErr: Label 'LAND Cannot be a Property Type for this Building';
        VarVariant: Variant;
}

