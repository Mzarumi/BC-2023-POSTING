page 52185453 "Sky Services"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Sky Services";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Mpesa Withdrawal"; Rec."Mpesa Withdrawal")
                {
                    Editable = false;
                }
                field("Utility Bill Payment"; Rec."Utility Bill Payment")
                {
                    Editable = false;
                }
                field("Bank Transfer"; Rec."Bank Transfer")
                {
                    Editable = false;
                }
                field("Transfer to Other Account"; Rec."Transfer to Other Account")
                {
                    Editable = false;
                }
                field("Agent Withdrawal"; Rec."Agent Withdrawal")
                {
                    Editable = false;
                }
                field("Type of Change"; Rec."Type of Change")
                {
                }
                field("Reason For Change"; Rec."Reason For Change")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Initiated By"; Rec."Initiated By")
                {
                }
                field("Date Initiated"; Rec."Date Initiated")
                {
                }
                field("Change ID"; Rec."Change ID")
                {
                }
                field("Approved By"; Rec."Approved By")
                {
                }
                field("Date Approved"; Rec."Date Approved")
                {
                }
                field("Rejected By"; Rec."Rejected By")
                {
                }
                field("Date Rejected"; Rec."Date Rejected")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Request Approval")
            {
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SkyPermissions.Reset;
                    SkyPermissions.SetRange("User ID", UserId);
                    SkyPermissions.SetRange("Initiate Service Change", true);
                    if not SkyPermissions.FindFirst then
                        Error('You do not have permission for this action');


                    if Rec."Type of Change" = Rec."Type of Change"::" " then
                        Error('Enter Type Of Change');


                    Rec.TestField("Reason For Change");
                    Rec.TestField(Status, Rec.Status::Open);

                    Rec.Status := Rec.Status::Pending;
                    Rec."Initiated By" := UserId;
                    Rec."Date Initiated" := Today;
                    Rec."Change ID" := CreateGuid;
                    Rec.Modify;

                    ChangeLogs.Init;
                    ChangeLogs.GUID := CreateGuid;
                    ChangeLogs."Type of Change" := Rec."Type of Change";
                    ChangeLogs."Reason For Change" := Rec."Reason For Change";
                    ChangeLogs."Initiated By" := Rec."Initiated By";
                    ChangeLogs."Date Initiated" := Rec."Date Initiated";
                    ChangeLogs."Change ID" := Rec."Change ID";
                    ChangeLogs.Insert;


                    Message('Sent For Approval');
                end;
            }
            action(Approve)
            {
                Image = Approve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SkyPermissions.Reset;
                    SkyPermissions.SetRange("User ID", UserId);
                    SkyPermissions.SetRange("Approve Service Change", true);
                    if not SkyPermissions.FindFirst then
                        Error('You do not have permission for this action');

                    if Confirm('Are you sure you want to Approve this request') then begin

                        if Rec."Type of Change" = Rec."Type of Change"::" " then
                            Error('Enter Type Of Change');

                        Rec.TestField("Reason For Change");
                        Rec.TestField(Status, Rec.Status::Pending);

                        Rec.Status := Rec.Status::Approved;
                        Rec."Approved By" := UserId;
                        Rec."Date Approved" := Today;
                        Rec."Change ID" := CreateGuid;


                        if Rec."Type of Change" = Rec."Type of Change"::"Bank Transfer" then begin
                            if Rec."Bank Transfer" then
                                Rec."Bank Transfer" := false
                            else
                                Rec."Bank Transfer" := true;
                        end;

                        if Rec."Type of Change" = Rec."Type of Change"::"Mpesa Withdrawal" then begin
                            if Rec."Mpesa Withdrawal" then
                                Rec."Mpesa Withdrawal" := false
                            else
                                Rec."Mpesa Withdrawal" := true;
                        end;

                        if Rec."Type of Change" = Rec."Type of Change"::"Utility Bill Payment" then begin
                            if Rec."Utility Bill Payment" then
                                Rec."Utility Bill Payment" := false
                            else
                                Rec."Utility Bill Payment" := true;
                        end;

                        if Rec."Type of Change" = Rec."Type of Change"::"Transfer to Other Account" then begin
                            if Rec."Transfer to Other Account" then
                                Rec."Transfer to Other Account" := false
                            else
                                Rec."Transfer to Other Account" := true;
                        end;


                        if Rec."Type of Change" = Rec."Type of Change"::"Agent Withdrawal" then begin
                            if Rec."Agent Withdrawal" then
                                Rec."Agent Withdrawal" := false
                            else
                                Rec."Agent Withdrawal" := true;
                        end;

                        Rec.Modify;

                        ChangeLogs.Init;
                        ChangeLogs.GUID := CreateGuid;
                        ChangeLogs."Type of Change" := Rec."Type of Change";
                        ChangeLogs."Reason For Change" := Rec."Reason For Change";
                        ChangeLogs."Approved By" := Rec."Approved By";
                        ChangeLogs."Date Approved" := Rec."Date Approved";
                        ChangeLogs."Change ID" := Rec."Change ID";
                        ChangeLogs.Insert;


                        Message('Aproved');
                    end;
                end;
            }
            action(Reject)
            {
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SkyPermissions.Reset;
                    SkyPermissions.SetRange("User ID", UserId);
                    SkyPermissions.SetRange("Approve Service Change", true);
                    if not SkyPermissions.FindFirst then
                        Error('You do not have permission for this action');

                    if Confirm('Are you sure you want to Reject this request') then begin
                        if Rec."Type of Change" = Rec."Type of Change"::" " then
                            Error('Enter Type Of Change');

                        Rec.TestField("Reason For Change");
                        Rec.TestField(Status, Rec.Status::Pending);

                        Rec.Status := Rec.Status::Open;
                        Rec."Rejected By" := UserId;
                        Rec."Date Rejected" := Today;
                        Rec.Modify;

                        ChangeLogs.Init;
                        ChangeLogs.GUID := CreateGuid;
                        ChangeLogs."Type of Change" := Rec."Type of Change";
                        ChangeLogs."Reason For Change" := Rec."Reason For Change";
                        ChangeLogs."Rejected By" := Rec."Rejected By";
                        ChangeLogs."Date Rejected" := Rec."Date Rejected";
                        ChangeLogs."Change ID" := Rec."Change ID";
                        ChangeLogs.Insert;


                        Message('Aproved');
                    end;
                end;
            }
            action("Re-Open")
            {
                Image = OpenWorksheet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SkyPermissions.Reset;
                    SkyPermissions.SetRange("User ID", UserId);
                    SkyPermissions.SetRange("Initiate Service Change", true);
                    if not SkyPermissions.FindFirst then
                        Error('You do not have permission for this action');

                    if Confirm('Are you sure you want to ReOpen this card') then begin

                        Rec."Type of Change" := Rec."Type of Change"::" ";

                        Rec."Reason For Change" := '';
                        Rec.Status := Rec.Status::Open;

                        Rec.Status := Rec.Status::Open;
                        Rec."Rejected By" := '';
                        Rec."Date Rejected" := 0D;
                        Rec."Approved By" := '';
                        Rec."Date Approved" := 0D;
                        Rec."Initiated By" := '';
                        Rec."Date Initiated" := 0D;
                        Rec.Modify;

                        ChangeLogs.Init;
                        ChangeLogs.GUID := CreateGuid;
                        ChangeLogs."Type of Change" := Rec."Type of Change";
                        ChangeLogs."Reason For Change" := Rec."Reason For Change";
                        ChangeLogs."Initiated By" := UserId;
                        ChangeLogs."Date Initiated" := Today;
                        ChangeLogs."Approved By" := '';
                        ChangeLogs."Date Approved" := 0D;
                        ChangeLogs."Rejected By" := '';
                        ChangeLogs."Date Rejected" := 0D;
                        ChangeLogs."Change ID" := Rec."Change ID";
                        ChangeLogs.Insert;


                        Message('Aproved');
                    end;
                end;
            }
        }
    }

    var
        SkyPermissions: Record "Sky Permissions";
        ChangeLogs: Record "Sky Services Change Logs";
}

