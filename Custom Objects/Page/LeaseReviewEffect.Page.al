page 52186200 "Lease Review-Effect"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Lease Charge Review";

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field(Select; Rec.Select)
                {
                }
                field("Line No."; Rec."Line No.")
                {
                    Editable = false;
                }
                field("Lease No."; Rec."Lease No.")
                {
                    Editable = false;
                }
                field("Charge No."; Rec."Charge No.")
                {
                    Editable = false;
                }
                field("Charge Name"; Rec."Charge Name")
                {
                    Editable = false;
                }
                field("Old Amount[Rate]"; Rec."Old Amount[Rate]")
                {
                    Editable = false;
                }
                field("Effect Date"; Rec."Effect Date")
                {
                    Editable = true;
                }
                field("New [Rate Amount]"; Rec."New [Rate Amount]")
                {
                }
                field("New [Review Amount]"; Rec."New [Review Amount]")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Effect Review")
            {
                Caption = 'Effect Review';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //LEASE REVIEW
                    LR.Reset;
                    LR.SetFilter(LR.Effected, Format(false));
                    LR.SetFilter(LR.Select, Format(true));
                    if LR.Find('-') then begin
                        if Confirm('Effect the selected reviews into the leases?', false) = false then begin exit end;
                        repeat
                            if Rec."Effect Date" <= Today then begin

                                LL.Reset;
                                LL.SetRange(LL."Lease No.", Rec."Lease No.");
                                //LL.SETRANGE(LL."Charge No.","Charge No.");
                                LL.SetRange(LL.Review, true);
                                if LL.Find('-') then
                                  //ERROR('yes');
                                  begin
                                    if Rec."New [Review Amount]" > Rec."Old Amount[Review Amount]" then begin
                                        LL."Amount Exclusive VAT" := LR."New [Review Amount]";
                                        Charge.Reset;
                                        Charge.SetRange(Charge.Code, LL."Charge No.");
                                        if Charge.Find('-') then
                                            LL."VAT Amount" := LL."Amount Exclusive VAT" * (Charge."VAT Percentage(%)" / 100);
                                        NewReviewAmount := LL."VAT Amount" + LL."Amount Exclusive VAT";
                                        LL."Total Amount Inclusive VAT" := NewReviewAmount;

                                        LL.Modify;
                                    end

                                    else
                                        if Rec."New [Rate Amount]" > Rec."Old Amount[Rate]" then begin

                                            LL."Amount Exclusive VAT" := LR."New [Rate Amount]";
                                            Charge.Reset;
                                            Charge.SetRange(Charge.Code, LL."Charge No.");
                                            if Charge.Find('-') then
                                                LL."VAT Amount" := LL."Amount Exclusive VAT" * (Charge."VAT Percentage(%)" / 100);
                                            NewReviewAmount := LL."VAT Amount" + LL."Amount Exclusive VAT";
                                            LL."Total Amount Inclusive VAT" := NewReviewAmount;

                                            LL.Modify;

                                        end
                                end;
                            end;
                            LR.Effected := true;
                            LR."Effected Date" := Today;
                            LR."Effected By" := UserId;
                            LR.Modify;
                        until LR.Next = 0;
                    end;
                    CurrPage.Update();
                    Message('Lease Document Has been Reviewed');
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter(Effected, Format(false));
        //SETFILTER("Effect Date",'<=' + FORMAT(TODAY));
    end;

    var
        LR: Record "Lease Charge Review";
        LL: Record "Lease Line";
        Charge: Record Charges;
        NewReviewAmount: Decimal;
}

