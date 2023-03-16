page 52186565 "HR Company Activities Card"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Approvals,Functions';
    SaveValues = true;
    SourceTable = "HR Company Activities";

    layout
    {
        area(content)
        {
            group(Control1102755007)
            {
                ShowCaption = false;
                field("Code"; Rec.Code)
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Acitivity Description"; Rec."Acitivity Description")
                {
                    Importance = Promoted;
                }
                field("Start Date"; Rec."Start Date")
                {
                }
                field("End Date"; Rec."End Date")
                {
                }
                field(Venue; Rec.Venue)
                {
                    Importance = Promoted;
                }
                field("Employee Responsible"; Rec."Employee Responsible")
                {
                    Importance = Promoted;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Caption = 'Employee Name';
                    Editable = false;
                }
                field("Email Message"; Rec."Email Message")
                {
                    MultiLine = true;
                }
                field("Activity Status"; Rec."Activity Status")
                {
                    Editable = true;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Closed; Rec.Closed)
                {
                }
            }
            part(Control1102755011; "HR Activity Participants SF")
            {
                SubPageLink = "Document No." = FIELD(Code);
            }
        }
        area(factboxes)
        {
            part(Control1102755024; "HR Company Activities Factbox")
            {
                SubPageLink = Code = FIELD(Code);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                action("Notify Participants")
                {
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = true;

                    trigger OnAction()
                    begin
                        Rec.TestField("Acitivity Description");
                        Rec.TestField("Start Date");
                        Rec.TestField("End Date");
                        Rec.TestField("End Date");
                        Rec.TestField(Venue);
                        Rec.TestField("Email Message");
                        Rec.TestField("Activity Status", Rec."Activity Status"::Planning);

                        HRActPart.Reset;
                        HRActPart.SetRange(HRActPart."Document No.", Rec.Code);
                        if HRActPart.Find('-') then begin
                            //Check if lines filled
                            if HRActPart.Count = 0 then Error('Please suggest participants on Lines');
                            repeat

                            //IF Status = Status::New THEN
                            //ERROR('You Cannot notify a participant when the application is not approved');

                            // SMTP.CreateMessage(HRActPart."Participant E-Mail", HRActPart."Participant E-Mail",
                            //   "Acitivity Description", 'Dear' + ' ' + HRActPart."Participant Name", 'You are hereby notified that the above mentioned subject will he held on,' + Format(Date) + '  ' + 'at' + Venue + '. ' + 'Please plan to attend', true);
                            // SMTP.Send;
                            until HRActPart.Next = 0;
                            Message(HRActPart."Participant E-Mail");
                            Message('notified')

                        end;
                    end;
                }
                action(Close)
                {
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        if Rec."Activity Status" <> Rec."Activity Status"::Complete then
                            Error('You can only close an event after it is complete');

                        Rec.Closed := true;
                        Rec.Modify;
                        Message('Event :: %1 :: has been marked as Closed', Rec."Acitivity Description");
                        //CurrPage.CLOSE;
                    end;
                }
                action("Re-Open")
                {
                    Image = Open;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        Rec.Closed := false;
                        Rec.Modify;
                        Message('Event :: %1 :: has been Re-Opened', Rec."Acitivity Description");
                        //CurrPage.CLOSE;
                    end;
                }
                action(Print)
                {
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        HRCompAct.Reset;
                        HRCompAct.SetRange(HRCompAct.Code, Rec.Code);
                        //if HRCompAct.Find('-') then
                        //REPORT.Run(52185515, true, true, HRCompAct);
                    end;
                }
                action("Get Participants")
                {
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.TestField(Closed, false);

                        //DELETE ANY PREVIOS RECORDS RELATED TO THIS ACTIVITY
                        HRActivityApprovalEntry.SetRange(HRActivityApprovalEntry."Document No.", Rec.Code);
                        if HRActivityApprovalEntry.Find('-') then
                            HRActivityApprovalEntry.DeleteAll;

                        //GET ONLY ACTIVE EMPLOYEES
                        HREmp.Reset;
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        HREmp.FindFirst;
                        begin
                            HRActivityApprovalEntry.Reset;
                            repeat
                                HRActivityApprovalEntry.Init;
                                //HREmp.TestField(HREmp."User ID");
                                HRActivityApprovalEntry.Participant := HREmp."No.";
                                HRActivityApprovalEntry."Participant Name" := HREmp."Full Name";
                                HRActivityApprovalEntry."Participant E-Mail" := HREmp."Company E-Mail";
                                HRActivityApprovalEntry."Document No." := Rec.Code;
                                HRActivityApprovalEntry.Validate(HRActivityApprovalEntry.Participant);
                                HRActivityApprovalEntry.Insert();
                            until HREmp.Next = 0;
                        end;
                    end;
                }
                action("Mark as Ongoing")
                {
                    Image = Start;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        Rec."Activity Status" := Rec."Activity Status"::"On going";
                        Rec.Modify;
                    end;
                }
                action("Mark as Complete")
                {
                    Image = Completed;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        Rec."Activity Status" := Rec."Activity Status"::Complete;
                        //ERROR('Can ')
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateControls;
    end;

    trigger OnInit()
    begin
        // UpdateControls;
    end;

    trigger OnOpenPage()
    begin
        UpdateControls;
    end;

    var
        Text001: Label 'All Participants have been notified via E-Mail';
        HRCompAct: Record "HR Company Activities";
        HRActPart: Record "HR Activity Participants";
        HRActivityApprovalEntry: Record "HR Activity Participants";
        HREmp: Record "HR Employees";
    //SMTP: Codeunit "SMTP Mail";

    //[Scope('Internal')]
    procedure UpdateControls()
    begin
        if Rec.Closed then begin
            CurrPage.Editable := false;
        end else begin
            CurrPage.Editable := true;
        end;
    end;
}

