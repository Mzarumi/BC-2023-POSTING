page 52186146 "HR BSC Appraisal Header-Q3"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'Manage,Process,Report,Approvals,Functions,Training';
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

                        HRIndividualTargetsHeader.Reset;
                    end;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                }
                field("Appraisal Date"; Rec."Appraisal Date")
                {
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    Editable = false;
                }
                field("Employee No"; Rec."Employee No")
                {
                }
                field("Employee Name"; Rec."Employee Name")
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
                field("Supervisor ID"; Rec."Supervisor ID")
                {
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Financial Targeted Score"; Rec."Financial Targeted Score")
                {
                    Editable = false;
                }
                field("Achieved Financial  Score"; Rec."Achieved Financial  Score")
                {
                    Editable = false;
                }
                field("Unachieved Targets"; Rec."Unachieved Targets")
                {
                    Editable = false;
                }
                field("Training Targeted Score"; Rec."Training Targeted Score")
                {
                    Editable = false;
                }
                field("Training Achieved  Score"; Rec."Training Achieved  Score")
                {
                    Editable = false;
                }
                field("Service Delivery Target Score"; Rec."Service Delivery Target Score")
                {
                    Editable = false;
                }
                field("Service Delivery Achieved"; Rec."Service Delivery Achieved")
                {
                    Editable = false;
                }
                field("Customer Target Score"; Rec."Customer Target Score")
                {
                    Editable = false;
                }
                field("Customer Achieved  Score"; Rec."Customer Achieved  Score")
                {
                    Editable = false;
                }
                field("Finance Rating"; Rec."Finance Rating")
                {
                    Editable = false;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("Finance Rating","Customer Rating","Training Rating","Service Rating",Customer,Training,Service,Finance);
                        IF ("Finance Rating"<>0) AND (Finance<>0)  THEN
                        "Finance Perc Score":=("Finance Rating"*25)/(Finance*5);
                        IF ("Customer Rating"<>0)AND(Customer<>0)THEN
                        "Customer Perc Score":=("Customer Rating"*25)/(Customer*5);
                        IF ("Training Rating"<>0) AND(Training<>0) THEN
                        "Training Perc Score":=("Training Rating"*25)/(Training*5);
                        IF ("Service Rating"<>0) AND (Service<>0)THEN
                        "Service Perc Score":=("Service Rating"*25)/(Service*5);
                        //MESSAGE('%1,%2,%3,%4',"Finance Perc Score","Customer Perc Score","Training Perc Score","Service Perc Score");
                        "Overall Perc Score":="Finance Perc Score"+"Customer Perc Score"+"Training Perc Score"+"Service Perc Score";
                        MODIFY; */

                    end;
                }
                field("Customer Rating"; Rec."Customer Rating")
                {
                    Editable = false;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("Finance Rating","Customer Rating","Training Rating","Service Rating",Customer,Training,Service,Finance);
                        IF ("Finance Rating"<>0) AND (Finance<>0)  THEN
                        "Finance Perc Score":=("Finance Rating"*25)/(Finance*5);
                        IF ("Customer Rating"<>0)AND(Customer<>0)THEN
                        "Customer Perc Score":=("Customer Rating"*25)/(Customer*5);
                        IF ("Training Rating"<>0) AND(Training<>0) THEN
                        "Training Perc Score":=("Training Rating"*25)/(Training*5);
                        IF ("Service Rating"<>0) AND (Service<>0)THEN
                        "Service Perc Score":=("Service Rating"*25)/(Service*5);
                        //MESSAGE('%1,%2,%3,%4',"Finance Perc Score","Customer Perc Score","Training Perc Score","Service Perc Score");
                        "Overall Perc Score":="Finance Perc Score"+"Customer Perc Score"+"Training Perc Score"+"Service Perc Score";
                        MODIFY;*/

                    end;
                }
                field("Training Rating"; Rec."Training Rating")
                {
                    Editable = false;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("Finance Rating","Customer Rating","Training Rating","Service Rating",Customer,Training,Service,Finance);
                        IF ("Finance Rating"<>0) AND (Finance<>0)  THEN
                        "Finance Perc Score":=("Finance Rating"*25)/(Finance*5);
                        IF ("Customer Rating"<>0)AND(Customer<>0)THEN
                        "Customer Perc Score":=("Customer Rating"*25)/(Customer*5);
                        IF ("Training Rating"<>0) AND(Training<>0) THEN
                        "Training Perc Score":=("Training Rating"*25)/(Training*5);
                        IF ("Service Rating"<>0) AND (Service<>0)THEN
                        "Service Perc Score":=("Service Rating"*25)/(Service*5);
                        //MESSAGE('%1,%2,%3,%4',"Finance Perc Score","Customer Perc Score","Training Perc Score","Service Perc Score");
                        "Overall Perc Score":="Finance Perc Score"+"Customer Perc Score"+"Training Perc Score"+"Service Perc Score";
                        MODIFY;*/

                    end;
                }
                field("Service Rating"; Rec."Service Rating")
                {
                    Editable = false;

                    trigger OnValidate()
                    begin
                        /*CALCFIELDS("Finance Rating","Customer Rating","Training Rating","Service Rating",Customer,Training,Service,Finance);
                        IF ("Finance Rating"<>0) AND (Finance<>0)  THEN
                        "Finance Perc Score":=("Finance Rating"*25)/(Finance*5);
                        IF ("Customer Rating"<>0)AND(Customer<>0)THEN
                        "Customer Perc Score":=("Customer Rating"*25)/(Customer*5);
                        IF ("Training Rating"<>0) AND(Training<>0) THEN
                        "Training Perc Score":=("Training Rating"*25)/(Training*5);
                        IF ("Service Rating"<>0) AND (Service<>0)THEN
                        "Service Perc Score":=("Service Rating"*25)/(Service*5);
                        //MESSAGE('%1,%2,%3,%4',"Finance Perc Score","Customer Perc Score","Training Perc Score","Service Perc Score");
                        "Overall Perc Score":="Finance Perc Score"+"Customer Perc Score"+"Training Perc Score"+"Service Perc Score";
                        MODIFY;*/

                    end;
                }
                field("Overall Perc Score"; Rec."Overall Perc Score")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                }
                field("Lock appraisal"; Rec."Lock appraisal")
                {
                }
            }
            part("Financial Targets"; "HR Financial BSC Lines")
            {
                Caption = 'Financial Targets';
                SubPageLink = "Appraisal No" = FIELD("Appraisal No"),
                              "Perspective Code" = CONST(1);
            }
            part("Internal Processes Targets"; "HR Service BSC Lines")
            {
                Caption = 'Internal Processes Targets';
                SubPageLink = "Appraisal No" = FIELD("Appraisal No"),
                              "Perspective Code" = CONST(4);
            }
            part("Customer Targets"; "HR Customer BSC Lines")
            {
                Caption = 'Customer Targets';
                SubPageLink = "Appraisal No" = FIELD("Appraisal No"),
                              "Perspective Code" = CONST(2);
            }
            part("Learning and Growth Targets"; "HR Training Target Lines")
            {
                Caption = 'Learning and Growth Targets';
                SubPageLink = "Appraisal No" = FIELD("Appraisal No"),
                              "Perspective Code" = CONST(3);
            }
            part(Control4; "Performance Attributes Sheet")
            {
                SubPageLink = "Appraisal No" = FIELD("Appraisal No");
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send to supervisor")
            {
                Caption = 'Send to Supervisor';
                Image = SendTo;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin

                    if Confirm('Send this Appraisal to Supervisor?', true) = false then exit;

                    Rec.Status := Rec.Status::"Pending Approval";
                    Rec.Modify;
                end;
            }
            action("Return to Supervisor")
            {
                Caption = 'Return to Supervisor';
                Image = Pause;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    if Confirm('Do you want to return this Appraisal to Supervisor?', true) = false then exit;

                    Rec.Status := Rec.Status::"Pending Approval";
                    Rec.Modify;
                end;
            }
            action("Send back to Target Setting")
            {
                Caption = 'Send Back to Target Setting';
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin

                    if Confirm('Send this Appraisal back to Target Setting?', true) = false then exit;

                    Rec."Appraisal Type" := Rec."Appraisal Type"::"Target Setting";
                    Rec.Modify;
                end;
            }
            action(Action1000000020)
            {
                Caption = 'Print';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = Category5;
            }
            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;

                trigger OnAction()
                begin
                    if Rec."Appraisal Type" = Rec."Appraisal Type"::"Quarter 1" then begin
                        Rec.TestField(Status, Rec.Status::Discussed);
                    end;

                    if Rec."Appraisal Type" = Rec."Appraisal Type"::"Target Setting" then begin
                        Rec.TestField(Status, Rec.Status::Approved);
                    end;

                    if Confirm('Are you sure you want to post?', false) = true then begin
                        // Rec.TestFields;
                        //post
                        HRIndividualTargetsHeader.Reset;
                        HRIndividualTargetsHeader.SetRange(HRIndividualTargetsHeader."Appraisal No", Rec."Appraisal No");
                        if HRIndividualTargetsHeader.Find('-') then begin
                            HRIndividualTargetsHeader.CreateLedgerEntries;
                        end;
                    end;
                end;
            }
            action("Training needs")
            {
                Image = List;
                Promoted = true;
                PromotedCategory = Category6;
                RunObject = Page "M-SACCO Other Services";
                //RunPageLink = Field29 = FIELD("Employee No");
                Visible = false;
            }
            action(Print)
            {
            }
            action("Close Appraisal")
            {
                Image = Close;
                Promoted = true;

                trigger OnAction()
                begin
                    if Confirm('Send this Appraisal to Supervisor?', true) = false then exit;

                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        /* CALCFIELDS("Finance Rating","Customer Rating","Training Rating","Service Rating",Customer,Training,Service,Finance);
         IF ("Finance Rating"<>0) AND (Finance<>0)  THEN
         "Finance Perc Score":=("Finance Rating"*25)/(Finance*5);
         IF ("Customer Rating"<>0)AND(Customer<>0)THEN
         "Customer Perc Score":=("Customer Rating"*25)/(Customer*5);
         IF ("Training Rating"<>0) AND(Training<>0) THEN
         "Training Perc Score":=("Training Rating"*25)/(Training*5);
         IF ("Service Rating"<>0) AND (Service<>0)THEN
         "Service Perc Score":=("Service Rating"*25)/(Service*5);
         //MESSAGE('%1,%2,%3,%4',"Finance Perc Score","Customer Perc Score","Training Perc Score","Service Perc Score");
         "Overall Perc Score":="Finance Perc Score"+"Customer Perc Score"+"Training Perc Score"+"Service Perc Score";
         MODIFY;*/

    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Lock appraisal" = true then
            Error('You connot modify a locked Appraisal');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        if (UserId = xRec."User ID") and (Rec.Status <> Rec.Status::Approved) then
            Error('You have an open appraisal for the current period')
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        //IndividualTarget.VALIDATE(IndividualTarget."Finance Perc Score");
    end;

    trigger OnOpenPage()
    begin
        /*
        IF "Lock appraisal"=TRUE THEN
          CurrPage.EDITABLE:=FALSE;
        */
        //CurrPage.EDITABLE:=FALSE

    end;

    var
        ApprovalEntries: Page "Approval Entries";
        HRIndividualTargetsHeader: Record "HR Individual Targets Header";
        OpenPeriod: Integer;
        AppraisalPeriod: Record "HR Appraisal Period";
        Editpage: Boolean;

    //[Scope('Internal')]
    procedure Testfields()
    begin
        Rec.TestField("Appraisal Period");
        Rec.TestField("Appraisal No");
        Rec.TestField("Appraisal Period");
        Rec.TestField("Appraisal Date");
        Rec.TestField("Employee No");
    end;

    //[Scope('Internal')]
    procedure EditFields()
    begin
        /*
        IF Status<>Status::Open THEN
         Editpage:=FALSE ELSE
         Editpage:=TRUE;
         */

    end;
}

