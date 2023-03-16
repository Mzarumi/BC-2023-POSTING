page 52185761 "Loan Guarantors and Security"
{
    PageType = List;
    SourceTable = "Loan Guarantors and Security";
    SourceTableView = SORTING("Total Sum")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Guarantor Type"; Rec."Guarantor Type")
                {
                }
                field("Savings Account No./Member No."; Rec."Savings Account No./Member No.")
                {
                    Visible = true;
                }
                field(Name; Rec.Name)
                {
                }
                field("Collateral Reg. No."; Rec."Collateral Reg. No.")
                {
                }
                field("Self Guarantee"; Rec."Self Guarantee")
                {
                    Editable = false;
                }
                field("Loan Type"; Rec."Loan Type")
                {
                }
                field("Staff/Payroll No."; Rec."Staff/Payroll No.")
                {
                }
                field("Guarantor ID No."; Rec."ID No.")
                {
                }
                field("Loanee Name"; Rec."Loanee Name")
                {
                }
                field("Amount Guaranteed"; Rec."Amount Guaranteed")
                {
                }
                field("Deposits/Shares"; Rec."Deposits/Shares")
                {
                }
                field(Substituted; Rec.Substituted)
                {
                }
                field("Member Substituted"; Rec."Member Substituted")
                {
                }
                field("Outstanding Balance"; Rec."Outstanding Balance")
                {
                    Editable = false;
                }
                field(Verified; Rec.Verified)
                {
                }
            }
            group(Control20)
            {
                ShowCaption = false;
                fixed(Control19)
                {
                    ShowCaption = false;
                    group("Guarantor Name")
                    {
                        Caption = 'Guarantor Name';
                        field("Guarantor Details"; Rec.Name)
                        {
                            Editable = false;
                        }
                    }
                    group(GuarantorDetails)
                    {
                        Caption = 'Guarantor ID No.';
                        field("ID No."; Rec."ID No.")
                        {
                            Caption = 'Bal. Account Name';
                            Editable = false;
                        }
                    }
                    group("Guaranteed Amount")
                    {
                        Caption = 'Guaranteed Amount';
                        field(Balance; Rec."Amount Guaranteed")
                        {
                            AutoFormatType = 1;
                            Caption = 'Balance';
                            Editable = false;
                            Visible = true;
                        }
                    }
                    group(Balances)
                    {
                        Caption = 'Balances';
                        field(TotalBalance; Rec."Total Sum")
                        {
                            AutoFormatType = 1;
                            Caption = 'Amount Guranteed';
                            Editable = false;
                            Visible = true;
                        }
                    }
                    group("Security Level")
                    {
                        Caption = 'Security Level';
                        Visible = false;
                        field("Coverage Variance"; Rec."Total Sum" + Rec."Amount Guaranteed")
                        {
                            AutoFormatType = 1;
                            Caption = 'Coverage Variance';
                            Editable = false;
                            Visible = false;
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            part("Approved Images"; "Member Picture & Signature")
            {
                Caption = 'Approved Images';
                SubPageLink = "Member No" = FIELD("Member No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sent SMS to Guarantors")
            {
                Image = Notes;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin

                    if Confirm('Do you want to send SMS notifications to guarantors?', false) = true then begin

                        if Loan.Get(Rec."Loan No") then begin
                            LoanGua.Reset;
                            LoanGua.SetRange(LoanGua."Loan No", Rec."Loan No");
                            LoanGua.SetRange("SMS Sent", false);
                            if LoanGua.Find('-') then begin
                                repeat
                                    Message(Format(LoanGua."Member No"));
                                    if Members.Get(LoanGua."Member No") then begin

                                        CompInfo.Get;
                                        SendSMS.SendSms(SourceType::"Loan Guarantors", Members."Mobile Phone No", 'You have guaranteed  ' + LoanGua."Loanee Name" + ' Member No:-' + Loan."Member No." + ' ' + Loan."Loan Product Type Name" + ' Loan of ' + Format(Loan."Approved Amount") +
                                       '. If in dispute call' + ' ' + CompInfo."Phone No.", Loan."Loan No.", Loan."Disbursement Account No", false);

                                    end;
                                    LoanGua."SMS Sent" := true;
                                    LoanGua.Modify;
                                until LoanGua.Next = 0;

                                //END;
                            end;
                            if Members.Get(Loan."Member No.") then begin
                                //IF Loan."SMS Sent"=FALSE THEN BEGIN
                                SendSMS.SendSms(SourceType::"Loan Application", Members."Mobile Phone No", 'Your loan application of ' + ' ' + Loan."Loan Product Type Name" + ' Loan of ' + ' ' + Format(Loan."Approved Amount") + ' ' + 'is being processed',
                                Loan."Loan No.", Loan."Disbursement Account No", false);
                                Loan."SMS Sent" := true;
                                //Loan.MODIFY;
                            end;
                        end;


                    end;


                    //END;
                end;
            }
            action("Guarantor Details Verified")
            {
                Image = View;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Rec.Verified = false then begin
                        repeat
                            Rec.Verified := true;
                            Rec.Modify;
                        until Rec.Next = 0;
                        Loan.Reset;
                        Loan.SetRange("Loan No.", Rec."Loan No");
                        if Loan.Find('-') then begin
                            AppraisalSalaryDetails.Reset;
                            AppraisalSalaryDetails.SetRange("Loan No", Loan."Loan No.");
                            if AppraisalSalaryDetails.Find('-') then begin
                                repeat
                                    if (AppraisalSalaryDetails.Verified = true) and (Rec.Verified = true) then
                                        Loan."Details Verified By" := UserId;
                                    Loan.Modify;
                                until AppraisalSalaryDetails.Next = 0;
                            end;

                        end;
                    end else
                        if Rec.Verified = true then begin
                            repeat
                                Rec.Verified := false;
                                Rec.Modify;
                            until Rec.Next = 0;
                            Loan.Reset;
                            Loan.SetRange("Loan No.", Rec."Loan No");
                            if Loan.Find('-') then begin
                                AppraisalSalaryDetails.Reset;
                                AppraisalSalaryDetails.SetRange("Loan No", Loan."Loan No.");
                                if AppraisalSalaryDetails.Find('-') then begin
                                    repeat
                                        if (AppraisalSalaryDetails.Verified = false) and (Rec.Verified = false) then
                                            Loan."Details Verified By" := '';
                                        Loan.Modify;
                                    until AppraisalSalaryDetails.Next = 0;
                                end;
                            end;

                        end;
                end;
            }
        }
    }

    trigger OnClosePage()
    begin
        SendM := true;

        LoanGua.Reset;
        LoanGua.SetRange(LoanGua."Loan No", Rec."Loan No");
        LoanGua.SetRange("SMS Sent", false);
        if LoanGua.FindFirst then begin
            Message('SMS Messages have been sent to the guarantors');
            SendM := true;
        end;

        if SendM = true then begin

            if Loan.Get(Rec."Loan No") then begin
                LoanGua.Reset;
                LoanGua.SetRange(LoanGua."Loan No", Rec."Loan No");
                LoanGua.SetRange("SMS Sent", false);
                if LoanGua.Find('-') then begin
                    repeat
                        // MESSAGE(FORMAT(LoanGua."Member No"));
                        if Members.Get(LoanGua."Member No") then begin
                            if Loan.Posted = true then
                                exit;
                            CompInfo.Get;
                            MemberGuarantor.Get(LoanGua."Member Guaranteed");
                            SendSMS.SendSms(SourceType::"Loan Guarantors", Members."Mobile Phone No", 'Dear Member, You have guaranteed MNo: '
                            + LoanGua."Member Guaranteed" + '-' + MemberGuarantor.Name + ' ' + Loan."Loan Product Type Name" + ' of Kes ' +
                            Format(Loan."Requested Amount") + '. If in dispute call' + ' ' + CompInfo."Phone No.", Loan."Loan No.", Loan."Disbursement Account No", false);

                            /*
                         CompInfo.GET;
                          SendSMS.SendSms(SourceType::"Loan Guarantors",Members."Mobile Phone No",'Dear Member, You have been captured as a Guarantor to Member '+Loan."Member No."+'-'+Loan."Member Name"+' '+
                         '. Thank You. For  on:'+' '+CompInfo."Phone No.",Loan."Loan No.",Loan."Disbursement Account No",FALSE);
                         */
                        end;
                        LoanGua."SMS Sent" := true;
                        LoanGua.Modify;
                    until LoanGua.Next = 0;

                    //END;
                end;
                if Members.Get(Loan."Member No.") then begin
                    if Loan."SMS Sent" = false then begin
                        SendSMS.SendSms(SourceType::"Loan Application", Members."Mobile Phone No", 'You loan application of ' + ' ' + Loan."Loan Product Type Name" + ' of ' + ' Kes' + Format(Loan."Approved Amount") + ' ' + 'is being processed',
                        Loan."Loan No.", Loan."Disbursement Account No", false);
                        Loan."SMS Sent" := true;
                        Loan.Modify;
                    end;
                end;
            end;
        end;

    end;

    trigger OnDeleteRecord(): Boolean
    begin


        if Loan.Get(Rec."Loan No") then begin
            if Members.Get(Rec."Member No") then begin
                //ERROR(Members."Phone No.");
                CompInfo.Get;
                SendSMS.SendSms(SourceType::"Loan Guarantors", Members."Mobile Phone No", 'Dear Member, You are no longer a guarantor to: '
                + Loan."Member Name" + '-' + LoanGua."Loanee Name" + ' ' + Loan."Loan Product Type Name" + ' of Kes' +
                Format(Loan."Approved Amount") + '. If in dispute call' + ' ' + CompInfo."Phone No.", Loan."Loan No.", Loan."Disbursement Account No", false);
            end;
        end;
    end;

    var
        LoanGua: Record "Loan Guarantors and Security";
        Members: Record Members;
        SendSMS: Codeunit SendSms;
        SourceType: Option "New Member","New Account","Loan Account Approval","Deposit Confirmation","Cash Withdrawal Confirm","Loan Application","Loan Appraisal","Loan Guarantors","Loan Rejected","Loan Posted","Loan defaulted","Salary Processing","Teller Cash Deposit"," Teller Cash Withdrawal","Teller Cheque Deposit","Fixed Deposit Maturity","InterAccount Transfer","Account Status","Status Order","EFT Effected"," ATM Application Failed","ATM Collection",MSACCO,"Member Changes";
        Loan: Record Loans;
        CompInfo: Record "Company Information";
        SendM: Boolean;
        AppraisalSalaryDetails: Record "Appraisal Salary Details";
        MemberGuarantor: Record Members;
}

