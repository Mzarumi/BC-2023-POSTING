page 52185760 "Loan Disbursement Header"
{
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    RefreshOnActivate = true;
    SourceTable = "Loan Disbursement Header";

    layout
    {
        area(content)
        {
            group(Control1)
            {
                Editable = ApprovedEdit;
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                }
                field("Subsequent Disbursements"; Rec."Subsequent Disbursements")
                {

                    trigger OnValidate()
                    begin
                        if Rec."Subsequent Disbursements" = Rec."Subsequent Disbursements"::Yes then
                            SubseqDisb := true
                        else
                            SubseqDisb := false;
                    end;
                }
                field("Disbursement Destination"; Rec."Disbursement Destination")
                {
                }
                field("Disburse Accounts"; Rec."Disburse Accounts")
                {
                }
                field(Name; Rec.Name)
                {
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                }
                field("Special Processing Commission"; Rec."Special Processing Commission")
                {
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Visible = false;
                }
                field("Date Posted"; Rec."Date Posted")
                {
                }
                field("Time Posted"; Rec."Time Posted")
                {
                }
                field("Total Amount"; Rec."Total Amount")
                {
                }
                field(Status; Rec.Status)
                {
                    Editable = true;
                }
                field("Prepared By"; Rec."Prepared By")
                {
                }
                field(Posted; Rec.Posted)
                {
                    Editable = false;
                }
                group("Partial Disbursements")
                {
                    Visible = SubseqDisb;
                    field("Issued Date From"; Rec."Issued Date From")
                    {
                    }
                    field("Issued Date To"; Rec."Issued Date To")
                    {
                        Editable = SubseqDisb;
                        Visible = SubseqDisb;
                    }
                    field("Member No"; Rec."Member No")
                    {
                    }
                }
            }
            part(PVLines; "Loan Disbursement Lines")
            {
                SubPageLink = No = FIELD("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.TestField(Posted, false);
                    Rec.TestField(Status, Rec.Status::Approved);
                    if Rec."Disbursement Destination" <> Rec."Disbursement Destination"::Normal then
                        Rec.TestField("Disburse Accounts");
                    if Rec."Subsequent Disbursements" = Rec."Subsequent Disbursements"::No then
                        Posting.PostLoan(Rec."No.")
                    else
                        Posting."PostLoan Subsequent Disbursements"(Rec."No.");

                    //Send SMS when Topup
                    DSLines.Reset;
                    DSLines.SetRange(No, Rec."No.");
                    if DSLines.FindFirst then begin
                        repeat
                            LoansTopUp.Reset;
                            LoansTopUp.SetRange("Loan No.", DSLines."Loan No.");
                            if LoansTopUp.FindFirst then begin
                                repeat
                                    LoanGuar.Reset;
                                    LoanGuar.SetRange("Loan No", LoansTopUp."Loan Top Up");
                                    LoanGuar.SetRange("Self Guarantee", false);
                                    if LoanGuar.FindFirst then begin
                                        if Loans2.Get(LoanGuar."Loan No") then begin
                                            ProductType := Loans2."Loan Product Type Name";
                                            AppAmount := Loans2."Approved Amount";
                                        end;
                                        repeat
                                            if Members.Get(LoanGuar."Member No") then
                                                CompInfo.Get;
                                            SendSms.SendSms(SourceType::"Loan Guarantors", Members."Mobile Phone No",
                                            'Dear ' + LoanGuar.Name + ', The ' + ProductType + ' of Ksh. ' + Format(AppAmount) + ', you had guaranteed ' + LoanGuar."Loanee Name" + ' is now fully repaid.',
                                            Loans2."Loan No.", Loans2."Disbursement Account No", false);

                                        until LoanGuar.Next = 0;
                                    end;
                                until LoansTopUp.Next = 0;
                            end;
                        until DSLines.Next = 0;
                    end;


                    //Set FOSA Savings Account to Frozen
                    DSLines.Reset;
                    DSLines.SetRange(No, Rec."No.");
                    if DSLines.FindFirst then begin
                        repeat
                            LoanGuar.Reset;
                            LoanGuar.SetRange("Loan No", DSLines."Loan No.");
                            LoanGuar.SetFilter("Guarantor Type", '%1', LoanGuar."Guarantor Type"::Collateral);
                            if LoanGuar.FindFirst then
                                SavingsAccounts.Reset;
                            SavingsAccounts.SetRange("Member No.", LoanGuar."Savings Account No./Member No.");
                            SavingsAccounts.SetRange("Loan Disbursement Account", true);
                            if SavingsAccounts.FindFirst then begin
                                SavingsAccounts.Status := SavingsAccounts.Status::Frozen;
                                SavingsAccounts."Status Change Reason" := 'FROZEN: Refer to Investment Manager';
                                SavingsAccounts.Modify;
                            end;
                        until DSLines.Next = 0;
                    end;
                end;
            }
            separator(Action12)
            {
            }
            action("Suggest Disbursements")
            {
                Image = SuggestCustomerBill;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //Validations
                    DisbLines.Reset;
                    DisbLines.SetRange(DisbLines.No, Rec."No.");
                    DisbLines.SetRange(Posted, false);
                    if DisbLines.Find('-') then begin
                        if Confirm('The lines will be deleted and recreated. Are you sure you want to proceed?', false) = true then
                            DisbLines.DeleteAll
                        else begin
                            Message('Proceed and process. The lines will not be regenerated');
                            exit;
                        end;
                    end;



                    Loans.Reset;
                    Loans.SetRange(Loans.Status, Loans.Status::Approved);
                    Loans.SetRange(Loans.Posted, false);
                    Loans.SetRange(Loans."Batch No.", Rec."No.");
                    if Loans.Find('-') then begin
                        repeat
                            if (Loans.Status <> Loans.Status::Approved) and (Loans.Status <> Loans.Status::Rejected) then
                                Error(LoanNotApproved, Loans."Loan No.");
                            EntryNo := EntryNo + 1000;
                            DisbLines.Init;
                            DisbLines."Line No." := EntryNo;
                            DisbLines."Loan No." := Loans."Loan No.";
                            DisbLines.Validate(DisbLines."Loan No.");
                            DisbLines."Global Dimension 1 Code" := Loans."Global Dimension 1 Code";
                            DisbLines."Global Dimension 2 Code" := Loans."Global Dimension 2 Code";
                            DisbLines.No := Rec."No.";
                            DisbLines.Insert;
                        //Tag that it has been suggested
                        //Loans."Already Suggested":=TRUE;
                        //Loans.MODIFY;
                        until Loans.Next = 0;
                    end else
                        Message("MissingLoans:");




                    /*
                    IF "Subsequent Disbursements"="Subsequent Disbursements"::Yes THEN
                      ERROR(Text003);
                    
                    GetIfNothingSelected;
                    
                    IF ("Issued Date From"<>0D ) AND ("Issued Date To"=0D) THEN
                      ERROR("LoanDateErr:");
                    
                    IF ("Issued Date From"=0D ) AND ("Issued Date To"<>0D) THEN
                      ERROR("LoanDateErr:");
                    
                    IF "Issued Date From">"Issued Date To" THEN
                      ERROR("LoanDateErr:");
                    
                    
                    //Date only placed--1
                    IF ("Loan Product Type"='') AND ("Global Dimension 1 Code"='') AND ("Global Dimension 2 Code"='') AND ("Issued Date From"<>0D) AND ("Issued Date To"<>0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Disbursement Date","Issued Date From","Issued Date To");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    //"Loan Product Type" only placed--2
                    
                    IF ("Loan Product Type"<>'') AND ("Global Dimension 1 Code"='') AND ("Global Dimension 2 Code"='') AND ("Issued Date From"=0D) AND ("Issued Date To"=0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Loan Product Type","Loan Product Type");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //Dim one only--3
                    IF ("Loan Product Type"='') AND ("Global Dimension 1 Code"<>'') AND ("Global Dimension 2 Code"='') AND ("Issued Date From"=0D) AND ("Issued Date To"=0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Global Dimension 1 Code","Global Dimension 1 Code");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //Dim 2 only--4
                    
                    IF ("Loan Product Type"<>'') AND ("Global Dimension 1 Code"='') AND ("Global Dimension 2 Code"<>'') AND ("Issued Date From"=0D) AND ("Issued Date To"=0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Global Dimension 2 Code","Global Dimension 2 Code");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //Dates and Loan type placed--5
                    IF ("Loan Product Type"<>'') AND ("Global Dimension 1 Code"='') AND ("Global Dimension 2 Code"='') AND ("Issued Date From"<>0D) AND ("Issued Date To"<>0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Loan Product Type","Loan Product Type");
                    Loans.SETRANGE(Loans."Disbursement Date","Issued Date From","Issued Date To");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //"Loan Product Type" and Dim1 placed--6
                    IF ("Loan Product Type"<>'') AND ("Global Dimension 1 Code"<>'') AND ("Global Dimension 2 Code"='') AND ("Issued Date From"=0D) AND ("Issued Date To"=0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Loan Product Type","Loan Product Type");
                    Loans.SETRANGE(Loans."Global Dimension 1 Code","Global Dimension 1 Code");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //"Loan Product Type" AND dim2--7
                    IF ("Loan Product Type"<>'') AND ("Global Dimension 1 Code"='') AND ("Global Dimension 2 Code"<>'') AND ("Issued Date From"=0D) AND ("Issued Date To"=0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Loan Product Type","Loan Product Type");
                    Loans.SETRANGE(Loans."Global Dimension 2 Code","Global Dimension 2 Code");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //Dim 1 and dates-8
                    
                    IF ("Loan Product Type"='') AND ("Global Dimension 1 Code"<>'') AND ("Global Dimension 2 Code"='') AND ("Issued Date From"<>0D) AND ("Issued Date To"<>0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Global Dimension 1 Code","Global Dimension 1 Code");
                    Loans.SETRANGE(Loans."Disbursement Date","Issued Date From","Issued Date To");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //Dim1 and dim 2--9
                    
                    IF ("Loan Product Type"='') AND ("Global Dimension 1 Code"<>'') AND ("Global Dimension 2 Code"<>'') AND ("Issued Date From"=0D) AND ("Issued Date To"=0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Global Dimension 1 Code","Global Dimension 1 Code");
                    Loans.SETRANGE(Loans."Global Dimension 2 Code","Global Dimension 2 Code");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //Dim 2 and datess--10
                    IF ("Loan Product Type"='') AND ("Global Dimension 1 Code"='') AND ("Global Dimension 2 Code"<>'') AND ("Issued Date From"<>0D) AND ("Issued Date To"<>0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Global Dimension 2 Code","Global Dimension 2 Code");
                    Loans.SETRANGE(Loans."Disbursement Date","Issued Date From","Issued Date To");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //All present--11
                    IF ("Loan Product Type"<>'') AND ("Global Dimension 1 Code"<>'') AND ("Global Dimension 2 Code"='') AND ("Issued Date From"<>0D) AND ("Issued Date To"<>0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Loan Product Type","Loan Product Type");
                    Loans.SETRANGE(Loans."Global Dimension 1 Code","Global Dimension 1 Code");
                    Loans.SETRANGE(Loans."Global Dimension 2 Code","Global Dimension 2 Code");
                    Loans.SETRANGE(Loans."Disbursement Date","Issued Date From","Issued Date To");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //Ltype Dim1 and dim2--12
                    IF ("Loan Product Type"<>'') AND ("Global Dimension 1 Code"<>'') AND ("Global Dimension 2 Code"<>'') AND ("Issued Date From"=0D) AND ("Issued Date To"=0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Global Dimension 1 Code","Global Dimension 1 Code");
                    Loans.SETRANGE(Loans."Global Dimension 2 Code","Global Dimension 2 Code");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    //Ltype Dim1 and dates--13
                    
                    IF ("Loan Product Type"<>'') AND ("Global Dimension 1 Code"<>'') AND ("Global Dimension 2 Code"='') AND ("Issued Date From"<>0D) AND ("Issued Date To"<>0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Loan Product Type","Loan Product Type");
                    Loans.SETRANGE(Loans."Global Dimension 1 Code","Global Dimension 1 Code");
                    //Loans.SETRANGE(Loans."Global Dimension 2 Code","Global Dimension 2 Code");
                    Loans.SETRANGE(Loans."Disbursement Date","Issued Date From","Issued Date To");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //Ltype Dim2 and dates--14
                    IF ("Loan Product Type"<>'') AND ("Global Dimension 1 Code"='') AND ("Global Dimension 2 Code"<>'') AND ("Issued Date From"<>0D) AND ("Issued Date To"<>0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Loan Product Type","Loan Product Type");
                    //Loans.SETRANGE(Loans."Global Dimension 1 Code","Global Dimension 1 Code");
                    Loans.SETRANGE(Loans."Global Dimension 2 Code","Global Dimension 2 Code");
                    Loans.SETRANGE(Loans."Disbursement Date","Issued Date From","Issued Date To");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    
                    //Dim1 Dim2 and dates--15
                    IF ("Loan Product Type"<>'') AND ("Global Dimension 1 Code"='') AND ("Global Dimension 2 Code"<>'') AND ("Issued Date From"<>0D) AND ("Issued Date To"<>0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    Loans.SETRANGE(Loans."Global Dimension 1 Code","Global Dimension 1 Code");
                    Loans.SETRANGE(Loans."Global Dimension 2 Code","Global Dimension 2 Code");
                    Loans.SETRANGE(Loans."Disbursement Date","Issued Date From","Issued Date To");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                    
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                    IF ("Loan Product Type"='') AND ("Global Dimension 1 Code"='') AND ("Global Dimension 2 Code"='') AND ("Issued Date From"=0D) AND ("Issued Date To"=0D) THEN BEGIN
                    EntryNo:=0;
                    Loans.RESET;
                    //Loans.SETRANGE(Loans."Loan Product Type","Loan product Type");
                    //Loans.SETRANGE(Loans."Global Dimension 1 Code","Global Dimension 1 Code");
                    //Loans.SETRANGE(Loans."Global Dimension 2 Code","Global Dimension 2 Code");
                    //Loans.SETRANGE(Loans."Disbursement Date","Issued Date From","Issued Date To");
                    Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
                    Loans.SETRANGE(Loans.Posted,FALSE);
                    Loans.SETRANGE(Loans."Already Suggested",FALSE);
                    IF Loans.FIND('-') THEN BEGIN
                      REPEAT
                        EntryNo:=EntryNo+1000;
                        DisbLines.INIT;
                        DisbLines."Line No.":= EntryNo;
                        DisbLines."Loan No.":=Loans."Loan No.";
                        DisbLines.VALIDATE(DisbLines."Loan No.");
                        DisbLines."Global Dimension 1 Code":=Loans."Global Dimension 1 Code";
                        DisbLines."Global Dimension 2 Code":=Loans."Global Dimension 2 Code";
                        DisbLines.No:="No.";
                        DisbLines.INSERT;
                        //Tag that it has been suggested
                        Loans."Already Suggested":=TRUE;
                        Loans.MODIFY;
                      UNTIL Loans.NEXT=0;
                    END ELSE
                    ERROR("MissingLoans:");
                    END;
                    
                     */

                end;
            }
            separator(Action13)
            {
            }
            action("Suggest Partial Disbursements Due")
            {
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //ERROR('Invalid action....');

                    if Rec."Subsequent Disbursements" = Rec."Subsequent Disbursements"::No then
                        Error(Text003);
                    GetIfNothingSelected;

                    DisbLines.Reset;
                    DisbLines.SetRange(DisbLines.No, Rec."No.");
                    DisbLines.SetRange(Posted, false);
                    if DisbLines.Find('-') then begin
                        if Confirm('The lines will be deleted and recreated. Are you sure you want to proceed?', false) = true then
                            DisbLines.DeleteAll
                        else begin
                            Message('Proceed and process. The lines will not be regenerated');
                            exit;
                        end;
                    end;


                    if (Rec."Issued Date From" = 0D) or (Rec."Issued Date To" = 0D) then
                        Error(Text005);
                    if Rec."Member No" = '' then Error(ErrorMember);

                    if Rec."Issued Date To" < Rec."Issued Date From" then
                        Error("LoanDateErr:");


                    //Date only placed--1
                    if (Rec."Loan Product Type" = '') and (Rec."Global Dimension 1 Code" = '') and (Rec."Global Dimension 2 Code" = '') and (Rec."Issued Date From" <> 0D) and (Rec."Issued Date To" <> 0D) then begin
                        EntryNo := 0;
                        Loans.Reset;
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans."Member No.", Rec."Member No");
                        Loans.SetRange(Loans.Posted, true);
                        Loans.SetRange(Loans."Mode of Disbursement", Loans."Mode of Disbursement"::"Partial Disbursement");
                        if Loans.Find('-') then begin
                            repeat
                                PartDisb.Reset;
                                PartDisb.SetRange(PartDisb."Loan No.", Loans."Loan No.");
                                PartDisb.SetRange(PartDisb.Posted, false);
                                PartDisb.SetRange(PartDisb."Scheduled Disbursement Date", 0D, Rec."Issued Date To");
                                if PartDisb.Find('-') then begin
                                    //REPEAT
                                    EntryNo := EntryNo + 1000;
                                    DisbLines.Init;
                                    DisbLines."Line No." := EntryNo;
                                    DisbLines."Loan No." := PartDisb."Loan No.";
                                    DisbLines."Disbursement Amount" := PartDisb.Amount;
                                    DisbLines.Date := Today;
                                    DisbLines."Account No." := Loans."Loan Account";
                                    DisbLines."Approved Amount" := Loans."Approved Amount";
                                    DisbLines."Account Name" := Loans."Member Name";
                                    DisbLines."Global Dimension 1 Code" := Loans."Global Dimension 1 Code";
                                    DisbLines."Global Dimension 2 Code" := Loans."Global Dimension 2 Code";
                                    DisbLines."Disbursement Serial - PD" := PartDisb."Entry No";
                                    DisbLines.No := Rec."No.";
                                    DisbLines.Insert;
                                    //Tag that it has been suggested
                                    PartDisb."Suggested for Disbursement" := true;
                                    PartDisb.Modify;


                                    //UNTIL PartDisb.NEXT=0;
                                end;


                            until Loans.Next = 0;
                        end else
                            Error("MissingLoans:");
                    end;

                    //Dim1 and dates

                    if (Rec."Loan Product Type" <> '') and (Rec."Global Dimension 1 Code" <> '') and (Rec."Global Dimension 2 Code" = '') and (Rec."Issued Date From" <> 0D) and (Rec."Issued Date To" <> 0D) then begin
                        EntryNo := 0;
                        Loans.Reset;
                        Loans.SetRange(Loans."Mode of Disbursement", Loans."Mode of Disbursement"::"Partial Disbursement");
                        //Loans.SETRANGE(Loans."Loan Product Type","Loan Product Type");
                        Loans.SetRange(Loans."Member No.", Rec."Member No");
                        Loans.SetRange(Loans."Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans.Posted, true);

                        if Loans.Find('-') then begin
                            repeat
                                PartDisb.Reset;
                                PartDisb.SetRange(PartDisb."Loan No.", Loans."Loan No.");
                                PartDisb.SetRange(PartDisb.Posted, false);
                                PartDisb.SetRange(PartDisb."Scheduled Disbursement Date", 0D, Rec."Issued Date To");
                                if PartDisb.Find('-') then begin
                                    //REPEAT
                                    EntryNo := EntryNo + 1000;
                                    DisbLines.Init;
                                    DisbLines."Line No." := EntryNo;
                                    DisbLines."Loan No." := PartDisb."Loan No.";
                                    DisbLines."Disbursement Amount" := PartDisb.Amount;
                                    DisbLines.Date := Today;
                                    DisbLines."Account No." := Loans."Loan Account";
                                    DisbLines."Account Name" := Loans."Member Name";
                                    DisbLines."Global Dimension 1 Code" := Loans."Global Dimension 1 Code";
                                    DisbLines."Global Dimension 2 Code" := Loans."Global Dimension 2 Code";
                                    DisbLines.No := Rec."No.";
                                    DisbLines."Disbursement Serial - PD" := PartDisb."Entry No";
                                    DisbLines.Insert;
                                    //Tag that it has been suggested
                                    PartDisb."Suggested for Disbursement" := true;
                                    PartDisb.Modify;
                                    //UNTIL PartDisb.NEXT=0;
                                end;
                            until Loans.Next = 0;
                        end else
                            Error("MissingLoans:");
                    end;


                    //Loan Type and dates
                    if (Rec."Loan Product Type" <> '') and (Rec."Global Dimension 1 Code" = '') and (Rec."Global Dimension 2 Code" = '') and (Rec."Issued Date From" <> 0D) and (Rec."Issued Date To" <> 0D) then begin
                        EntryNo := 0;
                        Loans.Reset;
                        Loans.SetRange(Loans."Loan Product Type", Rec."Loan Product Type");
                        Loans.SetRange(Loans."Member No.", Rec."Member No");
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans.Posted, true);
                        Loans.SetRange(Loans."Mode of Disbursement", Loans."Mode of Disbursement"::"Partial Disbursement");
                        if Loans.Find('-') then begin
                            repeat
                                PartDisb.Reset;
                                PartDisb.SetRange(PartDisb."Loan No.", Loans."Loan No.");
                                PartDisb.SetRange(PartDisb.Posted, false);
                                PartDisb.SetRange(PartDisb."Scheduled Disbursement Date", 0D, Rec."Issued Date To");
                                if PartDisb.Find('-') then begin
                                    //REPEAT
                                    EntryNo := EntryNo + 1000;
                                    DisbLines.Init;
                                    DisbLines."Line No." := EntryNo;
                                    DisbLines."Loan No." := PartDisb."Loan No.";
                                    DisbLines."Disbursement Amount" := PartDisb.Amount;
                                    DisbLines.Date := Today;
                                    DisbLines."Account No." := Loans."Loan Account";
                                    DisbLines."Account Name" := Loans."Member Name";
                                    DisbLines."Global Dimension 1 Code" := Loans."Global Dimension 1 Code";
                                    DisbLines."Global Dimension 2 Code" := Loans."Global Dimension 2 Code";
                                    DisbLines."Disbursement Serial - PD" := PartDisb."Entry No";
                                    DisbLines.No := Rec."No.";
                                    DisbLines.Insert;
                                    //Tag that it has been suggested
                                    PartDisb."Suggested for Disbursement" := true;
                                    PartDisb.Modify;
                                    //UNTIL PartDisb.NEXT=0;
                                end;
                            until Loans.Next = 0;
                        end else
                            Error("MissingLoans:");
                    end;


                    //Dim 1 dim 2 and dates only--5

                    if (Rec."Loan Product Type" = '') and (Rec."Global Dimension 1 Code" <> '') and (Rec."Global Dimension 2 Code" <> '') and (Rec."Issued Date From" <> 0D) and (Rec."Issued Date To" <> 0D) then begin
                        EntryNo := 0;
                        Loans.Reset;
                        Loans.SetRange(Loans."Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                        Loans.SetRange(Loans."Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                        Loans.SetRange(Loans."Member No.", Rec."Member No");
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans.Posted, true);
                        Loans.SetRange(Loans."Mode of Disbursement", Loans."Mode of Disbursement"::"Partial Disbursement");
                        if Loans.Find('-') then begin
                            repeat
                                PartDisb.Reset;
                                PartDisb.SetRange(PartDisb."Loan No.", Loans."Loan No.");
                                PartDisb.SetRange(PartDisb.Posted, false);
                                PartDisb.SetRange(PartDisb."Scheduled Disbursement Date", 0D, Rec."Issued Date To");
                                if PartDisb.Find('-') then begin
                                    //REPEAT
                                    EntryNo := EntryNo + 1000;
                                    DisbLines.Init;
                                    DisbLines."Line No." := EntryNo;
                                    DisbLines."Loan No." := PartDisb."Loan No.";
                                    DisbLines."Disbursement Amount" := PartDisb.Amount;
                                    DisbLines.Date := Today;
                                    DisbLines."Account No." := Loans."Loan Account";
                                    DisbLines."Account Name" := Loans."Member Name";
                                    DisbLines."Global Dimension 1 Code" := Loans."Global Dimension 1 Code";
                                    DisbLines."Global Dimension 2 Code" := Loans."Global Dimension 2 Code";
                                    DisbLines.No := Rec."No.";
                                    DisbLines."Disbursement Serial - PD" := PartDisb."Entry No";
                                    DisbLines.Insert;
                                    //Tag that it has been suggested
                                    PartDisb."Suggested for Disbursement" := true;
                                    PartDisb.Modify;
                                    //UNTIL PartDisb.NEXT=0;
                                end;
                            until Loans.Next = 0;
                        end else
                            Error("MissingLoans:");
                    end;


                    //Dim 1 ,Dates and Loan type placed--6
                    if (Rec."Loan Product Type" <> '') and (Rec."Global Dimension 1 Code" <> '') and (Rec."Global Dimension 2 Code" = '') and (Rec."Issued Date From" <> 0D) and (Rec."Issued Date To" <> 0D) then begin
                        EntryNo := 0;
                        Loans.Reset;
                        Loans.SetRange(Loans."Loan Product Type", Rec."Loan Product Type");
                        Loans.SetRange(Loans."Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                        Loans.SetRange(Loans."Member No.", Rec."Member No");
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans.Posted, true);
                        Loans.SetRange(Loans."Mode of Disbursement", Loans."Mode of Disbursement"::"Partial Disbursement");
                        if Loans.Find('-') then begin
                            repeat
                                PartDisb.Reset;
                                PartDisb.SetRange(PartDisb."Loan No.", Loans."Loan No.");
                                PartDisb.SetRange(PartDisb.Posted, false);
                                PartDisb.SetRange(PartDisb."Scheduled Disbursement Date", 0D, Rec."Issued Date To");
                                if PartDisb.Find('-') then begin
                                    //REPEAT
                                    EntryNo := EntryNo + 1000;
                                    DisbLines.Init;
                                    DisbLines."Line No." := EntryNo;
                                    DisbLines."Loan No." := PartDisb."Loan No.";
                                    DisbLines."Disbursement Amount" := PartDisb.Amount;
                                    DisbLines.Date := Today;
                                    DisbLines."Account No." := Loans."Loan Account";
                                    DisbLines."Account Name" := Loans."Member Name";
                                    DisbLines."Global Dimension 1 Code" := Loans."Global Dimension 1 Code";
                                    DisbLines."Global Dimension 2 Code" := Loans."Global Dimension 2 Code";
                                    DisbLines."Disbursement Serial - PD" := PartDisb."Entry No";
                                    DisbLines.No := Rec."No.";
                                    DisbLines.Insert;
                                    //Tag that it has been suggested
                                    PartDisb."Suggested for Disbursement" := true;
                                    PartDisb.Modify;
                                    //UNTIL PartDisb.NEXT=0;
                                end;
                            until Loans.Next = 0;
                        end else
                            Error("MissingLoans:");
                    end;


                    //Dim 2 ,Dates and Loan type placed--7
                    if (Rec."Loan Product Type" <> '') and (Rec."Global Dimension 1 Code" = '') and (Rec."Global Dimension 2 Code" <> '') and (Rec."Issued Date From" <> 0D) and (Rec."Issued Date To" <> 0D) then begin
                        EntryNo := 0;
                        Loans.Reset;
                        Loans.SetRange(Loans."Loan Product Type", Rec."Loan Product Type");
                        Loans.SetRange(Loans."Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                        Loans.SetRange(Loans."Member No.", Rec."Member No");
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans.Posted, true);
                        Loans.SetRange(Loans."Mode of Disbursement", Loans."Mode of Disbursement"::"Partial Disbursement");
                        if Loans.Find('-') then begin
                            repeat
                                PartDisb.Reset;
                                PartDisb.SetRange(PartDisb."Loan No.", Loans."Loan No.");
                                PartDisb.SetRange(PartDisb.Posted, false);
                                PartDisb.SetRange(PartDisb."Scheduled Disbursement Date", 0D, Rec."Issued Date To");
                                if PartDisb.Find('-') then begin
                                    //REPEAT
                                    EntryNo := EntryNo + 1000;
                                    DisbLines.Init;
                                    DisbLines."Line No." := EntryNo;
                                    DisbLines."Loan No." := PartDisb."Loan No.";
                                    DisbLines."Disbursement Amount" := PartDisb.Amount;
                                    DisbLines.Date := Today;
                                    DisbLines."Account No." := Loans."Loan Account";
                                    DisbLines."Account Name" := Loans."Member Name";
                                    DisbLines."Global Dimension 1 Code" := Loans."Global Dimension 1 Code";
                                    DisbLines."Global Dimension 2 Code" := Loans."Global Dimension 2 Code";
                                    DisbLines."Disbursement Serial - PD" := PartDisb."Entry No";
                                    DisbLines.No := Rec."No.";
                                    DisbLines.Insert;
                                    //Tag that it has been suggested
                                    PartDisb."Suggested for Disbursement" := true;
                                    PartDisb.Modify;
                                    //UNTIL PartDisb.NEXT=0;
                                end;
                            until Loans.Next = 0;
                        end else
                            Error("MissingLoans:");
                    end;



                    //Dim 2 ,Dates and Loan type placed--7
                    if (Rec."Loan Product Type" <> '') and (Rec."Global Dimension 1 Code" <> '') and (Rec."Global Dimension 2 Code" <> '') and (Rec."Issued Date From" <> 0D) and (Rec."Issued Date To" <> 0D) then begin
                        EntryNo := 0;
                        Loans.Reset;
                        Loans.SetRange(Loans."Loan Product Type", Rec."Loan Product Type");
                        Loans.SetRange(Loans."Member No.", Rec."Member No");
                        Loans.SetRange(Loans."Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                        Loans.SetRange(Loans."Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                        Loans.SetRange(Loans.Status, Loans.Status::Approved);
                        Loans.SetRange(Loans.Posted, true);
                        Loans.SetRange(Loans."Mode of Disbursement", Loans."Mode of Disbursement"::"Partial Disbursement");
                        if Loans.Find('-') then begin
                            repeat
                                PartDisb.Reset;
                                PartDisb.SetRange(PartDisb."Loan No.", Loans."Loan No.");
                                PartDisb.SetRange(PartDisb.Posted, false);
                                PartDisb.SetRange(PartDisb."Scheduled Disbursement Date", 0D, Rec."Issued Date To");
                                if PartDisb.Find('-') then begin
                                    //REPEAT
                                    EntryNo := EntryNo + 1000;
                                    DisbLines.Init;
                                    DisbLines."Line No." := EntryNo;
                                    DisbLines."Loan No." := PartDisb."Loan No.";
                                    DisbLines."Disbursement Amount" := PartDisb.Amount;
                                    DisbLines.Date := Today;
                                    DisbLines."Account No." := Loans."Loan Account";
                                    DisbLines."Account Name" := Loans."Member Name";
                                    DisbLines."Global Dimension 1 Code" := Loans."Global Dimension 1 Code";
                                    DisbLines."Global Dimension 2 Code" := Loans."Global Dimension 2 Code";
                                    DisbLines.No := Rec."No.";
                                    DisbLines."Disbursement Serial - PD" := PartDisb."Entry No";
                                    DisbLines.Insert;
                                    //Tag that it has been suggested
                                    PartDisb."Suggested for Disbursement" := true;
                                    PartDisb.Modify;
                                    //UNTIL PartDisb.NEXT=0;
                                end;
                            until Loans.Next = 0;
                        end else
                            Error("MissingLoans:");
                    end;
                end;
            }
            separator(Action21)
            {
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
                    SugestDisb;
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

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                    approvalsMgmt: Codeunit "Approvals Mgmt.";
                begin

                    approvalsMgmt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Cancel Document")
            {
                Image = StopPayment;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Approved then begin
                        if Confirm('Do you want to can cancel the documnet?', false) = true then begin
                            Rec.Status := Rec.Status::Open;
                            Rec.Modify;
                            Message('Batch canceled successfully');
                        end;
                    end;
                end;
            }
            separator(Action5)
            {
            }
            action("Loan Disbursement Schedule")
            {
                Image = ReceiveLoaner;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Batches.Reset;
                    Batches.SetRange(Batches."No.", Rec."No.");
                    if Batches.Find('-') then begin
                        //REPORT.Run(52185715, true, false, Batches);
                    end;
                end;
            }
            action(Approves)
            {
                Visible = false;

                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Approved;
                    Rec.Modify;
                end;
            }
            action("Clear Suggested Loans ")
            {
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //Validations
                    DisbLines.Reset;
                    DisbLines.SetRange(DisbLines.No, Rec."No.");
                    DisbLines.SetRange(Posted, false);
                    if DisbLines.Find('-') then begin
                        if Confirm('The lines will be deleted . Are you sure you want to proceed?', false) = true then
                            DisbLines.DeleteAll
                        else begin
                            Message('Proceed and process. The lines will not be regenerated');
                            exit;
                        end;
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        StatusControl;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
        StatusControl;
    end;

    trigger OnOpenPage()
    begin
        if Rec."Subsequent Disbursements" = Rec."Subsequent Disbursements"::Yes then
            SubseqDisb := true
        else
            SubseqDisb := false;
        StatusControl;
        SetControlAppearance;
        if UserSetup.Get(Rec."Prepared By") then begin
            Rec."Global Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
            Rec."Global Dimension 2 Code" := UserSetup."Global Dimension 2 Code";
            Rec."Responsibility Center" := UserSetup."Responsibility Centre";
            Rec.Modify;
        end;
    end;

    var
        Text001: Label 'This Document no %1 has printed Cheque No %2 which will have to be voided first before reposting.';
        Text000: Label 'Do you want to Void Check No %1';
        Text002: Label 'You have selected post and generate a computer cheque ensure that your cheque printer is ready do you want to continue?';
        Posting: Codeunit "Loans Process";
        Batches: Record "Loan Disbursement Header";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";
        GetScore: Codeunit "DCS Integration Base";
        "LoanDateErr:": Label 'Dates are inconsistent';
        EntryNo: Integer;
        Loans: Record Loans;
        DisbLines: Record "Loan Disbursement Lines";
        "MissingLoans:": Label 'There are missing loans within the filter';
        PartDisb: Record "Partial Disbursement Schedule";
        Text003: Label 'This option is meant for subsequent disbursements - Partial';
        Text004: Label 'This option is first time disbursements';
        Text005: Label 'Dates cannot be blank';
        LoanApp: Record Loans;
        LoanNotApproved: Label 'Loan No. %1 in the current batch is not approved. Remove from batch or approve first';
        SubseqDisb: Boolean;
        ApprovedEdit: Boolean;
        UserSetup: Record "User Setup";
        LoansTopUp: Record "Loans Top up";
        DSLines: Record "Loan Disbursement Lines";
        LoanGuar: Record "Loan Guarantors and Security";
        Members: Record Members;
        SendSms: Codeunit SendSms;
        CompInfo: Record "Company Information";
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        Loans2: Record Loans;
        ProductType: Text;
        AppAmount: Decimal;
        Message: Text;
        SavingsAccounts: Record "Savings Accounts";
        ErrorMember: Label 'Kindly select the Member No';

    local procedure GetIfNothingSelected()
    begin
    end;

    //[Scope('Internal')]
    procedure StatusControl()
    begin
        ApprovedEdit := true;
        case Rec.Status of
            Rec.Status::Pending, Rec.Status::Approved, Rec.Status::Rejected:
                begin
                    ApprovedEdit := false;
                end;
            Rec.Status::Open:
                begin
                    ApprovedEdit := true;
                end;
        end;
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
    end;

    local procedure SugestDisb()
    begin
        //Validations
        DisbLines.Reset;
        DisbLines.SetRange(DisbLines.No, Rec."No.");
        DisbLines.SetRange(Posted, false);
        if DisbLines.Find('-') then begin
            if Confirm('The lines will be deleted and recreated. Are you sure you want to proceed?', false) = true then
                DisbLines.DeleteAll
            else begin
                Message('Proceed and process. The lines will not be regenerated');
                exit;
            end;
        end;
        Loans.Reset;
        //Loans.SETRANGE(Loans.Status,Loans.Status::Approved);
        Loans.SetRange(Loans.Posted, false);
        Loans.SetRange(Loans."Batch No.", Rec."No.");
        if Loans.Find('-') then begin
            repeat
                if Loans.Status <> Loans.Status::Approved then
                    Error(LoanNotApproved, Loans."Loan No.");
                EntryNo := EntryNo + 1000;
                DisbLines.Init;
                DisbLines."Line No." := EntryNo;
                DisbLines."Loan No." := Loans."Loan No.";
                DisbLines.Validate(DisbLines."Loan No.");
                DisbLines."Global Dimension 1 Code" := Loans."Global Dimension 1 Code";
                DisbLines."Global Dimension 2 Code" := Loans."Global Dimension 2 Code";
                DisbLines.No := Rec."No.";
                DisbLines.Insert;
            //Tag that it has been suggested
            //Loans."Already Suggested":=TRUE;
            //Loans.MODIFY;
            until Loans.Next = 0;
        end else
            Message("MissingLoans:");
    end;
}

