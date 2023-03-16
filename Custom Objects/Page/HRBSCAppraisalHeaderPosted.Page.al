page 52186537 "HR BSC Appraisal Header Posted"
{
    PageType = Card;
    SourceTable = "HR Individual Targets Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Appraisal No"; Rec."Appraisal No")
                {

                    trigger OnValidate()
                    begin
                        AppraisalPeriod.Reset;
                        AppraisalPeriod.SetRange(AppraisalPeriod.Closed, false);
                        if AppraisalPeriod.Find('-') then begin
                            OpenPeriod := AppraisalPeriod."Appraisal Month"
                        end;

                        IndividualTarget.Reset;
                    end;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                }
                field("Appraisal Date"; Rec."Appraisal Date")
                {
                }
                field("Appraisal Year"; Rec."Appraisal Year")
                {
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("Financial Targeted Score"; Rec."Financial Targeted Score")
                {
                }
                field("Achieved Financial  Score"; Rec."Achieved Financial  Score")
                {
                }
                field("Unachieved Targets"; Rec."Unachieved Targets")
                {
                }
                field("Training Targeted Score"; Rec."Training Targeted Score")
                {
                }
                field("Training Achieved  Score"; Rec."Training Achieved  Score")
                {
                }
                field("Service Delivery Target Score"; Rec."Service Delivery Target Score")
                {
                }
                field("Service Delivery Achieved"; Rec."Service Delivery Achieved")
                {
                }
                field("Customer Target Score"; Rec."Customer Target Score")
                {
                }
                field("Customer Achieved  Score"; Rec."Customer Achieved  Score")
                {
                }
                field("Finance Rating"; Rec."Finance Rating")
                {
                }
                field("Customer Rating"; Rec."Customer Rating")
                {
                }
                field("Training Rating"; Rec."Training Rating")
                {
                }
                field("Service Rating"; Rec."Service Rating")
                {
                }
                field("Overall Perc Score"; Rec."Overall Perc Score")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field(Status; Rec.Status)
                {
                }
            }
            part("Financial Targets"; "HR Financial BSC Lines")
            {
                Caption = 'Financial Targets';
                SubPageLink = "Appraisal No" = FIELD("Appraisal No"),
                              "Perspective Code" = CONST(1);
            }
            part("Service Delivery Targets"; "HR Service BSC Lines")
            {
                Caption = 'Service Delivery Targets';
                SubPageLink = "Appraisal No" = FIELD("Appraisal No"),
                              "Perspective Code" = CONST(4);
            }
            part("Customer Targets"; "HR Customer BSC Lines")
            {
                Caption = 'Customer Targets';
                SubPageLink = "Appraisal No" = FIELD("Appraisal No"),
                              "Perspective Code" = CONST(2);
            }
            part("Training Targets"; "HR Training Target Lines")
            {
                Caption = 'Training Targets';
                SubPageLink = "Appraisal No" = FIELD("Appraisal No"),
                              "Perspective Code" = CONST(3),
                              "Appraisal Period" = FIELD("Appraisal Period");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("&Approvals")
            {
                Caption = '&Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Cash Purchase","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","Employee Transfer","Salary Advance","Staff Clearance",Payroll,Contract,BSC;
                begin
                    DocumentType := DocumentType::BSC;
                    ApprovalEntries.Setfilters(DATABASE::"HR Individual Targets Header", DocumentType, Rec."Appraisal No");
                    ApprovalEntries.Run;
                end;
            }
            action("&Send Approval Request")
            {
                Caption = '&Send Approval Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin


                    if Confirm('Send this Application for Approval?', true) = false then exit;
                    //ApprovalMgt.SendBSCApprovalReq(Rec);
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
                    //ApprovalMgt.CancelBSCRequest(Rec,TRUE,TRUE);
                end;
            }
            action("Re-Open")
            {
                Caption = 'Re-Open';
                Image = ReopenCancelled;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;
                end;
            }
            action(Print)
            {
                Caption = 'Print';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    /*BSC.RESET;
                    BSC.SETRANGE(,"Application Code");
                    IF HRLeaveApp.FIND('-') THEN
                    //REPORT.Run(52185881,TRUE,TRUE,HRLeaveApp); */

                end;
            }
            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to post?') = true then begin
                        if Rec.Status <> Rec.Status::Discussed then Error('The status must be approved to contune');

                        // Rec.TestFields;

                        //post
                        IndividualTarget.Reset;
                        IndividualTarget.SetRange(IndividualTarget."Appraisal No", Rec."Appraisal No");
                        if IndividualTarget.Find('-') then begin
                            IndividualTarget.CreateLedgerEntries;
                        end;
                    end;
                end;
            }
            separator(Action1000000031)
            {
            }
            action("Load Targets")
            {

                trigger OnAction()
                var
                    "Bsc Head": Record "HR Individual Targets Header";
                    "Bsc Line": Record "HR Individual Target Line";
                    I: Integer;
                    "Bsc Line2": Record "HR Individual Target Line";
                begin
                    I := 0;
                    "Bsc Line".Reset;
                    "Bsc Line".FindLast;
                    I := "Bsc Line"."Line No";

                    "Bsc Head".Reset;
                    "Bsc Head".SetRange("Bsc Head"."Appraisal Year", Rec."Appraisal Year");
                    "Bsc Head".SetRange("Bsc Head"."Employee No", Rec."Employee No");
                    if "Bsc Head".Find('-') then begin
                        Message('TESTING');
                        "Bsc Line".Reset;
                        "Bsc Line".SetRange("Bsc Line"."Appraisal No", "Bsc Head"."Appraisal No");
                        if "Bsc Line".Find('-') then begin

                            repeat
                                //I:=I+1;
                                Message('LINE NO %1', I);

                                "Bsc Line2".Init;
                                "Bsc Line2"."Line No" := I;
                                "Bsc Line2"."Appraisal No" := Rec."Appraisal No";
                                "Bsc Line2"."Perspective Code" := "Bsc Line"."Perspective Code";
                                "Bsc Line2"."Targeted Score" := "Bsc Line"."Targeted Score";
                                "Bsc Line2"."Achieved Score" := "Bsc Line"."Achieved Score";
                                "Bsc Line2"."Unachieved Targets" := "Bsc Line"."Unachieved Targets";
                                "Bsc Line2"."Appraisee Comments" := "Bsc Line"."Appraisee Comments";
                                "Bsc Line2".Objective := "Bsc Line".Objective;
                                "Bsc Line2"."Start Date" := "Bsc Line"."Start Date";
                                "Bsc Line2"."End Date" := "Bsc Line"."End Date";
                                "Bsc Line2"."Self Rating" := "Bsc Line"."Self Rating";
                                "Bsc Line2"."Supervisor Rating" := "Bsc Line"."Supervisor Rating";
                                "Bsc Line2"."Agreed Rating" := "Bsc Line"."Agreed Rating";
                                "Bsc Line2"."Appraisal Period" := Rec."Appraisal Period";
                                "Bsc Line2"."Perspective Description" := "Bsc Line"."Perspective Description";
                                "Bsc Line2"."Perspective Type" := "Bsc Line"."Perspective Type";
                                "Bsc Line2".Insert;
                                I := I + 1;
                            until "Bsc Line".Next = 0
                        end
                    end
                end;
            }
        }
    }

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        //IndividualTarget.VALIDATE(IndividualTarget."Finance Perc Score");
    end;

    trigger OnOpenPage()
    begin
        Rec.CalcFields("Finance Rating", "Customer Rating", "Training Rating", "Service Rating", Customer, Training, Service, Finance);
        if (Rec."Finance Rating" <> 0) and (Rec.Finance <> 0) then
            Rec."Finance Perc Score" := (Rec."Finance Rating" * 25) / (Rec.Finance * 5);
        if (Rec."Customer Rating" <> 0) and (Rec.Customer <> 0) then
            Rec."Customer Perc Score" := (Rec."Customer Rating" * 25) / (Rec.Customer * 5);
        if (Rec."Training Rating" <> 0) and (Rec.Training <> 0) then
            Rec."Training Perc Score" := (Rec."Training Rating" * 25) / (Rec.Training * 5);
        if (Rec."Service Rating" <> 0) and (Rec.Service <> 0) then
            Rec."Service Perc Score" := (Rec."Service Rating" * 25) / (Rec.Service * 5);
        Message('%1,%2,%3,%4', Rec."Finance Perc Score", Rec."Customer Perc Score", Rec."Training Perc Score", Rec."Service Perc Score");
        Rec."Overall Perc Score" := Rec."Finance Perc Score" + Rec."Customer Perc Score" + Rec."Training Perc Score" + Rec."Service Perc Score";
        Rec.Modify;
    end;

    var
        ApprovalEntries: Page "Approval Entries";
        IndividualTarget: Record "HR Individual Targets Header";
        OpenPeriod: Integer;
        AppraisalPeriod: Record "HR Appraisal Period";

    //[Scope('Internal')]
    procedure Testfields()
    begin
        Rec.TestField("Appraisal Period");
        Rec.TestField("Appraisal No");
        Rec.TestField("Appraisal Period");
        Rec.TestField("Appraisal Date");
        Rec.TestField("Employee No");

        //Rec.TestField("Financial Targeted Score");
        //Rec.TestField("Achieved Financial  Score");
        //Rec.TestField("Unachieved Targets");
        //Rec.TestField("Training Targeted Score");
        //Rec.TestField("Training Achieved  Score");
        //Rec.TestField("Service Delivery Target Score");
        //Rec.TestField("Service Delivery Achieved");
        //Rec.TestField("Customer Target Score");
        //Rec.TestField("Customer Achieved  Score");
        Rec.TestField("Responsibility Center");
        Rec.TestField(Status);
    end;
}

