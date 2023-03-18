page 52186053 "Overtime Claim List-Cancelled"
{
    CardPageID = "Overtime Claim Header";
    Editable = false;
    PageType = List;
    SourceTable = "Overtime Claim Header";
    SourceTableView = WHERE(Status = CONST(Cancelled));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Claim No"; Rec."Claim No")
                {
                }
                field("Date Created"; Rec."Date Created")
                {
                }
                field("Created By"; Rec."Created By")
                {
                }
                field("Staff No."; Rec."Staff No.")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Department; Rec.Department)
                {
                }
                field("Total Overtime Week Days"; Rec."Total Overtime Week Days")
                {
                    Visible = false;
                }
                field("Total Overtime Weekend & Holid"; Rec."Total Overtime Weekend & Holid")
                {
                    Visible = false;
                }
                field("Total Overtime Hrs"; Rec."Total Overtime Hrs")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print/Preview")
            {
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Approved);

                    Rec.Reset;
                    Rec.SetFilter("Claim No", Rec."Claim No");
                    //REPORT.Run(39005909, true, true, Rec);
                    Rec.Reset;
                end;
            }
            separator(Action15)
            {
            }
            action("Cancel Document")
            {
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Text000: Label 'Are you sure you want to cancel this Document?';
                    Text001: Label 'You have selected not to Cancel the Document';
                begin

                    Rec.TestField(Status, Rec.Status::Approved);
                    if Confirm(Text000, true) then begin
                        Rec.Status := Rec.Status::Cancelled;
                        Rec.Modify;
                    end else
                        Error(Text001);
                end;
            }
            group(Navigate)
            {
                Caption = 'Navigate';
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*
                        DocumentType := DocumentType::"Payment Voucher";
                        ApprovalEntries.Setfilters(DATABASE::"Payments Header","Document Type","No.");
                        ApprovalEntries.RUN;
                        */
                        ApprovalsMgmt.OpenApprovalEntriesPage(Rec.RecordId)

                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ActivatControls;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter();

        ActivatControls;
    end;

    trigger OnOpenPage()
    begin

        if UserMgt.GetPurchasesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetPurchasesFilter());
            Rec.FilterGroup(0);
        end;
        ActivatControls;
    end;

    var
        ApprovalEntries: Page "Approval Entries";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,TravelConference;
        DocPrint: Codeunit "Document-Print";
        CheckLedger: Record "Check Ledger Entry";
        CheckManagement: Codeunit CheckManagement;
        HasLines: Boolean;
        ApprovalEntry: Record "Approval Entry";
        UserMgt: Codeunit "User Setup Management BR";
        AllKeyFieldsEntered: Boolean;

    //[Scope('Internal')]
    procedure ActivatControls()
    begin
        /*
          IF Status <> Status::Pending THEN BEGIN
                CurrPage.Lines.EDITABLE :=FALSE;
                CurrPage."Responsibility Center".EDITABLE := FALSE;
                CurrPage.Department.EDITABLE := FALSE;
        
                CurrPage.UPDATECONTROLS;
          END ELSE BEGIN
               CurrPage.Lines.EDITABLE :=TRUE;
               CurrPage."Responsibility Center".EDITABLE := TRUE;
                CurrPage.Department.EDITABLE := TRUE;
        
               CurrPage.UPDATECONTROLS;
          END
        */

    end;

    //[Scope('Internal')]
    procedure AllFieldsEntered(): Boolean
    var
        OTLines: Record "Overtime Claim Lines";
    begin
        AllKeyFieldsEntered := true;
        OTLines.Reset;
        OTLines.SetRange(OTLines."Claim No", Rec."Claim No");
        if OTLines.Find('-') then begin
            repeat
                if (OTLines."Work Description/Reason" = '') or (OTLines.Amount <= 0) or (OTLines.Date = 0D) then
                    AllKeyFieldsEntered := false;
            until OTLines.Next = 0;
            exit(AllKeyFieldsEntered);
        end;
    end;
}

