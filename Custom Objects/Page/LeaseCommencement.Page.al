page 52186199 "Lease-Commencement"
{
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Lease;
    SourceTableView = WHERE(Status = FILTER(Approved));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = true;
                ShowCaption = false;
                field(Select; Rec.Select)
                {
                }
                field(Cancelled; Rec.Cancelled)
                {
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field("Date Registered"; Rec."Date Registered")
                {
                    Editable = false;
                }
                field("Property No."; Rec."Property No.")
                {
                    Editable = false;
                }
                field("L.R. No."; Rec."L.R. No.")
                {
                    Editable = false;
                }
                field("Property Name"; Rec."Property Name")
                {
                    Editable = false;
                }
                field("Floor No."; Rec."Floor No.")
                {
                    Editable = false;
                }
                field("Floor Name"; Rec."Floor Name")
                {
                    Editable = false;
                }
                field("Unit Code"; Rec."Unit Code")
                {
                    Editable = false;
                }
                field("Unit Description"; Rec."Unit Description")
                {
                    Editable = false;
                }
                field("Unit Type"; Rec."Unit Type")
                {
                    Editable = false;
                }
                field("Unit Type Description"; Rec."Unit Type Description")
                {
                    Editable = false;
                }
                field("Unit Sub Type"; Rec."Unit Sub Type")
                {
                    Editable = false;
                }
                field("Unit Sub Type Description"; Rec."Unit Sub Type Description")
                {
                    Editable = false;
                }
                field("Landlord No."; Rec."Landlord No.")
                {
                    Editable = false;
                }
                field("Landlord Name"; Rec."Landlord Name")
                {
                    Editable = false;
                }
                field("Tenant No."; Rec."Tenant No.")
                {
                    Editable = false;
                }
                field("Tenant Name"; Rec."Tenant Name")
                {
                    Editable = false;
                }
                field("Letter Of Offer"; Rec."Letter Of Offer")
                {
                    Editable = false;
                }
                field("Lease Agreement Ref. No."; Rec."Lease Agreement Ref. No.")
                {
                    Editable = false;
                }
                field("Lease Commence Date"; Rec."Lease Commence Date")
                {
                    Editable = false;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    Editable = false;
                }
                field("Billing Frequency"; Rec."Billing Frequency")
                {
                    Editable = false;
                }
                field("Billing Frequency Value"; Rec."Billing Frequency Value")
                {
                    Editable = false;
                }
                field("Duration Type"; Rec."Duration Type")
                {
                    Editable = false;
                }
                field("Duration Value"; Rec."Duration Value")
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
            action("Commence Lease")
            {
                Caption = 'Commence Lease';
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    L.Reset;
                    L.SetFilter(L.Blocked, Format(false));
                    L.SetFilter(L.Commenced, Format(false));
                    L.SetFilter(L."Lease Commence Date", '<=' + Format(Today));
                    L.SetFilter(L.Select, Format(true));
                    if L.FindFirst then begin
                        if Confirm('Mark the Leases as Commenced?', false) = false then begin exit end;
                        repeat
                            L."Next Bill Date" := Today;
                            L."Last Bill Date" := Today;
                            L.Commenced := true;
                            L.Modify;

                            Unt.SetRange(Unt."Unit Code", Rec."Unit Code");
                            if Unt.Find('-') then
                                Unt."Unit Status" := Unt."Unit Status"::Occupied;
                            Unt.Modify;

                        until L.Next = 0;
                    end;
                    CurrPage.Update();
                    Message('The Selected Lease have been activated');
                end;
            }
            group(Functions)
            {
                Caption = 'Functions';
                action("Commence Leases")
                {
                    Caption = 'Commence Leases';
                    Image = Add;

                    trigger OnAction()
                    begin
                        //CHECK WHETHER THERE IS ANY LEASE TO BE COMMENCEED
                        if Rec."No." = '' then begin
                            Error('No Lease Document for Commencement');
                        end;

                        /*Rec.TestField("L.R. No.");
                        Rec.TestField("LA Signed");
                        Rec.TestField("Landlord No.");
                        */
                        L.Reset;
                        L.SetFilter(L.Blocked, Format(false));
                        L.SetFilter(L.Commenced, Format(false));
                        L.SetFilter(L."Lease Commence Date", '<=' + Format(Today));
                        L.SetFilter(L.Select, Format(true));
                        if L.FindFirst then begin
                            if L.Cancelled = true then begin
                                Error('The Lease Has Already been Cancelled. You CANNOT Commence it.');
                            end else
                                if Confirm('Do you want to Mark the Leases as Commenced?', false) = false then begin exit end;
                            repeat
                                L."Next Bill Date" := Today;
                                L."Last Bill Date" := Today;
                                L.Commenced := true;
                                L.Modify;
                                Unt.Reset;
                                Unt.SetRange(Unt."Unit Code", L."Unit Code");
                                Unt.SetRange(Unt."Property No.", L."Property No.");
                                Unt.SetRange(Unt."Floor Code", L."Floor No.");
                                if Unt.Find('-') then
                                    Unt."Unit Status" := Unt."Unit Status"::Occupied;
                                Unt.Occupied := true;
                                Unt.Modify;

                            until L.Next = 0;
                        end;
                        CurrPage.Update();
                        Message('The Selected Lease have been activated');

                    end;
                }
                action("Cancel Leases")
                {
                    Caption = 'Cancel Leases';
                    Image = Cancel;

                    trigger OnAction()
                    begin

                        if Rec."No." = '' then begin
                            Error('No Lease Document to be Cancelled ');
                        end;

                        // Rec.TestField("No.");
                        L.Reset;
                        L.SetFilter(L.Blocked, Format(false));
                        L.SetFilter(L.Commenced, Format(false));
                        L.SetFilter(L."Lease Commence Date", '<=' + Format(Today));
                        L.SetFilter(L.Select, Format(true));

                        if L.FindFirst then begin
                            if L.Cancelled = true then begin
                                Error('The Lease Has Already been Cancelled');
                            end else

                                if Confirm('Do you want to Cancel the Leases?', false) = false then begin exit end;
                            repeat
                                //L."Next Bill Date":=TODAY;
                                //L."Last Bill Date":=TODAY;
                                L.Cancelled := true;
                                L.Modify;
                            /*
                              Unt.SETRANGE(Unt."Unit Code", "Unit Code");
                              IF Unt.FIND('-') THEN
                              Unt."Unit Status":=Unt."Unit Status"::Vacant;
                              Unt.MODIFY;
                             */
                            until L.Next = 0;
                        end;
                        CurrPage.Update();
                        Message('The Selected Lease have been Cancelled');

                    end;
                }
                separator(Action1102755059)
                {
                }
                action("Re-open Lease")
                {
                    Caption = 'Re-open Lease';
                    Image = ReOpen;

                    trigger OnAction()
                    begin
                        //check whether the any document needs reopening
                        if Rec."No." = '' then begin
                            Error('No Lease Document to be Re-opened ');
                        end;

                        L.Reset;
                        L.SetFilter(L.Blocked, Format(false));
                        L.SetFilter(L.Commenced, Format(false));
                        L.SetFilter(L."Lease Commence Date", '<=' + Format(Today));
                        L.SetFilter(L.Select, Format(true));

                        if L.FindFirst then begin
                            if L.Cancelled = true then begin
                                if Confirm('Are You Sure you want to Re-open the Cancelled Lease', false) = false then begin exit end;
                                repeat
                                    L.Cancelled := false;
                                    //L."Next Bill Date":=TODAY;
                                    //L."Last Bill Date":=TODAY;
                                    L.Modify;
                                /*
                                  Unt.SETRANGE(Unt."Unit Code", "Unit Code");
                                  IF Unt.FIND('-') THEN
                                  Unt."Unit Status":=Unt."Unit Status"::Vacant;
                                  Unt.MODIFY;
                                 */
                                until L.Next = 0;
                                CurrPage.Update();
                                Message('The Selected Lease have been Re-opened');
                            end
                        end

                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter(Blocked, Format(false));
        Rec.SetFilter(Commenced, Format(false));

        Rec.SetFilter("Lease Commence Date", '<=' + Format(Today));
    end;

    var
        L: Record Lease;
        Unt: Record Unit;
}

