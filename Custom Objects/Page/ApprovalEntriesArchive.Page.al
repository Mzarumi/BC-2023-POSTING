page 52186319 "Approval Entries Archive"
{
    Caption = 'Approval Entries';
    Editable = false;
    PageType = List;
    SourceTable = "Approval Entry Archive";
    SourceTableView = SORTING("Record ID to Approve", "Workflow Step Instance ID", "Sequence No.")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                // field(Overdue; Rec.Overdue)
                // {
                //     Caption = 'Overdue';
                //     Editable = false;
                //     ToolTip = 'Overdue Entry';
                // }
                field("Table ID"; Rec."Table ID")
                {
                    Visible = false;
                }
                field("Limit Type"; Rec."Limit Type")
                {
                }
                field("Approval Type"; Rec."Approval Type")
                {
                }
                field("Document Type"; Rec."Document Type")
                {
                    Visible = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    Visible = false;
                }
                // field(Rec.RecordIdText; Rec.RecordIDText)
                // {
                //     Caption = 'To Approve';
                // }
                field(RecordDetails; Rec.RecordDetails)
                {
                    Caption = '';
                }
                field("Sequence No."; Rec."Sequence No.")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Sender ID"; Rec."Sender ID")
                {
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                }
                field("Approver ID"; Rec."Approver ID")
                {
                }
                field("Currency Code"; Rec."Currency Code")
                {
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                }
                field("Available Credit Limit (LCY)"; Rec."Available Credit Limit (LCY)")
                {
                }
                field("Date-Time Sent for Approval"; Rec."Date-Time Sent for Approval")
                {
                }
                field("Last Date-Time Modified"; Rec."Last Date-Time Modified")
                {
                }
                field("Last Modified By User ID"; Rec."Last Modified By User ID")
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Due Date"; Rec."Due Date")
                {
                }
            }
        }
        area(factboxes)
        {
            part(Change; "Workflow Change List FactBox")
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                UpdatePropagation = SubPart;
                Visible = ShowChangeFactBox;
            }
            systempart(Control5; Links)
            {
                Visible = false;
            }
            systempart(Control4; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                Image = View;
                action("Record")
                {
                    Caption = 'Record';
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        Rec.ShowRecord;
                    end;
                }
                action(Comments)
                {
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovalCommentLine: Record "Approval Comment Line";
                    begin
                        //ApprovalCommentLine.SetRange("Table ID",ApprovalCommentLine));
                        // ApprovalCommentLine.SetRange("Record ID to Approve", "Record ID to Approve");
                        PAGE.Run(PAGE::"Approval Comments", ApprovalCommentLine);
                    end;
                }
                action("O&verdue Entries")
                {
                    Caption = 'O&verdue Entries';
                    Image = OverdueEntries;

                    // trigger OnAction()
                    // begin
                    //     Rec.SetFilter(Status, '%1|%2', Rec.Status::Created, Rec.Status::Open);
                    //     Rec.SetFilter("Due Date", '<%1', Today);
                    // end;
                }
                action("All Entries")
                {
                    Caption = 'All Entries';
                    Image = Entries;

                    // trigger OnAction()
                    // begin
                    //     Rec.SetRange(Status);
                    //     Rec.SetRange("Due Date");
                    // end;
                }
            }
        }
        area(processing)
        {
            action("&Delegate")
            {
                Caption = '&Delegate';
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ApprovalEntry: Record "Approval Entry";
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                begin
                    CurrPage.SetSelectionFilter(ApprovalEntry);
                    ApprovalsMgmt.DelegateApprovalRequests(ApprovalEntry);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        //ShowChangeFactBox := CurrPage.Change.PAGE.SetFilterFromApprovalEntry(Rec);
    end;

    trigger OnAfterGetRecord()
    begin
        Overdue := Overdue::" ";
        if FormatField(Rec) then
            Overdue := Overdue::Yes;


        // RecordIDText := Format(Rec."Record ID to Approve", 0, 1);

    end;

    // trigger OnOpenPage()
    // begin
    //     if Usersetup.Get(UserId) then
    //         Rec.SetCurrentKey("Table ID", "Document Type", "Document No.");
    // end;

    var
        Usersetup: Record "User Setup";
        Overdue: Option Yes," ";
    //    (Rec.RecordIdText: Text;
        ShowChangeFactBox: Boolean;

    //[Scope('Internal')]
    procedure Setfilters(TableId: Integer; DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"; DocumentNo: Code[20])
    begin
        if TableId <> 0 then begin
            Rec.FilterGroup(2);
            // Rec.SetCurrentKey("Table ID", "Document Type", "Document No.");
            // Rec.SetRange("Table ID", TableId);
            // Rec.SetRange("Document Type", DocumentType);
            // if DocumentNo <> '' then
            //     Rec.SetRange("Document No.", DocumentNo);
            // Rec.FilterGroup(0);
        end;
    end;

    local procedure FormatField(ApprovalEntry: Record "Approval Entry Archive"): Boolean
    begin
        if Rec.Status in [Rec.Status::Created, Rec.Status::Open] then begin
            if ApprovalEntry."Due Date" < Today then
                exit(true);

            exit(false);
        end;
    end;

    //[Scope('Internal')]
    procedure CalledFrom()
    begin
        Overdue := Overdue::" ";
    end;
}

